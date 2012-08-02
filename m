Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwuCs-0006jI-9N
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 14:08:46 +0200
Received: by wgbds1 with SMTP id ds1so4882334wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Aug 2012 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=G/g/0+yq2EIRpqtmF9jK3NL/imlP7N85j7p0nH3GorM=;
	b=t0+bSlXDL4oI06rRq8zxLm/2SUEFpE3ukOcYRyBHDJbV1pkstFWPW/iTdfvZqNQueB
	Lhzi6q4lzaVGDD7xqH7TdRg2Hb27EYyU0vrmyZ5BLD0s1pPbahiynRw+8ni5sAGkVh5E
	spSi9ZcY6rPnB+1eK8kPq93T8zMkOVGpASOmqdVLdkbY+i5rsKEx4gtItGHvwQQML0YL
	/TUWialxi28u9Uy7h1Og8uVsRnd65EqXw+BdjrzwGGDccPVIkSO/n7oE/3prIt1AaeW7
	VWm6gYrwyHdYmd4s0xFtOU8U1pn8oEwuP3yQCsgKiU8DAmFVlqnOE0/l5NuvlowUdO+7
	tnrQ==
Received: by 10.217.2.133 with SMTP id p5mr10694562wes.143.1343908626904;
	Thu, 02 Aug 2012 04:57:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm33325177wib.10.2012.08.02.04.57.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 04:57:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 13:57:03 +0200
Message-Id: <15185d488aa1b910b35d66da225367883285f049.1343908599.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <297d8ce601b52a6347bf0e5a8a14b8bf809cac1a.1343859304.git.Martin.Jansa@gmail.com>
References: <297d8ce601b52a6347bf0e5a8a14b8bf809cac1a.1343859304.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343908599.git.Martin.Jansa@gmail.com>
References: <cover.1343908599.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2 8/8] anki: import from oe-classic
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
X-List-Received-Date: Thu, 02 Aug 2012 12:08:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/anki/anki-0.4.3.inc       |    8 +++++
 meta-oe/recipes-extended/anki/anki.inc             |    9 ++++++
 .../anki/anki/no-need-for-pyqt-at-buildtime.patch  |   28 ++++++++++++++++++++
 meta-oe/recipes-extended/anki/anki_0.4.3.bb        |    4 +++
 .../libanki/no-need-for-pyqt-at-buildtime.patch    |   14 ++++++++++
 meta-oe/recipes-extended/anki/libanki_0.4.3.bb     |    3 ++
 6 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/anki/anki-0.4.3.inc
 create mode 100644 meta-oe/recipes-extended/anki/anki.inc
 create mode 100644 meta-oe/recipes-extended/anki/anki/no-need-for-pyqt-at-buildtime.patch
 create mode 100644 meta-oe/recipes-extended/anki/anki_0.4.3.bb
 create mode 100644 meta-oe/recipes-extended/anki/libanki/no-need-for-pyqt-at-buildtime.patch
 create mode 100644 meta-oe/recipes-extended/anki/libanki_0.4.3.bb

diff --git a/meta-oe/recipes-extended/anki/anki-0.4.3.inc b/meta-oe/recipes-extended/anki/anki-0.4.3.inc
new file mode 100644
index 0000000..072e7f1
--- /dev/null
+++ b/meta-oe/recipes-extended/anki/anki-0.4.3.inc
@@ -0,0 +1,8 @@
+require anki.inc
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/anki/anki-${PV}.tgz"
+SRC_URI[md5sum] = "90434860945de4c09d55cdb5dbe984fc"
+SRC_URI[sha256sum] = "18a93fb46363ca34963fc2588cadf7415dd799dd647efa681859eb8b1b22f104"
+
+export BUILD_PV := "${PV}"
+SRC_URI += "file://no-need-for-pyqt-at-buildtime.patch"
diff --git a/meta-oe/recipes-extended/anki/anki.inc b/meta-oe/recipes-extended/anki/anki.inc
new file mode 100644
index 0000000..3092539
--- /dev/null
+++ b/meta-oe/recipes-extended/anki/anki.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "Anki is a program designed to help you remember facts \
+(such as words and phrases in a foreign language) \
+as easily, quickly and efficiently as possible"
+HOMEPAGE = "http://ichi2.net/anki/"
+AUTHOR = "Damien Elmes"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+inherit setuptools
diff --git a/meta-oe/recipes-extended/anki/anki/no-need-for-pyqt-at-buildtime.patch b/meta-oe/recipes-extended/anki/anki/no-need-for-pyqt-at-buildtime.patch
new file mode 100644
index 0000000..9eac1dc
--- /dev/null
+++ b/meta-oe/recipes-extended/anki/anki/no-need-for-pyqt-at-buildtime.patch
@@ -0,0 +1,28 @@
+#
+# (C) Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+#
+Index: anki-0.4.3/setup.py
+===================================================================
+--- anki-0.4.3.orig/setup.py	2008-02-12 19:17:56.000000000 +0000
++++ anki-0.4.3/setup.py	2008-02-12 19:19:29.000000000 +0000
+@@ -3,10 +3,8 @@
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
+@@ -24,7 +22,7 @@
+       license='GPLv2',
+       packages=find_packages(),
+       include_package_data=True,
+-      install_requires = 'anki >= ' + ankiqt.appVersion,
++      install_requires = 'anki >= ' + os.environ["BUILD_PV"],
+       zip_safe=False,
+       package_data={'ankiqt':
+                     ['locale/*/*/*']},
diff --git a/meta-oe/recipes-extended/anki/anki_0.4.3.bb b/meta-oe/recipes-extended/anki/anki_0.4.3.bb
new file mode 100644
index 0000000..7943ce8
--- /dev/null
+++ b/meta-oe/recipes-extended/anki/anki_0.4.3.bb
@@ -0,0 +1,4 @@
+require ${PN}-${PV}.inc
+
+RDEPENDS_${PN} = "python-pyqt python-sip libanki"
+RRECOMMENDS_${PN} = "virtual-japanese-font"
diff --git a/meta-oe/recipes-extended/anki/libanki/no-need-for-pyqt-at-buildtime.patch b/meta-oe/recipes-extended/anki/libanki/no-need-for-pyqt-at-buildtime.patch
new file mode 100644
index 0000000..92583e5
--- /dev/null
+++ b/meta-oe/recipes-extended/anki/libanki/no-need-for-pyqt-at-buildtime.patch
@@ -0,0 +1,14 @@
+--- libanki.orig/setup.py	2008-01-02 13:22:22.000000000 +0100
++++ libanki/setup.py	2012-08-02 11:39:13.604173933 +0200
+@@ -3,10 +3,8 @@
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
diff --git a/meta-oe/recipes-extended/anki/libanki_0.4.3.bb b/meta-oe/recipes-extended/anki/libanki_0.4.3.bb
new file mode 100644
index 0000000..636932f
--- /dev/null
+++ b/meta-oe/recipes-extended/anki/libanki_0.4.3.bb
@@ -0,0 +1,3 @@
+require anki-${PV}.inc
+
+S = "${WORKDIR}/anki-${PV}/libanki"
-- 
1.7.8.6



