Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6C0B748A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 06:00:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q60GgM013315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 23:00:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 23:00:15 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:57 +0800
Message-ID: <1529992863-24711-14-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 14/20] python(3)-lxml: upgrade 4.2.1 -> 4.2.2
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
X-List-Received-Date: Tue, 26 Jun 2018 06:00:15 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_4.2.1.bb => python-lxml_4.2.2.bb}             | 0
 .../python/{python3-lxml_4.2.1.bb => python3-lxml_4.2.2.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.2.1.bb => python-lxml_4.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.2.1.bb => python3-lxml_4.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 3f3a1e27c..51a98f6bb 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "c266d9062e23b08f66426979a2b36f51"
-SRC_URI[sha256sum] = "e2629cdbcad82b83922a3488937632a4983ecc0fed3e5cfbf430d069382eeb9b"
+SRC_URI[md5sum] = "0aa7db9dd54ed5b0c5611cef0ba490c5"
+SRC_URI[sha256sum] = "82f278cd24da1b8a98df89de38946d67381a00e39adef768fd302dc8f4e1c383"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.2.1.bb b/meta-python/recipes-devtools/python/python-lxml_4.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.2.1.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.2.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.2.2.bb
-- 
2.11.0


