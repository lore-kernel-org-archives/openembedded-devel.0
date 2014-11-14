Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CAA9571FC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 07:02:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43385787"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2014 14:59:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAE72Doo016151
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 15:02:13 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 14 Nov 2014 15:02:31 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Nov 2014 15:01:50 +0800
Message-ID: <1415948514-16992-4-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1415948514-16992-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1415948514-16992-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH 3/7] xrefresh: Add new recipe
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
X-List-Received-Date: Fri, 14 Nov 2014 07:02:40 -0000
Content-Type: text/plain

xrefresh refreshes all or part of an X screen.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.5.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.5.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.5.bb
new file mode 100644
index 0000000..a2a4941
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.5.bb
@@ -0,0 +1,13 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "X.Org X11 X client utilities"
+HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/xrefresh/"
+DESCRIPTION = "xrefresh - refresh all or part of an X screen"
+SECTION = "x11/app"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dad633bce9c3cd0e3abf72a16e0057cf"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "a896382bc53ef3e149eaf9b13bc81d42"
+SRC_URI[sha256sum] = "3213671b0a8a9d1e8d1d5d9e3fd86842c894dd9acc1be2560eda50bc1fb791d6"
-- 
1.8.3.1


