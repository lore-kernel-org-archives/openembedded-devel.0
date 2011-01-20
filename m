Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PfhXa-0002uL-V2
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 00:34:14 +0100
Received: (qmail invoked by alias); 19 Jan 2011 23:33:34 -0000
Received: from p4FE0F56E.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [79.224.245.110]
	by mail.gmx.net (mp043) with SMTP; 20 Jan 2011 00:33:34 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+X6Xg4hQWXAdonWfn1CyfYvYNrOo2YyLPwqDDDLW
	/KPl6aMmvZau1u
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jan 2011 01:32:40 +0100
Message-Id: <1295483561-20263-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1295483561-20263-1-git-send-email-schnitzeltony@gmx.de>
References: <1295483561-20263-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [PATCH 3/4] clutter-gst: Fix broken build for images depending on gobject-introspection-native (e.g. libwnck_2.30.5 / libgee_0.6.0)
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
X-List-Received-Date: Wed, 19 Jan 2011 23:34:15 -0000

* Error situation:
* 1. configure detects gobject-introspection:
*
configure:12133: checking for gobject-introspection
configure:12164: $PKG_CONFIG --exists --print-errors "gobject-introspection-1.0 >= 0.6.8"
*
* 2. compile fails:
*
  CCLD   libclutter-gst-1.0.la
  GEN    ClutterGst-1.0.gir
Couldn't find include 'Clutter-1.0.gir' (search path: ['.', 'path=.', '/home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/gir-1.0', '/home/Superandi/tmp/sysroots/i686-linux/usr/share/gir-1.0', '/usr/share/gir-1.0', '/home/Superandi/tmp/sysroots/i686-linux/usr/share/gir-1.0'])
make[3]: *** [ClutterGst-1.0.gir] Error 1
*
* After fix configure disables gobject-introspection
*
configure:12133: checking for gobject-introspection
configure:12178: result: no (disabled, use --enable-introspection to enable)

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/clutter/clutter-gst.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/clutter/clutter-gst.inc b/recipes/clutter/clutter-gst.inc
index b25f31e..814f493 100644
--- a/recipes/clutter/clutter-gst.inc
+++ b/recipes/clutter/clutter-gst.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Clutter GStreamer integration library"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 DEPENDS = "clutter gstreamer gst-plugins-base"
 
@@ -10,6 +10,8 @@ require clutter-common.inc
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF = "--disable-introspection"
+
 align_examples_data_location() {
 	for full_name in $(find ${S}/examples -name *.png) ; do
 		data_name=${full_name##*/}
-- 
1.7.2.3



