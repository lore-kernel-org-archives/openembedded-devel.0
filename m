Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 802087837D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:34:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6L7Ywbc000985
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jul 2017 00:34:58 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Jul 2017 00:34:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Jul 2017 03:34:42 -0400
Message-ID: <68d56a823c8f72bd984c426dc06d13261536d31f.1500621886.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500621886.git.hongxu.jia@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 05/10] python3-meh: add recipe 0.45
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
X-List-Received-Date: Fri, 21 Jul 2017 07:34:57 -0000
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


