Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F131CC02195
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 01:40:07 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.10527.1738287607110096767
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 17:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71e3005916aso423484a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 17:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287606; x=1738892406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVUVaM0WtuxsdnoFjDEJ0XMpfPG6hFra5lID3Sv9nek=;
        b=eLMSQERsbhBqOcaBJrALrK7U1dspModFYsGtcKHLRsVNVWST0fqMeTcP6VncF7kKQi
         vlk+G9rKEdtxpijNjZTkCHlZcRs/KoHg6YSdkBVMXtF9qdmKUlxut49LCopQmHMdzTlO
         qVDRyL/rV3MuIsfEKu7M4zjwIOnyYOeDNG64ntX3cCetxbIDC5MyevW03GGJrP5efyDv
         Z0q7t2plkAQNYETCdG3jxGgbIVmCE1RLQOhav8MdrShWff55Fy1+IkcakIQxOxJ9kJuH
         UD+CKYy23r3S9mHxav+JPsm5XRFCyekQP//k2/nDWtu81Ab5o4bzJ1dfbwo1PIevWQsl
         nGGA==
X-Gm-Message-State: AOJu0YzTdlJ1x0VFuCWl8e7B2ArmdmmzND6CHmo6T7a3hVrKQGXpEPv7
	sefP4jct8m2Yytm6JPG4lRG2KUtPQx8Qx86bPbfsyYx1JhCVL1XpWmSzSXtu
X-Gm-Gg: ASbGnct1VKytWGXO/M5aUSOlEqucofPH0RFibYrbxzltHhol/C8Co23lpRH/ViKkQwY
	0cAqj1mJGmPKVGFvSfJAeSpX3KJHWKf1rWZgELO1x5HkNcg1sDCA0gm3NHlu8lEc/M/oMcEmznM
	hVQET10KpLN/+hb4Bm3TiHAWGJSFRvoqSiMWQ7sP4GxvbuBmOO4wz4tfO8Qbw68FEx1ARFbZ2Sf
	M3S51HUkFioXZmpIXhuSq8KH1i4FXI2SEfDhNmKWh3WD+yfXGEZl/k+ChwxoV/TOtBd4uQzkOf0
	g0bWEkfhtvW77LTAni6MYlRgJWIfqOmFslAgV/YAAtVsChS22U2Lwme8IJRf
X-Google-Smtp-Source: AGHT+IFy660LKiMALx1aFYCpesT/6SDkLfMbpY1yzmCKcGkWbHS0BymAFmS9us0Pj2ynMB+jyMmpfg==
X-Received: by 2002:a05:6830:6999:b0:71d:fb64:b606 with SMTP id 46e09a7af769-726568e9d91mr6253035a34.23.1738287605972;
        Thu, 30 Jan 2025 17:40:05 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f49sm659875a34.54.2025.01.30.17.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:40:04 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 08/11] python3-cbor2: update recipe to use the ptest-python-pytest class
Date: Fri, 31 Jan 2025 01:39:32 +0000
Message-Id: <20250131013935.3714521-8-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131013935.3714521-1-derek@asterius.io>
References: <20250131013935.3714521-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 01:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115185

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-cbor2/run-ptest  |  3 ---
 .../recipes-devtools/python/python3-cbor2_5.6.5.bb   | 12 +-----------
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-cbor2/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-cbor2/run-ptest b/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.5.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.5.bb
index 6dd9f0cd15..834bad6865 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.5.bb
@@ -4,21 +4,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
 SRC_URI[sha256sum] = "b682820677ee1dbba45f7da11898d2720f92e06be36acec290867d5ebf3d7e09"
-SRC_URI += " \
-        file://run-ptest \
-"
-
-inherit pypi python_setuptools_build_meta ptest
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \
     python3-hypothesis \
-    python3-pytest \
-    python3-unittest-automake-output \
     python3-unixadmin \
 "
 RDEPENDS:${PN} += " \
-- 
2.34.1


