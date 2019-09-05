Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E4FFB7D39B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 05:48:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74874183"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 13:48:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6C6694CDE64D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 13:48:26 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 13:48:29 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Sep 2019 14:48:04 +0900
Message-ID: <20190905054804.40481-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 6C6694CDE64D.A0D61
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] libtalloc: upgrade 2.2.0 -> 2.3.0
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
X-List-Received-Date: Thu, 05 Sep 2019 05:48:40 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../libtalloc/{libtalloc_2.2.0.bb => libtalloc_2.3.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.2.0.bb => libtalloc_2.3.0.bb} (93%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.2.0.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb
similarity index 93%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.2.0.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb
index 88cdd30d0..9f8ebcc41 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.2.0.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://options-2.2.0.patch \
            file://0001-waf-add-support-of-cross_compile.patch \
 "
-SRC_URI[md5sum] = "b60781acc2fb42d7a1e08751e508d3df"
-SRC_URI[sha256sum] = "5c6f6a45ef96b3fd0b28942673a68d0c6af5dcca9d676a2e4d57ce7e86c22ebc"
+SRC_URI[md5sum] = "8416b153547add81cd1a4d24e598c890"
+SRC_URI[sha256sum] = "75d5bcb34482545a82ffb06da8f6c797f963a0da450d0830c669267b14992fc6"
 
 inherit waf-samba
 
-- 
2.17.1




