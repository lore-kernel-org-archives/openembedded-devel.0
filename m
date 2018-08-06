Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A36774FD5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:54:28 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w768sSnx011206
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 01:54:28 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 01:54:28 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 01:54:08 -0700
Message-Id: <20180806085408.44739-11-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806085408.44739-1-kai.kang@windriver.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
Subject: [meta-xfce][PATCH 10/10] xfwm4: 4.12.4 -> 4.12.5
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
X-List-Received-Date: Mon, 06 Aug 2018 08:54:28 -0000

Upgrade xfwm4 from 4.12.4 to 4.12.5.
* add dependency libxinerama

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.4.bb => xfwm4_4.12.5.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.4.bb => xfwm4_4.12.5.bb} (73%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.5.bb
similarity index 73%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.5.bb
index a075f13b9..f90d8da59 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.5.bb
@@ -2,14 +2,14 @@ DESCRIPTION="Xfce4 Window Manager"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
-DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbus-glib startup-notification exo-native"
+DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui libxinerama xfconf libwnck dbus-glib startup-notification exo-native"
 
 inherit xfce update-alternatives distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "3ec136efc5387fd3b53cd66b684f52d7"
-SRC_URI[sha256sum] = "fa74048a75649a6e92df763a3cfb706d3fed1e1a6adf567f6693325a5a6efb36"
+SRC_URI[md5sum] = "61f6bc8b15c6a7361a58d875917e1791"
+SRC_URI[sha256sum] = "7775c02216666c2d023275e7ed6d85e57d965e5cc1407bb6a05c53cc38d8caca"
 
 python populate_packages_prepend () {
     themedir = d.expand('${datadir}/themes')
-- 
2.11.0


