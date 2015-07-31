Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 11A8B76531
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 02:47:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99103034"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 10:51:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V2jxxX014005
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:45:59 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 10:47:50 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 10:47:37 +0800
Message-ID: <1438310864-15716-2-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438310864-15716-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1438310864-15716-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH v3 1/8] pywbem:add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jul 2015 02:47:54 -0000
Content-Type: text/plain

pywbem is dependence of openlmi.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb

diff --git a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
new file mode 100644
index 0000000..2f9a5bd
--- /dev/null
+++ b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
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
+DEPENDS = "python-m2crypto-native"
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
1.8.4.2


