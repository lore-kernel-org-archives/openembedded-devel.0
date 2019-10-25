Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4459F7FA95
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 12:19:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,228,1569254400"; d="scan'208";a="77477576"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 20:19:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D785E4CE1510
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 20:11:09 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 25 Oct 2019 20:19:03 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 Oct 2019 04:13:26 +0800
Message-ID: <1572034406-73695-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D785E4CE1510.A6721
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems][PATCH] fuse3: upgrade 3.6.2 -> 3.7.0
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
X-List-Received-Date: Fri, 25 Oct 2019 12:19:03 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.6.2.bb => fuse3_3.7.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.6.2.bb => fuse3_3.7.0.bb} (91%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.6.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.7.0.bb
similarity index 91%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.6.2.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.7.0.bb
index e65eb08..f0cbf12 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.6.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.7.0.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "1798945aa69434286723b9999a141c7a"
-SRC_URI[sha256sum] = "f45869427575e1e59ab743a67deb57addbf2cb8f9ce431199dbd40ddab71f281"
+SRC_URI[md5sum] = "b9e6558aa25f66c0f1a95d1c7455b944"
+SRC_URI[sha256sum] = "3aea4766da5e2751aba82e8f77047d5d3c412bc3c298e4ec9532e59d7bd73a7a"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.7.4




