Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525D7C98315
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 01:27:47 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26843.1768786062861896399
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 17:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uCEAHyf7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768786063; x=1800322063;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JQCXnJTj8pki14R7dW+uSBENj6M+AMm9FnnedHCCzo4=;
  b=uCEAHyf73FQUNsJF0sue9vT+EtM3D9mG1iQwlBXrSeCzMN3IKUr8lvMR
   opvnAXZGU4fa7gPHuck94cujBHVLWIBEQkIbjjhmq34QbywgE6leAwuns
   1hcrC99X/r+d7XlHv12VFxcHraELTIbBnEJAvGSvjdcjBg/+/df5rdiHm
   FBATLgbqOijOttaAr84+Eeo4yQrdXXnrRC8HVFnhFn41fYAh2pW+GEQiZ
   ZHC0o7eaXEQ2Dn4kj0An8i1tKivB0a0IOvzxr1n/JEY49Sa7ybO8T9cbU
   s8B+bp8OoIQabbLAsmPTAnhbTFiUWji5I/I3sLURIRMsFPvwKCtIwxTRn
   w==;
X-CSE-ConnectionGUID: WK8ukzAKQvyG30aMYmQn5A==
X-CSE-MsgGUID: VPSUrE8WTSmu9USt8XgSgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="205025362"
X-IronPort-AV: E=Sophos;i="6.21,237,1763391600"; 
   d="scan'208";a="205025362"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 10:27:41 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id D9F15C01B11
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 01:27:40 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8EAF0C01196
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 01:27:40 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 4687520000E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 01:27:38 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] adcli: upgrade 0.9.2 -> 0.9.3.1
Date: Mon, 19 Jan 2026 09:27:07 +0800
Message-ID: <20260119012707.15616-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 01:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123579

1. Add pkgconfig to solve following configure error:
 ../sources/adcli-0.9.3.1/configure: line 15340: syntax error near unexpected token `LIBSELINUX,'
 ../sources/adcli-0.9.3.1/configure: line 15340: `PKG_CHECK_MODULES(LIBSELINUX, libselinux, found_libselinux=yes, found_libselinux=no)'
 
2. Add PACKAGECONFIG[selinux] for new selinux support in 0.9.3.1.

3. Add 0001-configure.ac-Fix-selinux-error-for-cross_compiling.patch to fix SELINUX_MAKEFILE file check in 0.9.3.1.

4. Add --disable-offline-join-support to solve following configure error

 configure: error: Couldn't build offline join support, Samba version too old or libnatapi devel package is missing

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ix-selinux-error-for-cross_compiling.patch | 49 +++++++++++++++++++
 .../{adcli_0.9.2.bb => adcli_0.9.3.1.bb}      | 15 ++++--
 2 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/adcli/adcli/0001-configure.ac-Fix-selinux-error-for-cross_compiling.patch
 rename meta-networking/recipes-connectivity/adcli/{adcli_0.9.2.bb => adcli_0.9.3.1.bb} (58%)

diff --git a/meta-networking/recipes-connectivity/adcli/adcli/0001-configure.ac-Fix-selinux-error-for-cross_compiling.patch b/meta-networking/recipes-connectivity/adcli/adcli/0001-configure.ac-Fix-selinux-error-for-cross_compiling.patch
new file mode 100644
index 0000000000..b3b7702644
--- /dev/null
+++ b/meta-networking/recipes-connectivity/adcli/adcli/0001-configure.ac-Fix-selinux-error-for-cross_compiling.patch
@@ -0,0 +1,49 @@
+Subject: [PATCH] configure.ac: Fix selinux error for
+ cross_compiling
+
+Before this patch:
+configure file will check SELINUX_MAKEFILE /usr/share/selinux/devel/Makefile which is defined for target.
+But in cross_compiling environment, the SELINUX_MAKEFILE should defined for host
+
+So following error occurs
+| checking for libselinux... no
+| checking for /usr/share/selinux/devel/Makefile... configure: error: cannot check for file existence when cross compiling
+| NOTE: The following config.log files may provide further information.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ configure.ac | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b0be041..b5c3baf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -171,9 +171,19 @@ fi
+ SELINUX_MAKEFILE=/usr/share/selinux/devel/Makefile
+ AC_SUBST([SELINUX_MAKEFILE])
+ 
+-AC_CHECK_FILE([$SELINUX_MAKEFILE],
+-              [build_selinux=yes],
+-              [build_selinux=no])
++AS_IF([test "x$cross_compiling" = "xyes"],
++    [
++        AS_IF([test -f "${SYSROOT_DIR}/usr/share/selinux/devel/Makefile"],
++            [build_selinux=yes],
++            [build_selinux=no])
++        SELINUX_MAKEFILE="${SYSROOT_DIR}/usr/share/selinux/devel/Makefile"
++    ],
++    [
++        SELINUX_MAKEFILE=/usr/share/selinux/devel/Makefile
++        AC_CHECK_FILE([$SELINUX_MAKEFILE],
++            [build_selinux=yes],
++            [build_selinux=no])
++    ])
+ 
+ if test x$build_selinux_support = xyes && test x$build_selinux = xno; then
+     AC_MSG_ERROR([Couldn't build SELinux support, SELinux policy devel packages missing])
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.9.3.1.bb
similarity index 58%
rename from meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
rename to meta-networking/recipes-connectivity/adcli/adcli_0.9.3.1.bb
index 7bd07491fe..a15afbe2ec 100644
--- a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.3.1.bb
@@ -4,20 +4,27 @@ DESCRIPTION = "A helper library and tools for Active Directory client operations
 HOMEPAGE = "http://cgit.freedesktop.org/realmd/adcli"
 SECTION = "net"
 
-SRCREV = "8e88e3590a19006362ea8b8dfdc18bb88b3cb3b5"
-
-SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;protocol=https;branch=master"
+SRCREV = "f3b69c2497c1a66359047abc3042c11cab2199e1"
 
+SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;protocol=https;branch=master;tag=${PV} \
+           file://0001-configure.ac-Fix-selinux-error-for-cross_compiling.patch \
+          "
 
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
-inherit autotools xmlcatalog
+inherit autotools xmlcatalog pkgconfig
 
 DEPENDS += "virtual/crypt krb5 openldap gettext libxslt xmlto libxml2-native \
             cyrus-sasl libxslt-native xmlto-native coreutils-native\
            "
 
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
+PACKAGECONFIG[selinux] = ",--disable-selinux-support,libselinux,libselinux"
+
 EXTRA_OECONF += "--disable-silent-rules \
                  --disable-doc \
+                 --disable-offline-join-support \
                 "
+
+FILES:${PN} += "${datadir}"
-- 
2.43.0


