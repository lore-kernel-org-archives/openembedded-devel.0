Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id F04146C3B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 03:18:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,363,1557158400"; d="scan'208";a="67018017"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2019 11:18:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B10C24CDD988
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 11:18:21 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Jun 2019 11:18:18 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Jun 2019 11:19:35 +0800
Message-ID: <20190612031935.10558-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: B10C24CDD988.A7325
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cryptography: upgrade 2.6.1 -> 2.7
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
X-List-Received-Date: Wed, 12 Jun 2019 03:18:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-cryptography_2.6.1.bb to python-cryptography_2.7.bb.

-Upgrade from python3-cryptography_2.6.1.bb to python3-cryptography_2.7.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cryptography.inc   | 4 ++--
 ...ython-cryptography_2.6.1.bb => python-cryptography_2.7.bb} | 0
 ...hon3-cryptography_2.6.1.bb => python3-cryptography_2.7.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_2.6.1.bb => python-cryptography_2.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_2.6.1.bb => python3-cryptography_2.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 6c43e863d..876fcc273 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -12,8 +12,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "401cc8268f89496643da3f7a48eb4e8e"
-SRC_URI[sha256sum] = "26c821cbeb683facb966045e2064303029d572a87ee69ca5a1bf54bf55f93ca6"
+SRC_URI[md5sum] = "7dfe1035cae43569e571318f000462a4"
+SRC_URI[sha256sum] = "e6347742ac8f35ded4a46ff835c60e68c22a536a8ae5c4422966d06946b6d4c6"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.6.1.bb b/meta-python/recipes-devtools/python/python-cryptography_2.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_2.6.1.bb
rename to meta-python/recipes-devtools/python/python-cryptography_2.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.6.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_2.7.bb
-- 
2.20.1




