Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3721074966
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 14:05:14 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id z6-v6so4803757qti.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 07:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xVPrjUmulspRYjIG8qo0SBiJmQvFeL6uPv90k4HMqek=;
	b=UAbzEq1mO3hJBDZFLzdahdBbX7LWb7GF+geGAr+10XN4JHfmiIrtBsqZqsGlx+7gct
	UbH6ND1tjA2PmrkeT1OhHbN1hBTXn7dWcHkiM6EZ6yCfOsONMjXzewvqNi9geq1PDiu3
	ZoK65YwuWliw9YQl/wdg8fgWCkEGY7RUjsGSibxo/RpByR3XyfRWV+0m3NLV1EvXBJGw
	jEjUF7PY8bAf4w/MkAG/6eroaFfTETpQ/fYUjjDHKEmedlMFJKUn45ljdeb1nJTzrcks
	D5XfYO8sFRg/V9anX4fnPo0MYvDKkhLvV6cdpbE9t87/CVTzYsNFfXjh6JO9aNDZFMXR
	fePw==
X-Gm-Message-State: APt69E0Ko0g+ygWvAPHMPX9grg35Fu8MprMn6q4piRWsMPAd48WNT9O+
	EPHMloegPIW1HivxO+RlL/5F5+AD
X-Google-Smtp-Source: AAOMgpfTIwg4Vco93sVAY0r1B17hRwF2+OxvuA7SBT7lv3G1g9YLYEx2+clfgUi2+RiBggTDEC3n1A==
X-Received: by 2002:a0c:e5c5:: with SMTP id
	u5-v6mr9205473qvm.248.1530194714608; 
	Thu, 28 Jun 2018 07:05:14 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	x4-v6sm4120684qti.7.2018.06.28.07.05.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jun 2018 07:05:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2018 10:05:03 -0400
Message-Id: <1530194703-27622-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.28.3
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
X-List-Received-Date: Thu, 28 Jun 2018 14:05:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.28.2.bb => python-cython_0.28.3.bb}       | 0
 .../python/{python3-cython_0.28.2.bb => python3-cython_0.28.3.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.28.2.bb => python-cython_0.28.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.28.2.bb => python3-cython_0.28.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 5d3b9d5..33873c9 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "0e0568d6bed4b09ad01afe0a38805305"
-SRC_URI[sha256sum] = "634e2f10fc8d026c633cffacb45cd8f4582149fa68e1428124e762dbc566e68a"
+SRC_URI[md5sum] = "586f0eb70ba1fcc34334e9e10c5e68c0"
+SRC_URI[sha256sum] = "1aae6d6e9858888144cea147eb5e677830f45faaff3d305d77378c3cba55f526"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.28.2.bb b/meta-python/recipes-devtools/python/python-cython_0.28.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.28.2.bb
rename to meta-python/recipes-devtools/python/python-cython_0.28.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.28.2.bb b/meta-python/recipes-devtools/python/python3-cython_0.28.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.28.2.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.28.3.bb
-- 
2.7.4


