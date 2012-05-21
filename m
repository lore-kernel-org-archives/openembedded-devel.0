Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTgx-0002Et-Nd
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:34:38 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEOREe009248
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:27 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEOR2q030693
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:27 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:24:27 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAp0008382;
	Mon, 21 May 2012 09:24:26 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:27 -0500
Message-ID: <1337610609-1173-29-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 28/70] libidl: Update LICENSE field version to LGPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:34:39 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2+ to
  reflect the real license version.
* This change was based on code inspection.
* This change has also been submitted to oe-core.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libidl/libidl-native_0.8.13.bb |    2 +-
 recipes/libidl/libidl.inc              |    2 +-
 recipes/libidl/libidl_0.8.13.bb        |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/libidl/libidl-native_0.8.13.bb b/recipes/libidl/libidl-native_0.8.13.bb
index 834f4af..0fae990 100644
--- a/recipes/libidl/libidl-native_0.8.13.bb
+++ b/recipes/libidl/libidl-native_0.8.13.bb
@@ -2,7 +2,7 @@ SECTION = "libs"
 require libidl_${PV}.bb
 inherit native
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "bison-native glib-2.0-native"
 
diff --git a/recipes/libidl/libidl.inc b/recipes/libidl/libidl.inc
index 7a90a70..a402037 100644
--- a/recipes/libidl/libidl.inc
+++ b/recipes/libidl/libidl.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Library for parsing CORBA IDL files"
 SECTION = "x11/gnome/libs"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2+"
 
 inherit autotools pkgconfig
 
diff --git a/recipes/libidl/libidl_0.8.13.bb b/recipes/libidl/libidl_0.8.13.bb
index 141d802..c95b32f 100644
--- a/recipes/libidl/libidl_0.8.13.bb
+++ b/recipes/libidl/libidl_0.8.13.bb
@@ -2,7 +2,7 @@ require libidl.inc
 
 DEPENDS = "glib-2.0 flex-native libidl-native"
 
-PR = "r0"
+PR = "r1"
 
 BINCONFIG_GLOB = "*-config-2"
 inherit autotools pkgconfig binconfig
-- 
1.7.0.4



