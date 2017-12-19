Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 02D8E6FF78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 07:12:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="31754483"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Dec 2017 15:12:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 861FF486A78B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 15:12:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.76) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 19 Dec 2017 15:12:56 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Dec 2017 00:11:58 +0800
Message-ID: <1513699918-7720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.76]
X-yoursite-MailScanner-ID: 861FF486A78B.AA58E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xorgxrdp: new add
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
X-List-Received-Date: Tue, 19 Dec 2017 07:12:58 -0000
Content-Type: text/plain

Add a new recipe xorgxrdp_0.2.5.bb.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
new file mode 100644
index 0000000..b41190d
--- /dev/null
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
@@ -0,0 +1,20 @@
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
-- 
2.7.4




