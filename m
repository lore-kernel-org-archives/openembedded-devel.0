Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4527573211
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 15:31:37 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u25so1090323qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 08:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oDjh80TnK7DpEeeY7VgnFQhqU4oJ1RBk5NOcNGSTA2w=;
	b=mk68ae74kquueqF1ZNmt1NSJAPFe6S72Qj18WwwVtQawGLyr1H63lA9hzTUvyG2iCO
	TaKfZswC2ZkfIkHMnFKTBxqejOZXAVRoQh+VRx/kw7JtncaPVgY35swJ+BDCD3tb+K3n
	5eIHFgxdznilJLoZua5YTnTDtVJeh6Olv9q3xapj7Ww9tk4f7VZs9JMSM9EmeHhQjZ0z
	nXHO0E+99Xl8VK7Msw0emxz4hoLcV9TdTetAuqsKM3RcYjOSFTCwNk+9DTwhQyRYKael
	5b34tNy9aHEA7pJ5v6gyhkzXiCO61cA9p5hQUe/G98y1IJzjIWCs9Wknk1kdMDAAEwaZ
	19RA==
X-Gm-Message-State: AEkoouv9PccOONNopBlQlexXQ39ZUV0hX8rY6ecPzpENA7UMvi56m07r3tMRXorjRaJgWA==
X-Received: by 10.200.54.28 with SMTP id m28mr17770069qtb.87.1471015898025;
	Fri, 12 Aug 2016 08:31:38 -0700 (PDT)
Received: from argos.minotaurinc.com (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	g29sm4673102qtg.12.2016.08.12.08.31.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Aug 2016 08:31:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Aug 2016 11:30:38 -0400
Message-Id: <1471015838-10111-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCHv2] gd: update to version 2.2.3
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
X-List-Received-Date: Fri, 12 Aug 2016 15:31:41 -0000

    * Upstream removed vpx support in favor of webp
    * Explicity disable webp support

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../gd/files/fix-gcc-unused-functions.patch        | 43 ++++++++++++++++++++++
 .../gd/{gd_2.1.1.bb => gd_2.2.3.bb}                | 12 +++---
 2 files changed, 49 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch
 rename meta-oe/recipes-support/gd/{gd_2.1.1.bb => gd_2.2.3.bb} (82%)

diff --git a/meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch b/meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch
new file mode 100644
index 0000000..02cb5ad
--- /dev/null
+++ b/meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch
@@ -0,0 +1,43 @@
+gdft.c: remove functions that cause warnings about being unused
+
+Upstream-Status: Backport (Fixed in master branch)
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+--- git/src/gdft.c.orig	2016-08-12 10:20:41.418440091 -0400
++++ git/src/gdft.c	2016-08-12 10:22:34.226442987 -0400
+@@ -139,16 +139,6 @@
+ }
+ #else
+ 
+-#ifndef HAVE_LIBFONTCONFIG
+-static char * font_pattern(char **fontpath, char *fontpattern)
+-{
+-	(void)fontpath;
+-	(void)fontpattern;
+-
+-	return "libgd was not built with FontConfig support\n";
+-}
+-#endif /* HAVE_LIBFONTCONFIG */
+-
+ #include "gdcache.h"
+ /* 2.0.16 Christophe Thomas: starting with FreeType 2.1.6, this is
+   mandatory, and it has been supported for a long while. */
+@@ -446,16 +436,15 @@
+ 	return (strcmp (a->fontlist, b->fontlist) == 0 && a->flags == b->flags);
+ }
+ 
++#ifdef HAVE_LIBFONTCONFIG
+ static int useFontConfig(int flag)
+ {
+-#ifdef HAVE_LIBFONTCONFIG
+ 	if (fontConfigFlag) {
+ 		return (!(flag & gdFTEX_FONTPATHNAME));
+ 	}
+-#endif
+ 	return flag & gdFTEX_FONTCONFIG;
+ }
+-
++#endif
+ static void *
+ fontFetch (char **error, void *key)
+ {
diff --git a/meta-oe/recipes-support/gd/gd_2.1.1.bb b/meta-oe/recipes-support/gd/gd_2.2.3.bb
similarity index 82%
rename from meta-oe/recipes-support/gd/gd_2.1.1.bb
rename to meta-oe/recipes-support/gd/gd_2.2.3.bb
index 85c7e6a..80d66c9 100644
--- a/meta-oe/recipes-support/gd/gd_2.1.1.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.3.bb
@@ -12,12 +12,12 @@ LICENSE = "GD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
 DEPENDS = "freetype libpng jpeg zlib tiff"
 
-SRC_URI = "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}.tar.bz2 \
-"
-SRC_URI[md5sum] = "d3f1a992ac9c550ebc6da89c147f89af"
-SRC_URI[sha256sum] = "895ea9c6fcab187b0a908ae3e9e6b06423756f8a643d362349b0caab4014bd0d"
+SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
+           file://fix-gcc-unused-functions.patch"
 
-S = "${WORKDIR}/libgd-${PV}"
+SRCREV = "46ceef5970bf3a847ff61d1bdde7501d66c11d0c"
+
+S = "${WORKDIR}/git"
 
 inherit autotools binconfig gettext pkgconfig
 
@@ -25,9 +25,9 @@ EXTRA_OECONF += " --disable-rpath \
                   --with-jpeg=${STAGING_LIBDIR}/.. \
                   --with-freetype=yes \
                   --without-fontconfig \
+                  --without-webp \
                   --without-xpm \
                   --without-x \
-                  --without-vpx \
                 "
 
 EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
-- 
1.9.1


