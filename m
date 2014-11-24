Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6EAF47214C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 06:48:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43872919"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Nov 2014 14:45:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAO6m2Nx003483
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 14:48:02 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Nov 2014 14:48:19 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Nov 2014 14:45:24 +0800
Message-ID: <1416811526-54855-5-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 4/6] [meta-oe] printproto: Port printproto from openembedded
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
X-List-Received-Date: Mon, 24 Nov 2014 06:48:20 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-proto/printproto_1.0.5.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/printproto_1.0.5.bb

diff --git a/meta-oe/recipes-graphics/xorg-proto/printproto_1.0.5.bb b/meta-oe/recipes-graphics/xorg-proto/printproto_1.0.5.bb
new file mode 100644
index 0000000..27b56b6
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-proto/printproto_1.0.5.bb
@@ -0,0 +1,16 @@
+require recipes-graphics/xorg-proto/xorg-proto-common.inc
+
+SUMMARY = "XP: X Printing extension headers"
+
+DESCRIPTION = "This package provides the wire protocol for the X \
+Printing extension.  This extension provides a way for client \
+applications to render to non-display devices."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=658463213f19b48b81f8672d2696069f \
+                    file://Print.h;beginline=2;endline=59;md5=db19e065445b3755c09432864dcd8a9b"
+
+PE = "1"
+
+SRC_URI[md5sum] = "99d0e25feea2fead7d8325b7000b41c3"
+SRC_URI[sha256sum] = "1298316cf43b987365ab7764d61b022a3d7f180b67b423eed3456862d155911a"
-- 
1.9.1


