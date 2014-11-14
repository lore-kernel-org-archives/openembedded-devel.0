Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 607906A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 08:25:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43389636"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2014 16:22:35 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAE8PYrG021405
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 16:25:34 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 14 Nov 2014 16:25:53 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Nov 2014 16:25:29 +0800
Message-ID: <1415953529-10127-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH] xrdb: Update to 1.1.0
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
X-List-Received-Date: Fri, 14 Nov 2014 08:25:49 -0000
Content-Type: text/plain

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb | 10 ----------
 meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb b/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
deleted file mode 100644
index f258bb2..0000000
--- a/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require recipes-graphics/xorg-app/xorg-app-common.inc
-SUMMARY = "X server resource database utility"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d1167c4f586bd41f0c62166db4384a69"
-
-DEPENDS += "libxmu"
-PR = "r6"
-
-SRC_URI[md5sum] = "ed2e48cf33584455d74615ad4bbe4246"
-SRC_URI[sha256sum] = "642401e12996efe3e5e5307a245e24c282b94a44c1f147e177c8484b862aeab7"
diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb b/meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb
new file mode 100644
index 0000000..7d60783
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb
@@ -0,0 +1,10 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+SUMMARY = "X server resource database utility"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d1167c4f586bd41f0c62166db4384a69"
+
+DEPENDS += "libxmu"
+PR = "r6"
+
+SRC_URI[md5sum] = "b54c7e3e53b4f332d41ed435433fbda0"
+SRC_URI[sha256sum] = "73827b6bbfc9d27ca287d95a1224c306d7053cd7b8156641698d7dc541ca565b"
-- 
1.8.3.1


