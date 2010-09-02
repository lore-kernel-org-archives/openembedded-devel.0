Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Or8nb-0002Jg-PB
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 14:21:49 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Or8n1-0004i4-GQ from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 05:21:11 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 2 Sep 2010 14:21:09 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Sep 2010 18:20:14 +0600
Message-Id: <1283430014-21009-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 02 Sep 2010 12:21:10.0166 (UTC)
	FILETIME=[5381D360:01CB4A99]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] uicmoc-native: Convert to new style staging, Remove do_stage
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Sep 2010 12:21:49 -0000

* Convert do_stage to do_install function
* Convert ${STAGING_BINDIR} to ${D}${bindir}
* Set NATIVE_INSTALL_WORKS = "1"
* Bump PR to "r5"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/uicmoc/uicmoc-native_2.3.10.bb |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/recipes/uicmoc/uicmoc-native_2.3.10.bb b/recipes/uicmoc/uicmoc-native_2.3.10.bb
index c161571..12f10a0 100644
--- a/recipes/uicmoc/uicmoc-native_2.3.10.bb
+++ b/recipes/uicmoc/uicmoc-native_2.3.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.trolltech.com"
 SECTION = "devel"
 PRIORITY = "optional"
 LICENSE = "GPL QPL"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz \
            file://fix-makefile.patch \
@@ -43,11 +43,14 @@ do_compile() {
     oe_runmake -C tools/makeqpf       || die "Building makeqpf failed"
 }
 
-do_stage() {
-    install -m 0755 bin/moc ${STAGING_BINDIR}
-    install -m 0755 bin/uic ${STAGING_BINDIR}
-    install -m 0755 tools/makeqpf/makeqpf ${STAGING_BINDIR}
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 bin/moc ${D}${bindir}
+    install -m 0755 bin/uic ${D}${bindir}
+    install -m 0755 tools/makeqpf/makeqpf ${D}${bindir}
 }
 
 SRC_URI[md5sum] = "1f7ad30113afc500cab7f5b2f4dec0d7"
 SRC_URI[sha256sum] = "883363eb0c94de3d1e36f3ab9e09a8f127418d497213cc1a0ed1a1588ecd66b8"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



