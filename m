Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EBBA606B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 02:34:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xAL2YgB7015189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 18:34:42 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 20 Nov 2019 18:34:41 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Nov 2019 10:34:40 +0800
Message-ID: <20191121023440.36149-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-jsonschemea: add missing dependency
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
X-List-Received-Date: Thu, 21 Nov 2019 02:34:41 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-jsonschema.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index 1841b5893..5599cc6f4 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -23,6 +23,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-strict-rfc3339 \
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-setuptools-scm \
+    ${PYTHON_PN}-zipp \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


