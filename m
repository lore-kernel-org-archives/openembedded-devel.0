Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.3134.1599324974224355097
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iwOB1EJk;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id 17so6317595pfw.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BaJc4bG1GytzuVIryQ7nr4/RrsYkhN+XY2K7LEpOOug=;
        b=iwOB1EJkpERAGB4F/Dg8dNu87ynYSHLFIjfWh//g7ehbUxBlx8MHkUKk3Ivv+ZZNat
         Gxdl4h8SWIDm/DP+0tBPyKRg/R4gmmHSelr6O3OZT5aBHvJHT+sCUgz1X+LX4MtRuc1J
         pMhyr5rJSkkhnrUZwMHX3tUolQN/EZUtTOWs/KQQzuCjkhTDaA0IkWCi/MEEIPgnW/na
         jOsIn1Q4vCuK5mE3haaA0VfNwTbfnoieDsOKWes0BAvDJ62aj0QDJmTidcwmryT0n2/h
         o4nyq+rzNQQIdk9GhN4UfKRr+9h50x+Mj2X314MovVbq78dtZOT30jmS6Fphs4GZtpCe
         fXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BaJc4bG1GytzuVIryQ7nr4/RrsYkhN+XY2K7LEpOOug=;
        b=LXOwMFfoeeEpbZg4Dgp3ppQL6V0usYPmh+oOdhW7xN5CaBSSOmfDV8D+oIiAGf1pyx
         Dl+kO5+b/QydYKL5Sd7XELTWHNdLYW9K9bWBAMhRBrep4CFoQFyArjaYkqHaMFcNprXy
         PtOQDsDA7Z2isDqvgbd7fnYQS/K2ThUS3tk/Qs/PpZdRVJFJoHV4zpuF9YPQ23r1/ire
         NHaJn8GaJ6B1rbUaW3Ibjk8OL8jidCyeBA47LVqOzbXa2hwyQ4tlBBNP4/n93RsNLAnv
         0A1kEr4JlaDrPA2kA7M88fDOuhzne5jPWrTEEm/74sz1+JXzheMPE3ZQdz+WBV+OIGQp
         ZcsQ==
X-Gm-Message-State: AOAM531Ne+A27MqZIEqP193bkQkDaKXMUwcf2mEtwBlqVqXcZoTfDbEK
	iNx8GZX/wHAVT9wV4FFzuXEaSVQPUTQ=
X-Google-Smtp-Source: ABdhPJz03JcU5cjCYg3VWGHCeHGpFvjTKjXHcQMzGHgdY7d0HG1QWZwwdh/tOGWozbaDII06qZQzRw==
X-Received: by 2002:a62:38d6:: with SMTP id f205mr14072339pfa.83.1599324973503;
        Sat, 05 Sep 2020 09:56:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:12 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/20] flashrom: Fix build failure with glibc 2.32
Date: Sat,  5 Sep 2020 09:55:51 -0700
Message-Id: <40f4f3ed5f6f006c05f36f6dd846b788e1ec98fd.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f16aa16e917ea440daa3d5bd136338f66a964f5c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1

