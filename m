Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68113C43219
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 09:44:24 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.3816.1668505459115875026
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Nov 2022 01:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WN8mKULR;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id o4so23143082wrq.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Nov 2022 01:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kdi98te820yP7e2c+xgu8akpxrvDchFfSnEJNjkIjPE=;
        b=WN8mKULRfuSRKr1eMCCjsG4JOBx3F8/zAHJG1gEw3qIfdA5ZaDYuzSqqRshsGasxuv
         PqxZvZsavY0qD9py8iNVZaln355RVaCgF3IptJTJqkyE4xQ9+NOA9gDmvK4DCb9egdK6
         mHTXbv/pGbQ7fzZChS5NmjekJMIH5y5fHkSq/0q9soiQGwHspLz6Q0a3RRr94YLgrIev
         IxrlLM/x7N5VEtcyTc2KLtZ3lzA5PJoT3LAl2QOyNi9kkvZY+Q+plozoGv5AhdkSquiW
         ZQAlWeDoO8WSHpxOQ6cN6BY3C8/wCXQpLulN7aTuo9+WFBZbiGDSUkl7SUKyjJjvMzp8
         gFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kdi98te820yP7e2c+xgu8akpxrvDchFfSnEJNjkIjPE=;
        b=VKLvhgnVggpAdvrXFOuCNwCJUJBAl91BJJZ/68X0MJLSzIk3Xz1RyTwoQtdF5uuSYv
         NKhP84l9c5b43aEjnFc72UfD9tqT3edNj7S3Gh3wbOzPWYBkc3B5dZaXgRYXhvKUAh3C
         6z48bPo18dZiSfw2vSNyveGP4+7F79HtVUYNeLMqOg2SDJR3qGMcZ17xSisVsBFqiZK2
         reZ7U5Udl8M+Jok0LjLrV6YfdqKovz23Z1kZloMtNZ9rw+LXvzWTBXCEGJBgVMz6/iVw
         FY+tk9EI1jAelCK8o0W385YJ/mEBt/FDAGhxoc3VFCtlEOCjAIv0AYXTbviRa6w7yfP3
         /LwQ==
X-Gm-Message-State: ANoB5pkr3qp2ARmwoKoomhPQ60n1Gun6CONacexP13UwPWewwEFioaqa
	6wDdroyrhG9ZwneN8OZLtEqNUe50dr9tug==
X-Google-Smtp-Source: AA0mqf4/hRXh8uU/hsiz/TOX4tb5lgmcLFOUZmftTDXSfvytT4J88xJg8EmJq5ug6KdiXjMeKLhwrw==
X-Received: by 2002:adf:e80e:0:b0:22e:3e28:f8de with SMTP id o14-20020adfe80e000000b0022e3e28f8demr10405199wrm.157.1668505456906;
        Tue, 15 Nov 2022 01:44:16 -0800 (PST)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c024300b003c6b874a0dfsm16999845wmj.14.2022.11.15.01.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 01:44:16 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] navigation: bump proj to 9.1.0 library
Date: Tue, 15 Nov 2022 10:44:10 +0100
Message-Id: <20221115094410.22736-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Nov 2022 09:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99589

Proj has moved to CMake build system.

Update the recipe and make more PACKAGECONFIG available following
the ./contrib/oe-stylize.py output.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../proj/{proj_8.2.1.bb => proj_9.1.0.bb}      | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-navigation/proj/{proj_8.2.1.bb => proj_9.1.0.bb} (50%)

diff --git a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
similarity index 50%
rename from meta-oe/recipes-navigation/proj/proj_8.2.1.bb
rename to meta-oe/recipes-navigation/proj/proj_9.1.0.bb
index 0c1104926..bc3523ec8 100644
--- a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
@@ -1,22 +1,20 @@
 SUMMARY = "PROJ.4 - Cartographic Projections library"
 HOMEPAGE = "http://trac.osgeo.org/proj/"
 SECTION = "libs"
-
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27445198ba1500f508fce2b183ce0ff"
+DEPENDS = "sqlite3 sqlite3-native"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "81b2239b94cad0886222cde4f53cb49d34905aad2a1317244a0c30a553db2315"
 
-SRC_URI[sha256sum] = "76ed3d0c3a348a6693dfae535e5658bbfd47f71cb7ff7eb96d9f12f7e068b1cf"
-
-DEPENDS = "sqlite3 sqlite3-native tiff"
-
-inherit autotools pkgconfig lib_package
-
-PACKAGECONFIG ?= "curl"
-
-PACKAGECONFIG[curl] = ",--without-curl,curl"
+inherit cmake lib_package
 
 FILES:${PN} += "${datadir}/proj"
 
 BBCLASSEXTEND = "native"
+
+PACKAGECONFIG ?= "curl"
+PACKAGECONFIG[apps] = "-DBUILD_APPS=ON, -DBUILD_APPS=OFF"
+PACKAGECONFIG[curl] = "-DENABLE_CURL=ON,-DENABLE_CURL=OFF,curl"
+PACKAGECONFIG[tiff] = "-DENABLE_TIFF=ON,-DENABLE_TIFF=OFF,tiff"
-- 
2.34.1


