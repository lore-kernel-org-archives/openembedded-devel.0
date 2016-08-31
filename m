Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 15D36731BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:36:53 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o1so4190537qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=CYOpIeGAAI1VCkkHLezIGZ4WyzDmRMfjkM2Uyq1Wxe4=;
	b=jk080B0B61z23JinCgnnGXEdeaPj2jsNQ9VFCBsIdM466V8/hAfUDBQMMO1Hjndx3T
	B4WaU5mPNpHDEdkPLC38Tdfx0I9fEtVAhEENDNh+iffuMZqSmiOzjS0YYCbvx6T3Vkyl
	0ZxkPUAZOjw404N1hnE+VTMEHFiyNVJvULrWCLesRXrpERGhXthtE5HWVurKI5wz0P4F
	s4c+TEyNA94GM6KIMXuai8IPEBx6Ak/NDFJAzqxx7JBCrg8HMSqrbXpCuqY2sfVCLcyJ
	gTHPCKpHlcvOnd6hXLehFDU2Co8z2C+9u73z6x47VVHB37HQ9ZrzcmtWn9xnlYIDu5E1
	ReuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=CYOpIeGAAI1VCkkHLezIGZ4WyzDmRMfjkM2Uyq1Wxe4=;
	b=m46jvXfkM9vTc8zAX3RthntlL6VsL9/DTS/MOSqr5iWZ7WNsaztWFtjH0ryFFv9ynM
	DtTP6rWqTdGEpEFf5giij8MeWFNx3zaGG+RbUu1/sWRj8tl1ZpmyDpVIhtp15nlFKSaL
	jayq/71IerHsqlgSjDr5J+9xItVWVe1lfBfZX/GllFhwiMG3SzdqVK0kzyn+bknTIhrd
	aBnSe4ZepnKMSgUuDNDaZIq6JQz3AmZ95xiVwiTdBtKdP9E8ersw/I4RlD0AKTRwxKPV
	kDCZSYHcXrM0zBmOcKKdEhjX4zoeQgMaKll8vt22niBxKvsOk+Js36UwSBKUSHzLPtWy
	XvhA==
X-Gm-Message-State: AE9vXwMscqxARCT3enav5G1Q7Ws3GZFR86LVK7hXL+RF0hELoWrfbqGDNRYGavVTBleMjA==
X-Received: by 10.55.123.197 with SMTP id w188mr12839125qkc.60.1472672213730; 
	Wed, 31 Aug 2016 12:36:53 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.100.224.8])
	by smtp.gmail.com with ESMTPSA id 73sm815441qtc.16.2016.08.31.12.36.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 31 Aug 2016 12:36:52 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 16:36:12 -0300
Message-Id: <1472672172-21517-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH v2] python-pyopenssl: Extend recipe to support Python 3
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
X-List-Received-Date: Wed, 31 Aug 2016 19:36:54 -0000

- Add Python 3 recipe
- Add native and nativesdk to BBCLASSEXTEND

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-pyopenssl.inc   | 23 ++++++++++++++++++++++
 .../python/python-pyopenssl_16.0.0.bb              | 17 +---------------
 .../python/python3-pyopenssl_16.0.0.bb             |  2 ++
 3 files changed, 26 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyopenssl.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pyopenssl_16.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc b/meta-python/recipes-devtools/python/python-pyopenssl.inc
new file mode 100644
index 0000000..ce948e1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyopenssl.inc
@@ -0,0 +1,23 @@
+SUMMARY = "Simple Python wrapper around the OpenSSL library"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS = "openssl ${PYTHON_PN}-cryptography"
+
+SRC_URI[md5sum] = "9587d813dcf656e9f2760e41a3682dc3"
+SRC_URI[sha256sum] = "363d10ee43d062285facf4e465f4f5163f9f702f9134f0a5896f134cbb92d17d"
+
+PYPI_PACKAGE = "pyOpenSSL"
+
+PACKAGES =+ "${PN}-tests"
+FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
+
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-threading \
+"
+
+RDEPENDS_${PN}-tests = "${PN}"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
index 8173858..d7177e2 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
@@ -1,17 +1,2 @@
-SUMMARY = "Simple Python wrapper around the OpenSSL library"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-DEPENDS = "openssl python-cryptography"
-
-SRC_URI[md5sum] = "9587d813dcf656e9f2760e41a3682dc3"
-SRC_URI[sha256sum] = "363d10ee43d062285facf4e465f4f5163f9f702f9134f0a5896f134cbb92d17d"
-
-PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools
-
-PACKAGES =+ "${PN}-tests"
-FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
-
-RDEPENDS_${PN} = "python-threading python-six python-cryptography"
-RDEPENDS_${PN}-tests = "${PN}"
+require python-pyopenssl.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_16.0.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_16.0.0.bb
new file mode 100644
index 0000000..0f0f83e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyopenssl_16.0.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pyopenssl.inc
-- 
2.1.4


