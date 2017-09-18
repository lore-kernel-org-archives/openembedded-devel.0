Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id BF9887825F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 19:56:40 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id t184so1651318qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 12:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iIQkW6S2Fo3Of/mAOBC17aFzGOgDczUyHWGg5wIf7ko=;
	b=CxdhF17MS+TcRaM7665NWU7tEgpzww+iOKNHY4SUAvzxuIGDyMQDYUuMAlf4O1J1iF
	OsIJFT9RwWZVbbCjvHDJ57anm98X0x/V6Jc6MmMYvMyfP9AsGVxnSOmYtwTY2YTtilTu
	q31WoBG8GeDCMyCxguXvDkZ+SFvWrz65n+H+mTD0wRlyUyUVdf/oTrr+LjMXBVbPI6/G
	NpkzxwlSk+fPNTi5y/IR2pa0Vt2uyyAP9mPELLDd/XucjUUb1fygvSC9FYJxQGY9s4lv
	Coux2/lguLfnKd9+FsSycI1Ih58PJFSgoG8tgFndf62Zmqns4vJdB3PHOCaGqRWI49pY
	B6UQ==
X-Gm-Message-State: AHPjjUgi8B9dwQZ5qqgmHG0RDo+ugyFe0Ax5uCVOcAIXZ60nPGK1VKqs
	rtf8hMHmrO6MAxDq9YQ=
X-Google-Smtp-Source: AOwi7QC8hdREQH6druY1jADo7VjPatfXYO/+RLEm6TrHkARajXpyoaDjy7dajzzIVsfKgwa7oKeEbA==
X-Received: by 10.55.11.145 with SMTP id 139mr22198703qkl.123.1505764601536;
	Mon, 18 Sep 2017 12:56:41 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	v192sm5670923qka.76.2017.09.18.12.56.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 12:56:40 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2017 15:56:32 -0400
Message-Id: <1505764592-3984-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-xlrd: update to version 1.1.0
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
X-List-Received-Date: Mon, 18 Sep 2017 19:56:40 -0000

Update license file/checksum from non-existent file

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-xlrd.inc                 | 6 +++---
 .../python/{python-xlrd_1.0.0.bb => python-xlrd_1.1.0.bb}           | 0
 .../python/{python3-xlrd_1.0.0.bb => python3-xlrd_1.1.0.bb}         | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-xlrd_1.0.0.bb => python-xlrd_1.1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-xlrd_1.0.0.bb => python3-xlrd_1.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-xlrd.inc b/meta-python/recipes-devtools/python/python-xlrd.inc
index a8fe8c7..d1ab05d 100644
--- a/meta-python/recipes-devtools/python/python-xlrd.inc
+++ b/meta-python/recipes-devtools/python/python-xlrd.inc
@@ -4,9 +4,9 @@ DESCRIPTION = "Extract data from Excel spreadsheets (.xls and .xlsx,\
 Strong support for Excel dates. Unicode-aware."
 HOMEPAGE = "http://www.python-excel.org/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://xlrd/licences.py;md5=b59dace5cc1db604c4219100b0422811"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=08bd814936237b6e1355e6370b24b2c1"
 
-SRC_URI[md5sum] = "9a91b688cd4945477ac28187a54f9a3b"
-SRC_URI[sha256sum] = "0ff87dd5d50425084f7219cb6f86bb3eb5aa29063f53d50bf270ed007e941069"
+SRC_URI[md5sum] = "b85c9916ac755cad489a9005f5a0d390"
+SRC_URI[sha256sum] = "8a21885513e6d915fe33a8ee5fdfa675433b61405ba13e2a69e62ee36828d7e2"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
diff --git a/meta-python/recipes-devtools/python/python-xlrd_1.0.0.bb b/meta-python/recipes-devtools/python/python-xlrd_1.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-xlrd_1.0.0.bb
rename to meta-python/recipes-devtools/python/python-xlrd_1.1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_1.0.0.bb b/meta-python/recipes-devtools/python/python3-xlrd_1.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-xlrd_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-xlrd_1.1.0.bb
-- 
2.7.4


