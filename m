Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893A2EE0AD9
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2680.1770460450686591117
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lbUvOT0R;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4362c932df8so944220f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460449; x=1771065249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKnnRjRMuro9qqZOeN1YiLD79Nq7a7s42bPdbOSt/zU=;
        b=lbUvOT0RemrqHzudbtt+mj5NBpFWJtVaf0LAz9884OH8a63KYpZQt50/AWSd7dNKFa
         V9XRckCcsHCKddo+bIHDcSEx+JltO0zQRlXlQgjE5ZnRl4+s3L01HUpWaB8GTqAdUQJz
         u2qQWtC2pGfju6TYLmZka8Ls/CGQ12QN49AWk6qqaQaCAwVR4ZXai1PkiXRNv0W7PlQB
         Q4ZM3rfo0Qvi11LqRMZIvMrSUuTie2oUYVdIdQO3zEzlTlbWJAY3V9HOGk/Y5rjarEsq
         CbOZtJfjw17fzHVGmIwwq9XQhioG1r+h/T3NRpzrWfdadJnHSrbyEAmskGPvgq1Nca2h
         NhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460449; x=1771065249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kKnnRjRMuro9qqZOeN1YiLD79Nq7a7s42bPdbOSt/zU=;
        b=lLgHR9GM0lrbsk6wiVjYh/9YADlmzgIucK1E/3y6wz+GxpZRVrR5qGnXi8+Q+JXJuT
         bK32ntSFwv7PkwjXTP6ScD71mL7cuSs+FAToRUzXRz0GStmQHjazewaxuQKTfBaXOD6z
         4IvE+r8v9deCKLHDtg9N9FMK2WgFEyyvtNBV5HZEy2Rt2wYzIPFOdLtpuon+TrsMZVCi
         l8JPiWQm+C7gdPKIccqJHVZncVwpXIYulZRpC/o+1su5ZJ9LGht+05mnqp/ONkSA86Lv
         d/lq95nEX+U+NNSLIFVdL6Qb5uGKorrxVeKP4SxOAJtFovi3R0JrJHqj6K92jttuNjE+
         bRkQ==
X-Gm-Message-State: AOJu0Yw1nAZzTIWJSuWPCuEzrHTmi4F2zNTFpXxZu/q707+jnpGICJVb
	GHSMdAo/oFF4G5PgpV5E8m9fjzQZpacI1HHsD4TDgA8qlXRsgDNLD5tSz6TJDQ==
X-Gm-Gg: AZuq6aJCII+udrKiOSpBYzrsta9T9QQnnuw3mZ9CTZbEvbF3hxL+003W6Bta/rQ+qbB
	3S9DoOuZresnHCvnLBWnTpM9QHAwglc3wH1PkxBmvid2EO7xmeLirs5QTGprhqCyn5Mr+f4mAD9
	8ADQmLHTEIzTamTvaB5yE9daqmLaDmRltNFipuykFXUTjlXeAqp4uaroVZDyTMZO0XhEvFNpxqF
	A05iWTsPIugpS+tWEW9gHGAPHRYmZecI2FIOWRblXt3wXDVf+uQmQ/CKM2oBG0XGCdObFuFAWUu
	rRGeP7buk8u9p5lFk02T9SOlLa0Aan+GFL22RrNUQVaNSIwId7KFj/u6b9K1t9FDg4edUNe/o0n
	PwgLeOjdwJWnn4UVBw/PgDPYuX933FjiFyk9IZLCjHN/9L4zew6LHw8pWN/2tbgCFzBiJUBjK/5
	wPIioTDLuj
X-Received: by 2002:a05:6000:24c8:b0:435:e448:2ce5 with SMTP id ffacd0b85a97d-436293bac76mr8621363f8f.48.1770460448956;
        Sat, 07 Feb 2026 02:34:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 12/15] raptor2: patch CVE-2024-57822 and CVE-2024-57823
Date: Sat,  7 Feb 2026 11:33:54 +0100
Message-ID: <20260207103359.4177243-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124253

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-57822
https://nvd.nist.gov/vuln/detail/CVE-2024-57823

