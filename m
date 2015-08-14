Return-Path: <denis@denix.org>
X-Greylist: delayed 3602 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Aug 2015 04:12:13 UTC
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 3C678766F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 04:12:13 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NT10005MY7MSNN1@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	13 Aug 2015 22:11:56 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=i6fy8AC3wzAVohLWxVUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D3BAF161B46;	Thu,
	13 Aug 2015 23:11:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2015 23:11:36 -0400
Message-id: <1439521896-14415-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH] qtbase_git: ensure fonts go into own subdir by creating it first
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
X-List-Received-Date: Fri, 14 Aug 2015 04:12:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

Sometimes, when ${OE_QMAKE_PATH_LIBS} is empty, "cp -a" ends up copying
font files there w/o preserving "fonts" directory, failing the following
chown command.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/qtbase_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 33620cb..737be93 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -226,7 +226,8 @@ do_install_append() {
     ### TODO: FIX
     # install fonts manually if they are missing
     if [ ! -d ${D}/${OE_QMAKE_PATH_LIBS}/fonts ]; then
-        cp -a ${S}/lib/fonts ${D}/${OE_QMAKE_PATH_LIBS}
+        mkdir -p ${D}/${OE_QMAKE_PATH_LIBS}/fonts
+        cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_LIBS}/fonts
         chown -R root:root ${D}/${OE_QMAKE_PATH_LIBS}/fonts
     fi
 
-- 
2.2.0


