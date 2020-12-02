Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.2401.1606900782342319188
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 01:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cTgkjkj8;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id i2so2693676wrs.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Dec 2020 01:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IHPJSgMV9SRzc6hbWReb2NZ2u9V0JbYzhSpdyBxqOIM=;
        b=cTgkjkj8QnqpHikJQimDAaBsVc2LqaWYTWUWUkxjV80+4yEdGwCJkQk7R2kI17aBay
         i5KB8SVHgkH4AuO/0nnca4V0Ig+sFhzplPU+A+Mqjng0DH3DqTglZ2I4bjFyPgrw0SCH
         o/8CqDNTNkaIUdLbJrZ1cYgxyQxq7rdwzOGPsXk6PRkxZb7HHz1jNql0NfWvskOKOnr2
         /ErAOmVMxro8+6F3AZTp1QBhSrsyS/Ue9xKF8bEuqxDQY9ayVW5j06tbdYliB1zA0Npf
         dSnGgr8PuRfmAHliyyae0Q3IVbIUQWJAROVV8Ec82LWPD+rkmFiCe2bDyJPZJbXnxlos
         Kj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IHPJSgMV9SRzc6hbWReb2NZ2u9V0JbYzhSpdyBxqOIM=;
        b=F8lM+EzEie+K97NX32lQC5k2uKyZG5F2RyZypn7zqADQ/B3Y1b4GX/mJc/4M37ojWr
         IONI9vIauUigiIwsvviPu40DvsyBTEyTb40OmdvvBwEYPvdrTKS61UCAnfs59MtxEcPu
         JQ0QcKtSOSkTbvAlXmseXSPmzXnopYIRpAVCN70B67IyT+IfT+LzwHeFlGQR5+3EIb7Q
         4w9nJIPZMZwhTOhHab+o4pNDjOqgf9R1k6tYpZwqP8AiJpharYbRKO0lFwgCFSGBgRMd
         1yXhOqEJ7zVA6Z8cePyWXas0yhw4lQUB4BmMW26fmsyKVu9stCXW+hImOg3D8M5Vm80x
         3zhA==
X-Gm-Message-State: AOAM532JcJsxqBIrEaBcSTfDYLpFabN1EO3dRPVl9+PaFAY3/r62vxYN
	wb1ZD1V/RqvE+jvTfDsN5FU2a6Rf+8E=
X-Google-Smtp-Source: ABdhPJyrNNX2ue/lQw89yyA+WP0mFJVqyuhMtqCVIn/YeRW2mL0At1PvumuHDoGlxIUkPx2ijbEZPA==
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr2241750wrn.124.1606900780466;
        Wed, 02 Dec 2020 01:19:40 -0800 (PST)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan (mob-109-113-136-196.net.vodafone.it. [109.113.136.196])
        by smtp.gmail.com with ESMTPSA id y20sm1289392wma.15.2020.12.02.01.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:19:39 -0800 (PST)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: add upstream patch to fix CVE-2020-29394
Date: Wed,  2 Dec 2020 10:19:37 +0100
Message-Id: <20201202091937.1002819-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More information on: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=976228
| A buffer overflow in the dlt_filter_load function in dlt_common.c in
| dlt-daemon 2.8.5 (GENIVI Diagnostic Log and Trace) allows arbitrary
| code execution because fscanf is misused (no limit on the number of
| characters to be read in a format argument).

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon/275.patch           | 38 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.5.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
new file mode 100644
index 000000000..75065eb05
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
@@ -0,0 +1,38 @@
+Upstream-status: Backport
+CVE: CVE-2020-29394
+From 7f5cd5404a03fa330e192084f6bdafb2dc9bdcb7 Mon Sep 17 00:00:00 2001
+From: GwanYeong Kim <gy741.kim@gmail.com>
+Date: Sat, 28 Nov 2020 12:24:46 +0900
+Subject: [PATCH] dlt_common: Fix buffer overflow in dlt_filter_load
+
+A buffer overflow in the dlt_filter_load function in dlt_common.c in dlt-daemon allows arbitrary code execution via an unsafe usage of fscanf, because it does not limit the number of characters to be read in a format argument.
+
+Fixed: #274
+
+Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
+---
+ src/shared/dlt_common.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
+index 254f4ce4..d15b1cec 100644
+--- a/src/shared/dlt_common.c
++++ b/src/shared/dlt_common.c
+@@ -404,7 +404,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, const char *filename, int verb
+     while (!feof(handle)) {
+         str1[0] = 0;
+ 
+-        if (fscanf(handle, "%s", str1) != 1)
++        if (fscanf(handle, "%254s", str1) != 1)
+             break;
+ 
+         if (str1[0] == 0)
+@@ -419,7 +419,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, const char *filename, int verb
+ 
+         str1[0] = 0;
+ 
+-        if (fscanf(handle, "%s", str1) != 1)
++        if (fscanf(handle, "%254s", str1) != 1)
+             break;
+ 
+         if (str1[0] == 0)
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index f3fcee4d2..5066e76d3 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0004-Modify-systemd-config-directory.patch \
     file://241.patch \
     file://245.patch \
+    file://275.patch \
 "
 SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
 
-- 
2.25.1

