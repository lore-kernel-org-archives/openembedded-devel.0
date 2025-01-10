Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B052FE7719E
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:21 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.683.1736539756913562270
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-84cdacbc373so70370739f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539756; x=1737144556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcj0U3YH3PCjTtTRcmDkUFuK1/J7ohu6lyAJzHC8Ylw=;
        b=h7S0JonATykiOrafuJoanU1ISdhrGeKqrOgGMRLNukD7x1lPNUazKfSNbFjomxI+qN
         YxMnx51VhqvddkAKxzET+nkh0hJZqouQvNnMTS3/fK6Mku/Set3bpPFG5jd7jM8ZYkrh
         b7U/9WTxCEpIZRo53m9eTPmX4oHeGXU6dVJsQ7pG1EAbarFP6GImWDEcAu8wlV3ZKFCQ
         cZX4HGV5QyrYsyyH+SmK4zIItaIcQhUOFzscYxv8e9xIZrvM+KfrtdgWYezek9/5rcxN
         KiWNdZ1PfH7f74HJMAenERohUsHU9FOz/ctfHqW75WuAiho1BfgtZ3h5LbLb8XBtdkoG
         Dmdw==
X-Gm-Message-State: AOJu0YzKtoifmFBES7zQ+dcoXj7mC1ivk0KTlqfSXMnmL/GgdR2OmkuW
	zlOESFJ1MJQFA2CSHNPA8nVThGklP2b0gvfPIBtnQnW1K1NJwLY/wLwn2Q==
X-Gm-Gg: ASbGncvZheejOZHSkYQZl1y8gt8dLForFX9BILVctzkIms+2buw3ng83IglNNR47iYP
	S4Y/8U++n27MN/9278QzcrFn+EjlFe8kieHE9uTBBpfDRFsRkfEnOa3lhGYvb99hLwKOIHTqWhB
	UsPFIvyNqMsSv4tW267NwWViGTb1NyVcMowXpgiduWkH/mJCddhU1Mrl88TXigsci0Ju+wyLrRa
	sDlXYk6S8/KxQRFxyyb6WhdsDTkllr1EcSIvrRtIVHAV5k7kVDQyWbc29wdhRtPknP2J+Db1iK0
	KQZO0o5xyjB6PDlq4Dh8u+Odxg==
X-Google-Smtp-Source: AGHT+IFmim7WWAY90j4VLeRWfDR8JNDrlSozJQF70CMhBaY8RcurzzYa3UNijm7GGvmrdtL1qx/YiQ==
X-Received: by 2002:a05:6602:398f:b0:849:c82e:c044 with SMTP id ca18e2360f4ac-84ce00c4981mr1118363539f.8.1736539755727;
        Fri, 10 Jan 2025 12:09:15 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:09:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 09/13] python3-ujson: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:18 +0000
Message-Id: <20250110200822.3958062-9-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114799

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-ujson/run-ptest |  3 ---
 .../recipes-devtools/python/python3-ujson_5.10.0.bb | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ujson/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-ujson/run-ptest b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
deleted file mode 100644
index 4863c5e5a..000000000
--- a/meta-python/recipes-devtools/python/python3-ujson/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-FORCE_COLOR=1 pytest --automake --capture=no
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
index 5f4439c4c..48d51e6fb 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
@@ -6,17 +6,13 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5
 
 SRC_URI[sha256sum] = "b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1"
 
-inherit pypi ptest python_setuptools_build_meta
+inherit pypi ptest-python-pytest python_setuptools_build_meta
 
 # let OE do the strip operation
 export UJSON_BUILD_NO_STRIP = "1"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI += " \
-    file://run-ptest \
-"
-
 RDEPENDS:${PN} += "\
     python3-datetime \
     python3-numbers \
@@ -25,14 +21,7 @@ RDEPENDS:${PN} += "\
 RDEPENDS:${PN}-ptest += " \
     python3-json \
     python3-misc \
-    python3-pytest \
     python3-pytz \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


