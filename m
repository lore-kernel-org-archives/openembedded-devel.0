Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0E69760722
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:14:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="30603462"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Nov 2017 13:14:36 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 745DC48A61E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 13:14:34 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 30 Nov 2017 13:14:33 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Nov 2017 13:13:52 +0800
Message-ID: <1512018832-43434-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: 745DC48A61E5.A66E0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v4] xrdp: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Nov 2017 05:14:39 -0000
Content-Type: text/plain

Add a new recipe xrdp_0.9.4.bb.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
new file mode 100644
index 0000000..92c2289
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "An open source remote desktop protocol(rdp) server."
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=72cfbe4e7bd33a0a1de9630c91195c21 \
+"
+
+inherit distro_features_check
+
+DEPENDS = "openssl virtual/libx11 libxfixes libxrandr"
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = "git://github.com/neutrinolabs/xrdp.git"
+
+SRCREV = "c295dd61b882e8b56677cf12791f43634f9190b5"
+
+PV = "0.9.4+git${SRCPV}"
+
+S = "${WORKDIR}/git"
-- 
2.7.4




