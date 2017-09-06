Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86C1377DC8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTiYb022132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:44 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:12 -0500
Message-ID: <1504725809-12825-15-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/31] pywbem: Requires python-m2crypto-native (and others) from meta-python
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:42 -0000
Content-Type: text/plain

Move pywbem to the meta-python layer to avoid missing requirements.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb    | 36 ----------------------
 .../recipes-extended/pywbem/pywbem_0.8.0.bb        | 36 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
 create mode 100644 meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb

diff --git a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
deleted file mode 100644
index 7f1986e..0000000
--- a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Python WBEM Client and Provider Interface"
-DESCRIPTION = "\
-A Python library for making CIM (Common Information Model) operations over \
-HTTP using the WBEM CIM-XML protocol. It is based on the idea that a good \
-WBEM client should be easy to use and not necessarily require a large amount \
-of programming knowledge. It is suitable for a large range of tasks from \
-simply poking around to writing web and GUI applications. \
-\
-WBEM, or Web Based Enterprise Management is a manageability protocol, like \
-SNMP, standardised by the Distributed Management Task Force (DMTF) available \
-at http://www.dmtf.org/standards/wbem. \
-\
-It also provides a Python provider interface, and is the fastest and easiest \
-way to write providers on the planet."
-HOMEPAGE = "http://pywbem.sf.net/"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
-SECTION = "Development/Libraries"
-DEPENDS = "python-m2crypto-native python-typing-native"
-SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BPN}/${BP}/${BP}-dev.r704.zip"
-SRC_URI[md5sum] = "84072451dcdd1aa9ee82363848faf7ad"
-SRC_URI[sha256sum] = "898035866d3cc741bbcd62c4ac26e633ad07b7c11d89db2472b9f923f3fd3ed8"
-
-S = "${WORKDIR}/${BP}-dev"
-
-inherit setuptools python-dir
-
-do_install_append() {
-    mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
-    mv ${D}${bindir}/mof_compiler.py ${D}${bindir}/mofcomp
-
-    rm ${D}${libdir}/python2.7/site-packages/${BPN}/wbemcli.py*
-    rm ${D}${libdir}/python2.7/site-packages/${BPN}/mof_compiler.py*
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb b/meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb
new file mode 100644
index 0000000..7f1986e
--- /dev/null
+++ b/meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Python WBEM Client and Provider Interface"
+DESCRIPTION = "\
+A Python library for making CIM (Common Information Model) operations over \
+HTTP using the WBEM CIM-XML protocol. It is based on the idea that a good \
+WBEM client should be easy to use and not necessarily require a large amount \
+of programming knowledge. It is suitable for a large range of tasks from \
+simply poking around to writing web and GUI applications. \
+\
+WBEM, or Web Based Enterprise Management is a manageability protocol, like \
+SNMP, standardised by the Distributed Management Task Force (DMTF) available \
+at http://www.dmtf.org/standards/wbem. \
+\
+It also provides a Python provider interface, and is the fastest and easiest \
+way to write providers on the planet."
+HOMEPAGE = "http://pywbem.sf.net/"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
+SECTION = "Development/Libraries"
+DEPENDS = "python-m2crypto-native python-typing-native"
+SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BPN}/${BP}/${BP}-dev.r704.zip"
+SRC_URI[md5sum] = "84072451dcdd1aa9ee82363848faf7ad"
+SRC_URI[sha256sum] = "898035866d3cc741bbcd62c4ac26e633ad07b7c11d89db2472b9f923f3fd3ed8"
+
+S = "${WORKDIR}/${BP}-dev"
+
+inherit setuptools python-dir
+
+do_install_append() {
+    mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
+    mv ${D}${bindir}/mof_compiler.py ${D}${bindir}/mofcomp
+
+    rm ${D}${libdir}/python2.7/site-packages/${BPN}/wbemcli.py*
+    rm ${D}${libdir}/python2.7/site-packages/${BPN}/mof_compiler.py*
+}
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.1


