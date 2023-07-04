Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBFCEB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 20:56:11 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.3553.1688504165778489426
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jul 2023 13:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CuyYmoXm;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-66f5faba829so3213277b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 13:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688504165; x=1691096165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xK2TWC1v1DjhiPDbPTV7ZNVL262IIPmjEJw6CSsE/Yg=;
        b=CuyYmoXmVY+bp1+1Lq10ZibrFx0fyg1awDK8JGlT2tKZYxvLUEkkD21ZqdYXtLwUMt
         6QLBSgfUF6lhD7Daux8/2KGR0vdYZGoZcbt3CZBDDsKJBsAhJE+dBLlWIArAn983ScpQ
         B5WZPOPYb3knkEQwbT8iFxnOeTiROWGwhVuiK3ubZqcUjT3pTDuNhaYZIym45SOEZd95
         NvkbPaLN4/4K/hHeU73EHLBfcRPxXoyEgcP1HQzcb/Def9ShSCMAZV8SEevgjS7k3Adg
         gjay1TUOy/4YQPP1V8ABF5IfYdqIeFzs79J3hdbbb+l8EL5iVu6ke5gVvV/Uf8gxo1/w
         dTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688504165; x=1691096165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xK2TWC1v1DjhiPDbPTV7ZNVL262IIPmjEJw6CSsE/Yg=;
        b=Siq1qu/Ix5sHfLVoYdIZaqX7vkcb5gk6oK9bVsTAtpFxrIRPG7jEc9l3dxjql+65Nh
         XfU+Y+K8+XC8HAdGZ4HhxLNxDSUzBV7ula1XX0j+svBJq6UKiWEel+Nm1lCwKu6RxAim
         mQ5rM8ObyO6xth+HE6tZLCKb0OkmsZvO24vGJcjEJHR6db9l2qcxCUuYzJ65Co9MjFoC
         gNE5bgo2IcPlkZgd+aoms0fj8EhK34LaV516Rmzv1Er6gN/OEwvze4mWRykeBwicq6Mi
         9WRc9mHw4HWSO7/tUeazYLuQA6v2J0n1X6/jM5dd3P/7D0HM+Hyo10DZhTxAV1DRIRZu
         YXWA==
X-Gm-Message-State: ABy/qLZGy+y+P74z0IUmLUNVRhP88oRKEtUByllrmXPY1MtEMZK/4kYe
	QbQoyJHf7620zXgmABmHWJmDRGUJkxk=
X-Google-Smtp-Source: APBJJlESipyhdVmHc5VnFjcrKavpjTCbvxIbrRJ/rsmR/buGo08B9vdqvSjw1lDdBYu94AMB5cFZCg==
X-Received: by 2002:a05:6a00:14cc:b0:66a:6339:e8f9 with SMTP id w12-20020a056a0014cc00b0066a6339e8f9mr16472398pfu.0.1688504164968;
        Tue, 04 Jul 2023 13:56:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::e2fe])
        by smtp.gmail.com with ESMTPSA id y19-20020aa78553000000b0066f37665a63sm11500266pfn.73.2023.07.04.13.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 13:56:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] geos: Upgrade to 3.12.0
Date: Tue,  4 Jul 2023 13:56:02 -0700
Message-ID: <20230704205602.1932962-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 20:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103662

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../geos/0001-include-missing-cstdint.patch   | 82 -------------------
 .../geos/{geos_3.9.4.bb => geos_3.12.0.bb}    |  5 +-
 2 files changed, 2 insertions(+), 85 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/geos/geos/0001-include-missing-cstdint.patch
 rename meta-oe/recipes-navigation/geos/{geos_3.9.4.bb => geos_3.12.0.bb} (76%)

