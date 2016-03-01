Return-Path: <teemu.holappa@theqtcompany.com>
X-Greylist: delayed 361 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 01 Mar 2016 07:49:59 UTC
Received: from smtp.digia.com (smtp.digia.com [91.217.248.73])
	by mail.openembedded.org (Postfix) with ESMTP id 89E7E73FA3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 07:49:59 +0000 (UTC)
Received: from teholapp.it.local (unknown [10.9.5.17])
	by smtp.digia.com (Postfix) with ESMTPS id 003117F99A;
	Tue,  1 Mar 2016 09:43:56 +0200 (EET)
From: Teemu Holappa <teemu.holappa@theqtcompany.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Mar 2016 09:43:34 +0200
Message-Id: <1456818214-5466-1-git-send-email-teemu.holappa@theqtcompany.com>
X-Mailer: git-send-email 2.7.2
Subject: [meta-qt5][PATCH] Change dependency from virtual/mesa to drm in the kms packageconfig.
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
X-List-Received-Date: Tue, 01 Mar 2016 07:50:00 -0000

In some configurations there no provider for virtual/mesa, but only drm libaries.
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index bf56741..1d32a0b 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -117,7 +117,7 @@ PACKAGECONFIG[gtkstyle] = "-gtkstyle,-no-gtkstyle,gtk+"
 PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
 PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
 PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
-PACKAGECONFIG[kms] = "-kms,-no-kms,virtual/mesa virtual/egl"
+PACKAGECONFIG[kms] = "-kms,-no-kms,drm virtual/egl"
 # needed for qtwebkit
 PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
 PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
-- 
2.7.2


