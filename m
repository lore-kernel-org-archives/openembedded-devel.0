Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.23000.1589726103023671754
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2020 07:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=LQA7a2t6;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=5ztw=67=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Q4Rk6xNwz4b
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2020 16:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589726099;
	bh=8k/wg6NZ9RWQnM/2211aWfb0droKYOgeybskqKpSGlc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LQA7a2t6R1V5fyUjAbgbd0KaYtU7N3fTdihvWcmF0ipsUzRrATUPiATrQIvfvXgJ8
	 YItMSGxszVBlNXZaCIH0sY371CLH//ZWvncX+pahQqTqV1qPlRksuPEssqd2RQAq26
	 Yc40RKAYWo1pGL+tYjVdFoE3nSCTuJwWPeqNWGtodK/UD3R8wgTg2Deg5WPViPSASt
	 Ic3Uy0Klaa+aqO2DcL3V5ld1+oxPW0Ht8p6B5gNY+hLyt89rUW6XcJhfVeRk8mK9YZ
	 N82uaTEtu2yZgJ4rU1KzVvhwQz/Bn8r6HZDOq6QzeKZXFzZVbPqB5zvTiBJ6pn5163
	 mJ4vRfiIRCKyscNPimY6jLHPy9WTtT8kEGjyyDPSR/NRQlJNlvpFkTRiHwbebVOfQF
	 ap3QoY3pRDMGu+bAF8ijmShav4JCwc+/x4TyUD00KlQi2mFKPGMLEXSOECfCbmVKPR
	 k0fzJT7tBq1p0koCMlZfJyHcokenIDZY5CP119epQP5rsNQgxkUSzvhYgGK7aRSyN7
	 TIyCwoaMGGRyOUxyBjxW9hWUaQExWc5DxFerODR3Zqqflq8ujbSWkguI6z42Q+nN1K
	 +JrR6dqfNWipoYAW/KGliadMrQrKXX3eUZALgeOIxgi6AnYentnZ6YD3H0hyRffB/m
	 5ZVjkQFcQvHYq3ZzoleSGihE=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/4] python3-cython: Remove, moved to OE-core
Date: Sun, 17 May 2020 17:34:55 +0300
Message-Id: <20200517143456.24873-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200517143456.24873-1-bunk@stusta.de>
References: <20200517143456.24873-1-bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../packagegroups/packagegroup-meta-python.bb |  2 +-
 .../recipes-devtools/python/python-cython.inc | 40 -------------------
 .../python/python3-cython_0.29.14.bb          | 18 ---------
 3 files changed, 1 insertion(+), 59 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-cython.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-cython_0.29.14.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 4036e1e20..596c20a8c 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -22,7 +22,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-sijax python3-langtable python3-requests-file python3-crcmod python3-robotframework \
     python3-pint python3-coverage python3-iso8601 python3-ndg-httpsclient python3-yappi python3-twofish \
     python3-speaklater python3-smbus python3-djangorestframework python3-msgpack python3-jsonpointer \
-    python3-flask-script python3-cassandra-driver python3-cython python3-ujson python3-aws-iot-device-sdk-python \
+    python3-flask-script python3-cassandra-driver python3-ujson python3-aws-iot-device-sdk-python \
     python3-pytest-runner python3-pyiface python3-flask-login python3-markupsafe python3-setuptools-scm \
     python3-semver python3-sdnotify python3-flask-user python3-tornado python3-jsonpatch python3-pexpect \
     python3-progress python3-jsonschema python3-xstatic python3-pyroute2 python3-idna python3-sqlalchemy \
diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
deleted file mode 100644
index 3260e92ba..000000000
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION = "Cython is a language specially designed for writing Python extension modules. \
-It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
-and the messy, low-level world of C."
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
-PYPI_PACKAGE = "Cython"
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "6e2f139e30bb08d68366f9370d87964c"
-SRC_URI[sha256sum] = "e4d6bb8703d0319eb04b7319b12ea41580df44fd84d83ccda13ea463c6801414"
-
-inherit pypi
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pyparsing \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-xml \
-"
-
-RDEPENDS_${PN}_class-nativesdk += "\
-    nativesdk-${PYTHON_PN}-misc \
-    nativesdk-${PYTHON_PN}-netserver \
-    nativesdk-${PYTHON_PN}-pkgutil \
-    nativesdk-${PYTHON_PN}-pyparsing \
-    nativesdk-${PYTHON_PN}-setuptools \
-    nativesdk-${PYTHON_PN}-shell \
-    nativesdk-${PYTHON_PN}-xml \
-"
-
-do_install_append() {
-	# Make sure we use /usr/bin/env python
-	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
-		sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
-	done
-}
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.29.14.bb b/meta-python/recipes-devtools/python/python3-cython_0.29.14.bb
deleted file mode 100644
index 2ce6bdbd6..000000000
--- a/meta-python/recipes-devtools/python/python3-cython_0.29.14.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-inherit setuptools3
-require python-cython.inc
-
-RDEPENDS_${PN} += "\
-    python3-setuptools \
-"
-
-# running build_ext a second time during install fails, because Python
-# would then attempt to import cythonized modules built for the target
-# architecture.
-DISTUTILS_INSTALL_ARGS += "--skip-build"
-
-do_install_append() {
-    # rename scripts that would conflict with the Python 2 build of Cython
-    mv ${D}${bindir}/cython ${D}${bindir}/cython3
-    mv ${D}${bindir}/cythonize ${D}${bindir}/cythonize3
-    mv ${D}${bindir}/cygdb ${D}${bindir}/cygdb3
-}
-- 
2.17.1

