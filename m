Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4A378606C9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 09:27:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,479,1574092800"; d="scan'208";a="83834789"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Feb 2020 17:27:41 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 70186406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 17:17:55 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 24 Feb 2020 17:27:35 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Feb 2020 17:27:29 +0800
Message-ID: <1582536449-89865-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 70186406AB15.A5F6C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems][PATCH] xfsdump: 3.1.8 -> 3.1.9
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
X-List-Received-Date: Mon, 24 Feb 2020 09:27:42 -0000
Content-Type: text/plain

work-with-new-version-of-xfsprogs.patch
is removed because it is included in 3.1.9.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../work-with-new-version-of-xfsprogs.patch   | 28 -------------------
 .../{xfsdump_3.1.8.bb => xfsdump_3.1.9.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfsdump/files/work-with-new-version-of-xfsprogs.patch
 rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.1.8.bb => xfsdump_3.1.9.bb} (87%)

diff --git a/meta-filesystems/recipes-utils/xfsdump/files/work-with-new-version-of-xfsprogs.patch b/meta-filesystems/recipes-utils/xfsdump/files/work-with-new-version-of-xfsprogs.patch
deleted file mode 100644
index 4ce23d717..000000000
--- a/meta-filesystems/recipes-utils/xfsdump/files/work-with-new-version-of-xfsprogs.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Make it work with xfsprogs 5.2.0.
-
-"xfs_fsop_geom_v1_t" has changed to "struct xfs_fsop_geom_v1"
-in xfsprogs since version 5.2.0.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
----
- common/fs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/common/fs.c b/common/fs.c
-index 60cf0fd..2cc7031 100644
---- a/common/fs.c
-+++ b/common/fs.c
-@@ -204,7 +204,7 @@ fs_mounted( char *typs, char *chrs, char *mnts, uuid_t *idp )
- int
- fs_getid( char *mnts, uuid_t *idb )
- {
--	xfs_fsop_geom_v1_t geo;
-+	struct xfs_fsop_geom_v1 geo;
- 	int fd;
- 
- 	fd = open( mnts, O_RDONLY );
--- 
-2.7.4
-
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.9.bb
similarity index 87%
rename from meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.9.bb
index 9c5755862..3e18fba74 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.9.bb
@@ -12,11 +12,10 @@ DEPENDS = "xfsprogs attr"
 
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://remove-install-as-user.patch \
-           file://work-with-new-version-of-xfsprogs.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-xfsdump-support-usrmerge.patch','',d)} \
            "
-SRC_URI[md5sum] = "84d3bc287b4a2bb5d16b2320a47049a7"
-SRC_URI[sha256sum] = "ed14e67ae5b273c2698e767b43a46f033d361e540fe13feaaf9b110ee0edc585"
+SRC_URI[md5sum] = "086f7582875b14c17522867ffe3e202b"
+SRC_URI[sha256sum] = "55aeede6232ddce6c9e79e2af88d6f808534df1552eb2bfaf7fb85b92add6dd1"
 
 inherit autotools-brokensep
 
-- 
2.17.1




