Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E6BCDE007
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:03:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7031.1782378170325598902
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZuAFKbEn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378170; x=1813914170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nLXWLICmAaVUH9Y223mk9D7vDZA9NgX4QcAkTuip2t0=;
  b=ZuAFKbEnq1odK90ijGVYIozx8FxgyyxX8mx1/86hR+/L5sHHcQjj20Qh
   iU2YsJnTL91QhfTKwjR9yePjn0OwZZBVM6i/tkUcdaCVb9iTKYHyf1Djf
   xD0lRgqd7l5MaV1B+Ed/1vj7eim+1CvPXc7NoGv4iWMDu9giprT7ZpYdy
   J9ZKr2ILiKRm8u8720kCo+eBf1ipgH+dbbqrZkwso+Eg7zw8DgUzWDEYl
   DzeLpi5lWZe6EB0xiXG+8LwxTb1xJSr0LsQf0SFPXglhhJefnJNcixjCL
   OSSeHUP5yJ2RLRQnLbal3O2a9K7L0KSmdn+/eu4PwH8+vq2I/emNNRfw0
   A==;
X-CSE-ConnectionGUID: xa4PJe6+TeCQEk795+I+XQ==
X-CSE-MsgGUID: MJIUmMaTRQu4xUyyrEJS4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="233265783"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="233265783"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:45 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 163B11C1C704
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:45 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C42ECC0245A
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id D0B051017325;
	Thu, 25 Jun 2026 09:02:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 46/47] syslog-ng: upgrade 4.11.0 -> 4.12.0
Date: Thu, 25 Jun 2026 17:01:26 +0800
Message-ID: <20260625090127.1563-46-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127779

From: Wang Mingyu <wangmy@fujitsu.com>

0001-feat-Add-option-in-cmake-to-remove-awk.patch
0002-feat-Add-option-in-autotools-to-remove-awk.patch
removed since they're included in 4.12.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...at-Add-option-in-cmake-to-remove-awk.patch | 37 -------------
 ...dd-option-in-autotools-to-remove-awk.patch | 55 -------------------
 ...yslog-ng_4.11.0.bb => syslog-ng_4.12.0.bb} |  5 +-
 3 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/0001-feat-Add-option-in-cmake-to-remove-awk.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/0002-feat-Add-option-in-autotools-to-remove-awk.patch
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.11.0.bb => syslog-ng_4.12.0.bb} (96%)

