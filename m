Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 146B770A8B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 08:42:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45166682"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Dec 2014 16:39:28 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBF8gNIr019872
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 16:42:23 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 15 Dec 2014 16:42:53 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Dec 2014 16:42:37 +0800
Message-ID: <1418632957-21443-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH] dfu-util: Change the SRCURI to gitorious
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
X-List-Received-Date: Mon, 15 Dec 2014 08:43:01 -0000
Content-Type: text/plain

Official website is not available, using git instead.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
index aa2b84d..65ad10b 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
@@ -1,16 +1,14 @@
 DESCRIPTION = "USB Device Firmware Upgrade utility"
-SECTION = "devel"
 AUTHOR = "Harald Welte <laforge@openmoko.org>"
+SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "libusb1"
 
-SRC_URI = "http://${BPN}.gnumonks.org/releases/${BP}.tar.gz \
-    file://0001-configure.ac-Don-t-check-for-usbpath.patch \
-"
+SRC_URI = "git://gitorious.org/dfu-util/dfu-util.git \
+           file://0001-configure.ac-Don-t-check-for-usbpath.patch"
+SRCREV = "4e312c5567a84f76654295c267ec35f71727fe5a"
 
-inherit autotools pkgconfig
+S = "${WORKDIR}/git"
 
-DEPENDS = "libusb1"
-
-SRC_URI[md5sum] = "56844020177d4db4c1ea2e926fe9d588"
-SRC_URI[sha256sum] = "f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c712e0c58a332d80ec3eab"
+inherit autotools pkgconfig
-- 
1.8.3.1


