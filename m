Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E17C678DB
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 21:19:14 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.20975.1676755152081428290
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 13:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fPkRTrjs;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id r12so526064pjm.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 13:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AcQWEUlIhTRiFaMyKSz41dXm/8ZH0pcmfF8Ibeh5SHA=;
        b=fPkRTrjsjr4S+eC1IqxsH9REsM/LGPe4TbMm8glW0+mloNQ3ZXYS8rjIOlOt9rdqEk
         ON58OzxXqu58zJw3ga3p5xGwKHlrM7kO1PrO8w6kM6e10qjyl096G9WQUcouF5UVskz1
         A89ogoccc3XRGJVB9JjLX+PEFfXAetXUbHaN2Cz5NHqAPlJwElU1WuhrZoDXcJekCV76
         Auavjh6TFBY1Gr9rlBzD/H5pkOpJDudhX2oHxZbot3cnwqm7TQFEWeTBTdlHijdT9NUv
         vOeNMZ25yvRyVkvzlXai0EqT1LJrCd36KjRDCByLDzsdWaD098zYLp4XNg2tmrah1/Q/
         tOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcQWEUlIhTRiFaMyKSz41dXm/8ZH0pcmfF8Ibeh5SHA=;
        b=JFz5g7MqjTAC9KN4xUZeuzQtDLjO+78nY47POQaB1+rkGlLc0INK8mi1EUIxSBEqTT
         oSMa3Qm42kfy9SsdF/GhkNQh4zsv3+5eqGfDdVgT2s7Ow2S1msmUTp1ehxVXzsCnAv4M
         +y9YXmWinshqv7c8XPgcW0R+RjxFX3aYj3b/puVHYSQO9rhgpcLuCnhU0O2MXbGEn0FT
         n4qTz6ZyNxkAE325CBlixv/ImxqxJxHrqNQpbss2EeTgW1N+M0B15bMvSDRSFR4yDYy1
         OPTkh0kHc5HVLUUmWnOW9Cdk7b/l+Mrzjd0xKVic984Yp9UJvWDyaWJnsADqI+XaEGwa
         ry5Q==
X-Gm-Message-State: AO0yUKUbBo3S+HPGtVJl7tceav7fo/zaPS/t8PvBp7AkXKKqfECsmE1V
	iZBsp9zEmGNoqbodWAvFb2XF11JYOPE=
X-Google-Smtp-Source: AK7set91ukdBM4anoYyxVo961Fm2KFauklX4J7lAP6u19krD/D4aiiy42bWLOgGHos3LoEcI4RqLvg==
X-Received: by 2002:a17:902:ebcc:b0:19a:b588:6fe2 with SMTP id p12-20020a170902ebcc00b0019ab5886fe2mr1488680plg.13.1676755150742;
        Sat, 18 Feb 2023 13:19:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::112a])
        by smtp.gmail.com with ESMTPSA id g7-20020a170902740700b0019a9637b2d3sm1356606pll.279.2023.02.18.13.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 13:19:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] glog: Fix build with clang on 32bit platforms
Date: Sat, 18 Feb 2023 13:19:08 -0800
Message-Id: <20230218211908.1430494-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 21:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101148

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...illiseconds-parameter-from-unsigned-.patch | 33 +++++++++++++++++++
 meta-oe/recipes-support/glog/glog_0.6.0.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/glog/glog/0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch

diff --git a/meta-oe/recipes-support/glog/glog/0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch b/meta-oe/recipes-support/glog/glog/0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch
new file mode 100644
index 0000000000..3732c62cd0
--- /dev/null
+++ b/meta-oe/recipes-support/glog/glog/0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch
@@ -0,0 +1,33 @@
+From 176230435cb4b64ff7f2d97f77a04579ad9ca239 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 Feb 2023 13:14:14 -0800
+Subject: [PATCH] Change SleepForMilliseconds parameter from unsigned int -> long
+
+Fixes following error on 32bit platforms
+
+src/googletest.h:631:35: error: non-constant-expression cannot be narrowed from type 'unsigned int' to 'long' in initializer list [-Wc++11-narrowing]
+  const struct timespec req = {0, t * 1000 * 1000};
+                                  ^~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/google/glog/pull/894]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/googletest.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/googletest.h b/src/googletest.h
+index 5761361..836b06c 100644
+--- a/src/googletest.h
++++ b/src/googletest.h
+@@ -625,7 +625,7 @@ class Thread {
+ #endif
+ };
+ 
+-static inline void SleepForMilliseconds(unsigned t) {
++static inline void SleepForMilliseconds(long t) {
+ #ifndef GLOG_OS_WINDOWS
+ # if defined(_POSIX_C_SOURCE) && _POSIX_C_SOURCE >= 199309L
+   const struct timespec req = {0, t * 1000 * 1000};
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-support/glog/glog_0.6.0.bb b/meta-oe/recipes-support/glog/glog_0.6.0.bb
index 067e914aa2..89b7cfd184 100644
--- a/meta-oe/recipes-support/glog/glog_0.6.0.bb
+++ b/meta-oe/recipes-support/glog/glog_0.6.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 SRC_URI = " \
     git://github.com/google/glog.git;nobranch=1;protocol=https \
     file://libexecinfo.patch \
+    file://0001-Change-SleepForMilliseconds-parameter-from-unsigned-.patch \
 "
 
 SRCREV = "b33e3bad4c46c8a6345525fd822af355e5ef9446"
-- 
2.39.2


