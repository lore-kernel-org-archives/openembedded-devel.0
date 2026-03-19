Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3311088E79
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 05:01:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4434.1773896483748111960
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 22:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fjo22fjj;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b2965d4bso362283f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 22:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773896482; x=1774501282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wji5V6m57mYlucfq47WG4TXDxxsMHfBb9mqdWWbojMs=;
        b=Fjo22fjjMvWAQyfpXWQ4Qk4EQ4J5kdrE8hZJ1JtjJgw6/g3Yd6wR6QRZgv0h0kP1ha
         kHYE2p7fUq2Lw3VEW91XEaBN0VT38SiRft9BVNqQlseF2G2+0Vi2+F7NiKBmI2o+7MJV
         WiJuz5tElsAi75gEh8vfqFRp5fmEAfvWmsDZT3wJQd190CzyKrqUk54LYESmyLjlM5M9
         dx7EtpSrP8Qxnz02qnIJMmUmCd3VYmprWZ583uHYvc/qDkX8H/ygkUnHPUyu6ntR3dOG
         i5omEHEjsjdTAx1yx/oyP99vXhLI4QhQnn7brxK7glhHrq6uKOxFPZJSG5no0lHTYI89
         ytTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773896482; x=1774501282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wji5V6m57mYlucfq47WG4TXDxxsMHfBb9mqdWWbojMs=;
        b=sHK1siOxiUdsvEOfWa45KflKLUNW+uThZwsuFdpQjeabRI2VW590Ywg5Mux+T+qxwG
         tfxV4eC2mTskCaBT6kqSDJM+Gv4xOLIYmxowMPZ/cmmiswXrZNT6jynv450wOAE3ZD8E
         0F6qnBRHZYb3rGm0ZurLyWBW8YZ4wWTeOx1Yp3J3zPuF3jg7fPXhdNFGLrqtzgQkRGiv
         1nnYMweTayZ+o0D5udPt2C+GzxZF+N4mJSwH/GdSvbCsHE5d4A9dlGesbYk8ceJuic64
         bI3ic1Fyw0EtoRdnYSVqE/6ooptf6R+pKp4nWxb4wWI1BJ4jkl6yO98qO8gAr7l79jCC
         Dqzg==
X-Gm-Message-State: AOJu0YzaaI5a50pUp6kBIoRSvB8uUk6HcAsez8RQNmnEbAcw0DOW5MbX
	5lBHAdVuirCUWbgz5hYHY7J0RAvQxNtj9d+NxyKZhTvPpR32KhecCX+wsXl9Ww==
X-Gm-Gg: ATEYQzw1rGpM/AsnBhMQc0YXNZVkEfltoGoMVimE7vSl2KS4iG0/FGvmJHYPFOwGygY
	yfNyV3YCDpZZcdQukuWqxykCKsXSaon4KHbO5xpjQkReXih3VuUIUnxuMvAy18T5tQPJSYOTs4u
	qxnQVVjiKE34gAw7Xnxc2mX6AW3u+zNfAS7YNeYVuypb/ggzXlUzX2PDGOg1CKlUA3JEUFNwdf3
	b22urtNxkoiWzt7OJL2lZJ5w8UyMi2ReUlHIL7XUdwtBSKD91BCjvyiklvxwCt5UTesFvlmJAZ1
	4lbKugwNCPWFDAKfEV0KIb9fyDkCYRYDUrcA0BZ5jeULyKzIm8qOP8rfRkQ6vfrkWB4bBUNflrY
	MicN37fbG0eau85RFm4lheXZWQsGRmNVioW8S8g3NeuokY6L+ykWdOesM7A5YSxHBbbGu5DjeJr
	ICn5E2scF5EyHdqTw2pbL4
X-Received: by 2002:a05:6000:4008:b0:439:d769:ec56 with SMTP id ffacd0b85a97d-43b5264e4bemr9734061f8f.0.1773896481505;
        Wed, 18 Mar 2026 22:01:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm13888585f8f.21.2026.03.18.22.01.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:01:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] minicoredumper: backport patch to build with glibc 2.43
Date: Thu, 19 Mar 2026 06:01:19 +0100
Message-ID: <20260319050119.3289584-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 05:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125375

As the subject says.

Fixes compilation error:
| ../../../sources/minicoredumper-2.0.7/src/coreinject/main.c: In function 'inject_data':
| ../../../sources/minicoredumper-2.0.7/src/coreinject/main.c:248:11: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
|   248 |         p = strrchr(b_fname, '/');

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...x-assignment-of-const-qualified-type.patch | 44 +++++++++++++++++++
 .../minicoredumper/minicoredumper_2.0.7.bb    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-coreinject-fix-assignment-of-const-qualified-type.patch

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-coreinject-fix-assignment-of-const-qualified-type.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-coreinject-fix-assignment-of-const-qualified-type.patch
new file mode 100644
index 0000000000..ace46202b7
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/0001-coreinject-fix-assignment-of-const-qualified-type.patch
@@ -0,0 +1,44 @@
+From 07023a2d2ef059a039fef83ee4b33a7e47ca8e3e Mon Sep 17 00:00:00 2001
+From: John Ogness <john.ogness@linutronix.de>
+Date: Tue, 24 Feb 2026 11:33:40 +0106
+Subject: [PATCH] coreinject: fix assignment of const-qualified type
+
+coreinject fails to build with glibc 2.43.
+
+The issue is due to a new glibc feature:
+
+* For ISO C23, the functions bsearch, memchr, strchr, strpbrk, strrchr,
+  strstr, wcschr, wcspbrk, wcsrchr, wcsstr and wmemchr that return
+  pointers into their input arrays now have definitions as macros that
+  return a pointer to a const-qualified type when the input argument is
+  a pointer to a const-qualified type.
+
+The fix is trivial since the returned strrchr() value is only used in
+a way compatible with const pointers. The data type was simply defined
+incorrectly.
+
+Reported-by: Aurelien Jarno <aurel32@debian.org>
+Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1128695
+Signed-off-by: John Ogness <john.ogness@linutronix.de>
+
+Upstream-Status: Backport [https://github.com/diamon/minicoredumper/commit/eb66f10ae26edf94bf41d513ce90a4eb1e0f11b3]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/coreinject/main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/coreinject/main.c b/src/coreinject/main.c
+index faf8edf..198485d 100644
+--- a/src/coreinject/main.c
++++ b/src/coreinject/main.c
+@@ -240,9 +240,9 @@ static int inject_data(FILE *f_core, FILE *f_symmap, const char *b_fname,
+ 	struct ident_data indirect;
+ 	struct ident_data direct;
+ 	const char *ident;
++	const char *p;
+ 	FILE *f_dump;
+ 	int err = 0;
+-	char *p;
+ 
+ 	/* extract ident name from file path */
+ 	p = strrchr(b_fname, '/');
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
index 44d85550ee..ff4fdf358e 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://run-ptest \
            file://0001-corestripper-Fix-uninitialized-warning.patch \
            file://0002-Fix-2038-year-problem-in-timestamp-handling.patch \
+           file://0001-coreinject-fix-assignment-of-const-qualified-type.patch \
            "
 
 

