Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 80ADB6C1F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 16:17:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45smw63NzLz4t
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 18:17:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563812230;
	bh=eaUrkjcQo3qWvLMmofVdLJUf6Q5hfn6KOvHPspAXVYw=;
	h=From:To:Subject:Date:From;
	b=iDyBZyn3zkz+jGUl9d8UYjNtzrCMH7G5wmwzHU9RG2kduUa614gcqQMEi8yhOZ9cz
	mPWtoakLETT3kksa7RuRMqtHpVE+Xzo+uibimArUoAK3NOXoCmxH/rwMcTCRKSc9qH
	SlbTymwlokhcb+XKvKV35PUe5GpQUnr8/qBinm6TGzRFSwY54UF/0fp0mhmLP+zuGz
	5+6c1uvLdgiafoD1jjhe0+L2U/74uEM0tgfgdW9L26y1G5aBIWfdthdsZEXHi2GXZ+
	jQIubL+d0e7p5d/lK8aUeOXMC/YHKPOr1LeRb26o8oi/9buckiSkebvtiflWHjRymB
	OhoItRd9WT1qheI/smm3EvhtPcJhg7da/IrWM68DwdoPMyHAiXnDbUjUVrqf6Fs7Tb
	FRdhqCv+wtlHs9M3SsusgfEkg6l6fqtglS4Tv99fx07bGtnWsW45w0uppxhH90vkRr
	ooFm4pAoQ5vQznBg8OBFL6G4QPVociSB1D0PjVuwXW1fFYNxmVWm5Kx1RAira3gGy6
	kiP+I4Z7f2+NObGoRlSSgF+pt1smucKe/zaLvWprGnusE6MCWnpzzWr/z+QbMBoH7w
	maYjOYR2o+OyVAdMu4lPqvI/Dw8maQasjuBucnKN9QBoO212qS1NXelOhA/02Xin5Z
	Xk0OwooWV13TiYOEGt34VpYY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 19:17:07 +0300
Message-Id: <20190722161707.6478-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] udisks: Remove this obsolete version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jul 2019 16:17:10 -0000

All users already switced to udisks2.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../packagegroups/packagegroup-meta-oe.bb     |   2 +-
 ...ke-udev-rules-directory-configurable.patch |  89 ----
 ...-fix-build-with-newer-glibc-versions.patch |  27 -
 .../udisks/0001-include-sys-sysmacros.h.patch |  77 ---
 ...sh_completion-script-in-etc-bash_com.patch |  33 --
 ...r-Use-sh-interpreter-instead-of-bash.patch |  38 --
 .../udisks/udisks/optional-depends.patch      | 498 ------------------
 .../udisks-1.0.5-fix-service-file.patch       |  32 --
 .../recipes-support/udisks/udisks_1.0.5.bb    |  51 --
 9 files changed, 1 insertion(+), 846 deletions(-)
 delete mode 100644 meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks/0001-include-sys-sysmacros.h.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks/0001-tools-Install-bash_completion-script-in-etc-bash_com.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks/0001-udisks-helper-Use-sh-interpreter-instead-of-bash.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks/optional-depends.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks_1.0.5.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 7bc0f1943..f7eafe2e3 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -251,7 +251,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     libcanberra \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp xrdp", "", d)} \
     procmail \
-    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "udisks udisks2 upower", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "udisks2 upower", "", d)} \
     ${NE10} \
     "
 
