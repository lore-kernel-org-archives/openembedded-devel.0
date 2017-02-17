Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 744D471A8D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 12:54:03 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id 11so6403261qkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 04:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YeNRj1f5YcuAx9xNhhv6p6tppSOF210a7wu/+ksOqvc=;
	b=LT1biPrLKM93PM5rhbkHXaXbJ7wk5N4czc3jcbfnzbU9/mEfWq6EmuzXLXv5QEU37y
	uz87sg51kamHmH0zT4agxODMMwPx3HBlAfQidkHyPvEqSizQKpjHZ097lTGl7LoLbkm7
	9DxI4r2W0Chap8vOyDnUUApUlnSaLN0vNgXdDlyyObp8xPqQaJnWt9wXIUdwDJbexTsE
	0j/hurtT+OPetjNR06jdO5MS3MttDjbXBq24sXOp4iZwJU6vMvua3P8YeioJx5KT2WYV
	C+RC088HDMAUjrxu+sLGNpdJKV5duCyskQMbV+DwdLHBZbVliRhL6337LpXFQK/ul4iA
	SeOg==
X-Gm-Message-State: AMke39kXy4ziVxAM5Aq4OPJf5m8TRXYX5VLSC34poEBuAmXYx2fUrJd25i5/r+vQA955TA==
X-Received: by 10.55.217.218 with SMTP id q87mr6448848qkl.69.1487336043593;
	Fri, 17 Feb 2017 04:54:03 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	q145sm6422213qke.37.2017.02.17.04.54.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Feb 2017 04:54:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2017 07:53:49 -0500
Message-Id: <1487336029-13917-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymongo: update to version 3.4.0
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
X-List-Received-Date: Fri, 17 Feb 2017 12:54:03 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc               | 5 +++--
 .../python/{python-pymongo_3.3.1.bb => python-pymongo_3.4.0.bb}      | 0
 .../python/{python3-pymongo_3.3.1.bb => python3-pymongo_3.4.0.bb}    | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.3.1.bb => python-pymongo_3.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.3.1.bb => python3-pymongo_3.4.0.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index 347c497..e709a36 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,11 +8,12 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
 
-SRC_URI[md5sum] = "0a21c939d66d2459062a4333dab4301b"
-SRC_URI[sha256sum] = "4601cd3120e88fb532478f79f29f8f6deab380343d55ad7702a5aa1af27555b1"
+SRC_URI[md5sum] = "aa77f88e51e281c9f328cea701bb6f3e"
+SRC_URI[sha256sum] = "d359349c6c9ff9f482805f89e66e476846317dc7b1eea979d7da9c0857ee2721"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-threading \
 "
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.3.1.bb b/meta-python/recipes-devtools/python/python-pymongo_3.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.3.1.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.3.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.4.0.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.4.0.bb
index 55b3b55..3b250a1 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.4.0.bb
@@ -1,7 +1,10 @@
 inherit pypi setuptools3
 require python-pymongo.inc
 
+# Requires _pydecimal which is in misc
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-enum \
+    ${PYTHON_PN}-misc \
     ${PYTHON_PN}-selectors \
+    ${PYTHON_PN}-subprocess \
 "
-- 
2.7.4


