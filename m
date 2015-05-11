Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2D65773F60
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:35:49 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YrtUU-0001T5-O6 from Dmitry_Eremin@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2015 12:35:50 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Mon, 11 May 2015 20:35:49 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 May 2015 22:35:45 +0300
Message-ID: <1431372946-26514-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] openobex: make it compatbile with bluez5
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
X-List-Received-Date: Mon, 11 May 2015 19:35:53 -0000
Content-Type: text/plain

The package per se is compatible with bluez5. Update dependencies to select bluez4 or bluez5 and drop
PNBLACKLIST setting.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta-oe/recipes-connectivity/obex/openobex_1.5.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
index ed3d6b2..0d378e7 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
@@ -2,14 +2,13 @@ DESCRIPTION = "The Openobex project is an open source implementation of the \
 Object Exchange (OBEX) protocol."
 HOMEPAGE = "http://openobex.triq.net"
 SECTION = "libs"
-DEPENDS = "virtual/libusb0 bluez4"
+DEPENDS = "virtual/libusb0"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 "
 
-PNBLACKLIST[openobex] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.tar.gz \
            file://disable-cable-test.patch \
            file://libusb_crosscompile_check.patch \
-- 
2.1.4


