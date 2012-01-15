Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RmGAx-0002LK-7H
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 03:50:31 +0100
Received: (qmail invoked by alias); 15 Jan 2012 02:42:57 -0000
Received: from p5B0A0A21.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.10.33]
	by mail.gmx.net (mp028) with SMTP; 15 Jan 2012 03:42:57 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/GoPhkhGfGVI9O7uhlZDncIgprWcA4grbKYurMpn
	dsi4lOUMv4kURk
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Jan 2012 03:44:12 +0100
Message-Id: <1326595452-14323-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] ristretto: update to 0.3.2
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
X-List-Received-Date: Sun, 15 Jan 2012 02:50:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../ristretto/files/add-locale_h.patch             |   13 -------------
 .../{ristretto_0.3.0.bb => ristretto_0.3.2.bb}     |    7 ++-----
 2 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/ristretto/files/add-locale_h.patch
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.3.0.bb => ristretto_0.3.2.bb} (64%)

diff --git a/meta-xfce/recipes-apps/ristretto/files/add-locale_h.patch b/meta-xfce/recipes-apps/ristretto/files/add-locale_h.patch
deleted file mode 100644
index a149500..0000000
--- a/meta-xfce/recipes-apps/ristretto/files/add-locale_h.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Applied in git repo
----
---- a/src/util.c.old	2011-11-05 22:12:00.000000000 +0100
-+++ b/src/util.c	2012-01-03 16:18:21.435234961 +0100
-@@ -18,7 +18,7 @@
- 
- #include <config.h>
- #include <glib.h>
--
-+#include <locale.h>
- #include <exo/exo.h>
- 
- 
diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.0.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.2.bb
similarity index 64%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.3.0.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.3.2.bb
index 4fb28f0..3a167c1 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.0.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.2.bb
@@ -4,13 +4,10 @@ SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
-PR = "r1"
 
 inherit xfce-app
 
-SRC_URI += "file://add-locale_h.patch"
-
 RRECOMMENDS_${PN} += "tumbler"
 
-SRC_URI[md5sum] = "124c4e98f837e35c728b0ff1d9078b1a"
-SRC_URI[sha256sum] = "a8bf0aa8a18af4ad8d53cbfc918bc92db51b5446cf7ff09e7b988fe5c7b986e4"
+SRC_URI[md5sum] = "ab54fffe197c220bf26553c9a4f95658"
+SRC_URI[sha256sum] = "a28c9e472c329b5f3136ebea887dec5ba93a37d5562b493633161392aff5545f"
-- 
1.7.4.4



