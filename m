Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689C7C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 00:51:14 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web09.25321.1647823873022595599
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IV3uWLIF;
 spf=pass (domain: konsulko.com, ip: 209.85.219.45,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f45.google.com with SMTP id kj22so45392qvb.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jRlt3dbpBs9jux532Bx2cHamiasT3u4PH/YrOZEYa6A=;
        b=IV3uWLIFAU905igszln7wdsGvNsHqJDo5Zh7r+C9ttvoE/AzIUBog1swhzdNU/vxyu
         oqS0g1bWdeo7obLmw5+gWeMWs/vlYwZQc1NFefNkToZZf2zKeG949Zo/r0nLIEYdCzDO
         LQMzkvdCh0MREZsliBrmhPTDzVKIiW/v05EqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jRlt3dbpBs9jux532Bx2cHamiasT3u4PH/YrOZEYa6A=;
        b=mLi/gLZl6A1TxSyjh98UB/6JxLfe2ylpdowx9BUVH9JmhocPQ1UVVNgcKumNO6hAdD
         ASUdyMfCiMumK60qXn73NsTJt/r8IEZWmItkG7cYd0d6yyxOu3IIFMF/9NIra6NnLFtk
         wBpa51o10dxev5b2E8/1AoFoHnkZjPgnabe5cgB3WNVx+0heaimCaiPgkWwxpW5KmjJS
         DhpP9MzpHspFL6jbNo9+V4woZ7pJ1qH2XYmN75/P3BxMpkwyFv41DqrfnXqdoMDh+UYD
         +vQVULVHOtr4uT1gaJAm3708etT5juEnsVd2gg39ZrjA5HreGxezsF/80x947UOHIp3A
         UBUw==
X-Gm-Message-State: AOAM532UstHnM+LG74clVEDQdoBvgskb9N25Jo57K9eHOOzsLISuXCTF
	RkgABqAfGwgLZd/1MPl/EtYtk2Ua5Xt5cg==
X-Google-Smtp-Source: 
 ABdhPJyiwju24vbv/qG1kL0cX69T+WSL+2gyD8h13MjSHhCPLSlZKhpOwwetvx7s7kH5SrZBxUFgOg==
X-Received: by 2002:a05:6214:d67:b0:440:ab2b:b2e3 with SMTP id
 7-20020a0562140d6700b00440ab2bb2e3mr14082817qvs.71.1647823871829;
        Sun, 20 Mar 2022 17:51:11 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm10493790qtx.15.2022.03.20.17.51.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 17:51:11 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/8] python3-pysocks: Remove
Date: Sun, 20 Mar 2022 20:50:40 -0400
Message-Id: 
 <7c021950e19acf41af245a5310e8e817a9c4e8b6.1647823458.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647823458.git.scott.murray@konsulko.com>
References: <cover.1647823458.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 00:51:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96097

This recipe has been moved to oe-core.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python3-pysocks_1.7.1.bb           | 20 -------------------
 2 files changed, 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index a60eef329..1f78c7dc9 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -326,7 +326,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pyrsistent \
     python3-pyscaffold \
     python3-pyserial \
-    python3-pysocks \
     python3-pysonos \
     python3-pystemd \
     python3-pytest-asyncio \
diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb
deleted file mode 100644
index 914440170..000000000
--- a/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "A Python SOCKS client module"
-HOMEPAGE = "http://python-requests.org"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
-
-SRC_URI[md5sum] = "89b1a6865c61bae67a32417517612ee6"
-SRC_URI[sha256sum] = "3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0"
-
-PYPI_PACKAGE = "PySocks"
-inherit pypi setuptools3
-
-RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-shell \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


