Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB0CD116EA
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 18:27:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.400.1764440847984556537
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Nov 2025 10:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D7AJ2syD;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477aa218f20so17925495e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Nov 2025 10:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764440846; x=1765045646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBg2fU+6P1KTIAGOgOuD+Iqc5BSPB5IkBrFOjjCP8yo=;
        b=D7AJ2syDB3djv7FIL95glylFERaM7ljG77f8/MPmdaZC04kxQ9uINmnL8IULJNxRXa
         0PFqXGmzjyTeGCdBxATDe56gjuFiKsG5dbpMLto9jXro+GU9W7/dl+CMDsfDshV1Jsf0
         5IV3PZD6vey9v0QM+Fvdq7DXu+pUzjWbX3DbYHbeYVH6RtkXPa2MvLRw97Z7HoYOux1z
         TH52ayVeLJWUyLcCUoJyrJ7QtyO8uJ943WAj84fZvrZnHrr13pm0/VBsN4AZWdalnr4A
         8Ho+umBVcgsZ6csBx0ZjjcMvbHyLazsgRMgyND2cKm6AMux8Q0f/navfYTvEfZ8jNE1x
         9KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764440846; x=1765045646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBg2fU+6P1KTIAGOgOuD+Iqc5BSPB5IkBrFOjjCP8yo=;
        b=drYfpYeD3idCLtUSHuAjLZpuSgPNHQsJPdth/aiXArMNLHmGHuCqijP2Hlv781lul8
         XKhiNf9xAyTte/bfXYm2EIIUhUjrysxVuIawKsgHxdguvARXBQfbdb3rMVoUZ4Sd8VkK
         5kqC3vJMGUxB1T4TKK1Wji2tEyTfm1G1k24i5it4+3ubw3VW+wKvuyk+9AThRnHFv/Ll
         WvNRp37Z1TAiW58yc6n3zNSIk/MIWi0/rPl33KE7nIPi4NVCFbutNENpJpaxI2eY9Uw4
         hdS6JNIlvl2vbSJYmkB2tnZqzlzawFEin+imRVUsuk18Z7n+vYjwDeTj3vAy+TXlehRf
         hlUg==
X-Gm-Message-State: AOJu0YxyhWaW8DZ6mAQNK+MeyoSZZzC1H4fvMyvynp7RbyV8aXnVP3wJ
	m2SS/z/IEeUie+9YDeFSptyqkLGSATnSUeWeP7iF6da+xBt8Ek2sAX4qVyspD5+F
X-Gm-Gg: ASbGncutxXjhhFO2aOghX0yXGp+WqJqpy+fgtHp4LPPLgyjl2yI2toC22X4vM55vqe+
	C7Eadl2OhsAKs7fE8uKQYpM4gzfp9KjZ1avC7qbH632JIRsainBwwa23yvLCLL7WSil3LMML3De
	KRms1Mh/9DFpMykxY5/uu34uPafo8VLldo23GU6YKfYmp8bLa6n8DKX8fTTZ7WPDC/NPxWQyl8l
	unMBHcmVO+rbZpzRpG8r1WhNB+5+S7idKI+fXKbSfTnv4aS9NsjTCHZdBleWQVPaVe7kbN0jIDM
	1VdVstZD76bh/sEcH5za3RAmXfnzl4KZOiyCMP3a2IArm8qLOaS5QTRFBrlq11Y8vqsayMN/tvN
	/Ai6Vz3Y49cN0mgYhmp6K/lMWpqKCTH6gTG5LbTkF0oqVpiPaInXmzmRPSIm4GzLlUxquBmldu7
	2zX+gc2Mmqg9/Xb8FXKnvQTBEvyG9iu3n6NWxGYUC1l+a3vdYWMzMGxP5mE5gsb9Zr2iWIGmiuW
	w9c5cBc0FPg2/cBX4CqjD9U2o4cjzv83Zyv5ST2lvTGCKfmvSiy/Cegq/wyfqixVeFJ5g84
