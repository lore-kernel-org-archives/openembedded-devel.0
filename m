Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 385A875A60
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 03:44:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105176"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:47:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3gR5u018022
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:42:27 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:44:18 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:44:14 +0800
Message-ID: <1438314254-16633-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH] cryptsetup: upgrade 1.6.6->1.6.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jul 2015 03:44:20 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../cryptsetup/{cryptsetup_1.6.6.bb => cryptsetup_1.6.7.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.6.6.bb => cryptsetup_1.6.7.bb} (89%)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb
similarity index 89%
rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb
rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb
index d84ad2f..939ee35 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 DEPENDS = "util-linux lvm2 popt libgcrypt"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.6/${BP}.tar.xz"
-SRC_URI[md5sum] = "179c0781de59838a4e39f61b2df5ea48"
-SRC_URI[sha256sum] = "2d2ce28e4e1137dd599d87884b62ef6dbf14fd7848b2a2bf7d61cf125fbd8e6f"
+SRC_URI[md5sum] = "918406eb5d2e2f5a7348c432ea9b1473"
+SRC_URI[sha256sum] = "c23c24c8d662032da8650c1c84985221be8bbedf4737c1540bba7e4517dfe820"
 
 inherit autotools gettext pkgconfig
 
-- 
1.8.4.2


