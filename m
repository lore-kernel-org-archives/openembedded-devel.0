Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D39C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 00:51:12 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.24941.1647823871844850108
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mSNY2uY6;
 spf=pass (domain: konsulko.com, ip: 209.85.222.181,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f181.google.com with SMTP id p25so4267341qkj.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lxITFAoFxJ4hWARBzCUzGVlQMVnkRkWY4yZKe4MtnbU=;
        b=mSNY2uY6LoNRAHIEmGBLIBzBLJTWvuWDHJ4B1RmEwOvoaGxI/dv7RREzjdUIjhlmWh
         tzyVCN3K5Uwih3RaV4eGvZjMr5Loh6oKWJkPAG6D7YxCRIweEp0Tvv7VUUkkENN/vaAO
         1YZ/VVzEH6XaO+dWIUXg2bjI5p3u6QUhzhSq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lxITFAoFxJ4hWARBzCUzGVlQMVnkRkWY4yZKe4MtnbU=;
        b=fc20llLCbQNSGxtHDAQyUBHEFvcYMCyQfVLyf3iicqNV3eLhdCOSou00t/qIpI0pVI
         i2iM2vYmcX6VQo3rrYH+iMfuUVMQZWhvLKy3l/Q5iQmi6j563RpOH4jm84r+ZIQNkN/L
         EPlnewvUgfRJ9GBLtOnr8tIJwL1C6kcyDHkuq9on4bTdzTuA9TJVBcQh7y0vq5k8P7hM
         vLIzGjUiqpYH5yI42DkmO8t4md2mJEMQCnbsY1KdUmt7szM9NzwNQnnAPa8hxt3zqd0l
         PrlneZZWXg+38c4CDdWKpZJ0d9Z63BsDeDLWoeWzj4OLoskXkHWSuvUxyo/DcYMmSg9R
         H/yA==
X-Gm-Message-State: AOAM532QUVBs3kM2t4vRNMAGk+xBq+oNgUCRedE6FYCk1OuaZdTKtarJ
	PZJrogTGF3s2xn75yuMSAJ6gpXjrgDMmqQ==
X-Google-Smtp-Source: 
 ABdhPJxsgzoPvYGA/2CKecLcB35jqeZdkuHIy0szHekiIdHn1XNDt9qgHyjxi2SbDim3kWqFEMLImQ==
X-Received: by 2002:a37:b906:0:b0:67e:4497:c3cc with SMTP id
 j6-20020a37b906000000b0067e4497c3ccmr9980104qkf.260.1647823870624;
        Sun, 20 Mar 2022 17:51:10 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm10493790qtx.15.2022.03.20.17.51.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 17:51:10 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/8] python3-pyopenssl: Remove
Date: Sun, 20 Mar 2022 20:50:39 -0400
Message-Id: 
 <abecf9fb4bb720ff1e0dcee3c218ceb98b0a84a4.1647823458.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647823458.git.scott.murray@konsulko.com>
References: <cover.1647823458.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 00:51:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96096

This recipe has been moved to oe-core.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python3-pyopenssl_22.0.0.bb        | 23 -------------------
 2 files changed, 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyopenssl_22.0.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 331c6eba7..a60eef329 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -317,7 +317,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pymysql \
     python3-pynacl \
     python3-pynetlinux \
-    python3-pyopenssl \
     python3-pyparted \
     python3-pyperclip \
     python3-pyperf \
diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_22.0.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
deleted file mode 100644
index db0e809ef..000000000
--- a/meta-python/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Simple Python wrapper around the OpenSSL library"
-HOMEPAGE = "https://pyopenssl.org/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-DEPENDS += "openssl ${PYTHON_PN}-cryptography"
-
-SRC_URI[sha256sum] = "660b1b1425aac4a1bea1d94168a85d99f0b3144c869dd4390d27629d0087f1bf"
-
-PYPI_PACKAGE = "pyOpenSSL"
-inherit pypi setuptools3
-
-PACKAGES =+ "${PN}-tests"
-FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
-
-RDEPENDS:${PN}:class-target = " \
-    ${PYTHON_PN}-cryptography \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-threading \
-"
-RDEPENDS:${PN}-tests = "${PN}"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


