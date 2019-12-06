Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6757D076
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 08:21:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xB68LGks015543
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 6 Dec 2019 00:21:17 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 6 Dec 2019 00:21:03 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
Date: Fri, 6 Dec 2019 16:20:59 +0800
Message-ID: <20191206082100.14071-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 1/2] xfce4-panel-profiles: 1.0.8 -> 1.0.9
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
X-List-Received-Date: Fri, 06 Dec 2019 08:21:16 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfce4-panel-profiles from 1.0.8 to 1.0.9.

Release notes:

* New Features
  - Add Xfce 4.14 profile
* General
  - Suppress deprecation warnings
  - Rename launchers to be more explicit
  - Rename Xubuntu releases to version numbers instead of codenames
  - Unversion gimp desktop file to work with any release
* Bugs Fixed
  - Fix KeyError when processing some layouts (Xfce #14934)
  - Safely handle values that GLib cannot process (Xfce #14597)
* Updated translations

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...anel-profiles_1.0.8.bb => xfce4-panel-profiles_1.0.9.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-panel-profiles/{xfce4-panel-profiles_1.0.8.bb => xfce4-panel-profiles_1.0.9.bb} (73%)

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.9.bb
similarity index 73%
rename from meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb
rename to meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.9.bb
index 467e0953c..9c9ae94fc 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.9.bb
@@ -9,9 +9,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "intltool-native"
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "bc75a143423fba3a82f114f47e86580c"
-SRC_URI[sha256sum] = "a69e20f5e637319e14898b5c13ff7ba31d001a6e38e7516d70dbfd7600ad72db"
+SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2"
+SRC_URI[md5sum] = "bee3e251e45ade0ea349366461d6e200"
+SRC_URI[sha256sum] = "a8c00af838e85d00600dbf442c8741aa21a332fbceba849e0820560630a6e0ce"
 
 do_configure() {
     # special configure - no autotools...
-- 
2.17.1


