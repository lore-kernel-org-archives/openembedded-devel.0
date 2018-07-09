Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 24EFD75402
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 21:55:05 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f1-v6so16715311qti.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 14:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3FdVstPFQhOFxFJlxUb2iiCyo79PWdSadETZMiEKgow=;
	b=fcLZ90U2cEt3ZE4Bp6YPo0aD+0AtEm5Cp73KrY93rYpbnjUUqgX1MidGR+aCD2+Biq
	x3vU4q5NE1w9O0YbkXm7eJpVQGI0pzK8bhIC6huISW4txAYZLfmLRqB5UCH7hzJEYyWx
	Wbqfy+Umo5i127MIIjyzEw/4GmEDzng4ZTDDY+udv/M3OvUBM4z8lRD9KE2JMO5wcXOL
	Z3wy1arcTx29+Oaftb6u8o+N8Pgke2G9UbpkUBNqYxaWc7ldx2OLHxGXbz2HxplKXQuj
	qshLiAUv92ooO50ZWzYeLGkkTueNtsmv2Ux8zRi1V8PcsZF5/v13b5X5muzF9tphh6vy
	Br8w==
X-Gm-Message-State: APt69E1Y7LUr8OGEY/vN1saztOe84ywxcke7BLb0iGI2yZQoWUl2efUa
	4xU3Y5m2YS9xNf10ScLiTDPEwxCO
X-Google-Smtp-Source: AAOMgpfX872oV9tNOxUDrO9f6/xsvFxvihQ39lIyX99V7Izo+qthQGYWLeGcpUfSWU3slCjUq2UaRg==
X-Received: by 2002:ac8:2f84:: with SMTP id
	l4-v6mr20735693qta.83.1531173305871; 
	Mon, 09 Jul 2018 14:55:05 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	l22-v6sm16137968qkh.72.2018.07.09.14.55.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 14:55:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 17:54:50 -0400
Message-Id: <1531173290-21739-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyyaml: update to version 3.13
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
X-List-Received-Date: Mon, 09 Jul 2018 21:55:05 -0000

License-Update: Update the copyright year to include 2018

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyyaml.inc               | 6 +++---
 .../python/{python-pyyaml_3.12.bb => python-pyyaml_3.13.bb}         | 0
 .../python/{python3-pyyaml_3.12.bb => python3-pyyaml_3.13.bb}       | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyyaml_3.12.bb => python-pyyaml_3.13.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyyaml_3.12.bb => python3-pyyaml_3.13.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml.inc b/meta-python/recipes-devtools/python/python-pyyaml.inc
index 3fef0ca..afce543 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml.inc
+++ b/meta-python/recipes-devtools/python/python-pyyaml.inc
@@ -2,14 +2,14 @@ SUMMARY = "Python support for YAML"
 HOMEPAGE = "http://www.pyyaml.org"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5591701d32590f9fa94f3bfee820b634"
 DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
 
 PYPI_PACKAGE = "PyYAML"
 inherit pypi
 
-SRC_URI[md5sum] = "4c129761b661d181ebf7ff4eb2d79950"
-SRC_URI[sha256sum] = "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
+SRC_URI[md5sum] = "b78b96636d68ac581c0e2f38158c224f"
+SRC_URI[sha256sum] = "3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb b/meta-python/recipes-devtools/python/python-pyyaml_3.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
rename to meta-python/recipes-devtools/python/python-pyyaml_3.13.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_3.12.bb b/meta-python/recipes-devtools/python/python3-pyyaml_3.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyyaml_3.12.bb
rename to meta-python/recipes-devtools/python/python3-pyyaml_3.13.bb
-- 
2.7.4


