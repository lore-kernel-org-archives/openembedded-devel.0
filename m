Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.296.1623866381791846738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 10:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tcvlBlHb;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d62so848380pfd.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 10:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bNnmECiPk86NKcloqy/eEYkBWDL8MX7eXvwKSJ0iOGo=;
        b=tcvlBlHbJtoxVnkAqvV+dw2tGJeg/qnlMB0ZBR3rkUnzKxhh72oKmOmx96B9bYGC4M
         p/95l2lJs0iJdDnK7Rh2/UfTDFGfRG+iI71zv29GYRJ1Jv6F9serqtNDB8D8GRw4TiQ6
         UBAbSggHHvYeagYAtmDvkNO/F3gk9fqUv+bgmHWYez/bQnOTZT3QPnq3mqZHp/hRZE49
         d8VxU647qKu090LoL1xqlzNMh3JX1Yz7q/WyfT1cx2z/6KUcSFJ0c8ru1J5Eh8QCJjm+
         moD/RWdfCeDVuHf7+NvilbCMl16rxTUN8f6zvjsZixrOuQwI8KjWS+QNYXDtlOxYgTe4
         wciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bNnmECiPk86NKcloqy/eEYkBWDL8MX7eXvwKSJ0iOGo=;
        b=ZvRN0VZkSljq7mZDz8DPY5lXZ8gOQiAA4GaEZcXl/57AoPlv5I5+z/cGlKpwJK8Pdy
         1hsr0cASGth+HgC8fFK6aaFplb9vlRjco4aNGZHXm3OtKOhl5SdW8Sl7gQZNRT7CCofw
         rzaAMnNQ5vZYSmVlu5MjJjHafIN5QTR8jV73lH/r8G/8pzLD1hwNcwYVUR/IHaK4zgl8
         FESNM9u6kTbPBZGt3md59jsXDjFqEUah+FCwpEmBytI97GQ3wKfuD4/PAJaJlaKh4a8Y
         8hgtecgg3OS7ITc+jqlMkuGKxiCD/cuxJohrpmZ7O14NcVsRoDZyonvIhQhzNZCgkmc2
         2kBw==
X-Gm-Message-State: AOAM530O+LSLLJ0HmpUlCYq+0x4q4tecGcQf8mqNc6mVtZoOlDsSPMRd
	O3TkqhnjAIirPuk4NjQslz7uI0hynyo5FQ==
X-Google-Smtp-Source: ABdhPJwQLRUpXmWsJAWNyGr7s21hRGsyetd5xEaMpVTMbL5fcGdI3ZhW5uFPjzExUAHgTGdiu/b/3Q==
X-Received: by 2002:a62:1d0f:0:b029:2d5:3ec2:feb8 with SMTP id d15-20020a621d0f0000b02902d53ec2feb8mr923863pfd.19.1623866381081;
        Wed, 16 Jun 2021 10:59:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id y7sm2872982pfy.153.2021.06.16.10.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:59:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/9] flashrom: Fix build with clang
Date: Wed, 16 Jun 2021 10:59:31 -0700
Message-Id: <20210616175937.323664-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616175937.323664-1-raj.khem@gmail.com>
References: <20210616175937.323664-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
warning: implicit declaration of function 'asm' is invalid in C99 [-Wimplicit-function-declaration]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ess-use-__asm__-as-is-done-elsewhere.patch | 52 +++++++++++++++++++
 meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch
new file mode 100644
index 0000000000..f3316aa264
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch
@@ -0,0 +1,52 @@
+From 3334dd4e9fc34c79c3925c3c24869939d8955f21 Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Sat, 18 Jul 2020 12:16:00 -0700
+Subject: [PATCH] hwaccess: use __asm__ as is done elsewhere
+
+Fixes compilation under powerpc platform. Made the change for the SPARC
+platform as well.
+
+../hwaccess.c: In function 'sync_primitive':
+../hwaccess.c:74:2: warning: implicit declaration of function 'asm'
+ [-Wimplicit-function-declaration]
+   74 |  asm("eieio" : : : "memory");
+      |  ^~~
+../hwaccess.c:74:13: error: expected ')' before ':' token
+   74 |  asm("eieio" : : : "memory");
+
+Upstream-Status: Submitted [https://github.com/flashrom/flashrom/pull/155]
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ hwaccess.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hwaccess.c b/hwaccess.c
+index 48ccb34..2a39989 100644
+--- a/hwaccess.c
++++ b/hwaccess.c
+@@ -71,18 +71,18 @@ static inline void sync_primitive(void)
+  * See also https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/memory-barriers.txt
+  */
+ #if IS_PPC // cf. http://lxr.free-electrons.com/source/arch/powerpc/include/asm/barrier.h
+-	asm("eieio" : : : "memory");
++	__asm__ ("eieio" : : : "memory");
+ #elif IS_SPARC
+ #if defined(__sparc_v9__) || defined(__sparcv9)
+ 	/* Sparc V9 CPUs support three different memory orderings that range from x86-like TSO to PowerPC-like
+ 	 * RMO. The modes can be switched at runtime thus to make sure we maintain the right order of access we
+ 	 * use the strongest hardware memory barriers that exist on Sparc V9. */
+-	asm volatile ("membar #Sync" ::: "memory");
++	__asm__ volatile ("membar #Sync" ::: "memory");
+ #elif defined(__sparc_v8__) || defined(__sparcv8)
+ 	/* On SPARC V8 there is no RMO just PSO and that does not apply to I/O accesses... but if V8 code is run
+ 	 * on V9 CPUs it might apply... or not... we issue a write barrier anyway. That's the most suitable
+ 	 * operation in the V8 instruction set anyway. If you know better then please tell us. */
+-	asm volatile ("stbar");
++	__asm__ volatile ("stbar");
+ #else
+ 	#error Unknown and/or unsupported SPARC instruction set version detected.
+ #endif
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
index 145a3cad02..1d06132144 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
            file://0001-typecast-enum-conversions-explicitly.patch \
            file://meson-fixes.patch \
            file://0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch \
+           file://0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch \
            "
 SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
 SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
-- 
2.32.0

