Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 86A0C78284
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:44:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6K7iogZ018684
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jul 2017 00:44:50 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Jul 2017 00:44:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Jul 2017 03:44:35 -0400
Message-ID: <f6ce74eee3aa86e46a4471a1b680183ca44ada5b.1500536448.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500536448.git.hongxu.jia@windriver.com>
References: <cover.1500536448.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 8/8] xmlrpc-c: add recipe 1.31.0
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
X-List-Received-Date: Thu, 20 Jul 2017 07:44:49 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
new file mode 100644
index 0000000..fc257e0
--- /dev/null
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "XML-RPC for C/C++ is programming libraries and related tools to help you \
+write an XML-RPC server or client in C or C++."
+
+HOMEPAGE = "http://xmlrpc-c.sourceforge.net/"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
+
+SRC_URI = "git://github.com/ensc/xmlrpc-c.git;branch=master \
+"
+SRCREV = "81443a9dc234cc275449dbc17867ad77ae189124"
+S = "${WORKDIR}/git"
+
+DEPENDS = "curl libxml2"
+RDEPENDS_${PN} = "curl"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-D_lib:STRING=${baselib}"
+
+BBCLASSEXTEND = "native"
+
+TARGET_CFLAGS += "-Wno-narrowing"
-- 
2.8.1


