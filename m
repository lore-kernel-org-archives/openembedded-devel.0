Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A4C147EF64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 01:03:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,292,1559491200"; d="scan'208";a="71914895"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jul 2019 09:03:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 086F54CDBF7D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 09:03:13 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 22 Jul 2019 09:03:28 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Jul 2019 09:02:28 +0800
Message-ID: <20190722010228.21648-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 086F54CDBF7D.AEEB7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pbr: upgrade 5.4.0 -> 5.4.1
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
X-List-Received-Date: Mon, 22 Jul 2019 01:03:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pbr_5.4.0.bb => python-pbr_5.4.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_5.4.0.bb => python-pbr_5.4.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_5.4.0.bb b/meta-python/recipes-devtools/python/python-pbr_5.4.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-pbr_5.4.0.bb
rename to meta-python/recipes-devtools/python/python-pbr_5.4.1.bb
index 50eb239..b980933 100644
--- a/meta-python/recipes-devtools/python/python-pbr_5.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_5.4.1.bb
@@ -2,8 +2,8 @@ inherit setuptools
 # The inc file is in oe-core
 require recipes-devtools/python/python-pbr.inc
 
-SRC_URI[md5sum] = "fcf120102d3e4859d41425638122058c"
-SRC_URI[sha256sum] = "36ebd78196e8c9588c972f5571230a059ff83783fabbbbedecc07be263ccd7e6"
+SRC_URI[md5sum] = "ab6e26026ab306989a636ec2d50a435a"
+SRC_URI[sha256sum] = "0ca44dc9fd3b04a22297c2a91082d8df2894862e8f4c86a49dac69eae9e85ca0"
 
 do_install_append() {
         if [ -f ${D}${bindir}/pbr ]; then
-- 
2.7.4




