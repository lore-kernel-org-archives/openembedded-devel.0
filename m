Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9026271E4F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 15:21:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 09 Feb 2017 07:21:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,349,1484035200"; d="scan'208";a="1105169135"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2017 07:21:01 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Feb 2017 17:17:51 +0200
Message-Id: <1486653471-20252-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v2] udisks: Make use of bitbake variables for sbin, lib locations.
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
X-List-Received-Date: Thu, 09 Feb 2017 15:21:02 -0000

Took the opportunity to patch the source to accepet the udev rules directory
from make variables.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 ...01-Make-udev-rules-directory-configurable.patch | 91 ++++++++++++++++++++++
 meta-oe/recipes-support/udisks/udisks_1.0.5.bb     |  4 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch

diff --git a/meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch b/meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch
new file mode 100644
index 0000000..3cc0400
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks/0001-Make-udev-rules-directory-configurable.patch
@@ -0,0 +1,91 @@
+From 32278297170ffb49116b5789e4a0588b99d02bd0 Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Thu, 9 Feb 2017 11:02:53 +0200
+Subject: [PATCH] Make udev rules directory configurable.
+
+udev rules directory can be configurable via undevrulesdir variable. And use
+libdir, sbindir for installing librares and binaries.
+
+Upstream-Status: Inappropriate[Embedded specific]
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+---
+ configure.ac            | 14 +++-----------
+ data/Makefile.am        |  1 -
+ src/probers/Makefile.am |  2 +-
+ tools/Makefile.am       |  2 +-
+ 4 files changed, 5 insertions(+), 14 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8c4e4c2..a143397 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -227,15 +227,8 @@ if test "x$GCC" = "xyes"; then
+   LDFLAGS="-Wl,--as-needed $LDFLAGS"
+ fi
+ 
+-if test "$prefix" = "/usr" -o "$prefix" = "/usr/local" ; then
+-  slashlibdir=/lib
+-  slashsbindir=/sbin
+-else
+-  slashlibdir=$prefix/lib
+-  slashsbindir=$prefix/sbin
+-fi
+-AC_SUBST(slashlibdir)
+-AC_SUBST(slashsbindir)
++udevrulesdir=/lib/udev/udev.d
++AC_SUBST(udevrulesdir)
+ 
+ # *************
+ # Remote Access
+@@ -299,8 +292,7 @@ echo "
+         sysconfdir:                 ${sysconfdir}
+         localstatedir:              ${localstatedir}
+         docdir:                     ${docdir}
+-        slashlibdir:                ${slashlibdir}
+-        slashsbindir:               ${slashsbindir}
++        udevrulesdir:               ${udevrulesdir}
+         systemdsystemunitdir:       ${systemdsystemunitdir}
+ 
+         compiler:                   ${CC}
+diff --git a/data/Makefile.am b/data/Makefile.am
+index 411ea0f..4834960 100644
+--- a/data/Makefile.am
++++ b/data/Makefile.am
+@@ -34,7 +34,6 @@ $(systemdservice_DATA): $(systemdservice_in_files) Makefile
+ 	@sed -e "s|\@libexecdir\@|$(prefix)/lib/udisks|" $< > $@
+ endif
+ 
+-udevrulesdir = $(slashlibdir)/udev/rules.d
+ udevrules_DATA = 80-udisks.rules
+ 
+ pkgconfigdir = $(datadir)/pkgconfig
+diff --git a/src/probers/Makefile.am b/src/probers/Makefile.am
+index 01c693b..6a0361a 100644
+--- a/src/probers/Makefile.am
++++ b/src/probers/Makefile.am
+@@ -20,7 +20,7 @@ INCLUDES = \
+ # TODO: ideally move most of this to udev and/or util-linux
+ #
+ 
+-udevhelperdir = $(slashlibdir)/udev
++udevhelperdir = $(libdir)/udev
+ udevhelper_PROGRAMS =	udisks-part-id 			\
+ 			udisks-probe-sas-expander 	\
+ 			$(NULL)
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 18325f7..0aaec11 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -54,7 +54,7 @@ udisks_LDADD = 						\
+ 	$(DBUS_GLIB_LIBS)				\
+ 	$(POLKIT_DBUS_LIBS)
+ 
+-slashsbin_PROGRAMS = umount.udisks
++sbin_PROGRAMS = umount.udisks
+ 
+ umount_udisks_SOURCES = umount-udisks.c
+ umount_udisks_LDADD = $(DBUS_GLIB_LIBS) $(POLKIT_DBUS_LIBS)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
index eec6933..3757919 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://optional-depends.patch \
     file://0001-fix-build-with-newer-glibc-versions.patch \
     file://udisks-1.0.5-fix-service-file.patch \
+    file://0001-Make-udev-rules-directory-configurable.patch \
 "
 
 SRC_URI[udisks.md5sum] = "70d48dcfe523a74cd7c7fbbc2847fcdd"
@@ -22,7 +23,8 @@ inherit autotools-brokensep systemd gtk-doc
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[parted] = "--enable-parted,--disable-parted,parted"
 
-EXTRA_OECONF = "--disable-man-pages"
+EXTRA_OECONF = "--disable-man-pages --libdir=${base_libdir} --sbindir=${base_sbindir}"
+EXTRA_OEMAKE = "udevrulesdir=${nonarch_base_libdir}/udev/rules.d/"
 
 FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
                 ${datadir}/dbus-1/ \
-- 
2.7.4