diff --git a/meta-oe/recipes-support/syslog-ng/files/0001-feat-Add-option-in-cmake-to-remove-awk.patch b/meta-oe/recipes-support/syslog-ng/files/0001-feat-Add-option-in-cmake-to-remove-awk.patch
deleted file mode 100644
index 931b83a1d0..0000000000
--- a/meta-oe/recipes-support/syslog-ng/files/0001-feat-Add-option-in-cmake-to-remove-awk.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 57df53d6132cc77251cea746ad6ab6cfd9c8a9f1 Mon Sep 17 00:00:00 2001
-From: Alexander Yurkov <alexander.v.yurkov@gmail.com>
-Date: Thu, 28 May 2026 21:01:40 +0000
-Subject: [PATCH] feat: Add option in cmake to remove awk.
-
-Add an option in cmake to remove the need for awk to avoid licensing issues.
-
-Upstream-Status: Backport [cd7ca1019aca0619f83035f2b11e8f3a22c51a33]
-
-Signed-off-by: Alexander Yurkov <alexander.v.yurkov@gmail.com>
----
- scl/CMakeLists.txt | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/scl/CMakeLists.txt b/scl/CMakeLists.txt
-index e3f8c1d..bef4d50 100644
---- a/scl/CMakeLists.txt
-+++ b/scl/CMakeLists.txt
-@@ -54,8 +54,17 @@ set(SCL_DIRS
-     azure
- )
-
-+option(ENABLE_SCL_SYSLOGCONF_AWK "Install scl/syslogconf/convert-syslogconf.awk" ON)
-+
- install(DIRECTORY ${SCL_DIRS} DESTINATION share/syslog-ng/include/scl
--        USE_SOURCE_PERMISSIONS)
-+        USE_SOURCE_PERMISSIONS
-+        PATTERN "convert-syslogconf.awk" EXCLUDE)
-+
-+if (ENABLE_SCL_SYSLOGCONF_AWK)
-+    install(FILES syslogconf/convert-syslogconf.awk
-+            DESTINATION share/syslog-ng/include/scl/syslogconf)
-+endif()
-+
- install(FILES scl.conf DESTINATION share/syslog-ng/include)
-
- if (NOT EXISTS ${CMAKE_INSTALL_PREFIX}/etc/syslog-ng.conf)
diff --git a/meta-oe/recipes-support/syslog-ng/files/0002-feat-Add-option-in-autotools-to-remove-awk.patch b/meta-oe/recipes-support/syslog-ng/files/0002-feat-Add-option-in-autotools-to-remove-awk.patch
deleted file mode 100644
index 976066c3ff..0000000000
--- a/meta-oe/recipes-support/syslog-ng/files/0002-feat-Add-option-in-autotools-to-remove-awk.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From dc42135ae830e34df7939bf3c08934904c402fa6 Mon Sep 17 00:00:00 2001
-From: Alexander Yurkov <alexander.v.yurkov@gmail.com>
-Date: Thu, 28 May 2026 21:04:27 +0000
-Subject: [PATCH] feat: Add option in autotools to remove awk.
-
-The option is to avoid licensing issues, and awk is turned off by
-default.
-
-Upstream-Status: Backport [eda6d019710048e81f00f3497d5f1143f3eca803]
-
-Signed-off-by: Alexander Yurkov <alexander.v.yurkov@gmail.com>
----
- configure.ac    | 7 +++++++
- scl/Makefile.am | 3 +++
- 2 files changed, 10 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index b283836..b6c487b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -639,6 +639,12 @@ AC_ARG_ENABLE(all-modules,
-     AS_HELP_STRING([--enable-all-modules], [Forcibly enable all modules. (default: auto)]),
-     , enable_all_modules="auto")
-
-+AC_ARG_ENABLE([scl-syslogconf-awk],
-+  [AS_HELP_STRING([--disable-scl-syslogconf-awk],
-+                  [Do not install scl/syslogconf/convert-syslogconf.awk])],
-+  [],
-+  [enable_scl_syslogconf_awk=yes])
-+
- if test "x$enable_all_modules" != "xauto"; then
-    state="$enable_all_modules"
-
-@@ -2685,6 +2691,7 @@ AM_CONDITIONAL([HAVE_GETRANDOM], [test x$ac_cv_func_getrandom = xyes])
- AM_CONDITIONAL([HAVE_FMEMOPEN], [test x$ac_cv_func_fmemopen = xyes])
- AM_CONDITIONAL([HAVE_JAVAH], [test -n "$JAVAH_BIN"])
- AM_CONDITIONAL(ENABLE_IPV6, [test $enable_ipv6 = yes])
-+AM_CONDITIONAL([ENABLE_SCL_SYSLOGCONF_AWK], [test "x$enable_scl_syslogconf_awk" = "xyes"])
-
- AM_CONDITIONAL(OS_TYPE_MACOS, [test $ostype = "Darwin"])
- AM_CONDITIONAL(OS_TYPE_FREEBSD, [test $ostype = "FreeBSD"])
-diff --git a/scl/Makefile.am b/scl/Makefile.am
-index 17d1a55..62b9d01 100644
---- a/scl/Makefile.am
-+++ b/scl/Makefile.am
-@@ -71,6 +71,9 @@ scl-install-data-local:
-		$(install_sh_DATA) $(srcdir)/scl/scl.conf  $(DESTDIR)/$(config_includedir)/scl.conf; \
-	fi
-	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldir) && tar xf - --no-same-owner)
-+if !ENABLE_SCL_SYSLOGCONF_AWK
-+	rm -f $(DESTDIR)/$(scldir)/syslogconf/convert-syslogconf.awk
-+endif
-	chmod -R u+rwX $(DESTDIR)/$(scldir)
-
- scl-uninstall-local:
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.12.0.bb
similarity index 96%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_4.12.0.bb
index 65cb8f7db2..9ca1399ac3 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.12.0.bb
@@ -23,12 +23,11 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \
            file://0001-Fix-buildpaths-warning.patch \
-           file://0001-feat-Add-option-in-cmake-to-remove-awk.patch \
-           file://0002-feat-Add-option-in-autotools-to-remove-awk.patch \
+           file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch \
            "
 SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch"
 
-SRC_URI[sha256sum] = "37ea0d4588533316de122df4e1b249867b0a0575f646c7478d0cc4d747462943"
+SRC_URI[sha256sum] = "03a03d19ac203dca53c7ec79a7005c8a850665a95ff4cd0f1e7bb4c497c64d46"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/syslog-ng-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


