Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 23B617F7DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 12:18:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,228,1569254400"; d="scan'208";a="77477544"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 20:18:03 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id B46264CE1507
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 20:10:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 25 Oct 2019 20:18:04 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 Oct 2019 04:12:19 +0800
Message-ID: <1572034339-73575-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: B46264CE1507.A4C9A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems][PATCH] simple-mtpfs: upgrade to 0.3.0.
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
X-List-Received-Date: Fri, 25 Oct 2019 12:18:05 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_git.bb b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_git.bb
index f85977f..595b349 100644
--- a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_git.bb
@@ -7,7 +7,8 @@ DEPENDS = "fuse libmtp"
 
 inherit autotools pkgconfig
 
+# 0.3.0
 SRC_URI = "git://github.com/phatina/simple-mtpfs.git;protocol=https;branch=master"
-SRCREV = "a7ab64c7e4d7aca155cbc7ce9412aaf68ef6e404"
+SRCREV = "c9a691fc52fafaa55d26ac629856153c0514015a"
 
 S = "${WORKDIR}/git"
-- 
2.7.4




