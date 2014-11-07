Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6246365CA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 10:02:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43017827"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2014 17:48:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sA79pRtt005226
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Nov 2014 17:51:27 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 7 Nov 2014 17:51:44 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Nov 2014 17:51:22 +0800
Message-ID: <1415353882-20874-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH] tomoyo-tools: Add new recipes
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
X-List-Received-Date: Fri, 07 Nov 2014 10:02:11 -0000
Content-Type: text/plain

TOMOYO Linux is a Mandatory Access Control (MAC) implementation for
Linux that can be used to increase the security of a system, while also
being useful purely as a system analysis tool.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../tomoyo-tools/tomoyo-tools_2.5.0.bb             | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb

diff --git a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
new file mode 100644
index 0000000..bb2676b
--- /dev/null
+++ b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
@@ -0,0 +1,29 @@
+SUMMARY = "TOMOYO Linux tools"
+DESCRIPTION = "TOMOYO Linux is a Mandatory Access Control (MAC) implementation \
+for Linux that can be used to increase the security of a system, while also \
+being useful purely as a system analysis tool."
+HOMEPAGE = "http://tomoyo.sourceforge.jp/"
+SECTION = "System Environment/Kernel"
+
+SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/53357/${PN}-${PV}-20140601.tar.gz"
+SRC_URI[md5sum] = "888869b793127f00d6439a3246598b83"
+SRC_URI[sha256sum] = "118ef6ba1fbf7c0b83018c3a0d4d5485dfb9b5b7f647f37ce9f63841a3133c2a"
+
+S = "${WORKDIR}/${PN}"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.tomoyo;md5=751419260aa954499f7abaabaa882bbe"
+
+FILES_${PN}     += "${libdir}/tomoyo"
+FILES_${PN}-dbg += "${libdir}/tomoyo/.debug"
+
+DEPENDS = "linux-libc-headers ncurses"
+CFLAGS_append += "-D_GNU_SOURCE"
+
+do_compile () {
+	oe_runmake 'CC=${CC}'
+}
+
+do_install() {
+	oe_runmake install INSTALLDIR=${D}
+}
-- 
1.8.4.2