X-Google-Smtp-Source: AGHT+IFMibY/1Vli5anuElsqHsIWHHVuypa0qyv4eRV+4JdFIgdxhINlObWx3cuO56/k1z6jqLGjig==
X-Received: by 2002:a05:600c:8b16:b0:477:94e3:8a96 with SMTP id 5b1f17b1804b1-477c01b512cmr270646085e9.20.1764440846027;
        Sat, 29 Nov 2025 10:27:26 -0800 (PST)
Received: from localhost.localdomain (2a02-1812-512-2c00-360d-8737-6ace-ce95.ip6.access.telenet.be. [2a02:1812:512:2c00:360d:8737:6ace:ce95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bbbsm223547325e9.3.2025.11.29.10.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 10:27:25 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Rob.Woolley@windriver.com,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-fastapi[-cli]: new recipe 0.122.0
Date: Sat, 29 Nov 2025 19:27:09 +0100
Message-ID: <20251129182709.459094-2-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251129182709.459094-1-jan.vermaete@gmail.com>
References: <20251129182709.459094-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Nov 2025 18:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122159

python3-fastapi at version 0.122.0
python3-fastapi-cli at version 0.0.16

Moved and modified from meta-ros (Thanks Rob Woolley)

- added ptest for fastapi  (long run)
- python3-fastapi-cli does have tests,
  but also a circular dependency on python-fastapi.
  So no ptests for python3-fastapi

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-fastapi-cli_0.0.16.bb      | 20 ++++++++++++++++
 .../python/python3-fastapi/run-ptest          |  5 ++++
 .../python/python3-fastapi_0.122.0.bb         | 23 +++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.16.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-fastapi/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index b0130387bb..c72b4cb5d0 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -121,6 +121,7 @@ PTESTS_FAST_META_PYTHON = "\
 PTESTS_SLOW_META_PYTHON = "\
     python3-arrow \
     python3-ecdsa \
+    python3-fastapi \
     python3-google-auth \
     python3-lz4 \
     python3-marshmallow \
diff --git a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.16.bb b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.16.bb
new file mode 100644
index 0000000000..a8f585b607
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.16.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Run and manage FastAPI apps from the command line with FastAPI CLI"
+HOMEPAGE = "https://fastapi.tiangolo.com/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e0cf8d811ea2046529403707b266fb5a"
+
+SRC_URI[sha256sum] = "e8a2a1ecf7a4e062e3b2eec63ae34387d1e142d4849181d936b23c4bdfe29073"
+
+inherit pypi python_pdm
+
+PYPI_PACKAGE = "fastapi_cli"
+
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+RDEPENDS:${PN} += "\
+    python3-difflib \
+    python3-pydantic \
+    python3-rich-toolkit \
+    python3-typer \
+    python3-uvicorn \
+"
diff --git a/meta-python/recipes-devtools/python/python3-fastapi/run-ptest b/meta-python/recipes-devtools/python/python3-fastapi/run-ptest
new file mode 100644
index 0000000000..b4d99ee36b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastapi/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+# ignore the test from the tutorial
+# those depends on python packages that are not part of OE
+pytest --automake --ignore tests/test_tutorial
diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
new file mode 100644
index 0000000000..37a475ef8f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "FastAPI framework, high performance, easy to learn, fast to code, ready for production"
+HOMEPAGE = "https://fastapi.tiangolo.com/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
+
+SRC_URI[sha256sum] = "cd9b5352031f93773228af8b4c443eedc2ac2aa74b27780387b853c3726fb94b"
+
+SRC_URI += "file://run-ptest"
+
+inherit pypi python_pdm ptest-python-pytest
+
+RDEPENDS:${PN} += "\
+    python3-annotated-doc \
+    python3-fastapi-cli \
+    python3-json \
+    python3-pydantic \
+    python3-starlette \
+    python3-typing-extensions \
+"
+
+RRECOMMENDS:${PN} += "swagger-ui"
+
+RDEPENDS:${PN}-ptest += "python3-orjson"
-- 
2.47.3


