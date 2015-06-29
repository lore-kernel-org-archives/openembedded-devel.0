Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8910A65CF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 08:49:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97858264"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jun 2015 16:53:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5T8ldT1021229
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 16:47:39 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 29 Jun 2015 16:49:18 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Jun 2015 16:39:54 +0800
Message-ID: <1435567194-38256-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH] sblim-sfcc: add new recipe
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
X-List-Received-Date: Mon, 29 Jun 2015 08:49:21 -0000
Content-Type: text/plain

sblim-sfcc is a Small Footprint CIM Client library.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb

diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
new file mode 100644
index 0000000..1ec9940
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Small Footprint CIM Client Library"
+DESCRIPTION = "Small Footprint CIM Client Library Runtime Libraries"
+HOMEPAGE = "http://www.sblim.org"
+
+SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "0bac0dec19f17ec065b6c332a56d7bae"
+SRC_URI[sha256sum] = "1b8f187583bc6c6b0a63aae0165ca37892a2a3bd4bb0682cd76b56268b42c3d6"
+
+LICENSE = "EPL-1.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
+
+DEPENDS = "curl"
+
+inherit autotools
-- 
1.8.4.2


