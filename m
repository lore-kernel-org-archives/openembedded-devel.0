Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.381.1626798678410395658
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 09:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NvaKpNWf;
 spf=pass (domain: linaro.org, ip: 209.85.128.54, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f54.google.com with SMTP id o30-20020a05600c511eb029022e0571d1a0so2393697wms.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 09:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qewsbzfn4wiZQ+9otPu6xnySVA0FkbHn6uejRTBegGo=;
        b=NvaKpNWfmoeQ7HM5co7ycbeI6aa1yW4GLnnIldR4hDQfGpCQix1oOXFFNiWBy70bYn
         nV45nJZ7IcgUZRgRh6RMWVLqHFwKMfOKPqGad0lDbQLvvH9YyuxHR2Ks6MHGk1Jlpz2E
         V4MpKRIcR3/yXCrGNDptx3aeDA87kywkKRZcbTqNAm2Su07xFxImfzxSjpd0ELF5VR14
         lPYt274UAm86YgJCVc8RAlYJ28w+492cG7Q3KTQesUcwLpQYZJHjJinUfQGodkvb4xXd
         zHwnpmoDypNt9+WDakDNOq6+FIRM38/AWtPUnO7usgp3UK6CU7gNpA+Y6r9HoN/OKYzp
         b0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qewsbzfn4wiZQ+9otPu6xnySVA0FkbHn6uejRTBegGo=;
        b=sbIMmIxtGjgZpYUQktOY1aGWzibQTEbrF8KFZO951P8PgcbMvEhAIkO+DURjStRcS+
         uxRF511Z67Z0xJj3d1HPEcnTxkoW6XXzaCo/hRSz0RLi261NsPfG63bOKeBRUMIxBqP3
         M3Kvh5yIXbhYbAcTb3HAQ1/iBF0ebWy4eIcrpAKaql8/8uM/0bB/AoSR87wAOw+fHlv0
         gxMR3goecwrD3VqGP0A6hOjMGFXHrxisCsxOhZVaXEyIONXmFlCN0l+18qy8AeDmWiYS
         LOlipgDcMTKsBy/52ciXztOB+3NxUEr0X9Zp8C84KOjYWBV2UuNbVIBQe2ypr5cDmiS9
         nU4A==
X-Gm-Message-State: AOAM532+6SFpENW1/718Mmhxg2lHhRJSrsIsp6vz8HCiuALPeYZXmce7
	pbFFsry3QMSTFwgD3DqGYcgezo6qRCKgQg==
X-Google-Smtp-Source: ABdhPJxTw8QmJvqB9A9+mJRA4dIgLGi59QcpLW6VpCL9JpZFnHoCoCaZopCUBYgVFif5s6ZdIQO20A==
X-Received: by 2002:a05:600c:3ba7:: with SMTP id n39mr3811186wms.164.1626798676832;
        Tue, 20 Jul 2021 09:31:16 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id l39sm2256731wms.1.2021.07.20.09.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 09:31:16 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 3/5] python3-jinja2: remove recipe
Date: Tue, 20 Jul 2021 18:30:50 +0200
Message-Id: <20210720163052.11295-4-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
References: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was moved to OE-core/dunfell in
cc0f56a788c3 (python3-jinja2: Import from meta-oe/meta-python)

However it was not removed from meta-oe, as such this recipe is now
duplicated, for no good reason. Worse than that, the version in
meta-oe and oe-core differ. OE-core has 2.11.3 and meta-oe is older
with 2.11.2.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../python/python3-jinja2/run-ptest           |  3 --
 .../python/python3-jinja2_2.11.2.bb           | 43 -------------------
 2 files changed, 46 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-jinja2/run-ptest b/meta-python/recipes-devtools/python/python3-jinja2/run-ptest
deleted file mode 100644
index 5cec71169..000000000
--- a/meta-python/recipes-devtools/python/python3-jinja2/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
deleted file mode 100644
index 681acf8f1..000000000
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
-
-SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
-
-PYPI_PACKAGE = "Jinja2"
-
-CLEANBROKEN = "1"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unixadmin \
-"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-markupsafe \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers\
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-threading \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

