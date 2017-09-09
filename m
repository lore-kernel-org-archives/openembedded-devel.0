Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 71B9271994
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Sep 2017 06:28:40 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id v82so2235906pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Sep 2017 23:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qR/zwJAnkNciYW/xg2X7ZDXPbVPzM8woQUioIn1roYg=;
	b=aLM18A2qZTHSs61j/Pjzps7iVhndkaqCeFOe09nUkO0SeN80doe6kSWFGQkl6hVr4q
	O/pcDIw5/XdO3EP2xorijftd/bq6mBnGTu6JsY9EYtE17UHozj53zc832jvSAiqi39Iu
	V/mcVs/aCZPiI/8dVPYflg9n1tna+0dtT+TveJUoqoWeoB/uS68Y/6/QvHRNJ8aMfwFy
	i9wF43FH480n4uEcm0Pp4hnDi6m4MYePelGPMMbxG6AY0uAvBP69KATKGAAUz8Xt13AQ
	wRHqilYOCX6PED0U+iSLEfUButWV85v7LLlcZcaFOrn8B3BtFDJWulDZ6liiZcH2PsVN
	dRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qR/zwJAnkNciYW/xg2X7ZDXPbVPzM8woQUioIn1roYg=;
	b=eqVupC4C+hJWNxcqC8KhlvTgmwoqVkQd90+IDOWn/gtuVH95yR85YZGTPiiXKrsT+c
	U2JfP8wGjAF7e776aw20lUbu4cCew1XI3Uxlq56VqqHpd7PTPXloiwiysXy0GU+VPMHN
	IPrk3k2AH4MLdYxmVpu6FPHhVnnU20kzt8r+zXJ3ZCH6J3X35V6wwzckf5WzFTK1tlbb
	dwugQDif9Omn8atK+JT6o5+TEKwCMkLcCnKjFSv087goht1r+Ydfwcdmv/vbnX75LZY5
	HLlW/3d6cJYJW3mqiTAzGNxDjd4tg405BYAqjp2u1wXLgwiFoi6IsEBkxb2eruxwstRT
	0mYw==
X-Gm-Message-State: AHPjjUjlsR4rDInV8qfYuY89/7NbwiapROzoobtJ4hY78KKAkfrLRMPO
	T1JqWNuOSOjI5CVn
X-Google-Smtp-Source: ADKCNb7X2puNA0Rv1FMSfB5U972RAumN3nEglOJWYWI+x++ScRwwRV9C8fa6aL9p2wgZXSy2V4Piog==
X-Received: by 10.98.35.209 with SMTP id q78mr5686561pfj.36.1504938521663;
	Fri, 08 Sep 2017 23:28:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id
	b75sm6706150pfc.29.2017.09.08.23.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 23:28:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Sep 2017 23:28:29 -0700
Message-Id: <20170909062829.13084-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-initramfs][PATCH] klibc: Fix include_next stdarg.h with clang
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
X-List-Received-Date: Sat, 09 Sep 2017 06:28:40 -0000

Fixes build

git/usr/klibc/../include/stdarg.h:9:15: fatal error: 'stdarg.h' file not found
| #include_next <stdarg.h>
|               ^~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...c-Add-path-to-compiler-headers-via-isyste.patch | 30 ++++++++++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
new file mode 100644
index 000000000..7cd4c0e49
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
@@ -0,0 +1,30 @@
+From 10fb440795a7796140bd657ee028847ec7c34447 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Sep 2017 23:10:54 -0700
+Subject: [PATCH] Kbuild.klibc: Add path to compiler headers via -isystem
+
+We need to include this path so it can find compiler headers e.g.
+stdarg.h which is called from wrapper stdarg.h using include_next
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/Kbuild.klibc | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/Kbuild.klibc b/scripts/Kbuild.klibc
+index f500d535..1d5cdc43 100644
+--- a/scripts/Kbuild.klibc
++++ b/scripts/Kbuild.klibc
+@@ -105,7 +105,8 @@ KLIBCOBJCOPY     := $(OBJCOPY)
+ KLIBCOBJDUMP     := $(OBJDUMP)
+ 
+ # klibc include paths
+-KLIBCCPPFLAGS    := -nostdinc -iwithprefix include \
++KLIBCCPPFLAGS    := -nostdinc -iwithprefix include      \
++		    -isystem $(shell $(CC) -print-file-name=include) \
+ 		    -I$(KLIBCINC)/arch/$(KLIBCARCHDIR)	\
+                     -I$(KLIBCINC)/bits$(KLIBCBITSIZE)	\
+ 		    -I$(KLIBCOBJ)/../include		\
+-- 
+2.14.1
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 45dc6baef..ed15b2e1e 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -18,6 +18,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
            file://0001-mkfifo-Implement-mkfifo.patch \
            file://0001-always-use-bfd-linker.patch \
            file://0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch \
+           file://0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch \
 "
 
 ARMPATCHES ?= ""
-- 
2.14.1


