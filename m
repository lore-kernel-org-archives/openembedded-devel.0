Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877BEC02181
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 22:32:02 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.3972.1736548317044032670
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 14:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-844d7f81dd1so85789639f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 14:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736548315; x=1737153115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ou42qppo9I801/lagapl/tC9YOBdW83wTPWWkxkxtdM=;
        b=R+o9GDcjINr8hET+OXlwI9pEMzcKhOe1AidV/i3/MmRGf46YqEaHiZ+fE+gM7a1DNy
         THP3ikl2DY24HF2pwhTlJ4S1oWntZJL4Nq7PvpOQDOlpPor6XAPxGNM5rMrXAbujOdhP
         xRGpmk5js6tdVlzIf6tNWYqhULb+eTpq2SDWDcIivc1BOnoJnlRPVkiDSquoggOlWinQ
         WrjluRuPVS2VvxGRRD1386vDKH7i/8WZEiajfWddhV/yGwBsQh+iZpTS/5az7GNMsQTi
         WW4Kf2RALZAsm1aV35Nrh1x+jpSptR0GJ5KvZn9APkdz1Xv78WzUlWdtgZUOMzELRmnY
         wStw==
X-Gm-Message-State: AOJu0YxipP5gv8iYNp9N02DBdH3CIP6veasK66toS2NDbXx0JNZBXsRu
	Zq2pL7iOve0vKTSApq+NYFqrS8pT1kyYXoCJmieTON/ZpQUvtc/pwCjWJQ==
X-Gm-Gg: ASbGnctuFEHS8+/hVT2VYMJJoGjMwogQSX43t6suP0K2m8lGAdQOIsk+X6aF4w4zXlg
	EeGRE3dr/OSwZRu5bXxwMYGybtlA3mz+tW4yowSljtuV+hPLCdauLf16PcLjA/hD8BYuxEjPkcA
	UDwPtDP9hnb3mgJ/vMw4xbk5Fb6eIOmdS1os4RG93Hy/iknL/edCcCWnbeF0L3ATi6n2YV7jFsE
	S0UYhABcJI9cI7UwSx+1wCSp1flYQy7EQzs1+6R+WcFbfPBMo10/UVEe562nCWX9pIEkJKbcr9f
	VIuJhXR2mfqH+SgomWdevf8mwg==
X-Google-Smtp-Source: AGHT+IH0t/kNiPyVABsLWbEweEBVDU8BOHezPX065l3lqw5GjvXg5e8xXiXQfW2jDgHO/a/zQ7WN2Q==
X-Received: by 2002:a05:6e02:3f09:b0:3ce:473d:9cb6 with SMTP id e9e14a558f8ab-3ce473d9f96mr67871005ab.4.1736548315439;
        Fri, 10 Jan 2025 14:31:55 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b614781sm1120035173.44.2025.01.10.14.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 14:31:54 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 4/5] python3-service-identity: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 22:31:33 +0000
Message-Id: <20250110223134.4177993-4-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110223134.4177993-1-derek@asterius.io>
References: <20250110223134.4177993-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 22:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114813

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-service-identity/run-ptest       |  3 ---
 .../python/python3-service-identity_24.2.0.bb       | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-service-identity/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-service-identity/run-ptest b/meta-python/recipes-devtools/python/python3-service-identity/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-service-identity/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb
index 12dae861d..bbd6ab80d 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb
@@ -6,15 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76edce6a3fa1b82b0bf2b6ce174c19e2"
 
 SRC_URI[sha256sum] = "b8683ba13f0d39c6cd5d625d2c5f65421d6d707b013b375c355751557cbe8e09"
 
-inherit pypi python_hatchling ptest
+inherit pypi python_hatchling ptest-python-pytest
 
 PYPI_PACKAGE = "service_identity"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
 DEPENDS += "python3-hatch-vcs-native python3-hatch-fancy-pypi-readme-native"
 
 RDEPENDS:${PN} += " \
@@ -25,13 +21,6 @@ RDEPENDS:${PN} += " \
 
 RDEPENDS:${PN}-ptest += " \
     python3-attrs \
-    python3-pytest \
     python3-six \
-    python3-unittest-automake-output \
     python3-pyopenssl \
 "
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


