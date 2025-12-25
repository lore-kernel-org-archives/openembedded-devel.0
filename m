Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88905E7AD44
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 12:51:50 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.138123.1766667108005721870
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 04:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+hdq0LA;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso42238345e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 04:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766667106; x=1767271906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0Rc/GGRPh8YzlnRHxWu2uk3mjZScLBnNtyPkI+ViIY=;
        b=Z+hdq0LAnezQ6gHgTiexji6xeUkaznLmnaru/o3EpuZXvvIlWII2b51AGehnUT6AvV
         4zq6k3+aqf4OpR9Ojasmk4S4STWffJSf0PG/3QVwe4r5dVZqy4EGTKAsXVj6fRLgZ4e6
         bKsysVjOV8KxG+UK9F8UFkKW1D5nXYS93ADDyqDcWnfYZ+5k4R+KY5+hmc70QssbGwPt
         iEoxF90DZiqTr8OwXecgwtYFRwj6RcQH/hQR2x/dYpoed9LsphnQ/0RTRIMU0uGoG541
         wKaStcWOqlKoGrFuChB054kX8RsWR5LxXaphMcrqMP7pAk8oSgJSorxMZ7MCCXTGRJ5z
         dyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766667106; x=1767271906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+0Rc/GGRPh8YzlnRHxWu2uk3mjZScLBnNtyPkI+ViIY=;
        b=d4/rfsU1bI3OpnGcPsPGJlzQuMEpErCLVj4dx3bleHUrZqgakuEzdIzqjl49njAMJZ
         etjm3i2wke4ph4upJgPlUqscAYj3J80UkCC3OuZ/t8jXLxXfbo/4E7oZavVLxKM+1HUR
         fDnx2WbMdnEdfoI4Tvc/fFwVcNlNExzlc+hzpu+kdYC6Es01y1ma9cSP1YKC02lvAMbU
         LrrGf/15/8hP4++m435IZ4t6Exoa+OGOGDj/I96UNDngwDUN5g4ehI+Vq/Qrn9ViHJzL
         Y387fGgybX016GzYdNTWrm98kMuvgHt6KBiJ+5+eghKKOHllwZ3c6byGvetIcnSi8klE
         Gk1A==
X-Gm-Message-State: AOJu0YwpcU+C/cQDC4CPsGb/0n3YvS/NEZMDWYY+BS08B7OinfUOtVLb
	fSCzF8AMoYlvVTWtnu1FlwwSTclA8GmvF62lGljyv/FWQlr2V5+g2N8S2grj2w==
X-Gm-Gg: AY/fxX4ncS7W1gF2bT0zReesayDiCXF+ylpoiu7MMebou9586t3ozCgQr8wrtOgIddg
	kbRSGLTrtUwP93XcCfyDS14BUcyjiQmj3+ow0avZVKcaETzIsS+wMXt/cPUNCMNdr+SJEWH/cAm
	8hjRSB0Di2EHHuTNhxbmkNblkGzjuTNi8e+zT3M+XVbhurtuM0FkjpePrRBXJRSuQAr9wQY/Eg6
	xvga17YrDp7H/RJIKOYS9+1eOUgW5x9ObHz8oy2PlxRwgejid3gWGYSF68ZNCkCkV79GhzDN/5U
	leDLSgwRwBJVeudMa31LVu/Lh7TT814L7h2Hf6hr92ybxTuWqxtDIWlBiezNNkjco4lCexWjQMx
	UE4xJ5kNbVus1qupP3dpDRGJ9Q9t6QadHNtP/WR87yW0pxSJkEzRFaOJTMGplO2irjqetYgjoIH
	F9VIeto5Hv
X-Google-Smtp-Source: AGHT+IGu/ME26weNARG5CRTDES0tEyzehHFaHqwckOz/xLEWQGvtL+Ejca0CoLxLcEn0PfF40gbFXg==
X-Received: by 2002:a05:600c:3b1f:b0:477:bb0:751b with SMTP id 5b1f17b1804b1-47d20423ca4mr189928325e9.27.1766667106201;
        Thu, 25 Dec 2025 04:51:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm40219073f8f.20.2025.12.25.04.51.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 04:51:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 8/8] dbus-broker: patch CVE-2022-31212
Date: Thu, 25 Dec 2025 13:51:39 +0100
Message-ID: <20251225125139.2436941-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225125139.2436941-1-skandigraun@gmail.com>
References: <20251225125139.2436941-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 12:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122920

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-31212

A detailed writeup[1] is referenced by the nvd report, which
describes that the vulnerability itself is not in the application,
rather in a dependency of it, in c-shutil, which is pulled in as
a submodule.

