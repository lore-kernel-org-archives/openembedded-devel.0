Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GQ5u4-0001j0-D1 for openembedded-devel@lists.openembedded.org;
	Wed, 20 Sep 2006 19:30:32 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 91E2E401B45; Wed, 20 Sep 2006 10:02:58 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060920170258.91E2E401B45@tinman.treke.net>
Date: Wed, 20 Sep 2006 10:02:58 -0700 (PDT)
Subject: [Bug 1428] New: gpe-plucker 0.2 forces gcc-3.4.4 cc1 fatal error
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
X-List-Received-Date: Wed, 20 Sep 2006 17:30:32 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1428

           Summary: gpe-plucker 0.2 forces gcc-3.4.4 cc1 fatal error
           Product: Openembedded
           Version: unspecified
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: tom@openhardware.net
         QAContact: tinderbox-oe@gmx.net


Compile of gpe-plucker v0.2 crashes gcc-3.4.4 with "cc1: internal compiler
error: Aborted"

gpe-plucker 0.4 builds with no problems.

=================== begin ======================
arm-linux-gcc -march=armv4t -mtune=arm920t -mcpu=arm920t
-isystem/home/tom/OpenEmbedded/tmp/staging/arm-linux/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
-isystem/home/tom/OpenEmbedded/tmp/staging/arm-linux/include
-D_XOPEN_SOURCE=500
-I/home/tom/OpenEmbedded/tmp/staging/arm-linux/include/gtk-2.0
-I/home/tom/OpenEmbedded/tmp/staging/arm-linux/lib/gtk-2.0/include
-I/home/tom/OpenEmbedded/tmp/staging/arm-linux/include
-I/home/tom/OpenEmbedded/tmp/staging/arm-linux/include/atk-1.0
-I/home/tom/OpenEmbedded/tmp/staging/arm-linux/include/pango-1.0
-I/home/tom/OpenEmbedded/tmp/staging/arm-linux/include/freetype2
-I/home/tom/OpenEmbedded/tmp/staging/arm-linux/include/glib-2.0
-I/home/tom/OpenEmbedded/tmp/staging/arm-linux/lib/glib-2.0/include  
-Iunpluck/ -DUSE_GPE -D_GNU_SOURCE -Wall -Os -fomit-frame-pointer
-I/usr/include/gpe -DPACKAGE=\"gpe-plucker\" -DPREFIX=\"/usr\"
-DPACKAGE_LOCALE_DIR=\"/usr/share/locale\" -c image.c -o image.o
CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/gpe
cc1: internal compiler error: Aborted
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
make: *** [image.o] Error 1
FATAL: oe_runmake failed
====================== snip ======================


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


