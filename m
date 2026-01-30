Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3040DD73EAD
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 01:08:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.535.1769735278323842792
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 17:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NTx4ZWro;
 spf=pass (domain: konsulko.com, ip: 209.85.214.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so14796175ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 17:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769735277; x=1770340077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzyD5LOcfTXXYyzOaRVkPlZaO78Sqpb1SauCSs+dh0I=;
        b=NTx4ZWroT6s68OAQUgtuEo6Qim4Etj8Ao5imsEMtBAfZ+W6iIDD+4BJ/mSuFKpB792
         Ouai9NGKxqK3W8864LYiUbII5IgDT8+5GrcQ26WTy/HIgQc7Z/GoidcCyUQzAtrgbbLa
         W5PVAPFVUvELayb8+ADdDNC88DfKcYt47Z6Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769735277; x=1770340077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fzyD5LOcfTXXYyzOaRVkPlZaO78Sqpb1SauCSs+dh0I=;
        b=To1rKFWrOZGR+Mpbhumv0HI8FyaaDZslytLBH4tPh3AQYAb3Pz4PBw+guOcv4bYA2O
         Obcj+pjUT+oydOOf8iGSz0cB/2PZtmZf3yDpyX6Tv3+x9+UehaDGTc/tGWxjGBV+sz4g
         cS3l7NwnubdhEQWIm+HQJ4y4miniMad/coX21DZPEsUiTpSZalI4brnqAf7rhRh96XWs
         fwo9DzqmaEcRj4UBZK8I8ScZiEqJrktEwdeqPs07SzukvYq2jCnpXqudoJ1Nu2dEgSaY
         9p4Hu6ecQAkvpAevsmw2Wy6YcnxF4QaOyhYganCgZsP5rtK/zsQpFK8Gdu+pmYsYqmbd
         xbRg==
X-Gm-Message-State: AOJu0Yy1vjwDtGyfJ/R/62luOWA475itPEda2goXEy1l/PMcxLjR+yGb
	pAXkwFP5ijPwIlkBkCCcgxT+jbKjHGh4Tt+pVyxb7NjVsgLpTCryJ1Ar2p5tDoxVySWJKMx+MNs
	wRHKt
X-Gm-Gg: AZuq6aIn3iuVfAuhUsVXzla2rlNab2RlVcELPpoOG+ycatynTJvArhpwTe2n+uY0tcl
	QCWmwWZ0ZS2RdgjSPgwW4locnwyuImz+FlQMvgbs9Fdr2gzvFYBq/Zwaq90ARGnFdqYODlJG6ec
	vINGNJoMSqqdEMJYrWSkCu8U4S+RRtUVd9nCjP0CzgXHpI44ZV8clqUvB5DPXbYJsXYNJcMGII6
	UCRfD/mH79M2lPSUrL1ML4HcsCPPzQkuAq7gdr5YIBo6rCeVi4qlNpA8RfbIU8RUeR2NXPtaKT+
	oS4h6v3HN0+1x7niKHvF6xD43hztI6iHaZQ/yBT55XreNt3MCvA4dHPOtgm4sVdvBqo22lB2Pv1
	GjZi4ZB21xqj3WI63zlQRdoNgQzfGIPqLc389kK3NG0dFngrfsZFlS2uv1NgzuHzn8RZH4+XMnE
	cpp4eonvJJZNN7/tuT6WNifKM8e6bv7oINtQKRaiO+1NxBSqxELA==
X-Received: by 2002:a17:903:1905:b0:299:bda7:ae3c with SMTP id d9443c01a7336-2a8d96c250emr10999495ad.14.1769735277283;
        Thu, 29 Jan 2026 17:07:57 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eee8bsm56621935ad.6.2026.01.29.17.07.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 17:07:56 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/3] python3-orjson: use git fetcher; enable ptest
Date: Thu, 29 Jan 2026 17:07:37 -0800
Message-ID: <ecd3b46d0c63b03fc434ee3763292acab1463941.1769715106.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769715106.git.tim.orling@konsulko.com>
References: <cover.1769715106.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 01:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123996

From: Tim Orling <tim.orling@konsulko.com>

The majority of the ptests require the data/ directory, so
switch to using the git fetcher.

1620 tests pass, 12 are skipped:

Testsuite summary
DURATION: 258

Of the 12 skipped tests, 7 are because of missing ptest rdepends
python3-pendulum, which is not yet supported for python 3.14.x.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-orjson_3.11.6.bb           | 23 +++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index a84718b704..b5acf163b4 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -135,6 +135,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-google-auth \
     python3-lz4 \
     python3-marshmallow \
+    python3-orjson \
     python3-pillow \
     python3-pint \
     python3-pykickstart \
diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb b/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
index e26ca77d91..9a70d73360 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
@@ -3,13 +3,14 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
-SRC_URI[sha256sum] = "0a54c72259f35299fd033042367df781c2f66d10252955ca1efb7db309b954cb"
+SRCREV = "ec02024c3837255064f248c0d2d331319b75e9ad"
+PYPI_SRC_URI = "git://github.com/ijl/orjson;protocol=https;branch=master;tag=${PV};destsuffix=orjson-${PV}"
 
 CVE_PRODUCT = "orjson"
 
 require ${BPN}-crates.inc
 
-inherit pypi python_maturin cargo-update-recipe-crates
+inherit pypi python_maturin cargo-update-recipe-crates ptest-python-pytest
 
 SRC_URI += " \
     file://0001-Guard-avx512-module-with-x86-target-cfg.patch \
@@ -23,4 +24,22 @@ do_compile:prepend() {
     sed -i "/panic = \"abort\"/d" ${S}/Cargo.toml
 }
 
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/data
+    cp -rf ${S}/data/* ${D}${PTEST_PATH}/data/
+    install -d ${D}${PTEST_PATH}/test
+    cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+}
+
+RDEPENDS:${PN}-ptest += "\
+    python3-dateutil \
+    python3-dateutil-zoneinfo \
+    python3-faker \
+    python3-numpy \
+    python3-pandas \
+    python3-psutil \
+    python3-pytz \
+    python3-tzdata \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


