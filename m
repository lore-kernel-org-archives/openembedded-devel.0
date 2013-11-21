Return-Path: <ulf@emagii.com>
Received: from smtprelay-b32.telenor.se (smtprelay-b32.telenor.se
	[213.150.131.21])
	by mail.openembedded.org (Postfix) with ESMTP id A809F6D700
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 08:24:13 +0000 (UTC)
Received: from ipb5.telenor.se (ipb5.telenor.se [195.54.127.168])
	by smtprelay-b32.telenor.se (Postfix) with ESMTP id C7D97C3EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 09:24:11 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuVzAHrCjVJT4zlmPGdsb2JhbABYgwYBATeIBa5fhySBHBcDAQEBATg1gncBCiNPSwotiAUBtEYBjDyPax2EHAOYEpU5Ow
X-IronPort-AV: E=Sophos;i="4.93,742,1378850400"; d="scan'208";a="433849269"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	Hydra.bredbandsbolaget.se) ([83.227.57.102])
	by ipb5.telenor.se with ESMTP; 21 Nov 2013 09:23:53 +0100
From: Ulf Samuelsson <ulf@emagii.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Nov 2013 09:23:50 +0100
Message-Id: <1385022230-30471-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] pangomm,goffice: Add missing dependencies
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
X-List-Received-Date: Thu, 21 Nov 2013 08:24:13 -0000

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 .../recipes-support/goffice/goffice_0.10.1.bb      |    5 ++++-
 meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb   |    2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
index 5b46d99..77dd60e 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
@@ -3,7 +3,10 @@ DESCRIPTION="Gnome Office Library"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6dc33ff21e1ba1ac1a2a1069d361e29e"
 
-DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf libpcre libxml2 libart-lgpl"
+DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf libpcre libxml2 libart-lgpl librsvg gdk-pixbuf"
+
+# The following dependencies exists, but are they handled in OpenEmbedded?
+# DEPENDS = "gobject-2.0 gmodule-2.0 gio-2.0"
 
 inherit gnome pkgconfig perlnative
 
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
index 4419113..302062c 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 
 PR = "r2"
 
-DEPENDS = "mm-common cairomm glibmm"
+DEPENDS = "mm-common cairomm glibmm pango"
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-- 
1.7.9.5


