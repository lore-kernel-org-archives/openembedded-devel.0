Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OjtMn-00079q-Ki
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 14:28:12 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Ojszo-0006L3-2v from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 05:04:24 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 13 Aug 2010 14:04:22 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Aug 2010 17:06:17 +0500
Message-Id: <1281701177-29882-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 13 Aug 2010 12:04:22.0717 (UTC)
	FILETIME=[AAC24ED0:01CB3ADF]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH] dcopidl2cpp-native_3.5.8.bb added non-legacy style staging support
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
X-List-Received-Date: Fri, 13 Aug 2010 12:28:12 -0000

* converted do_stage to do_install and replaced ${STAGING_BINDIR} with ${D}${bindir}


Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/dcop/dcopidl2cpp-native_3.5.8.bb |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes/dcop/dcopidl2cpp-native_3.5.8.bb b/recipes/dcop/dcopidl2cpp-native_3.5.8.bb
index 761ef87..189cafd 100644
--- a/recipes/dcop/dcopidl2cpp-native_3.5.8.bb
+++ b/recipes/dcop/dcopidl2cpp-native_3.5.8.bb
@@ -4,6 +4,8 @@ PRIORITY    = "optional"
 LICENSE     = "GPL"
 DEPENDS     = "uicmoc3-native"
 
+PR = "r1"
+
 SRC_URI     = "ftp://download.kde.org/pub/kde/stable/${PV}/src/kdelibs-${PV}.tar.bz2"
 #\
 #	      file://dcopidl-compile.patch "
@@ -21,9 +23,11 @@ do_configure_prepend() {
      echo "HEADERS += main.h " >> dcopidl2cpp.pro
 }
 
-do_stage() {
-     install -d ${STAGING_BINDIR}
-     install -m 0755 dcopidl2cpp ${STAGING_BINDIR}
+NATIVE_INSTALL_WORKS = "1"
+
+do_install() {
+     install -d ${D}${bindir}
+     install -m 0755 dcopidl2cpp ${D}${bindir}
 }
 
 SRC_URI[md5sum] = "acaa37e79e840d10dca326277a20863c"
-- 
1.6.3.3



