Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.4135.1595539836558713986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 14:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NNWSv+oY;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id j19so3893958pgm.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2020 14:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UFLnGHmm+g6U7Kb5vhF8cf0GKvFETY/IQNIGGUa0750=;
        b=NNWSv+oYpEenXr0w/93kosU6tohZEFJnKMfyY+1n6zJUvXUGpPnPGSLcocMlawiJ3S
         ERZAYHhweLX55FMigKU1MaDGB4bgtQwW0KoaHpuR+C8fhLPw4RrGmi6cifsTtIswCXHl
         a9l7Cz2Du/KI2y9x+VUQTwYQhYUS7gGTlw+BcE9gMKgs1whqIPAxi3rCkGqVoXW7ySEl
         hr5NvwLbYKbuUGSptVIKcE6fTCBNpzgPBL6SQIDwGG5leA3OLcK33GHmsarF0J/xAdcX
         S+kmGuV2lrUaRBifdGXihFlwMiv/6IRiFI5Ys6agG7upEw5I76Kw9Heo+mVsfYAjwrqB
         /5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UFLnGHmm+g6U7Kb5vhF8cf0GKvFETY/IQNIGGUa0750=;
        b=fetX5msIBIAbdpkiqud44DPQ51yV8NCvkodQagyCMjcKiXAEqGDT1Zxst8/nMZX4eP
         EcxHi8FKEGA/LlAfaMa14+hri+VXZ2HxZF+wR/0Rjt43l/zUmDZSwypb3OnrOIxrmNUU
         Wo2pfkGRU6J5t6PLZaM6ugvYgh1aRrVKTebBFXFbhfUUh81OiCg/jxliLUjB4EZsW+Fe
         uG8TXZb0FHCPgWnNMqG4eAwF4RNXtTz9DtNppzcqjs0fZup7ql0oJ+LM6+0lAIJVfJE8
         x1VN10cn/JkHWui/665fLWbePos0tyfjdgDdfdeEoqvK+bKqNgyJtrFxzGocYTZlcvwA
         IfOg==
X-Gm-Message-State: AOAM532nHDQxKebFSFhjzVR82HC9q5xoFBQd6sJgu6pymMp2neUiCIyL
	AsnHZgoH1xNHF9wUbb/GNaK9s3Snmaw=
X-Google-Smtp-Source: ABdhPJzP4yX9WOpBMlWdoXz7opMBsDgMVhON27IfAPZNDCUY/y/1DzrzsRsgROvpTL8Mnx8VOzbJaQ==
X-Received: by 2002:a62:6491:: with SMTP id y139mr5913187pfb.102.1595539835489;
        Thu, 23 Jul 2020 14:30:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id j13sm3642595pjz.8.2020.07.23.14.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 14:30:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] flashrom: Fix build failure with glibc 2.32
Date: Thu, 23 Jul 2020 14:30:32 -0700
Message-Id: <20200723213032.3282325-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...or-last-line-only-from-preprocessed-.patch | 57 +++++++++++++++++++
 meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb  |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
new file mode 100644
index 0000000000..7a8be83746
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
@@ -0,0 +1,57 @@
+From 3c078497e506bd6acb406da5cde7ce20e8896353 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Jul 2020 14:13:59 -0700
+Subject: [PATCH] Makefile: Check for last line only from preprocessed output
+
+This started to fail with glibc 2.32 since glibc added additional
+attributes to functions in signal.h therefore existing regexp started to
+fail as it is not able to handle these functions e.g.
+
+extern int siginterrupt (int __sig, int __interrupt) __attribute__ ((__nothrow__ , __leaf__))
+  __attribute__ ((__deprecated__ ("Use sigaction with SA_RESTART instead")));
+
+grep -v '^\#' | grep '"' | cut -f 2 -d'"'
+bit outside of fd_set selected
+Use sigaction with SA_RESTART instead
+arm
+
+So changing it to
+tail -1 | grep '"' | cut -f 2 -d'"'
+arm
+
+Produces the expected result, this was hidden until now
+
+Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/43770]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Change-Id: I123a046e142d54632f12d54e2aa09b0928c02b91
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 803529f..3795681 100644
+--- a/Makefile
++++ b/Makefile
+@@ -106,7 +106,7 @@ endif
+ # IMPORTANT: The following line must be placed before TARGET_OS is ever used
+ # (of course), but should come after any lines setting CC because the line
+ # below uses CC itself.
+-override TARGET_OS := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E os.h 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
++override TARGET_OS := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E os.h 2>/dev/null | tail -1 | grep '"' | cut -f 2 -d'"'))
+ 
+ ifeq ($(TARGET_OS), Darwin)
+ override CPPFLAGS += -I/opt/local/include -I/usr/local/include
+@@ -460,8 +460,8 @@ endif
+ # IMPORTANT: The following line must be placed before ARCH is ever used
+ # (of course), but should come after any lines setting CC because the line
+ # below uses CC itself.
+-override ARCH := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E archtest.c 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
+-override ENDIAN := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E endiantest.c 2>/dev/null | grep -v '^\#'))
++override ARCH := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E archtest.c 2>/dev/null | tail -1 | grep '"' | cut -f 2 -d'"'))
++override ENDIAN := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E endiantest.c 2>/dev/null | tail -1))
+ 
+ # Disable the internal programmer on unsupported architectures (everything but x86 and mipsel)
+ ifneq ($(ARCH)-little, $(filter $(ARCH),x86 mips)-$(ENDIAN))
+-- 
+2.27.0
+
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
index 642cec1598..66ae34af94 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
@@ -7,6 +7,7 @@ DEPENDS = "pciutils libusb libusb-compat"
 
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
            file://0001-typecast-enum-conversions-explicitly.patch \
+           file://0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch \
            "
 SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
 SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
-- 
2.27.0

