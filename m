Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 56BDF7E45D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 02:09:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,414,1559491200"; d="scan'208";a="74037249"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Aug 2019 10:09:36 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 334F14CE03E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 10:09:33 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 22 Aug 2019 10:09:38 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Aug 2019 11:08:56 +0900
Message-ID: <20190822020856.117363-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 334F14CE03E7.AFC53
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems] [PATCH] xfsprogs: upgrade 5.2.0 -> 5.2.1
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
X-List-Received-Date: Thu, 22 Aug 2019 02:09:37 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../xfsprogs/{xfsprogs_5.2.0.bb => xfsprogs_5.2.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.2.0.bb => xfsprogs_5.2.1.bb} (94%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
similarity index 94%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
index 10d1b70d5..bed80a615 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0001-Check-for-MAP_SYNC-in-sys-mman.h.patch \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            "
-SRC_URI[md5sum] = "e38032818aa3b1ef224a69b6184fc12a"
-SRC_URI[sha256sum] = "e41cdaa43d92b38c8a12ce9cb612ab911ba0e019c2e0762c494a8a601f533fd6"
+SRC_URI[md5sum] = "5ca3f79e76e3fb984a03d1b42a2e60ba"
+SRC_URI[sha256sum] = "7b500e148cebd08f99e37cf744c7843817b37e7be2a32c4dc57d6ea16e3019ae"
 
 inherit autotools-brokensep
 
-- 
2.17.1




