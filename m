Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 33204722DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 06:42:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44002409"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Nov 2014 14:39:01 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAQ6fwmx025255
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 14:41:59 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 26 Nov 2014 14:42:22 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Nov 2014 14:41:53 +0800
Message-ID: <1416984113-28775-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH] xkbutils: Add new recipe
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
X-List-Received-Date: Wed, 26 Nov 2014 06:42:26 -0000
Content-Type: text/plain

xkbutils is a collection of small utilities utilizing the XKeyboard (XKB)
extension to the X11 protocol.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb
new file mode 100644
index 0000000..6a05e98
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb
@@ -0,0 +1,19 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "XKeyboard (XKB) extension to the X11 protocol"
+DESCRIPTION = " \
+xkbutils is a collection of small utilities utilizing the XKeyboard (XKB) \
+extension to the X11 protocol. \
+It includes: \
+    xkbbell  - generate XKB bell events \
+    xkbvleds - display the state of LEDs on an XKB keyboard in a window \
+    xkbwatch - reports changes in the XKB keyboard state \
+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=64322fab5239f5c8d97cf6e0e14f1c62"
+
+DEPENDS += "libxaw libxkbfile"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "502b14843f610af977dffc6cbf2102d5"
+SRC_URI[sha256sum] = "d2a18ab90275e8bca028773c44264d2266dab70853db4321bdbc18da75148130"
-- 
1.8.3.1


