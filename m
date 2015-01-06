Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2E71472849
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 04:13:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55590094"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2015 12:09:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t064ChP6026898
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Jan 2015 12:12:43 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 6 Jan 2015 12:13:16 +0800
From: leimaohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Jan 2015 12:12:34 +0800
Message-ID: <1420517556-49274-2-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1420517556-49274-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1420517556-49274-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [meta-oe][V2 PATCH 1/3] libqb: add new recipe
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
X-List-Received-Date: Tue, 06 Jan 2015 04:13:18 -0000
Content-Type: text/plain

From: leimh <leimaohui@cn.fujitsu.com>

An IPC library for high performance servers.

Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-extended/libqb/libqb_0.17.1.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libqb/libqb_0.17.1.bb

diff --git a/meta-oe/recipes-extended/libqb/libqb_0.17.1.bb b/meta-oe/recipes-extended/libqb/libqb_0.17.1.bb
new file mode 100644
index 0000000..77307fe
--- /dev/null
+++ b/meta-oe/recipes-extended/libqb/libqb_0.17.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "An IPC library for high performance servers"
+DESCRIPTION = "libqb is a library with the primary purpose of providing high performance client server reusable features. \
+It provides high performance logging, tracing, ipc, and poll."
+
+HOMEPAGE = "https://github.com/clusterlabs/libqb/wiki"
+
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+SRC_URI = "https://fedorahosted.org/releases/q/u/quarterback/${BP}.tar.xz \
+          "
+
+SRC_URI[md5sum] = "5770b343baa4528f6fec90120ec55048"
+SRC_URI[sha256sum] = "7a2115f83bfe20eaa5f2e4ed235e8f2994235d3b87e3e5ca41ba47b320f12e29"
+
+LICENSE = "LGPL-2.1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
+
+do_configure_prepend() {
+    ( cd ${S}
+    ${S}/autogen.sh )
+}
+
+
-- 
1.8.4.2


