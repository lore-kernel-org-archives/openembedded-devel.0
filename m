Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OqNUR-0003oE-NL
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 11:50:53 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OqNTt-0001HH-BB from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 02:50:17 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 31 Aug 2010 11:50:15 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 15:49:40 +0600
Message-Id: <1283248180-32646-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 31 Aug 2010 09:50:15.0983 (UTC)
	FILETIME=[E9F7A3F0:01CB48F1]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tk: Run oe-stylize.py script and change the recipe accordingly
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
X-List-Received-Date: Tue, 31 Aug 2010 09:50:54 -0000

* Run the oe-stylize.py script and modify the recipe according to the output of the script.


Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/tcltk/tk_8.5.8.bb |   19 +++++++++----------
 1 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/recipes/tcltk/tk_8.5.8.bb b/recipes/tcltk/tk_8.5.8.bb
index 7637b7b..01d09e8 100644
--- a/recipes/tcltk/tk_8.5.8.bb
+++ b/recipes/tcltk/tk_8.5.8.bb
@@ -1,9 +1,8 @@
 DESCRIPTION = "Tool Command Language ToolKit Extension"
-LICENSE = "tcl"
-SECTION = "devel/tcltk"
 HOMEPAGE = "http://tcl.sourceforge.net"
+SECTION = "devel/tcltk"
+LICENSE = "tcl"
 DEPENDS = "tcl virtual/libx11 libxt"
-
 PR = "r1"
 
 SRC_URI = "\
@@ -16,7 +15,6 @@ SRC_URI = "\
   file://tkprivate.diff;striplevel=2 \
   file://fix-xft.diff \
 "
-
 SRC_URI[md5sum] = "13bf90602e16fc530e05196431021dc6"
 SRC_URI[sha256sum] = "9737da5c30e631281062b6acbb4753840f9e95657c78e37657d9c520589ab2d4"
 
@@ -31,16 +29,17 @@ EXTRA_OECONF = "\
   --x-libraries=${STAGING_LIBDIR} \
 "
 
-BINCONFIG_GLOB = "*Config.sh"
-
 do_install() {
-	autotools_do_install
-	mv libtk8.5.so libtk8.5.so.0
-	oe_libinstall -so libtk8.5 ${D}${libdir}
-	ln -sf wish8.5 ${D}${bindir}/wish
+        autotools_do_install
+        mv libtk8.5.so libtk8.5.so.0
+        oe_libinstall -so libtk8.5 ${D}${libdir}
+        ln -sf wish8.5 ${D}${bindir}/wish
 }
 
 PACKAGES =+ "${PN}-lib"
+
 FILES_${PN}-lib = "${libdir}/libtk8.5.so.*"
 FILES_${PN} += "${libdir}/tk*"
 
+BINCONFIG_GLOB = "*Config.sh"
+
-- 
1.6.3.3



