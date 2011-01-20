Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PfhXZ-0002uI-H0
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 00:34:13 +0100
Received: (qmail invoked by alias); 19 Jan 2011 23:33:33 -0000
Received: from p4FE0F56E.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [79.224.245.110]
	by mail.gmx.net (mp043) with SMTP; 20 Jan 2011 00:33:33 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18ZYR4c0EgZgUnDO+lhDQqEOAdjK0OxYENHUVpxlV
	+tuCjTELMbLihu
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jan 2011 01:32:38 +0100
Message-Id: <1295483561-20263-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
X-Y-GMX-Trusted: 0
Subject: [PATCH 1/4] clutter: Fix broken build for images depending on gobject-introspection-native (e.g. libwnck_2.30.5 / libgee_0.6.0)
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
X-List-Received-Date: Wed, 19 Jan 2011 23:34:13 -0000

* Error situation:
* 1. configure detects gobject-introspection:
*
configure:12828: checking for gobject-introspection
configure:12859: $PKG_CONFIG --exists --print-errors "gobject-introspection-1.0 >= 0.6.4"
*
* 2. compile fails:
*
  CCLD   libclutter-cogl.la
  GEN    Cogl-1.0.gir
In file included from /home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.2.12-r2.1/clutter-1.2.12/clutter/cogl/cogl/cogl-shader.h:32,
                 from <stdin>:15:
../../../clutter/cogl/cogl/cogl-defines.h:30:23: error: GLES2/gl2.h: No such file or directory
Error while processing the source.
make[7]: *** [Cogl-1.0.gir] Error 1
*
* After fix configure disables gobject-introspection
*
configure:12828: checking for gobject-introspection
configure:12873: result: no (disabled, use --enable-introspection to enable)

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/clutter/clutter.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
index 84a7af9..2a061af 100644
--- a/recipes/clutter/clutter.inc
+++ b/recipes/clutter/clutter.inc
@@ -9,7 +9,7 @@ INC_SRC_URI = "file://sample.desktop \
 PARALLEL_MAKE = ""
 
 STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+"
-BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)} --enable-conformance "
+BASE_CONF = "--disable-introspection --disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)} --enable-conformance "
 
 DEPENDS = "${STDDEPENDS} virtual/libgl"
 EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
@@ -41,7 +41,7 @@ EXTRA_OECONF_mx31ads = "${BASE_CONF} --with-flavour=eglnative"
 PACKAGE_ARCH_mx31ads = "${MACHINE_ARCH}"
 LDFLAGS_append_mx31ads = " -lpvrNULLWSEGL -lstdc++ "
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit autotools pkgconfig gtk-doc
 
-- 
1.7.2.3



