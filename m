Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5047F3D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 02:05:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="74258789"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2019 10:05:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6F83F4CE0455
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 10:05:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 10:05:45 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Aug 2019 11:05:23 +0900
Message-ID: <20190826020523.17174-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 6F83F4CE0455.AFCFF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] libtdb: upgrade 1.4.1 -> 1.4.2
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
X-List-Received-Date: Mon, 26 Aug 2019 02:05:42 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../libtdb/{libtdb_1.4.1.bb => libtdb_1.4.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.1.bb => libtdb_1.4.2.bb} (93%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.1.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.2.bb
similarity index 93%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.1.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.2.bb
index d25c3fa65..4973e80ca 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.1.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.2.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://0001-waf-add-support-of-cross_compile.patch \
 "
 
-SRC_URI[md5sum] = "d1d0a5d43614add17d1e41bbdb209446"
-SRC_URI[sha256sum] = "dd4ecd9678e8d3ea772623bd81fe49b43363a2f970a76fb5468322753787aa4b"
+SRC_URI[md5sum] = "b2c05ad68334368d3258a63db709f254"
+SRC_URI[sha256sum] = "9040b2cce4028e392f063f91bbe76b8b28fecc2b7c0c6071c67b5eb3168e004a"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.17.1




