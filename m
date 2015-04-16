Return-Path: <ticotimo@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 37DED73D59
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 15:18:23 +0000 (UTC)
Received: by yhcb70 with SMTP id b70so4517628yhc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=D9mG4jamKkufyn9qkXB/PYOVPyR37ijBobWqjM9tlXg=;
	b=z2tdybJz2gTh4MFsjQ+i1/zn61/O8HivKMg3OptyHbHYBblJjufMH9ABM52htuHAWN
	ER6OUF4j0YJ/PHZgjA/CpITIRf8QAluBHuMm9nCDLBLx/rjilR2kpxDUhKY3zV9Fkm9i
	RWFRNPnARlpCUiNaVtOcAACOGYIgqGwe4EDCVTF+ZNmanHq/76gBuUpUEZ0URBqBt0xG
	fITCRZnUwMd0theAndxWGkuEAiquEA60kO7ODE7idrJ7NA6IP3oSntKkRChlpeA0yY6C
	OTwSuhFb2kFxOPU7IjTt4rNdqyijG0qxErvnuRj8+oy8cwsoMXDeI+Dp4tbeL+9Jkwi5
	1f/Q==
X-Received: by 10.236.229.194 with SMTP id h62mr24687776yhq.95.1429197505133; 
	Thu, 16 Apr 2015 08:18:25 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by mx.google.com with ESMTPSA id f47sm5838584yho.52.2015.04.16.08.18.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Apr 2015 08:18:24 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 08:17:45 -0700
Message-Id: <fe13e2ccb414ea32085520e397fcc554b062afe4.1429196681.git.TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
References: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
In-Reply-To: <cover.1429196681.git.TicoTimo@gmail.com>
References: <cover.1429196681.git.TicoTimo@gmail.com>
Subject: [meta-python][PATCH 7/7] python-cryptography, -vectors: add 0.8.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Apr 2015 15:18:25 -0000

python-cryptography is required by python-pyopenssl >= 0.14

Includes python-cryptography-vectors package for ptest

Over 75k unit tests (100% coverage):
	* tested on nuc (x86) and beaglebone (arm) hardware.
	** will overload ram on default qemux86/qemuarm

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../python/python-cryptography-vectors_0.8.1.bb    | 14 +++++++
 .../python/python-cryptography/run-ptest           |  2 +
 .../python/python-cryptography_0.8.1.bb            | 46 ++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb
new file mode 100644
index 0000000..a9b64ed
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Test vectors for the cryptography package."
+SECTION = "devel/python"
+LICENSE = "Apache-2.0 | BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
+DEPENDS = "python-cryptography"
+SRCNAME = "cryptography_vectors"
+
+SRC_URI = "https://pypi.python.org/packages/source/c/cryptography-vectors/${SRCNAME}-${PV}.tar.gz"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "04fcfcc61aee62e3b4beb1740cd120ac"
+SRC_URI[sha256sum] = "4a69e66026bfce4b97f75e72fe262f5e8f71daddc081f6608e5b0db89e552504"
+
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-cryptography/run-ptest b/meta-python/recipes-devtools/python/python-cryptography/run-ptest
new file mode 100644
index 0000000..0ba239c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cryptography/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+py.test
diff --git a/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb b/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
new file mode 100644
index 0000000..41e4acd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Provides cryptographic recipes and primitives to Python developers"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0 | BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
+DEPENDS += " python-cffi-native python-cffi python-enum34 python-six python-pyasn1"
+SRCNAME = "cryptography"
+
+SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+           file://run-ptest \
+"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "70dde78a5515abdbfd7a3d58f15689ab"
+SRC_URI[sha256sum] = "f4e041bc83c1be94d87116a7aa201c378b7c6581be4d83994b2da0a84499f73b"
+
+inherit pypi
+
+RDEPENDS_${PN} = "\
+                  python-pyasn1\
+                  python-six\
+                  python-cffi\
+                  python-enum34\
+                  python-setuptools\
+                  python-pycparser\
+                  python-subprocess\
+                  python-threading\
+                  python-numbers\
+                  python-contextlib\
+"
+
+RDEPENDS_${PN}-ptest = "\
+                       ${PN}\
+                       python-pytest\
+                       python-pretend\
+                       python-iso8601\
+                       python-cryptography-vectors\
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
-- 
2.1.0


