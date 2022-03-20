Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C407AC433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 18:59:00 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.21357.1647802740390788705
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eoUm2tmH;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id p5so7661453pfo.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x1GCYKsO4iPUP6VPmvwJbkwK6VOyIxVjs5xR4u4ctW4=;
        b=eoUm2tmHpL8ckb1FsiuclyUMniHPI8weO2sijo9WfLv6tmOmYCI6HdTlRBdQPf1jt3
         QAM//9VrIzf1xbiRVhuTKSkuhrXhso32CfIJeSnsQAIaKd7S0XGlAKJYclgd9zBZ8JiC
         zG5G0ZuyvaAi3A4FGxyS2rZMtJYxfCG45WsUvNisJH/Z5x0JZZ5u+rRR3hlndkgGe79m
         GhTRPMzjCpVYWmd6JkLBi1o9klg8DglrV8D4BPl+uUKWPZcFUN9lAvalbPvOlYBtdnYy
         DElYh2v4P6TfxuZIoaUHSs4x7mWiqH9x88YPTlFHea5W1OrNNK9RXCEkJcnDsQoyVcbZ
         wbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x1GCYKsO4iPUP6VPmvwJbkwK6VOyIxVjs5xR4u4ctW4=;
        b=47AaMgH6EV3vzgegVpS85/hFeb+HeAsXWvgGdlll12Ow9n9ppdAdqW1xThPYyvLbaY
         Rn+G9gOc32ce760EP2r/tku0XbYitAoPASnRBJkNvJhlmOoyYJCjtHYpY/4MIA6AmyQ2
         mz0hDtyYU7HI9+r8k7z5UFJp23RG0ng5kj5epA9LatCuMmINWZOy6PiRFYDRI3l6NrcV
         2h5D6UKroONr3xCBRJW7Tqprkpxd0ul0Yj1XIzSpXLhyXRjbdfL7TEidniLFjG+RCupa
         s0zdSyDfEJSUpvpdXqXzNNY1fVHyIqii9nFB0UKsxBhpY0X5T8vngUAxMSaYnqLT/MOs
         FSxA==
X-Gm-Message-State: AOAM5337zTfEFdbtGuYu0uOYjJ/CYCs69tBEVJ/SqLLbX0aHbr7cCkkb
	pri7BExyxByDTP+GyH0yMFF3e2Ckq0lGdw==
X-Google-Smtp-Source: 
 ABdhPJxopJykU990t9MT0AavCs4i+IPsckdOT51lkorrI6yYdZUNwh1DLw0d7P55iN6hN1QcPFEIkw==
X-Received: by 2002:a05:6a00:1254:b0:4fa:874e:1319 with SMTP id
 u20-20020a056a00125400b004fa874e1319mr6596880pfi.14.1647802739594;
        Sun, 20 Mar 2022 11:58:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a2b8a00b001c6594e5ddcsm13884074pjd.15.2022.03.20.11.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 11:58:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] libcppkafka: Use CMAKE_INSTALL_LIBDIR instead of
 hardcoding lib
Date: Sun, 20 Mar 2022 11:58:54 -0700
Message-Id: <20220320185856.3302842-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320185856.3302842-1-raj.khem@gmail.com>
References: <20220320185856.3302842-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 18:59:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96087

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch | 30 +++++++++++++++++++
 .../libcppkafka/libcppkafka_git.bb            |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libcppkafka/libcppkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch

diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch b/meta-oe/recipes-support/libcppkafka/libcppkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
new file mode 100644
index 0000000000..d78ee7a8df
--- /dev/null
+++ b/meta-oe/recipes-support/libcppkafka/libcppkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
@@ -0,0 +1,30 @@
+From 51ec4c1f533dee9a499490c1c5bbd23d2191a4a7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Mar 2022 11:14:25 -0700
+Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR
+
+Do not hardcode library path, this helps it install in right location
+independent of platforms, e.g. ppc64 uses lib64 and not lib
+
+Upstream-Status: Submitted [https://github.com/mfontanini/cppkafka/pull/291]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c4e44e6..25ec1ce 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -51,7 +51,7 @@ option(CPPKAFKA_EXPORT_CMAKE_CONFIG "Generate CMake config, target and version f
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")
+ 
+ if (NOT CPPKAFKA_CONFIG_DIR)
+-    set(CPPKAFKA_CONFIG_DIR lib/cmake/${PROJECT_NAME})
++    set(CPPKAFKA_CONFIG_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
+ endif()
+ 
+ # Maintain previous compatibility
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
index 8f777eb182..0cb33fcd50 100644
--- a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
+++ b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = " \
 file://LICENSE;md5=d8b4ca15d239dc1485ef495c8f1bcc72 \
 "
 
-SRC_URI = "git://github.com/mfontanini/cppkafka;protocol=https;branch=master"
+SRC_URI = "git://github.com/mfontanini/cppkafka;protocol=https;branch=master \
+           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch \
+"
 SRCREV = "5e4b350806d561473138ce7a982e8f6cf2e77733"
 
 DEPENDS = "librdkafka boost chrpath-replacement-native"
-- 
2.35.1


