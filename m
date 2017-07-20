Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04DDE78284
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:44:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6K7iguq024041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 20 Jul 2017 00:44:43 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Jul 2017 00:44:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Jul 2017 03:44:30 -0400
Message-ID: <71359b49b9395961ec9032e029df67079f728674.1500536448.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500536448.git.hongxu.jia@windriver.com>
References: <cover.1500536448.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/8] python3-meh: add recipe 0.45
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
X-List-Received-Date: Thu, 20 Jul 2017 07:44:42 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/tweak-native-language-support.patch      | 44 ++++++++++++++++++++++
 .../python-meh/python3-meh_0.45.bb                 | 17 +++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-meh/files/tweak-native-language-support.patch
 create mode 100644 meta-python/recipes-extended/python-meh/python3-meh_0.45.bb

diff --git a/meta-python/recipes-extended/python-meh/files/tweak-native-language-support.patch b/meta-python/recipes-extended/python-meh/files/tweak-native-language-support.patch
new file mode 100644
index 0000000..41cfadd
--- /dev/null
+++ b/meta-python/recipes-extended/python-meh/files/tweak-native-language-support.patch
@@ -0,0 +1,44 @@
+From 6e7689bced8ef56cfb5969560d23706f8e039807 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 11 Apr 2016 23:01:19 -0400
+Subject: [PATCH] tweak native language support
+
+- Only support en_GB only.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index d0a9784..db152c4 100644
+--- a/Makefile
++++ b/Makefile
+@@ -24,7 +24,7 @@ test:
+ 	PYTHONPATH=. python $(TESTSUITE) -v
+ 
+ install:
+-	python setup.py install --root=$(DESTDIR)
++	python setup.py install --root=$(DESTDIR) --install-lib=${PYTHON_SITEPACKAGES_DIR} --prefix=${prefix}
+ 	$(MAKE) -C po install
+ 
+ ChangeLog:
+@@ -61,6 +61,13 @@ rpmlog:
+ 	@git log --pretty="format:- %s (%ae)" $(TAG).. |sed -e 's/@.*)/)/'
+ 	@echo
+ 
++po-empty:
++	for lingua in "en_GB" ; do \
++		[ -f po/$$lingua.po ] || \
++		msginit -i po/$(PKGNAME).pot -o po/$$lingua.po -l $$lingua --no-translator || \
++		exit 1 ; \
++	done
++
+ potfile:
+ 	$(MAKE) -C po potfile
+ 
+-- 
+1.9.1
+
diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.45.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.45.bb
new file mode 100644
index 0000000..6ace497
--- /dev/null
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.45.bb
@@ -0,0 +1,17 @@
+SUMMARY = "A python library for handling exceptions"
+DESCRIPTION = "The python-meh package is a python library for handling, saving, and reporting \
+exceptions."
+HOMEPAGE = "http://git.fedorahosted.org/git/?p=python-meh.git"
+LICENSE = "GPLv2+"
+
+inherit setuptools3
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master \
+"
+SRCREV = "2bfc751fd680515d44f7096945a1e282a1f7d6aa"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+FILES_${PN} += "${datadir}/*"
+
-- 
2.8.1


