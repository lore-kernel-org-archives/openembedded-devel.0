Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E701EF36BA7
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 07:26:56 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.182440.1775892407327253650
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Apr 2026 00:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nGrGvSh0;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ce22328930so4302970eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 00:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775892406; x=1776497206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0P1/GZOcbGnt+zApQSPgnDAR96UQwfXRzJVX02+74cI=;
        b=nGrGvSh0ENpFG44tEx0Oxfbe2uu5iDst5PGiKwSTs5Tg93UKQTIW3/V/rD3QFYJeb6
         wCQzLV6ETiZS7fVprmLoos3V0xWDrqW6ncu9cv8GYdCpwMwvDB+z+wYMxSWm3IG6kHB2
         D78IpvoVDOE+pzPAxaAPSnOmNoq7oLsCMcqZV4MGyPfPV3eV5wpf9BMBWthED/jil4Pf
         Xa6U7tPRBJu0HoSDQ6fr3bW16wV1DzuC9syM+BA3jskRSlgM4/su0vUbL+jCWF5PCO/f
         DXqqnmSSEIHqhdZFIOarAPxCI2Y09Wex32LwiLTEObkahnxMe+H3CMphrzD9iv6oGGHe
         eGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775892406; x=1776497206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0P1/GZOcbGnt+zApQSPgnDAR96UQwfXRzJVX02+74cI=;
        b=Icj8Y8tLpmrMCZqbJgzRNYNEQOtPyRb78K+kE6uE/Jm7oQ/llishhmpuHg/u8w26qr
         ZkJdPdZb4YgU7FdTfkWJd0ZL2T2iXzJakCxkkMHCGIqj2K7oX8mb4WK9NT4tds6QotcC
         itg2IVyVsOa+Smd5qP6xRGmB+0I0Ezce7rE8XG25ahFMk/t9Mzhr18FtIqzTC/c8Wrx8
         g0MlWcL/lmfNvASPu6BT8MTLATXzHVT+lMTVBjpBPPq84NWONyx3eVWP4o4oZvxxI4wH
         wS7B/xCaGwcuRFq44f0QjHYBZheH+/Yswc6FXexHFVWgqA/ldZknrsdE+8YaNHKEyw3n
         CxRw==
X-Gm-Message-State: AOJu0Yw9jmhp73zXioxAavrcCbIi2F5LvRmkgd7F6uhRpGN0wL8EghKM
	2t9YZxYhtV50PL2l7kC+RaBGRaYUFz9hIw9J6Blw2TDeX34hIxyH8qEGreovF0EK
X-Gm-Gg: AeBDietG1eOXaop7bv1gkZR4OTe/zDSxSU3yWEG7Nc+kETR9TE9aWZ0DYyS2ghsxWV7
	jRpnjFvGIP9L3ih/LLdx8vMrnwkmzgNllqcGI/0QQOVJpv62ecvarGJvIQjtrS/lj+UMeNtyXxG
	8b2Yf/YMEJaXG3zkxm4+/lKc3JGd9lsHK0M779LFHmuHlmuWEjDZj/UxttZOleLIfAWUw6+b+xu
	oZ4OHlANY5gdRhG2Gbuu/ZWXeiqYWTRjVm6Y5fSW6Ch09YSvJvbfdEkmTgpgqcYKFFKXjs5Xasl
	oE6VaFNOBb2Qp81klkKGSHKkuCmjy1Hf6qFQHIhNWpS6lw2XAxrGPE4EuWAaNnTiZo/x9DLZQiS
	xWE80cOeFPHLRJh3g2q8k3+4BZ/wMLFyU8F5FbnbGngj2GNi4xcNfXVtfmWoGOADxmmpL2L8k76
	v1shVOHXDIq+tR3XFy2oGkOlgqbimiOMfFhXZDaRZC0tutvn+jVst/ZBMXLWoZAEGznM+9dY3qX
	Fq4/7QiIXJ4EjWF6UpAlyymerOEsXI9mBlRJOOw3M2XbbzPNE8AMKPWy4k2
X-Received: by 2002:a05:7300:8c9e:b0:2d3:d3f:2429 with SMTP id 5a478bee46e88-2d583ed5c11mr3949777eec.0.1775892406128;
        Sat, 11 Apr 2026 00:26:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d5e43sm7486692eec.21.2026.04.11.00.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 00:26:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] log4c: convert K&R function declarations to ANSI C prototypes
