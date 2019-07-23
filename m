Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 09B617F01D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 03:17:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,297,1559491200"; d="scan'208";a="71997828"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2019 11:17:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CFD2B4CDDD5C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 11:17:37 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 23 Jul 2019 11:17:37 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Jul 2019 11:16:53 +0800
Message-ID: <20190723031653.10822-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: CFD2B4CDDD5C.AE0C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems] [PATCH] xfsprogs: upgrade 5.0.0 -> 5.1.0
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
X-List-Received-Date: Tue, 23 Jul 2019 03:17:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-utils/xfsprogs/{xfsprogs_5.0.0.bb => xfsprogs_5.1.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.0.0.bb => xfsprogs_5.1.0.bb} (94%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.0.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.1.0.bb
similarity index 94%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.0.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.1.0.bb
index 188c566..0130fd2 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.0.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.1.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0001-Check-for-MAP_SYNC-in-sys-mman.h.patch \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            "
-SRC_URI[md5sum] = "b6acc4aa93a952595fc8f2e7447be6f2"
-SRC_URI[sha256sum] = "fcc2e6478aed55408a341567c0459f514e575296d8827d9004cae8aa0367dc4a"
+SRC_URI[md5sum] = "7199b7aaf088d82fc8a1660ffeb63626"
+SRC_URI[sha256sum] = "ca8b4e73dfc5b6227bb6d4e73d019035a1975b83ea41e218cdff15058a9f6c45"
 
 inherit autotools-brokensep
 
-- 
2.7.4




