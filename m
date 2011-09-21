Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6G48-0002i3-4A
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 08:13:52 +0200
Received: (qmail invoked by alias); 21 Sep 2011 06:08:33 -0000
Received: from p4FDF1C6D.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.109]
	by mail.gmx.net (mp011) with SMTP; 21 Sep 2011 08:08:33 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/Tzg5JdHPTDiP6WMAvzeFjROmnVKsUOqzmt7X7NL
	htqKR1cyjP5f8b
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2011 08:11:57 +0200
Message-Id: <1316585520-18605-9-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
References: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 08/11] gtk-xfce-engine: Bump to version 2.9.0 & minor cleanup
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
X-List-Received-Date: Wed, 21 Sep 2011 06:13:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Added xfce4-dev-tools-native to DEPENDS error message was
  | gtk-xfce-engine-2.9.0/configure: line 12041: syntax error near unexpected token `GTK,'
  | gtk-xfce-engine-2.9.0/configure: line 12041: `XDT_CHECK_PACKAGE(GTK, gtk+-2.0, 2.20.0)'
* Added cairo to RDEPENDS_${PN} see [1]

[1] http://mail.xfce.org/pipermail/xfce/2011-September/029144.html

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 ...ce-engine_2.8.1.bb => gtk-xfce-engine_2.9.0.bb} |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/gtk-xfce-engine/{gtk-xfce-engine_2.8.1.bb => gtk-xfce-engine_2.9.0.bb} (60%)

diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.8.1.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
similarity index 60%
rename from meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.8.1.bb
rename to meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
index 91239bf..3585bcb 100644
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.8.1.bb
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "XFCE theme for GTK"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS += "gtk+"
+DEPENDS = "gtk+ xfce4-dev-tools-native"
+RDEPENDS_${PN} = "cairo"
 
 PR = "r0"
 
@@ -12,5 +13,5 @@ FILES_${PN} += "${libdir}/gtk-2.0/*/engines \
                 ${datadir}/themes/"
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
 
-SRC_URI[md5sum] = "8a6527b61b0554cda11d06f66a567314"
-SRC_URI[sha256sum] = "7cb0a52d74cded5c6a86894babd214de723bcf68771195db6d94acf5161be617"
+SRC_URI[md5sum] = "e2bc76ab5093ff8472e728e6d6ad5da2"
+SRC_URI[sha256sum] = "55604002526c800539f2a8a79e7df3bf23717f45e4bfab31c154c8d01caf3af7"
-- 
1.7.4.4



