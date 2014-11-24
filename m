Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AF4DC70A61
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 06:48:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43872913"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Nov 2014 14:45:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAO6lwYM003468
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 14:47:58 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Nov 2014 14:48:15 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Nov 2014 14:45:21 +0800
Message-ID: <1416811526-54855-2-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 1/6] [meta-oe] evieext: Port evieext from openembedded
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
X-List-Received-Date: Mon, 24 Nov 2014 06:48:19 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-proto/evieext_1.1.1.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/evieext_1.1.1.bb

diff --git a/meta-oe/recipes-graphics/xorg-proto/evieext_1.1.1.bb b/meta-oe/recipes-graphics/xorg-proto/evieext_1.1.1.bb
new file mode 100644
index 0000000..5a30f09
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-proto/evieext_1.1.1.bb
@@ -0,0 +1,14 @@
+require recipes-graphics/xorg-proto/xorg-proto-common.inc
+
+SUMMARY = "EvIE: X Event Interception Extension headers"
+
+DESCRIPTION = "This package provides the wire protocol for the X Event \
+Interception Extension.  This extension allows the interception of \
+keyboard and mouse events."
+
+PE = "1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4db9fc6a58e873c6392eec53082d89b5"
+
+SRC_URI[archive.md5sum] = "98bd86a13686f65f0873070fdee6efc7"
+SRC_URI[archive.sha256sum] = "1cf74114436d99f56577a90b6438a32ba31b8128c9e63842bb179aba592733fe"
-- 
1.9.1


