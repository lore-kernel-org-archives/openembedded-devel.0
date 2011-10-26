Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RJDAp-0005JK-Ma
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 01:46:19 +0200
Received: (qmail invoked by alias); 26 Oct 2011 23:40:19 -0000
Received: from p4FDF0B1A.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.11.26]
	by mail.gmx.net (mp070) with SMTP; 27 Oct 2011 01:40:19 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/xI2IG3gPx99Iyevm18J49vcvWjizx+ygt5sQ7K5
	jvHhq4MSIpYqb7
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Oct 2011 01:45:02 +0200
Message-Id: <1319672704-7181-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 1/3] xfce-app.bbclass: just set SRC_URI commmon to most xfce-apps
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
X-List-Received-Date: Wed, 26 Oct 2011 23:46:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build tested with source download for xfce4-notifyd and xfce4-screenshooter
* run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/classes/xfce-app.bbclass                 |    4 ++++
 .../xfce4-notifyd/xfce4-notifyd_0.2.2.bb           |    5 +----
 .../xfce4-screenshooter_1.8.0.bb                   |    7 +------
 3 files changed, 6 insertions(+), 10 deletions(-)
 create mode 100644 meta-xfce/classes/xfce-app.bbclass

diff --git a/meta-xfce/classes/xfce-app.bbclass b/meta-xfce/classes/xfce-app.bbclass
new file mode 100644
index 0000000..c60ad3d
--- /dev/null
+++ b/meta-xfce/classes/xfce-app.bbclass
@@ -0,0 +1,4 @@
+inherit xfce
+
+SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
index 4fea1de..0ee6da3 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
@@ -6,10 +6,7 @@ DEPENDS = "libxfce4util libxfce4ui xfconf gtk+ dbus dbus-glib"
 
 PR = "r0"
 
-inherit xfce
-
-# SRC_URI must follow inherited one
-SRC_URI = "http://archive.xfce.org/src/apps/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2"
+inherit xfce-app
 
 FILES_${PN} += " \
     ${libdir}/xfce4/notifyd \
diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb
index ef409c1..2362b8a 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb
@@ -7,12 +7,7 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 PR = "r0"
 
-inherit xfce
-
-# SRC_URI must follow inherited one
-# decoded to e.g. http://archive.xfce.org/src/apps/xfce4-screenshooter/1.8/xfce4-screenshooter-1.8.0.tar.bz2
-SRC_URI = "http://archive.xfce.org/src/apps/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2 \
-"
+inherit xfce-app
 
 FILES_${PN} += "${datadir}/xfce4/panel-plugins/*"
 FILES_${PN}-dbg += "${libexecdir}/xfce4/panel-plugins/.debug"
-- 
1.7.4.4



