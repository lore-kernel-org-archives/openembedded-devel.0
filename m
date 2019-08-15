Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6337E506
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 03:21:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,387,1559491200"; d="scan'208";a="73695182"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Aug 2019 11:21:22 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F49A4CE03C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 11:21:21 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 15 Aug 2019 11:21:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Aug 2019 11:20:42 +0800
Message-ID: <20190815032043.25758-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 7F49A4CE03C0.A9449
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems] [PATCH v2 1/2] xfsprogs: upgrade 5.1.0 -> 5.2.0
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
X-List-Received-Date: Thu, 15 Aug 2019 03:21:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-utils/xfsprogs/{xfsprogs_5.1.0.bb => xfsprogs_5.2.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.1.0.bb => xfsprogs_5.2.0.bb} (94%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.1.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.0.bb
similarity index 94%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.1.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.0.bb
index 0130fd2..10d1b70 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.1.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0001-Check-for-MAP_SYNC-in-sys-mman.h.patch \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            "
-SRC_URI[md5sum] = "7199b7aaf088d82fc8a1660ffeb63626"
-SRC_URI[sha256sum] = "ca8b4e73dfc5b6227bb6d4e73d019035a1975b83ea41e218cdff15058a9f6c45"
+SRC_URI[md5sum] = "e38032818aa3b1ef224a69b6184fc12a"
+SRC_URI[sha256sum] = "e41cdaa43d92b38c8a12ce9cb612ab911ba0e019c2e0762c494a8a601f533fd6"
 
 inherit autotools-brokensep
 
-- 
2.7.4




