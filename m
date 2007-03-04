Received: from [204.127.200.85] (helo=sccrmhc15.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HNgyC-0003An-5U
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 04:01:11 +0100
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (sccrmhc15) with ESMTP
	id <20070304030107015007tdvce>; Sun, 4 Mar 2007 03:01:07 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id ED0089B74; Sat,  3 Mar 2007 22:07:18 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 192.168.253.158
X-Mailer: Usermin 1.230
Message-Id: <1172977637.29516@gatekeeper.stellarwerx.com>
Date: Sat, 03 Mar 2007 22:07:17 -0500 (EST)
MIME-Version: 1.0
Subject: Fixing QA Errors?
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
X-List-Received-Date: Sun, 04 Mar 2007 03:01:24 -0000
Content-Type: multipart/mixed; boundary="bound1172977637"

--bound1172977637
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

A question for the insane.bbclass developers - how do I go about fixing these errors?  Do we have any generalized information about what they mean (I can't find any on the wiki or via google...)?

ERROR: QA Issue: non -dev package contains symlink .so: libqtaux2 path '/work/armv5te-angstrom-linux-gnueabi/libqtaux2-1.2.2-r0/install/libqtaux2/opt/QtPalmtop/lib/libqtaux2.so'
ERROR: QA Issue: non debug package contains .debug directory: libqtaux2 path /work/armv5te-angstrom-linux-gnueabi/libqtaux2-1.2.2-r0/install/libqtaux2/opt/QtPalmtop/lib/.debug/libqtaux2.so.1.0.0

Regards,
-Mark Gollahon

===========================================================

OE Build Configuration:
BB_VERSION     = "1.6.6"
OE_REVISION    = "712cbf18ae0aff9705da999fd722fcd489e821dd"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "spitz"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20070304"
TARGET_FPU     = "soft"

NOTE: preferred version 2.5 of glibc not available
NOTE: package libqtaux2-1.2.2: started
NOTE: package libqtaux2-1.2.2-r0: task do_fetch: started
NOTE: package libqtaux2-1.2.2-r0: task do_fetch: completed
NOTE: package libqtaux2-1.2.2-r0: task do_unpack: started
NOTE: Unpacking /var/tmp/OpenEmbedded/sources/opie.libqtaux_anoncvs.handhelds.org_v1_2_2_.tar.gz to /var/tmp/OpenEmbedded/Spitz/tmp/work/armv5te-angstrom-linux-gnueabi/libqtaux2-1.2.2-r0/
NOTE: package libqtaux2-1.2.2-r0: task do_unpack: completed
NOTE: package libqtaux2-1.2.2-r0: task do_patch: started
NOTE: package libqtaux2-1.2.2-r0: task do_patch: completed
NOTE: package libqtaux2-1.2.2-r0: task do_configure: started
NOTE: package libqtaux2-1.2.2-r0: task do_configure: completed
NOTE: package libqtaux2-1.2.2-r0: task do_qa_configure: started
NOTE: Checking sanity of the config.log file
NOTE: package libqtaux2-1.2.2-r0: task do_qa_configure: completed
NOTE: package libqtaux2-1.2.2-r0: task do_compile: started
NOTE: package libqtaux2-1.2.2-r0: task do_compile: completed
NOTE: package libqtaux2-1.2.2-r0: task do_install: started
NOTE: package libqtaux2-1.2.2-r0: task do_install: completed
NOTE: package libqtaux2-1.2.2-r0: task do_opie_install: started
NOTE: Section = Base or Libs. Target won't be installed automatically.
NOTE: package libqtaux2-1.2.2-r0: task do_opie_install: completed
NOTE: package libqtaux2-1.2.2-r0: task do_package: started
NOTE: DO PACKAGE QA
NOTE: Checking Package: libqtaux2-dbg
NOTE: Checking Package: libqtaux2
ERROR: QA Issue: non -dev package contains symlink .so: libqtaux2 path '/work/armv5te-angstrom-linux-gnueabi/libqtaux2-1.2.2-r0/install/libqtaux2/opt/QtPalmtop/lib/libqtaux2.so'
ERROR: QA Issue: non debug package contains .debug directory: libqtaux2 path /work/armv5te-angstrom-linux-gnueabi/libqtaux2-1.2.2-r0/install/libqtaux2/opt/QtPalmtop/lib/.debug/libqtaux2.so.1.0.0
NOTE: Checking Package: libqtaux2-doc
NOTE: Checking Package: libqtaux2-dev
NOTE: Checking Package: libqtaux2-locale
ERROR: QA ran found fatal errors. Please consider fixing them
ERROR: Error in executing: /var/tmp/OpenEmbedded/org.openembedded.dev/packages/libqtaux/libqtaux2_1.2.2.bb
ERROR: Exception:exceptions.SystemExit Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing: /var/tmp/OpenEmbedded/org.openembedded.dev/packages/libqtaux/libqtaux2_1.2.2.bb
ERROR: Exception:exceptions.SystemExit Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing: /var/tmp/OpenEmbedded/org.openembedded.dev/packages/libqtaux/libqtaux2_1.2.2.bb
ERROR: Exception:exceptions.SystemExit Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing: /var/tmp/OpenEmbedded/org.openembedded.dev/packages/libqtaux/libqtaux2_1.2.2.bb
ERROR: Exception:exceptions.SystemExit Message:1
ERROR: Printing the environment of the function

--bound1172977637--
