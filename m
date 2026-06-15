Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC766CD98E2
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 15:13:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.131867.1781536406464376356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 08:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=e/B73Ecw;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso24669025e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 08:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781536405; x=1782141205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s20iwsCN0gwfaMIAqezaot+v4XG+uByhThgF02VqQ60=;
        b=e/B73EcwXL/FkHRJoKaR0kR2Ie4qbNZuQoe5xR0ROdMPBvvCfS+5u+hZSt+ATFRVK1
         BUmerCp/9OhNQCje1R4rQTrFt3w0dTEbM91toXztDSnxi1jKXW3lMk9nV6c3vkEla55J
         4jfZn0XRiMoZLorj9hH1HJwRxL5rpWJOP9G24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536405; x=1782141205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s20iwsCN0gwfaMIAqezaot+v4XG+uByhThgF02VqQ60=;
        b=gnPQgQhcLrmSWC0M1fDaj/hrSPgQ8GBEFbVJW3na1W4KGxzAo9og5txha2avJf/r1u
         PD80TnxgcWVilZQs2PVZCCWaGIguPjp290uQ6ZVYaxaGnqoxeNga7/X4nAUWz8sjN8yq
         GsHZ4CTRn7G+pBYnidGEqYPudCRPcfEg/vxVYBkGHvVUkjkfjWzA10Q3Vtb71psX8809
         1mscoiMGjmBWxg7n/63HoKBCTf+rieAwpJTXKyu6I+6J46uVIaRDp/qXAfgFPpy9A+2z
         YK4d1tv1aJKZVS/7ZYov4q6oQ/yJPEcsLnCMoNIeG+otGZrjDbdpgeLqTwDEBNTKMQhf
         nHuQ==
X-Gm-Message-State: AOJu0YzSNspDZOpgfBgHVjPUrwqygNK6BKa9RBcDWk09c/omh+706Hrq
	2xzdGwtvlEhZLhn+H/P5Z85UNlhvgauTU4tlDSBAKulHLpOsneFyryFiDtLlJgEvGl5RTIrbeV+
	wCz6G
X-Gm-Gg: Acq92OH7lEfsUF2qN74lrX7usofraUrJWtvGdg228El4jcIA/HIGIqwjy7kaM+6R3Wj
	TTrqtL0GVqbf5q3DsEDIb+B9vtQyJ/9lnMwNuanYHeZ9qQFtQf97fOtoILpZ4aJEN0493cKw6zx
	o5BYOdZ+inwNWjeuMZfCWGijB98TpqhMYwrnQtTr9Z6m/qChEUIuKKdNplvMB3K/zWTG/AGnAVT
	gEt2Z7H2zOtnb2DzNM02GqfnvWrbOWx/z2Y8+X1/u9yg6yJ73NNNNDLkIYAFDJrceNzxxEEYNww
	wsuqbBt3VdeL9MLDcNSLY20kn983E4/HvecUIknBGR8Z7fBC2igfoQ/6eXmmFSKu7azlTd+aIkk
	PfeLja+jiQApbQqd5vnO46QYAXqOK2HpUmqZ/XLrMCz1fSozhKfOa8a+Ymezu7aOKUckcG4048j
	p5wLqjXRrdq5My6lo//5UXt5AEAVnYVyHSt31dUGRGH4CEPRs=
X-Received: by 2002:a05:600c:e548:10b0:490:b475:af32 with SMTP id 5b1f17b1804b1-490ec5018bcmr127851775e9.23.1781536404451;
        Mon, 15 Jun 2026 08:13:24 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4b2e8esm219066395e9.0.2026.06.15.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:13:23 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-bleak: Upgrade 3.0.1 -> 3.0.2
Date: Mon, 15 Jun 2026 18:13:16 +0300
Message-ID: <20260615151316.3273340-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615151316.3273340-1-leon.anavi@konsulko.com>
References: <20260615151316.3273340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 15:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127590

Upgrade to release 3.0.2:

- Changed default value of BlueZNotifyArgs.use_start_notify to True.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...leak-Support-newer-uv_build-versions.patch | 30 +++++++++++++++++++
 ...-bleak_3.0.1.bb => python3-bleak_3.0.2.bb} | 14 ++++++---
 2 files changed, 40 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch
 rename meta-python/recipes-devtools/python/{python3-bleak_3.0.1.bb => python3-bleak_3.0.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch b/meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch
new file mode 100644
index 0000000000..bead8f3be6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch
@@ -0,0 +1,30 @@
+From 2e0994321b57e547a3c1f7e1f225e55ca007e45f Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 15 Jun 2026 17:53:47 +0300
+Subject: [PATCH] bleak: Support newer uv_build versions
+
+Support newer uv_build versions
+
+Upstream-Status: Submitted [https://github.com/hbldh/bleak/pull/2001]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 3224afc..4be6da7 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -66,7 +66,7 @@ dev = [
+ ]
+ 
+ [build-system]
+-requires = ["uv_build>=0.10.9,<0.11.0"]
++requires = ["uv_build>=0.10.9,<0.12.0"]
+ build-backend = "uv_build"
+ 
+ [tool.uv.build-backend]
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-bleak_3.0.1.bb b/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-bleak_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb
index 89f7c973d5..c84b6bbc8d 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb
@@ -3,13 +3,19 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "3f967abe9ef454bd494055612a067f2128944df2"
-PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;destsuffix=${S};tag=v${PV}"
-
-SRC_URI:append = " file://run-ptest"
+SRC_URI:append = " \
+	file://run-ptest \
+	file://0001-bleak-Support-newer-uv_build-versions.patch \
+"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
+SRC_URI[sha256sum] = "c2229cb8238d5876b4bd05c74bf7a1aea1f88da39d2e51ac9dfd5cc319d5265f"
+
+DEPENDS += "\
+	python3-uv-build-native \
+"
+
 RDEPENDS:${PN}-ptest += " \
 	python3-asyncio \
 	python3-pytest-asyncio \
-- 
2.47.3


