Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD6B7190D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 06:48:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43872916"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Nov 2014 14:45:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAO6lxJs003472
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 14:47:59 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Nov 2014 14:48:16 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Nov 2014 14:45:22 +0800
Message-ID: <1416811526-54855-3-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 2/6] [meta-oe] fontcacheproto: Port fontcacheproto from openembedded.
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
 .../recipes-graphics/xorg-proto/fontcacheproto_0.1.3.bb  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/fontcacheproto_0.1.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-proto/fontcacheproto_0.1.3.bb b/meta-oe/recipes-graphics/xorg-proto/fontcacheproto_0.1.3.bb
new file mode 100644
index 0000000..749b283
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-proto/fontcacheproto_0.1.3.bb
@@ -0,0 +1,16 @@
+require recipes-graphics/xorg-proto/xorg-proto-common.inc
+
+SUMMARY = "XFontCache: X Font Cache extension headers"
+
+DESCRIPTION = "This package provides the wire protocol for the X Font \
+Cache extension.  This extension is used by X-TrueType to cache \
+information about fonts."
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ba9fcd8fe6d09af9f733daccc1a21857 \
+                    file://fontcacheP.h;endline=28;md5=85c80bfa96c802ee85a570862ee60214"
+
+PE = "1"
+
+SRC_URI[md5sum] = "a8a50e5e995bfacb0359575faf7f6906"
+SRC_URI[sha256sum] = "1dcaa659d416272ff68e567d1910ccc1e369768f13b983cffcccd6c563dbe3cb"
-- 
1.9.1


