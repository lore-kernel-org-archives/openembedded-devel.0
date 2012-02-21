Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rzia7-0005tH-Vq
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 06:48:08 +0100
Received: by daln34 with SMTP id n34so5413579dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 21:39:46 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.197.196 as permitted sender) client-ip=10.68.197.196; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.197.196 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.197.196])
	by 10.68.197.196 with SMTP id iw4mr8077380pbc.133.1329802786764
	(num_hops = 1); Mon, 20 Feb 2012 21:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HrMyLRKI8mLyJ7lUZVepiBboJohJytLhM/Dh7qUa+Z4=;
	b=vQFpKtXtoBEozWD4b+u8IZo3qXz/+E/aM57x3KLyG64CvuttZEY6UCf9snELr77lKs
	FX2W127mDBKJzCt7VNX/3h6TvNHE+lMeG/xrlCcbzgSTXPdA+ZhOfUpgbuHQi1P0chYl
	FlYnR+at2jVhtoLAACgDs0VIRHPWzRk0VmFnI=
Received: by 10.68.197.196 with SMTP id iw4mr6425166pbc.133.1329802786708;
	Mon, 20 Feb 2012 21:39:46 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id e10sm26704771pbv.0.2012.02.20.21.39.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Feb 2012 21:39:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2012 21:38:28 -0800
Message-Id: <1329802708-23942-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] imagemagick: Upgrade recipes from 6.4.4 -> 6.7.5
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
X-List-Received-Date: Tue, 21 Feb 2012 05:48:08 -0000

6.4.4 does not compile with latest zlib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../PerlMagic_MakePatch.patch                      |    0
 .../imagemagick/imagemagick-6.7.5/no-lzip.patch    |   19 +++++++++++++++++++
 .../{imagemagick_6.4.4.bb => imagemagick_6.7.5.bb} |   15 ++++++++-------
 3 files changed, 27 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick-6.4.4 => imagemagick-6.7.5}/PerlMagic_MakePatch.patch (100%)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/no-lzip.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick_6.4.4.bb => imagemagick_6.7.5.bb} (72%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMagic_MakePatch.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch
similarity index 100%
rename from meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMagic_MakePatch.patch
rename to meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/no-lzip.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/no-lzip.patch
new file mode 100644
index 0000000..38b48e1
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/no-lzip.patch
@@ -0,0 +1,19 @@
+dist-lzip is not supported by OE autotools
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Index: ImageMagick-6.7.5-6/configure.ac
+===================================================================
+--- ImageMagick-6.7.5-6.orig/configure.ac	2012-02-20 21:19:53.965635662 -0800
++++ ImageMagick-6.7.5-6/configure.ac	2012-02-20 21:20:31.429637625 -0800
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
similarity index 72%
rename from meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
index d5f95c9..0c24a62 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
@@ -1,20 +1,21 @@
-DESCRIPTION = "ImageMagick is an image convertion tools"
+DESCRIPTION = "ImageMagick is collection of image manipulation tools"
 SECTION = "console/utils"
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e1ebcc1358b9f81eba64255fc5da6892"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=944f66dcedc98d5a4e5d964bd3b32e7b"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib"
 
-PR = "r10"
+PR = "r0"
 
-PATCHSET = "1"
+PATCHSET = "6"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
            file://PerlMagic_MakePatch.patch \
+           file://no-lzip.patch \
           "
-SRC_URI[md5sum] = "882ff241f6ad39655541d5055596f93b"
-SRC_URI[sha256sum] = "5a5b2779707bfd9816cf17d8f53d242c05005092da192a898ac10961b3b19dda"
+SRC_URI[md5sum] = "bcf07cf0822572fa2b47fa6d506f699a"
+SRC_URI[sha256sum] = "d9347f31d3d35b40009e1bbcf713c5ad252411e05ee621d5a7dae01e47bdbd80"
 
-S = "${WORKDIR}/ImageMagick-${PV}"
+S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.5.4



