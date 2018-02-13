Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3499278297
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Feb 2018 03:03:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37016781"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Feb 2018 11:03:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AED9F48AE761
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Feb 2018 11:02:57 +0800 (CST)
Received: from localhost.localdomain (10.167.225.156) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 13 Feb 2018 11:02:55 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Feb 2018 20:01:33 +0800
Message-ID: <1518523293-104306-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.156]
X-yoursite-MailScanner-ID: AED9F48AE761.A9A71
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v2] xrdp: enable cpliboard
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
X-List-Received-Date: Tue, 13 Feb 2018 03:03:02 -0000
Content-Type: text/plain

Add --enable-fuse option to enable cpliboard when copying from window OS to linux.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
index 86a8023..88e309a 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=72cfbe4e7bd33a0a1de9630c91195c21 \
 
 inherit distro_features_check autotools pkgconfig useradd systemd
 
-DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native"
+DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native fuse"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -37,7 +37,7 @@ FILES_${PN}-dev += "${libdir}/xrdp/libcommon.so \
                     ${libdir}/xrdp/libscp.so \
                     ${libdir}/xrdp/libxrdpapi.so "
 
-EXTRA_OECONF = "--enable-pam-config=suse"
+EXTRA_OECONF = "--enable-pam-config=suse --enable-fuse"
 
 do_configure_prepend() {
     cd ${S}
-- 
2.7.4




