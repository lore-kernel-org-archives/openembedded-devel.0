Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B391C43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 13:32:59 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8787.1783517575423308636
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 06:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IQBk1BPi;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so5272715e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 06:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783517574; x=1784122374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dlL1SNt6SAV5dow8PH0fuCDrHeOm0+49JC2bm/ch/s=;
        b=IQBk1BPiZf4+aVYF5FfAWHP/0j2bMpFsHs2jrZimL6CYpwDmfuGnKKzYxYjphWi148
         ELVdPiSVHO3e6zkDoQinwq5G4OUXuyLo9U9/GuPumYmn26XK3z0s6poY8LKD4iEcNYNd
         uSWZz7XiqX4SFVfjQUQabP+xZfBDXydfD2u2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517574; x=1784122374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8dlL1SNt6SAV5dow8PH0fuCDrHeOm0+49JC2bm/ch/s=;
        b=kAnwbFmNMS1ihpeHMpUa3bi/GURpBUvyWC/R98C+HHAEa+LT5u8m1teevn4UyxsBCb
         vQwajD4d5R7iC3S9/wdJuuuHPGnm99HlrDnCzkhjwK0HYSXGV/wc/baqqsJ6+h82qkDG
         ilPDOkSFJOTOHwbjDWyasxpFsCmlTYfdtHKnp1VNBEDKe0GyxtxJdrUiRZYDue52ANp4
         WbsnnUTsigKGBRfUVXbzX6lRv+MSmt+RMZU80oUjxXIwqrdYZsqgO9rBD9rNHMWkKnmd
         fMIZrroZ/ysnXb0B5XYkiz40SDdA38kgBwiRnMtS8scwxAxt+DoOyP5mJYtAyDHP7G9R
         kUfQ==
X-Gm-Message-State: AOJu0Yy0PGC1twXMDn/2RusE4OfiAhQwZIFSu5gxd5+CGT6vqe2fcotu
	MqM0+ypBPtjnqQNL1NmYyVwEe5teDO0ab48UrxxNvPVqi2QhG225HbaEAEv8o9UMT3XwM5ty/wg
	R5X9n
X-Gm-Gg: AfdE7cnbbsWnFfPo3TMX7TfQIAkkZtu/lcDGyKa8rGAFGrJwHLKBttELNAbbc8a/vVV
	glxSKTSr82RtfVjDXnEySOnJVCpgi1tDj1auiv1EZCBe+ya/FrXdJ4jSbcrliirI1kqVeLpwVgT
	LVtabXmTSB/rr6bLA1AOumU6qPWe6bup2xgKWtCh9maGcdK4LLyRbHrHHG33oTZnAJkmEpuIjn3
	JOwkOemm61r0O7zS/MxahCxxiA1jbLQtSZpScu6BTpoGwcDPlXNQrGMaT51uIKC3IgVCAJs7hAz
	ey11h/Gy4wDrRc8NcoCKVAALsElaKVK5scFDwIvoRg1jzzZvHdrlzvWBLF+5OiY9R7Sj8Q/mH54
	haDN45Gttf8Q+V8l2RVCzPr3agr73uPhp7SKKBcF0agoTE48Q1XkVQSzVG3XumeUYHUDtF/ppsx
	JPVg/DkfztBN996QuI0iY7DX8ISm4NhOTq2S3I1kw15JS6Nfrk78104SpKsB23sBbwiV0CK2q3A
	P5Q+5SBIduXGqe/J6aXXpkMGGmCKmrXhW916vWvkg==
X-Received: by 2002:a05:600c:3e0c:b0:493:bcef:565c with SMTP id 5b1f17b1804b1-493e68b7fd3mr27055635e9.1.1783517573722;
        Wed, 08 Jul 2026 06:32:53 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f294a6sm262333915e9.1.2026.07.08.06.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:32:53 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-unidecode: Enable tests
Date: Wed,  8 Jul 2026 16:32:47 +0300
Message-ID: <20260708133248.1765250-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708133248.1765250-1-leon.anavi@konsulko.com>
References: <20260708133248.1765250-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 13:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128111

Inherit ptest and include tests for unidecode.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-unidecode/run-ptest         |  3 +++
 .../python/python3-unidecode_1.4.0.bb          | 18 +++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-unidecode/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-unidecode/run-ptest b/meta-python/recipes-devtools/python/python3-unidecode/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-unidecode/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb b/meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb
index c6969fca4d..ac94ae5cee 100644
--- a/meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb
@@ -5,8 +5,24 @@ SECTION = "devel/python"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
 PYPI_PACKAGE = "Unidecode"
 
+SRC_URI += "file://run-ptest"
+
 SRC_URI[sha256sum] = "ce35985008338b676573023acc382d62c264f307c8f7963733405add37ea2b23"
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-core \
+    python3-io \
+    python3-doctest \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.47.3


