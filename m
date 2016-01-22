Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B9DAA7705D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:59 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 123so469163wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=mK9d1LchBy1RpfMNgGNenYBNw+JZK2gH6qFd/kmCV5w=;
	b=oxR7/q7aq+7DCZlboOtldh1/06/MQRyKIKMEh7cm4urxmQbydkGuOFalsXD5JVr3bq
	iWDK7fzSVyTNVmk2K41oXyVWq7bObtb4NcCaus99zdQneIsuHaJkO++ro8zarw8fSceU
	QsL/42k/tTpyMqGljubSmzMBq6jfsWovTo/rlGwy2fnr3jJoHDVn8JyTtwP6I728KeFQ
	4gs4BGJsbdS+B/x92UTT/fsKyFL3mWFI1ME+emkXfxFMTPRgcps+LJdcehvO/UrWn/g7
	Ds4noXwbFZREFfseWJzRndIYGYJBodrFwHaamMEP5aYQSa4FH5kedE4jasU5ZjXzIpV3
	i8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=mK9d1LchBy1RpfMNgGNenYBNw+JZK2gH6qFd/kmCV5w=;
	b=ad0wXbbQBj7Xp4CNdVzVZBjcyv7g2WHaj1sIuV2GsXseZQ2VJGX7DfJwA0TF0SnOtg
	4ukVkMBwxe84eqUXoiPYklAH3RkfBAUSZVJXKu0s2dx7lHBb1Bvh7wz+h6Qis7ilEgVE
	6hl62v5CiDshYWdvO2aQFgF+GQ7XKXVaJ4rqlUYtg6vfPjLqTj4MNvxSnpNOEn/u4F25
	PyQvJJT5pmxbPds7b3yYozJtK3nyz2n6QsFMYvbrtUmthA4pGQYTaKpvzMJsgOf9dEXt
	dcb2GLtPqHblp3iV78jk/G78jIlTFjkE9Fd9hT5Gomb9483YsBMrUNX/9jmOmkLDcN0a
	cX5A==
X-Gm-Message-State: AG10YOS+GZzmdhTq+YKtnsjH5Bxa4cNP1WKt+ke3Vpk9WgGseV9+O7B9o2ZAgduRTHPmaA==
X-Received: by 10.194.82.199 with SMTP id k7mr6356459wjy.65.1453505460358;
	Fri, 22 Jan 2016 15:31:00 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:59 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:18 +0100
Message-Id: <b2b8abc00739c65f50bc5fa881daeb3383843b78.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 16/21] python3-tornado: add recipe
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
X-List-Received-Date: Fri, 22 Jan 2016 23:31:00 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../recipes-devtools/python/python-tornado.inc     | 24 ++++++++++++++
 .../recipes-devtools/python/python-tornado_4.3.bb  | 37 ++--------------------
 .../recipes-devtools/python/python3-tornado_4.3.bb |  2 ++
 3 files changed, 29 insertions(+), 34 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-tornado.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado_4.3.bb

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
new file mode 100644
index 0000000..679b7ba
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -0,0 +1,24 @@
+SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
+DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
+By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
+polling, WebSockets, and other applications that require a long-lived connection to each user."
+HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://setup.py;startline=2;endline=15;md5=5ab7571a79ad62d0ca7aea308bac7560"
+
+SRC_URI[md5sum] = "d13a99dc0b60ba69f5f8ec1235e5b232"
+SRC_URI[sha256sum] = "c9c2d32593d16eedf2cec1b6a41893626a2649b40b21ca9c4cac4243bde2efbf"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email ${PYTHON_PN}-subprocess \
+                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi"
+
+RDEPENDS_${PN}-test += "${PN} ${PYTHON_PN}-unittest"
+
+PACKAGES =+ "\
+    ${PN}-test \
+"
+
+FILES_${PN}-test = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/test \
+    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/testing.py* \
+"
diff --git a/meta-python/recipes-devtools/python/python-tornado_4.3.bb b/meta-python/recipes-devtools/python/python-tornado_4.3.bb
index c107d6c..5bbad50 100644
--- a/meta-python/recipes-devtools/python/python-tornado_4.3.bb
+++ b/meta-python/recipes-devtools/python/python-tornado_4.3.bb
@@ -1,34 +1,3 @@
-SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
-DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
-By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
-polling, WebSockets, and other applications that require a long-lived connection to each user."
-HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=65b6c818261e415f48f5463a232ad195"
-
-SRCNAME = "tornado"
-
-SRC_URI = " \
-    https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "d13a99dc0b60ba69f5f8ec1235e5b232"
-SRC_URI[sha256sum] = "c9c2d32593d16eedf2cec1b6a41893626a2649b40b21ca9c4cac4243bde2efbf"
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-compression python-numbers python-email python-subprocess \
-                   python-pkgutil python-html python-json python-backports-ssl python-certifi"
-
-RDEPENDS_${PN}-test += "${PN} python-unittest"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-PACKAGES =+ "\
-    ${PN}-test \
-"
-
-FILES_${PN}-test = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/test \
-    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/testing.py* \
-"
+inherit pypi
+require python-tornado.inc
+RDEPENDS_${PN} += "${PYTHON_PN}-backports-ssl"
diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.3.bb b/meta-python/recipes-devtools/python/python3-tornado_4.3.bb
new file mode 100644
index 0000000..21a4300
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado_4.3.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-tornado.inc
-- 
1.9.1


