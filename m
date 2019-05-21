Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 96A1B7E182
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 06:55:36 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a5so7927427pls.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hwOxC25EsZgo6nW9+xLtFdFxgrzukAzedtbHXFHyj+A=;
	b=cyF5BGcwXBwNB+hkz977OXZGvV2J60+7SZAk3ycw4hJ039wLtpY4+old9Of7Uv8MSD
	pdB72qftb5Mscikx27PDQqbM0EMr+Rt3b/duunD3HpDm7a7Zj1O0Sii4bJ7ks/Arfl2i
	o5nBZGTJICR86xCpZQt/o75rqlnADnb1hYqfuMQh0ZtLEWXOZy+a1jFlhf+wmkyH+3I2
	J1cxhm0pKp454utT8womg17B/TrXzZUInwywMayC2Hloo/Ewif/BAizdQaqKzx0agLqi
	xVxbqReeNBJHLe/B0sGc+97hH2nLHwDjYssLYn4egGPx2uDltWcfvxiDXPbpNjFnu1FC
	fZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hwOxC25EsZgo6nW9+xLtFdFxgrzukAzedtbHXFHyj+A=;
	b=D8wsAQmOawZ9uCBAQSMNU9Fn5EkH4LHbw31SEFuCJvUVXqg7idagKXXTZ3iVLczjwK
	wbPjHDvigcYN3UfcV3xPDbbEjGyC4e9u3mRrqL9vrTJxvXlD9ezk6ACWd9Sf5LIPYmCW
	n01VF99liAZJUH0x6GPYvbsCbKNQYclf8l9/v+Jb07KrTXGqXvuxSOwKmwMBA9lLxi4x
	hh91wbJRTAmvOFXWFtQ/LNu6oOK7pSVm9gj41KATm1jw7JBr69IkNFzn9R1BDdOadnlR
	/vvAprOl4w+ead393EHBigzmwkA+3ozmL4Fmq+MaQK0+qcfaHAWctzG7orqGijZfcVho
	KNlg==
X-Gm-Message-State: APjAAAU74CZfk2U4tmiivsag8O40z77xVlfnwBalj0gjZXFxmgSmhyRo
	bsf+pdQYKtRfs3pwhrDUBBJwGM4ptpA=
X-Google-Smtp-Source: APXvYqw7cYN4l366KYphJrAAtF5zwn0Q9AVEdagEdRfWUJBbbkoYeJQDBmQ9wRWmYxnGaupUmQbd8w==
X-Received: by 2002:a17:902:442:: with SMTP id
	60mr42399378ple.325.1558421737603; 
	Mon, 20 May 2019 23:55:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3506])
	by smtp.gmail.com with ESMTPSA id
	l21sm28100673pff.40.2019.05.20.23.55.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 23:55:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 23:55:29 -0700
Message-Id: <20190521065529.41647-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521065529.41647-1-raj.khem@gmail.com>
References: <20190521065529.41647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] openocd: Fix build on x86_64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2019 06:55:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fine-PAGE_SIZE-if-its-not-already-de.patch | 37 +++++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Define-PAGE_SIZE-if-its-not-already-de.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Define-PAGE_SIZE-if-its-not-already-de.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Define-PAGE_SIZE-if-its-not-already-de.patch
new file mode 100644
index 0000000000..6fe5b27891
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Define-PAGE_SIZE-if-its-not-already-de.patch
@@ -0,0 +1,37 @@
+From 531c96b4fd99ea046750591af36c5b3f92479fa6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2019 23:24:26 -0700
+Subject: [PATCH] esirisc_flash: Define PAGE_SIZE if its not already defined
+
+Fixes
+| src/flash/nor/esirisc_flash.c:95:9: error: 'PAGE_SIZE' macro redefined [-Werror,-Wmacro-redefined]
+| #define PAGE_SIZE                       4096
+|         ^
+| /mnt/a/yoe/build/tmp/work/core2-64-yoe-linux-musl/openocd/0.10+gitrAUTOINC+7ee618692f-r0/recipe-sysroot/usr/inclu
+de/limits.h:89:9: note: previous definition is here
+| #define PAGE_SIZE PAGESIZE
+
+Change-Id: I195b303fc88a7c848ca4e55fd6ba893796df55cc
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted [http://openocd.zylin.com/#/c/5180/]
+---
+ src/flash/nor/esirisc_flash.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/flash/nor/esirisc_flash.c b/src/flash/nor/esirisc_flash.c
+index 4e33b9429..90661b77b 100644
+--- a/src/flash/nor/esirisc_flash.c
++++ b/src/flash/nor/esirisc_flash.c
+@@ -92,7 +92,9 @@
+ #endif
+ 
+ #define CONTROL_TIMEOUT		5000		/* 5s    */
++#ifndef PAGE_SIZE
+ #define PAGE_SIZE			4096
++#endif
+ #define PB_MAX				32
+ 
+ #define NUM_NS_PER_S		1000000000ULL
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 9a8a09a913..9054e69b6c 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl \
     git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
+    file://0001-esirisc_flash-Define-PAGE_SIZE-if-its-not-already-de.patch \
 "
 
 SRCREV_FORMAT = "openocd"
-- 
2.21.0


