Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC027E736
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 05:58:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,363,1557158400"; d="scan'208";a="67037349"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2019 13:58:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 151234CD846F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 13:58:06 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Jun 2019 13:58:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Jun 2019 13:59:20 +0800
Message-ID: <20190612055920.15745-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 151234CD846F.AA544
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-requests: upgrade 2.21.0 -> 2.22.0
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
X-List-Received-Date: Wed, 12 Jun 2019 05:58:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-requests_2.21.0.bb to python-requests_2.22.0.bb.

-Upgrade from python3-requests_2.21.0.bb to python3-requests_2.22.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-requests.inc       | 4 ++--
 .../{python-requests_2.21.0.bb => python-requests_2.22.0.bb}  | 0
 ...{python3-requests_2.21.0.bb => python3-requests_2.22.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.21.0.bb => python-requests_2.22.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-requests_2.21.0.bb => python3-requests_2.22.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index 53504d0b3..5fe5dc21f 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a8d5a1d1c2d53025e2282c511033f6f7"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
 
-SRC_URI[md5sum] = "1bcd0e0977c3f8db1848ba0e2b7ab904"
-SRC_URI[sha256sum] = "502a824f31acdacb3a35b6690b5fbf0bc41d63a24a45c4004352b0242707598e"
+SRC_URI[md5sum] = "ee28bee2de76e9198fc41e48f3a7dd47"
+SRC_URI[sha256sum] = "11e007a8a2aa0323f5a921e9e6a2d7e4e67d9877e85773fba9ba6419025cbeb4"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-requests_2.21.0.bb b/meta-python/recipes-devtools/python/python-requests_2.22.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests_2.21.0.bb
rename to meta-python/recipes-devtools/python/python-requests_2.22.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.21.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.22.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-requests_2.21.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.22.0.bb
-- 
2.20.1




