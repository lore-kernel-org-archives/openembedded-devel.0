Return-Path: <fabien.lahoudere@collabora.com>
X-Greylist: delayed 582 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Nov 2018 16:23:58 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id E43906BBF2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 16:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id B21992610E1
From: Fabien Lahoudere <fabien.lahoudere@collabora.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 17:14:06 +0100
Message-Id: <1542730446-30253-1-git-send-email-fabien.lahoudere@collabora.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] evince: Drop x11 requirement
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
X-List-Received-Date: Tue, 20 Nov 2018 16:23:59 -0000

evince works fine in a wayland only distribution.
x11 requirement is not needed.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
---
 meta-gnome/recipes-gnome/evince/evince_3.28.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
index 8bf8a04..01f581a 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
@@ -6,8 +6,6 @@ DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-d
 
 inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
 
-REQUIRED_DISTRO_FEATURES = "x11"
-
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0001-help-remove-YELP-macro.patch \
            file://0001-Add-format-attribute-to-_synctex_malloc.patch \
-- 
1.8.3.1


