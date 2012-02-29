Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S2kNt-0005dY-Me
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 15:20:01 +0100
Received: by wgbds1 with SMTP id ds1so3262622wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Feb 2012 06:11:33 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.107.2 as permitted sender)
	client-ip=10.180.107.2; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.107.2 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.107.2])
	by 10.180.107.2 with SMTP id gy2mr1213002wib.12.1330524693333 (num_hops
	= 1); Wed, 29 Feb 2012 06:11:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.107.2 with SMTP id gy2mr983296wib.12.1330524693114;
	Wed, 29 Feb 2012 06:11:33 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id er8sm87763175wib.1.2012.02.29.06.11.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Feb 2012 06:11:32 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Feb 2012 15:11:25 +0100
Message-Id: <1330524685-8908-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQk3UEIARSVl2zq1sX8gbIcDYm32Lqf2WIpsVtFbz4RMr5ZslEPe0SOlGCfu0o1vXBj8c4pD
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] gtk+3: update to 3.2.3
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
X-List-Received-Date: Wed, 29 Feb 2012 14:20:01 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../gtk+/{gtk+3_3.2.2.bb => gtk+3_3.2.3.bb}        |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/gtk+/{gtk+3_3.2.2.bb => gtk+3_3.2.3.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb
rename to meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
index 0f1ec69..2dc4c64 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "http://www.gtk.org"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
 
-PR = "r1"
-
 DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
            gtk-doc-native docbook-utils-native libxrandr libgcrypt \
            libxdamage libxrender libxcomposite cairo gdk-pixbuf gtk+-native"
@@ -18,9 +16,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
                     file://tests/testgtk.c;endline=27;md5=ac85be7b810a1e9b00479af8e2018053"
 
-SRC_URI = "http://download.gnome.org/sources/gtk+/3.2/gtk+-${PV}.tar.bz2"
-SRC_URI[md5sum] = "afc3a739d6ff39d3b81cf69119833c46"
-SRC_URI[sha256sum] = "feef531b33f379015537f1aeb31e5121776671e5e8c2aa3e58ca1f8fac51e802"
+SRC_URI = "http://download.gnome.org/sources/gtk+/3.2/gtk+-${PV}.tar.xz"
+SRC_URI[md5sum] = "b4edcc69e39159dd7be17828249afb46"
+SRC_URI[sha256sum] = "e2cf20f2510ebbc7be122a1a33dd1f472a7d06aaf16b4f2a63eb048cd9141d3d"
 
 inherit autotools pkgconfig
 
-- 
1.7.2.5



