Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4F9C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 12:59:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.18195.1669121983720163776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 04:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MizsfWrW;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id i12so20727691wrb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 04:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X75gbNwro8g+sQNa3ZNMhO7BDk0GBWjxNAfo43YB+H8=;
        b=MizsfWrWB3lLmniteE64h1puRImikLCg11aOzDLbKFEUx8zyyHqkgftx6wEg3rRBfy
         NbI7Cq+W4g4koa2/hJ7qIc3ws8O2h3xt2C+bd4eSFLeeRzhZHwi3vw/Bqe6u1VCccIEF
         gZ612yRsRv/MUSHzjBza1I+yDLlJuaTax3VJlk/ss1Vymjzyfq/MY0jcU53ds4cvZuG/
         3V0I1ftxNy+bUImWa6sLprWfFHKDbrezhD8gzcDpIjamU1fazenTY9RD3prR6iYgXIAO
         c3nD/7nAjt7phxG/lL/qeHseAMR7DkyzD43GnjuvPHcxhEapx8bBs+PqLyvv09FqYgoz
         w/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X75gbNwro8g+sQNa3ZNMhO7BDk0GBWjxNAfo43YB+H8=;
        b=cCwNPcCuIjD4MqcAeqZHVgk4E1j29dfay8Krv2D5KkzPybzHqoTi9Fq6uXlAxPJmrp
         1bivR/W0bMCBQ8CvbyKlOAtU4Pi/UQ3eXV+4sSw+BdAyltgYSD7HS3qG7l4cQ1XX1dtJ
         G/yoLr0qWqibg3K0Sf1kKfPt6w+RrFrb/sOs838QowhpSc2TsctO6LGVxHm7CP1N+X23
         YNOd/F6O8oJOlIkkb36iLsSXe1Gw70RqTI823rYUS9hbe/APpbXkX8p2Am/a02JAaPkD
         NM8NDfYiJelNcoTHwlvdGzZAODDI1ak4ZLsSZvI6MMhJiUY8hfEIStrtnsPOTh2Fd69m
         xPVQ==
X-Gm-Message-State: ANoB5pm0GkvWbaF0dkPOe/Bh1RBS46oLYGYma3ytdT5VnmI/fkEgfHMQ
	esru/ALcfPwrVfeG6ZUu91xMJgkdfQaFNg==
X-Google-Smtp-Source: AA0mqf51XUA6JsU2e0NZuq8Z/cWZL5CN/4fcWB7tVkLRqLE9cCI1JdfvDnDxn5wpFNM1RcHob4PjQw==
X-Received: by 2002:adf:ea43:0:b0:22e:433a:46ba with SMTP id j3-20020adfea43000000b0022e433a46bamr7252819wrn.575.1669121981475;
        Tue, 22 Nov 2022 04:59:41 -0800 (PST)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id c3-20020adffb43000000b00225307f43fbsm13844853wrs.44.2022.11.22.04.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 04:59:40 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2] navigation: bump proj to 9.1.0 library
Date: Tue, 22 Nov 2022 13:59:38 +0100
Message-Id: <20221122125938.32864-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 12:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99686

Proj has moved to CMake build system.

Update the recipe and make more PACKAGECONFIG available following
the ./contrib/oe-stylize.py output.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---

Changes in v2:
 - Disable BUILD_TESTING

 meta-oe/recipes-navigation/proj/proj_8.2.1.bb | 22 -------------------
 meta-oe/recipes-navigation/proj/proj_9.1.0.bb | 22 +++++++++++++++++++
 2 files changed, 22 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/proj/proj_8.2.1.bb
 create mode 100644 meta-oe/recipes-navigation/proj/proj_9.1.0.bb

diff --git a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb b/meta-oe/recipes-navigation/proj/proj_8.2.1.bb
deleted file mode 100644
index 0c1104926..000000000
--- a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "PROJ.4 - Cartographic Projections library"
-HOMEPAGE = "http://trac.osgeo.org/proj/"
-SECTION = "libs"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27445198ba1500f508fce2b183ce0ff"
-
-SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
-
-SRC_URI[sha256sum] = "76ed3d0c3a348a6693dfae535e5658bbfd47f71cb7ff7eb96d9f12f7e068b1cf"
-
-DEPENDS = "sqlite3 sqlite3-native tiff"
-
-inherit autotools pkgconfig lib_package
-
-PACKAGECONFIG ?= "curl"
-
-PACKAGECONFIG[curl] = ",--without-curl,curl"
-
-FILES:${PN} += "${datadir}/proj"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-navigation/proj/proj_9.1.0.bb b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
new file mode 100644
index 000000000..b956ce50f
--- /dev/null
+++ b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "PROJ.4 - Cartographic Projections library"
+HOMEPAGE = "http://trac.osgeo.org/proj/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27445198ba1500f508fce2b183ce0ff"
+DEPENDS = "sqlite3 sqlite3-native"
+
+SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "81b2239b94cad0886222cde4f53cb49d34905aad2a1317244a0c30a553db2315"
+
+inherit cmake lib_package
+
+EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
+
+FILES:${PN} += "${datadir}/proj"
+
+BBCLASSEXTEND = "native"
+
+PACKAGECONFIG ?= "curl"
+PACKAGECONFIG[apps] = "-DBUILD_APPS=ON, -DBUILD_APPS=OFF"
+PACKAGECONFIG[curl] = "-DENABLE_CURL=ON,-DENABLE_CURL=OFF,curl"
+PACKAGECONFIG[tiff] = "-DENABLE_TIFF=ON,-DENABLE_TIFF=OFF,tiff"
-- 
2.34.1


