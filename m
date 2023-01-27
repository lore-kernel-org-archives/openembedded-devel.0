Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EADDC54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 05:54:58 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.96377.1674798890336744139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 21:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MKbD3dF2;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9so3966238pll.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npLwqcghuTHByYbQfwpNlwM5spDgDJfPUlSpkDM++xc=;
        b=MKbD3dF247frRBmSqMygRrIIqbG9XcUE7nE95YcdlMBH+0/OBsZdnNb4bgWCZH25rt
         +VZzMLAffyJIAi/SFNathkNSFhun7ZgBSGFb6izsACWzhElZCMazgCmlVXlYRTXpU0ly
         3rril+vdI+Oh82npvXFyHCXqDm7NttL67e87/vU5VO4LI2vQdaamhgIw5C37s7+5oPQq
         sChi6rcmiModcWG7Rp8SKfUSEPEf+E8Pk4JF5aTJghxavreIyg5WZgELieRRJraqDSf/
         lPR6Ywa2oyMRLz14RKJ8ZaKJ5xgm+kT8G0d9ZYm6QLGGhGhz/aCUDZrT9UqKGMow1ztZ
         JQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npLwqcghuTHByYbQfwpNlwM5spDgDJfPUlSpkDM++xc=;
        b=f82FpcM3dhL/k6+5f2SkvaA/mXqcdTFicn5/XYpwTVO0kVir17I3azsiA9pJUMQnkS
         U0+wBkZq3XixjaNgM7BBktZYI22YKvJ0G4x1ASCRfJGT6jtqM+8mFx1U/bclAE+WM1/B
         CHLlYSfb5avcLJd5DYj+RK4CH/iOYGTemH0R7fST+L+gjZ+Lrdv83fEX6fZI9CPIqp8W
         l3P2SF2D+/Ti9FNE0GM+EXtflg5Bb68heWF38APotyfgb0bVZ6eFEgngkczsd6w2Um8P
         182zD1I9kzq3g+AnQlg83za9KmuerY5wDxNOuJ5L9lsMpBFNd1pPCL2x0iW+OETtylcu
         n0lw==
X-Gm-Message-State: AO0yUKUjTpzOCimnJHn5/1kFfUKuFEzqOHm53Qtz1fNvnGflzlQVtFlK
	rO/cdpm9eqvEASWBKgig6+JMMCIpYR6s1g==
X-Google-Smtp-Source: AK7set/nSoBLMVO5tunEF/g63TYTjN8oxUl8wGmxUcYt2C65HcOuJ3Ed0ldLpVqlYl0v2ELH+M0kTA==
X-Received: by 2002:a17:902:d4c3:b0:196:349f:4df3 with SMTP id o3-20020a170902d4c300b00196349f4df3mr8689274plg.50.1674798889524;
        Thu, 26 Jan 2023 21:54:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001947982eb8fsm230074pls.60.2023.01.26.21.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 21:54:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 09/10] python3-pybind11: Upgrade to 2.10.3
Date: Thu, 26 Jan 2023 21:54:39 -0800
Message-Id: <20230127055440.2108933-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127055440.2108933-1-raj.khem@gmail.com>
References: <20230127055440.2108933-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100813

It gets pkgconfig support which is required by some dependent packages
like rwmem

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...11_2.10.0.bb => python3-pybind11_2.10.3.bb} | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.10.0.bb => python3-pybind11_2.10.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.10.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.10.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.10.3.bb
index 66aefac3d6..bb604982d0 100644
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
2.39.1


