Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD8FC02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:00:22 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.2752.1737140416724225305
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-844d5444b3dso89951339f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 11:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140415; x=1737745215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QL3elPFBtVQNVM9gQlIHJCW8QgAenM/IBeqUqqA6Fmg=;
        b=LKpUOIj231n3VZObKU1tjdxWBmW+f9mL+Ia+OkbJDLcAqpN6dM4pCpa/QS1vwSa2PW
         eBnWcmme0xkEsW/UIk/GJnEHu4EijpTVDssgyHIMn4BheyuLtIm22Ab9B5it1lqHCmTi
         N9iT4ZUvZsDcLKGyMp5M6qHy7faW5nrvbsvl0AHFg5DCOYVEADOs6VYQEfdq8o85iYir
         5g/BjZxw8AlmNvv43E2+UYi0+9j0oINwoVtxde0VzuriTpxOxCol9WaWEc8M9mA/1AKn
         7Vl68e5O8+UBhNeuh/jnOCH4g4b0yMxsX4EtEKO1z+FXMecjZN5S7PafPzGCP3pV5/Ry
         7juA==
X-Gm-Message-State: AOJu0Yz5pxfKRRcg7OTUVzGnEIRZCk2K/egb5uItIfQx0PvWQHcbGY/p
	CFejW4diukrRtViCiwmXYmMy47+0PLj/1bwPJ0V2v0t0I4Fhlsnm1SbHtA==
X-Gm-Gg: ASbGncukXQmv92W1j1Zes3Rb4Wmx+BEqeT6EizcQ58+6Kz1HnrZajfvF+7IPM6tAnkG
	14FkJ5UR6brEhX5D5jxlEA/LaRHVjKZyqs04nhPnxaZfx48RIy8EAlOoUn7IIhSCiei1ZBiPAwN
	6OuIJnOwd8ztYKphys5ZloTRxjRBTR5w2JZGFnMmTaSfIxnkjxafY9yW53sgcyreGy065paommF
	wYs82g/PkpjOBFbgl9c0NIrSaIBgsil5ryhfdug9oHzHEvahJOpVARYi8jAzl5wdZ6zTm/pDPZB
	aIRkv4QLnai3/vV7K067CqkiTg==
X-Google-Smtp-Source: AGHT+IFMAIa4tr3W912+2A1M4+t6o8rn0vd6TpkXfgiqWNzbbSTB1ulRCb9ekX2ND9s+sdCYDLS7nw==
X-Received: by 2002:a05:6602:3b83:b0:841:ab27:acac with SMTP id ca18e2360f4ac-84f672d4e27mr927180139f.2.1737140415091;
        Fri, 17 Jan 2025 11:00:15 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea75495f5dsm761396173.60.2025.01.17.11.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:00:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 08/10] python3-python-multipart: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 18:59:42 +0000
Message-Id: <20250117185944.3434424-8-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117185944.3434424-1-derek@asterius.io>
References: <20250117185944.3434424-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 19:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114929

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-python-multipart/run-ptest        |  3 ---
 .../python/python3-python-multipart_0.0.20.bb        | 12 +-----------
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-python-multipart/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart/run-ptest b/meta-python/recipes-devtools/python/python3-python-multipart/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-python-multipart/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb
index db5e7bb45..71f9674ec 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb
@@ -4,22 +4,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3d98f0d58b28321924a89ab60c82410e"
 
 SRC_URI[sha256sum] = "8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13"
 
-inherit pypi python_hatchling ptest
+inherit pypi python_hatchling ptest-python-pytest
 
 PYPI_PACKAGE = "python_multipart"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
 RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
 	python3-pyyaml \
-	python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


