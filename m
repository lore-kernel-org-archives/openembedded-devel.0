Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 155AA77E1F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 04:56:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18264933"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Apr 2017 12:56:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2E2D547E98A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 12:56:41 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 28 Apr 2017 12:56:42 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Apr 2017 12:56:21 +0800
Message-ID: <1493355381-33865-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 2E2D547E98A8.A7432
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] cryptsetup: 1.7.2 -> 1.7.4
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
X-List-Received-Date: Fri, 28 Apr 2017 04:56:42 -0000
Content-Type: text/plain

Upgrade cryptsetup from 1.7.2 to 1.7.4.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../cryptsetup/{cryptsetup_1.7.2.bb => cryptsetup_1.7.4.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.7.2.bb => cryptsetup_1.7.4.bb} (90%)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.4.bb
similarity index 90%
rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.4.bb
index 9075127..c13b764 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.4.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 DEPENDS = "util-linux libdevmapper popt libgcrypt"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.7/${BP}.tar.xz"
-SRC_URI[md5sum] = "a11a140cea496961222170944db01fc1"
-SRC_URI[sha256sum] = "dbb35dbf5f0c1749168c86c913fe98e872247bfc8425314b494c2423e7e43342"
+SRC_URI[md5sum] = "058ed35c5b776032c2a036838f9e22a7"
+SRC_URI[sha256sum] = "7ccf893ef79a38fb92d61f03c17b964982119f5319cdaa85a1335b8558cca016"
 
 inherit autotools gettext pkgconfig
 
-- 
2.7.4




