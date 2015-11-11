Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6FCA75CF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 09:47:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAB9liK8022705
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 01:47:44 -0800
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 11 Nov 2015 01:47:43 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Nov 2015 17:47:45 +0800
Message-ID: <1447235265-5602-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] networkmanager: upgrade to 1.0.6
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
X-List-Received-Date: Wed, 11 Nov 2015 09:47:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- add packageconfig for libnewt but not enable by default.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../{networkmanager_1.0.4.bb => networkmanager_1.0.6.bb}             | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.4.bb => networkmanager_1.0.6.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 310a83b..5bb3cc8 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
 "
-SRC_URI[md5sum] = "7eabef7bd3bbdd6dc0473dd32aeac924"
-SRC_URI[sha256sum] = "e4099fa2f4f4b8d95d0ad9fdd03ec20960845085fa500bf79aecbf54cee018c9"
+SRC_URI[md5sum] = "00f5f9ec69725a9f9b99366853c6f73e"
+SRC_URI[sha256sum] = "38ea002403e3b884ffa9aae25aea431d2a8420f81f4919761c83fb92648254bd"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
@@ -42,6 +42,7 @@ PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
 PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
+PACKAGECONFIG[nmtui] = "--with-nmtui=yes,--with-nmtui=no,libnewt"
 PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
 
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion"
-- 
1.9.1


