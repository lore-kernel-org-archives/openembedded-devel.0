Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob23.registeredsite.com (atl4mhob23.registeredsite.com
	[209.17.115.117])
	by mail.openembedded.org (Postfix) with ESMTP id 3BFD170016
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 07:30:04 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.205])
	by atl4mhob23.registeredsite.com (8.14.4/8.14.4) with ESMTP id
	u9V7U4NS099678 for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 03:30:04 -0400
Received: (qmail 21838 invoked by uid 0); 31 Oct 2016 07:30:04 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 31 Oct 2016 07:30:04 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 08:29:23 +0100
Message-Id: <1477898963-3759-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt4][PATCH] qt4-embedded: Default to build tslib when touchscreen is defined
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
X-List-Received-Date: Mon, 31 Oct 2016 07:30:06 -0000

When "touchscreen" is in the MACHINE_FEATURES, packagegroup-core-qt4e
will RDEPEND on qt4-embedded-plugin-mousedriver-tslib, but that
library is not being built by default, resulting in an error like:
opkg_prepare_url_for_install: Couldn't find anything to satisfy 'qt4-embedded-plugin-mousedriver-tslib'.

To prevent that from happening, add "tslib" to the default
PACKAGECONFIG when touchscreen is defined.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
Applies to both morty and master branches.

 recipes-qt4/qt4/qt4-embedded.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt4/qt4/qt4-embedded.inc b/recipes-qt4/qt4/qt4-embedded.inc
index 1122080..9c2d9da 100644
--- a/recipes-qt4/qt4/qt4-embedded.inc
+++ b/recipes-qt4/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt-project.org/"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= '${@bb.utils.contains("MACHINE_FEATURES", "touchscreen", "tslib", "",d)}'
 PACKAGECONFIG[tslib] = " -plugin-mouse-tslib, ,tslib"
 
 QT4EDEPENDS = ""
-- 
1.9.1


