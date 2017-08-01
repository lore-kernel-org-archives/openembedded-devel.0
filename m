Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id C8B7278355
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Aug 2017 14:16:06 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y129so2901877pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Aug 2017 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/zpBwS9P10aKCjtaYWrLsZssp2SvoJFHSfLyKtknkjQ=;
	b=HIFZ/YjZ6jPzgmnir3+uHBPKta1C4aVpXnYNiBfhQZCrrnjykT3DgbbwkZBb3mf4Hg
	TE8XRpIm/+pfOa3adulkRiR9Mo46HG3bpBoPc21SRxkoZvBOyn8NIQ9a6rcTJycVA27C
	DFVLeMBjFoDvrAF32QUbyZhEarxsalTHLocReNIzXyKx4oZxZC12zjli9FJLxcf7W44v
	M7ZCs+BaBhyBP5C0DI1HyMNry3tsqJIOK7fBP7DsCoRRWZaU6lqrFksK6GGFQm70SekG
	YXKLkYqnIe+hDBqRo8uY7D86YJaiYNV3MGTc5we4XJu8okyEgnTapz3zAB6mHT8gNb7T
	JmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/zpBwS9P10aKCjtaYWrLsZssp2SvoJFHSfLyKtknkjQ=;
	b=B5uRiFUUpzyq5Y/ZQ++2lq3tQciUgFcBN4EppDQQy1uvbjR3/alJgNxxLwgILTXZh5
	17fVrbkHkNScToT4IUuUZiQMU601lgpwtNpLHQmseFl3z0UzQqcYJ+uBSRomrKiyiY8i
	jQOrr3E+egEUmj1VFAhS6LdbDaV2Q2CGlnuGU58NWfngp1ILDoQZOhFrNOxpAvfCllTY
	fhlPNcjK65baqtAHBMv2cPvVc4YCLcVoKqwNQFJB6rEAwgrQgC273r5cd9u2sZ33TJO1
	yGgoqRl42lTgDTFDUenTpCrd5mI1RYp4PzQ42xV1KdDEVO/kWIJiK7EA42sAEqI8EX2H
	lWCw==
X-Gm-Message-State: AIVw111pBEWfkeWqXjX0hb6CWFybxOogEvRCGCwlbIZpHM6mlgYd2ST/
	Zx7hZ+ovJnXo5KSF
X-Received: by 10.99.65.196 with SMTP id o187mr19182218pga.193.1501596967883; 
	Tue, 01 Aug 2017 07:16:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	l17sm58510561pfk.146.2017.08.01.07.16.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 07:16:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Aug 2017 07:15:56 -0700
Message-Id: <20170801141559.17067-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-initramfs][PATCH 1/4] klibc: Fix build with clang
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
X-List-Received-Date: Tue, 01 Aug 2017 14:16:06 -0000

Remove gcc specific options use common one instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...c-Use-print-libgcc-file-name-instead-of-p.patch | 30 ++++++++++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |  5 ++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
new file mode 100644
index 000000000..41cc14275
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
@@ -0,0 +1,30 @@
+From f66edde8a704131d98e8783ea8d4c848e8119b20 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 26 Jul 2017 16:13:16 -0700
+Subject: [PATCH 1/3] Kbuild.klibc: Use -print-libgcc-file-name instead of
+ --print-libgcc
+
+-print-libgcc-file-name works with clang and gcc unlike --print-libgcc
+which is gcc specific
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/Kbuild.klibc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/Kbuild.klibc b/scripts/Kbuild.klibc
+index f500d535..101f86f5 100644
+--- a/scripts/Kbuild.klibc
++++ b/scripts/Kbuild.klibc
+@@ -128,7 +128,7 @@ KLIBCCFLAGS      += $(KLIBCCPPFLAGS) $(KLIBCREQFLAGS) $(KLIBCARCHREQFLAGS)  \
+ KLIBCAFLAGS      += -D__ASSEMBLY__ $(KLIBCCFLAGS)
+ KLIBCSTRIPFLAGS  += --strip-all -R .comment -R .note
+ 
+-KLIBCLIBGCC_DEF  := $(shell $(KLIBCCC) $(KLIBCCFLAGS) --print-libgcc)
++KLIBCLIBGCC_DEF  := $(shell $(KLIBCCC) $(KLIBCCFLAGS) -print-libgcc-file-name)
+ KLIBCLIBGCC	 ?= $(KLIBCLIBGCC_DEF)
+ KLIBCCRT0        := $(KLIBCOBJ)/arch/$(KLIBCARCHDIR)/crt0.o
+ KLIBCLIBC        := $(KLIBCOBJ)/libc.a
+-- 
+2.13.3
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index cd3f39808..45dc6baef 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -17,6 +17,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
            file://0001-include-linux-sysinfo.h-directly.patch \
            file://0001-mkfifo-Implement-mkfifo.patch \
            file://0001-always-use-bfd-linker.patch \
+           file://0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch \
 "
 
 ARMPATCHES ?= ""
@@ -48,6 +49,10 @@ do_configure () {
     ln -sf "${STAGING_DIR_TARGET}${exec_prefix}" linux
 }
 
+do_configure_prepend_toolchain-clang() {
+    sed -i -e 's#$(KLIBCROSS)gcc#$(KLIBCROSS)clang#g' ${S}/Makefile
+}
+
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN} = "already-stripped"
-- 
2.13.3


