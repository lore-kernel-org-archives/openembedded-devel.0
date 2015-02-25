Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C54CB71F1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 07:00:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="58194896"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Feb 2015 14:57:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1P6X52T008951
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 14:33:12 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 25 Feb 2015 14:33:58 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Feb 2015 14:28:32 +0800
Message-ID: <1424845712-34105-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH] xbitmaps: fix build warning.
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
X-List-Received-Date: Wed, 25 Feb 2015 07:00:56 -0000
Content-Type: text/plain

 Can't install xbitmaps-dev-1.1.1-r0: no package provides xbitmaps = 1.1.1-r0

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
index 973a00f..8647f03 100644
--- a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
@@ -3,6 +3,7 @@ require xorg-data-common.inc
 SUMMARY = "Common X11 Bitmaps"
 LICENSE = "MIT"
 DEPENDS += "libxmu"
+RDEPENDS_${PN}-dev = ""
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=dbd075aaffa4a60a8d00696f2e4b9a8f"
 
-- 
1.9.1


