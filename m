Return-Path: <qianl.fnst@cn.fujitsu.com>
X-Greylist: delayed 601 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Nov 2014 10:01:40 UTC
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7073065CA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 10:01:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43017839"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2014 17:48:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sA79pgCw005242
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Nov 2014 17:51:43 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 7 Nov 2014 17:51:59 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Nov 2014 17:51:46 +0800
Message-ID: <1415353906-20924-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH] umip: Add new recipes
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
X-List-Received-Date: Fri, 07 Nov 2014 10:01:43 -0000
Content-Type: text/plain

UMIP is an open source implementation of Mobile IPv6 and NEMO Basic
Support for Linux. It is released under the GPLv2 license. It supports
the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776
and RFC4877 (IPsec and IKEv2).

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-connectivity/umip/umip_1.0.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/umip/umip_1.0.bb

diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
new file mode 100644
index 0000000..a7163b0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Mobile IPv6 and NEMO for Linux"
+DESCRIPTION = "UMIP is an open source implementation of Mobile IPv6 and NEMO \
+Basic Support for Linux. It is released under the GPLv2 license. It supports \
+the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776 and \
+RFC4877 (IPsec and IKEv2)."
+
+HOMEPAGE = "http://umip.org/"
+SECTION = "System Environment/Base"
+
+SRC_URI = "git://git.umip.org/umip.git;tag=v${PV}"
+
+DEPENDS = "rpm"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=073dc31ccb2ebed70db54f1e8aeb4c33"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep
+
+EXTRA_OE_CONF = "--enable-vt"
-- 
1.8.4.2


