Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52F3C77B72
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 00:54:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.14806.1681779246367307445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 17:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=naWYdCRk;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-63b5c4c769aso1578713b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 17:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681779245; x=1684371245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jepei+bQAh1j/Z6ahQ2lRLA26seB74neOdt+NNlWZZQ=;
        b=naWYdCRk82j2l5JdHvH3pXoX/LYpPBhGBkwINaFChwYmImP2wkHEDnYwiGs7q6KeRA
         MGUc3y+I6XOtYFyQhx6gZPx6JIXzQFFefEyWYRL3nsbTBwDNFrTNC0P5f5kf979DjPk1
         3SXGdEz8Vhqf0TfdL1VxZRS/r6SdhgnAXx/h5egK3kzHPGBq67s6MSVaeEXc02YTw0ku
         7UVErM6JbZ22cNA7h1H/6R71KOCaTAC1IiE9Ve09rk/xbR8NnmHZGHqBm/3oMtPjFgno
         zZA+/MjdBD45xq/XNE1khilAA9ZZzM4xgvw8WO2DhA56clswepqqfKehww4Z5XzKId0F
         43sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681779245; x=1684371245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jepei+bQAh1j/Z6ahQ2lRLA26seB74neOdt+NNlWZZQ=;
        b=Z+Tf9S5a5F2tkj/RBy4dnR+bXB5BiLf3pU/FP8Vs9X8o9ZLG9z1pxE48TWtSgKEDA4
         uFYkh+JSaHVpa6KoEAgXVT+pgedMywsIFl/ypl5EKsdNLWxQGijT1AS17RbPDaS3gJF1
         M6p4ecTOuGSfUQIw8vCu3o+zd1uxYdTrSDKp/1lz7C2cchDK1ghfCqMmMIWs84kEvSFj
         in1EcIrqCVpsJ0Metr5lMgEm7ASTSEJFyiTgB32KxO4PxLQDjBBg4Msw7c444/iugtRy
         SgBA/Le1jUNWCad3+vslzHt2UygXJFd9EyR6zpWf1hikNcAH6vfjRn/WVLS/pi2w4VcS
         GPIQ==
X-Gm-Message-State: AAQBX9fDDA62+e0DekYXMM9R1T6NAhwA8pCiGIVZGds/AStXLI1n1vza
	LwzlyV4T3ByKkqWQZQ7OVIhmvEF9n1KW1g==
X-Google-Smtp-Source: AKy350ZbqHtxt1jAp3tkMimJkOeM+0XaZA/2QvqIUXGuVHc13WtVLy2BFe1Zwttq3+NRWrXTTiVt1w==
X-Received: by 2002:a05:6a00:14c6:b0:63b:88f6:3817 with SMTP id w6-20020a056a0014c600b0063b88f63817mr10375326pfu.19.1681779244997;
        Mon, 17 Apr 2023 17:54:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id a22-20020a62bd16000000b0063b59ad4e0dsm7245575pff.118.2023.04.17.17.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 17:54:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libcereal: Fix TMPDIR leaking into debug_str section
Date: Mon, 17 Apr 2023 17:54:01 -0700
Message-Id: <20230418005401.1481350-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Apr 2023 00:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102130

Fixes errors like
File /usr/lib/libcereal/ptest/tests/.debug/test_unordered_map in package libcereal-dbg contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-doctest-Do-not-use-unnamed-class.patch | 38 +++++++++++++++++++
 .../libcereal/libcereal_1.3.2.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcereal/files/0001-doctest-Do-not-use-unnamed-class.patch

diff --git a/meta-oe/recipes-support/libcereal/files/0001-doctest-Do-not-use-unnamed-class.patch b/meta-oe/recipes-support/libcereal/files/0001-doctest-Do-not-use-unnamed-class.patch
new file mode 100644
index 0000000000..9396cc5d01
--- /dev/null
+++ b/meta-oe/recipes-support/libcereal/files/0001-doctest-Do-not-use-unnamed-class.patch
@@ -0,0 +1,38 @@
+From 03bbb1b055c41ec652470f775b55a7cf80d664ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Apr 2023 16:46:12 -0700
+Subject: [PATCH] doctest: Do not use unnamed class
+
+When compiling with clang this results in emitting absolute path into
+debug info, especially .debug_str section has
+
+~(unnamed class at /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libcereal/1.3.2+gitAUTOINC+ebef1e9298-r0/git/unittests/doctest.h:6428:5)
+(unnamed class at /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libcereal/1.3.2+gitAUTOINC+ebef1e9298-r0/git/unittests/doctest.h:6428:5)
+
+Therefore use a name for the class instead and help get rid of this
+absolute path in debug info. This fixes
+
+File /usr/lib/libcereal/ptest/tests/.debug/test_unordered_map in package libcereal-dbg contains reference to TMPDIR
+
+Upstream-Status: Submitted [https://github.com/USCiLab/cereal/pull/788]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unittests/doctest.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unittests/doctest.h b/unittests/doctest.h
+index cd5b44d6..e6d8f7f9 100644
+--- a/unittests/doctest.h
++++ b/unittests/doctest.h
+@@ -6424,7 +6424,7 @@ void Context::setCout(std::ostream* out) { p->cout = out; }
+ static class DiscardOStream : public std::ostream
+ {
+ private:
+-    class : public std::streambuf
++    class discardBufStream: public std::streambuf
+     {
+     private:
+         // allowing some buffering decreases the amount of calls to overflow
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index f15927554b..c5f26ecb4e 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -21,6 +21,7 @@ SRCREV = "ebef1e929807629befafbb2918ea1a08c7194554"
 SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https \
            file://0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_distrib.patch \
            file://0001-cmake-Use-idirafter-instead-of-isystem.patch \
+           file://0001-doctest-Do-not-use-unnamed-class.patch \
            file://run-ptest \
 "
 
-- 
2.40.0


