Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1866760FAA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 09:46:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83150273"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Feb 2020 17:36:54 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7E50150A9963
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 17:27:24 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 11 Feb 2020 17:36:53 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 11 Feb 2020 17:37:01 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Feb 2020 09:21:30 -0800
Message-ID: <1581441693-85373-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7E50150A9963.AF050
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems][PATCH] xfsprogs: 5.2.1 -> 5.4.0
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
X-List-Received-Date: Tue, 11 Feb 2020 09:46:45 -0000
Content-Type: text/plain

Update license checksum : GPL-2.0-only and GPL-2.0-or-later are added to Valid-License-Identifier

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xfsprogs/{xfsprogs_5.2.1.bb => xfsprogs_5.4.0.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.2.1.bb => xfsprogs_5.4.0.bb} (91%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.4.0.bb
similarity index 91%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.4.0.bb
index 34b338640..288ec72f9 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://oss.sgi.com/projects/xfs"
 SECTION = "base"
 LICENSE = "GPLv2 & LGPLv2.1"
 LICENSE_libhandle = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038 \
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 DEPENDS = "util-linux util-linux-native"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
@@ -12,8 +12,8 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            file://0001-support-usrmerge.patch \
            "
-SRC_URI[md5sum] = "5ca3f79e76e3fb984a03d1b42a2e60ba"
-SRC_URI[sha256sum] = "7b500e148cebd08f99e37cf744c7843817b37e7be2a32c4dc57d6ea16e3019ae"
+SRC_URI[md5sum] = "61232b1cc453780517d9b0c12ff1699b"
+SRC_URI[sha256sum] = "fa9c3a50bbd9f1619bb42249106f83a22883b79a02de6606ce14afb2f807213f"
 
 inherit autotools-brokensep
 
-- 
2.17.1




