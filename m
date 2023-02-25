Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6EDC64EC7
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 21:00:50 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.51963.1677355056526027569
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Feb 2023 11:57:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ECYVs82l;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: kekiefer@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so2537829pjp.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 11:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h4iTepo50Ib4SIy4KdFTse+drc8zTdqBsvOpTFpA9bc=;
        b=ECYVs82lkCqRjW6DEaO14ekD/prem+nAgufnQjWzC5HD0S8PeVjIdo7Fw27cLxZjUj
         M/8aNN6ehotlNxHSC8OrDF0+W2fHgZJDlTmGqZGSHCCKh3QE0GQh4KhGRZA8YYs23BLR
         d1Yps/B1ZYaU9TG4VDeF64/V0/2r73IFeA9IXAlaG3UISlkuT1IraNtNsALxHx9084VT
         KpjCVEr0oUpovqbuxp8ILH4OBkcL1Fk+FxBRxumCNOzX5FcVZ7viLcxM+G26t+XgPmhB
         wBbi6H8Qbaz8J7Mvq/soEsMCxnPj1xkiCG+OgOlcdT1zoa46q/DUD/b7ro2yn+KhhEc+
         Vj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4iTepo50Ib4SIy4KdFTse+drc8zTdqBsvOpTFpA9bc=;
        b=7w2284cRkgDEYMI0YsGTmTNsT+qnnAA2Md7pXTjgYSGH3KZHbTuisBmqDfGnKRGGvS
         ugtRo/bnU94qr2CzSnmeTIYCLzRakeRPD4W6xDTje6qfJDTpM3lYNwWi5KvTP6eI4pFf
         CWy9yvTwddZmPKsAX41wIwsRG+V0rQ+pWrL/QvCkOIKmn4tUTvwe9BZZbg6tnysazwHE
         Kllf6sQnzbq1z7+MqmfOChs5ncyimhZqedK1gGYvTcxdWPh7fU32eqZ91hbnU8S46TQb
         U3gSE/C5YMPQVUGdjmD5xNt+/4mTYo+VA1XoO0ibtB2WKHwc814KDEAd0lV1NOjmV3MD
         hGjA==
X-Gm-Message-State: AO0yUKXsCp551tHVXJ857yh/SRZBJEQmws1d/BPyDfB6geRm3RkUHf77
	694w2c2ZKkTzB++R/PrhukzCVYnVLus=
X-Google-Smtp-Source: AK7set+XRgG/2A3iDKJLpr1139SOrCGoIleBVZVO4fSM5m0VPglG8xbXWgbxztHbI/Rhhd2h7XlZxw==
X-Received: by 2002:a17:903:1103:b0:19c:bcda:ac72 with SMTP id n3-20020a170903110300b0019cbcdaac72mr9876657plh.56.1677355055603;
        Sat, 25 Feb 2023 11:57:35 -0800 (PST)
Received: from localhost.localdomain (ip68-108-250-132.sb.sd.cox.net. [68.108.250.132])
        by smtp.gmail.com with ESMTPSA id b20-20020a656694000000b00503006d9b50sm1379938pgw.92.2023.02.25.11.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 11:57:35 -0800 (PST)
From: "Kurt Kiefer" <kekiefer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Kurt Kiefer <kekiefer@gmail.com>
Subject: [meta-python][landgale][PATCH] python3-pybind11: Upgrade to 2.10.3
Date: Sat, 25 Feb 2023 11:56:55 -0800
Message-Id: <20230225195655.3682899-1-kekiefer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 21:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101253

From: Khem Raj <raj.khem@gmail.com>

It gets pkgconfig support which is required by some dependent packages
like rwmem

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5c455804aede17e0ea0cbb7ab55f8580f912e664)
Signed-off-by: Kurt Kiefer <kekiefer@gmail.com>
---
 ...11_2.10.0.bb => python3-pybind11_2.10.3.bb} | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.10.0.bb => python3-pybind11_2.10.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.10.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.10.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.10.3.bb
index 66aefac3d..bb604982d 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.10.3.bb
@@ -5,16 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=774f65abd8a7fe3124be2cdf766cd06f"
 
 DEPENDS = "boost"
 
-SRC_URI = "git://github.com/pybind/pybind11.git;branch=stable;protocol=https \
-           file://0001-Do-not-strip-binaries.patch \
-"
+SRC_URI = "git://github.com/pybind/pybind11.git;branch=stable;protocol=https"
 
-SRCREV = "aa304c9c7d725ffb9d10af08a3b34cb372307020"
+SRCREV = "0bd8896a4010f2d91b2340570c24fa08606ec406"
 
 S = "${WORKDIR}/git"
 
-BBCLASSEXTEND = "native"
-
 EXTRA_OECMAKE =  "-DPYBIND11_TEST=OFF"
 
 inherit cmake setuptools3 python3native
@@ -23,17 +19,17 @@ PIP_INSTALL_DIST_PATH = "${S}/dist"
 PIP_INSTALL_PACKAGE = "pybind11"
 
 do_configure() {
-	cmake_do_configure
+   cmake_do_configure
 }
 
 do_compile() {
-	setuptools3_do_compile
-	cmake_do_compile
+   setuptools3_do_compile
+   cmake_do_compile
 }
 
 do_install() {
-	setuptools3_do_install
-	cmake_do_install
+   setuptools3_do_install
+   cmake_do_install
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


