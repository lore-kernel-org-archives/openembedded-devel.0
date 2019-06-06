Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA327BFB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 05:41:08 +0000 (UTC)
Received: from xps13.localdomain (50-37-95-192.mscw.id.frontiernet.net
	[50.37.95.192])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3D12D240003;
	Thu,  6 Jun 2019 05:41:07 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jun 2019 22:39:29 -0700
Message-Id: <20190606053929.10625-2-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606053929.10625-1-robert.joslyn@redrectangle.org>
References: <20190606053929.10625-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 2/2] xfce4-session: Reformat DEPENDS and RDEPENDS
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
X-List-Received-Date: Thu, 06 Jun 2019 05:41:08 -0000
Content-Transfer-Encoding: 8bit

Break them over multiple lines to make updates easier.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../xfce4-session/xfce4-session_4.13.2.bb     | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb
index d6e391430..dc44c4b0b 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb
@@ -2,8 +2,19 @@ SUMMARY = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
-DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck3 dbus dbus-glib xfconf polkit"
-RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth upower xrdb"
+
+DEPENDS = " \
+    dbus \
+    dbus-glib \
+    gtk+ \
+    libwnck3 \
+    libsm \
+    libxfce4ui \
+    libxfce4util \
+    polkit \
+    virtual/libx11 \
+    xfconf \
+"
 
 inherit xfce update-alternatives distro_features_check
 
@@ -26,3 +37,12 @@ FILES_${PN} += " \
     ${datadir}/themes/Default/balou/* \
     ${datadir}/polkit-1 \
 "
+
+RDEPENDS_${PN} = " \
+    dbus-x11 \
+    iceauth \
+    netbase \
+    upower \
+    xinit \
+    xrdb \
+"
-- 
2.21.0


