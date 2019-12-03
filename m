Return-Path: <ticotimo@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3931A7CFE3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 15:40:28 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id r67so1685097pjb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2019 07:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5b1HJXN3ivpXyHSja92k4hPJuH9aQj+YqgAXF68JptM=;
	b=ZBe+S9T2Z4N7DXC104LExTyM1YYqWWJwIcx7YNlApK0XVDNngTL20LNZHWYXNKXK4m
	astZ0sWhNxdShVrf9i5AwcgxNx6n+h65TfBUPVFEs4uBWlnN8A8DnYHcTukWsJPNdXbq
	/eNYhvkq6OiPdx/+N1FMEn6LDUQ/5dhOG/DPqgJZno7Btd7rW2sxMRvwsQW11uoEaeZW
	rxxexJ4X+u5wP1SIPVgPVmJjqxQ+EgDd9/BD1y0b7EfdfNzFztMOE47E1pglOAxSvNJ/
	EbndFDTJH1QIsH0l+yDyAjl4Nzn2QGs5daVWzHsal4NOvRuQELPN+vPDdKKXRtMnk1i+
	v0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5b1HJXN3ivpXyHSja92k4hPJuH9aQj+YqgAXF68JptM=;
	b=OUsIxC7TDu/bYjos1NwVplWpgMW9irIZH44NNHddqtjx7VYIc1QUHVIGW0zhC/nHHW
	wFLIKY6yM0n58Tl/1iCazjvAbX7bubZKJBCI9wn+50zjtJDutC5g5rxgzp+DLjNSFhmJ
	NwYZuooVhWipUq6RoO9bYmMaimhFZCh5WbNf2uiI8nxbsPRYfGm+2CoVVxt2W09DKyLa
	7GytALPGuuvUmsFg0FQHC5kv7ajU8WOJxUwr8pccz/EdvmTq8s8/TWoHt8jSMiEJRR54
	A5e0IGlVfo4MOrpH83pIXdqksl/n/woav7vfigUX0rDQFn0MeUOiMg9e6t5Gc1uhMMT8
	t6zg==
X-Gm-Message-State: APjAAAVoItfEchP9K5R9NZGeAIYScp9cZyc9vO0Fi+rTglYNo/YCgUKN
	0qwwNzrJRa/Y1wipoUdj0ge02StD5nY=
X-Google-Smtp-Source: APXvYqxchDbMp4Wa2FtWR44u4jT30jSYYxuaXm+dISDAClSNT2FoMkrZY1Qxwmfp2Yl1BW9rJ9M2OQ==
X-Received: by 2002:a17:90b:941:: with SMTP id
	dw1mr6116607pjb.21.1575387628846; 
	Tue, 03 Dec 2019 07:40:28 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:a470:42fc:1110:b615])
	by smtp.gmail.com with ESMTPSA id
	s11sm3951439pgo.85.2019.12.03.07.40.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Dec 2019 07:40:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Dec 2019 07:40:16 -0800
Message-Id: <20191203154016.24251-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-python2][zeus][PATCH] python-backports-init: Add helper class and recipe
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
X-List-Received-Date: Tue, 03 Dec 2019 15:40:28 -0000
Content-Transfer-Encoding: 8bit

Recipes that install in the backports namespace have
a tendency to conflict in the installation of
.../site-packages/backports/__init__.py

Add a class and recipe to help avoid the conflict.

Modify recipes that are affected:
  - python-backports-functools-lru-cache
  - python-backports-ssl
  - python-configparser

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 classes/python-backports-init.bbclass         |  7 ++++++
 ...ython-backports-functools-lru-cache_1.5.bb |  2 +-
 .../backports/__init__.py                     |  5 ++++
 .../python/python-backports-init_1.0.bb       | 25 +++++++++++++++++++
 .../python/python-backports-ssl_3.5.0.1.bb    |  3 ++-
 .../python/python-configparser_3.8.1.bb       |  2 +-
 6 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 classes/python-backports-init.bbclass
 create mode 100644 recipes-devtools/python/python-backports-init/backports/__init__.py
 create mode 100644 recipes-devtools/python/python-backports-init_1.0.bb

diff --git a/classes/python-backports-init.bbclass b/classes/python-backports-init.bbclass
new file mode 100644
index 00000000..727bc4a8
--- /dev/null
+++ b/classes/python-backports-init.bbclass
@@ -0,0 +1,7 @@
+inherit python-dir
+
+RDEPENDS_${PN} += "python-backports-init"
+
+do_install_prepend() {
+    rm -rf $(find . -path "*/backports/__init__.py" -type f)
+}
diff --git a/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb b/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
index 825444ff..11c15338 100644
--- a/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
+++ b/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151f
 
 DEPENDS += "python-setuptools-scm-native"
 
-inherit setuptools pypi
+inherit setuptools pypi python-backports-init
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-pickle \
diff --git a/recipes-devtools/python/python-backports-init/backports/__init__.py b/recipes-devtools/python/python-backports-init/backports/__init__.py
new file mode 100644
index 00000000..febdb2f8
--- /dev/null
+++ b/recipes-devtools/python/python-backports-init/backports/__init__.py
@@ -0,0 +1,5 @@
+# A Python "namespace package" http://www.python.org/dev/peps/pep-0382/
+# This always goes inside of a namespace package's __init__.py
+
+from pkgutil import extend_path
+__path__ = extend_path(__path__, __name__)
diff --git a/recipes-devtools/python/python-backports-init_1.0.bb b/recipes-devtools/python/python-backports-init_1.0.bb
new file mode 100644
index 00000000..29e712a6
--- /dev/null
+++ b/recipes-devtools/python/python-backports-init_1.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Helper package to avoid backports/__init__.py conflicts"
+DETAIL = "backports packages in python2 suffer from a flaw in the namespace \
+implementation and can conflict with each other. For OE purposes, at least \
+fix the conflicting install of .../site-packages/backports/__init__.py"
+AUTHOR = "Tim Orling <ticotimo@gmail.com>"
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://backports/__init__.py"
+
+inherit python-dir
+
+# provide to avoid warnings
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/backports
+    install ${WORKDIR}/backports/__init__.py ${D}${PYTHON_SITEPACKAGES_DIR}/backports/
+}
+
+FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py"
diff --git a/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb b/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
index 45492daa..8be16039 100644
--- a/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
+++ b/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
@@ -13,6 +13,7 @@ SRC_URI[md5sum] = "c03fc5e2c7b3da46b81acf5cbacfe1e6"
 SRC_URI[sha256sum] = "502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2"
 
 PYPI_PACKAGE = "backports.ssl_match_hostname"
-inherit pypi setuptools
+
+inherit pypi setuptools python-backports-init
 
 RDEPENDS_${PN} += "${PYTHON_PN}-pkgutil"
diff --git a/recipes-devtools/python/python-configparser_3.8.1.bb b/recipes-devtools/python/python-configparser_3.8.1.bb
index 69f045db..859dbd78 100644
--- a/recipes-devtools/python/python-configparser_3.8.1.bb
+++ b/recipes-devtools/python/python-configparser_3.8.1.bb
@@ -1,2 +1,2 @@
-inherit setuptools
+inherit setuptools python-backports-init
 require python-configparser.inc
-- 
2.24.0


