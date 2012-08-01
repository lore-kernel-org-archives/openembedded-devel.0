Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwhUH-0006By-Jy
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 00:33:54 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so6562891wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fmiRtwPUS08cPAepWQ2+/kecNoo2xNvHOEXSa6lsMwk=;
	b=l02QD1YBM37xoqKDdhERRKKUMgkU/6umO4FJSZYslJE/35JPZC++Lvysr9/76m6NSj
	x5Z62DFMY3eTIhnht4+RpoEuG4QLNfzfBOyaSWXzBOxnD+HgYr14Hz6hkY7qa3RGZn/t
	daYxXK/koskUUR5JGUuzM5g2HDQ1RPhbzmw29FVLAbU6TViwBN32jeHTo/Rr1CB4z1eV
	6PveemZmpD6ieiXvuJrS3cxEqjNqfp7UK3/kS0gBaqBtbYbTb1HwO9kRX2b3pS+pcgvj
	7iFXTVDC0EA5eEAaQPdyLMhIZLrGIjqLSnexMGT4j27XNZmAUVVRsKVWqZi2rBMfcO7c
	KoXQ==
Received: by 10.180.93.68 with SMTP id cs4mr15279516wib.14.1343859736284;
	Wed, 01 Aug 2012 15:22:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm30245340wib.5.2012.08.01.15.22.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:22:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 00:21:05 +0200
Message-Id: <297d8ce601b52a6347bf0e5a8a14b8bf809cac1a.1343859304.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 8/8] anki: import from oe-classic and upgrade to latest
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
X-List-Received-Date: Wed, 01 Aug 2012 22:33:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../no-need-for-pyqt-at-buildtime.patch            |   23 ++++++++++++++++++++
 meta-oe/recipes-extended/anki/anki.inc             |   16 +++++++++++++
 meta-oe/recipes-extended/anki/anki_1.2.11.bb       |    4 +++
 .../no-need-for-pyqt-at-buildtime.patch            |   14 ++++++++++++
 meta-oe/recipes-extended/anki/libanki_1.2.11.bb    |    6 +++++
 5 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/anki/anki-1.2.11/no-need-for-pyqt-at-buildtime.patch
 create mode 100644 meta-oe/recipes-extended/anki/anki.inc
 create mode 100644 meta-oe/recipes-extended/anki/anki_1.2.11.bb
 create mode 100644 meta-oe/recipes-extended/anki/libanki-1.2.11/no-need-for-pyqt-at-buildtime.patch
 create mode 100644 meta-oe/recipes-extended/anki/libanki_1.2.11.bb

diff --git a/meta-oe/recipes-extended/anki/anki-1.2.11/no-need-for-pyqt-at-buildtime.patch b/meta-oe/recipes-extended/anki/anki-1.2.11/no-need-for-pyqt-at-buildtime.patch
new file mode 100644
index 0000000..b9f984b
--- /dev/null
+++ b/meta-oe/recipes-extended/anki/anki-1.2.11/no-need-for-pyqt-at-buildtime.patch
@@ -0,0 +1,23 @@
+--- anki-1.2.11/setup.py.orig	2012-08-01 11:13:49.452021898 +0200
++++ anki-1.2.11/setup.py	2012-08-01 13:10:06.340272121 +0200
+@@ -1,10 +1,8 @@
+ from setuptools import setup, find_packages
+ import sys, os
+ 
+-import ankiqt
+-
+ setup(name='ankiqt',
+-      version=ankiqt.appVersion,
++      version=os.environ["BUILD_PV"],
+       description='An intelligent spaced-repetition memory training program',
+       long_description="",
+       # Get strings from http://www.python.org/pypi?%3Aaction=list_classifiers
+@@ -22,7 +20,7 @@
+       license='GPLv3',
+       packages=find_packages(),
+       include_package_data=True,
+-      install_requires = 'anki >= ' + ankiqt.appVersion,
++      install_requires = 'anki >= ' + os.environ["BUILD_PV"],
+       zip_safe=False,
+       package_data={'ankiqt':
+                     ['locale/*/*/*']},
diff --git a/meta-oe/recipes-extended/anki/anki.inc b/meta-oe/recipes-extended/anki/anki.inc
new file mode 100644
index 0000000..50db4db
--- /dev/null
+++ b/meta-oe/recipes-extended/anki/anki.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Anki is a program designed to help you remember facts \
+(such as words and phrases in a foreign language) \
+as easily, quickly and efficiently as possible"
+HOMEPAGE = "http://ichi2.net/anki/"
+AUTHOR = "Damien Elmes"
+RDEPENDS_${PN} = "python-pyqt libanki"
+RRECOMMENDS_${PN} = "virtual-japanese-font"
+
+inherit setuptools
+
+SRC_URI = "http://anki.googlecode.com/files/anki-${PV}.tgz"
+SRC_URI[md5sum] = "dcd43787bed2dbe63ffb6d153ee9dbe5"
+SRC_URI[sha256sum] = "ca075fd0c0d6851d22046de8f6fa90d7c442cdd4a6783f7c6ffad7fbc46f5089"
+
+export BUILD_PV := "${PV}"
+SRC_URI += "file://no-need-for-pyqt-at-buildtime.patch"
diff --git a/meta-oe/recipes-extended/anki/anki_1.2.11.bb b/meta-oe/recipes-extended/anki/anki_1.2.11.bb
new file mode 100644
index 0000000..6518da8
--- /dev/null
+++ b/meta-oe/recipes-extended/anki/anki_1.2.11.bb
@@ -0,0 +1,4 @@
+require anki.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
diff --git a/meta-oe/recipes-extended/anki/libanki-1.2.11/no-need-for-pyqt-at-buildtime.patch b/meta-oe/recipes-extended/anki/libanki-1.2.11/no-need-for-pyqt-at-buildtime.patch
new file mode 100644
index 0000000..fa90eb4
--- /dev/null
+++ b/meta-oe/recipes-extended/anki/libanki-1.2.11/no-need-for-pyqt-at-buildtime.patch
@@ -0,0 +1,14 @@
+--- libanki/setup.py.orig	2012-08-01 13:10:19.942271847 +0200
++++ libanki/setup.py	2012-08-01 13:10:32.773272650 +0200
+@@ -1,10 +1,8 @@
+ from setuptools import setup, find_packages
+ import sys, os
+ 
+-import anki
+-
+ setup(name='anki',
+-      version=anki.version,
++      version=os.environ["BUILD_PV"],
+       description='An intelligent spaced-repetition memory training library',
+       long_description="",
+       # Get strings from http://www.python.org/pypi?%3Aaction=list_classifiers
diff --git a/meta-oe/recipes-extended/anki/libanki_1.2.11.bb b/meta-oe/recipes-extended/anki/libanki_1.2.11.bb
new file mode 100644
index 0000000..92c251b
--- /dev/null
+++ b/meta-oe/recipes-extended/anki/libanki_1.2.11.bb
@@ -0,0 +1,6 @@
+require anki.inc
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=070ca3b3ac381b278fa104643f2c858d"
+
+S = "${WORKDIR}/anki-${PV}/libanki"
-- 
1.7.8.6



