Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CADAC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:00:12 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.2744.1737140407151431619
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3ce868498d3so9351465ab.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 11:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140405; x=1737745205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkJsgCnYBwvD8WGt8bz6dPXq867f8feZHmEIo7LEDoE=;
        b=Atbz5sOS3W0d9tyDqEFs1HuumIyteTcS6UWxGCtftPRZuH6Is6ArYT23kksJOUiH4v
         VTZL41I00Ruueok0a6l7RQhxNJlqa7BTJoEGUz+C2Uqc44y7pJnNyGNw5SS7FBsBhKTr
         PJP11vqd9RmF9xcWlw+5UhQ3Z1ISqUMa1FsEyJWWRiDfbbsNjvBsBiRbwbwzmVm58N/Z
         gMM4t0n10weYRenKhQQP/COKtEITN4C1NHCaNIL/+2236QLQYI2Aknnh4jLLFlTKbCvR
         w/NblCpZr9ylWii4xCGaEBYAbcEOomR8A5zWkr5Gz7ojoVEeHlAmRC7PElC0ltyq06u/
         fdmQ==
X-Gm-Message-State: AOJu0YyzGWGNVXBC4WCjalFGOigAzQXCFhh5CHnTqnWblzYxmozWsXEc
	d7jMVuCXprYTMw26aQS2wS8Pk6CQOWQwdf2l1dPBe7r+kVVFHoGX/EcEYA==
X-Gm-Gg: ASbGncvngNa0gj1PQrPbepO3QDyHdGClHQzsJ3fnMypHClneIRCO/iPXclBnB1MRdvw
	53/49jcgKEz8+Hfn1fRA5GLUlaFQOB+T02Tf+IKEzX04dHjponKFvqeP/6ZuA0Pqtusoam8LYRd
	rL1VJXOqg3jwgSC0JPMMWLvUSd2ZoyIe+2oMinvWlUjOzgIS0KNdsAziaIklrJYakNXB5cjACIX
	X0FCWh/yFbxFVRIGWkazB2IyvU0cdItXvtF7glxNzDqdUrE1hPSHLLdhr/zgwUz1u9nNKuYFgve
	kM+rUrnYtfAQ3Ra/FkwjntwKuA==
X-Google-Smtp-Source: AGHT+IFCQhyvQ1m0WRYgJ2T3BD25TzRDQGJXmiRWzmZ/dwXBR71KC+qvlAb9RdEnsHuie/yUA6HNNA==
X-Received: by 2002:a05:6e02:1686:b0:3ce:8cd1:f671 with SMTP id e9e14a558f8ab-3cf744a345cmr29648655ab.21.1737140405457;
        Fri, 17 Jan 2025 11:00:05 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea75495f5dsm761396173.60.2025.01.17.11.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:00:04 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 01/10] python3-semver: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 18:59:35 +0000
Message-Id: <20250117185944.3434424-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 19:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114922

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-semver/run-ptest                |  3 ---
 .../python/python3-semver_3.0.2.bb                 | 14 +-------------
 2 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-semver/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-semver/run-ptest b/meta-python/recipes-devtools/python/python3-semver/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-semver/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb b/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
index 25222bb5f..b329d65e1 100644
--- a/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
@@ -6,21 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d9da679db3bdce30a1b4328d5c474f98"
 
 SRC_URI[sha256sum] = "6253adb39c70f6e51afed2fa7152bcd414c411286088fb4b9effb133885ab4cc"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += " \
-        file://run-ptest \
-"
-
 DEPENDS += " python3-setuptools-scm-native"
 
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-        cp -rf ${S}/tests ${D}${PTEST_PATH}/
-}
-- 
2.34.1


