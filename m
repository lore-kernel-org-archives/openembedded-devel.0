Return-Path: <denis@denix.org>
X-Greylist: delayed 617 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Nov 2014 00:09:13 UTC
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 8EFEB6FC68
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 00:09:13 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NF00050U5RC0150@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	13 Nov 2014 18:09:12 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=LdSLMYbn c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=nlfdPq-F-3h-uJ_ZzXIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 05D9F2008C;	Thu,
	13 Nov 2014 19:09:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Nov 2014 19:09:10 -0500
Message-id: <1415923750-17942-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH 2/2] nativesdk-qtbase_git: re-add OEQt5Toolchain to SRC_URI
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
X-List-Received-Date: Fri, 14 Nov 2014 00:09:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

The file is expected by do_install(), but _git version resets SRC_URI.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 96d86db..095bee7 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -25,13 +25,18 @@ SRC_URI += "\
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
-"    
+"
 
 # specific for nativesdk-qtbase
 SRC_URI += " \
     file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
+# CMake's toolchain configuration of nativesdk-qtbase
+SRC_URI += " \
+    file://OEQt5Toolchain.cmake \
+"
+
 SRCREV = "06e706bdbb826b521389409b53079483fda5584a"
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
-- 
2.1.2


