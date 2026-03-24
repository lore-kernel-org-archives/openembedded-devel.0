Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69098F54ADF
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:10:53 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2552.1774372253171556110
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ElAWiVKB;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c0ecaae7dfso9200806eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372252; x=1774977052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=unVwG7y+vxTqecd+RTJQurKi+NowAd/f3sa3W5pkUlc=;
        b=ElAWiVKBo6bUD0paZs6uFSdJw5AKBWLFjnOSuQJrqGiA1ul0BM2Q03qxj8oZtDfvEo
         DJigEI3F3CFz6reHx4Bi0P5m28LKF/KS8LDPBGwbVHufYL+6vBfkqv9ECS0uzf5Yj83A
         kGZdShhivGn3yoDNknAALhtvenSIunNKMnRFkTR8eFZpQsmuk2hBYD5C0RXwY5BZ2e8W
         dLNP9DjQbGrGlsxz+yNtYq5MOrC9qcNl2DnJc4JT7y54uXSdwkCmCkHaM7uQMR7BLFlS
         fkGm5b5ax/EheFb++wuOWaiSDxfp5swyfscFseU85I2jQcjPw5GuVYlY0Pe+FfpTCaR2
         8I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372252; x=1774977052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unVwG7y+vxTqecd+RTJQurKi+NowAd/f3sa3W5pkUlc=;
        b=AOBa5f/KGpoFtFnMr2BIt2/eIJyRJW957CTpMuPDdEToyfSINEsBCBBos9Ya5xq373
         LJLYi3rF08fXSeLETQrKMm7TDPHKKN2KOGBLPEjVRIKlQJzauUOf2krUK8SZC/xJuhNA
         F4Mci7/Of3djkjDoIc8z9rzz3Ozc5huf7C04Wc0iDNkbkOk4QtEPKnXWAQQOU3OUgMmg
         iMc6TRSDrLZxPWnHgQCUZip+siFWgE27XFGMIfL9WezJfAcJAZneuJxcZED6QFO6gWBS
         hLLlkoSwugSPU1bQgLgKSm9AFfc53lcfyLlUHgrCCesjgs4wShbkc9gCVJHOdsXFzXnQ
         u0hA==
X-Gm-Message-State: AOJu0YwiMagGTovwE8DxJCbQimEbcxUuO5dUaQIRNwppaCKmTnVIpFjs
	2NoF91qoHtANPQFDhjx+b+zT+JvxggToWKHGz50UsVQRfzFFBgc4yy4TsZkoLlu1
X-Gm-Gg: ATEYQzxVSAsJ8WUFfM9lxLHo6exBTdW4bhBz1S+W3MUX85zWE0NS1lnUe8kPVHwLCas
	CgZdamNUnV7gDUcMAZ53Wdn4u5wLlZqSZobva0hbH47PAmiOY1hdv1ptZH4rZRzQJbqXMp9Pk7S
	pZlNTeoBUeicVsSd2fsmpsMfpxXgSPub+tx6n1eqDsAh3KqOghbX95GHoJTydpsA05zSjS4DrbE
	HbL2UT5tAMApuaKej8cc1vww0Bc3sWxqy6zoaBV0zp1LWN6MfgTnbb0d1kn6cGZ++UEOW3CDiHa
	bmQWMhiRkoB5x9nr8yBKjQ6Sa4KGO1NVtC3eSAv8tT7BA0KRg/jjXmt1aWpQmChhIS7dTGl3Iup
	MNajutDuPbhrD6ThQR06o/YCyr+C2j9tgsYNSrgvySYSUz1sGX7fsRrjYLuP8AfdoVo54wcaoyi
	+u0HNQPMw0/FDlZPRsTzunJ+hjxvvO4jzabcotg9tz1H1qfEKTIr0lK8vG/c37XcfexazPELtkd
	rO+QC9OrFpmrdkYT1cSbLzfTEPmGFlyEyTjDlUjfL1lJvdY8Lc3+Vg/DQI6
X-Received: by 2002:a05:7301:9f04:b0:2c0:ce11:770e with SMTP id 5a478bee46e88-2c15d2f7765mr104365eec.15.1774372251918;
        Tue, 24 Mar 2026 10:10:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14cadbsm18892414eec.3.2026.03.24.10.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:10:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] canopenterm: Disable pinning lua to expect c89
Date: Tue, 24 Mar 2026 10:10:49 -0700
Message-ID: <20260324171049.2282596-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 17:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125581

Fixes build with latest lua

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...o-not-pin-to-c89-constructs-on-linux.patch | 33 +++++++++++++++++++
 .../canopenterm/canopenterm_1.0.13.bb         |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm/0001-cmake-Do-not-pin-to-c89-constructs-on-linux.patch

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm/0001-cmake-Do-not-pin-to-c89-constructs-on-linux.patch b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-cmake-Do-not-pin-to-c89-constructs-on-linux.patch
new file mode 100644
index 0000000000..e6213c473d
--- /dev/null
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-cmake-Do-not-pin-to-c89-constructs-on-linux.patch
@@ -0,0 +1,33 @@
+From 694563e023a296ecfd4c73fac681509323c14ada Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 24 Mar 2026 10:01:59 -0700
+Subject: [PATCH] cmake: Do not pin to c89 constructs on linux
+
+This does not work with latest lua
+
+Fixes
+|    91 | #error "POSIX is not compatible with C89"
+|       |  ^
+| 1 error generated.
+| [44/51] Building C object CMakeFiles/crossline.dir/src/crossline/crossline.c.o
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ cmake/os_linux.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/os_linux.cmake b/cmake/os_linux.cmake
+index 7096cbd..ef18d56 100644
+--- a/cmake/os_linux.cmake
++++ b/cmake/os_linux.cmake
+@@ -56,7 +56,7 @@ if (BUILD_YOCTO)
+     if (LUA_FOUND)
+         include_directories(${LUA_INCLUDE_DIR})
+         set(PLATFORM_LIBS ${PLATFORM_LIBS} ${LUA_LIBRARIES})
+-        add_compile_definitions(LUA_USE_C89 LUA_USE_LINUX)
++        add_compile_definitions(LUA_USE_LINUX)
+     else()
+         message(FATAL_ERROR "Lua not found")
+     endif()
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
index a81ed30f72..25c7d97451 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
@@ -15,7 +15,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5f8a62fabd50ce3f1d7794bc849ae7a5"

 DEPENDS = "cjson libinih libsdl3 lua libsocketcan pocketpy"

-SRC_URI = "git://github.com/CANopenTerm/CANopenTerm.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/CANopenTerm/CANopenTerm.git;protocol=https;branch=main \
+           file://0001-cmake-Do-not-pin-to-c89-constructs-on-linux.patch"

 SRCREV  = "b0555360e5e8b444a2a9e14088fd253412184eb8"


