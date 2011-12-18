Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rc5OF-0000CD-TN
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Dec 2011 02:18:11 +0100
Received: (qmail invoked by alias); 18 Dec 2011 01:11:11 -0000
Received: from p5B0A29E7.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.41.231]
	by mail.gmx.net (mp005) with SMTP; 18 Dec 2011 02:11:11 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+ADIQCmkiATIddM0ya7VZvmyP/BxYu1nHRO8wTVA
	/M2amnaxmKwi5J
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Dec 2011 02:11:34 +0100
Message-Id: <1324170694-11250-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] xfwm4: break runtime dependency loop
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
X-List-Received-Date: Sun, 18 Dec 2011 01:18:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

required since oe-core opkg update [1]

[1] http://cgit.openembedded.org/openembedded-core/commit/?id=2feba313c991170747381c7cf821a45c2cd04632

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb
index c1ad221..09f4cf6 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb
@@ -2,6 +2,8 @@ DESCRIPTION="Xfce4 Window Manager"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
+PR = "r1"
+
 DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbus-glib startup-notification"
 
 inherit xfce update-alternatives
@@ -27,7 +29,7 @@ ALTERNATIVE_LINK = "${bindir}/x-window-manager"
 ALTERNATIVE_PATH = "${bindir}/xfce4-session"
 ALTERNATIVE_PRIORITY = "30"
 
-RDEPENDS_${PN} = "xfwm4-theme-default"
+RRECOMMENDS_${PN} = "xfwm4-theme-default"
 FILES_${PN} += "${libdir}/xfce4/xfwm4/helper-dialog \
                 ${datadir}/xfwm4/defaults \
                "
-- 
1.7.4.4



