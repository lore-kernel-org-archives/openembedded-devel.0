Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E54CA60069
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2017 03:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3826520AAE;
	Sat, 14 Jan 2017 03:13:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fJ02TKm_FgDe; Sat, 14 Jan 2017 03:13:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 17FA3208D7;
	Sat, 14 Jan 2017 03:13:48 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 83A5A16231E;
	Fri, 13 Jan 2017 22:13:47 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jan 2017 22:13:46 -0500
Message-Id: <1484363626-12770-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][morty-next][PATCH] qtwebengine: update SRCREV due to old commit no longer being available
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Jan 2017 03:13:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Previous commit used for 5.7.1 baseline is no longer available on 5.7 branch.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 4712441..210f791 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -122,7 +122,7 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "9cc97f0c63049a8076476acc89c875c9e240abfb"
+SRCREV_qtwebengine = "6766290699acd0d73c81cf690012d52729e518b9"
 # This is in git submodule, but we're using the latest in 49-based
 # SRCREV_chromium = "c109a95a067af783e48f93d1cdeca870cda98878"
 SRCREV_chromium = "b3c79e92f0a631273b639af171e59f4c367ae02e"
-- 
2.7.4


