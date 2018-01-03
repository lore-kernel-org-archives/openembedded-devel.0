Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6993E71B2E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 14:37:21 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 33so2323749qtv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 06:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r+/9xQe1j6+Wo84UPcSe7ccLlUsB9B18Lk6UojlQIu8=;
	b=K/BREBikbHRsC6VGyBSP0QeJmOY8MKWjdX2+gD6InoON2eHPg+4Dc0uvcoddvl9lE/
	lwO7IybhHSl3vOXSOjb5RZEC/RiuTxrTP+Li27rMiRyy+nZTS8zF094WRLbBFTADruHa
	F5hBsJ3dtu1mSKYOcSLUe3dTUJV2cK38dLgVICmBSKYhkT464G2RP+0fHGfryH4gbd7y
	01XOCl36TDqcvE68bqkkxIQzxm7KtyUomp7tsknaNJi1b+lRf2jCJdXiqWL6fndSfcsT
	HvKVaVnnR8qOb1xMw9yBvwGgUpkueo+s6NNVNhth7o1hY6PblZ2lr7xgUtNIWr91+6Dj
	M5xQ==
X-Gm-Message-State: AKGB3mJ+wh6Aex2J6/eTNaIv4m5rCpJlsRNns+ApVMur0I9znaWT8wur
	ZbXLwCqbf1640j8FYDuRSXw9+swg
X-Google-Smtp-Source: ACJfBotuECVkizq+455yDFsQjt8HxhEDo7D7nC2CoOtvrpXEbVzXSlkG47S2d6ToRO6dGIbwEegj2w==
X-Received: by 10.200.47.55 with SMTP id j52mr1959107qta.26.1514990242138;
	Wed, 03 Jan 2018 06:37:22 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id j17sm716665qkh.6.2018.01.03.06.37.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 06:37:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 09:37:16 -0500
Message-Id: <1514990236-24921-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-attrs: update to version 17.4.0
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
X-List-Received-Date: Wed, 03 Jan 2018 14:37:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-attrs.inc                  | 4 ++--
 .../python/{python-attrs_17.3.0.bb => python-attrs_17.4.0.bb}         | 0
 .../python/{python3-attrs_17.3.0.bb => python3-attrs_17.4.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-attrs_17.3.0.bb => python-attrs_17.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-attrs_17.3.0.bb => python3-attrs_17.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index 486a4e9..ea8d3bf 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[md5sum] = "4314f784ca3174d91956da9828248960"
-SRC_URI[sha256sum] = "c78f53e32d7cf36d8597c8a2c7e3c0ad210f97b9509e152e4c37fa80869f823c"
+SRC_URI[md5sum] = "d7a89063b2e0fd36bd82389c4d82821d"
+SRC_URI[sha256sum] = "1c7960ccfd6a005cd9f7ba884e6316b5e430a3f1a6c37c5f87d8b43f83b54ec9"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-attrs_17.3.0.bb b/meta-python/recipes-devtools/python/python-attrs_17.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-attrs_17.3.0.bb
rename to meta-python/recipes-devtools/python/python-attrs_17.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-attrs_17.3.0.bb b/meta-python/recipes-devtools/python/python3-attrs_17.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-attrs_17.3.0.bb
rename to meta-python/recipes-devtools/python/python3-attrs_17.4.0.bb
-- 
2.7.4


