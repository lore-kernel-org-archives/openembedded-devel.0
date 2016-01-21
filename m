Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6138D60112
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 01:48:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2810169"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Jan 2016 09:48:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8EC2C41896D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 09:48:42 +0800 (CST)
Received: from localhost.localdomain (10.167.226.65) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 21 Jan 2016 09:52:32 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Jan 2016 04:48:23 +0300
Message-ID: <1453340903-1803-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.65]
X-yoursite-MailScanner-ID: 8EC2C41896D0.AF99D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] networkmanager: add PACKAGECONFIG for qt4-x11-free
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
X-List-Received-Date: Thu, 21 Jan 2016 01:49:00 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index c2b00ed..1ddb66f 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -55,6 +55,7 @@ PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt"
 PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-supplicant wireless-tools"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
+PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
 
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion \
   ${PN}-nmtui ${PN}-nmtui-doc \
-- 
1.8.4.2




