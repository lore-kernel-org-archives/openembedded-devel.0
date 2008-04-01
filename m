Received: from [64.233.184.226] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <will.newton@gmail.com>) id 1Jge2a-0004HR-JK
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 12:48:32 +0200
Received: by wr-out-0506.google.com with SMTP id 36so1215136wra.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2008 03:48:31 -0700 (PDT)
Received: by 10.142.240.9 with SMTP id n9mr4524080wfh.214.1207046910573;
	Tue, 01 Apr 2008 03:48:30 -0700 (PDT)
Received: by 10.142.163.5 with HTTP; Tue, 1 Apr 2008 03:48:30 -0700 (PDT)
Message-ID: <87a5b0800804010348g778bb897g73841e870da58d00@mail.gmail.com>
Date: Tue, 1 Apr 2008 11:48:30 +0100
From: "Will Newton" <will.newton@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Getting started with OE
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
X-List-Received-Date: Tue, 01 Apr 2008 10:48:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I'm trying to follow the getting started guide on the OE wiki, and
I've run into a few problems.

I'm using the OE tree from Holger's git mirror because monotone is
having problems updating the tree for me (slow speed and eventual
connection drop).

I can get as far as the "bitbake nano" step. First I get this error:

ERROR: 'module' object has no attribute 'get_srcrev' while parsing
/home/wnewton/src/oe/org.openembedded.dev/packages/packagekit/packagekit_git.bb

It doesn't seem to be fatal though as the build continues.

Then I get this:

NOTE: Preparing Runqueue
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 117, in <module>
    main()
  File "/usr/bin/bitbake", line 113, in main
    cooker.cook()
  File "/var/lib/python-support/python2.5/bb/cooker.py", line 525, in cook
    return self.buildTargets(pkgs_to_build)
  File "/var/lib/python-support/python2.5/bb/cooker.py", line 437, in
buildTargets
    rq.prepare_runqueue()
  File "/var/lib/python-support/python2.5/bb/runqueue.py", line 258,
in prepare_runqueue
    mark_active(listid, 1)
  File "/var/lib/python-support/python2.5/bb/runqueue.py", line 234,
in mark_active
    mark_active(depend, depth+1)
  File "/var/lib/python-support/python2.5/bb/runqueue.py", line 234,
in mark_active
    mark_active(depend, depth+1)
  File "/var/lib/python-support/python2.5/bb/runqueue.py", line 234,
in mark_active
    mark_active(depend, depth+1)
  File "/var/lib/python-support/python2.5/bb/runqueue.py", line 227,
in mark_active
    if runq_build[listid] == 1:
IndexError: list index out of range

I suspect using the git mirror is probably not supported, but I was
wondering if anyone could help me debug this?

Thanks,


