Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BCCBC6E660
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Aug 2016 08:41:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10344923"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Aug 2016 16:41:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 77D7642EB270
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Aug 2016 16:41:20 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Sat, 27 Aug 2016 16:41:20 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 27 Aug 2016 04:41:15 -0400
Message-ID: <1472287275-1524-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 77D7642EB270.A5A44
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] networkmanager: 1.0.10 -> 1.0.12
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
X-List-Received-Date: Sat, 27 Aug 2016 08:41:25 -0000
Content-Type: text/plain

1) Upgrade networkmanager from 1.0.10 to 1.0.12.
2) Delete some patches, since they are no use.
    0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch
    0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch
    0005-device-update-ip_iface-only-if-IP-interface-exists.patch

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../{networkmanager_1.0.10.bb => networkmanager_1.0.12.bb}         | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.10.bb => networkmanager_1.0.12.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb
index c18afff..56ca847 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb
@@ -15,13 +15,10 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
     file://0002-add-pkg-config-for-libgcrypt.patch \
-    file://0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch \
-    file://0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch \
-    file://0005-device-update-ip_iface-only-if-IP-interface-exists.patch \
     file://0006-Fix-nm-version-macro-includes.patch \
 "
-SRC_URI[md5sum] = "a8f54460a4708efd840358f32d0968fd"
-SRC_URI[sha256sum] = "1bcfce8441dfd9f432a100d06b54f3831a2275cccc3b74b1b4c09a011e179fbc"
+SRC_URI[md5sum] = "ebb273456a81ccf9dfaf2461061b0e96"
+SRC_URI[sha256sum] = "3a470f8c60109b1acb5784ddc2423501706b5fe34c793a6faee87e591eb04a9e"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.7.4




