Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DEF771BA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:54:26 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w768sQWa011200
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 01:54:26 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 01:54:26 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 01:54:06 -0700
Message-Id: <20180806085408.44739-9-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806085408.44739-1-kai.kang@windriver.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
Subject: [meta-xfce][PATCH 08/10] xfce4-session: 4.12.1 -> 4.13.0
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
X-List-Received-Date: Mon, 06 Aug 2018 08:54:26 -0000

Upgrade xfce4-session from 4.12.1 to 4.13.0

* replace dependency libwnck with libwnck3

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-session_4.12.1.bb => xfce4-session_4.13.0.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.12.1.bb => xfce4-session_4.13.0.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.0.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.0.bb
index 712597bca..351b2a18a 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.0.bb
@@ -2,18 +2,18 @@ SUMMARY = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
-DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf polkit"
+DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck3 dbus dbus-glib xfconf polkit"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth upower"
 
 inherit xfce update-alternatives distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "f4921fb2e606e74643daf1212263076c"
-SRC_URI[sha256sum] = "97d7f2a2d0af7f3623b68d1f04091e02913b28f9555dab8b0d26c8a1299d08fd"
 SRC_URI += " \
     file://0001-configure.in-hard-code-path-to-iceauth.patch \
 "
+SRC_URI[md5sum] = "0de0afd0c8dfe66f846c6c1c5ff3164a"
+SRC_URI[sha256sum] = "3e02b124c6a282d9b1af0b30696d5256b1c2e56618992b49062314ed3ea5d3a1"
 
 ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
-- 
2.11.0


