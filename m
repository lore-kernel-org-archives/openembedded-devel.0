Return-Path: <denis@denix.org>
X-Greylist: delayed 3611 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Mar 2015 17:18:43 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id C574B73820
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 17:18:43 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NKL00A3PEM40OC0@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	02 Mar 2015 10:18:05 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=NqFmqHZM c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=cCoHmxC58U_5Qzzq_5YA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9F81B20076;	Mon,
	2 Mar 2015 11:18:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 02 Mar 2015 11:17:58 -0500
Message-id: <1425313078-31685-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH v2] nativesdk-qtbase.inc: avoid removing directories, namely /usr/lib itself
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
X-List-Received-Date: Mon, 02 Mar 2015 17:18:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/nativesdk-qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 3bad980..35953bb 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -230,7 +230,7 @@ do_install() {
            ${D}/${OE_QMAKE_PATH_PLUGINS} \
            ${D}${libdir}/cmake \
            ${D}${libdir}/pkgconfig
-    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and \
+    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and -not -type d -and \
                                    -not -name 'libQt5Core.so*' -and \
                                    ${QTLIBSPRESERVE} \
                                    -not -name 'libQt5Bootstrap.a' \
-- 
2.2.0


