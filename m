Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E65EC47085
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.3303.1650421747991667913
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 19:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BuQb9ukW;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id j17so585281pfi.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 19:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dd+T9CtgznAd1RijZU7CNeit1ZDZFfDklXR3PdHP8sI=;
        b=BuQb9ukWwGYOh5wT3WdNzpyYgbg8oaX6a9N7BRjox9foDR3IRsXh7TbkPagWudrV/l
         clTh45vwGnktbqloTAugHXQ6eWXkXMEp2pOyBZHUJfpa1lR1UP3b/S0xl0bywD5iWzNr
         qXnvCe5gyKuv/SyOf6B8ibWWn/9COQtlf17xcU4Xf/JysFQms5SORpG/gXq7yau5W0ZO
         DbWQOy2aI6r71ZVLJedw0ZBm7oDVPCq1oDiTkoGPte7ySAJNyUj8SmDWddd15cUlHSso
         PAwsVhKnozMgnTxSFiszcRQrmPXzUjMfmwGPHG9NAcoo0hBKEhTVkuGKLtXVzONIA95t
         FNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dd+T9CtgznAd1RijZU7CNeit1ZDZFfDklXR3PdHP8sI=;
        b=ZK9doa0lxwcZum82Z1Llb1bATAH/gFlVvECfHzr6de2pLSlyb7AoH0aAUiLPCOOgA+
         KI5Ib2svCUKwmWakGLRnAvHzEvVISFsS4yXV6iCFfyZXihKFT8l6CuTajnJi4tFbAwju
         iPMWN4eBOgFebjE5QD19IMQ8U6VE2XV87wSnBUcyfzsvIKsODdADVabqdJyHNrTEw+sK
         xBfSuyD5yfGYwA7sM9MHAyGcRtMdR/FZEKXwBYbGxfkygU9GYA1U9mjZAEVsIkFOU6aZ
         tapfffFbR1Js9B11eOWVHYwrRTVTc57wiNSyEshjK7KFkel1WdkRCRWRnou0/JMisMCN
         063g==
X-Gm-Message-State: AOAM532xlPQxYmZHMHcxdlLNqn04sqgAxm/eBsLhj7miqJ0sDKLbsN72
	eUBQCyOWcpcO7kNMb78o80pCqbm2q1DPJA==
X-Google-Smtp-Source: 
 ABdhPJzKTRdRALl+/7FU1P5rHG3zIg9PezaAOsrzAjSeLrDNYRAJDUe5TTIhNhnHYndtbKOQ892/3g==
X-Received: by 2002:a05:6a00:c8e:b0:50a:5d81:6172 with SMTP id
 a14-20020a056a000c8e00b0050a5d816172mr17902869pfv.66.1650421746996;
        Tue, 19 Apr 2022 19:29:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 k22-20020aa790d6000000b0050a765d5d48sm9064491pfk.160.2022.04.19.19.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 19:29:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opencv: Fix build with gcc-12 on ppc64
Date: Tue, 19 Apr 2022 19:25:44 -0700
Message-Id: <20220420022544.3134707-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96710

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...update-vec_absd-workaround-condition.patch | 28 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.5.5.bb    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-core-vsx-update-vec_absd-workaround-condition.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-core-vsx-update-vec_absd-workaround-condition.patch b/meta-oe/recipes-support/opencv/opencv/0001-core-vsx-update-vec_absd-workaround-condition.patch
new file mode 100644
index 0000000000..d2d3b81fbe
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-core-vsx-update-vec_absd-workaround-condition.patch
@@ -0,0 +1,28 @@
+From c7ce902eed0eb7926c0973b1127037fdd27b99ca Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.a.alekhin@gmail.com>
+Date: Tue, 15 Feb 2022 07:23:32 +0300
+Subject: [PATCH] core(vsx): update vec_absd() workaround condition
+
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/8d88bb06b230b5c4b5bca78d84102f5d1adf48cf]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/core/include/opencv2/core/vsx_utils.hpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/modules/core/include/opencv2/core/vsx_utils.hpp b/modules/core/include/opencv2/core/vsx_utils.hpp
+index 68863ffb36..5cbc066784 100644
+--- a/modules/core/include/opencv2/core/vsx_utils.hpp
++++ b/modules/core/include/opencv2/core/vsx_utils.hpp
+@@ -684,7 +684,8 @@ VSX_IMPL_LOAD_L8(vec_double2, double)
+ #endif
+ 
+ // absolute difference
+-#ifndef vec_absd
++#ifndef _ARCH_PWR9
++#   undef vec_absd
+ #   define vec_absd(a, b) vec_sub(vec_max(a, b), vec_min(a, b))
+ #endif
+ 
+-- 
+2.36.0
+
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
index 4449596dae..e4fb676f7e 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
@@ -51,6 +51,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
+           file://0001-core-vsx-update-vec_absd-workaround-condition.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
 
-- 
2.36.0


