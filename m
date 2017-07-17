Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 802BE7017B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 01:55:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21372071"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jul 2017 09:55:06 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E840046B4C8D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 09:55:03 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 17 Jul 2017 09:55:08 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Jul 2017 09:54:59 +0800
Message-ID: <1500256499-807-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: E840046B4C8D.A4F76
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Bian Yaqin <bianyq@cn.fujitsu.com>
Subject: [PATCH] openssl : By default, disable cryptodev.
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
X-List-Received-Date: Mon, 17 Jul 2017 01:55:12 -0000
Content-Type: text/plain

From: Bian Yaqin <bianyq@cn.fujitsu.com>

Because according to the other Distros(e.g. Ubuntu, Fedora), cryptodev is not enabled.
If users want enable cryptodev, just have to add "cryptodev-linux" into PACKAGECONFIG.

Signed-off-by: Bian Yaqin <bianyq@cn.fujitsu.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2l.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
index a2ef2ac..c00dd81 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
@@ -2,9 +2,11 @@ require openssl.inc
 
 # For target side versions of openssl enable support for OCF Linux driver
 # if they are available.
-DEPENDS += "cryptodev-linux"
+PACKAGECONFIG[cryptodev-linux] = ",,cryptodev-linux"
+DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'cryptodev-linux', 'cryptodev-linux', '', d)}"
+
+CFLAG += "${@bb.utils.contains('PACKAGECONFIG', 'cryptodev-linux', '-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS', '', d)}"
 
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 CFLAG_append_class-native = " -fPIC"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
-- 
2.7.4




