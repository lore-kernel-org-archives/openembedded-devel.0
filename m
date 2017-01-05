Return-Path: <raphael.freudiger@siemens.com>
X-Greylist: delayed 546 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Jan 2017 07:03:28 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA746071F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 07:03:28 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v056sMrt032638
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Jan 2017 07:54:22 +0100
Received: from bt-builds.hqs.sbt.siemens.com (MD1AT2FC.ad001.siemens.net
	[139.16.76.180])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v056sL1Y010516;
	Thu, 5 Jan 2017 07:54:22 +0100
Received: from bt-builds.hqs.sbt.siemens.com (localhost [127.0.0.1])
	by bt-builds.hqs.sbt.siemens.com (Postfix) with ESMTP id 30FBA21C0C62; 
	Thu,  5 Jan 2017 07:54:22 +0100 (CET)
From: Raphael Freudiger <raphael.freudiger@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 07:54:15 +0100
Message-Id: <1483599255-18651-1-git-send-email-raphael.freudiger@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH] qtwayland: fix typo
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
X-List-Received-Date: Thu, 05 Jan 2017 07:03:31 -0000

---
 recipes-qt/qt5/qtwayland_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 44dcb98..99aae29 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -33,7 +33,7 @@ PACKAGECONFIG[wayland-client] = "-feature-wayland-client,-no-feature-wayland-cli
 PACKAGECONFIG[wayland-server] = "-feature-wayland-server,-no-feature-wayland-server"
 PACKAGECONFIG[xcomposite-egl] = "-feature-xcomposite-egl,-no-feature-xcomposite-egl,libxcomposite"
 PACKAGECONFIG[xcomposite-glx] = "-feature-xcomposite-glx,-no-feature-xcomposite-glx,virtual/mesa"
-PACKAGECONFIG[wayland-egl] = "-feature-wayland-egl,no-feature-wayland-egl,virtual/egl"
+PACKAGECONFIG[wayland-egl] = "-feature-wayland-egl,-no-feature-wayland-egl,virtual/egl"
 PACKAGECONFIG[wayland-brcm] = "-feature-wayland-brcm,-no-feature-wayland-brcm,virtual/egl"
 PACKAGECONFIG[drm-egl-server] = "-feature-drm-egl-server,-no-feature-drm-egl-server,libdrm virtual/egl"
 PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature-libhybris-egl-server,libhybris"
-- 
2.1.4


