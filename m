Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA09EC4332F
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 01:36:52 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.15204.1665797808459358028
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Oct 2022 18:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=Ambac1n2;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1665797808;
  x=1697333808;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xIc2+Bvd4Z5Rkrakqzj19GW8zZ7yHzjtl0SZ2PYF+sI=;
  b=Ambac1n2bbzKY4w3nJExUi31XT7Oe8jVVfq6eM9AY/gD7XN8QsVENy59
   U0cyUO6P3M+AaeOYEhY/HEEhHjVisZhBNriuVp8m5sr6dkoo+It/G0496
   PqKQKJnBYqh4tw9r73dLoGT5hrjUvBW0HL1fOOV4L2jf7Y7bSZZtbKrtH
   fRfXO+owLDRdifMHdEaI4DUGaelsZ7IfLiL38VFtWTFEARUkM1VMIXMMf
   ZaSpNrapYxMd0RpZAeqkZ/FgO2FOwtbu8OBAO7vRqlHpWUbiFi+SsYl5H
   yxNq5xfmRM/ts0rW6mi/UfcRtK1edkOOq9lN7Wk2wuCE+xBS3Z/SDxiaR
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] v4l-utils: Support building without NLS
Date: Sat, 15 Oct 2022 03:36:43 +0200
Message-ID: <20221015013643.713522-1-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Oct 2022 01:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99175

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...efile.am-Support-building-without-NL.patch | 45 +++++++++++++++++++
 .../v4l2apps/v4l-utils_1.23.0.bb              |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure.ac-Makefile.am-Support-building-without-NL.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure.ac-Makefile.am-Support-building-without-NL.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure.ac-Makefile.am-Support-building-without-NL.patch
new file mode 100644
index 000000000..0548e4fba
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-configure.ac-Makefile.am-Support-building-without-NL.patch
@@ -0,0 +1,45 @@
+From 4fe9f6071cd24bcab157a9398adcca474f619f8d Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Sat, 15 Oct 2022 02:45:26 +0200
+Subject: [PATCH] configure.ac, Makefile.am: Support building without NLS
+
+Avoid entering the v4l-utils-po and libdvbv5-po directories if NLS
+support is disabled, as the generated Makefiles in those directories are
+empty then.
+
+Upstream-Status: Submitted [https://patchwork.linuxtv.org/project/linux-media/patch/20221015010541.688322-1-pkj@axis.com/]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 1 +
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 7fb443ab..8e924af8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,7 +2,11 @@ AUTOMAKE_OPTIONS = foreign
+ ACLOCAL_AMFLAGS = -I m4
+ AM_MAKEFLAGS = $(word 1, $(subst 1, -w, $(filter 1, $(V))) --no-print-directory)
+ 
+-SUBDIRS = v4l-utils-po libdvbv5-po lib
++SUBDIRS = lib
++
++if USE_NLS
++SUBDIRS += v4l-utils-po libdvbv5-po
++endif
+ 
+ if WITH_V4LUTILS
+ SUBDIRS += utils contrib
+diff --git a/configure.ac b/configure.ac
+index 05298981..7c78467f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -99,6 +99,7 @@ DX_INIT_DOXYGEN($PACKAGE_NAME, doxygen_libdvbv5.cfg)
+ ALL_LINGUAS=""
+ m4_ifdef(AM_GNU_GETTEXT_REQUIRE_VERSION,[AM_GNU_GETTEXT_REQUIRE_VERSION([0.19.8])],[AM_GNU_GETTEXT_VERSION([0.19.8])])
+ AM_GNU_GETTEXT([external])
++AM_CONDITIONAL([USE_NLS], [test "$USE_NLS" = "yes"])
+ 
+ LIBDVBV5_DOMAIN="libdvbv5"
+ AC_DEFINE([LIBDVBV5_DOMAIN], "libdvbv5", [libdvbv5 domain])
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
index 2f5ae3586..5bc63058f 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "\
     file://0002-original-patch-mediactl-pkgconfig.patch \
     file://0003-original-patch-export-mediactl-headers.patch \
     file://0004-Do-not-use-getsubopt.patch \
+    file://0005-configure.ac-Makefile.am-Support-building-without-NL.patch \
 "
 
 SRCREV = "fd544473800d02e90bc289434cc44e5aa8fadd0f"

