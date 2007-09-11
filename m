Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IV2rQ-0007Ut-FA
	for openembedded-devel@openembedded.org; Tue, 11 Sep 2007 12:20:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8BAHklC027051
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 11:17:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27006-01 for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 11:17:42 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8BAHfdu027044
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 11:17:41 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <74d0deb30709110033t3256fb15v76dc5b7cf51b46f6@mail.gmail.com>
References: <74d0deb30709110033t3256fb15v76dc5b7cf51b46f6@mail.gmail.com>
Date: Tue, 11 Sep 2007 11:17:41 +0100
Message-Id: <1189505861.6163.26.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [rfc] stamp removal
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
X-List-Received-Date: Tue, 11 Sep 2007 10:20:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 2007-09-11 at 09:33 +0200, pHilipp Zabel wrote:
> I was wondering whether it would be a nice touch to have tasks that
> remove other task's results remove the other tasks's stamps, too.
> Example: do_package removes the image dir, so it could remove the
> do_install stamp. do_rm_work removes the complete workdir, so it could
> remove the do_fetch ... do_package stamps, etc.

You could add the code but it won't do what you want. Bitbake checks the
timestamps of task dependencies before running a task. For example
"compile" checks the stamps of "patch", "configure", "unpack" etc. Its
also worth noting it checks the order of the timestamps and any
dependencies have to have earlier timestamps.

If you remove or touch a stamp, bitbake will want to run the subsequent
tasks again before accepting that tasks timestamp as valid.

Whilst this behaviour is currently limited to package boundaries, in
future its planned to (optionally) make it system wide so if you rebuild
gtk, anything depending on gtk will magically rebuild too.

We could try and change the behaviours but it needs more thought than
simply deleting stamps and the bitbake core will need changes.

> I'm often running into errors because bitbake makes certain
> assumptions about what is in the work dir just by looking at the
> stamps, and currently stamps and workdir state are not always in sync.
> Example actions are doing one of the configure/compile/package_write
> steps when I forgot that rm_work already had kicked in or doing
> package_write to repackage after code changes (currently I manually
> have to do_install, too).

Personally, I want to see tasks "just work". Ignoring rm_work for a
minute, I've recently committed fixes (making sure the image directory
was clean) so the install task could rerun with less problems. Next, I'd
like to see do_package stop moving files around and just copy them. If
it does that, each task should be rerunable without strange effects. You
can currently rerun package_write_ipk/deb and package_write, its just
do_package thats problematic due to the file moves as far as I know.

Coming back to rm_work, its a separate problem and I'm not sure how to
address it.

Cheers,

Richard



