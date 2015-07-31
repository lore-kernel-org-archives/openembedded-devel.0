Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C8F4576537
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 02:47:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99103039"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 10:51:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V2k2Xf014019
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:46:02 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 10:47:54 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 10:47:41 +0800
Message-ID: <1438310864-15716-6-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438310864-15716-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1438310864-15716-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH v3 5/8] sblim-sfcCommon: add new recipe
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
X-List-Received-Date: Fri, 31 Jul 2015 02:47:56 -0000
Content-Type: text/plain

Sblim-sfcCommon is dependence of sblim-sfcb.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb       | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb

diff --git a/meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb b/meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb
new file mode 100644
index 0000000..0f5515a
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Common functions for SBLIM Small Footprint CIM Broker and CIM Client Library."
+DESCRIPTION = "\
+This package provides a common library for functions shared between Small Footprint CIM Broker (sblim-sfcb) \
+Small Footprint CIM Client (and sblim-sfcc)."
+HOMEPAGE = "http://sourceforge.net/projects/sblim/"
+LICENSE = "EPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
+SECTION = "Development/Libraries"
+
+DEPENDS = "cmpi-bindings"
+
+SRC_URI = "http://downloads.sourceforge.net/sblim/${PN}-${PV}.tar.bz2 \
+          "
+SRC_URI[md5sum] = "8aa2655d97bdea54c4750f220b40990c"
+SRC_URI[sha256sum] = "b9b1037173d6ae0181c3bd5a316ddab5afd6a342ad0dbdc18e940fc0ad2c3297"
+
+inherit autotools
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+
+    rm -rf ${D}${libdir}/libsfcUtil.a
+    rm -rf ${D}${libdir}/libsfcUtil.la
+}
+
-- 
1.8.4.2


