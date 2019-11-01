Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AF7677FBF9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 07:44:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208";a="77786280"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 15:44:36 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1E89D4CE1645
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 15:36:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 1 Nov 2019 15:44:38 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 19:24:19 +0800
Message-ID: <1572607459-67246-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 1E89D4CE1645.A875B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] iwd: upgrade 0.20 -> 0.23
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
X-List-Received-Date: Fri, 01 Nov 2019 07:44:37 -0000
Content-Type: text/plain

1) Add DEPEND python-docutils-native to generate manual pages.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_0.20.bb => iwd_0.23.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_0.20.bb => iwd_0.23.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.20.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/iwd/iwd_0.20.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
index 4220503..d48fb84 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_0.20.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Wireless daemon for Linux"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd pythonnative
 
-DEPENDS = "ell readline dbus"
+DEPENDS = "ell readline dbus python-docutils-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "00f0039232cc73bbcf7a1875f8f9aae464d90a8f"
+SRCREV = "77f16ae26fc013477f6362a0c33f0e52e82863e0"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-- 
2.7.4




