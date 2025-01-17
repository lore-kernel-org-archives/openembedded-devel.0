Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4BDC0218C
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 20:30:52 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.4847.1737145844812712179
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 12:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-84cdacbc3dbso198732939f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 12:30:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737145843; x=1737750643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ0+cGofEA+r5LvUHoQHzUBWvFYM55f9fRc1E5+yymQ=;
        b=bT8JdbrVfrtQcUV4faISRSYBgXVMNVTrCzJ8D17vVGC+YW7EVCe8HlzOC3qSQuYy0f
         qDhWk0pThscZURntjR38Bv2coW/Tynt7Rl80L1zglvjYc+x7MHTRMSA32ja4gDwejLBT
         az86yCfzR4oPrJTmmJ/NLOlwIdLOhZh8vg4+hYLdG+Y2wJceqi1FSeXZRTdycRx4yXae
         W+cvdACmhEjD/bEric6IiW3iYEtWbGAZve1KzTZJ2uwObSWfdTr15dPpPn+ujWI94F1k
         NFcamJzT+k80WfqdwDoJLkxVOaQtnlXEgcFJ0A9hp19cCU8NxtRQlTcvTX6Lg5jeyX28
         fOfQ==
X-Gm-Message-State: AOJu0YytHIlc5NcSaA/VnzA1Cf8M6iKgL8wlVu8y9Armsmvh68eYgXf7
	Y2gZvw7eVdWT0IN9Sa5NCei01kwGPABE5n5DztHrCR5oFKhFCylcykmCUA==
X-Gm-Gg: ASbGncv8GCuXRMurKaqEVDJfLeYu97Iw8DkJniBYG2kQTUf9wDLboKUEAF20F3VWPSW
	JRYyrUtHfJ2VRe1XihGJZ/ns7Wffd89oKylaCES4RcRSD/Eb+ugz8tXduaQZn78fcjDcmBsyzUr
	AH6LhkXtUqfSTa/lVMPHQIOMQlZjkmZugrz+luHcjahkWUbc3a4zWMvm07VLiElS6EoW0l6C1Pe
	/pJj801qpwqqT4P3gLClr1Tc2HbTST9YVfNGwLlbO6FFNHSoMrwjlZbWTS5k4QM8qVYykj6dleB
	hNXH2NAICht2rxxgWKoUeQYxbA==
X-Google-Smtp-Source: AGHT+IHPXNoH5vr6CJligKDk3/f3qeuUpso50DPuy4SIwVqvKlK15ogq1aKqMvXtLjrWAfxKnBnpTA==
X-Received: by 2002:a05:6602:15d1:b0:844:debf:2c8f with SMTP id ca18e2360f4ac-851b64cf92cmr374824739f.14.1737145843657;
        Fri, 17 Jan 2025 12:30:43 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7566e687sm801814173.128.2025.01.17.12.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:30:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 03/10] python3-pydantic-core: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 20:30:23 +0000
Message-Id: <20250117203030.3648575-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117203030.3648575-1-derek@asterius.io>
References: <20250117203030.3648575-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 20:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114936

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-pydantic-core/run-ptest               | 3 ---
 .../python/python3-pydantic-core_2.27.2.bb               | 9 ++-------
 2 files changed, 2 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/run-ptest b/meta-python/recipes-devtools/python/python3-pydantic-core/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
index 52571ff2c..5dd76f99f 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
@@ -10,13 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
 require ${BPN}-crates.inc
 
-SRC_URI += "file://run-ptest"
-
 SRC_URI[sha256sum] = "eb026e5a4c1fee05726072337ff51d1efb6f59090b7da90d30ea58625b1ffb39"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
-inherit pypi cargo-update-recipe-crates python_maturin
+inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pytest
 
 PYPI_PACKAGE = "pydantic_core"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
@@ -30,23 +28,20 @@ INSANE_SKIP:${PN} = "already-stripped"
 INSANE_SKIP:${PN} += "buildpaths"
 
 # python3-misc is for Lib/timeit.py which is not split out elsewhere
-inherit ptest
 RDEPENDS:${PN}-ptest += "\
 	python3-dateutil \
     python3-dirty-equals \
     python3-hypothesis \
     python3-inline-snapshot \
     python3-misc \
-    python3-pytest \
     python3-pytest-mock \
     python3-pytest-timeout \
     python3-pytest-benchmark \
 	python3-tzdata \
-    python3-unittest-automake-output \
 	python3-zoneinfo \
 "
 
-do_install_ptest() {
+do_install_ptest:append () {
     cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
     sed -i -e "/--automake/ s/$/ -k 'not test_model_class_root_validator_wrap and not test_model_class_root_validator_before and not test_model_class_root_validator_after'/" ${D}${PTEST_PATH}/run-ptest
 }
-- 
2.34.1


