Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rxea6-0004si-D7
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 14:07:36 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so302240eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 04:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=o1vZohAgC5yDq+2NJn+g9zu8vQpDe+DPgVFKE2jYLwY=;
	b=nduLvk8wqFAbxBoa2q0eVSqrbtS0TdrLIGmtVsoNmhJOIbDgVs6ba0wailgguYN1Yd
	ydk9uU6izNxbatj2xezzjhQPbtqIO4TtgiV7/SFx9aPglI8X1/mi0tKa6QN0z4OcWmQJ
	y8NR/tfE3/BD+fTXKR6kHkRibtS/0YmpelAas=
Received: by 10.213.105.199 with SMTP id u7mr234094ebo.135.1329310764848;
	Wed, 15 Feb 2012 04:59:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n56sm10922425eeh.6.2012.02.15.04.59.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 04:59:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Feb 2012 13:59:09 +0100
Message-Id: <aaef9aa923d6e55ae0463156999b2a0543cb1ef1.1329310622.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <fe6268a256b83d07e711e08db66b2610fd2b4f8e.1329310622.git.Martin.Jansa@gmail.com>
References: <fe6268a256b83d07e711e08db66b2610fd2b4f8e.1329310622.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329310622.git.Martin.Jansa@gmail.com>
References: <cover.1329310622.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/2] imagemagick: upgrade to 6.7.5 because 6.4.4 is not compatible with zlib-1.2.6 we have now
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
X-List-Received-Date: Wed, 15 Feb 2012 13:07:36 -0000

* for zlib-1.2.6 issue see:
  http://www.imagemagick.org/discourse-server/viewtopic.php?f=2&t=20267
* dist-lzip removed because it's not supported in our automake yet
* xml is explicity disabled, wasn't enabled before and if autodetected
  then fails (see comment above EXTRA_OECONF).
* LIC_FILES_CHKSUM updated, only formal changes AFAIK see:
  http://trac.imagemagick.org/log/ImageMagick/trunk/LICENSE
  for details
* empty dirs coders and filters added to PN to fix QA warning

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../PerlMagic_MakePatch.patch                      |    0
 .../imagemagick-6.7.5/remove.dist-lzip.patch       |   17 +++++++++++++++++
 .../{imagemagick_6.4.4.bb => imagemagick_6.7.5.bb} |   19 +++++++++++--------
 3 files changed, 28 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick-6.4.4 => imagemagick-6.7.5}/PerlMagic_MakePatch.patch (100%)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove.dist-lzip.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick_6.4.4.bb => imagemagick_6.7.5.bb} (61%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMagic_MakePatch.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch
similarity index 100%
rename from meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMagic_MakePatch.patch
rename to meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove.dist-lzip.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove.dist-lzip.patch
new file mode 100644
index 0000000..559aa24
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove.dist-lzip.patch
@@ -0,0 +1,17 @@
+Our automake-1.11.2 doesn't support it yet, see:
+http://lists.gnu.org/archive/html/automake/2011-12/msg00081.html
+
+Upstream-Status: Inappropriate [fix or upgrade oe-core automake]
+
+diff -uNr ImageMagick-6.7.5-6.orig/configure.ac ImageMagick-6.7.5-6/configure.ac
+--- ImageMagick-6.7.5-6.orig/configure.ac	2012-02-12 18:07:28.000000000 +0100
++++ ImageMagick-6.7.5-6/configure.ac	2012-02-15 12:55:47.668813474 +0100
+@@ -128,7 +128,7 @@
+ # Ensure that make can run correctly
+ AM_SANITY_CHECK
+ 
+-AM_INIT_AUTOMAKE([1.11 color-tests foreign parallel-tests silent-rules subdir-objects dist-bzip2 dist-lzip dist-xz dist-zip])
++AM_INIT_AUTOMAKE([1.11 color-tests foreign parallel-tests silent-rules subdir-objects dist-bzip2 dist-xz dist-zip])
+ 
+ # Enable support for silent build rules
+ m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
similarity index 61%
rename from meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
index d5f95c9..4cecff0 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
@@ -1,27 +1,30 @@
 DESCRIPTION = "ImageMagick is an image convertion tools"
 SECTION = "console/utils"
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e1ebcc1358b9f81eba64255fc5da6892"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=944f66dcedc98d5a4e5d964bd3b32e7b"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib"
 
-PR = "r10"
-
-PATCHSET = "1"
+PATCHSET = "6"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
            file://PerlMagic_MakePatch.patch \
+	   file://remove.dist-lzip.patch \
           "
-SRC_URI[md5sum] = "882ff241f6ad39655541d5055596f93b"
-SRC_URI[sha256sum] = "5a5b2779707bfd9816cf17d8f53d242c05005092da192a898ac10961b3b19dda"
+SRC_URI[md5sum] = "bcf07cf0822572fa2b47fa6d506f699a"
+SRC_URI[sha256sum] = "d9347f31d3d35b40009e1bbcf713c5ad252411e05ee621d5a7dae01e47bdbd80"
 
-S = "${WORKDIR}/ImageMagick-${PV}"
+S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
 inherit autotools binconfig pkgconfig
 
-EXTRA_OECONF = "--program-prefix= --without-x --without-freetype --without-perl --disable-openmp"
+# xml disabled because it's using xml2-config --prefix to determine prefix which returns just /usr with our libxml2
+# if someone needs xml support then fix it first
+EXTRA_OECONF = "--program-prefix= --without-x --without-freetype --without-perl --disable-openmp --without-xml"
 
 FILES_${PN} += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
                 ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
+                ${libdir}/ImageMagick-${PV}/modules-Q16/filters \
+                ${libdir}/ImageMagick-${PV}/modules-Q16/coders \
                 ${libdir}/ImageMagick-${PV}/config/ \
                 ${datadir}/ImageMagick-${PV}"
 
-- 
1.7.8.4



