Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0759DC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 09:00:58 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15513.1786006854851669967
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 02:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AlfY4CDr;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1495050f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 02:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786006853; x=1786611653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHA1JMRW8ngIPNBwFxgctpY3tRxg1aqvsqrqhOxL+64=;
        b=AlfY4CDr5Gs9d7pSp8/9tTW+5CADmku3aF5m/Vf/+H4v0SWOIm7JQanK6Lz1/dSEoO
         4ItHcWqSCwCCQ8V0aXzoYQZ9ChKGZ7hKX1fg3KcQu0PRNvT1e+3pKtPYwHvo7aX+x5Fi
         p5oEBOsEymhYAn1As9qiSkExIRHPt8tbJkuUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006853; x=1786611653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iHA1JMRW8ngIPNBwFxgctpY3tRxg1aqvsqrqhOxL+64=;
        b=cj8nft4P4chW8tAFFU/JNM2pEs/TAC2Z6lIFMw8/gnk4eSkl+p+k/AOptSqgomuC0p
         IICe9jo2xi9RUtKpb/If+mPjtIt8gZQYCAdaUTxV1hbsWcZ2ywZIy3z+ijaJUIRiqfXV
         g1gnP4e5PxjcQ8vvvedP5Apqt7baCZRA5Z8c6+otfSQAAlRDKg8z3qkTXGlnkzzOddub
         +7Xj73EUaBfkSKRC1UsJvXoQaGNzbeM33SqLwWZ2blg4h5HPbEs1e+pvjhLPhlmYjhW4
         CweI4uFHZTepZdr1LwCLG7G2Apmn/W2YSGwVv2k3UptOshk7ek2IrWBtkf+ckpRNRnri
         0dEQ==
X-Gm-Message-State: AOJu0YzFUyV1TllbFfYUMw521/y0JpU+o2lQA3BYKfQVRqG8X6zpkEf3
	81A2iBGSaml+UzeVos+rL2z0oUbRIhIvqVVtGPsS09pozr0BXsze9FgBJnV6K5seHnHTZP1qmrR
	7JWJG
X-Gm-Gg: AR+sD12U1hVVVdZYFLpSVwJHoK90tUbhKwW2McWYxt6Han7/YYSbYOt0ImJXH5QNXAK
	G9A6qxRKdtDWk5GVJSY63Q9SjMtRs+avOWkcd4jNfk555E9q27i2l3zpQLs8+PIntmQKN/t6vlF
	R5HcK+5pgBIg+Z+Zf681d95CKqgtNQrXPFHEudzFfteb3FVSKFBK9xWPFg5sNNAeI8zCdObrvm1
	ev64HNRb9TM/CTxNm5mej4/FzXIm8ipKA60Z0t+03T6vAXw+F5mYZKnbCBYMUYtcyp/Tc9UzunO
	r4Gfs6Y752H7D/M5npD6FSPBqiopfNnZGCx32fOLlbfgpA/Zb68dCf4cZyGRVdKydmG8H2O3YiB
	RSHMXR1BYc5bumykz/Xo/zPUwkj26zAWZ3lH6SJfX8jhsYY215G314bZMhZxjNdXR8vh9+w82Q0
	W4FWkRlbr3+Udt/H1otdqxSxsllrmIE1fxubC/nBaG7avbdR1jyZlVRUwuqum4dK3CpktdGHoXj
	+C1kjID9qTy4YssnWhdByoHKMcxFvDo+P4Cu+hXmVSwdfYt5GXPF9IfBnKVU1yt5/YYi18LX+RA
	ccCzcqI9Xx4tCpQMNg3yNaEqKg==
X-Received: by 2002:a05:6000:41d3:b0:47f:f20c:e8a4 with SMTP id ffacd0b85a97d-47ff20cea51mr14305212f8f.19.1786006853058;
        Thu, 06 Aug 2026 02:00:53 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79b32b1sm4795692f8f.9.2026.08.06.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:00:52 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pikepdf: Enable tests
Date: Thu,  6 Aug 2026 12:00:47 +0300
Message-ID: <20260806090047.3887066-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806090047.3887066-1-leon.anavi@konsulko.com>
References: <20260806090047.3887066-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 09:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128840

Inherit ptest-python-pytest and include tests for PikePDF. Extend
runtime dependencies and add new for the tests.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pikepdf_10.11.0.bb         | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
index 91ea5fd821..ad2abc28d9 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "4bebc59ac74411064e7c97a4036174023e22ccbecd22b78750ab76551e
 
 SRC_URI += "file://0001-pyproject.toml-Do-not-strip.patch"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 # pikepdf uses the C++20 language but no C++20 named modules. CMake's module
 # dependency scanning (clang-scan-deps) does not work in the cross environment,
@@ -20,16 +20,34 @@ PYPI_PACKAGE = "pikepdf"
 CVE_PRODUCT = "pikepdf"
 
 DEPENDS += " \
-	python3-pybind11-native \
-        python3-nanobind-native \
-	python3-scikit-build-core-native \
-	ninja-native \
-	qpdf \
+    python3-pybind11-native \
+    python3-nanobind-native \
+    python3-scikit-build-core-native \
+    ninja-native \
+    qpdf \
 "
 
 RDEPENDS:${PN} += " \
-	python3-pillow \
-	python3-lxml \
+    qpdf \
+    python3-pillow \
+    python3-lxml \
 "
 
+RDEPENDS:${PN}-ptest += " \
+    python3-attrs \
+    python3-hypothesis \
+    python3-numpy \
+    python3-pytest-cov \
+    python3-pytest-timeout \
+    python3-pytest-xdist \
+    python3-psutil \
+    python3-dateutil \
+    python3-python-xmp-toolkit \
+    python3-tomli \
+"
+
+do_install_ptest:append() {
+    install -m 0644 ${S}/pyproject.toml ${D}${PTEST_PATH}/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


