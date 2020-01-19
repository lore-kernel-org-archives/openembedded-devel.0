Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7BEBD7D00A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 19:58:13 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id q8so14684102pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 11:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j0vZDo3hbO3adcwq7tfLJQuKNYndEdSkLzsAImzxFwM=;
	b=g3H5G5K9DKLEMTjjKx2haNCDxiqLZ/jqPcEMkzp6tMK4bjcB1nGsF2sKQP0xArU9Dm
	wOEEbRaH3ZmBw7D6BWLsvqI+zxTEmGx0uDxBu9Bm/6GoeT8RaMH4W/sQSFnkhWguB/VB
	DqTZOI+ThJwJefksc4fVxCTRXn9Gaw5mT2U3xrC83zCtf9+0PytDBAPmEy5VNohpjam3
	zCr4S6OQ3v85cRg+pxG/NHX4ZeK1JynnjDM+LeDr/xAZWjL0k89QlWTG92v7s3MOCPbH
	q97conYqBWOqPpvt5Xag421XyYGPGN9wSqUffNenuwSPwWioWbK1uOrSqE2xfzBrnldO
	oa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j0vZDo3hbO3adcwq7tfLJQuKNYndEdSkLzsAImzxFwM=;
	b=JklwX0XR/c3XSlWZO7FM52PZypomTHqGnvggoLOcI4GZfKVVY0KqqmHBO38futoFF3
	gCKSfl4U4FdH0b3lBFT3wwcIioUVLI0XYE/lSWmhs71hS0Si2cs6kOzPoMmf1Ni9NKdE
	eA8tE9y8blXKZ6M5criXVcnvbkVXZoQyms8RcjlV4jXAeHcwAkooCF+z365WnnTlLPEi
	Q+5T2dN3LkoNocE8mw6IUPeDhp1fHpbN2xatGntHXSp5xiSM6q2tvbtg2esI8qjmm7gq
	WVeDQVHUEXfQ89hrd/zBvBYuGlfSzdx8GUhboczYQp9vA1pyjNBJh/9isi73Rh+UPSEk
	nlwg==
X-Gm-Message-State: APjAAAWIBoHZSsX4HxG/OlCa2ER7r4K911i6NJWpikmwaBo9Oo16suBg
	VY0OYcV1bqKAHifD41OI+s2nQohO89s=
X-Google-Smtp-Source: APXvYqyWytfz7aaW3UnJISr2wkgvlCVsVbufdLJ5IFgu/agE2SO9gNbj5txbKTCfBinDsPa19rI6JA==
X-Received: by 2002:a62:3892:: with SMTP id
	f140mr13588548pfa.190.1579463894297; 
	Sun, 19 Jan 2020 11:58:14 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:b5c2:b07:e8c5:4266])
	by smtp.gmail.com with ESMTPSA id
	o6sm34628896pgg.37.2020.01.19.11.58.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 11:58:13 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2020 11:57:49 -0800
Message-Id: <20200119195749.24161-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-backports-functools-lru-cache: 1.5 -> 1.6.1
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
X-List-Received-Date: Sun, 19 Jan 2020 19:58:14 -0000
Content-Transfer-Encoding: 8bit

* Add run-time dependency on python-pkgutil
* Install backports/functools_lru_cache.py

License-Update: LICENSE file is now provided

Upstream release notes:
  - v1.6.1
    Publish release notes on readthedocs.

  - v1.6.0
    Refresh package metadata. Use black for code style. Enroll with Tidelift.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 ...ython-backports-functools-lru-cache_1.5.bb | 19 -------------
 ...hon-backports-functools-lru-cache_1.6.1.bb | 27 +++++++++++++++++++
 2 files changed, 27 insertions(+), 19 deletions(-)
 delete mode 100644 recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
 create mode 100644 recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb

diff --git a/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb b/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
deleted file mode 100644
index 11c15338..00000000
--- a/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Backport of functools.lru_cache from Python 3.3"
-HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=57;endline=57;md5=98fc3658e5970d26f6b2109808c766be"
-
-PYPI_PACKAGE = "backports.functools_lru_cache"
-
-SRC_URI[md5sum] = "20f53f54cd3f04b3346ce75a54959754"
-SRC_URI[sha256sum] = "9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151fda4f1a"
-
-DEPENDS += "python-setuptools-scm-native"
-
-inherit setuptools pypi python-backports-init
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-threading \
-    "
diff --git a/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb b/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
new file mode 100644
index 00000000..8c40cf5e
--- /dev/null
+++ b/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Backport of functools.lru_cache from Python 3.3"
+HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
+
+PYPI_PACKAGE = "backports.functools_lru_cache"
+
+SRC_URI[md5sum] = "103000b21a8e683647e2ce41929f2a9d"
+SRC_URI[sha256sum] = "8fde5f188da2d593bd5bc0be98d9abc46c95bb8a9dde93429570192ee6cc2d4a"
+
+DEPENDS += "python-setuptools-scm-native"
+
+inherit setuptools pypi python-backports-init
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-threading \
+    "
+
+do_install() {
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/backports
+    install ${B}/backports/functools_lru_cache.py ${D}${PYTHON_SITEPACKAGES_DIR}/backports/
+}
+
+FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/functools_lru_cache.py"
-- 
2.25.0


