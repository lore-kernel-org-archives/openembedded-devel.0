Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A38A26C44B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 01:22:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,316,1539619200"; d="scan'208";a="49007633"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2018 09:22:51 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 16D164B734C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 09:22:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 5 Dec 2018 09:22:56 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Dec 2018 09:24:45 +0800
Message-ID: <20181205012446.28018-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 16D164B734C4.ADEF6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python][PATCH] python-cryptography-vectors:upgrade to 2.4.1
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
X-List-Received-Date: Wed, 05 Dec 2018 01:22:51 -0000
Content-Type: text/plain

1.Upgrade python-cryptography-vectors from 2.3 to 2.4.1

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...yptography-vectors_2.3.bb => python-cryptography-vectors_2.4.1.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.3.bb => python-cryptography-vectors_2.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index d1e254b..04173f0 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -8,8 +8,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "294d44f32885a6b97d5f9cdd7ffc73a3"
-SRC_URI[sha256sum] = "356a2ded84ae379e556515eec9b68dd74957651a38465d10605bb9fbae280f15"
+SRC_URI[md5sum] = "e7f44b1678e3071e2044a32f7c353d14"
+SRC_URI[sha256sum] = "829d43e8066056de8ea7b8ad311db79e47d8d658e23d5f5fc4b0245a1b3baa74"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.4.1.bb
-- 
2.7.4




