Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9EDC0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:26 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.6226.1738274304741150205
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a7dd54af4bso3243035ab.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274303; x=1738879103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TsHC+VrvrS3s/cLRZqBFaTnn65jTLKprF+RvBEsIoo=;
        b=c+kOvbYitlwT3VvtIx7lIdIQTEj99SNhDkmVy979jnThNwQyIcSp70jVN0A5AMeq+6
         wnRjtZyzT04+Yx18KL6z4pBot+QNiiQYPYx0YxsOAgcL1L/4R4PfC3OeD/H+AbAc17lE
         lMrKS2FpUxh9KWPxtnuSCVCDDQFkXKUcV0w/4b6D7KS6eepuDOlHcrZXgJX/r9KKBoKy
         ZuGYMIBtxY6PtHYQqoodgN5ipXvegcbW48nhL86JG6ptNL1UWLEW/9HhdDKINa/ThaMc
         /lo4HJv7wR899w/PjFDssbp2VqtO3IgOrPBJCPjnYtUciMrkkVSj58nIbgRjhumYwulh
         /Hfw==
X-Gm-Message-State: AOJu0YxDtu9/1M4EJ8+3XLA7X7fbL7MHhMtANodoQy7pzqPkHfNUjbni
	Nb/Mz6rT2SUBHcjfmzcmba+xD02b6qyfodbG+jAi0d5JcjWZ9lCRMlCy0/AX6lA=
X-Gm-Gg: ASbGncvoNFSNXuadAVSUK52snaV3uvqiEg7BrZaDF8obQOvIHaGM+e1QJKpDG1R8X9n
	Aa+JBb4aitnQcsv/nESetWtt4DO0/FjKjs2O4jsSAR5ui9VBb0co+MvMu69Hpr8Dh2vG1Xd6jRz
	PoD7rm70bnsuwpBo1shI9ox3QFQjKIh0BC1/t1lqSf5Xslejzz5my5298jsalHToAaSwgFL/+h5
	mNo5Ed+wkMnWSKl8o9g9I34W/4gqOT8JNa0UiSPQkYtyK6f338SnNdC7kWS12zmzH2CSi9Ak4+P
	JQ03kyuTGldx4f3Zj9gujmPzc39c/G13dsqjeeRKgvmHmb8ZYgy0YGu9O07F
X-Google-Smtp-Source: AGHT+IGJFBI6sHxTWvaXg5vlLEID2hTsisrVgWBJCn+uCM2d6vjEuuH00NC8mVne4c7KLm6xRljBJw==
X-Received: by 2002:a05:6e02:2149:b0:3cf:cbac:3ba6 with SMTP id e9e14a558f8ab-3cffe37cef5mr83188275ab.5.1738274303219;
        Thu, 30 Jan 2025 13:58:23 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 16/23] python3-freezegun: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:31 +0000
Message-Id: <20250130215738.3280576-16-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115170

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-freezegun/run-ptest                 |  3 ---
 .../recipes-devtools/python/python3-freezegun_1.5.1.bb | 10 +---------
 2 files changed, 1 insertion(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-freezegun/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-freezegun/run-ptest b/meta-python/recipes-devtools/python/python3-freezegun/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-freezegun/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb b/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb
index 431843bde4..9d823da507 100644
--- a/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb
@@ -5,24 +5,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=acf1d209bb6eddae4cbe6ffd6a0144fe"
 
 SRC_URI[sha256sum] = "b29dedfcda6d5e8e083ce71b2b542753ad48cfec44037b3fc79702e2980a89e9"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI += " \
-        file://run-ptest \
         file://1777174bb97c0b514033a09b820078b0d117f4a8.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
-        python3-pytest \
         python3-sqlite3 \
-        python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} = "\
         python3-asyncio \
         python3-dateutil \
-- 
2.34.1


