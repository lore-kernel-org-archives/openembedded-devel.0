Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NTlXW-0006Xd-7Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 01:20:21 +0100
Received: from bas4-kitchener06-1128672736.dsl.bell.ca ([67.70.45.224]
	helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NTlVT-00045B-1Z for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 19:18:11 -0500
Date: Sat, 9 Jan 2010 19:17:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.1001091915010.6810@localhost>
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
Subject: still unable to "bitbake e2fsprogs"
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
X-List-Received-Date: Sun, 10 Jan 2010 00:20:22 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  to this day, i still can't build e2fsprogs from the dev branch, and
i'm absolutely baffled.  this is on a fully-updated fedora 12 system,
and i'm sure philip balister can do this on his f12 system, so i'm at
a loss.  any advice would be appreciated.

  just as a refresher, the salient excerpt from the log file is:

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

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