Date: Sat, 11 Apr 2026 00:26:43 -0700
Message-ID: <20260411072643.129969-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 07:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126252

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...t-K-R-function-declarations-to-ANSI-.patch | 92 +++++++++++++++++++
 meta-oe/recipes-support/log4c/log4c_1.2.4.bb  |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-oe/recipes-support/log4c/log4c/0001-sd-malloc-convert-K-R-function-declarations-to-ANSI-.patch

diff --git a/meta-oe/recipes-support/log4c/log4c/0001-sd-malloc-convert-K-R-function-declarations-to-ANSI-.patch b/meta-oe/recipes-support/log4c/log4c/0001-sd-malloc-convert-K-R-function-declarations-to-ANSI-.patch
new file mode 100644
index 0000000000..fae1a2d0c2
--- /dev/null
+++ b/meta-oe/recipes-support/log4c/log4c/0001-sd-malloc-convert-K-R-function-declarations-to-ANSI-.patch
@@ -0,0 +1,92 @@
+From b0ecadec662a8e35b017e16e92c5b1a04ed72598 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 11 Apr 2026 00:24:17 -0700
+Subject: [PATCH] sd/malloc: convert K&R function declarations to ANSI C
+ prototypes
+
+Replace old-style K&R parameter declarations with modern ANSI C
+(C89/C90) function prototypes across all functions in malloc.c.
+Also remove trailing whitespace in fixup_null_alloc().
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/sd/malloc.c | 23 ++++++++---------------
+ 1 file changed, 8 insertions(+), 15 deletions(-)
+
+diff --git a/src/sd/malloc.c b/src/sd/malloc.c
+index 7d241ad..43dd460 100644
+--- a/src/sd/malloc.c
++++ b/src/sd/malloc.c
+@@ -41,8 +41,7 @@ typedef void (*sd_malloc_handler_t)();
+ static sd_malloc_handler_t handler  = NULL;
+
+ static void *
+-fixup_null_alloc (n)
+-    size_t n;
++fixup_null_alloc (size_t n)
+ {
+     void* p = 0;
+
+@@ -62,8 +61,8 @@ fixup_null_alloc (n)
+ 	    allocated = (char *) sbrk (0) - (char *) &environ;
+ 	sd_error("\nCannot allocate %lu bytes after allocating %lu bytes\n",
+ 		 (unsigned long) n, (unsigned long) allocated);
+-
+-	if (handler)
++
++	if (handler)
+ 	    handler();
+ 	else {
+ 	    sd_error("\n\tMemory exhausted !! Aborting.\n");
+@@ -75,8 +74,7 @@ fixup_null_alloc (n)
+ }
+
+ sd_malloc_handler_t
+-sd_malloc_set_handler(a_handler)
+-    sd_malloc_handler_t a_handler;
++sd_malloc_set_handler(sd_malloc_handler_t a_handler)
+ {
+     sd_malloc_handler_t previous = handler;
+
+@@ -87,8 +85,7 @@ sd_malloc_set_handler(a_handler)
+ /* Allocate N bytes of memory dynamically, with error checking.  */
+
+ void *
+-sd_malloc (n)
+-    size_t n;
++sd_malloc (size_t n)
+ {
+     void *p;
+
+@@ -101,8 +98,7 @@ sd_malloc (n)
+ /* Allocate memory for N elements of S bytes, with error checking.  */
+
+ void *
+-sd_calloc (n, s)
+-    size_t n, s;
++sd_calloc (size_t n, size_t s)
+ {
+     void *p;
+
+@@ -117,9 +113,7 @@ sd_calloc (n, s)
+    If P is NULL, run sd_malloc.  */
+
+ void *
+-sd_realloc (p, n)
+-    void *p;
+-    size_t n;
++sd_realloc (void *p, size_t n)
+ {
+     if (p == 0)
+ 	return sd_malloc (n);
+@@ -132,8 +126,7 @@ sd_realloc (p, n)
+ /* Return a newly allocated copy of STRING.  */
+
+ char *
+-sd_strdup (string)
+-     const char *string;
++sd_strdup (const char *string)
+ {
+   return strcpy (sd_malloc (strlen (string) + 1), string);
+ }
diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
index a0bd40b03a..eca800dc5e 100644
--- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
+++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://fix_configure_with-expat.patch \
            file://0001-Use-the-API-properly-in-the-example-format-security-.patch \
+           file://0001-sd-malloc-convert-K-R-function-declarations-to-ANSI-.patch \
           "

 SRC_URI[sha256sum] = "5991020192f52cc40fa852fbf6bbf5bd5db5d5d00aa9905c67f6f0eadeed48ea"

