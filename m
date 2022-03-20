Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8F1C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:19 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.16036.1647763698246260967
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sj5amw88;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so5563721pjo.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IU+9q248KZDJ43t874CAoPb9qnUDeacz5DocKjchNrg=;
        b=Sj5amw883HNJPhc0qe1V1ESN5SFhLLQdO99nBGbXG2Cqdm4Ih6LclT9OMLt8jqyuoX
         P9f8PCRZYoLkIDx+Wr/F1Ca6aiig4bvLnBygO0Nr4IN92UKilEMno3YKDUlswg23jCGn
         nxVqv4iLBeRWBPVpEkoV25/tKULfy2ELG3KznA31UWy9dViyrPTELsTwWn287c/o2FcC
         IUUenAkMo1ivBKuxnGflz4Lx7VaVqq2WV8wEJwUJjo237/OyRcXdFq1L9JcO5Fc8K5V3
         EH6P7k/zAgxwDtWfnNMBEVveRBjRHkpQUjeKwZ4TTM67GgiRkPYVyGuPIeH9jG+valYQ
         aB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IU+9q248KZDJ43t874CAoPb9qnUDeacz5DocKjchNrg=;
        b=1YpeQiigT+5OPsyfRIvgojZqdj6QbeKFLRmR3xna1C3PUquyexLu/0KSfQlVtUk92t
         NQI70xqhXXZnMOap/id+UsbUto/hgKRtkpvEdFqE6M6B1z5l2rETZ1D0P7OxW0zmjjzf
         7/2OPrIgz14JpdB29qRe+AdxZlvULDe2k2wQp/sBz3ZK6hwCougSqHDun2VxsFd4GVa+
         CmejabObKepUzaZiiFtYFVnjza31HoloEJJTigGFLge0hZ4KowZsnv8YC8imIOi5CwBQ
         3tbOpXIfsof5AZiVmvo7kACs0d+HBsBs2LQSCmY+tlr+WeZeRvhBnDIHI00LlKBdzMHG
         COig==
X-Gm-Message-State: AOAM5324W0cnpaFJg6lHBt8ZFfLWFsXHdzg/14NAmYX3PdzW6ZIZH+Oi
	5rYPuZKuxrjYyglNOR13ugDrU79Bxh3Ing==
X-Google-Smtp-Source: 
 ABdhPJyuXiQ2rZ8L6N4JIRhzi01KJBSviqvRtY5m9r8K36RBdG7buhnCJv8mLcH6XcB6fO2UdUqFMg==
X-Received: by 2002:a17:90b:2496:b0:1b9:a6dd:ae7 with SMTP id
 nt22-20020a17090b249600b001b9a6dd0ae7mr30620508pjb.35.1647763697076;
        Sun, 20 Mar 2022 01:08:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/17] librdkafka: Use CMAKE_INSTALL_LIBDIR
Date: Sun, 20 Mar 2022 01:07:59 -0700
Message-Id: <20220320080815.825928-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96065

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch | 30 +++++++++++++++++++
 .../librdkafka/librdkafka_1.8.2.bb            |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch

diff --git a/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch b/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
new file mode 100644
index 0000000000..053a4cc2d8
--- /dev/null
+++ b/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
@@ -0,0 +1,30 @@
+From ed1dd35e0e23a98e57567718a0d474fd29cc348a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 19 Mar 2022 21:36:41 -0700
+Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR
+
+this ensures that it is portable across platforms e.g. ppc64/linux
+uses lib64 not lib
+
+Upstream-Status: Submitted [https://github.com/edenhill/librdkafka/pull/3770]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d1129bce..774473fa 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -219,7 +219,7 @@ configure_file("packaging/cmake/config.h.in" "${GENERATED_DIR}/config.h")
+ 
+ include(GNUInstallDirs)
+ 
+-set(config_install_dir "lib/cmake/${PROJECT_NAME}")
++set(config_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
+ 
+ set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")
+ 
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb b/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
index f9f3baaf2c..6148e7cb08 100644
--- a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
@@ -7,7 +7,9 @@ LICENSE = "BSD-2-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2be8675acbfdac48935e73897af5f646"
 
-SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master"
+SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master \
+           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch \
+          "
 SRCREV = "063a9ae7a65cebdf1cc128da9815c05f91a2a996"
 
 DEPENDS = "zlib openssl zstd"
-- 
2.35.1


