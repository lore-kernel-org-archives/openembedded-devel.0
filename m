Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58D1CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:20:14 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.175.1781623208703452542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 08:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dwzGutmD;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so3703943f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781623207; x=1782228007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ANi0BWOnn5V4w1A6n/Jt+8hVm0LbGU3TSukfAg0JNs=;
        b=dwzGutmDWN49cFQvnhDnjSrs2SJKDNI9vF5ZBOZem61TmZN0a5qoZfGYUvx5N13WRv
         O5jpyLL0ZBLV3IFhP/O27Gr5pJKkKFc7r7LRi39e45TsPuHme93dICzyroTlF6QnIb4a
         OSjkWe0/QIO7wrpXHDi6P+Po08HqLBZLGBAFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623207; x=1782228007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ANi0BWOnn5V4w1A6n/Jt+8hVm0LbGU3TSukfAg0JNs=;
        b=AfvShOhOao2gWjjJ+mpCJDhg9AJGr7iWBGqgb+e1+8zQbiKVFOhL9Ii+IJzKL2BZPi
         NPg31AFr9ZDx4eFG+mJv0bfLTPJ5GDD6fYY3ZuFMPMNk4K1hz0dT3hv6z6gbRZTVml0X
         6ED7sVd/vXgTEbLOYQMOOQXzXWGXMPyrlxX5F7jNT7lgYM+i1m49JC2bufWKa67ELypA
         CQdDelNtRtbJ9ljlpS27XEsyiEA0QuRw4TBbN02xiw2NxJqIJxputm3ZoUMOiM1kBc6i
         Qt+hxrRGTANbFP/W4cTI5F9Xj4+Ld0nFTQ4zTwXMQsZ4vrKBIQ3qox5EpXH8YQkHAnjb
         cBCg==
X-Gm-Message-State: AOJu0YxDPnob54hflAE1WwJR06DKBUBm2Upc9sC8+6TSmgvCPDexJi9I
	wqgyfCzHAxOPlVslbBoptwOzzYxxGP9FhCpu79OpoPvnT/YMPjCmR6h9BtUI34iZXyB3LVtMzHy
	QaUue
X-Gm-Gg: Acq92OE4adcKyUyU3OiaKsbNMy+3BU9zNi/9u6/PcZLvUZZS2hjQ2jlSaW+/oMMrjBL
	8k/ZHa4tQLnQOuqCYXA16gA7YWdkc07XR3nwo1czk/3QMiX66fo371c46bIRl1RK96nrY1UPdkH
	I2/OXESSzBIozC/w24ak65AllYzjjc+lL4H0vOeCsRKP82gsMQN50RAHxobP/33J7idRkCDcvGP
	dNz2bSyPz7G4unDsu1OwftGfAQIXJcpu1buF5pRKtq1mEaz5l1srCpJfqm/FoRRsW0FwwTHQBaU
	dtp0j+9g/o63bHXDn3ufhBx/+lcwLtGSAXZG3RtdilEx7Zfgp6t07mGt0w0Pe3mXQaH3U4Jv5Ua
	TAOFEmR7iXvaPDwdUmVkENlQ/oSzVakv1uwyJclFjWWux2MrYbx16rmQP1NOqmUQGFFlXoLHy2y
	AomyJ4TTeoMXR9PK7AHFBGcSk1+m+RGoRuw/de
X-Received: by 2002:a05:6000:22c5:b0:45e:df08:b02 with SMTP id ffacd0b85a97d-4606dbdf6f8mr29998452f8f.28.1781623206588;
        Tue, 16 Jun 2026 08:20:06 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm17414212f8f.6.2026.06.16.08.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:20:06 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-fastapi: Upgrade 0.136.3 -> 0.137.1
Date: Tue, 16 Jun 2026 18:20:01 +0300
Message-ID: <20260616152003.3841838-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 15:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127621

Upgrade to release 0.137.1:

- Fix typing checks for APIRoute.
- Fix bug, allow empty path in path operation in prefixless router.

Fix the following error when running ptest-runner python3-fastapi:

E   ModuleNotFoundError: No module named 'scripts'

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-fastapi_0.136.3.bb => python3-fastapi_0.137.1.bb} | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.136.3.bb => python3-fastapi_0.137.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.136.3.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.137.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.136.3.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.137.1.bb
index 660d729dd7..a4f486e3f2 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.136.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.137.1.bb
@@ -1,9 +1,9 @@
-DESCRIPTION = "FastAPI framework, high performance, easy to learn, fast to code, ready for production"
+
 HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "e487fae93ad408e6f47641ee4dfe389864fd7bec92e547ea8498fc13f43e83ab"
+SRC_URI[sha256sum] = "822360704230d9533d8d9475399613525968aa2f0b5bd2a3ccc9f18c88fd541c"
 
 SRC_URI += "file://run-ptest"
 
@@ -36,3 +36,10 @@ RDEPENDS:${PN}-ptest += "\
                         python3-sqlalchemy \
                         python3-trio \
 "
+
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/scripts
+    cp -rf ${S}/scripts/* ${D}${PTEST_PATH}/scripts/
+    rm -rf ${D}${PTEST_PATH}/scripts/tests
+    echo "import sys; from pathlib import Path; sys.path.insert(0, str(Path(__file__).parent))" > ${D}${PTEST_PATH}/conftest.py
+}
-- 
2.47.3


