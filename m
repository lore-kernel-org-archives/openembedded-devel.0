Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JTmkk-0007pF-9m
	for openembedded-devel@openembedded.org; Tue, 26 Feb 2008 00:29:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1PNSHU0022727;
	Mon, 25 Feb 2008 23:28:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22576-03; Mon, 25 Feb 2008 23:28:13 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1PNSCSq022721
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 25 Feb 2008 23:28:12 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 25 Feb 2008 23:28:14 +0000
Message-Id: <1203982094.16921.65.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: bitbake exec_task functionality changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2008 23:29:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

Executive Summary: We need to remove the remnants of "digraph" from
bitbake to fix various issues. This will break bb.build.exec_task() but
not much uses it in OE. I have a plan, trust me ;-).

Long version for those with insomnia:

There are various current use cases which are known to cause problems or
don't have a desired behaviour in certain circumstances:

1. "-c rebuild" doesn't build dependencies outside the specified package
2. rm_work doesn't re unpack sources when you "-c configure -f"
3. If A depends on B and B is rebuilt, A isn't
4. Packaged staging doesn't unpack sources when you "-c configure -f"
   a package
5. The currently executing task number jumps unpredictably since the 
   number tasks we don't need to rerun isn't known in advance.

(3. is something some might want, others might not so would be optional)

Behind the scenes we actually have quite a mess with two different "task
graph" structures both in use, there is the full blown taskdata/runqueue
implementation but the old digraph implementation still also exists and
handles some functionality in parallel.

Removal of digraph has been planned for a long time but it is still used
in some important areas of code, particularly the rebuild task, the -b
option to bitbake and all recursive stamp checking. All the items above
cannot be fixed or implemented as long as digraph exists. Given this I'm
proposing to do something about it (finally).

The big problematic change is that bb.build.exec_task will no longer be
able to resolve dependencies. Its dependency resolution is extremely
limited anyway (limited to inside the current .bb file only) so I think
this is a good move but it does break compatibility. From OE's
perspective its just the rebuild task thats affected. There are also
some references to exec_task(do_clean) in OE but these can be
s/exec_task/exec_func/ quite safely.

I think I can update OE so it will continue to work with the stable
bitbake release whilst we change the way things work in bitbake svn's
stable branch. Once this is shown to work, I'm proposing a short bitbake
release cycle and then updating OE's minimum version to 1.8.12. Worst
case if something does break, it should just be the rebuild task and all
the others will work as normal.

As a hint for how we can solve the rm_work problem and how rebuild will
become implemented, I plan to add a new StampUpdate event which runs
before bitbake looks at the stamp files and decides what to run. In this
event an array of filename to stampname mappings will be available along
with a list of the tasks we're about to execute. rm_work's event handler
would look something like:

addhandler rmwork_stampfixing_eventhandler
python rmwork_stampfixing_eventhandler() {
    from bb.event import getName
    import os

    if getName(e) == "StampUpdate":
        for (fn, task) in e.targets:
            if task == 'rm_work_all':
                continue
            stamp = "%s.do_rm_work" % e.stampPrefix[fn]
            if os.path.exists(stamp):
                dir = "%s.*" % e.stampPrefix[fn]
                bb.note("Removing stamps: " + dir)
                os.system('rm -f '+ dir)

    return NotHandled
}

and the rebuild event handler:

       #
       # Handle removing stamps for 'rebuild' task
       #
       if name.startswith("StampUpdate"):
               for (fn, task) in e.targets:
                       #print "%s %s" % (task, fn)         
                       if task == "do_rebuild":
                               dir = "%s.*" % e.stampPrefix[fn]
                               bb.note("Removing stamps: " + dir)
                               os.system('rm -f '+ dir)

As you might guess from this, I have things mostly working already. I'm
quite pleased to be able to remove digraph which reduces the cache size
by 10% and its unpickle time by 20%. It would also close bug #63 at long
last.

Nobody has stepped up to fix any of these issues in the past, I have
time to do it now and I don't think too much will break so I'm planning
to go ahead with this whilst I have the opportunity. I know people like
to know why things change which is why I've documented the above for the
record. If anyone has any questions by all means ask...

Cheers,

Richard




