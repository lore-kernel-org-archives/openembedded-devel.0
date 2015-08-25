Return-Path: <denis@denix.org>
X-Greylist: delayed 3615 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Aug 2015 15:39:02 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4788F73DF0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 15:39:02 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTN00BGZ7BYFE50@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	25 Aug 2015 09:38:23 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=CLFTUwVk9syMudFOQgEA:9 a=Bb0hTPAH1TY5xhbP:21
	a=9MjZQO4zWxXRR3kK:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 99FF8161BAB;	Tue,
	25 Aug 2015 10:38:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2015 10:38:13 -0400
Message-id: <1440513493-23072-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH] qtbase: update patch that increases configured path length for nativesdk
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
X-List-Received-Date: Tue, 25 Aug 2015 15:39:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

With 5.5, the array of paths got split into at least 3 separate variables,
but only one of them was increased. Similarly, increase the other 2.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ump-path-length-from-256-to-512-character.patch | 27 ++++++++++++++--------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
index 91b1353..8f95480 100644
--- a/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,29 +1,36 @@
-From fc3819b1f69278e9d66095d1faf33ae0e5a70eb6 Mon Sep 17 00:00:00 2001
+From fe6405c5a628c168e42138ac82ba70bb8c909d0b Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 06/10] configure: bump path length from 256 to 512 characters
+Date: Tue, 25 Aug 2015 10:05:15 -0400
+Subject: [PATCH] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
 
+Also update length of EXT_PREFIX and HOST_PREFIX now.
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ configure | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 548dd0d..b8f1fb9 100755
+index 22867a7..fe18487 100755
 --- a/configure
 +++ b/configure
-@@ -3850,7 +3850,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3851,10 +3851,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
  
  /* Installation Info */
 -static const char qt_configure_prefix_path_str       [256 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
 +static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
  #ifdef QT_BUILD_QMAKE
- static const char qt_configure_ext_prefix_path_str   [256 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
- static const char qt_configure_host_prefix_path_str  [256 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
+-static const char qt_configure_ext_prefix_path_str   [256 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
+-static const char qt_configure_host_prefix_path_str  [256 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
++static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
++static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
+ #endif
+ 
+ static const short qt_configure_str_offsets[] = {
 -- 
-2.5.0
+2.2.0
 
-- 
2.2.0


