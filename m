Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0DA3965CC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 07:56:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43187717"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Nov 2014 15:52:45 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAB7tiah010950
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 15:55:44 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 11 Nov 2014 15:55:58 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Nov 2014 15:55:43 +0800
Message-ID: <1415692543-11071-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH] xkbprint: Add new recipe
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
X-List-Received-Date: Tue, 11 Nov 2014 07:56:05 -0000
Content-Type: text/plain

xkbprint generates a printable or encapsulated PostScript description
of an XKB keyboard description.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.3.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.3.bb b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.3.bb
new file mode 100644
index 0000000..64b54dd
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.3.bb
@@ -0,0 +1,13 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+SUMMARY = "A program to compile XKB keyboard description"
+DESCRIPTION = "xkbprint generates a printable or encapsulated PostScript \
+description of an XKB keyboard description."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=20f28f97555b220fde762bc2a4406a8f"
+
+DEPENDS += "libxkbfile"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "526b5ba87cccd05aa700fa628bcfda3e"
+SRC_URI[sha256sum] = "fa846db8e588018134bd550f80eb129e4ddfdb96f3b157603a57ae2cdf5892c0"
-- 
1.8.4.2


