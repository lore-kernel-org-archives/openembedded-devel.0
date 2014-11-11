Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 847FE70660
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 03:32:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43176735"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Nov 2014 11:29:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAB3W9mL029363
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 11:32:09 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 11 Nov 2014 11:32:23 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Nov 2014 11:31:55 +0800
Message-ID: <1415676715-9735-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH] xkbevd: Add new recipe
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
X-List-Received-Date: Tue, 11 Nov 2014 03:32:29 -0000
Content-Type: text/plain

The  xkbevd event daemon listens for specified XKB events and
executes requested commands if they occur.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.3.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.3.bb b/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.3.bb
new file mode 100644
index 0000000..e81a3c9
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.3.bb
@@ -0,0 +1,13 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+SUMMARY = "A program to compile XKB keyboard description"
+DESCRIPTION = "The  xkbevd event daemon listens for specified XKB \
+events and executes requested commands if they occur. "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=208668fa9004709ba22c2b748140956c"
+
+DEPENDS += "libxkbfile"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "37ed71525c63a9acd42e7cde211dcc5b"
+SRC_URI[sha256sum] = "55b2484f9851112c2685d503b64b319f0f98fce74863ef735ecd52b52ceb0116"
-- 
1.8.4.2


