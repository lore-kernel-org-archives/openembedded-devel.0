Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814CCC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 11:08:37 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4882.1787224115236822880
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 04:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=axUK3mtX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787224116; x=1818760116;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qLRNncLSCQoOD9igbSFo8cOnQt62FaR0EVxEEXIqUUg=;
  b=axUK3mtXQZ0ayNLdjBEG63z/s1E5gQcS9pidnZXBIbN3bft9zLhy8zcZ
   bpYCqD65vi+vixmJQgsaJm2B2kLN+UWQsjIVEK7AavdA+A+Kccmcoeie9
   ARNfD7NXlzl11pxGU6oeglH1aG8OOWyjSL82B4XHWwLU1elN2cASLMQk9
   MQn6mVx6guCtH7kk47uQLkCtUSf6v9bRi5mwz1cjCLi7ZBKj/g2UnE0db
   LfGU0pClJ9sWXTDV8aQx9p/G7vMveY8nL0at8+XqL6OvXElF6Gkajxww9
   PnxJNUnmUe3x9YkFQrR5Aek5luYE9gF37Q1vNh8r/U6UDuQihsxmu3qJ+
   Q==;
X-CSE-ConnectionGUID: PqUBFFPuQCW1PJP56TWx9w==
X-CSE-MsgGUID: JWkLNznXT2iprtqNOszKeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="251961042"
X-IronPort-AV: E=Sophos;i="6.25,233,1779116400"; 
   d="scan'208";a="251961042"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 20:08:34 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3CC4C553F
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 11:08:33 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DF56E1C00CF0
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 11:08:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 0AF84101A429;
	Thu, 20 Aug 2026 11:08:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-oe] [PATCH v2] poke: upgrade 4.3 -> 5.0
Date: Thu, 20 Aug 2026 19:08:27 +0800
Message-ID: <20260820110827.1322-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 11:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129390

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poke/poke/0001-fix-format-security.patch  | 37 +++++++++++++++++++
 .../poke/{poke_4.3.bb => poke_5.0.bb}         |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/poke/poke/0001-fix-format-security.patch
 rename meta-oe/recipes-devtools/poke/{poke_4.3.bb => poke_5.0.bb} (91%)

diff --git a/meta-oe/recipes-devtools/poke/poke/0001-fix-format-security.patch b/meta-oe/recipes-devtools/poke/poke/0001-fix-format-security.patch
new file mode 100644
index 0000000000..6b2d290d9f
--- /dev/null
+++ b/meta-oe/recipes-devtools/poke/poke/0001-fix-format-security.patch
@@ -0,0 +1,37 @@
+From dbaecb5f0032401617254a2f6eb10cdd28ea04f2 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Thu, 20 Aug 2026 10:24:56 +0000
+Subject: [PATCH] fix format security
+
+Upstream-Status: Submitted
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ jitter/gnulib-local/openat-die.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/jitter/gnulib-local/openat-die.c b/jitter/gnulib-local/openat-die.c
+index d37e399..f4b3301 100644
+--- a/jitter/gnulib-local/openat-die.c
++++ b/jitter/gnulib-local/openat-die.c
+@@ -35,7 +35,7 @@ openat_save_fail (int errnum)
+ {
+ #ifndef GNULIB_LIBPOSIX
+   error (exit_failure, errnum,
+-         _("unable to record current working directory"));
++         "%s", _("unable to record current working directory"));
+ #endif
+   /* _Noreturn cannot be applied to error, since it returns
+      when its first argument is 0.  To help compilers understand that this
+@@ -54,7 +54,7 @@ openat_restore_fail (int errnum)
+ {
+ #ifndef GNULIB_LIBPOSIX
+   error (exit_failure, errnum,
+-         _("failed to return to initial working directory"));
++         "%s", _("failed to return to initial working directory"));
+ #endif
+ 
+   /* As above.  */
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/poke/poke_4.3.bb b/meta-oe/recipes-devtools/poke/poke_5.0.bb
similarity index 91%
rename from meta-oe/recipes-devtools/poke/poke_4.3.bb
rename to meta-oe/recipes-devtools/poke/poke_5.0.bb
index 14597c93c2..07a172060d 100644
--- a/meta-oe/recipes-devtools/poke/poke_4.3.bb
+++ b/meta-oe/recipes-devtools/poke/poke_5.0.bb
@@ -7,11 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
           file://0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch \
+          file://0001-fix-format-security.patch \
           "
 
 DEPENDS = "flex-native bison-native bdwgc readline"
 
-SRC_URI[sha256sum] = "a84cb9175d50d45a411f2481fd0662b83cb32ce517316b889cfb570819579373"
+SRC_URI[sha256sum] = "6873d59abe821c8111b88623ea7ad9e090892fa95c75562606dd88374e2f5b8f"
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/poke/"
 UPSTREAM_CHECK_REGEX = "poke-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0


