Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 482B878258
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Dec 2017 20:04:22 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r184so19080133qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Dec 2017 12:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+crZKBdVk5mGw44HE00xm4F9/sSZY9q9sf8RbPnMvWw=;
	b=JGH3u0Q3g1BS1LZmp+XnSVgSpKJsMgq4pb2e3j8A7BDb2H/6Zvux+HDI3ZcxJ5R5oR
	GG3pmD7vpi1yonDKzCLN9fzXS7AsO/64XE0jYVlXGLbq5hTiL2Q3eyZlSkXV59KskAVa
	HbAjFf4ecwlaups8/F17Hr5pzHO6Is3+/ETEsQVIYDokleRzpOhpSO9SJoGrsuAmtE7o
	7GIcBao+DJx2jQI/WMTiRW6DHaHSGjhdEx37TUGPsBLo4yo7ranIv4dGxYkMrS7W9zRz
	YLeQNGMnZtLBwkUnYU2wjLtKUb+GAgDwZ2mFtQnt4Ld3eAO0IIvXe5oar4QlajaruQfw
	+Yww==
X-Gm-Message-State: AKGB3mJUVn64QeCyg35p32dfWqlJic54fRPVaN1OkmwFQHJydMfsAti/
	K7hmYXdDj3cH+KEv9E82b/uXvkEn
X-Google-Smtp-Source: AGs4zMZAdgOxctFlBXBJmzN99f8TH2mqWIcQ3KIyxzN8We8GQ9Yy3C3R+o1FGWC9nUKpKP+fC5oYhA==
X-Received: by 10.55.162.130 with SMTP id l124mr1466255qke.168.1512331463926; 
	Sun, 03 Dec 2017 12:04:23 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id k3sm2708831qtj.40.2017.12.03.12.04.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Dec 2017 12:04:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Dec 2017 15:04:17 -0500
Message-Id: <1512331457-13213-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pywbem: update to version 0.11.0 and add a python3 recipe
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
X-List-Received-Date: Sun, 03 Dec 2017 20:04:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../pywbem/{pywbem_0.8.0.bb => python-pywbem.inc}  | 37 +++++++++++++++-------
 .../pywbem/python-pywbem_0.11.0.bb                 | 11 +++++++
 .../pywbem/python3-pywbem_0.11.0.bb                |  8 +++++
 3 files changed, 44 insertions(+), 12 deletions(-)
 rename meta-python/recipes-extended/pywbem/{pywbem_0.8.0.bb => python-pywbem.inc} (58%)
 create mode 100644 meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb
 create mode 100644 meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb

diff --git a/meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb b/meta-python/recipes-extended/pywbem/python-pywbem.inc
similarity index 58%
rename from meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb
rename to meta-python/recipes-extended/pywbem/python-pywbem.inc
index 7f1986e..325131f 100644
--- a/meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb
+++ b/meta-python/recipes-extended/pywbem/python-pywbem.inc
@@ -12,25 +12,38 @@ at http://www.dmtf.org/standards/wbem. \
 \
 It also provides a Python provider interface, and is the fastest and easiest \
 way to write providers on the planet."
-HOMEPAGE = "http://pywbem.sf.net/"
-LICENSE = "LGPLv2"
+HOMEPAGE = "http://pywbem.github.io"
+LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
-SECTION = "Development/Libraries"
-DEPENDS = "python-m2crypto-native python-typing-native"
-SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BPN}/${BP}/${BP}-dev.r704.zip"
-SRC_URI[md5sum] = "84072451dcdd1aa9ee82363848faf7ad"
-SRC_URI[sha256sum] = "898035866d3cc741bbcd62c4ac26e633ad07b7c11d89db2472b9f923f3fd3ed8"
+SRC_URI[md5sum] = "1465dfa92e4cbe558c773838b9b00711"
+SRC_URI[sha256sum] = "2a05f2c1a6ab4b08560a6da55fdaabd0f52f4d1e6df6e288b9ed927bf5c289ed"
 
-S = "${WORKDIR}/${BP}-dev"
+inherit pypi 
 
-inherit setuptools python-dir
+DEPENDS += " \
+    ${PYTHON_PN}-ply-native \
+    ${PYTHON_PN}-pyyaml-native \
+    ${PYTHON_PN}-six-native \
+"
 
 do_install_append() {
     mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
-    mv ${D}${bindir}/mof_compiler.py ${D}${bindir}/mofcomp
 
-    rm ${D}${libdir}/python2.7/site-packages/${BPN}/wbemcli.py*
-    rm ${D}${libdir}/python2.7/site-packages/${BPN}/mof_compiler.py*
+    rm -f ${D}${bindir}/*.bat
 }
 
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-ply \
+    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-xml \
+"
+
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb b/meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb
new file mode 100644
index 0000000..963a137
--- /dev/null
+++ b/meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb
@@ -0,0 +1,11 @@
+require python-pywbem.inc
+inherit setuptools
+
+DEPENDS += " \
+    ${PYTHON_PN}-m2crypto-native \
+    ${PYTHON_PN}-typing-native \
+"
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-m2crypto \
+"
diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb
new file mode 100644
index 0000000..de2a6f5
--- /dev/null
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb
@@ -0,0 +1,8 @@
+require python-pywbem.inc
+inherit setuptools3
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-enum \
+    ${PYTHON_PN}-selectors \
+    ${PYTHON_PN}-subprocess \
+"
-- 
2.7.4


