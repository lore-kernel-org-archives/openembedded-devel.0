Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC63C02198
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:26 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.6255.1738274302551396280
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d00a6b26e4so11066285ab.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274301; x=1738879101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gQeS4v95ikqNTN1oJrbcLGk8iP2STrTTXzNFaNDZI8=;
        b=dmRe0Dd050ddXwPlm4q4vPBcJv2iKScm8zeRNssOjWzod6Rftz88OgUAycSYH0+fY4
         R8fweo49HFdYJkmMOdGILNXTURoxRDmGB+BPC9/fsTKrwRePraYbAECcbOi17ZztxvB3
         MxMc8dNW33+gQzgjL0fA04wbj9aqHl52psymSgrWQB6Z/ATAMPSj2cfnpaOfwGnOvQ00
         jJH4bu0kA1evasxmbjdLmJaYNBUnunINiIcQJCEvVGPUkmf2vz7NFrvRojwYwvr29qLt
         9EAS5rN1f9Eu6BjhsPH2Fq+OCpNb4uPKzGEzPInTiLmzZWF9my6GU//ydHAtcuFEkoE3
         ebpg==
X-Gm-Message-State: AOJu0YwjTI4z7gLXnizTVVZr4nah3G4Sqn3m9m8R3qJEPCZXDy98W3x6
	ZqXgEEEbadEVA3h+3rwVQtATjWE1RND4uIUsiNAw0AUrQq+G0fKXTWV+jQWSt4s=
X-Gm-Gg: ASbGncvntxbj/RXExZFF4x6/KNTPljtd3QZeH92XJDm9DQWcmJ+Padz3+gdO5y4XWgb
	yLv1EJ3p5Bv43VZLB4EYxU0OhfNOS7OABfJL4o480J+Zz6wL4vkQ7P7jhX8wFRulL4j8N6Pjai6
	D6xzPtqjPsUsTHfFUN/+ASYTjxFk0Chqu4w2zFaxqPj0mThCpYMDmHmoLxLmYEgfPM77m2Ppcqg
	XKurpoQr1DUFZlXadjLbxQ53Pc4sjZUsz316TZQM3O9GGV0g6TUk/Cfvn6UvOk2ZfrI69Qm9LP6
	v/FWbFUS3A6wyDYFDIAuy5DFsW4QDvKP/B/nQXuco8I8jsTRLm34U4XyKmf/
X-Google-Smtp-Source: AGHT+IFE2v0wXdgF9LMajqpfaywLnuOam4a3aMPeeiibSVP/z6LKlvxJOYL3hwOyPtHhSwapzJUiWw==
X-Received: by 2002:a05:6e02:3101:b0:3ce:69ca:ef99 with SMTP id e9e14a558f8ab-3cffe3e5e4amr90689685ab.6.1738274301390;
        Thu, 30 Jan 2025 13:58:21 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:20 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 15/23] python3-geojson: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:30 +0000
Message-Id: <20250130215738.3280576-15-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115169

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-geojson/run-ptest               |  3 ---
 .../python/python3-geojson_3.2.0.bb                | 14 +-------------
 2 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-geojson/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-geojson/run-ptest b/meta-python/recipes-devtools/python/python3-geojson/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-geojson/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb b/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb
index c7bf433d42..9ee6d580b2 100644
--- a/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb
@@ -5,19 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=f77f2ed49768c8d4c79ba874c0f94d8a"
 
 SRC_URI[sha256sum] = "b860baba1e8c6f71f8f5f6e3949a694daccf40820fa8f138b3f712bd85804903"
 
-inherit pypi setuptools3 ptest
-
-SRC_URI += "file://run-ptest"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
+inherit pypi setuptools3 ptest-python-pytest
 
 RDEPENDS:${PN} += "python3-simplejson python3-math"
 
-- 
2.34.1


