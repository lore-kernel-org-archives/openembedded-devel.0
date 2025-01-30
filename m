Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F749C02193
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:16 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.6217.1738274290342866496
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a9cdcec53fso9000455ab.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274289; x=1738879089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNvsXcEYfctLhyuvt3rIBUDaDh1/wR5MSmDGthU5+E0=;
        b=QT6I6IJ+ULt/AZmVapJq50HRD4VR6d9Jzaxsi2WX2LdlYlo0iRPCYv/SuNDlSh+1JV
         iuAFT3qXC2pyUTGapI1gw1av1TO15ucv3C4BEaReG5q414PAc+o++OQhCke8b4mTs3AN
         n/ypCaHyRxvi+ZlUBklVSE44MDQkUqlginvhRW5KU5pctNjCMjKfKTNwuOZ4o/ITkYKx
         VLQMTmXBqIiNdwQeobMUd7AuiO7+GXSKv5g+890AX/vp1bfKmxlXV04GwHiE+/58rU1S
         aDNRKT+nuRr8f6jsryUvhjAuHkpbEqp7fZaSg0s0ESETnB/GIqbKlQ1XniQV6blXb6h5
         i1Mg==
X-Gm-Message-State: AOJu0YzXvU9QzDsbzVo++0RMAk0sW9AIrQIJjgTrOn+721a/ZinXOw62
	AIOIlB3usMhMe4PxQw3O3fo92RR59+MyfSm8RqqJwaagCdk1XLqTSvaAqP3/FFo=
X-Gm-Gg: ASbGncukPUyDatSdk8Ct6vX29Id7/yP0898UD4fOpe8S1LWnvW5Sh0lix1/bmvcU/H9
	rzA/9ilzu/pNP/8IL0J3unci1rfBpuZoKzmQ8kJDNPS83XyFQJqQLYdatU3FnffXvwotNE6UlTz
	uvOQYLwy65dzKgrNlRv9I8qNRwJBTkS1p+4n5aVCuON6k2nJCp7AQ7AA4QpLBVgsxA3sCQEEeDQ
	K6e/JYNeKEPmmNTFibMEyHOUdBmJfPbgFEMnawsudjJGSRdZRhvKH+qscAVYZZQdBI9x0B9QbPF
	CDNjM8iFV9zPiNIAKMzdIIhk3ZPVZ+Mu9gnMZKBgWC4ZxBDeLcfV7VdHCXD5
X-Google-Smtp-Source: AGHT+IEXC9E9MimA9y37Q23f0cX5ecXllqtubWpbBtTwdTkE+r2V72PN295P7kpMq8bAgPjzyVXA+Q==
X-Received: by 2002:a92:c569:0:b0:3d0:11ff:5299 with SMTP id e9e14a558f8ab-3d011ff531amr17482485ab.20.1738274288732;
        Thu, 30 Jan 2025 13:58:08 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:08 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 05/23] python3-msgpack: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:20 +0000
Message-Id: <20250130215738.3280576-5-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115159

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-msgpack/run-ptest           |  3 ---
 .../python/python3-msgpack_1.1.0.bb            | 18 +++---------------
 2 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-msgpack/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-msgpack/run-ptest b/meta-python/recipes-devtools/python/python3-msgpack/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-msgpack/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.1.0.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.1.0.bb
index eb04dc2e0f..cf755517e7 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.1.0.bb
@@ -2,7 +2,9 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+PTEST_PYTEST_DIR = "test"
 
 SRC_URI[sha256sum] = "dd432ccc2c72b914e4cb77afce64aab761c1137cc698be3984eee260bcb2896e"
 
@@ -11,17 +13,3 @@ RDEPENDS:${PN}:class-target += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
-}
-- 
2.34.1


