Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E95C7CFE3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 08:07:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,280,1571673600"; d="scan'208";a="79631581"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2019 16:07:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B5DB64CE1BEB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:59:20 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Dec 2019 16:07:50 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Dec 2019 06:25:09 -0800
Message-ID: <1575555909-31614-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: B5DB64CE1BEB.AAD11
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems][PATCH] xfsprogs: 5.2.1 -> 5.3.0
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
X-List-Received-Date: Thu, 05 Dec 2019 08:07:53 -0000
Content-Type: text/plain

spdx information is added in GPL-2.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-utils/xfsprogs/{xfsprogs_5.2.1.bb => xfsprogs_5.3.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.2.1.bb => xfsprogs_5.3.0.bb} (91%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.3.0.bb
similarity index 91%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.3.0.bb
index 5ab1d02..9a4b6b8 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://oss.sgi.com/projects/xfs"
 SECTION = "base"
 LICENSE = "GPLv2 & LGPLv2.1"
 LICENSE_libhandle = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038 \
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 DEPENDS = "util-linux util-linux-native"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
@@ -13,8 +13,8 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            file://0001-support-usrmerge.patch \
            "
-SRC_URI[md5sum] = "5ca3f79e76e3fb984a03d1b42a2e60ba"
-SRC_URI[sha256sum] = "7b500e148cebd08f99e37cf744c7843817b37e7be2a32c4dc57d6ea16e3019ae"
+SRC_URI[md5sum] = "ff4a505a9ff6e952399337cf3d2cc883"
+SRC_URI[sha256sum] = "b29a64d04ad81f1f121d4683deae0bbb928abd1c891fe766b2c4bcdf61ab09c1"
 
 inherit autotools-brokensep
 
-- 
2.7.4




