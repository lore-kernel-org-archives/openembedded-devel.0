Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 00C2B65CA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 10:01:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43017845"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2014 17:48:56 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sA79ptfL005249
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Nov 2014 17:51:55 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 7 Nov 2014 17:52:12 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Nov 2014 17:52:01 +0800
Message-ID: <1415353921-20973-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH] xgamma: Add new recipes
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
X-List-Received-Date: Fri, 07 Nov 2014 10:01:44 -0000
Content-Type: text/plain

xgamma allows X users to query and alter the gamma correction of a
monitor via the X video mode extension (XFree86-VidModeExtension).

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb
new file mode 100644
index 0000000..48240c0
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb
@@ -0,0 +1,17 @@
+require xorg-app-common.inc
+
+SUMMARY = "X.Org X11 X client utilities"
+
+DESCRIPTION = "xgamma allows X users to query and alter the gamma \
+correction of a monitor via the X video mode extension."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=ac9801b8423fd7a7699ccbd45cf134d8"
+
+PR = "${INC_PR}.0"
+
+DEPENDS += "libxxf86vm"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "e8a88bf1a18f35b724619849dca97f4f"
+SRC_URI[sha256sum] = "e5eb2588fbbdc5c2db5571b304204487a9c22eed15ac6cb816f605ec403e6e1a"
-- 
1.8.4.2


