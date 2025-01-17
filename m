Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D36C02188
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:00:22 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.2831.1737140419723602355
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-84a012f7232so118055039f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 11:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140418; x=1737745218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtcdeXe54sH6WNgZCrZ8AA5iPFxjF5V1vnWPVV0zsvI=;
        b=NgFscP1k60DA3CiiqRvrOjgO4Nc0ux1Q2vDGqBNIDh2DhGDPnyWfM1NuXAcbXOYqjk
         xlF0rnogCwGZ95r95evRqzEsUY3DWINT0ZLwSu4gzMknbYKKa31WkC6qS9+RHgo7wduq
         xun01AfYAGGpo6G1OCzaA1hd+T4PR+IBdtBJqlYfoqVr3X9D+5Pfw7dMSAJVW5KWbzzP
         lYOK/n0ReRAKfo6h7/0A1ECCDH223ZNDojocFlHoCyn73kF7ljdYmto/rQ+HiJOMaP24
         zAXUJm8DNVUTDC+DthGx9uIDjBDwmQhdKHC8NcrUrx9hfuBqcMCr6sBIsw2rV2NrroAG
         ADPQ==
X-Gm-Message-State: AOJu0YwYAGFgHm8sxna2R77nj2knSK/MYjXxQt5FVDJ0jOdUexnpV4Z8
	3GMZaXjGdQYGknrAVvcMS4KSouQuQqMjwntcadmO0jyaHwcylZbh3Dy1wg==
X-Gm-Gg: ASbGncveNAY7w7OnqSgHr4rG97L9Mm4n09GdstgK6Djppeya+H139ED6zDrI2sjqB0v
	IT9F1eG0cP9jZ1y+6wm3iiakmGDz+ymHHVMlpHBv/gkGFo65fBHLXNawEuEGoDUZbxwXoh6odHa
	jrC/QUH4QAkKHxnbFNJBQu9EQ7d4ev7zSvrpJ9kzwU9eJTv9rniop+VqSrTT5VeAJRb/Fw5rQG6
	l36JGDWWiyNE/MfbWC/NPgBNFJBsJwVhxbKBU/LpY6sNL9GgXQkoqOP9qXS9wnSkqbnPI4F+44N
	DwovMAazHib5+HbLc5ZvotRuqg==
X-Google-Smtp-Source: AGHT+IHFKiZD08Ah+HLn3ySmFk1PK7rHMfsgQhGjBsNVDSPmW0Y1VeFkfte8LveX/SYzZjEGsuPd4A==
X-Received: by 2002:a92:d48c:0:b0:3cf:6f63:fb51 with SMTP id e9e14a558f8ab-3cf6f63fc78mr50075525ab.10.1737140418022;
        Fri, 17 Jan 2025 11:00:18 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea75495f5dsm761396173.60.2025.01.17.11.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:00:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 10/10] python3-pyserial: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 18:59:44 +0000
Message-Id: <20250117185944.3434424-10-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117185944.3434424-1-derek@asterius.io>
References: <20250117185944.3434424-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 19:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114931

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-pyserial/run-ptest           |  4 ----
 .../python/python3-pyserial_3.5.bb              | 17 +++--------------
 2 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyserial/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pyserial/run-ptest b/meta-python/recipes-devtools/python/python3-pyserial/run-ptest
deleted file mode 100644
index b651411db..000000000
--- a/meta-python/recipes-devtools/python/python3-pyserial/run-ptest
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
index ade137a38..93a81568c 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=520e45e59fc2cf94aa53850f46b86436"
 
 SRC_URI[sha256sum] = "3c77e014170dfffbd816e6ffc205e9842efb10be9f58ec16d3e8675b4925cddb"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
+
+PTEST_PYTEST_DIR = "test"
 
 do_install:append() {
     rm -f ${D}${bindir}/pyserial-miniterm
@@ -49,16 +51,3 @@ RDEPENDS:${PN} = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
-}
-- 
2.34.1


