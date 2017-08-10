Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 096DA77EFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:50:44 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q66so7338891qki.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lDUhjQmILWa3WfIDFFadXV0LU6fjYvJEf8cuWVsh0NA=;
	b=acOPmQuEwqRTk7taCzNaXgSIVD4lJZ/FEytgZwMyihCe+zyD2BpTGbXjl7QtJmzM2J
	hIOouwY/UunzwgLarb2zddWDagHq3GCJSbstnRVnILRvSV5/3waaUNVLrvQwTMx7n6Vc
	7JczoSNC3oAMmPKajmJlGSELXs5lCOOg5lRVrtItfBx06xziyym8dh9FFr1vI2vD0QiZ
	6HnpI01lIloz5zX3ZhKRz4wgxGbSWoXS24Hp89TDvab8v9dj7DPMDCPs7Xk8N2AwOG76
	7yKyON7RKugrag37dpyLhmsP4docyBC8h+N95Cf+WCTTXTcr/MZrRYxb2KNTyvEZpwH0
	+b7w==
X-Gm-Message-State: AHYfb5hJr+EBG9CJrNfxlpS2k44eYuMjNb1aBNgc/C6hBEczfb8hITtx
	tzN3ckdolxK4QgVLADE=
X-Received: by 10.55.128.1 with SMTP id b1mr13549495qkd.76.1502329845267;
	Wed, 09 Aug 2017 18:50:45 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id g1sm1500702qta.65.2017.08.09.18.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:50:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:50:38 -0400
Message-Id: <1502329838-20275-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update to version 3.2.0
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
X-List-Received-Date: Thu, 10 Aug 2017 01:50:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_3.1.3.bb => python-pytest_3.2.0.bb}         | 0
 .../python/{python3-pytest_3.1.3.bb => python3-pytest_3.2.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.1.3.bb => python-pytest_3.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.1.3.bb => python3-pytest_3.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index b5c1fa8..bfa6e46 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -2,8 +2,8 @@ SUMMARY = "Simple powerful teting with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 
-SRC_URI[md5sum] = "35356e6e31cbd8318e8b2a8340a90b72"
-SRC_URI[sha256sum] = "095e1832f7e424563c95daf4d8d3c865052b80e139cdd2f9610a986ee8526206"
+SRC_URI[md5sum] = "f7c0ffc970b26bdf8e6ba1c67af2ea79"
+SRC_URI[sha256sum] = "0225cf10b9e173f84729d5f4648211458a222c6e53a77a85e104bc5f31c244ee"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch"
 
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.1.3.bb b/meta-python/recipes-devtools/python/python-pytest_3.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.1.3.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.1.3.bb b/meta-python/recipes-devtools/python/python3-pytest_3.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.2.0.bb
-- 
2.7.4


