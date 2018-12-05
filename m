Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6EBAC6D2E8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 01:22:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,316,1539619200"; d="scan'208";a="49007634"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2018 09:22:51 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 9FA814B734C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 09:22:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 5 Dec 2018 09:22:57 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Dec 2018 09:24:46 +0800
Message-ID: <20181205012446.28018-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181205012446.28018-1-hongl.fnst@cn.fujitsu.com>
References: <20181205012446.28018-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 9FA814B734C4.AF72B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python][PATCH]python-cryptography:upgrade to 2.4
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

1.Upgrade python-cryptography from 2.3 to 2.4

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cryptography.inc           | 4 ++--
 .../{python-cryptography_2.3.bb => python-cryptography_2.4.1.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_2.3.bb => python-cryptography_2.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index dbbfe2c..0e53d95 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -10,8 +10,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "a0f3f563ab1c5c3bc02fae8d4aa3ad16"
-SRC_URI[sha256sum] = "c132bab45d4bd0fff1d3fe294d92b0a6eb8404e93337b3127bdec9f21de117e6"
+SRC_URI[md5sum] = "464f180ff64622760cca7167f97b3ff4"
+SRC_URI[sha256sum] = "e85b410885addaeb31a867eabcefc9ef4a7e904ad45eac9e60a763a54b244626"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.3.bb b/meta-python/recipes-devtools/python/python-cryptography_2.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_2.3.bb
rename to meta-python/recipes-devtools/python/python-cryptography_2.4.1.bb
-- 
2.7.4




