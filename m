Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C040C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 13:59:21 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web11.12597.1709042354040900290
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Feb 2024 05:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=ZFUhrIh3;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4336; q=dns/txt; s=iport;
  t=1709042354; x=1710251954;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s/qxOpOn5RkesmZ4yCWE0tp+jN6AHkLE1wPCLrrr9jI=;
  b=ZFUhrIh3f43aObzvJ4kbZTupK/3Mrtf3h+3PHmGAxl9V+3AxNd+B203y
   ggkvRaKItSO/19cgFpLAlxhwbRU6Qnja7v2hujJgwmsGpUhLtI/0poZQ3
   efD3f/GwgyGGRjbEJHoeAeayyXJC47uqIiiSI5TTV+AhmqsHLJUwduGDg
   Y=;
X-CSE-ConnectionGUID: mXBuSJN6QZu90Bk7oh+i2w==
X-CSE-MsgGUID: h3R5QIgHQu6r4mOKxyrt+w==
X-IronPort-AV: E=Sophos;i="6.06,188,1705363200"; 
   d="scan'208";a="196693091"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 13:59:13 +0000
Received: from sjc-ads-6997.cisco.com (sjc-ads-6997.cisco.com [10.30.218.117])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTP id 41RDxDMk010114;
	Tue, 27 Feb 2024 13:59:13 GMT
From: Oleh Matiusha <omatiush@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] yasm: improve reproducibility
Date: Tue, 27 Feb 2024 13:59:12 +0000
Message-Id: <20240227135912.3781920-1-omatiush@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.218.117, sjc-ads-6997.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 13:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109044

Place reproducible build date in source files instead of
actual build date if SOURCE_DATE_EPOCH available.

Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
---
 ...-Set-build-date-to-SOURCE_DATE_EPOCH.patch | 35 ++++++++++++++++
 ...m-Use-BUILD_DATE-for-reproducibility.patch | 40 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  3 ++
 3 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch b/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch
new file mode 100644
index 000000000..e65c9853e
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch
@@ -0,0 +1,35 @@
+From eb164bb201c0f792fa8aa78270c47294065183a3 Mon Sep 17 00:00:00 2001
+From: Oleh Matiusha <omatiush@cisco.com>
+Date: Tue, 6 Feb 2024 09:33:11 +0000
+Subject: [PATCH 1/2] yasm: Set build date to SOURCE_DATE_EPOCH
+
+If SOURCE_DATE_EPOCH is set, use it to generate a reproducible
+string for BUILD_DATE.
+
+Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
+---
+ configure.ac | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 2823ecd..eeb51ce 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -103,6 +103,14 @@ AM_WITH_DMALLOC
+ #
+ AC_CHECK_HEADERS([strings.h libgen.h unistd.h direct.h sys/stat.h])
+ 
++# Use reproducible build date and time
++if test "$SOURCE_DATE_EPOCH"; then
++	DATE_FMT="%d %b %Y %H:%M:%S"
++	BUILD_DATE=$(LC_ALL=C date -u -d "@$SOURCE_DATE_EPOCH" "+$DATE_FMT")
++	AC_DEFINE_UNQUOTED([BUILD_DATE], ["$BUILD_DATE"], [Use reproducidle build date])
++fi
++
++
+ #
+ # Checks for typedefs, structures, and compiler characteristics.
+ #
+-- 
+2.33.0
+
diff --git a/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch b/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch
new file mode 100644
index 000000000..665f3afc9
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch
@@ -0,0 +1,40 @@
+From 19fffab74a201dc41c3da7e74d86eafa8f68bbc6 Mon Sep 17 00:00:00 2001
+From: Oleh Matiusha <omatiush@cisco.com>
+Date: Tue, 6 Feb 2024 09:34:26 +0000
+Subject: [PATCH] yasm: Use BUILD_DATE for reproducibility
+
+Use reproducible build date instead of compilation time and date.
+
+Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
+
+---
+ tools/re2c/parser.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tools/re2c/parser.c b/tools/re2c/parser.c
+index 02d5c66..1c90aee 100644
+--- a/tools/re2c/parser.c
++++ b/tools/re2c/parser.c
+@@ -5,6 +5,7 @@
+ #include "tools/re2c/globals.h"
+ #include "tools/re2c/parse.h"
+ #include "tools/re2c/parser.h"
++#include "config.h"
+ 
+ int yylex(void);
+ static RegExp *parse_expr(void);
+@@ -233,7 +234,11 @@ void parse(FILE *i, FILE *o){
+     peektok = NONE;
+ 
+     fputs("/* Generated by re2c 0.9.1-C on ", o);
++#ifndef BUILD_DATE
+     fprintf(o, "%-24s", ctime(&now));
++#else
++    fprintf(o, "%-24s", BUILD_DATE " ");
++#endif
+     fputs(" */\n", o); oline+=2;
+ 
+     in = Scanner_new(i);
+-- 
+2.33.0
+
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 079f805d6..216b77766 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0001-Do-not-use-AC_HEADER_STDC.patch \
            file://CVE-2023-31975.patch \
            file://CVE-2023-37732.patch \
+           file://0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch \
+           file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -30,3 +32,4 @@ do_configure:prepend() {
      # Don't include $CC (which includes path to sysroot) in generated header.
      sed -i -e "s/^echo \"\/\* generated \$ac_cv_stdint_message \*\/\" >>\$ac_stdint$"// ${S}/m4/ax_create_stdint_h.m4
 }
+
-- 
2.33.0


