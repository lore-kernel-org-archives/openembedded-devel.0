Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GGzzi-0002Nl-OD for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 17:22:46 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id F05BC4014D2; Sat, 26 Aug 2006 08:01:40 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826150140.F05BC4014D2@tinman.treke.net>
Date: Sat, 26 Aug 2006 08:01:40 -0700 (PDT)
Subject: [Bug 1361] New: Compile error while building cyrus-imapd-2.2.12 with gcc4
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
X-List-Received-Date: Sat, 26 Aug 2006 15:22:47 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1361

           Summary: Compile error while building cyrus-imapd-2.2.12 with
                    gcc4
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: yuecelm@ee.ethz.ch
         QAContact: tinderbox-oe@gmx.net


I get a compile error. An error dump is included in the attachment section.

OE Build Configuration:
BB_VERSION     = "1.6.0"
OE_REVISION    = "10926eec6b5cb3adcd7df2208e2378bd1fc98cbd"
TARGET_ARCH    = "armeb"
TARGET_OS      = "linux"
MACHINE        = "nslu2"
DISTRO         = "openslug"
DISTRO_VERSION = "4.0-beta"
TARGET_FPU     = "soft"

gcc4 is rejecting decorations like the following:

struct imapopt_s imapopts[]

To fix this gcc4 warning, I also attach a patch to change it to:

struct imapopt_s * imapopts

The package will be builded without problems. But as long its not tested or
someone approves the changes, I will not commit it to OE.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


