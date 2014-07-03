Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41E2A65CC1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jul 2014 02:25:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s632Q1NH029727
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Jul 2014 19:26:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Jul 2014 19:26:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Jul 2014 19:25:54 -0700
Message-ID: <1404354360-978-3-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404354360-978-1-git-send-email-liezhi.yang@windriver.com>
References: <1404354360-978-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome] [PATCH 2/8] meta-gnome: use BPN in SRC_URI
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
X-List-Received-Date: Thu, 03 Jul 2014 02:26:00 -0000
Content-Type: text/plain

Fixed SRC_URI:
* ${PN} -> ${BPN}, use ${BP} if it was ${PN}-${PV}
* ${P} -> ${BP}

Otherwise we would meet do_fetch errors when we do the multilib, native
or nativesdk build.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-apps/gnome-mplayer/gmtk_1.0.5.bb       |    2 +-
 .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |    2 +-
 .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |    2 +-
 .../nonworking/gcalctool/gcalctool_5.32.0.bb       |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
index 6dc5159..7283409 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = "gtk+ alsa-lib glib-2.0 virtual/libx11"
 
-SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.gz"
+SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
 SRC_URI[md5sum] = "e06e9ca8d61d74910343bb3ef4348f7f"
 SRC_URI[sha256sum] = "a07130d62719e8c1244f8405dd97445798df5204fc0f3f2f2b669b125114b468"
 
diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
index 4be94c5..c5ac6e2 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
@@ -10,7 +10,7 @@ PR = "r2"
 
 DEPENDS = "gmtk gtk+ alsa-lib libnotify glib-2.0 dbus-glib virtual/libx11 libxscrnsaver"
 
-SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.gz"
+SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
 SRC_URI[md5sum] = "1d3ab24c5501b5528e357931ca4dc6da"
 SRC_URI[sha256sum] = "ac3c179345baecb4ca5237782aa33e83253a87bf8b42ce6eb3a9207a340f61b2"
 
diff --git a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
index 3fb5776..3cd7910 100644
--- a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
+++ b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
@@ -7,7 +7,7 @@ PR = "r4"
 
 inherit autotools pkgconfig
 
-SRC_URI = "http://burtonini.com/temp/${PN}-${PV}.tar.gz \
+SRC_URI = "http://burtonini.com/temp/${BP}.tar.gz \
     file://gtkstylus.sh"
 SRC_URI[md5sum] = "fa1c82cd9fd2fafd7ff10d78eb5781c5"
 SRC_URI[sha256sum] = "383e0a22a537f653b8d41688277560f95678a042967198085ec7caa1a5cc2f4c"
diff --git a/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb b/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
index f16551f..4812fe3 100644
--- a/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
+++ b/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-SRC_URI = "http://download.gnome.org/sources/${PN}/${SHRT_VER}/${PN}-${PV}.tar.gz"
+SRC_URI = "http://download.gnome.org/sources/${BPN}/${SHRT_VER}/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "48db927c6e7ee1d5395f953a8c184c98"
 SRC_URI[sha256sum] = "346f645c0fdef900642f6e9a2c18e7ba9a7ca9bc62fe2b08eb418f065a425c89"
-- 
1.7.9.5


