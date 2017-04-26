Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD8A77A8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 00:27:43 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v1so6937824pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 17:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UTnIKpBBcH04pZFKSAsy5Vtm7ZWN5K7HeOP0TdQxY7s=;
	b=g9Y2IKvt1lrT4mUvXfRBAEhtw8/EHulcEnCkQ7gR1xto/iKr+35SFzEYCgqrHXrMAG
	WKFid1JcDgrALatt0yRZlmiLeGkMmoyDIskFU1amj8BFRaZIi5qnKhn7d3mQIBvjVdFF
	8N8eBz2f+pi4PQ3QKCcKy/5ecD81/vjqUgJR0qsGfjl782rK8iCqjwvz22uxEvnTtuxx
	XNf29zg6ClzE8Q2OB4Oca7tMWCrnwh0oi+totq+MjaOkxtnf12D3+lKYQCIzICgs+kDp
	L1xMJO61a8HCzc4c0mtxxKuDk5vsMBXMKoaVWgYbFDmEEyUtxcLkCFRFK+iGcoQ+OMgg
	CDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UTnIKpBBcH04pZFKSAsy5Vtm7ZWN5K7HeOP0TdQxY7s=;
	b=mUXE1HHbEQJ2pv/pqoL9t+7hCwdQHnOqWpyltsw5TYRGMWGljsYcnIKNPi7oiNhGVo
	afv6xnIxZ5xydJj0DFh04Kd+1Eyk/J1WrwSeAWStY+y9e3+jBtu/XZv1koIHKHYb0nnq
	z/vOtw5ahhvzYhRo21GsyWCOium9xSuBX2uC5JzzYFvG8+bTXmNlehjbbnOFpH+lKAyn
	PF2jSEuATWLW+NK2zNNwWblsHBvwLH6sgpwcg9Wqr6ksFNG7vAictoxFzEicruXyKbPn
	4LxPnxG0fmXaFn8nuOb1c7RaHk6gXPOpIc/JdVzAHbrKatig7simg7qbc/6iKdlofIGx
	Sx9w==
X-Gm-Message-State: AN3rC/7G0TQMh/GYyctScX4FicTgPsKvcVE90ZtCwpcQslG8D+P8aJ4V
	UGmrmxsbX4ySow==
X-Received: by 10.98.39.195 with SMTP id n186mr29760281pfn.17.1493166464914;
	Tue, 25 Apr 2017 17:27:44 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	h89sm38397221pfh.45.2017.04.25.17.27.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Apr 2017 17:27:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Apr 2017 17:27:35 -0700
Message-Id: <20170426002735.25178-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-networking][PATCH V2] opensaf: Upgrade to 5.2.0
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
X-List-Received-Date: Wed, 26 Apr 2017 00:27:46 -0000

