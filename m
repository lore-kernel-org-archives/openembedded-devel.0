Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9958E7F9BD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 13:01:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,247,1569254400"; d="scan'208";a="77687959"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Oct 2019 21:01:20 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 30F1B4CE1514
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 20:53:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 30 Oct 2019 21:01:19 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 04:55:39 +0800
Message-ID: <1572468939-36684-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 30F1B4CE1514.A35C2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] nbd: upgrade 3.19 -> 3.20
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
X-List-Received-Date: Wed, 30 Oct 2019 13:01:22 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-support/nbd/{nbd_3.19.bb => nbd_3.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nbd/{nbd_3.19.bb => nbd_3.20.bb} (78%)

diff --git a/meta-networking/recipes-support/nbd/nbd_3.19.bb b/meta-networking/recipes-support/nbd/nbd_3.20.bb
similarity index 78%
rename from meta-networking/recipes-support/nbd/nbd_3.19.bb
rename to meta-networking/recipes-support/nbd/nbd_3.20.bb
index a6da18e..12a82c2 100644
--- a/meta-networking/recipes-support/nbd/nbd_3.19.bb
+++ b/meta-networking/recipes-support/nbd/nbd_3.20.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "162da84302abb5b9be06143c7943a642"
-SRC_URI[sha256sum] = "b4466412f13e057659f25d35e1e8e181afd62c7179bff22a6add81445ecb8690"
+SRC_URI[md5sum] = "910fe6c152f8c30ad8608388e6a4ce89"
+SRC_URI[sha256sum] = "e0e1b3538ab7ae5accf56180afd1a9887d415b98d21223b8ad42592b4af7d6cd"
 
 inherit autotools pkgconfig
 
-- 
2.7.4




