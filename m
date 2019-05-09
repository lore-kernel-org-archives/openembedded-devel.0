Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 24C567DFA9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 06:22:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,448,1549900800"; d="scan'208";a="62221688"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 May 2019 14:22:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5AC9E4CDB2FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 14:22:40 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 9 May 2019 14:22:44 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 May 2019 14:23:37 +0800
Message-ID: <20190509062337.4126-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 5AC9E4CDB2FD.AAA9D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pbr: upgrade 5.1.3 -> 5.2.0
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
X-List-Received-Date: Thu, 09 May 2019 06:22:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pbr_5.1.3.bb to python-pbr_5.2.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pbr_5.1.3.bb => python-pbr_5.2.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_5.1.3.bb => python-pbr_5.2.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_5.1.3.bb b/meta-python/recipes-devtools/python/python-pbr_5.2.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-pbr_5.1.3.bb
rename to meta-python/recipes-devtools/python/python-pbr_5.2.0.bb
index 0dbc21cce..a42388797 100644
--- a/meta-python/recipes-devtools/python/python-pbr_5.1.3.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_5.2.0.bb
@@ -2,8 +2,8 @@ inherit setuptools
 # The inc file is in oe-core
 require recipes-devtools/python/python-pbr.inc
 
-SRC_URI[md5sum] = "08972dca5fd2a959f27842090973edd6"
-SRC_URI[sha256sum] = "8c361cc353d988e4f5b998555c88098b9d5964c2e11acf7b0d21925a66bb5824"
+SRC_URI[md5sum] = "2bca008fd08d035a2f78c606d876a6db"
+SRC_URI[sha256sum] = "d950c64aeea5456bbd147468382a5bb77fe692c13c9f00f0219814ce5b642755"
 
 do_install_append() {
         if [ -f ${D}${bindir}/pbr ]; then
-- 
2.20.1