diff --git a/meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch b/meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch
deleted file mode 100644
index 2823c54f1..000000000
--- a/meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From a6eab413f274376cf703a608e2866118291a6185 Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Thu, 9 Feb 2017 11:02:53 +0200
-Subject: [PATCH] Make udev rules directory configurable.
-
-udev rules directory can be configurable via undevrulesdir variable. And use
-libdir, sbindir for installing librares and binaries.
-
-Upstream-Status: Inappropriate[Embedded specific]
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
-
----
- configure.ac            | 14 +++-----------
- data/Makefile.am        |  1 -
- src/probers/Makefile.am |  2 +-
- tools/Makefile.am       |  2 +-
- 4 files changed, 5 insertions(+), 14 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8c4e4c2..a143397 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -227,15 +227,8 @@ if test "x$GCC" = "xyes"; then
-   LDFLAGS="-Wl,--as-needed $LDFLAGS"
- fi
- 
--if test "$prefix" = "/usr" -o "$prefix" = "/usr/local" ; then
--  slashlibdir=/lib
--  slashsbindir=/sbin
--else
--  slashlibdir=$prefix/lib
--  slashsbindir=$prefix/sbin
--fi
--AC_SUBST(slashlibdir)
--AC_SUBST(slashsbindir)
-+udevrulesdir=/lib/udev/udev.d
-+AC_SUBST(udevrulesdir)
- 
- # *************
- # Remote Access
-@@ -299,8 +292,7 @@ echo "
-         sysconfdir:                 ${sysconfdir}
-         localstatedir:              ${localstatedir}
-         docdir:                     ${docdir}
--        slashlibdir:                ${slashlibdir}
--        slashsbindir:               ${slashsbindir}
-+        udevrulesdir:               ${udevrulesdir}
-         systemdsystemunitdir:       ${systemdsystemunitdir}
- 
-         compiler:                   ${CC}
-diff --git a/data/Makefile.am b/data/Makefile.am
-index 08af5f4..9329186 100644
---- a/data/Makefile.am
-+++ b/data/Makefile.am
-@@ -34,7 +34,6 @@ $(systemdservice_DATA): $(systemdservice_in_files) Makefile
- 	@sed -e "s|\@libexecdir\@|$(libexecdir)|" $< > $@
- endif
- 
--udevrulesdir = $(slashlibdir)/udev/rules.d
- udevrules_DATA = 80-udisks.rules
- 
- pkgconfigdir = $(datadir)/pkgconfig
-diff --git a/src/probers/Makefile.am b/src/probers/Makefile.am
-index 01c693b..6a0361a 100644
---- a/src/probers/Makefile.am
-+++ b/src/probers/Makefile.am
-@@ -20,7 +20,7 @@ INCLUDES = \
- # TODO: ideally move most of this to udev and/or util-linux
- #
- 
--udevhelperdir = $(slashlibdir)/udev
-+udevhelperdir = $(libdir)/udev
- udevhelper_PROGRAMS =	udisks-part-id 			\
- 			udisks-probe-sas-expander 	\
- 			$(NULL)
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 18325f7..0aaec11 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -54,7 +54,7 @@ udisks_LDADD = 						\
- 	$(DBUS_GLIB_LIBS)				\
- 	$(POLKIT_DBUS_LIBS)
- 
--slashsbin_PROGRAMS = umount.udisks
-+sbin_PROGRAMS = umount.udisks
- 
- umount_udisks_SOURCES = umount-udisks.c
- umount_udisks_LDADD = $(DBUS_GLIB_LIBS) $(POLKIT_DBUS_LIBS)
diff --git a/meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch b/meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch
deleted file mode 100644
index 8b4f44124..000000000
--- a/meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 054ad6a06cfac7c3d172d53cd901204079a53ec3 Mon Sep 17 00:00:00 2001
-From: Alexandre Rostovtsev <tetromino@gentoo.org>
-Date: Fri, 29 May 2015 21:09:39 -0400
-Subject: [PATCH] fix build with newer glibc versions
-
-https://bugs.freedesktop.org/show_bug.cgi?id=90778
-
-Upstream-Status: Applied [1]
-
-[1] http://cgit.freedesktop.org/udisks/commit/?h=udisks1&id=9829152b12a8924d2e091a00133ed1a3a7ba75c0
-
----
- src/helpers/job-drive-detach.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/helpers/job-drive-detach.c b/src/helpers/job-drive-detach.c
-index eeafcab..d122a1f 100644
---- a/src/helpers/job-drive-detach.c
-+++ b/src/helpers/job-drive-detach.c
-@@ -18,6 +18,7 @@
-  *
-  */
- 
-+#include <sys/stat.h>
- #include <stdio.h>
- #include <string.h>
- #include <errno.h>
diff --git a/meta-oe/recipes-support/udisks/udisks/0001-include-sys-sysmacros.h.patch b/meta-oe/recipes-support/udisks/udisks/0001-include-sys-sysmacros.h.patch
deleted file mode 100644
index f140793c5..000000000
--- a/meta-oe/recipes-support/udisks/udisks/0001-include-sys-sysmacros.h.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 64f051963d6cdeebd19f9e7f0a7e584a1f7acc60 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Aug 2018 19:12:57 -0700
-Subject: [PATCH] include sys/sysmacros.h
-
-fixes build with glibc 2.28+
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/daemon.c          | 1 +
- src/device.c          | 1 +
- src/mount-monitor.c   | 1 +
- tools/udisks.c        | 1 +
- tools/umount-udisks.c | 1 +
- 5 files changed, 5 insertions(+)
-
-diff --git a/src/daemon.c b/src/daemon.c
-index 14e952f..2c61cfb 100644
---- a/src/daemon.c
-+++ b/src/daemon.c
-@@ -39,6 +39,7 @@
- #include <errno.h>
- #include <string.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <sys/stat.h>
- #include <sys/time.h>
- #include <sys/resource.h>
-diff --git a/src/device.c b/src/device.c
-index d73f9d6..5911d78 100644
---- a/src/device.c
-+++ b/src/device.c
-@@ -29,6 +29,7 @@
- #include <errno.h>
- #include <string.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <sys/wait.h>
- #include <sys/stat.h>
- #include <sys/time.h>
-diff --git a/src/mount-monitor.c b/src/mount-monitor.c
-index 573a69c..ccf3365 100644
---- a/src/mount-monitor.c
-+++ b/src/mount-monitor.c
-@@ -28,6 +28,7 @@
- #include <errno.h>
- #include <string.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <sys/stat.h>
- #include <mntent.h>
- 
-diff --git a/tools/udisks.c b/tools/udisks.c
-index d30159b..f24a30a 100644
---- a/tools/udisks.c
-+++ b/tools/udisks.c
-@@ -29,6 +29,7 @@
- #include <errno.h>
- #include <string.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <sys/stat.h>
- #include <sys/wait.h>
- #include <fcntl.h>
-diff --git a/tools/umount-udisks.c b/tools/umount-udisks.c
-index 2813fe0..5cf6b4d 100644
---- a/tools/umount-udisks.c
-+++ b/tools/umount-udisks.c
-@@ -29,6 +29,7 @@
- #include <errno.h>
- #include <string.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <pwd.h>
diff --git a/meta-oe/recipes-support/udisks/udisks/0001-tools-Install-bash_completion-script-in-etc-bash_com.patch b/meta-oe/recipes-support/udisks/udisks/0001-tools-Install-bash_completion-script-in-etc-bash_com.patch
deleted file mode 100644
index 16dc44067..000000000
--- a/meta-oe/recipes-support/udisks/udisks/0001-tools-Install-bash_completion-script-in-etc-bash_com.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7863a72c723035529d6fd8d626d7fbf9a765f162 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 23 May 2019 21:49:57 -0700
-Subject: [PATCH] tools: Install bash_completion script in
- /etc/bash_completion.d
-
-In OE this is one of common locations to install bash_completion files
-and its covered for packaging automatically when bash_completion class
-is inherited
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 0aaec11..839c961 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -72,7 +72,7 @@ udisks_tcp_bridge_LDADD = $(DBUS_GLIB_LIBS)
- 
- CLEANFILES = $(BUILT_SOURCES)
- 
--profiledir = $(sysconfdir)/profile.d
-+profiledir = $(sysconfdir)/bash_completion.d
- profile_SCRIPTS = udisks-bash-completion.sh
- 
- EXTRA_DIST = $(profile_SCRIPTS)
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-support/udisks/udisks/0001-udisks-helper-Use-sh-interpreter-instead-of-bash.patch b/meta-oe/recipes-support/udisks/udisks/0001-udisks-helper-Use-sh-interpreter-instead-of-bash.patch
deleted file mode 100644
index ef7f6f9c3..000000000
--- a/meta-oe/recipes-support/udisks/udisks/0001-udisks-helper-Use-sh-interpreter-instead-of-bash.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 44953e5501e92c87611be45221338004e8032a74 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 23 May 2019 22:00:14 -0700
-Subject: [PATCH] udisks-helper: Use sh interpreter instead of bash
-
-These scripts do not require bash, since they do not use any bash
-specific extentions
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/helpers/udisks-helper-change-luks-password | 2 +-
- src/helpers/udisks-helper-mdadm-expand         | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/helpers/udisks-helper-change-luks-password b/src/helpers/udisks-helper-change-luks-password
-index edcf6c9..c71fc72 100755
---- a/src/helpers/udisks-helper-change-luks-password
-+++ b/src/helpers/udisks-helper-change-luks-password
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/usr/bin/env sh
- set -e
- 
- DEVICE=$1
-diff --git a/src/helpers/udisks-helper-mdadm-expand b/src/helpers/udisks-helper-mdadm-expand
-index 8b4e23d..921f96a 100755
---- a/src/helpers/udisks-helper-mdadm-expand
-+++ b/src/helpers/udisks-helper-mdadm-expand
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/usr/bin/env sh
- 
- set -e
- 
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-support/udisks/udisks/optional-depends.patch b/meta-oe/recipes-support/udisks/udisks/optional-depends.patch
deleted file mode 100644
index a890954fc..000000000
--- a/meta-oe/recipes-support/udisks/udisks/optional-depends.patch
+++ /dev/null
@@ -1,498 +0,0 @@
-From e8b3fbfa3d6a11eee25db2dc0f31f439aaf0b65a Mon Sep 17 00:00:00 2001
-From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
-Date: Thu, 26 May 2011 17:30:04 -0300
-Subject: [PATCH] Allow disabling atasmart, lvm2 and devicemapper support.
-
-https://bugs.freedesktop.org/show_bug.cgi?id=37647
-
----
- configure.ac            | 53 +++++++++++++++++++++++++++++++++++++++----------
- src/adapter-private.h   |  1 -
- src/adapter.c           |  1 -
- src/daemon.c            |  4 ++++
- src/device-private.c    |  2 +-
- src/device-private.h    |  5 ++---
- src/device.c            | 23 +++++++++++++++++----
- src/expander-private.h  |  1 -
- src/expander.c          |  1 -
- src/helpers/Makefile.am | 20 +++++++++++++------
- src/helpers/partutil.c  |  3 ++-
- src/port-private.h      |  1 -
- src/probers/Makefile.am |  8 ++++++--
- tools/udisks.c          | 10 ++++++++--
- 14 files changed, 99 insertions(+), 34 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9454423..8c4e4c2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -155,13 +155,33 @@ PKG_CHECK_MODULES(POLKIT_GOBJECT_1, [polkit-gobject-1 >= 0.97])
- AC_SUBST(POLKIT_GOBJECT_1_CFLAGS)
- AC_SUBST(POLKIT_GOBJECT_1_LIBS)
- 
--PKG_CHECK_MODULES(LIBPARTED, [libparted >= 1.8.8])
--AC_SUBST(LIBPARTED_CFLAGS)
--AC_SUBST(LIBPARTED_LIBS)
--
--PKG_CHECK_MODULES(DEVMAPPER, [devmapper >= 1.02])
--AC_SUBST(DEVMAPPER_CFLAGS)
--AC_SUBST(DEVMAPPER_LIBS)
-+have_parted=no
-+AC_ARG_ENABLE(parted, AS_HELP_STRING([--disable-parted], [disable disk partitioning]))
-+if test "x$enable_parted" != "xno"; then
-+  PKG_CHECK_MODULES(LIBPARTED, [libparted >= 1.8.8],
-+                    [AC_DEFINE(USE_PARTED, 1, [Define if parted should be used]) have_parted=yes],
-+                    have_parted=no)
-+  AC_SUBST(LIBPARTED_CFLAGS)
-+  AC_SUBST(LIBPARTED_LIBS)
-+  if test "x$have_parted" = xno -a "x$enable_parted" = xyes; then
-+    AC_MSG_ERROR([parted support requested but libraries not found])
-+  fi
-+fi
-+AM_CONDITIONAL(HAVE_PARTED, [test "$have_parted" = "yes"])
-+
-+have_devmapper=no
-+AC_ARG_ENABLE(devmapper, AS_HELP_STRING([--disable-devmapper], [disable device mapper support]))
-+if test "x$enable_devmapper" != "xno"; then
-+  PKG_CHECK_MODULES(DEVMAPPER, [devmapper >= 1.02],
-+                    [AC_DEFINE(HAVE_DEVMAPPER, 1, [Define if device mapper is available]) have_devmapper=yes],
-+                    have_devmapper=no)
-+  AC_SUBST(DEVMAPPER_CFLAGS)
-+  AC_SUBST(DEVMAPPER_LIBS)
-+  if test "x$have_devmapper" = xno -a "x$enable_devmapper" = xyes; then
-+    AC_MSG_ERROR([devmapper support requested but libraries not found])
-+  fi
-+fi
-+AM_CONDITIONAL(HAVE_DEVMAPPER, [test "$have_devmapper" = "yes"])
- 
- have_lvm2=no
- AC_ARG_ENABLE(lvm2, AS_HELP_STRING([--enable-lvm2], [enable LVM2 support]))
-@@ -185,9 +205,19 @@ if test "x$enable_dmmp" = "xyes"; then
- fi
- AM_CONDITIONAL(HAVE_DMMP, [test "$have_dmmp" = "yes"])
- 
--PKG_CHECK_MODULES(LIBATASMART, [libatasmart >= 0.14])
--AC_SUBST(LIBATASMART_CFLAGS)
--AC_SUBST(LIBATASMART_LIBS)
-+have_libatasmart=no
-+AC_ARG_ENABLE(libatasmart, AS_HELP_STRING([--disable-libatasmart], [disable libatasmart support]))
-+if test "x$enable_libatasmart" != "xno"; then
-+  PKG_CHECK_MODULES(LIBATASMART, [libatasmart >= 0.14],
-+                    [AC_DEFINE(HAVE_LIBATASMART, 1, [Define if libatasmart is available]) have_libatasmart=yes],
-+                    have_libatasmart=no)
-+  AC_SUBST(LIBATASMART_CFLAGS)
-+  AC_SUBST(LIBATASMART_LIBS)
-+  if test "x$have_libatasmart" = xno -a "x$enable_libatasmart" = xyes; then
-+    AC_MSG_ERROR([libatasmart support requested but libraries not found])
-+  fi
-+fi
-+AM_CONDITIONAL(HAVE_LIBATASMART, [test "$have_libatasmart" = "yes"])
- 
- PKG_CHECK_MODULES(LIBUDEV, [libudev >= 143])
- AC_SUBST(LIBUDEV_CFLAGS)
-@@ -278,9 +308,12 @@ echo "
-         cppflags:                   ${CPPFLAGS}
-         xsltproc:                   ${XSLTPROC}
- 
-+        Parted support:             ${have_parted}
-+        Device Mapper support:      ${have_devmapper}
-         LVM2 support:               ${have_lvm2}
-         dm-multipath:               ${have_dmmp}
-         Remote Access:              ${remote_access}
-+        libatasmart support:        ${have_libatasmart}
- 
-         Maintainer mode:            ${USE_MAINTAINER_MODE}
-         Profiling:                  ${enable_profiling}
-diff --git a/src/adapter-private.h b/src/adapter-private.h
-index 3409e21..ef584e3 100644
---- a/src/adapter-private.h
-+++ b/src/adapter-private.h
-@@ -23,7 +23,6 @@
- 
- #include <dbus/dbus-glib.h>
- #include <gudev/gudev.h>
--#include <atasmart.h>
- 
- #include "types.h"
- 
-diff --git a/src/adapter.c b/src/adapter.c
-index 65e05b0..45db8c8 100644
---- a/src/adapter.c
-+++ b/src/adapter.c
-@@ -30,7 +30,6 @@
- #include <dbus/dbus-glib.h>
- #include <dbus/dbus-glib-lowlevel.h>
- #include <gudev/gudev.h>
--#include <atasmart.h>
- 
- #include "daemon.h"
- #include "adapter.h"
-diff --git a/src/daemon.c b/src/daemon.c
-index fafcf9a..14e952f 100644
---- a/src/daemon.c
-+++ b/src/daemon.c
-@@ -1748,6 +1748,7 @@ mdstat_changed_event (GIOChannel *channel,
-   return TRUE;
- }
- 
-+#ifdef HAVE_LIBATASMART
- static gboolean
- refresh_ata_smart_data (Daemon *daemon)
- {
-@@ -1776,6 +1777,7 @@ refresh_ata_smart_data (Daemon *daemon)
- 
-   return FALSE;
- }
-+#endif
- 
- static gboolean
- register_disks_daemon (Daemon *daemon)
-@@ -1987,12 +1989,14 @@ daemon_new (void)
-   mount_file_clean_stale (l);
-   g_list_free (l);
- 
-+#ifdef HAVE_LIBATASMART
-   /* set up timer for refreshing ATA SMART data - we don't want to refresh immediately because
-    * when adding a device we also do this...
-    */
-   daemon->priv->ata_smart_refresh_timer_id = g_timeout_add_seconds (ATA_SMART_REFRESH_INTERVAL_SECONDS,
-                                                                     (GSourceFunc) refresh_ata_smart_data,
-                                                                     daemon);
-+#endif
- 
-   PROFILE ("daemon_new(): end");
-   return daemon;
-diff --git a/src/device-private.c b/src/device-private.c
-index 45418ce..fb1d959 100644
---- a/src/device-private.c
-+++ b/src/device-private.c
-@@ -1390,7 +1390,7 @@ device_set_drive_ata_smart_time_collected (Device *device,
- 
- void
- device_set_drive_ata_smart_status (Device *device,
--                                   SkSmartOverall value)
-+                                   guint value)
- {
-   if (G_UNLIKELY (device->priv->drive_ata_smart_status != value))
-     {
-diff --git a/src/device-private.h b/src/device-private.h
-index 32a9bd0..8c57c13 100644
---- a/src/device-private.h
-+++ b/src/device-private.h
-@@ -23,7 +23,6 @@
- 
- #include <dbus/dbus-glib.h>
- #include <gudev/gudev.h>
--#include <atasmart.h>
- 
- #include "types.h"
- 
-@@ -228,7 +227,7 @@ struct DevicePrivate
- 
-   gboolean drive_ata_smart_is_available;
-   guint64 drive_ata_smart_time_collected;
--  SkSmartOverall drive_ata_smart_status;
-+  guint drive_ata_smart_status;
-   void *drive_ata_smart_blob;
-   gsize drive_ata_smart_blob_size;
- 
-@@ -396,7 +395,7 @@ void device_set_holders_objpath (Device *device, GStrv value);
- 
- void device_set_drive_ata_smart_is_available (Device *device, gboolean value);
- void device_set_drive_ata_smart_time_collected (Device *device, guint64 value);
--void device_set_drive_ata_smart_status (Device *device, SkSmartOverall value);
-+void device_set_drive_ata_smart_status (Device *device, guint value);
- void device_set_drive_ata_smart_blob_steal (Device *device, gchar *blob, gsize blob_size);
- 
- G_END_DECLS
-diff --git a/src/device.c b/src/device.c
-index 2ae7f38..d73f9d6 100644
---- a/src/device.c
-+++ b/src/device.c
-@@ -50,7 +50,9 @@
- #include <dbus/dbus-glib.h>
- #include <dbus/dbus-glib-lowlevel.h>
- #include <gudev/gudev.h>
-+#ifdef HAVE_LIBATASMART
- #include <atasmart.h>
-+#endif
- 
- #include "daemon.h"
- #include "device.h"
-@@ -664,10 +666,14 @@ get_property (GObject *object,
-     case PROP_DRIVE_ATA_SMART_STATUS:
-       {
-         const gchar *status;
--        if (device->priv->drive_ata_smart_status == (SkSmartOverall) - 1)
-+#ifdef HAVE_LIBATASMART
-+        if (device->priv->drive_ata_smart_status == (guint) - 1)
-           status = "";
-         else
-           status = sk_smart_overall_to_string (device->priv->drive_ata_smart_status);
-+#else
-+        status = "";
-+#endif
-         g_value_set_string (value, status);
-       }
-       break;
-@@ -5144,6 +5150,7 @@ device_new (Daemon *daemon,
-       goto out;
-     }
- 
-+#ifdef HAVE_LIBATASMART
-   /* if just added, update the smart data if applicable */
-   if (device->priv->drive_ata_smart_is_available)
-     {
-@@ -5151,6 +5158,7 @@ device_new (Daemon *daemon,
-       gchar *ata_smart_refresh_data_options[] = { NULL };
-       device_drive_ata_smart_refresh_data (device, ata_smart_refresh_data_options, NULL);
-     }
-+#endif
- 
-   PROFILE ("device_new(native_path=%s): end", native_path);
-  out:
-@@ -9840,16 +9848,18 @@ drive_ata_smart_refresh_data_completed_cb (DBusGMethodInvocation *context,
-                                            const char *stdout,
-                                            gpointer user_data)
- {
-+#ifdef HAVE_LIBATASMART
-   gint rc;
--  SkDisk *d;
-+  SkDisk *d = NULL;
-+  SkSmartOverall overall;
-   gchar *blob;
-   gsize blob_size;
-   time_t time_collected;
--  SkSmartOverall overall;
-+#endif
- 
-   PROFILE ("drive_ata_smart_refresh_data_completed_cb(device=%s) start", device->priv->native_path);
- 
--  d = NULL;
-+#ifdef HAVE_LIBATASMART
-   blob = NULL;
- 
-   if (job_was_cancelled || stdout == NULL)
-@@ -9953,6 +9963,11 @@ drive_ata_smart_refresh_data_completed_cb (DBusGMethodInvocation *context,
-   g_free (blob);
-   if (d != NULL)
-     sk_disk_free (d);
-+
-+#else
-+  throw_error (context, ERROR_FAILED, "libatasmart support disabled");
-+#endif
-+
-   PROFILE ("drive_ata_smart_refresh_data_completed_cb(device=%s) end", device->priv->native_path);
- }
- 
-diff --git a/src/expander-private.h b/src/expander-private.h
-index ef4f440..98a8300 100644
---- a/src/expander-private.h
-+++ b/src/expander-private.h
-@@ -23,7 +23,6 @@
- 
- #include <dbus/dbus-glib.h>
- #include <gudev/gudev.h>
--#include <atasmart.h>
- 
- #include "types.h"
- 
-diff --git a/src/expander.c b/src/expander.c
-index 734ec0a..e799f13 100644
---- a/src/expander.c
-+++ b/src/expander.c
-@@ -34,7 +34,6 @@
- #include <dbus/dbus-glib.h>
- #include <dbus/dbus-glib-lowlevel.h>
- #include <gudev/gudev.h>
--#include <atasmart.h>
- #include <stdlib.h>
- 
- #include "daemon.h"
-diff --git a/src/helpers/Makefile.am b/src/helpers/Makefile.am
-index 4b863c0..d3ec4e9 100644
---- a/src/helpers/Makefile.am
-+++ b/src/helpers/Makefile.am
-@@ -19,15 +19,9 @@ INCLUDES = \
- 
- libexec_PROGRAMS = 					\
- 	udisks-helper-mkfs                    		\
--	udisks-helper-delete-partition        		\
--	udisks-helper-create-partition        		\
--	udisks-helper-modify-partition        		\
--	udisks-helper-create-partition-table		\
- 	udisks-helper-change-filesystem-label 		\
- 	udisks-helper-linux-md-remove-component		\
- 	udisks-helper-fstab-mounter			\
--	udisks-helper-ata-smart-collect			\
--	udisks-helper-ata-smart-selftest		\
- 	udisks-helper-drive-detach			\
- 	udisks-helper-drive-poll			\
- 	udisks-helper-linux-md-check			\
-@@ -48,6 +42,13 @@ udisks_helper_mkfs_SOURCES = job-shared.h job-mkfs.c
- udisks_helper_mkfs_CPPFLAGS = $(AM_CPPFLAGS)
- udisks_helper_mkfs_LDADD = $(GLIB_LIBS)
- 
-+if HAVE_PARTED
-+libexec_PROGRAMS +=                                     \
-+	udisks-helper-delete-partition        		\
-+	udisks-helper-create-partition        		\
-+	udisks-helper-modify-partition        		\
-+	udisks-helper-create-partition-table
-+
- udisks_helper_delete_partition_SOURCES = job-shared.h job-delete-partition.c
- udisks_helper_delete_partition_CPPFLAGS = $(AM_CPPFLAGS)
- udisks_helper_delete_partition_LDADD = $(GLIB_LIBS) libpartutil.la
-@@ -63,11 +64,17 @@ udisks_helper_modify_partition_LDADD = $(GLIB_LIBS) libpartutil.la
- udisks_helper_create_partition_table_SOURCES = job-shared.h job-create-partition-table.c
- udisks_helper_create_partition_table_CPPFLAGS = $(AM_CPPFLAGS)
- udisks_helper_create_partition_table_LDADD = $(GLIB_LIBS) libpartutil.la
-+endif
- 
- udisks_helper_change_filesystem_label_SOURCES = job-shared.h job-change-filesystem-label.c
- udisks_helper_change_filesystem_label_CPPFLAGS = $(AM_CPPFLAGS)
- udisks_helper_change_filesystem_label_LDADD = $(GLIB_LIBS)
- 
-+if HAVE_LIBATASMART
-+libexec_PROGRAMS +=                                     \
-+	udisks-helper-ata-smart-collect			\
-+	udisks-helper-ata-smart-selftest
-+
- udisks_helper_ata_smart_selftest_SOURCES = job-shared.h job-ata-smart-selftest.c
- udisks_helper_ata_smart_selftest_CPPFLAGS = $(AM_CPPFLAGS) $(LIBATASMART_CFLAGS) $(GLIB_CFLAGS)
- udisks_helper_ata_smart_selftest_LDADD = $(LIBATASMART_LIBS) $(GLIB_LIBS)
-@@ -75,6 +82,7 @@ udisks_helper_ata_smart_selftest_LDADD = $(LIBATASMART_LIBS) $(GLIB_LIBS)
- udisks_helper_ata_smart_collect_SOURCES = job-ata-smart-collect.c
- udisks_helper_ata_smart_collect_CPPFLAGS = $(AM_CPPFLAGS) $(LIBATASMART_CFLAGS) $(GLIB_CFLAGS)
- udisks_helper_ata_smart_collect_LDADD = $(LIBATASMART_LIBS) $(GLIB_LIBS)
-+endif
- 
- udisks_helper_linux_md_remove_component_SOURCES = job-shared.h job-linux-md-remove-component.c
- udisks_helper_linux_md_remove_component_CPPFLAGS = $(AM_CPPFLAGS)
-diff --git a/src/helpers/partutil.c b/src/helpers/partutil.c
-index 72a8fe3..8893a39 100644
---- a/src/helpers/partutil.c
-+++ b/src/helpers/partutil.c
-@@ -62,7 +62,6 @@ DEBUG (const gchar *format,
- #  include <config.h>
- #endif
- 
--#define USE_PARTED
- #ifdef USE_PARTED
- #include <parted/parted.h>
- #endif
-@@ -928,6 +927,7 @@ part_table_parse_apple (int fd,
-   return p;
- }
- 
-+#ifdef USE_PARTED
- static PartitionTable *
- part_table_load_from_disk_from_file (char *device_file)
- {
-@@ -948,6 +948,7 @@ part_table_load_from_disk_from_file (char *device_file)
-  out:
-   return ret;
- }
-+#endif
- 
- PartitionTable *
- part_table_load_from_disk (int fd)
-diff --git a/src/port-private.h b/src/port-private.h
-index cc48376..a91532f 100644
---- a/src/port-private.h
-+++ b/src/port-private.h
-@@ -23,7 +23,6 @@
- 
- #include <dbus/dbus-glib.h>
- #include <gudev/gudev.h>
--#include <atasmart.h>
- 
- #include "types.h"
- 
-diff --git a/src/probers/Makefile.am b/src/probers/Makefile.am
-index 06bb566..01c693b 100644
---- a/src/probers/Makefile.am
-+++ b/src/probers/Makefile.am
-@@ -22,8 +22,6 @@ INCLUDES = \
- 
- udevhelperdir = $(slashlibdir)/udev
- udevhelper_PROGRAMS =	udisks-part-id 			\
--			udisks-dm-export 		\
--		      	udisks-probe-ata-smart 		\
- 			udisks-probe-sas-expander 	\
- 			$(NULL)
- 
-@@ -35,17 +33,23 @@ udisks_part_id_SOURCES = part-id.c
- udisks_part_id_CPPFLAGS = $(AM_CPPFLAGS) $(LIBUDEV_CFLAGS)
- udisks_part_id_LDADD = $(GLIB_LIBS) $(LIBUDEV_LIBS) $(top_builddir)/src/helpers/libpartutil.la
- 
-+if HAVE_DEVMAPPER
-+udevhelper_PROGRAMS += udisks-dm-export
- udisks_dm_export_SOURCES = udisks-dm-export.c
- udisks_dm_export_CPPFLAGS = $(AM_CPPFLAGS) $(DEVMAPPER_CFLAGS) $(GLIB_CFLAGS)
- udisks_dm_export_LDADD = $(DEVMAPPER_LIBS) $(GLIB_LIBS)
-+endif
- 
- udisks_lvm_pv_export_SOURCES = udisks-lvm-pv-export.c
- udisks_lvm_pv_export_CPPFLAGS = $(AM_CPPFLAGS) $(DEVMAPPER_CFLAGS) $(LVM2_CFLAGS) $(GLIB_CFLAGS)
- udisks_lvm_pv_export_LDADD = $(DEVMAPPER_LIBS) $(LVM2_LIBS) $(GLIB_LIBS)
- 
-+if HAVE_LIBATASMART
-+udevhelper_PROGRAMS += udisks-probe-ata-smart
- udisks_probe_ata_smart_SOURCES = udisks-probe-ata-smart.c
- udisks_probe_ata_smart_CPPFLAGS = $(AM_CPPFLAGS) $(LIBATASMART_CFLAGS)
- udisks_probe_ata_smart_LDADD = $(LIBATASMART_LIBS)
-+endif
- 
- udisks_probe_sas_expander_SOURCES = udisks-probe-sas-expander.c
- udisks_probe_sas_expander_CPPFLAGS = $(AM_CPPFLAGS) $(GLIB_CFLAGS)
-diff --git a/tools/udisks.c b/tools/udisks.c
-index 97e80d7..d30159b 100644
---- a/tools/udisks.c
-+++ b/tools/udisks.c
-@@ -43,7 +43,9 @@
- #include <dbus/dbus-glib.h>
- #include <dbus/dbus-glib-lowlevel.h>
- 
-+#ifdef HAVE_LIBATASMART
- #include <atasmart.h>
-+#endif
- 
- #include "udisks-daemon-glue.h"
- #include "udisks-device-glue.h"
-@@ -983,6 +985,7 @@ end_highlight (void)
-     g_print ("\x1B[0m");
- }
- 
-+#ifdef HAVE_LIBATASMART
- static const gchar *
- ata_smart_status_to_desc (const gchar *status,
-                           gboolean *out_highlight)
-@@ -1163,6 +1166,7 @@ print_ata_smart_attr (SkDisk *d,
-   g_free (threshold_str);
-   g_free (pretty);
- }
-+#endif
- 
- static void
- do_show_info (const char *object_path)
-@@ -1445,7 +1449,7 @@ do_show_info (const char *object_path)
-         g_print ("    if speed:                  %" G_GINT64_FORMAT " bits/s\n", props->drive_connection_speed);
- 
-       /* ------------------------------------------------------------------------------------------------- */
--
-+#ifdef HAVE_LIBATASMART
-       if (!props->drive_ata_smart_is_available)
-         {
-           g_print ("    ATA SMART:                 not available\n");
-@@ -1498,7 +1502,9 @@ do_show_info (const char *object_path)
-             }
- 
-         }
--
-+#else
-+          g_print ("    ATA SMART:                 not supported\n");
-+#endif
-       /* ------------------------------------------------------------------------------------------------- */
- 
-     }
diff --git a/meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch b/meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch
deleted file mode 100644
index d4efa93dd..000000000
--- a/meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a4f6aa5be37ae6e2194c9ded2ea8c1da330f5694 Mon Sep 17 00:00:00 2001
-From: David King <amigadave@amigadave.com>
-Date: Thu, 2 Jul 2015 13:49:22 +0100
-Subject: [PATCH] Fix systemd service file
-
-udisks-daemon is installed to $(libexecdir), not $(prefix)/lib/udisks.
-
-https://bugzilla.redhat.com/show_bug.cgi?id=1238664
-https://bugs.freedesktop.org/show_bug.cgi?id=91191
-
-Taken-From: [1]
-[1] http://pkgs.fedoraproject.org/cgit/udisks.git/tree/udisks-1.0.5-fix-service-file.patch
-
-Upstream-Status: Pending
-
----
- data/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/data/Makefile.am b/data/Makefile.am
-index 411ea0f..08af5f4 100644
---- a/data/Makefile.am
-+++ b/data/Makefile.am
-@@ -31,7 +31,7 @@ systemdservicedir       = $(systemdsystemunitdir)
- systemdservice_DATA     = $(systemdservice_in_files:.service.in=.service)
- 
- $(systemdservice_DATA): $(systemdservice_in_files) Makefile
--	@sed -e "s|\@libexecdir\@|$(prefix)/lib/udisks|" $< > $@
-+	@sed -e "s|\@libexecdir\@|$(libexecdir)|" $< > $@
- endif
- 
- udevrulesdir = $(slashlibdir)/udev/rules.d
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
deleted file mode 100644
index 0918fedda..000000000
--- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-DESCRIPTION = "A storage daemon that implements well-defined D-Bus interfaces that can be used to query and manipulate storage devices."
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
-
-DEPENDS = "libatasmart sg3-utils polkit libgudev dbus-glib glib-2.0 intltool-native \
-    dbus-glib-native \
-"
-# optional dependencies: device-mapper parted
-
-DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-    dbus-glib-native \
-"
-
-SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
-           file://optional-depends.patch \
-           file://0001-fix-build-with-newer-glibc-versions.patch \
-           file://udisks-1.0.5-fix-service-file.patch \
-           file://0001-Make-udev-rules-directory-configurable.patch \
-           file://0001-include-sys-sysmacros.h.patch \
-           file://0001-tools-Install-bash_completion-script-in-etc-bash_com.patch \
-           file://0001-udisks-helper-Use-sh-interpreter-instead-of-bash.patch \
-           "
-
-SRC_URI[udisks.md5sum] = "70d48dcfe523a74cd7c7fbbc2847fcdd"
-SRC_URI[udisks.sha256sum] = "f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71"
-
-inherit autotools-brokensep systemd gtk-doc distro_features_check bash-completion
-
-REQUIRED_DISTRO_FEATURES = "polkit"
-
-
-PACKAGECONFIG ??= "libdevmapper"
-PACKAGECONFIG[libdevmapper] = "--enable-devmapper,--disable-devmapper,libdevmapper"
-PACKAGECONFIG[parted] = "--enable-parted,--disable-parted,parted"
-
-EXTRA_OECONF = "--disable-man-pages --libdir=${base_libdir} --sbindir=${base_sbindir}"
-EXTRA_OEMAKE = "udevrulesdir=${nonarch_base_libdir}/udev/rules.d/"
-
-FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
-                ${datadir}/dbus-1/ \
-                ${datadir}/polkit-1 \
-                ${nonarch_base_libdir}/udev/* \
-"
-
-FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "udisks.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.17.1


