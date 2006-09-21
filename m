Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GQXH9-00021V-67 for openembedded-devel@lists.openembedded.org;
	Fri, 22 Sep 2006 00:44:11 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 23275401B45; Thu, 21 Sep 2006 15:16:13 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060921221613.23275401B45@tinman.treke.net>
Date: Thu, 21 Sep 2006 15:16:13 -0700 (PDT)
Subject: [Bug 1430] New: bitbake glib-1.2 fails
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
X-List-Received-Date: Thu, 21 Sep 2006 22:44:11 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1430

           Summary: bitbake glib-1.2 fails
           Product: Openembedded
           Version: Familiar 0.8.2
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: mpanczyk@gmail.com
         QAContact: mpanczyk@gmail.com


Hi! 
As mentioned in the summary glib-1.2 fails. 
It wants some "so" files, starting with libgmodule-1.2.so.0.0.10. 
The files are not in the right directory .
Coping the "so" files from
./tmp/work/i686-linux/glib-1.2-native-1.2.10-r0/glib-1.2.10/gmodule/.libs/ to 
./tmp/work/i686-linux/glib-1.2-native-1.2.10-r0/glib-1.2.10/gmodule/
helps for a while but then the gthread "so" files are missing. 
Simillar operation to the one above helps.
coping  "so" files from
./tmp/work/i686-linux/glib-1.2-native-1.2.10-r0/glib-1.2.10/gthread/.libs/ to 
./tmp/work/i686-linux/glib-1.2-native-1.2.10-r0/glib-1.2.10/gthread/

I attach a sample output .

OE Build Configuration:
BB_VERSION     = "1.4.2"
OE_REVISION    = "fed91ab30fdf8725a0d21cabb9e0058bd7bdec28"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "h2200"
DISTRO         = "familiar"
DISTRO_VERSION = "unstable-20060921"
TARGET_FPU     = ""

NOTE: multiple providers are available (glibc, glibc-intermediate);
NOTE: consider defining PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc
NOTE: multiple providers are available (qemu-qop-nogfx-native, qemu-native);
NOTE: consider defining PREFERRED_PROVIDER_qemu-native
NOTE: package glib-1.2-native-1.2.10: started
NOTE: package glib-1.2-native-1.2.10-r0: task do_populate_staging: started
ERROR: function do_stage failed
ERROR: log data follows
(/home/cross/stuff/tmp/work/i686-linux/glib-1.2-native-1.2.10-r0/temp/log.do_stage.27317)
| oe_libinstall: cd
/home/cross/stuff/tmp/work/i686-linux/glib-1.2-native-1.2.10-r0/glib-1.2.10/.libs
| oe_libinstall: install -d /home/cross/stuff/tmp/staging/i686-linux/lib/
| oe_libinstall: install -m 0644 libglib.a
/home/cross/stuff/tmp/staging/i686-linux/lib/
| oe_libinstall: rm -f /home/cross/stuff/tmp/staging/i686-linux/lib/libglib.la
| oe_libinstall: sed -e s/^installed=yes$/installed=no/ -e
/^dependency_libs=/s,/home/cross/stuff/tmp/work/i686-linux/glib-1.2-native-1.2.10-r0[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),/home/cross/stuff/tmp/staging/i686-linux/lib/\1,g
libglib.lai
| oe_libinstall: install -m 0755 libglib-1.2.so.0.0.10
/home/cross/stuff/tmp/staging/i686-linux/lib/
| oe_libinstall: cp -P libglib-1.2.so.0
/home/cross/stuff/tmp/staging/i686-linux/lib/
| oe_libinstall: cp -P libglib.so /home/cross/stuff/tmp/staging/i686-linux/lib/
| oe_libinstall: cd
/home/cross/stuff/tmp/work/i686-linux/glib-1.2-native-1.2.10-r0/glib-1.2.10
| oe_libinstall: cd gmodule
| oe_libinstall: install -d /home/cross/stuff/tmp/staging/i686-linux/lib/
| FATAL: oe_libinstall: gmodule/libgmodule-1.2.so.0.0.10 not found.
NOTE: Task failed:
/home/cross/stuff/tmp/work/i686-linux/glib-1.2-native-1.2.10-r0/temp/log.do_stage.27317
NOTE: package glib-1.2-native-1.2.10-r0: task do_populate_staging: failed
ERROR: TaskFailed event exception, aborting
NOTE: package glib-1.2-native-1.2.10: failed
ERROR: Build of glib-1.2 failed


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


