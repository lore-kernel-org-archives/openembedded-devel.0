Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.10603.1612638640816028904
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 11:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uy6Cp26y;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id q72so5402936pjq.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 11:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VzkDymLymV6Ga97wO70yYvAokE0+N33n21a94y9KqH0=;
        b=uy6Cp26yM5cTCYCZCa8zQ1oo6p30mHvVTQ/UykvR/aQVHLAypEiBQJoYefQ3DutTm4
         Ob7uWL1AL0HeOw3p386E+RMera8DQ2VaCYIhls9fi2MC+MaSHJ8Qbb5utfFgl1vpcWnP
         sUIoP81shwVaG6EQ48ryyRIvUzfZpY/3vhWzT2Ef5F8Ec+B4HqJPcKeL0z+u++uR7JPN
         EoSdpdRHCh6Iv/YdSTURvYYe2JWHRDpEZzx2egKncXhxmP0hQYoZzPP+C8UNtsX0bT7M
         7x6FpskaHI+65i6AF8w522v6mdBA866hxtUI1I+/owIAVNtblKhRJ6tn5pi0R0pU3ELP
         yhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VzkDymLymV6Ga97wO70yYvAokE0+N33n21a94y9KqH0=;
        b=BthEVHQ+c3X7OvoEjWnZ1b/bJTgPDGEQ3I4NRgZRBmQi7RDvnDRubSfoj87KBRhCSV
         G5AcOsA8bsBz7BTnws2lwfNi+L5hLD4IJIMvHe9AXT6d2Az2bn7M9j+IsZ5727irpYuU
         0uS526XeLhyAOPjt49Che7I3GWsC/hwEEnv4+EUw5LUWAwjeI5U6uPEhh22BAP4/JRUN
         qBehCevnqWLHAQ0eJpUkgko/KBPEtqQq2l2wrtM2gP0RvtMDxOilO56xUWiTPNKoQ+Gp
         ocmwloH2FvP2Glk93juD7XBIr72VIGhIc0qx+GqrgW0MlKCbDFcDNvNYHEKLvSarNbKs
         P8lg==
X-Gm-Message-State: AOAM532WXOjVgj1ZfMvamh10F33H+yMbuOKJ/leXuuyMQwk9XzjKyt9K
	O1A+hpMDYxHm8nOFLOC7fPY/5pKSylMEXw==
X-Google-Smtp-Source: ABdhPJzTeYoyAr+CEVJ49RxgzPTJC6oeD02XZvLDnw5sCpzgXoPsUCW/Du+o+kyREHQq6Ff2kVy/6Q==
X-Received: by 2002:a17:90a:5788:: with SMTP id g8mr3482933pji.219.1612638640178;
        Sat, 06 Feb 2021 11:10:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id 9sm13692906pfo.1.2021.02.06.11.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 11:10:39 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/2] kexecboot: Fix build with clang
Date: Sat,  6 Feb 2021 11:10:36 -0800
Message-Id: <20210206191036.402517-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210206191036.402517-1-raj.khem@gmail.com>
References: <20210206191036.402517-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 ...make-Add-compiler-includes-in-cflags.patch | 31 +++++++++++++++++++
 .../recipes-bsp/kexecboot/kexecboot_git.bb    |  6 ++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0001-make-Add-compiler-includes-in-cflags.patch

diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0001-make-Add-compiler-includes-in-cflags.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0001-make-Add-compiler-includes-in-cflags.patch
new file mode 100644
index 0000000000..931d0fa584
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0001-make-Add-compiler-includes-in-cflags.patch
@@ -0,0 +1,31 @@
+From 528a64d17488295299dad9fbfe3d7140bc1cfdfa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Feb 2021 11:06:48 -0800
+Subject: [PATCH] make: Add compiler includes in cflags
+
+Fixes
+| In file included from /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/kexecboot-klibc/0.6+gitAUTOINC+5a5e04be20-r0/recipe-sysroot/usr/lib/klibc/include/stdio.h:11:
+| /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/kexecboot-klibc/0.6+gitAUTOINC+5a5e04be20-r0/recipe-sysroot/usr/lib/klibc/include/stdarg.h:9:15: fatal error: 'stdarg.h' file not found
+| #include_next <stdarg.h>
+|               ^~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index c75df23..d2adf38 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,6 +1,6 @@
+ bin_PROGRAMS=kexecboot
+ 
+-kexecboot_CFLAGS = -I$(top_srcdir) $(AM_CFLAGS)
++kexecboot_CFLAGS = -I$(top_srcdir) $(AM_CFLAGS) -I$(shell $(CC) -print-file-name=include)
+ 
+ kexecboot_SOURCES = \
+ 	util.c \
+-- 
+2.30.0
+
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 2f46fa9523..ad9ccd02c6 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PV = "0.6+git${SRCPV}"
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/kexecboot/kexecboot.git"
-SRC_URI_append_libc-klibc = " file://0001-kexecboot-Use-new-reboot-API-with-klibc.patch "
-
+SRC_URI_append_libc-klibc = "\
+    file://0001-kexecboot-Use-new-reboot-API-with-klibc.patch \
+    file://0001-make-Add-compiler-includes-in-cflags.patch \
+"
 SRCREV = "5a5e04be206140059f42ac786d424da1afaa04b6"
 inherit autotools
 
-- 
2.30.0

