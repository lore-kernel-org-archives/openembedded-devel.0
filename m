Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC256E688
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 19:48:30 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d70so998122qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 12:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KuIbjJ+tlkONX/rT/JnAInZAADAJlE0WYPOmLvZDyvs=;
	b=AZQfOZDODVcUrIthM7Nt8dS833+SjtPmBuPlaWmDWlMpYLa1e642vOgWXWMI6WUVe/
	EiNohFRxqvmhv9vIlB1ek/Gno2L34QdOxHh60o0okc/bs3DuJERivYYZW3NETJGn0wiH
	rlhKBcyIL6am9iTefsLHvW84JAxJfr4tIl+KD2B9bsgvM9ueIkFnv+C0DJzHIgPuGW7B
	jVa/dRw+2PESCcueIBFVHk7a8IT2/vMUS2RpVqGh1qdLWFhFgitXOK9KnvHrYZh/lXNf
	MuxErJP1D0al8FoZ+ZFQaXDA7tXMrH3FB3H2VqigcQtnoIPRp0Emtg+qPLWMYe8YDQjP
	999w==
X-Gm-Message-State: AHPjjUjzGZCdflsIxrA5imCh/sdEqN8Ov0bM6ItjykojbHw1cjZZRC5o
	wf1P166v7rX/tzI4PX8=
X-Google-Smtp-Source: AOwi7QCRkGCjwtO9i5ap+H2zWmy94CIrUBSyD8ulglI+LPA8/TdM4PTo26usAqZLlatdb6GXcG4ZBA==
X-Received: by 10.55.100.210 with SMTP id y201mr20608496qkb.242.1505764111949; 
	Mon, 18 Sep 2017 12:48:31 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	e67sm5508001qkb.67.2017.09.18.12.48.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 12:48:31 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2017 15:48:25 -0400
Message-Id: <1505764105-32010-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyopenssl: update to version 17.3.0
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
X-List-Received-Date: Mon, 18 Sep 2017 19:48:31 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyopenssl.inc              | 4 ++--
 .../python/{python-pyopenssl_16.2.0.bb => python-pyopenssl_17.3.0.bb} | 0
 .../{python3-pyopenssl_16.2.0.bb => python3-pyopenssl_17.3.0.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyopenssl_16.2.0.bb => python-pyopenssl_17.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyopenssl_16.2.0.bb => python3-pyopenssl_17.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc b/meta-python/recipes-devtools/python/python-pyopenssl.inc
index 6bb7df6..1bf8324 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl.inc
+++ b/meta-python/recipes-devtools/python/python-pyopenssl.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[md5sum] = "6635503758c65ea6f70d18d1b18e46d5"
-SRC_URI[sha256sum] = "7779a3bbb74e79db234af6a08775568c6769b5821faecf6e2f4143edb227516e"
+SRC_URI[md5sum] = "09dcd307b8d2068f9dd5aaa3a3a88992"
+SRC_URI[sha256sum] = "29630b9064a82e04d8242ea01d7c93d70ec320f5e3ed48e95fcabc6b1d0f6c76"
 
 PYPI_PACKAGE = "pyOpenSSL"
 
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_16.2.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_17.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyopenssl_16.2.0.bb
rename to meta-python/recipes-devtools/python/python-pyopenssl_17.3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_16.2.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_17.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyopenssl_16.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyopenssl_17.3.0.bb
-- 
2.7.4


