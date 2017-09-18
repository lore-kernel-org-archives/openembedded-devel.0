Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 84FE477D6B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 20:29:57 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i14so1061918qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sNuppu8HwzdcUkqz/vN78UEVlPyhVp5X9WzjDFJtMwo=;
	b=SLo7cOoImCn8cCAuigSZZIR5YiwFkrZRYSmLJ8nuT0Py2WGPAZQorBD0tbGJi7YaeT
	O1xrcV7mS1dc1UN3CuK9kaxlLTMvYXMoYJDOIKtUYcfQnrUkVZTcI0csGwr9bFvkQPbo
	/aDY3rLjXaLI2lKN5YpAj1OdbK8r2/M9Mt7pdD0fkapIQB0tYzptHOO6MFsEPUvF4jAr
	5Q2cGSPoXpa1u3XeXhFRFBD3tIqud3Hw9HadJEp0JaAi6ZHAQmzy602kHTSaVyPquUdt
	Tn9f6C+OOT7McIKCyMO/GNRgQdefa6Q4LAyKS/2FvmM98+hVFbMZIbhgSLwaOvbFLBDd
	oWkQ==
X-Gm-Message-State: AHPjjUiQ+PPb9+AxUduit64CNksPZDCTbOxz9o1+zg6dBgkAXbhNTJoK
	VERQDwzIpf0XjX90nug=
X-Google-Smtp-Source: AOwi7QDL9xiBQnYYEfNFHTIkqz5TnzMcP4SiI8dNr/YBt6vvpS4i2IDNp7i37NauLJhnfKKzEiaWRA==
X-Received: by 10.55.17.156 with SMTP id 28mr22136095qkr.336.1505766599067;
	Mon, 18 Sep 2017 13:29:59 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	q49sm5702534qta.80.2017.09.18.13.29.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 13:29:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2017 16:29:51 -0400
Message-Id: <1505766591-17904-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymongo: split the package into bson and original pymongo package
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
X-List-Received-Date: Mon, 18 Sep 2017 20:29:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc   | 16 ++++++++++++----
 .../recipes-devtools/python/python3-pymongo_3.5.1.bb     |  2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index 29c2a3f..7f199b4 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -11,9 +11,17 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
 SRC_URI[md5sum] = "35ae53073a25603591e085b18bc5a0ec"
 SRC_URI[sha256sum] = "e820d93414f3bec1fa456c84afbd4af1b43ff41366321619db74e6bc065d6924"
 
+PACKAGES =+ "${PYTHON_PN}-bson"
+
+FILES_${PYTHON_PN}-bson = "${PYTHON_SITEPACKAGES_DIR}/bson/*"
+
+RDEPENDS_${PYTHON_PN}-bson += " \
+     ${PYTHON_PN}-datetime \
+     ${PYTHON_PN}-netclient \
+     ${PYTHON_PN}-numbers \
+     ${PYTHON_PN}-threading \
+"
+
 RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-bson \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.5.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.5.1.bb
index 3b250a1..9f02cab 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.5.1.bb
@@ -2,7 +2,7 @@ inherit pypi setuptools3
 require python-pymongo.inc
 
 # Requires _pydecimal which is in misc
-RDEPENDS_${PN} += " \
+RDEPENDS_${PYTHON_PN}-bson += " \
     ${PYTHON_PN}-enum \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-selectors \
-- 
2.7.4


