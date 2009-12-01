Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NFb0P-00081D-MN
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 23:15:36 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NFays-0001do-DJ for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 17:13:58 -0500
Date: Tue, 1 Dec 2009 17:13:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0912011711380.20250@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: build failure, dev branch, e2fsprogs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Dec 2009 22:15:37 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


NOTE: Running task 9139 of 10168 (ID: 6935,
/home/rpjday/oe/openembedded/recipes/e2fsprogs/e2fsprogs_1.41.5.bb,
do_compile)
ERROR: function do_compile failed
ERROR: see log in
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/e2fsprogs-1.41.5-r1/temp/log.do_compile.18972
NOTE: Task failed:
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/e2fsprogs-1.41.5-r1/temp/log.do_compile.18972
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/rpjday/oe/openembedded/recipes/e2fsprogs/e2fsprogs_1.41.5.bb
do_compile failed
ERROR: Task 6935
(/home/rpjday/oe/openembedded/recipes/e2fsprogs/e2fsprogs_1.41.5.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 10142 tasks of which 10142 didn't need
to be rerun and 1 failed.
ERROR:
'/home/rpjday/oe/openembedded/recipes/e2fsprogs/e2fsprogs_1.41.5.bb'
failed

log:

... snip ...
making all in e2fsck
make[2]: Entering directory
`/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/e2fsprogs-1.41.5-r1/e2fsprogs-1.41.5/e2fsck'
        CC crc32.c
        CC unix.c
        CC e2fsck.c
        CC super.c
        CC pass1.c
        CC pass1b.c
        CC pass2.c
        CC pass3.c
        CC pass4.c
        CC pass5.c
        CC journal.c
        CC badblocks.c
        CC util.c
        CC dirinfo.c
        CC dx_dirinfo.c
        CC ehandler.c
        CC problem.c
        CC message.c
        CC recovery.c
        CC region.c
        CC revoke.c
        CC ea_refcount.c
        CC rehash.c
make[2]: *** No rule to make target `-lpthread', needed by `e2fsck'.
Stop.
make[2]: Leaving directory
`/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/e2fsprogs-1.41.5-r1/e2fsprogs-1.41.5/e2fsck'
make[1]: *** [all-progs-recursive] Error 1
make[1]: Leaving directory
`/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/e2fsprogs-1.41.5-r1/e2fsprogs-1.41.5'
make: *** [all] Error 2
FATAL: oe_runmake failed


rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


