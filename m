Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCC3C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 05:52:05 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.14765.1709877116706783048
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 21:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LEDerx8N;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51344bebe2fso493457e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 21:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709877114; x=1710481914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFdFJYDjwin/iY4vqluigpzqfDfI35FSJqYg0NbKwEc=;
        b=LEDerx8NA9/tQMyTCepYePWHhi6oYkYaP/lFAt2QkwYgDpaMdFjmsPb6S9hkx0ZO9L
         XCtLfj0ISWtUciKU4kC1spUyE74mlb9Zt40OYxCOg/CQmTyQsY/SOjILAOLDlFfXum10
         8gsMO3G1YMz42pYnakzKCR/AU9W3EZaV2Fy9PFaHJhWWPRQH7MK/aisDJSu+zUCfat7p
         TBVKRmvmJq6EJXuhFTNE/nLhTOLhSRrY9nN5xKUfQfmYuh7NzPys/d0SOrLAaQopq6S5
         BQjOd5CoIKnr5OlW19qolHYUZ//8w/83STgvTsn2THo/GHv6Hd9xTS9NNSvNtmN/pGDg
         U6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709877114; x=1710481914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFdFJYDjwin/iY4vqluigpzqfDfI35FSJqYg0NbKwEc=;
        b=ovTP6tzx+VW00hOIdtJR8LYg7l5aWOCxrl2beVXQ/kyfU1qVRsCYXYxPRZh6ebqw5e
         eXIHpP+W95Ldu0gUgvvfR60Vqa+PIibvQeDGXCny3DyXDiaGOlFt+2DQd4SdRbTOfhyg
         m3illbkF5U/2UcTg1mwBjz3ez99OGNRXi8daybtw5ECQtrjKKbSyUO5km1PhMujdwBX9
         xKE2On5ITWTiyNNUVV4dxlEzcSViezn2pPOVq8BbMvl9Vl3kjKrOajwkqbdN9IZiHKWb
         WCRO+BzWTlU7IaXoOI02AmOC8yrTifLETNKHhzJ4mf2wzRzsgiFWdU58L+KM+rqjSB8Y
         vPFQ==
X-Gm-Message-State: AOJu0YxkX9CEWcUjrLSkt07ZX9+Su+x+uAGzJfyZ/FF7Mb8X1ByJIHER
	ZZ4gyfAHu41iJp7HGhbHVnOc8AKSLjbx+JWPnoCYGZsbDhiP5ZIj0wY74YqBZ18=
X-Google-Smtp-Source: AGHT+IGAIbvkEIcfES8Xd8nudsrhT8eL2KRJZaBHHSkp5TnuHli1wfDbncX2GsqgK3uSijFFY4VClw==
X-Received: by 2002:a05:6512:3194:b0:513:8318:c6ea with SMTP id i20-20020a056512319400b005138318c6eamr2648653lfe.39.1709877113805;
        Thu, 07 Mar 2024 21:51:53 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id bt12-20020a056000080c00b0033e3a110d7fsm13829593wrb.71.2024.03.07.21.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:51:53 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-google-auth: add ptest and update runtime dependencies
Date: Fri,  8 Mar 2024 08:51:36 +0300
Message-Id: <20240308055136.81476-3-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308055136.81476-1-alperyasinak1@gmail.com>
References: <20240308055136.81476-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 05:52:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109221

* Generally we want to keep images as small as possible. RDEPENDS should not contains nothing except what is absolutely needed for a recipe.

* Tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_SLOW_META_PYTHON

Ptest results:
==============
qemux86-64:

Testsuite summary
TOTAL: 1074
PASS: 1074
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 227
END: /usr/lib/python3-google-auth/ptest
2024-03-07T21:30
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 1074
PASS: 1074
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 184
END: /usr/lib/python3-google-auth/ptest
2024-03-07T21:15
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-google-auth/run-ptest      |  4 ++
 .../python/python3-google-auth_2.28.1.bb      | 43 +++++++++++++------
 3 files changed, 34 insertions(+), 14 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-auth/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ce5ccf22d..63457189e 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -78,6 +78,7 @@ PTESTS_FAST_META_PYTHON = "\
 
 PTESTS_SLOW_META_PYTHON = "\
     python3-arrow \
+    python3-google-auth \
     python3-lz4 \
     python3-marshmallow \
     python3-pytest-localserver \
diff --git a/meta-python/recipes-devtools/python/python3-google-auth/run-ptest b/meta-python/recipes-devtools/python/python3-google-auth/run-ptest
new file mode 100644
index 000000000..f1c8729f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-auth/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+pytest --automake
+
diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.28.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.28.1.bb
index 4524cca48..1f37544d2 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.28.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.28.1.bb
@@ -3,24 +3,39 @@ HOMEPAGE = "https://github.com/googleapis/google-auth-library-python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
 SRC_URI[sha256sum] = "34fc3046c257cedcf1622fc4b31fc2be7923d9b4d44973d481125ecc50d83885"
 
-RDEPENDS:${PN} += "\
-    python3-asyncio \
-    python3-datetime \
-    python3-io \
-    python3-json \
-    python3-logging \
-    python3-netclient \
-    python3-numbers \
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        python3-cryptography \
+        python3-flask \
+        python3-freezegun \
+        python3-grpcio \
+        python3-mock \
+        python3-oauth2client \
+        python3-pyopenssl \
+        python3-pytest \
+        python3-pytest-localserver \
+        python3-pyu2f \
+        python3-requests \
+        python3-responses \
+        python3-unittest-automake-output \
+        python3-unixadmin \
 "
 
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
 RDEPENDS:${PN} += "\
-    python3-aiohttp \
-    python3-cachetools \
-    python3-pyasn1-modules \
-    python3-rsa \
-    python3-six \
+        python3-cachetools \
+        python3-json \
+        python3-pyasn1-modules \
+        python3-rsa \
 "
-- 
2.25.1


