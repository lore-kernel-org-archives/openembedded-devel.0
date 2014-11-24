Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6CC6AC95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 05:28:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43869736"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Nov 2014 13:25:17 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAO5SEjL031592;
	Mon, 24 Nov 2014 13:28:15 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Nov 2014 13:28:34 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Nov 2014 13:28:13 +0800
Message-ID: <1416806893-2548-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1416806516-2182-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1416806516-2182-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH v3 2/2] UMIP: add new recipe
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
X-List-Received-Date: Mon, 24 Nov 2014 05:28:36 -0000
Content-Type: text/plain

UMIP is an open source implementation of Mobile IPv6 and NEMO Basic
Support for Linux. It is released under the GPLv2 license. It supports
the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776
and RFC4877 (IPsec and IKEv2).

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-connectivity/umip/umip_1.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/umip/umip_1.0.bb

diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
new file mode 100644
index 0000000..76901ab
--- /dev/null
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Mobile IPv6 and NEMO for Linux"
+DESCRIPTION = "UMIP is an open source implementation of Mobile IPv6 and NEMO \
+Basic Support for Linux. It is released under the GPLv2 license. It supports \
+the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776 and \
+RFC4877 (IPsec and IKEv2)."
+HOMEPAGE = "http://umip.org/"
+SECTION = "System Environment/Base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=073dc31ccb2ebed70db54f1e8aeb4c33"
+DEPENDS = "rpm indent-native"
+
+SRC_URI = "git://git.umip.org/umip.git"
+SRCREV = "428974c2d0d8e75a2750a3ab0488708c5dfdd8e3"
+
+S = "${WORKDIR}/git"
+EXTRA_OE_CONF = "--enable-vt"
+
+inherit autotools-brokensep
-- 
1.8.3.1


