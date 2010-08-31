Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OqOCh-0007kY-Vo
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 12:36:40 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OqOC5-0005zo-7Z from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 03:35:57 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 31 Aug 2010 12:35:55 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 16:34:53 +0600
Message-Id: <1283250893-13141-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 31 Aug 2010 10:35:55.0565 (UTC)
	FILETIME=[4AE2ADD0:01CB48F8]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tk: Merge target and native packages using BBCLASSEXTEND
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
X-List-Received-Date: Tue, 31 Aug 2010 10:36:41 -0000

* Set BBCLASSEXTEND to native
* Bump PR to "r2"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/tcltk/tk_8.5.8.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/tcltk/tk_8.5.8.bb b/recipes/tcltk/tk_8.5.8.bb
index 01d09e8..5dcd61a 100644
--- a/recipes/tcltk/tk_8.5.8.bb
+++ b/recipes/tcltk/tk_8.5.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tcl.sourceforge.net"
 SECTION = "devel/tcltk"
 LICENSE = "tcl"
 DEPENDS = "tcl virtual/libx11 libxt"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "\
   ${SOURCEFORGE_MIRROR}/tcl/tk${PV}-src.tar.gz \
@@ -42,4 +42,5 @@ FILES_${PN}-lib = "${libdir}/libtk8.5.so.*"
 FILES_${PN} += "${libdir}/tk*"
 
 BINCONFIG_GLOB = "*Config.sh"
+BBCLASSEXTEND = "native"
 
-- 
1.6.3.3



