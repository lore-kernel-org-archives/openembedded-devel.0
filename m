Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1754A7782F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 16:20:09 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id l194so21114706qke.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 09:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4X9eJu+QRpIXx2WdRdpVmbjqzjJdTAk83B/u1oY4MGg=;
	b=Js4fjp8ALqowJqevccZ9sD1P2PKDXPNvYjFxTnzEhCvj25g8Kzyvs87oLz/ZRCY78r
	VWXJyZRZlGRk7jX5tOtRKaHkmaIgA1KVgy/4f3b5SnBFHMPN3A4gnsYCCLPAUqaDivwm
	tD3BA84G2E0ja1DqUwuyw0vsCqZNMMbME/c32/sPDfnAXwQRJaNdyVL9NA2dpvlKpex9
	YTHkaHsIlf+33fnU7qXB78btZhT8zfHPZIIJeFqbJRU/XADGHdCSivqz30dncO8TzGiC
	gnAYJ/c9fu8VEUiNckgjhbZvMNxJ6wUaHFTM6KScKAFH4qhgc9fAgtYaw/S4Pn1ep+PI
	Bp6Q==
X-Gm-Message-State: AMCzsaUJ85xkGAjJehhev2E3FVkfr1ITsDu1W5YHH+wzsIxwIhU/s7om
	LSoQjnT8VaaXGHB22oDrucCe+0Bx
X-Google-Smtp-Source: ABhQp+S0KxpIm2xNg9haUPU+FTkEJh8zRVs4KqqLUBuqQEMq5dXXMrrzgclXApFffMvdhnTCQQw1ZQ==
X-Received: by 10.55.136.67 with SMTP id k64mr3658437qkd.26.1509466810608;
	Tue, 31 Oct 2017 09:20:10 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t93sm1076071qtd.45.2017.10.31.09.20.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Oct 2017 09:20:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Oct 2017 12:20:03 -0400
Message-Id: <1509466803-14445-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyusb: update to version 1.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Oct 2017 16:20:11 -0000

Update license checksum for copyright year update

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyusb.inc                | 6 +++---
 .../python/{python-pyusb_1.0.0b2.bb => python-pyusb_1.0.2.bb}       | 2 +-
 .../python/{python3-pyusb_1.0.0b2.bb => python3-pyusb_1.0.2.bb}     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyusb_1.0.0b2.bb => python-pyusb_1.0.2.bb} (56%)
 rename meta-python/recipes-devtools/python/{python3-pyusb_1.0.0b2.bb => python3-pyusb_1.0.2.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python-pyusb.inc b/meta-python/recipes-devtools/python/python-pyusb.inc
index af20109..30bbe85 100644
--- a/meta-python/recipes-devtools/python/python-pyusb.inc
+++ b/meta-python/recipes-devtools/python/python-pyusb.inc
@@ -1,10 +1,10 @@
 SUMMARY = "PyUSB provides USB access on the Python language"
 HOMEPAGE = "http://pyusb.sourceforge.net/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=50d46bda6248a0b4a46a6d59a66ee08e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=51691ed11cc2c7ae93e383f60ed49b0f"
 DEPENDS += "libusb1"
 
-SRC_URI[md5sum] = "bc12e83ff3ef1045d4306d13a9955fc1"
-SRC_URI[sha256sum] = "14ec66077bdcd6f1aa9e892a0a35a54bb3c1ec56aa740ead64349c18f0186d19"
+SRC_URI[md5sum] = "862b56452c64948c787ad8ef9498590b"
+SRC_URI[sha256sum] = "4e9b72cc4a4205ca64fbf1f3fff39a335512166c151ad103e55c8223ac147362"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb b/meta-python/recipes-devtools/python/python-pyusb_1.0.2.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb
rename to meta-python/recipes-devtools/python/python-pyusb_1.0.2.bb
index bb73d9f..99a795b 100644
--- a/meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb
+++ b/meta-python/recipes-devtools/python/python-pyusb_1.0.2.bb
@@ -1,2 +1,2 @@
-inherit distutils
+inherit setuptools
 require python-pyusb.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.0.0b2.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-pyusb_1.0.0b2.bb
rename to meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
index 813e6f0..1ecede7 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.0.0b2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
@@ -1,2 +1,2 @@
-inherit distutils3
+inherit setuptools3
 require python-pyusb.inc
-- 
2.7.4


