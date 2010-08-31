Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OqOA8-0003fn-1Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 12:34:20 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OqO9P-0005kq-Tf from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 03:33:12 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 31 Aug 2010 12:33:09 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 16:32:34 +0600
Message-Id: <1283250754-13068-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 31 Aug 2010 10:33:09.0329 (UTC)
	FILETIME=[E7CD1410:01CB48F7]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tcl: Merged native and target packages using BBCLASSEXTEND
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
X-List-Received-Date: Tue, 31 Aug 2010 10:34:22 -0000

* Set BBCLASSEXTEND to native.
* Change /usr/include/tcl-private to ${includedir}/tcl-private so that it can be used for native package.
* Bump PR to "r8"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/tcltk/tcl_8.5.8.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/tcltk/tcl_8.5.8.bb b/recipes/tcltk/tcl_8.5.8.bb
index e8905f0..8630240 100644
--- a/recipes/tcltk/tcl_8.5.8.bb
+++ b/recipes/tcltk/tcl_8.5.8.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Tool Command Language"
 HOMEPAGE = "http://tcl.sourceforge.net"
 SECTION = "devel/tcltk"
 LICENSE = "tcl"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "\
   ${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
@@ -48,8 +48,9 @@ FILES_${PN} += "${libdir}/tcl*"
 FILES_${PN}-dev += "${libdir}/tclConfig.sh"
 
 BINCONFIG_GLOB = "*Config.sh"
+BBCLASSEXTEND = "native"
 
 tcl_sysroot() {
-        sed -i 's:/usr/include/tcl-private:${STAGING_INCDIR}/tcl-${PV}:' tclConfig.sh
+        sed -i 's:${includedir}/tcl-private:${STAGING_INCDIR}/tcl-${PV}:' tclConfig.sh
 }
 
-- 
1.6.3.3



