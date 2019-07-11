Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4E0CF7F0A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 07:52:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,476,1557158400"; d="scan'208";a="71168468"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Jul 2019 15:52:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D26F24CDDD5A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 15:52:01 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 11 Jul 2019 15:52:03 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jul 2019 15:51:15 +0800
Message-ID: <20190711075115.5698-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: D26F24CDDD5A.A8CFE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pbr: upgrade 5.2.1 -> 5.4.0
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
X-List-Received-Date: Thu, 11 Jul 2019 07:52:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pbr_5.2.1.bb to python-pbr_5.4.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pbr_5.2.1.bb => python-pbr_5.4.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_5.2.1.bb => python-pbr_5.4.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_5.2.1.bb b/meta-python/recipes-devtools/python/python-pbr_5.4.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-pbr_5.2.1.bb
rename to meta-python/recipes-devtools/python/python-pbr_5.4.0.bb
index ccc75de..50eb239 100644
--- a/meta-python/recipes-devtools/python/python-pbr_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_5.4.0.bb
@@ -2,8 +2,8 @@ inherit setuptools
 # The inc file is in oe-core
 require recipes-devtools/python/python-pbr.inc
 
-SRC_URI[md5sum] = "f72c2dd10602abad3695097d634e94bb"
-SRC_URI[sha256sum] = "93d2dc6ee0c9af4dbc70bc1251d0e545a9910ca8863774761f92716dece400b6"
+SRC_URI[md5sum] = "fcf120102d3e4859d41425638122058c"
+SRC_URI[sha256sum] = "36ebd78196e8c9588c972f5571230a059ff83783fabbbbedecc07be263ccd7e6"
 
 do_install_append() {
         if [ -f ${D}${bindir}/pbr ]; then
-- 
2.7.4




