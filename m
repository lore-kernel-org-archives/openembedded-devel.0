Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8A0C83F14
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 06:36:08 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.11811.1693290967583528716
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Aug 2023 23:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oK/i6w0d;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: bbara93@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31aeef88a55so3293192f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 23:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693290966; x=1693895766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fUmAu65eixuF/2MV4VmA+Uf7Pn8CAFqPMAHTY1SwtoM=;
        b=oK/i6w0ddUummTJKPpR+YzpCxc4n9ARmUS70fBcqeAMwM4TMGyLbBvG7PdJMtdJs3D
         E1ekp8l3n5TTY7o/3j0dQowzXFeExA3Tw/ldXFwVGqmYNOFMweCxE6NttEdKm5vq2kvd
         ZRlIWPkztoSw15mPun7eBVCcsb6Q8r9EqFqxaI6LB3Ggq1uf+6FYh/tZsU7wwOiRqZH3
         Cq15prAmgdcF9kLQrwbGkcEwgPbltMUrNIQxc+mKUJFJ8Qsfs7FP/I1ZesBqxjqTEoJO
         ehpG+XUAc1wj6R5eRsgUTaAs3WBhjf11dkkbC9oThbZRwoLFBsDRAFTpB1GMpX8wR4s6
         MQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693290966; x=1693895766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUmAu65eixuF/2MV4VmA+Uf7Pn8CAFqPMAHTY1SwtoM=;
        b=DmU5Sznh2BWNv2GOnfhbYNR2aTZOfFOzTv7XaXldDdhk4PFMW1gNOxfPWD5u5Mmkkc
         maNqc3wpREqrvG9l4ibN3hmsM2Q3c34bPvn3qOF7n+toi564QF3oRh5CfqiTiQiRYKVp
         GPIZ8qqlmmUJid3waZ8I+ukrsxB5prEz9rQxIrcdQCqEadeSdq1GvaJjNd5o0S/lIbxM
         1hYY4D52Z7+kcpQAUPx5hiwY48r7wUkjZeSFeiqMdJ/vYhvuOeT7TCyh/uS17o4QCzaA
         E8PeZGKQCf4X96dRj8nSZUPx0zb5iuG1GOxnrprJka0M0qOs8MamkSmNZ3Al2D9Y4swD
         /8Wg==
X-Gm-Message-State: AOJu0YwFBmBIqoGp16ksnY16d5uDWqK/6MPoG2fp2HkJY/+WZh90php2
	kbW+d6Z766unAx4+90yTY58=
X-Google-Smtp-Source: AGHT+IG1nkbZMhijEhbhUzUpEtqerjZdWxFqdTpr6UijKhGSFRn6GSgeZirpIHozZ3z/TfnT6czMgA==
X-Received: by 2002:adf:e482:0:b0:31a:dc27:e10 with SMTP id i2-20020adfe482000000b0031adc270e10mr20297369wrm.65.1693290965619;
        Mon, 28 Aug 2023 23:36:05 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d6107000000b0031c4d4be245sm12581981wrt.93.2023.08.28.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 23:36:05 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: [meta-oe][PATCH] ne10: set incompatible for armv7 without neon
Date: Tue, 29 Aug 2023 08:35:59 +0200
Message-Id: <20230829063559.2406834-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 06:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104637

From: Benjamin Bara <benjamin.bara@skidata.com>

ne10 requires NEON[1], therefore set incompatible for incompatible
machines. In this case, don't depend on it in libopus, as it is optional
anyways.

[1] https://github.com/projectNe10/Ne10/blob/v1.2.1/CMakeLists.txt#L139

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bb    | 4 ++--
 meta-oe/recipes-multimedia/libopus/libopus_1.4.bb         | 4 ++--
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb                | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 0a88f37ac..c58047977 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -925,8 +925,8 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     libmicrohttpd \
     yaml-cpp \
 "
-RDEPENDS:packagegroup-meta-oe-support:append:armv7a = " ne10"
-RDEPENDS:packagegroup-meta-oe-support:append:armv7ve = " ne10"
+RDEPENDS:packagegroup-meta-oe-support:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon"," ne10","",d)}"
+RDEPENDS:packagegroup-meta-oe-support:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon"," ne10","",d)}"
 RDEPENDS:packagegroup-meta-oe-support:append:aarch64 = " ne10"
 RDEPENDS:packagegroup-meta-oe-support:append:x86 = " mcelog mce-inject mce-test vboxguestdrivers"
 RDEPENDS:packagegroup-meta-oe-support:append:x86-64 = " mcelog mce-inject mce-test vboxguestdrivers"
diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
index 65ee2435b..127c8be18 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
@@ -29,8 +29,8 @@ EXTRA_OECONF = " \
 
 # ne10 is available only for armv7a, armv7ve and aarch64
 DEPENDS:append:aarch64 = " ne10"
-DEPENDS:append:armv7a = " ne10"
-DEPENDS:append:armv7ve = " ne10"
+DEPENDS:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon"," ne10","",d)}"
+DEPENDS:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon"," ne10","",d)}"
 
 python () {
     if d.getVar('TARGET_FPU') in [ 'soft' ]:
diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index 0e16b15c9..5193df317 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -18,12 +18,12 @@ inherit cmake
 # Incompatible with archs other than armv7, armv7ve and aarch64
 COMPATIBLE_MACHINE = "(^$)"
 COMPATIBLE_MACHINE:aarch64 = "(.*)"
-COMPATIBLE_MACHINE:armv7a = "(.*)"
-COMPATIBLE_MACHINE:armv7ve = "(.*)"
+COMPATIBLE_MACHINE:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"
+COMPATIBLE_MACHINE:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"
 NE10_TARGET_ARCH = ""
 NE10_TARGET_ARCH:aarch64 = "aarch64"
-NE10_TARGET_ARCH:armv7a = "armv7"
-NE10_TARGET_ARCH:armv7ve = "armv7"
+NE10_TARGET_ARCH:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon","armv7","",d)}"
+NE10_TARGET_ARCH:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon","armv7","",d)}"
 
 EXTRA_OECMAKE = '-DGNULINUX_PLATFORM=ON -DNE10_BUILD_SHARED=ON -DNE10_LINUX_TARGET_ARCH="${NE10_TARGET_ARCH}"'
 
-- 
2.34.1


