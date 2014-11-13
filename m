Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 07D126FC68
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 00:59:02 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NF0005X359VCT20@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	13 Nov 2014 17:58:44 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=TstRX4Tk c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=cCoHmxC58U_5Qzzq_5YA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B95452008C;	Thu,
	13 Nov 2014 18:58:40 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Nov 2014 18:58:38 -0500
Message-id: <1415923119-4861-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH 1/2] nativesdk-qtbase.inc: avoid removing directories, namely /usr/lib itself
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
X-List-Received-Date: Fri, 14 Nov 2014 00:59:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/nativesdk-qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 6f1f880..06fb049 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -230,7 +230,7 @@ do_install() {
            ${D}/${OE_QMAKE_PATH_PLUGINS} \
            ${D}${libdir}/cmake \
            ${D}${libdir}/pkgconfig
-    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and \
+    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and -not -type d \
                                    -not -name 'libQt5Core.so*' -and \
                                    ${QTLIBSPRESERVE} \
                                    -not -name 'libQt5Bootstrap.a' \
-- 
2.1.2


