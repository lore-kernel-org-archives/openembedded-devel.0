Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6268E7FDCF
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 19:14:30 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1609.1770146060773957492
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 11:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AK6lSQ2K;
 spf=pass (domain: konsulko.com, ip: 209.85.214.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0c09bb78cso1204645ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 11:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770146060; x=1770750860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxucLDiu7QjULm9T4aHHiFxH/rbxqTJOrC/qLO7BF30=;
        b=AK6lSQ2KgOVLqnGe/Voj/7w6aC4QOo0dhLXG4hSJjxlJ1x3QA3Xw16o2yeVg26m812
         hY3ldgySv04jS8ZcKSoG11oZgA+UoDr3rKLHJYsMi3XdeNBufvyQqVUWvcs21EJ+xTTn
         2DF2jgcBLOBHoHKxVsqt1Yqphe9aCWtu6jm7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770146060; x=1770750860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dxucLDiu7QjULm9T4aHHiFxH/rbxqTJOrC/qLO7BF30=;
        b=REbdMTFAVFFHFAAZidnpNhUSm6g7DInOvs0j4gvAkXiwvNX68mazn+AwXN2FHkNhaf
         wuO28p0XFT3M0aka04FFd95GZt6nvsUH9HgTgQNX7/ogGmpZZF/KBQvE49eqR5lJW425
         eKQzsIfFs2AUKuBZri6QwoTRVVRfFfjaau2HG3rDKqz49We4ujjVsQVBU2gbclt98TyV
         /gk13hZdFJrYXpw4Ejsl9RpVopLWpSrxCR6mmsmHH0y8K8tVO1YjJa3wU0WTtMPhvaTa
         ogjcWSP/vDxsI4w6UYFLaPWhp3wm5HRAkEtnd7IzBJWmCE9sKeVgOwUDhuYs+lGfYB5e
         fU6A==
X-Gm-Message-State: AOJu0YxVkvHjIITJ1c2QJ84bAFkncFoLpZgqEcEjY6kOfAcNlfe/xU2F
	VGkUqO0yR4pkv67HsfbsPOmFAyN6Q5QA0DnWrvlerafwP6pZaxI3tL4d06XgGabbocgUpLPEAY5
	r6GwH
X-Gm-Gg: AZuq6aKBsK/3t05VGEJZolBOSLZz6ykEPU738X6HiUZV8eVfCm9FPE+s1hZF3KjNXds
	CP0ZR3qfACDAEZ1u5Xct6GXZKRmH0gU3D/v7Q0Ej1Xg6lhbk7+CDSDviQALFLvl+tfH/SkWuxIE
	ekuTMJ5lil4NpSwLaYdGm1NP22uBaD0XRjJFhwEPB5EE+3zPR0XbjsHGmmIzr4GWVozxvLvlK+5
	POECR/wqvDWEjnRCqjLiry84+cvRE2eeMA3NjiyYNQelKTs/+rqP4tpdOm0lbLkbc21vPSPvv7c
	uhIdSPWvVpvXE49hGasTORQN6Iv5K3fJdRbR/Ayrs5w/hgG+7M4m49KSqXdTb7SzgPxNnDBfjvD
	IluUm5zfFCK5JVf+lGx7dt5ZUR6tHMFlOTu/UZTLSO1F7ivFOorTD++GAU8F0xXuTESPGLtAhJp
	pl4OYa70MML6YSyEVbM8AmoQFUWqbDZJdUXBz7/seurq2EsQkAMB8cQfdEicHk
X-Received: by 2002:a17:903:1245:b0:2a9:db7:4475 with SMTP id d9443c01a7336-2a9338906bdmr4595975ad.1.1770146059727;
        Tue, 03 Feb 2026 11:14:19 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933884954sm2062675ad.28.2026.02.03.11.14.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:14:19 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 v2 6/6] python3-orjson: use git fetcher; enable ptest
Date: Tue,  3 Feb 2026 11:13:55 -0800
Message-ID: <1ff42dd4deeaa45e3389a0e56ab91a5d679e32e9.1770145884.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770145884.git.tim.orling@konsulko.com>
References: <cover.1769715106.git.tim.orling@konsulko.com> <cover.1770145884.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 19:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124111

From: Tim Orling <tim.orling@konsulko.com>

The majority of the ptests require the data/ directory, so
switch to using the git fetcher.

Testsuite summary
TOTAL: 1632
PASS: 1627
SKIP: 5
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 268

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-orjson_3.11.6.bb           | 24 +++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index f647b3bab1..83e4490533 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -138,6 +138,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-google-auth \
     python3-lz4 \
     python3-marshmallow \
+    python3-orjson \
     python3-pillow \
     python3-pint \
     python3-pykickstart \
diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb b/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
index e26ca77d91..121b1c1964 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
@@ -3,13 +3,14 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
-SRC_URI[sha256sum] = "0a54c72259f35299fd033042367df781c2f66d10252955ca1efb7db309b954cb"
+SRCREV = "ec02024c3837255064f248c0d2d331319b75e9ad"
+PYPI_SRC_URI = "git://github.com/ijl/orjson;protocol=https;branch=master;tag=${PV};destsuffix=orjson-${PV}"
 
 CVE_PRODUCT = "orjson"
 
 require ${BPN}-crates.inc
 
-inherit pypi python_maturin cargo-update-recipe-crates
+inherit pypi python_maturin cargo-update-recipe-crates ptest-python-pytest
 
 SRC_URI += " \
     file://0001-Guard-avx512-module-with-x86-target-cfg.patch \
@@ -23,4 +24,23 @@ do_compile:prepend() {
     sed -i "/panic = \"abort\"/d" ${S}/Cargo.toml
 }
 
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/data
+    cp -rf ${S}/data/* ${D}${PTEST_PATH}/data/
+    install -d ${D}${PTEST_PATH}/test
+    cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+}
+
+RDEPENDS:${PN}-ptest += "\
+    python3-dateutil \
+    python3-dateutil-zoneinfo \
+    python3-faker \
+    python3-numpy \
+    python3-pandas \
+    python3-pendulum \
+    python3-psutil \
+    python3-pytz \
+    python3-tzdata \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


