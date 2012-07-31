Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1w0-0007iA-GN
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:11:44 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so2102689wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 19:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0aNuHXBmzgdkAmerTa9S2EhqEJsYpiit2G20dQ6/SUQ=;
	b=vnnXFT9VsbEEq+82WradHFYS3gQEjnDLUwzu5iC9o2SHnQm0FWkrk+v82biYBFOnIL
	msWJzjID3AVLdDxHKR2VsB/0NOdAdJy/3nEcY8l67VJmP1IkMEjTtJSEMk2RMdYrMGEc
	geiCnTKhXO3QxKptkO41vl2KpcrSzJP/DUl6D6pRpjF1TcCki7lBgct6XWJGYPkeLMGF
	wiiPijwVXUHZlBEC8B7yu/Vaqp6zuS2JD6MumgbQisb9W2hVEKzPtCtyhl1UbvAflMwA
	Mnen9O1FzcDub/1buDwnKxf6F5wMflQn9IKOramD8eyFR7L0GYJs4BEPWtgwLkbtMh9X
	FhKA==
Received: by 10.216.93.81 with SMTP id k59mr6885166wef.144.1343700010317;
	Mon, 30 Jul 2012 19:00:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm28807036wiz.9.2012.07.30.19.00.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 19:00:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:41 +0200
Message-Id: <15b9efea5d229a3a2b108b9eac253417f09687ff.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 16/24] python-epydoc, python-gdata, python-ldap, python-webdav: import from meta-smartphone
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 02:11:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-epydoc_3.0.1.bb |   18 ++++++++++++++++++
 .../recipes-devtools/python/python-gdata_1.2.4.bb  |   18 ++++++++++++++++++
 .../python/python-ldap/setup.cfg.patch             |   14 ++++++++++++++
 .../recipes-devtools/python/python-ldap_2.3.9.bb   |   13 +++++++++++++
 .../recipes-devtools/python/python-webdav_0.1.2.bb |   19 +++++++++++++++++++
 5 files changed, 82 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-epydoc_3.0.1.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-ldap/setup.cfg.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-webdav_0.1.2.bb

diff --git a/meta-oe/recipes-devtools/python/python-epydoc_3.0.1.bb b/meta-oe/recipes-devtools/python/python-epydoc_3.0.1.bb
new file mode 100644
index 0000000..4ec0668
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-epydoc_3.0.1.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Epydoc is a tool for generating API documentation for Python modules, based on their docstrings" 
+SECTION = "devel/python" 
+LICENSE = "MIT" 
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=011c0d78eb6054d731c879132d7313f0"
+HOMEPAGE = "http://epydoc.sourceforge.net/" 
+SRCNAME = "epydoc" 
+DEPENDS += "python"
+DEPENDS_virtclass-native += "python-native"
+
+SRC_URI = "http://downloads.sourceforge.net/project/${SRCNAME}/${SRCNAME}/${PV}/${SRCNAME}-${PV}.tar.gz" 
+SRC_URI[md5sum] = "cdd6f6c76dd8bab5e653a343a0544294"
+SRC_URI[sha256sum] = "d4e5c8d90937d01b05170f592c1fa9b29e9ed0498dfe7f0eb2a3af61725b6ad1"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}" 
+
+inherit distutils 
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb b/meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb
new file mode 100644
index 0000000..7351759
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Google Data APIs Python Client Library"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.txt;md5=473bd4dff0ddca1f958244b2dc7a162c"
+HOMEPAGE = "http://code.google.com/p/gdata-python-client/"
+
+inherit distutils
+
+SRC_URI = "http://gdata-python-client.googlecode.com/files/gdata.py-${PV}.tar.gz"
+SRC_URI[md5sum] = "521f33a377d64f8a6505ba119415b787"
+SRC_URI[sha256sum] = "fc5ddb8f76b17abd728721a0e0177ea35f55a70106f44dc9010b22eceb06abde"
+
+S = "${WORKDIR}/gdata.py-${PV}"
+
+FILES_${PN} += "${datadir}"
+
+RDEPENDS_${PN} = "python-elementtree"
+
diff --git a/meta-oe/recipes-devtools/python/python-ldap/setup.cfg.patch b/meta-oe/recipes-devtools/python/python-ldap/setup.cfg.patch
new file mode 100644
index 0000000..a703d34
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-ldap/setup.cfg.patch
@@ -0,0 +1,14 @@
+--- python-ldap-2.3.9/setup.cfg.orig    2009-08-13 11:07:23.000000000 +0200
++++ python-ldap-2.3.9/setup.cfg 2009-08-13 11:07:37.000000000 +0200
+@@ -1,9 +1,9 @@
+ [_ldap]
+ extra_objects = 
+ extra_compile_args = 
+-libs = ldap_r lber sasl2 ssl crypto
++libs = ldap_r lber ssl crypto
+ library_dirs = /opt/openldap-RE24/lib
+-include_dirs = /opt/openldap-RE24/include /usr/include/sasl
++include_dirs = /opt/openldap-RE24/include
+
+ [egg_info]
+ tag_build =  
diff --git a/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb b/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
new file mode 100644
index 0000000..dfe1522
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "LDAP client API for Python, C wrapper module around OpenLDAP 2.x with an object-oriented API" 
+SECTION = "devel/python" 
+LICENSE = "Python-style" 
+LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
+HOMEPAGE = "http://www.python-ldap.org/" 
+DEPENDS = "python openldap" 
+
+SRC_URI = "http://pypi.python.org/packages/source/p/${PN}/${PN}-${PV}.tar.gz \ 
+           file://setup.cfg.patch"
+SRC_URI[md5sum] = "a9f9f16338288d118a1ae6266c993247"
+SRC_URI[sha256sum] = "62f75b21c5ee744408c9d8b59878328b3bdf47899d30e8abf0c09b3ffb893ed4"
+
+inherit setuptools  
diff --git a/meta-oe/recipes-devtools/python/python-webdav_0.1.2.bb b/meta-oe/recipes-devtools/python/python-webdav_0.1.2.bb
new file mode 100644
index 0000000..7a6437d
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-webdav_0.1.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "This project aims to provide an object-oriented Python WebDAV client-side library\
+               based on Python`s standard httplib and Greg Stein`s davlib.\
+               The client shall fully support RFCs 4918 (basic specification),\
+               3744 (access control), and 3253 (versioning)."
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/webdav/WebdavClient.py;endline=15;md5=a1520fad859feb7b0d7f05277bc6ce48"
+HOMEPAGE = "http://sourceforge.net/projects/pythonwebdavlib/"
+SRCNAME = "Python_WebDAV_Library"
+DEPENDS = "python"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/pythonwebdavlib/Python%20WebDAV%20Library%20-%20${PV}/${SRCNAME}-${PV}.zip"
+SRC_URI[md5sum] = "8e49e0ecc5b4327c4f752a544ee10e1a"
+SRC_URI[sha256sum] = "72c029ad1e25de950f59c2f1812d009d2c1691b70e4b5b09f1af9006e8fd5f23"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
-- 
1.7.8.6



