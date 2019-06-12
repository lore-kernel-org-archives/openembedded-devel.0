Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 11D497E724
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 03:40:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,363,1557158400"; d="scan'208";a="67020946"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2019 11:40:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C04374CDD0CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 11:40:28 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Jun 2019 11:40:26 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Jun 2019 11:41:42 +0800
Message-ID: <20190612034142.14940-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: C04374CDD0CA.A8232
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cryptography-vectors: upgrade 2.6.1 -> 2.7
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
X-List-Received-Date: Wed, 12 Jun 2019 03:40:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-cryptography-vectors_2.6.1.bb to python-cryptography-vectors_2.7.bb.

-Upgrade from python3-cryptography-vectors_2.6.1.bb to python3-cryptography-vectors_2.7.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...hy-vectors_2.6.1.bb => python-cryptography-vectors_2.7.bb} | 0
 ...y-vectors_2.6.1.bb => python3-cryptography-vectors_2.7.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.6.1.bb => python-cryptography-vectors_2.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.6.1.bb => python3-cryptography-vectors_2.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 0d9638845..887d2d3d3 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -8,8 +8,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "f8b166652e7a9d668b851b28e4417057"
-SRC_URI[sha256sum] = "03f38115dccb266dd96538f94067442a877932c2322661bdc5bf2502c76658af"
+SRC_URI[md5sum] = "1a518a28ed9c924ca6c570aa8ea0c334"
+SRC_URI[sha256sum] = "f12dfb9bd669a68004074cb5b26df6e93ed1a95ebd1a999dff0a840212ff68bc"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.6.1.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.6.1.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.6.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.7.bb
-- 
2.20.1