Pick the patches mentioned in the github issue[1] mentioned
in the NVD advisories (both of them are covered by the same issue)

[1]: https://github.com/dajobe/raptor/issues/70

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dc2c6a514e7744da4165effefa61ad59c27cf507)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../raptor2/raptor2/CVE-2024-57822.patch      | 44 +++++++++++++++++++
 .../raptor2/raptor2/CVE-2024-57823.patch      | 31 +++++++++++++
 .../recipes-support/raptor2/raptor2_2.0.16.bb |  2 +
 3 files changed, 77 insertions(+)
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch

diff --git a/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch b/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch
new file mode 100644
index 0000000000..cb98f4250c
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch
@@ -0,0 +1,44 @@
+From 3b0ded4ae8110b6291d030af927ecd08197e668f Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 6 Feb 2025 21:12:37 -0800
+Subject: [PATCH] Fix Github issue 70 A) Integer Underflow in
+ raptor_uri_normalize_path()
+
+From: Dave Beckett <dave@dajobe.org>
+
+(raptor_uri_normalize_path): Return empty buffer if path gets to 0
+length
+
+CVE: CVE-2024-57822
+Upstream-Status: Backport [github.com/dajobe/raptor/commit/da7a79976bd0314c23cce55d22495e7d29301c44]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/raptor_rfc2396.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/raptor_rfc2396.c b/src/raptor_rfc2396.c
+index 89183d9..2f0195f 100644
+--- a/src/raptor_rfc2396.c
++++ b/src/raptor_rfc2396.c
+@@ -351,6 +351,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
+           *dest++ = *s++;
+         *dest = '\0';
+         path_len -= len;
++        if(path_len <= 0) {
++          *path_buffer = '\0';
++          return 0;
++        }
+ 
+         if(p && p < prev) {
+           /* We know the previous prev path component and we didn't do
+@@ -390,6 +394,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
+     /* Remove <component>/.. at the end of the path */
+     *prev = '\0';
+     path_len -= (s-prev);
++    if(path_len <= 0) {
++      *path_buffer = '\0';
++      return 0;
++    }
+   }
+ 
+ 
diff --git a/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch b/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch
new file mode 100644
index 0000000000..79833a55cb
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch
@@ -0,0 +1,31 @@
+From 0b028dd16eb504d3d4dcfa9c72ceb29a9e1f3915 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 7 Feb 2025 11:38:34 -0800
+Subject: [PATCH] Fix Github issue 70 B) Heap read buffer overflow in ntriples
+ bnode
+
+From: Dave Beckett <dave@dajobe.org>
+
+(raptor_ntriples_parse_term_internal): Only allow looking at the last
+character of a bnode ID only if bnode length >0
+
+CVE: CVE-2024-57823
+Upstream-Status: Backport [https://github.com/dajobe/raptor/commit/ece2c79df43091686a538b8231cf387d84bfa60e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/raptor_ntriples.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/raptor_ntriples.c b/src/raptor_ntriples.c
+index 3276e79..ecc4247 100644
+--- a/src/raptor_ntriples.c
++++ b/src/raptor_ntriples.c
+@@ -212,7 +212,7 @@ raptor_ntriples_parse_term_internal(raptor_world* world,
+             locator->column--;
+             locator->byte--;
+           }
+-          if(term_class == RAPTOR_TERM_CLASS_BNODEID && dest[-1] == '.') {
++          if(term_class == RAPTOR_TERM_CLASS_BNODEID && position > 0 && dest[-1] == '.') {
+             /* If bnode id ended on '.' move back one */
+             dest--;
+ 
diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
index 85012bcfb3..7a96634803 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
@@ -12,6 +12,8 @@ DEPENDS = "libxml2 libxslt curl yajl"
 SRC_URI = " \
     http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
     file://0001-Remove-the-access-to-entities-checked-private-symbol.patch \
+    file://CVE-2024-57822.patch \
+    file://CVE-2024-57823.patch \
 "
 SRC_URI[sha256sum] = "089db78d7ac982354bdbf39d973baf09581e6904ac4c92a98c5caadb3de44680"
 

