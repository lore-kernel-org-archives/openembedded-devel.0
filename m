Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0000C7197E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 01:53:26 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id h75so1624975pfh.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 18:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AZxtjtG7wmYWvGzQ+x7gxRTLFm1gE6PMiyy+0288fkw=;
	b=cwzeRENtAD3Of60Gas3lk7+VN+RvLkUrxpPJ51wKGQOLCO/+WHHSx+uw1FUVWaaohG
	A4iK14qMba8gyQ67G5di0p1LVL6aBhMdq5uQx+jl4fxnRiWhKc6xJf+3994bJ7LMHDeS
	/KjMe4Npw+G8i1iEwN0USwJcHhACJJVpV1aSeM2mAh5auJNzPQJnDeRsJCWmQ4+lg7KC
	KjvVgA/Xok/ON4300Qh7RhSJx6pYA1gTCDif7HZ30n27tvkY7JCQUXyUqce5uI87CagI
	vnnDirgkWqAVVbJMbi54Zhb3dI3NMIDtKsO2l90W+OAzViqFT+t+eUdZlXe1N76az2Ab
	vRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AZxtjtG7wmYWvGzQ+x7gxRTLFm1gE6PMiyy+0288fkw=;
	b=HwFLkm1wiRPJ2Bk1wcycw63q8obNCDIjihbkjWPzrtpINCzCIoRcuYiBMsJp9Klv5G
	XR/INIqkPVDNncqHx1DGPKdbJ5ruitQgF/Aiit0IOnFOe4MCCDpUPzNwtYEMHl79JUNb
	92XMnYC5pZjv8ADmcX7VOTteMMbGTGKknvYvi4rO5LPB/4aIaQR7ILxwj3qTzhsY7smV
	Z7DkEjVsKiOqeVxw2TuYYlO+0cibTO4WLAb+3GyIf9j9lgfDZV9Fj3GTfIz+of+/Q31r
	PjtE8pe1Kdt0MfY8WpU8+HwTWLr672lKPUQEIyy3zHn2YTTustcIpOOd1K9ngljoIrbG
	Wi4g==
X-Gm-Message-State: AHYfb5isj/heLca1k4b1WH5ZrAb9+IR9P/iH5CLymF84DN2RNECx4D50
	yk1CTgBkbap1uaUQ
X-Received: by 10.98.194.8 with SMTP id l8mr1086970pfg.293.1503453208022;
	Tue, 22 Aug 2017 18:53:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id k80sm383157pfj.42.2017.08.22.18.53.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Aug 2017 18:53:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Aug 2017 18:53:19 -0700
Message-Id: <20170823015319.8326-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-python][PATCH V2] python-m2crypto: Upgrade to 0.26.0
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
X-List-Received-Date: Wed, 23 Aug 2017 01:53:27 -0000

Use proper LICENCE file for LIC_FILES_CHKSUM
Update homepage to point to gitlab

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{python-m2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python-m2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
rename to meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
index 72523bd7f..1a5be8e2c 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
@@ -1,13 +1,12 @@
 SUMMARY = "A Python crypto and SSL toolkit"
-HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
+HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95295693f047bb8f76928251a6154a60"
-
-SRC_URI[md5sum] = "040234289fbef5bed4029f0f7d1dae35"
-SRC_URI[sha256sum] = "ac303a1881307a51c85ee8b1d87844d9866ee823b4fdbc52f7e79187c2d9acef"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
+SRC_URI[md5sum] = "9f02f0b88fbe225cc6ea8680945cafa0"
+SRC_URI[sha256sum] = "05d94fd9b2dae2fb8e072819a795f0e05d3611b09ea185f68e1630530ec09ae8"
 
 PYPI_PACKAGE = "M2Crypto"
 inherit pypi setuptools siteinfo
@@ -18,8 +17,6 @@ RDEPENDS_${PN} += "python-typing"
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
 
-inherit setuptools
-
 SWIG_FEATURES_x86-64 = "-D__x86_64__"
 SWIG_FEATURES ?= ""
 export SWIG_FEATURES
@@ -28,6 +25,8 @@ export SWIG_FEATURES
 # multilib header file exists.
 #
 do_compile_prepend() {
+    ${CPP} -dM - < /dev/null | grep -v __STDC__ | grep -v __REGISTER_PREFIX__ | grep -v __GNUC__ \
+	| sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' > SWIG/gcc_macros.h
     if [ "${SITEINFO_BITS}" = "64" ];then
         bit="64"
     else
-- 
2.14.1


