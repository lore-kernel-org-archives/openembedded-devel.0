Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SSxxJ-0004Gq-6K
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 May 2012 00:04:57 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4BLn5QX030679
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2012 16:49:05 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4BLn51K002457
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2012 16:49:05 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 11 May 2012 16:49:03 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4BLn24U030037;
	Fri, 11 May 2012 16:49:03 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 May 2012 16:52:23 -0500
Message-ID: <1336773144-9706-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [meta-oe][PATCH 1/2] libidl: Update LICENSE to contain actual version
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
X-List-Received-Date: Fri, 11 May 2012 22:04:57 -0000
Content-Type: text/plain

* Updated the LICENSE field to contain the version of the LGPL
  being used which is LGPLv2+
* Update the PR to reflect this license change

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-gnome/recipes-gnome/libidl/libidl.inc       |    2 +-
 meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libidl/libidl.inc b/meta-gnome/recipes-gnome/libidl/libidl.inc
index 7a90a70..a402037 100644
--- a/meta-gnome/recipes-gnome/libidl/libidl.inc
+++ b/meta-gnome/recipes-gnome/libidl/libidl.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Library for parsing CORBA IDL files"
 SECTION = "x11/gnome/libs"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2+"
 
 inherit autotools pkgconfig
 
diff --git a/meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb b/meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb
index 732178d..d658cf8 100644
--- a/meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb
+++ b/meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "glib-2.0 flex-native libidl-native"
 
-PR = "r0"
+PR = "r1"
 
 BINCONFIG_GLOB = "*-config-2"
 inherit autotools pkgconfig binconfig
-- 
1.7.0.4



