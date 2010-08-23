Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OnUKL-0001w2-Hj
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 12:32:47 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OnUJw-0003uS-5E from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 03:32:04 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 23 Aug 2010 12:32:02 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Aug 2010 16:29:27 +0600
Message-Id: <1282559367-7589-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 23 Aug 2010 10:32:02.0768 (UTC)
	FILETIME=[6CD2AD00:01CB42AE]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] uicmoc4-native: Convert to new style staging, Remove do_stage()
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
X-List-Received-Date: Mon, 23 Aug 2010 10:32:47 -0000

* Remove do_stage function
* set NATIVE_INSTALL_WORKS = "1"

Signed-off-by: Noor Ahsan <nahsan@pkl-nahsan-ubuntu.(none)>
---
 recipes/uicmoc/uicmoc4-native_4.4.3.bb |   15 ++-------------
 1 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/recipes/uicmoc/uicmoc4-native_4.4.3.bb b/recipes/uicmoc/uicmoc4-native_4.4.3.bb
index d1816d2..d106929 100644
--- a/recipes/uicmoc/uicmoc4-native_4.4.3.bb
+++ b/recipes/uicmoc/uicmoc4-native_4.4.3.bb
@@ -2,18 +2,7 @@ require uicmoc4-native.inc
 
 inherit native
 
-do_stage() {
-    install -d ${STAGING_BINDIR}/
-    install -m 0755 bin/moc ${STAGING_BINDIR}/moc4
-    install -m 0755 bin/uic ${STAGING_BINDIR}/uic4
-    install -m 0755 bin/uic3 ${STAGING_BINDIR}/uic34
-    install -m 0755 bin/rcc ${STAGING_BINDIR}/rcc4
-    install -m 0755 bin/lrelease ${STAGING_BINDIR}/lrelease4
-    install -m 0755 bin/lupdate ${STAGING_BINDIR}/lupdate4
-    install -d ${STAGING_DIR_NATIVE}/qt4/
-    install -m 0644 tools/porting/src/q3porting.xml ${STAGING_DIR_NATIVE}/qt4/
-}
-
-
 SRC_URI[md5sum] = "9a639aec44a1e4c70040117183d247a3"
 SRC_URI[sha256sum] = "05d06b93f95092f1318634fca24f0c2d0a1252c9f1dc2fbb427b07e8ecbb4f39"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



