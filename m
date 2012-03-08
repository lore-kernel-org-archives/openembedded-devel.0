Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1S5fEB-0002kf-0H
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 16:26:03 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id 8C022F811DF; Thu,  8 Mar 2012 08:11:47 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 08:11:46 -0700
Message-Id: <1331219506-28503-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [meta-oe] midori: needs GNOME icons to function
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
X-List-Received-Date: Thu, 08 Mar 2012 15:26:03 -0000

Without GNOME icons installed, e.g. when using only core-image-sato,
midori dies violently:
   # midori
   The configuration couldn't be loaded: No such file or directory
   (midori:2915): Gtk-WARNING **: Error loading theme icon 'stock_new-tab' for stock: Icon 'stock_new-tab' not present in theme
   (midori:2915): Gtk-WARNING **: Error loading theme icon 'bookmark-new' for stock: Icon 'bookmark-new' not present in theme
   (midori:2915): Gtk-WARNING **: Error loading theme icon 'stock_add-bookmark' for stock: Icon 'stock_add-bookmark' not present in theme
   Segmentation fault

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/recipes-connectivity/midori/midori.inc     |    2 +-
 .../recipes-connectivity/midori/midori_0.4.3.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/midori/midori.inc b/meta-oe/recipes-connectivity/midori/midori.inc
index 6837bfb..4c7147e 100644
--- a/meta-oe/recipes-connectivity/midori/midori.inc
+++ b/meta-oe/recipes-connectivity/midori/midori.inc
@@ -31,7 +31,7 @@ do_install() {
 	oe_runmake DESTDIR=${D} install
 }
 
-RRECOMMENDS_${PN} += "glib-networking ca-certificates"
+RRECOMMENDS_${PN} += "glib-networking ca-certificates gnome-icon-theme"
 
 FILES_${PN}-dev += "${datadir}/vala/vapi"
 
diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
index 635eb9e..195bcb3 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
@@ -1,6 +1,6 @@
 require midori.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
            file://waf \
-- 
1.7.7.6



