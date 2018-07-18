Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 760C578982
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 03:45:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6I3jwGR029795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 20:45:58 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 17 Jul 2018 20:45:57 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jul 2018 20:45:57 -0700
Message-ID: <20180718034557.81715-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] python-py.inc: add ${PYTHON_PN}-setuptools-scm-native to DEPENDS
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
X-List-Received-Date: Wed, 18 Jul 2018 03:45:57 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Add ${PYTHON_PN}-setuptools-scm-native to DEPENDS to avoid
download during do_compile

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-python/recipes-devtools/python/python-py.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
index 495becfc1..3480cb5bb 100644
--- a/meta-python/recipes-devtools/python/python-py.inc
+++ b/meta-python/recipes-devtools/python/python-py.inc
@@ -6,4 +6,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 SRC_URI[md5sum] = "7502d66fa68ea4ae5b61c511cd177d6a"
 SRC_URI[sha256sum] = "3fd59af7435864e1a243790d322d763925431213b6b8529c6ca71081ace3bbf7"
 
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


