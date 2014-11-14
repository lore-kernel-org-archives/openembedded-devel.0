Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0293C712A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 07:02:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43385786"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2014 14:59:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAE72CsL016146
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 15:02:12 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 14 Nov 2014 15:02:30 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Nov 2014 15:01:49 +0800
Message-ID: <1415948514-16992-3-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1415948514-16992-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1415948514-16992-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH 2/7] xlsclients: Add new recipe
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
X-List-Received-Date: Fri, 14 Nov 2014 07:02:38 -0000
Content-Type: text/plain

xlsclients is a utility for listing information about the client
applications running on a X11 server.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.3.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.3.bb b/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.3.bb
new file mode 100644
index 0000000..583a531
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.3.bb
@@ -0,0 +1,14 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "X.Org X11 X client utilities"
+HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/xlsclients/"
+DESCRIPTION = "xlsclients is a utility for listing information about the \
+client applications running on a X11 server."
+SECTION = "x11/app"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=350e1b718a56df39cfe8ca9345ea4575"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "9fbf6b174a5138a61738a42e707ad8f5"
+SRC_URI[sha256sum] = "5d9666fcc6c3de210fc70d5a841a404955af709a616fde530fe4e8f7723e3d3d"
-- 
1.8.3.1


