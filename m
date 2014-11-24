Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B368D721D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 06:48:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43872918"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Nov 2014 14:45:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAO6m0qF003475
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 14:48:00 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Nov 2014 14:48:18 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Nov 2014 14:45:23 +0800
Message-ID: <1416811526-54855-4-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 3/6] [meta-oe] libxfontcache: Port libxfontcache from openembedded.
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
X-List-Received-Date: Mon, 24 Nov 2014 06:48:21 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-lib/libxfontcache_1.0.5.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxfontcache_1.0.5.bb

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxfontcache_1.0.5.bb b/meta-oe/recipes-graphics/xorg-lib/libxfontcache_1.0.5.bb
new file mode 100644
index 0000000..023bf04
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxfontcache_1.0.5.bb
@@ -0,0 +1,15 @@
+require recipes-graphics/xorg-lib/xorg-lib-common.inc
+
+SUMMARY = "XFontCache: X Font Cache extension library"
+
+DESCRIPTION = "FontCache is an extension that is used by X-TrueType to cache \
+information about fonts."
+
+DEPENDS += "libxext fontcacheproto zlib"
+LIC_FILES_CHKSUM = "file://COPYING;md5=62a75d5d3da40f1f6eb1cbe3bcc0a5d0"
+PE = "1"
+
+XORG_PN = "libXfontcache"
+
+SRC_URI[md5sum] = "bbd37768c87f63cf2eb845b2c0f56515"
+SRC_URI[sha256sum] = "0d639219549f51fa0e6b4414383f5d13e6c1638e66b3434f4626eb989ffacbce"
-- 
1.9.1