Fix build with gcc7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1 -> v2:
- Remove unwanted .service file associations

 .../opensaf/0001-Remove-unused-variables.patch     |  43 +++++++
 ...isable-format-overflow-if-supported-by-gc.patch | 127 +++++++++++++++++++++
 ...gure-Pass-linker-specific-options-with-Wl.patch |  29 +++++
 .../opensaf/opensaf/0001-plmcd-error-fix.patch     |  43 -------
 .../opensaf/install-samples-from-srcdir.patch      |  11 --
 .../opensaf/{opensaf_5.0.0.bb => opensaf_5.2.0.bb} |  37 +++---
 6 files changed, 215 insertions(+), 75 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Remove-unused-variables.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-error-fix.patch
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-srcdir.patch
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.0.0.bb => opensaf_5.2.0.bb} (67%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Remove-unused-variables.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Remove-unused-variables.patch
new file mode 100644
index 000000000..1c88b81cd
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Remove-unused-variables.patch
@@ -0,0 +1,43 @@
+From a441a75fbb8451268a8a57616c7158cddc1823aa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Apr 2017 12:40:19 -0700
+Subject: [PATCH] Remove unused variables
+
+Fixes build errors with gcc7 e.g.
+
+../opensaf-5.2.0/src/amf/amfd/imm.cc: In member function 'bool ImmObjCreate::immobj_update_required()':
+../opensaf-5.2.0/src/amf/amfd/imm.cc:2174:28: error: unused variable 'pos' [-Werror=unused-variable]
+     std::string::size_type pos;
+                            ^~~
+../opensaf-5.2.0/src/amf/amfd/imm.cc:2215:28: error: unused variable 'pos' [-Werror=unused-variable]
+     std::string::size_type pos;
+                            ^~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/amf/amfd/imm.cc | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/amf/amfd/imm.cc b/src/amf/amfd/imm.cc
+index 7932364..4f47b65 100644
+--- a/src/amf/amfd/imm.cc
++++ b/src/amf/amfd/imm.cc
+@@ -2171,7 +2171,6 @@ bool ImmObjCreate::immobj_update_required() {
+   if (class_type == AVSV_SA_AMF_SI_ASSIGNMENT) {
+     std::string su_name;
+     std::string sisu_name;
+-    std::string::size_type pos;
+     while ((attribute = attrValues_[i++]) != nullptr) {
+       if (!strcmp(attribute->attrName, "safSISU")) {
+         sisu_name = Amf::to_string(
+@@ -2212,7 +2211,6 @@ bool ImmObjCreate::immobj_update_required() {
+   } else if (class_type == AVSV_SA_AMF_CSI_ASSIGNMENT) {
+     std::string comp_name;
+     std::string csicomp_name;
+-    std::string::size_type pos;
+     AVD_CSI *csi = nullptr;
+     AVD_COMP *comp = nullptr;
+     AVD_COMP_CSI_REL *compcsi = nullptr;
+-- 
+2.12.2
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
new file mode 100644
index 000000000..512e246c5
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
@@ -0,0 +1,127 @@
+From ab00d6f5793b2d850f975bcb6d5d0aa6d7a9eaa4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Apr 2017 12:34:37 -0700
+Subject: [PATCH] configure: Disable format-overflow if supported by gcc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am                 |  6 ++--
+ configure.ac                |  2 ++
+ m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 79 insertions(+), 3 deletions(-)
+ create mode 100644 m4/ax_check_compile_flag.m4
+
+diff --git a/Makefile.am b/Makefile.am
+index d63fbbb..1012a2c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -52,10 +52,10 @@ AM_CPPFLAGS = \
+ 	-pthread \
+ 	-D_GNU_SOURCE -DINTERNAL_VERSION_ID='"@INTERNAL_VERSION_ID@"' \
+ 	$(CORE_INCLUDES) \
+-	$(all_includes)
++	$(all_includes) @NOWARNINGS@
+ 
+-AM_CFLAGS = -pipe -std=gnu11 @OSAF_HARDEN_FLAGS@ -Wall -Wformat=2 -Werror
+-AM_CXXFLAGS = -pipe -std=gnu++11 @OSAF_HARDEN_FLAGS@ -Wall -Wformat=2 -Werror
++AM_CFLAGS = -pipe -std=gnu11 @OSAF_HARDEN_FLAGS@ -Wall -Wformat=2 -Werror @NOWARNINGS@
++AM_CXXFLAGS = -pipe -std=gnu++11 @OSAF_HARDEN_FLAGS@ -Wall -Wformat=2 -Werror @NOWARNINGS@
+ AM_LDFLAGS = @OSAF_HARDEN_FLAGS@ -Wl,--as-needed -ldl -lrt -pthread -rdynamic
+ ACLOCAL_AMFLAGS = -I m4
+ OSAF_LIB_FLAGS =
+diff --git a/configure.ac b/configure.ac
+index 02771c6..b76b0fe 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -557,6 +557,8 @@ if test -z "$OSAF_HARDEN_FLAGS"; then
+ fi
+ AC_SUBST(OSAF_HARDEN_FLAGS)
+ 
++AX_CHECK_COMPILE_FLAG([-Werror=format-overflow],[NOWARNINGS=-Wno-error=format-overflow])
++AC_SUBST(NOWARNINGS)
+ #############################################
+ # List the output Makefiles
+ #############################################
+diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
+new file mode 100644
+index 0000000..dcabb92
+--- /dev/null
++++ b/m4/ax_check_compile_flag.m4
+@@ -0,0 +1,74 @@
++# ===========================================================================
++#  https://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_CHECK_COMPILE_FLAG(FLAG, [ACTION-SUCCESS], [ACTION-FAILURE], [EXTRA-FLAGS], [INPUT])
++#
++# DESCRIPTION
++#
++#   Check whether the given FLAG works with the current language's compiler
++#   or gives an error.  (Warnings, however, are ignored)
++#
++#   ACTION-SUCCESS/ACTION-FAILURE are shell commands to execute on
++#   success/failure.
++#
++#   If EXTRA-FLAGS is defined, it is added to the current language's default
++#   flags (e.g. CFLAGS) when the check is done.  The check is thus made with
++#   the flags: "CFLAGS EXTRA-FLAGS FLAG".  This can for example be used to
++#   force the compiler to issue an error when a bad flag is given.
++#
++#   INPUT gives an alternative input source to AC_COMPILE_IFELSE.
++#
++#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION. Please keep this
++#   macro in sync with AX_CHECK_{PREPROC,LINK}_FLAG.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
++#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
++#
++#   This program is free software: you can redistribute it and/or modify it
++#   under the terms of the GNU General Public License as published by the
++#   Free Software Foundation, either version 3 of the License, or (at your
++#   option) any later version.
++#
++#   This program is distributed in the hope that it will be useful, but
++#   WITHOUT ANY WARRANTY; without even the implied warranty of
++#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
++#   Public License for more details.
++#
++#   You should have received a copy of the GNU General Public License along
++#   with this program. If not, see <https://www.gnu.org/licenses/>.
++#
++#   As a special exception, the respective Autoconf Macro's copyright owner
++#   gives unlimited permission to copy, distribute and modify the configure
++#   scripts that are the output of Autoconf when processing the Macro. You
++#   need not follow the terms of the GNU General Public License when using
++#   or distributing such scripts, even though portions of the text of the
++#   Macro appear in them. The GNU General Public License (GPL) does govern
++#   all other use of the material that constitutes the Autoconf Macro.
++#
++#   This special exception to the GPL applies to versions of the Autoconf
++#   Macro released by the Autoconf Archive. When you make and distribute a
++#   modified version of the Autoconf Macro, you may extend this special
++#   exception to the GPL to apply to your modified version as well.
++
++#serial 5
++
++AC_DEFUN([AX_CHECK_COMPILE_FLAG],
++[AC_PREREQ(2.64)dnl for _AC_LANG_PREFIX and AS_VAR_IF
++AS_VAR_PUSHDEF([CACHEVAR],[ax_cv_check_[]_AC_LANG_ABBREV[]flags_$4_$1])dnl
++AC_CACHE_CHECK([whether _AC_LANG compiler accepts $1], CACHEVAR, [
++  ax_check_save_flags=$[]_AC_LANG_PREFIX[]FLAGS
++  _AC_LANG_PREFIX[]FLAGS="$[]_AC_LANG_PREFIX[]FLAGS $4 $1"
++  AC_COMPILE_IFELSE([m4_default([$5],[AC_LANG_PROGRAM()])],
++    [AS_VAR_SET(CACHEVAR,[yes])],
++    [AS_VAR_SET(CACHEVAR,[no])])
++  _AC_LANG_PREFIX[]FLAGS=$ax_check_save_flags])
++AS_VAR_IF(CACHEVAR,yes,
++  [m4_default([$2], :)],
++  [m4_default([$3], :)])
++AS_VAR_POPDEF([CACHEVAR])dnl
++])dnl AX_CHECK_COMPILE_FLAGS
+-- 
+2.12.2
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch
new file mode 100644
index 000000000..5756a027b
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch
@@ -0,0 +1,29 @@
+From 6248b717b4861d16b80235fd8e57d64e4f636428 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Apr 2017 17:39:07 -0700
+Subject: [PATCH] configure: Pass linker specific options with -Wl
+
+This helps make it pass the options to linker correctly
+and we can use non-gcc compilers
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index df4fc58..02771c6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -553,7 +553,7 @@ if test -z "$OSAF_HARDEN_FLAGS"; then
+ 	if echo "${CFLAGS} ${CXXFLAGS}" | grep -q -- -O0; then
+ 		OSAF_HARDEN_FLAGS=""
+ 	fi
+-	OSAF_HARDEN_FLAGS="${OSAF_HARDEN_FLAGS} -fstack-protector --param ssp-buffer-size=4 -fPIE -pie -zrelro -znow"
++	OSAF_HARDEN_FLAGS="${OSAF_HARDEN_FLAGS} -fstack-protector --param ssp-buffer-size=4 -fPIE -pie -Wl,-z,relro,-z,now"
+ fi
+ AC_SUBST(OSAF_HARDEN_FLAGS)
+ 
+-- 
+2.12.2
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-error-fix.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-error-fix.patch
deleted file mode 100644
index 624cd2d7b..000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-error-fix.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f1813af4c154fb1d3950abbdf678c3a5a67222fc Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Thu, 25 Jun 2015 11:44:27 +0900
-Subject: [PATCH] plmcd: error fix
-
-ld: cannot find -lsystemd-daemon
-collect2: error: ld returned 1 exit status
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
- contrib/plmc/plmcd/Makefile.am | 2 +-
- contrib/plmc/plmcd/Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/contrib/plmc/plmcd/Makefile.am b/contrib/plmc/plmcd/Makefile.am
-index 8d847f2..dd7913a 100644
---- a/contrib/plmc/plmcd/Makefile.am
-+++ b/contrib/plmc/plmcd/Makefile.am
-@@ -32,7 +32,7 @@ plmcd_SOURCES = \
- plmcd_LDFLAGS = -lpthread
- 
- if ENABLE_SYSTEMD
--plmcd_LDFLAGS += -lsystemd-daemon
-+plmcd_LDFLAGS += -lsystemd
- endif
- 
- plmcd_LDADD = \
-diff --git a/contrib/plmc/plmcd/Makefile.in b/contrib/plmc/plmcd/Makefile.in
-index 0185dc4..e40513a 100644
---- a/contrib/plmc/plmcd/Makefile.in
-+++ b/contrib/plmc/plmcd/Makefile.in
-@@ -106,7 +106,7 @@ build_triplet = @build@
- host_triplet = @host@
- target_triplet = @target@
- sbin_PROGRAMS = plmcd$(EXEEXT)
--@ENABLE_SYSTEMD_TRUE@am__append_1 = -lsystemd-daemon
-+@ENABLE_SYSTEMD_TRUE@am__append_1 = -lsystemd
- subdir = plmcd
- ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
- am__aclocal_m4_deps = $(top_srcdir)/configure.ac
--- 
-1.8.4.2
-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-srcdir.patch b/meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-srcdir.patch
deleted file mode 100644
index 016b64f2e..000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-srcdir.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- opensaf-4.5.0.orig/Makefile.am	2014-12-31 14:45:54.088797989 +0800
-+++ opensaf-4.5.0/Makefile.am	2014-12-31 14:45:08.328796688 +0800
-@@ -219,7 +219,7 @@ install-data-local:
- 	$(mkinstalldirs) $(DESTDIR)$(pkgpiddir)
- 	$(mkinstalldirs) $(DESTDIR)$(lockdir)
- 	$(mkinstalldirs) $(DESTDIR)$(pkglocalstatedir)
--	cp -R samples/ $(DESTDIR)$(pkgdatadir)
-+	cp -R $(srcdir)/samples/ $(DESTDIR)$(pkgdatadir)
- 
- install-data-hook:
- 	@for i in $$(grep -lr -e 'xxLIBDIRxx' -e 'xxLOGDIRxx' -e 'xxCLCCLIDIRxx' $(DESTDIR)$(pkgimmxml_svcdir)/*.xml) ; do \
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
similarity index 67%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
index 6ceb225e9..babf03e09 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
@@ -15,14 +15,17 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
 
 DEPENDS = "libxml2 python"
+TOOLCHAIN = "gcc"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
-           file://install-samples-from-srcdir.patch \
-           file://0001-plmcd-error-fix.patch \
-           "
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
 
-SRC_URI[md5sum] = "94cd1a4c0406e6a45bb04c003f8690e7"
-SRC_URI[sha256sum] = "4b4188a0f3d0ed1ed0e3d77de27c45e2c96b437401de08e7df2ed9ecd54bb999"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
+           file://0001-configure-Pass-linker-specific-options-with-Wl.patch \
+           file://0001-configure-Disable-format-overflow-if-supported-by-gc.patch \
+           file://0001-Remove-unused-variables.patch \
+"
+SRC_URI[md5sum] = "08991fd467ae9dcea3c8747be8e3981e"
+SRC_URI[sha256sum] = "903478244afe37e329be93050f1d48fa18c84ea17862134c4217b920e267a04a"
 
 inherit autotools useradd systemd pkgconfig
 
@@ -30,37 +33,29 @@ USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-f -r opensaf"
 USERADD_PARAM_${PN} =  "-r -g opensaf -d ${datadir}/opensaf/ -s ${sbindir}/nologin -c \"OpenSAF\" opensaf"
 
-SYSTEMD_SERVICE_${PN} += "opensafd.service plmcboot.service plmcd.service"
+SYSTEMD_SERVICE_${PN} += "opensafd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-PACKAGECONFIG[systemd] = "--enable-systemd-daemon"
+PACKAGECONFIG[systemd] = ",,systemd"
 PACKAGECONFIG[openhpi] = "--with-hpi-interface=B03 --enable-ais-plm,,openhpi"
 
-EXTRA_OECONF += " --libdir=${libdir}/opensaf "
-EXTRA_OEMAKE += " -Wl,-rpath,${libdir}/opensaf "
+PACKAGECONFIG_append = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)}"
 
-PKGLIBDIR="${libdir}/opensaf/opensaf"
-
-do_configure_prepend () {
-        ( cd ${S}; autoreconf -f -i -s )
-}
+PKGLIBDIR="${libdir}"
 
 do_install_append() {
+    cp -av --no-preserve=ownership ${B}/lib/.libs/*.so* ${D}${libdir}
     rm -fr "${D}${localstatedir}/lock"
     rm -fr "${D}${localstatedir}/run"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensafd.service \
-        ${D}${systemd_unitdir}/system
-    install -m 0644 ${B}/contrib/plmc/config/*.service ${D}/${systemd_unitdir}/system
-
+    rmdir --ignore-fail-on-non-empty "${D}${datadir}/java"
     if [ ! -d "${D}${sysconfdir}/init.d" ]; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${B}/osaf/services/infrastructure/nid/scripts/opensafd ${D}${sysconfdir}/init.d/
     fi
 }
 
-FILES_${PN} += "${localstatedir}/run ${systemd_unitdir}/system/*.service"
+FILES_${PN} += "${systemd_unitdir}/system/*.service"
 FILES_${PN}-staticdev += "${PKGLIBDIR}/*.a"
 
 INSANE_SKIP_${PN} = "dev-so"
-- 
2.12.2


