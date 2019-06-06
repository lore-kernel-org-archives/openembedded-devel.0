Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 281376079F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 03:35:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,557,1549900800"; d="scan'208";a="66169753"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 11:35:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 61F164CDCEA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 11:35:02 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019 11:35:08 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 6 Jun 2019 11:36:11 +0800
Message-ID: <20190606033611.11531-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 61F164CDCEA5.A8D93
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pbr: upgrade 5.2.0 -> 5.2.1
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
X-List-Received-Date: Thu, 06 Jun 2019 03:35:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pbr_5.2.0.bb to python-pbr_5.2.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pbr_5.2.0.bb => python-pbr_5.2.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_5.2.0.bb => python-pbr_5.2.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_5.2.0.bb b/meta-python/recipes-devtools/python/python-pbr_5.2.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-pbr_5.2.0.bb
rename to meta-python/recipes-devtools/python/python-pbr_5.2.1.bb
index a42388797..ccc75de8d 100644
--- a/meta-python/recipes-devtools/python/python-pbr_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_5.2.1.bb
@@ -2,8 +2,8 @@ inherit setuptools
 # The inc file is in oe-core
 require recipes-devtools/python/python-pbr.inc
 
-SRC_URI[md5sum] = "2bca008fd08d035a2f78c606d876a6db"
-SRC_URI[sha256sum] = "d950c64aeea5456bbd147468382a5bb77fe692c13c9f00f0219814ce5b642755"
+SRC_URI[md5sum] = "f72c2dd10602abad3695097d634e94bb"
+SRC_URI[sha256sum] = "93d2dc6ee0c9af4dbc70bc1251d0e545a9910ca8863774761f92716dece400b6"
 
 do_install_append() {
         if [ -f ${D}${bindir}/pbr ]; then
-- 
2.20.1