diff --git a/meta-oe/recipes-navigation/geos/geos/0001-include-missing-cstdint.patch b/meta-oe/recipes-navigation/geos/geos/0001-include-missing-cstdint.patch
deleted file mode 100644
index 6cfd2e81bc..0000000000
--- a/meta-oe/recipes-navigation/geos/geos/0001-include-missing-cstdint.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 11b9ef265a942cb3fdd373520d0c3fce67d3cdf9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 26 Jan 2023 18:05:33 -0800
-Subject: [PATCH] include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer transitively included [1]. Explicitly include it for uint{32,64}_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Backport [https://github.com/kraj/geos/commit/0e8d4368b]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/geos/geomgraph/TopologyLocation.h   | 1 +
- include/geos/io/WKTWriter.h                 | 1 +
- include/geos/shape/fractal/HilbertCode.h    | 1 +
- include/geos/shape/fractal/HilbertEncoder.h | 1 +
- include/geos/shape/fractal/MortonCode.h     | 1 +
- 5 files changed, 5 insertions(+)
-
-diff --git a/include/geos/geomgraph/TopologyLocation.h b/include/geos/geomgraph/TopologyLocation.h
-index 4cbbacb3..a3ecd212 100644
---- a/include/geos/geomgraph/TopologyLocation.h
-+++ b/include/geos/geomgraph/TopologyLocation.h
-@@ -25,6 +25,7 @@
- #include <geos/inline.h>
- #include <geos/geom/Location.h>
- 
-+#include <cstdint>
- #include <vector>
- #include <array>
- #include <string>
-diff --git a/include/geos/io/WKTWriter.h b/include/geos/io/WKTWriter.h
-index c0af8e71..0d60e975 100644
---- a/include/geos/io/WKTWriter.h
-+++ b/include/geos/io/WKTWriter.h
-@@ -25,6 +25,7 @@
- 
- #include <string>
- #include <cctype>
-+#include <cstdint>
- 
- #ifdef _MSC_VER
- #pragma warning(push)
-diff --git a/include/geos/shape/fractal/HilbertCode.h b/include/geos/shape/fractal/HilbertCode.h
-index 46012efc..beeb28c6 100644
---- a/include/geos/shape/fractal/HilbertCode.h
-+++ b/include/geos/shape/fractal/HilbertCode.h
-@@ -17,6 +17,7 @@
- 
- #include <geos/export.h>
- #include <string>
-+#include <cstdint>
- 
- // Forward declarations
- namespace geos {
-diff --git a/include/geos/shape/fractal/HilbertEncoder.h b/include/geos/shape/fractal/HilbertEncoder.h
-index 61c0010d..0126d3d9 100644
---- a/include/geos/shape/fractal/HilbertEncoder.h
-+++ b/include/geos/shape/fractal/HilbertEncoder.h
-@@ -16,6 +16,7 @@
- #pragma once
- 
- #include <geos/export.h>
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
-diff --git a/include/geos/shape/fractal/MortonCode.h b/include/geos/shape/fractal/MortonCode.h
-index 6743f87c..ad4a42e7 100644
---- a/include/geos/shape/fractal/MortonCode.h
-+++ b/include/geos/shape/fractal/MortonCode.h
-@@ -17,6 +17,7 @@
- 
- #include <geos/export.h>
- #include <string>
-+#include <cstdint>
- 
- // Forward declarations
- namespace geos {
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-navigation/geos/geos_3.9.4.bb b/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
similarity index 76%
rename from meta-oe/recipes-navigation/geos/geos_3.9.4.bb
rename to meta-oe/recipes-navigation/geos/geos_3.12.0.bb
index 558acd92bf..b77f3af2a8 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.9.4.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
@@ -5,9 +5,8 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2 \
-           file://0001-include-missing-cstdint.patch"
-SRC_URI[sha256sum] = "70dff2530d8cd2dfaeeb91a5014bd17afb1baee8f0e3eb18e44d5b4dbea47b14"
+SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "d96db96011259178a35555a0f6d6e75a739e52a495a6b2aa5efb3d75390fbc39"
 
 inherit autotools pkgconfig binconfig
 
-- 
2.41.0


