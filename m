Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 91B506069C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:45:54 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id a3so7610356pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eQswhf51mhndcwWiiatQIsSGQim2MkZq8vbGqGOuwkg=;
	b=spq+lsz0Em5RZAD1mnX1xim3A4ofJnMUXOfgtcsp/9DqzZIA3lYArTIclRZ/lqFAib
	yuYiuJ6eBQkxh+RACq0t/PpXLyQSxXWC6wrdfBJinW0d62yl37A/RQMxuSJkFYCzMZyZ
	nQmwzrO1pBektzNitnGkvTlAKG72YTzwOxVCfAjIpSeQhbqYozgldqL4+BtDy5isAvtu
	3XdwIiv6PBuXHEGw6qRMeErearz9uJQNhFuYNou9U1yQDhjegDBoNNW8WNu2A5P4DfXW
	Wm7N0Se0q1LORnTJbByqiFDfzg3Vhlv3ry4hnLeSbeSps8xmWiDTETs55GaFV5QeZRTu
	626Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eQswhf51mhndcwWiiatQIsSGQim2MkZq8vbGqGOuwkg=;
	b=CKBewzVJ5Wv0pM1YpS3i2j8EZ6lqTQNSNYCZXKR4oBL8tDm/k0hlvVk+8RQEhBIa+y
	FsPx8ezoi+cx7tM+k1PixfJj1UK5sLcjvVfJryUaXB4FkMtAQ+xsR9Z7b2eZEU4oQTxi
	c9m01mOo1BejTXlKXhwcdY7ObmeckrHIgayY26QeSYjbhoPL8PBH1RXRPsvcVK9QvcnC
	8jq5X2D5QzGi3hUfi9JciT4VGHRWSqCPd9dpQzONr/LJ2s+T3FhE67hYI0y9GgOoR6ec
	mupy/minNjseQQCYZdqVMhGE21Xf4iWpK777FMi2MSHG8+GhLmfLh+hLvBX/fpCUzUoq
	QhKw==
X-Gm-Message-State: APjAAAVyItstCzhuB3B2MpR+BBG2QT1TzfERAGQat3U3FR84MrjlGWPF
	5AvwxWdng6rEMffZqFr1SJ4OfXIw
X-Google-Smtp-Source: APXvYqwO37fssalgj2Ex1392DAb3p+nXBIdH9SxpgwV7WBHaPLFrWZEsfspwok8eKV3/xztSWtSRjw==
X-Received: by 2002:a63:7c07:: with SMTP id x7mr4844379pgc.284.1551851155097; 
	Tue, 05 Mar 2019 21:45:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.45.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:45:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:37 -0800
Message-Id: <20190306054548.16430-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 01/12] poco: Backport riscv support patch
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
X-List-Received-Date: Wed, 06 Mar 2019 05:45:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...riscv64-by-Manuel-A.-Fernandez-Monte.patch | 41 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.9.0.bb    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/0001-Support-of-arch-riscv64-by-Manuel-A.-Fernandez-Monte.patch

diff --git a/meta-oe/recipes-support/poco/poco/0001-Support-of-arch-riscv64-by-Manuel-A.-Fernandez-Monte.patch b/meta-oe/recipes-support/poco/poco/0001-Support-of-arch-riscv64-by-Manuel-A.-Fernandez-Monte.patch
new file mode 100644
index 0000000000..72d89d09b2
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0001-Support-of-arch-riscv64-by-Manuel-A.-Fernandez-Monte.patch
@@ -0,0 +1,41 @@
+From ed04c97abe015a226269de391e36c4d251292725 Mon Sep 17 00:00:00 2001
+From: Francis ANDRE <francis.andre.kampbell@orange.fr>
+Date: Sun, 6 May 2018 12:28:25 +0200
+Subject: [PATCH] Support of arch riscv64 by Manuel A. Fernandez Montecelo
+ <mafm@debian.org>
+
+---
+ Foundation/include/Poco/Platform.h | 6 +++++-
+ Foundation/src/utils.h             | 1 +
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+--- a/Foundation/include/Poco/Platform.h
++++ b/Foundation/include/Poco/Platform.h
+@@ -134,6 +134,7 @@
+ #define POCO_ARCH_NIOS2   0x0e
+ #define POCO_ARCH_AARCH64 0x0f
+ #define POCO_ARCH_ARM64   0x0f // same as POCO_ARCH_AARCH64
++#define POCO_ARCH_RISCV64 0x10
+ 
+ 
+ #if defined(__ALPHA) || defined(__alpha) || defined(__alpha__) || defined(_M_ALPHA)
+@@ -224,6 +225,9 @@
+ #elif defined(__AARCH64EB__)
+ 	#define POCO_ARCH POCO_ARCH_AARCH64
+ 	#define POCO_ARCH_BIG_ENDIAN 1
++#elif defined(__riscv) && (__riscv_xlen == 64)
++	#define POCO_ARCH POCO_ARCH_RISCV64
++	#define POCO_ARCH_LITTLE_ENDIAN 1
+ #endif
+ 
+ 
+--- a/Foundation/src/utils.h
++++ b/Foundation/src/utils.h
+@@ -63,6 +63,7 @@
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+     defined(__AARCH64EL__) || \
++    defined(__riscv) || \
+     defined(nios2) || defined(__nios2) || defined(__nios2__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
diff --git a/meta-oe/recipes-support/poco/poco_1.9.0.bb b/meta-oe/recipes-support/poco/poco_1.9.0.bb
index 258cc4994f..70b251034b 100644
--- a/meta-oe/recipes-support/poco/poco_1.9.0.bb
+++ b/meta-oe/recipes-support/poco/poco_1.9.0.bb
@@ -11,6 +11,7 @@ DEPENDS = "libpcre zlib"
 SRC_URI = " \
     git://github.com/pocoproject/poco.git;branch=poco-${PV} \
     file://0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch \
+    file://0001-Support-of-arch-riscv64-by-Manuel-A.-Fernandez-Monte.patch \
     file://run-ptest \
    "
 SRCREV = "daf00da73ab917e4d4581e3aa00c0ee61e0cc58b"
-- 
2.21.0


