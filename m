Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8396E77B6E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 18:58:37 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id d193so18107068pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+hA67uAWcS6j6Wou2BUrPQYR6j4EHYSSNHES4Ugogn0=;
	b=hHi/AkAWr1zR2qEHs7kQ8caCTvMMPWzWjpYoAOpRtVQj5l/SlaJFSB/rZhA/4LyGME
	4wjXinFSyo9dZIfASIvdg6UxbcLtl3liO9cV3Zr6fxj19qA4Cb269Y8heZD/XevQqX4m
	x3vfqlvoplX9Js/2Ews+84MORiFt9guVBQD0PtLaoL7dugYyP4yqacw0WG1ige71bls6
	Ji7TEkea66xOkw1CnbhPTzGM8HHW5EFmv3Y2+XiMQEpL2X/jAvPs1XAEgzwIKGIHjQ5H
	b5o5quUXzMssvTlDKsRT6qCLq2GsVMT4RcOzgNthbD77WQDYjorTFj4LTHmKwthWUZ9V
	XAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+hA67uAWcS6j6Wou2BUrPQYR6j4EHYSSNHES4Ugogn0=;
	b=Bcc44WKlPJW3jBxGpIEkUC5vWol5UIZVXAudXxiMjdCLy0iSfBYmhZQvdOXs2IuZxF
	zPR+tEohatmgUot2Ud2/6KVVxryofUuUxVEd9Bhllu37xqGL0GSmct5MO2TxKWs2RlaC
	/1/GBxQnHC5Jw+IGQOWqUVyg4PiYMJB+Vf4hXcPK1CLHUAwxkxlCH5Or51VijOXxY0FQ
	LfZ8rZfgDLRk4kVZyojXsvm4PuPq69UAOsQaUyRwotDur3KCML0vA+t58tJtHMRXQ6l6
	7U61YGfRGveCOp1TGsuLfgxi0SRkroD+Ms/z4HfHcbkV26quzrxjxBFVvillSaZnIGyY
	f10A==
X-Gm-Message-State: AIVw111aiZJcwWbxNUPJLyPtpx9MbpmpiwrlzTN84Yco+xhwpG/3Sx+7
	Gouo9PMCSniN2f6E
X-Received: by 10.98.218.84 with SMTP id w20mr1724375pfl.240.1501095518465;
	Wed, 26 Jul 2017 11:58:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	s15sm33245864pfk.42.2017.07.26.11.58.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 11:58:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jul 2017 11:58:15 -0700
Message-Id: <20170726185815.8898-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170726185815.8898-1-raj.khem@gmail.com>
References: <20170726185815.8898-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/7] flashrom: Fix build with clang
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
X-List-Received-Date: Wed, 26 Jul 2017 18:58:37 -0000

Backport a patch from staging

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../flashrom/0001-Remove-undefined-behavior.patch  | 82 ++++++++++++++++++++++
 .../recipes-extended/flashrom/flashrom_0.9.9.bb    |  3 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0001-Remove-undefined-behavior.patch

diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0001-Remove-undefined-behavior.patch b/meta-oe/recipes-extended/flashrom/flashrom/0001-Remove-undefined-behavior.patch
new file mode 100644
index 000000000..51397dc55
--- /dev/null
+++ b/meta-oe/recipes-extended/flashrom/flashrom/0001-Remove-undefined-behavior.patch
@@ -0,0 +1,82 @@
+From d2a03b3e43043b596a79803bcb93f70e513bbb50 Mon Sep 17 00:00:00 2001
+From: Patrick Georgi <pgeorgi@google.com>
+Date: Mon, 13 Mar 2017 13:48:03 +0100
+Subject: [PATCH] Remove undefined behavior
+
+Per clang-3.9, the compiler fails on #define ...defined(...) statements
+as they're undefined behavior (apparently with different behavior
+between gcc/clang and msvc, too).
+
+See clang's cfe repo commit r258128 for details.
+
+Change-Id: I82b6235e11b425fae45eebbe06b08f81c5bdbb98
+Signed-off-by: Patrick Georgi <pgeorgi@google.com>
+Reviewed-on: https://review.coreboot.org/18792
+Reviewed-by: Stefan Reinauer <stefan.reinauer@coreboot.org>
+Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
+---
+ hwaccess.c | 18 +++++++++++++++---
+ platform.h | 18 +++++++++++++++---
+ 2 files changed, 30 insertions(+), 6 deletions(-)
+
+diff --git a/hwaccess.c b/hwaccess.c
+index aede7e3..2bf6f42 100644
+--- a/hwaccess.c
++++ b/hwaccess.c
+@@ -37,9 +37,21 @@
+ #error "Unknown operating system"
+ #endif
+ 
+-#define USE_IOPL	(IS_LINUX || IS_MACOSX || defined(__NetBSD__) || defined(__OpenBSD__))
+-#define USE_DEV_IO	(defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__))
+-#define USE_IOPERM	(defined(__gnu_hurd__))
++#if IS_LINUX || IS_MACOSX || defined(__NetBSD__) || defined(__OpenBSD__)
++#define USE_IOPL 1
++#else
++#define USE_IOPL 0
++#endif
++#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
++#define USE_DEV_IO 1
++#else
++#define USE_DEV_IO 0
++#endif
++#if defined(__gnu_hurd__)
++#define USE_IOPERM 1
++#else
++#define USE_IOPERM 0
++#endif
+ 
+ #if USE_IOPERM
+ #include <sys/io.h>
+diff --git a/platform.h b/platform.h
+index c5a52ef..b2fdcd0 100644
+--- a/platform.h
++++ b/platform.h
+@@ -25,9 +25,21 @@
+ #define __PLATFORM_H__ 1
+ 
+ // Helper defines for operating systems
+-#define IS_LINUX	(defined(__gnu_linux__) || defined(__linux__))
+-#define IS_MACOSX	(defined(__APPLE__) && defined(__MACH__)) /* yes, both. */
+-#define IS_WINDOWS	(defined(_WIN32) || defined(_WIN64) || defined(__WIN32__) || defined(__WINDOWS__))
++#if defined(__gnu_linux__) || defined(__linux__)
++#define IS_LINUX 1
++#else
++#define IS_LINUX 0
++#endif
++#if defined(__APPLE__) && defined(__MACH__) /* yes, both. */
++#define IS_MACOSX 1
++#else
++#define IS_MACOSX 0
++#endif
++#if defined(_WIN32) || defined(_WIN64) || defined(__WIN32__) || defined(__WINDOWS__)
++#define IS_WINDOWS 1
++#else
++#define IS_WINDOWS 0
++#endif
+ 
+ // Likewise for target architectures
+ #if defined (__i386__) || defined (__x86_64__) || defined(__amd64__)
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-extended/flashrom/flashrom_0.9.9.bb b/meta-oe/recipes-extended/flashrom/flashrom_0.9.9.bb
index 1bd97929c..4cdd8ad23 100644
--- a/meta-oe/recipes-extended/flashrom/flashrom_0.9.9.bb
+++ b/meta-oe/recipes-extended/flashrom/flashrom_0.9.9.bb
@@ -3,11 +3,12 @@ LICENSE = "GPLv2"
 HOMEPAGE = "http://flashrom.org"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "pciutils libusb"
+DEPENDS = "pciutils libusb libusb-compat"
 
 SRC_URI = "http://download.flashrom.org/releases/flashrom-${PV}.tar.bz2 \
            file://0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch \
            file://sst26.patch \
+           file://0001-Remove-undefined-behavior.patch \
            "
 SRC_URI[md5sum] = "aab9c98925d9cfb5ffb28b67a6112530"
 SRC_URI[sha256sum] = "cb3156b0f63eb192024b76c0814135930297aac41f80761a5d293de769783c45"
-- 
2.13.3


