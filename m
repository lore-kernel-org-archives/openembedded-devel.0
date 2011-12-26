Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rezz6-0000w8-2E
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Dec 2011 03:08:24 +0100
Received: (qmail invoked by alias); 26 Dec 2011 02:01:02 -0000
Received: from p4FDF1C30.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.48]
	by mail.gmx.net (mp072) with SMTP; 26 Dec 2011 03:01:02 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/VZ81zVQvVq1+fj8KJ/3XZliUUtAs0KrkEMeYJTf
	IZYDXJ7WZOGM2Y
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Dec 2011 03:01:59 +0100
Message-Id: <1324864919-17138-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1324864919-17138-1-git-send-email-schnitzeltony@gmx.de>
References: <1324864919-17138-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 3/3] libxfce4ui: update to 4.8.1
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
X-List-Received-Date: Mon, 26 Dec 2011 02:08:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build tested incremental & from empty build dir
* run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../{libxfce4ui_4.8.0.bb => libxfce4ui_4.8.1.bb}   |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.8.0.bb => libxfce4ui_4.8.1.bb} (71%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb
similarity index 71%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.0.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb
index 6d299cd..0887c38 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb
@@ -4,11 +4,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "gtk+ gettext intltool libxfce4util startup-notification xfconf"
 
-PR = "r1"
-
 inherit xfce
 
 FILES_${PN} += "${libdir}/xfce4/modules ${libdir}/libglade/2.0/*.so ${datadir}/xfce4/mime ${datadir}/icons/hicolor"
 
-SRC_URI[md5sum] = "df9acb3328dff905bd0777b84532b69f"
-SRC_URI[sha256sum] = "21f67fd004653440bfdb44874ed69c9806b4784978ec068d0b1c7012864ba339"
+SRC_URI[md5sum] = "30bd432dd0f19305e846a122d4c7c6fe"
+SRC_URI[sha256sum] = "39cbed29da06960074014b74abc2ba57db49dc81ab8995fb2160579c51669956"
-- 
1.7.4.4



