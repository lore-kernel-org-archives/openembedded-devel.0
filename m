Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.15])
	by mail.openembedded.org (Postfix) with ESMTP id ABBD660144
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 16:39:23 +0000 (UTC)
Received: from [216.82.249.131] by server-15.bemta-12.messagelabs.com id
	D7/55-02757-B3537F45; Wed, 04 Mar 2015 16:39:23 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-4.tower-28.messagelabs.com!1425487162!32545512!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.13.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25501 invoked from network); 4 Mar 2015 16:39:23 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-4.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	4 Mar 2015 16:39:23 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Wed, 4 Mar 2015 10:39:11 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 4 Mar 2015 10:39:21 -0600
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.224.2; Wed, 4 Mar 2015 17:39:15 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Mar 2015 17:39:04 +0100
Message-ID: <1425487144-27730-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.3.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [meta-networking][PATCH] crda: move libgcrypt to DEPENDS
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
X-List-Received-Date: Wed, 04 Mar 2015 16:39:24 -0000
Content-Type: text/plain

crda has a build time dependence on libgcrypt, so move the dependence
from RDEPENDS to DEPENDS.

Otherwise the build fails with:

reglib.c:28:20: fatal error: gcrypt.h: No such file or directory

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta-networking/recipes-connectivity/crda/crda_3.13.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.13.bb b/meta-networking/recipes-connectivity/crda/crda_3.13.bb
index 2ccced42e600..dc544469424f 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.13.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.13.bb
@@ -5,7 +5,7 @@ LICENSE = "copyleft-next-0.3.0 & ISC"
 LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe \
                     file://${WORKDIR}/wireless-regdb-2014.11.18/LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
-DEPENDS = "python-m2crypto-native python-native"
+DEPENDS = "python-m2crypto-native python-native libgcrypt"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/crda/${BP}.tar.xz;name=crda \
            https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2014.11.18.tar.xz;name=bin \
@@ -37,7 +37,7 @@ do_install() {
 }
 
 
-RDEPENDS_${PN} = "udev libgcrypt libnl"
+RDEPENDS_${PN} = "udev libnl"
 FILES_${PN} += "${libdir}crda/regulatory.bin \
                 ${base_libdir}/udev/rules.d/85-regulatory.rules \
 "

