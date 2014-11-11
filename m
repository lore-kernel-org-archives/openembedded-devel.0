Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E4EC665CC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:57:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43194520"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Nov 2014 17:54:11 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAB9vAmn019683
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 17:57:10 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 11 Nov 2014 17:57:29 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Nov 2014 17:56:45 +0800
Message-ID: <1415699805-2199-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH] iceauth:upgrade to 1.0.6
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
X-List-Received-Date: Tue, 11 Nov 2014 09:57:25 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |  8 --------
 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 8 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
deleted file mode 100644
index 9d4d1c7..0000000
--- a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require recipes-graphics/xorg-app/xorg-app-common.inc
-SUMMARY = "Tool for manipulating ICE protocol authorization records"
-LIC_FILES_CHKSUM = "file://COPYING;md5=13f70acf3c27f5f834bbc954df775f8e"
-DEPENDS += "libice"
-PR = "r6"
-
-SRC_URI[md5sum] = "bb2e4d2611047f7c5a1a82ec956a9de4"
-SRC_URI[sha256sum] = "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb51448848ef2f349938d"
diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb
new file mode 100644
index 0000000..1fd1789
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb
@@ -0,0 +1,17 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "X.Org X11 X client utilities"
+
+DESCRIPTION = "A collection of utilities used to tweak and query the runtime configuration\
+of the X server."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=13f70acf3c27f5f834bbc954df775f8e"
+
+PR = "${INC_PR}.0"
+
+BBCLASSEXTEND = "native"
+
+DEPENDS += "libice"
+
+SRC_URI[md5sum] = "2527344acc60741a709f4858564c5ae6"
+SRC_URI[sha256sum] = "bd990837353b439e6f45d478a87b8dbfa3f67d72d903e7a9ed4eb8de52f2e2f4"
-- 
1.8.4.2


