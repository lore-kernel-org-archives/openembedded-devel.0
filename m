Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLk3A-0000e1-9C for openembedded-devel@lists.openembedded.org;
	Fri, 08 Sep 2006 19:21:56 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 9C73E401B46; Fri,  8 Sep 2006 09:57:30 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060908165730.9C73E401B46@tinman.treke.net>
Date: Fri,  8 Sep 2006 09:57:30 -0700 (PDT)
Subject: [Bug 1403] New: ts.conf wrong for 2.6 collie (at least in gpe image)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Sep 2006 17:21:56 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1403

           Summary: ts.conf wrong for 2.6 collie (at least in gpe image)
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: pavel@ucw.cz
         QAContact: tinderbox-oe@gmx.net


ts.conf specifies "module collie", while 2.6.X kernel on collie uses "normal"
input method, so ts.conf should say "module input". IIRC extra filtering is not
neccessary, only "module linear" for calibration is.

(Sorry for not testing the fix; I tried mounting initrd.bin with

losetup /dev/loop0 3542rc1/initrd.bin
modprobe block2mtd block2mtd=/dev/loop0
mount -tjffs2 /dev/mtdblock0 /mnt

...but that actually corrupts the initrd, so it becomes unusable).


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


