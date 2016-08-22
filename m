Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2796573259
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:02:50 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r128so8982921qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=8Mo0QZfKi5vAZE+amSQxPhJJQ2noEmfM6+cDZpZMpEc=;
	b=co5Dq8t4vQzT53Z97R05RRYX60YllFwveNuiW7LHGaqaRLhPCFmuRr6ee5AtzaGR8v
	a8Gt9KhV7e45HiwmRXTs7JaVMYcLciDFY8IWMeVLUXjBmYMOFBqUyZsZ7bBBs1E2IHDS
	szXrIoxr3WrhwFz3nDyx/IQmEkXwQAGvC+9OwP2qKDrQvdWEa6s3QX3y6zd5W1kD5Iv8
	IMZmNwEgSm3Nkphmv6jeddGEbrmWgz5TeCTMnLiyY3oZc4OaLnACjEnbxN8zzXk5XlYl
	YnTvVhkEiMr+WeJmVeVh62Q+0I0RjhwNUtnYMLg48taGbS5a7Wq+x1vhH4WmcKDblVxw
	srxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=8Mo0QZfKi5vAZE+amSQxPhJJQ2noEmfM6+cDZpZMpEc=;
	b=Hd9UgixJYHJJDeLQiACsiAoYtsiHltGt2f+i3+fN/C1FR0vOE1Z+r9GMRO3aiS7ccc
	FazcTKWjy4vLGzHB26R4+tMQHdT9nP+EUpLrQiW6VC2DUzLTr5XHlCS0Kacdv4lZQ0jI
	qIfLacWOwJjh15JovIVwZXEYpYS0Sx1E8YVqL0jfh8RKrvS3J+PEQGZpvVc1BfeVuCll
	aIAwxopmug40lNvvZn2HD2dCfxdpiYW3HWjR2YaTz8RJQZzYyrzGvLyFCOsevp7gQfpV
	0bNdNUEdAyrnB7QP/U/iCQKxOMK1/oOBZ5HOHQM9bjs0dX+CrIrp76QdOhm+U1RBs8Pw
	syPg==
X-Gm-Message-State: AEkoousV0JxsX40f9zn9lu7xfohbKSbAtphYzvUks3NZQHoyC/oB70upLwQ0VAOjFuyp+Q==
X-Received: by 10.55.156.135 with SMTP id f129mr25808512qke.160.1471892570852; 
	Mon, 22 Aug 2016 12:02:50 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.02.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:02:49 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:16 -0300
Message-Id: <1471892491-6177-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 02/17] python-cryptography: Extend recipe to support Python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:02:51 -0000

  - Add Python 3 recipe
  - Change DEPENDS and RDEPENDS code style
  - Add native and nativesdk to BBCLASSEXTEND

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../python/python-cryptography.inc                 | 48 ++++++++++++++++++++
 .../python/python-cryptography_1.4.bb              | 53 ++++------------------
 .../python/python3-cryptography/run-ptest          |  2 +
 .../python/python3-cryptography_1.4.bb             | 10 ++++
 4 files changed, 70 insertions(+), 43 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography_1.4.bb

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
new file mode 100644
index 0000000..d4767b1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -0,0 +1,48 @@
+SUMMARY = "Provides cryptographic recipes and primitives to python developers"
+LICENSE = "Apache-2.0 | BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
+
+DEPENDS += " \
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-cffi-native \
+    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-six \
+"
+
+SRC_URI[md5sum] = "a9763e3831cc7cdb402c028fac1ceb39"
+SRC_URI[sha256sum] = "bb149540ed90c4b2171bf694fe6991d6331bc149ae623c8ff419324f4222d128"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-pycparser \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-threading \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    ${PN} \
+    ${PYTHON_PN}-cryptography-vectors \
+    ${PYTHON_PN}-iso8601 \
+    ${PYTHON_PN}-pretend \
+    ${PYTHON_PN}-pytest \
+"
+
+inherit ptest
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/hazmat
+    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
+}
+
+FILES_${PN}-dbg += " \
+    ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.4.bb b/meta-python/recipes-devtools/python/python-cryptography_1.4.bb
index a6b5bd0..b05c615 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_1.4.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_1.4.bb
@@ -1,49 +1,16 @@
-SUMMARY = "Provides cryptographic recipes and primitives to Python developers"
-LICENSE = "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
-DEPENDS += " python-cffi-native python-cffi python-enum34 python-six python-pyasn1"
-SRCNAME = "cryptography"
-
-SRC_URI = "file://run-ptest"
-
-SRC_URI[md5sum] = "a9763e3831cc7cdb402c028fac1ceb39"
-SRC_URI[sha256sum] = "bb149540ed90c4b2171bf694fe6991d6331bc149ae623c8ff419324f4222d128"
-
 inherit pypi setuptools
+require python-cryptography.inc
 
-RDEPENDS_${PN} = "\
-                  python-pyasn1\
-                  python-six\
-                  python-cffi\
-                  python-enum34\
-                  python-setuptools\
-                  python-pycparser\
-                  python-subprocess\
-                  python-threading\
-                  python-numbers\
-                  python-contextlib\
-                  python-ipaddress\
-                  python-pyasn1\
-                  python-idna\
+SRC_URI += " \
+    file://run-ptest \
 "
 
-RDEPENDS_${PN}-ptest = "\
-                       ${PN}\
-                       python-pytest\
-                       python-pretend\
-                       python-iso8601\
-                       python-cryptography-vectors\
+DEPENDS += " \
+    ${PYTHON_PN}-enum34 \
 "
 
-inherit ptest
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    install -d ${D}${PTEST_PATH}/tests/hazmat
-    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
-}
-
-FILES_${PN}-dbg += " \
-    ${libdir}/python2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
-    "
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-contextlib \
+    ${PYTHON_PN}-enum34 \
+    ${PYTHON_PN}-ipaddress \
+"
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/run-ptest b/meta-python/recipes-devtools/python/python3-cryptography/run-ptest
new file mode 100644
index 0000000..0ba239c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+py.test
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_1.4.bb b/meta-python/recipes-devtools/python/python3-cryptography_1.4.bb
new file mode 100644
index 0000000..f807042
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography_1.4.bb
@@ -0,0 +1,10 @@
+inherit pypi setuptools3
+require python-cryptography.inc
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-lang \
+"
-- 
2.1.4


