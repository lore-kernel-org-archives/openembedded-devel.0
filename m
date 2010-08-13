Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OjsoJ-00017f-Bi
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 13:52:50 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Ojsnf-00046P-Tc from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 04:51:52 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 13 Aug 2010 13:51:50 +0200
From: "Ahsan, Noor" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Aug 2010 17:50:16 +0600
Message-Id: <1281700216-26652-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 13 Aug 2010 11:51:50.0567 (UTC)
	FILETIME=[EA715370:01CB3ADD]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] serload-native: Removing legacy staging
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
X-List-Received-Date: Fri, 13 Aug 2010 11:52:51 -0000

* Replaced do_stage function with do_install and replaced ${STAGING_BINDIR} with ${D}${bindir}

Signed-off-by: Ahsan, Noor <noor_ahsan@mentor.com>
---
 recipes/simpad-utilities/serload-native.bb |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes/simpad-utilities/serload-native.bb b/recipes/simpad-utilities/serload-native.bb
index 9be199f..d147db2 100644
--- a/recipes/simpad-utilities/serload-native.bb
+++ b/recipes/simpad-utilities/serload-native.bb
@@ -3,14 +3,18 @@ LICENSE= "GPL"
 DESCRIPTION = "Console utility for transferring a SIMpad boot image via serial a SIMpad"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/serload"
 SRC_URI = "file://serialdownload.cpp file://main.cpp file://serialdownload.h"
+PR = "r1"
 
 inherit native
 
+NATIVE_INSTALL_WORKS = "1"
+
 do_compile() {
-	cp ${WORKDIR}/*.h ${WORKDIR}/*.cpp .
-	${CXX} -I. -o serload main.cpp serialdownload.cpp
+        cp ${WORKDIR}/*.h ${WORKDIR}/*.cpp .
+        ${CXX} -I. -o serload main.cpp serialdownload.cpp
 }
 
-do_stage() {
-	install -m 0755 serload ${STAGING_BINDIR}/
+do_install() {
+        install -d ${D}${bindir}/
+        install -m 0755 serload ${D}${bindir}/
 }
-- 
1.6.3.3