Pick the patch from this submodule that fixes a stack overflow, and
adds a test explictly verifying the described vulnerability.

[1]: https://sec-consult.com/vulnerability-lab/advisory/memory-corruption-vulnerabilities-dbus-broker/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../dbus/dbus-broker/CVE-2022-31212.patch     | 70 +++++++++++++++++++
 meta-oe/recipes-core/dbus/dbus-broker_29.bb   |  4 +-
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/CVE-2022-31212.patch

diff --git a/meta-oe/recipes-core/dbus/dbus-broker/CVE-2022-31212.patch b/meta-oe/recipes-core/dbus/dbus-broker/CVE-2022-31212.patch
new file mode 100644
index 0000000000..a173e88d34
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/CVE-2022-31212.patch
@@ -0,0 +1,70 @@
+From 2dfb73805571bd48e92b2d09962bc99f3bc4f86b Mon Sep 17 00:00:00 2001
+From: David Rheinsberg <david.rheinsberg@gmail.com>
+Date: Tue, 19 Apr 2022 13:11:02 +0200
+Subject: [PATCH] strnspn: fix buffer overflow
+
+Fix the strnspn and strncspn functions to use a properly sized buffer.
+It used to be 1 byte too short. Checking for `0xff` in a string will
+thus write `0xff` once byte beyond the stack space of the local buffer.
+
+Note that the public API does not allow to pass `0xff` to those
+functions. Therefore, this is a read-only buffer overrun, possibly
+causing bogus reports from the parser, but still well-defined.
+
+Reported-by: Steffen Robertz
+Signed-off-by: David Rheinsberg <david.rheinsberg@gmail.com>
+
+CVE: CVE-2022-31212
+Upstream-Status: Backport [https://github.com/c-util/c-shquote/commit/7fd15f8e272136955f7ffc37df29fbca9ddceca1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ subprojects/c-shquote/src/c-shquote.c    | 4 ++--
+ subprojects/c-shquote/src/test-private.c | 6 ++++++
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/subprojects/c-shquote/src/c-shquote.c b/subprojects/c-shquote/src/c-shquote.c
+index b268906..abb55d6 100644
+--- a/subprojects/c-shquote/src/c-shquote.c
++++ b/subprojects/c-shquote/src/c-shquote.c
+@@ -85,7 +85,7 @@ int c_shquote_consume_char(char **outp,
+ size_t c_shquote_strnspn(const char *string,
+                         size_t n_string,
+                         const char *accept) {
+-        bool buffer[UCHAR_MAX] = {};
++        bool buffer[UCHAR_MAX + 1] = {};
+ 
+         for ( ; *accept; ++accept)
+                 buffer[(unsigned char)*accept] = true;
+@@ -100,7 +100,7 @@ size_t c_shquote_strnspn(const char *string,
+ size_t c_shquote_strncspn(const char *string,
+                           size_t n_string,
+                           const char *reject) {
+-        bool buffer[UCHAR_MAX] = {};
++        bool buffer[UCHAR_MAX + 1] = {};
+ 
+         if (strlen(reject) == 1) {
+                 const char *p;
+diff --git a/subprojects/c-shquote/src/test-private.c b/subprojects/c-shquote/src/test-private.c
+index 57a7250..c6afe40 100644
+--- a/subprojects/c-shquote/src/test-private.c
++++ b/subprojects/c-shquote/src/test-private.c
+@@ -148,6 +148,9 @@ static void test_strnspn(void) {
+ 
+         len = c_shquote_strnspn("ab", 2, "bc");
+         c_assert(len == 0);
++
++        len = c_shquote_strnspn("ab", 2, "\xff");
++        c_assert(len == 0);
+ }
+ 
+ static void test_strncspn(void) {
+@@ -167,6 +170,9 @@ static void test_strncspn(void) {
+ 
+         len = c_shquote_strncspn("ab", 2, "cd");
+         c_assert(len == 2);
++
++        len = c_shquote_strncspn("ab", 2, "\xff");
++        c_assert(len == 2);
+ }
+ 
+ static void test_discard_comment(void) {
diff --git a/meta-oe/recipes-core/dbus/dbus-broker_29.bb b/meta-oe/recipes-core/dbus/dbus-broker_29.bb
index 525db345b0..aafeda206e 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_29.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_29.bb
@@ -6,7 +6,9 @@ SECTION = "base"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
-SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
+SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz \
+           file://CVE-2022-31212.patch \
+           "
 SRC_URI[sha256sum] = "4eca425db52b7ab1027153e93fea9b3f11759db9e93ffbf88759b73ddfb8026a"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"

