Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RMS5G-0000YX-Vu
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 23:17:59 +0100
Received: (qmail invoked by alias); 04 Nov 2011 22:11:49 -0000
Received: from p4FDF110E.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.17.14]
	by mail.gmx.net (mp059) with SMTP; 04 Nov 2011 23:11:49 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19unhtKCG1urilCBisa0OEeRB9xhfrm1GFQXMIEqa
	NS2+OqssHD1qQL
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Nov 2011 23:16:38 +0100
Message-Id: <1320444998-12401-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe] midori: add ca-certificates to RRECOMMENDS_${PN}
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
X-List-Received-Date: Fri, 04 Nov 2011 22:17:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix WARNING **: No root certificate file is available. SSL certificates cannot be verified.

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-oe/recipes-connectivity/midori/midori.inc     |    2 +-
 .../recipes-connectivity/midori/midori_0.4.1.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/midori/midori.inc b/meta-oe/recipes-connectivity/midori/midori.inc
index 3f33863..05db643 100644
--- a/meta-oe/recipes-connectivity/midori/midori.inc
+++ b/meta-oe/recipes-connectivity/midori/midori.inc
@@ -30,7 +30,7 @@ do_install() {
 	oe_runmake DESTDIR=${D} install
 }
 
-RRECOMMENDS_${PN} += "glib-networking"
+RRECOMMENDS_${PN} += "glib-networking ca-certificates"
 
 FILES_${PN}-dev += "${datadir}/vala/vapi"
 
diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
index 860ed21..7f4eb4b 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
@@ -1,6 +1,6 @@
 require midori.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
            file://waf \
-- 
1.7.4.4



