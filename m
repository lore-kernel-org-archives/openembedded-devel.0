Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EFDC0218A
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:00:22 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.2828.1737140418194233007
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-844df397754so79926339f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 11:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140416; x=1737745216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ThBbXyphi7TD51IiODKcOx8qRk0rbRjeNI7cnDHNl4=;
        b=FAANtpWfAXbBh4AizDV78x6bJ0EJsif2tr2GTKtinMsjBBPK0y376d9PVsjsmSFH5w
         Fv1wusyqC3ivV3H6cP9mId8mnCg+yKr/QYjHzRlC8YM2kMOifV05joV/awyoCR2S8z/8
         VZwHlZaXfMRTTiS6HT+4uTknc36fzMlg7q0BNxwvO9O31snxvQV9AVRrhFVTKdvBChKW
         g9Z1e/n1LTZPfG51fS5VguB3q7IPq+GLIeQ+4knvyoithGlRb6kGWEPh3ulX1ALkcVVM
         KhTGqvfv+8RGouaM9SIkIQo+a8MokCPcVumR29qsweRgOBplZRaDIuq+1JlPNB6kNWYx
         MQsw==
X-Gm-Message-State: AOJu0YwMxenFOZlxTzRLBjm6+qTwlifNyDohXCYeFLUX7O9dayJdubCI
	5BBb3qF7vjZVs29ox+AMCYeMe2uKh1YyLyh4ON3vAIqoa8TvnCHiY7YNuw==
X-Gm-Gg: ASbGnct/UQ/fjXiEO6ceXTtVP8vnU43Ib/orLKuNEtzx4EqA9U57XyuZqGldreDN8Ne
	kq9fbNrldDH26ZUMWohHJ1yaSNDrGYuyADZlhaWglphXa/CSXO1C0ZOcyKrwc2/qIFWyvt9x9Tz
	JYUmXg6NxUpDBbvP/E26XCLViFZaP+Z1Xue83rxEcLUhpqOtL+KdkRcANSElV9TsmFF+aJXzu6h
	pSOxJ3ybrLSChGRSJvxQKrb5tKKVXByxUbUWUYGqhFbmaBcRVXcsNM9hhns/TNJtEVaz1JRwk0y
	2/A3A0OcNAuPTYpa0XMFwmIOWA==
X-Google-Smtp-Source: AGHT+IGxbDHe05y66x2+hbTO+OcXFYmO1+HX2zS4AotFgq8YY3VcrR2TND8JbnQu2d/xgqdfCfDUeA==
X-Received: by 2002:a05:6602:3e88:b0:84f:41cb:1895 with SMTP id ca18e2360f4ac-851b616dc39mr343698439f.1.1737140416547;
        Fri, 17 Jan 2025 11:00:16 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea75495f5dsm761396173.60.2025.01.17.11.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:00:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 09/10] python3-pytest-localserver: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 18:59:43 +0000
Message-Id: <20250117185944.3434424-9-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117185944.3434424-1-derek@asterius.io>
References: <20250117185944.3434424-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 19:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114930

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-pytest-localserver/run-ptest     |  3 ---
 .../python/python3-pytest-localserver_0.8.1.bb      | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-localserver/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pytest-localserver/run-ptest b/meta-python/recipes-devtools/python/python3-pytest-localserver/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-localserver/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb b/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb
index 669817829..e9500bd3d 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb
@@ -5,25 +5,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8da7a541d738b054dcbf70c31530432"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI[sha256sum] = "66569c34fef31a5750b16effd1cd1288a7a90b59155d005e7f916accd3dee4f1"
 
-SRC_URI += " \
-        file://run-ptest \
-"
-
 RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
 	python3-requests \
-	python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} += " \
 	python3-werkzeug \
 "
-- 
2.34.1


