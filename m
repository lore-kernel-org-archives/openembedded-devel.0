Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 93F21747E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:59:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q5xXl3013300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:59:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:59:32 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:54 +0800
Message-ID: <1529992863-24711-11-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 11/20] python(3)-urllib3: upgrade 1.22 -> 1.23
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
X-List-Received-Date: Tue, 26 Jun 2018 05:59:32 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-urllib3.inc                | 4 ++--
 .../python/{python-urllib3_1.22.bb => python-urllib3_1.23.bb}         | 0
 .../python/{python3-urllib3_1.22.bb => python3-urllib3_1.23.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.22.bb => python-urllib3_1.23.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.22.bb => python3-urllib3_1.23.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index cf79926a6..288ed8b98 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
 
-SRC_URI[md5sum] = "0da7bed3fe94bf7dc59ae37885cc72f7"
-SRC_URI[sha256sum] = "cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f"
+SRC_URI[md5sum] = "1ad43e4b5ab7a0794c89dc057e1d7179"
+SRC_URI[sha256sum] = "a68ac5e15e76e7e5dd2b8f94007233e01effe3e50e8daddf69acfd81cb686baf"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.22.bb b/meta-python/recipes-devtools/python/python-urllib3_1.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.22.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.23.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.22.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.22.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.23.bb
-- 
2.11.0


