Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 46BD265CC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 07:33:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43186769"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Nov 2014 15:29:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAB7WoY2009670;
	Tue, 11 Nov 2014 15:32:51 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 11 Nov 2014 15:33:05 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <martin.jansa@gmail.com>
Date: Tue, 11 Nov 2014 15:32:58 +0800
Message-ID: <1415691178-10816-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1415613209-6320-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1415613209-6320-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v3] xgamma: Add new recipes
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
X-List-Received-Date: Tue, 11 Nov 2014 07:33:12 -0000
Content-Type: text/plain

xgamma allows X users to query and alter the gamma correction of a
monitor via the X video mode extension (XFree86-VidModeExtension).

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/xgamma_1.0.5.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xgamma_1.0.5.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.5.bb
new file mode 100644
index 0000000..6fb9259
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.5.bb
@@ -0,0 +1,15 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "X.Org X11 X client utilities"
+
+DESCRIPTION = "xgamma allows X users to query and alter the gamma \
+correction of a monitor via the X video mode extension."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=ac9801b8423fd7a7699ccbd45cf134d8"
+
+DEPENDS += "libxxf86vm"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "c06067f572bc4a5298f324f27340da95"
+SRC_URI[sha256sum] = "e322a2fea80d559c09d6bc285ebe1a9e454dbeae2a07116cb7d2207db9d2c310"
-- 
1.8.4.2


