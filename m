Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C69D7E506
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 03:21:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,387,1559491200"; d="scan'208";a="73695181"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Aug 2019 11:21:22 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id F0E314CE0337
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 11:21:21 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 15 Aug 2019 11:21:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Aug 2019 11:20:43 +0800
Message-ID: <20190815032043.25758-2-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815032043.25758-1-zangrc.fnst@cn.fujitsu.com>
References: <20190815032043.25758-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: F0E314CE0337.A814F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems] [PATCH v2 2/2] xfsdump: fix error to work with xfsprogs 5.2.0
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
X-List-Received-Date: Thu, 15 Aug 2019 03:21:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Make it work with xfsprogs 5.2.0.

"xfs_fsop_geom_v1_t" has changed to "struct xfs_fsop_geom_v1"
in xfsprogs since version 5.2.0.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../files/work-with-new-version-of-xfsprogs.patch  | 28 ++++++++++++++++++++++
 .../recipes-utils/xfsdump/xfsdump_3.1.8.bb         |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/work-with-new-version-of-xfsprogs.patch

diff --git a/meta-filesystems/recipes-utils/xfsdump/files/work-with-new-version-of-xfsprogs.patch b/meta-filesystems/recipes-utils/xfsdump/files/work-with-new-version-of-xfsprogs.patch
new file mode 100644
index 0000000..4ce23d7
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/files/work-with-new-version-of-xfsprogs.patch
@@ -0,0 +1,28 @@
+Make it work with xfsprogs 5.2.0.
+
+"xfs_fsop_geom_v1_t" has changed to "struct xfs_fsop_geom_v1"
+in xfsprogs since version 5.2.0.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
+---
+ common/fs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common/fs.c b/common/fs.c
+index 60cf0fd..2cc7031 100644
+--- a/common/fs.c
++++ b/common/fs.c
+@@ -204,7 +204,7 @@ fs_mounted( char *typs, char *chrs, char *mnts, uuid_t *idp )
+ int
+ fs_getid( char *mnts, uuid_t *idb )
+ {
+-	xfs_fsop_geom_v1_t geo;
++	struct xfs_fsop_geom_v1 geo;
+ 	int fd;
+ 
+ 	fd = open( mnts, O_RDONLY );
+-- 
+2.7.4
+
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
index 54ab30c..0421aa0 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
@@ -12,6 +12,7 @@ DEPENDS = "xfsprogs attr"
 
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://remove-install-as-user.patch \
+           file://work-with-new-version-of-xfsprogs.patch \
            "
 SRC_URI[md5sum] = "84d3bc287b4a2bb5d16b2320a47049a7"
 SRC_URI[sha256sum] = "ed14e67ae5b273c2698e767b43a46f033d361e540fe13feaaf9b110ee0edc585"
-- 
2.7.4




