Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 64A0977FE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 19:32:12 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u48so2089354qtc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xnwkOsHUNewzTsN+h2XSBEdL0Ff+cAoaRxdici5aBDg=;
	b=SYqvz8G0ff3GSZa0RC+H7TITbI8TRFRT5qpMZvgeoOnKFvMcRydaS1IB/dkwoKlPeB
	MJUEfmweHSeDN7NALtxkBS8mdPdkohnVhLkmtscGL40Nbq20TnP9o7pI9PLRH95FWiTR
	vtNsQad7xSWkjATWF/Ft6CBjZg1hCM6va/3SYyblWWcG77Zxkb4hU/y0SAI6df7p3hLe
	CmhI4cX5AIkqJuDyHonygfFrHLbIMBH5JlCcPjOekc8CqGrzmWbqrD1HyndUC0ksXtuz
	WVqKhV+hWd0XiWqo2sN0qZ8kuTjt2ZFmF0XPbIKXZTRv4Gf+XL0xLQbiqnTAroBzjK6T
	eZxQ==
X-Gm-Message-State: AHPjjUiqMKLpDaTeE6ISmZYzwhWYFh1yPJ25JChk2y3kLM7KYvyZIfgp
	/HVGy8nLZW4fgOoP+2I=
X-Google-Smtp-Source: AOwi7QDNEBqWKH0guxj2pNGxpDiaMpqGgbobwuAOHAyvGDLt4iqtKW5E8oS/H4dPKpjiujPGx1EgHw==
X-Received: by 10.200.45.73 with SMTP id o9mr36456443qta.292.1505503933939;
	Fri, 15 Sep 2017 12:32:13 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id x47sm1056537qtx.8.2017.09.15.12.32.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 12:32:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:32:05 -0400
Message-Id: <1505503925-28750-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymongo: update to version 3.5.1
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
X-List-Received-Date: Fri, 15 Sep 2017 19:32:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc                | 4 ++--
 .../python/{python-pymongo_3.5.0.bb => python-pymongo_3.5.1.bb}       | 0
 .../python/{python3-pymongo_3.5.0.bb => python3-pymongo_3.5.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.5.0.bb => python-pymongo_3.5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.5.0.bb => python3-pymongo_3.5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index 6795213..29c2a3f 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,8 +8,8 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
 
-SRC_URI[md5sum] = "717188415cb9071355a80b3c520370ff"
-SRC_URI[sha256sum] = "8137381e217038bc4b7d113c9d0d1133d8081d39008b5a4f11bf129b1520c1b0"
+SRC_URI[md5sum] = "35ae53073a25603591e085b18bc5a0ec"
+SRC_URI[sha256sum] = "e820d93414f3bec1fa456c84afbd4af1b43ff41366321619db74e6bc065d6924"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.5.0.bb b/meta-python/recipes-devtools/python/python-pymongo_3.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.5.0.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.5.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.5.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.5.1.bb
-- 
2.7.4


