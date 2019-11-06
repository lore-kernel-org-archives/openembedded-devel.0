Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 259B47F977
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 08:32:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,274,1569254400"; d="scan'208";a="77943229"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Nov 2019 16:32:33 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id AEB474B6EC73
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 16:24:27 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 6 Nov 2019 16:32:31 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Nov 2019 20:12:17 +0800
Message-ID: <1573042337-43447-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: AEB474B6EC73.A9676
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libssh2: upgrade 1.8.2 -> 1.9.0
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
X-List-Received-Date: Wed, 06 Nov 2019 08:32:33 -0000
Content-Type: text/plain

1) Upgrade libssh2 from 1.8.2 to 1.9.0.

2) Modify PACKAGECONFIG for configure options have been changed in new version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libssh2/{libssh2_1.8.2.bb => libssh2_1.9.0.bb}                | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/libssh2/{libssh2_1.8.2.bb => libssh2_1.9.0.bb} (59%)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
similarity index 59%
rename from meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
rename to meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
index 6428958..25e0af3 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "616efd99af3d9ef731a26bed6cee9593"
-SRC_URI[sha256sum] = "088307d9f6b6c4b8c13f34602e8ff65d21c2dc4d55284dfe15d502c4ee190d67"
+SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
+SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
 
 inherit autotools pkgconfig
 
@@ -21,7 +21,7 @@ EXTRA_OECONF += "\
 
 # only one of openssl and gcrypt could be set
 PACKAGECONFIG ??= "openssl"
-PACKAGECONFIG[openssl] = "--with-openssl --with-libssl-prefix=${STAGING_LIBDIR},--without-openssl,openssl"
-PACKAGECONFIG[gcrypt] = "--with-libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR},--without-libgcrypt,libgcrypt"
+PACKAGECONFIG[openssl] = "--with-crypto=openssl --with-libssl-prefix=${STAGING_LIBDIR}, , openssl"
+PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR}, , libgcrypt"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4




