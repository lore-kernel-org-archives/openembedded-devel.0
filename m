Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4B60B784A2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2018 06:14:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35023663"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2018 14:14:11 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E8DF748AEA0B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2018 14:14:09 +0800 (CST)
Received: from localhost.localdomain (10.167.225.152) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 9 Jan 2018 14:14:11 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jan 2018 16:45:13 +0800
Message-ID: <1515141913-120084-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.152]
X-yoursite-MailScanner-ID: E8DF748AEA0B.AB267
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v2] xorgxrdp: new add
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
X-List-Received-Date: Tue, 09 Jan 2018 06:14:14 -0000
Content-Type: text/plain

Add a new recipe xorgxrdp_0.2.5.bb.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb    | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
new file mode 100644
index 0000000..20cf45f
--- /dev/null
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Xorg drivers for xrdp."
+
+LICENSE = "X11"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a2523660329fdca3d954c0a87390e007 \
+"
+
+inherit autotools pkgconfig 
+
+DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
+
+SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git \
+           "
+
+SRCREV = "c122544f184d4031bbae1ad80fbab554c34a9427"
+
+PV = "0.2.5+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${libdir}/xorg/modules/*"
+
+INSANE_SKIP_${PN} += "xorg-driver-abi"
-- 
2.7.4




