Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TK4Ut-00084L-NZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 11:47:07 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so301722wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 02:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=roio9ahnhDW639YzAGqAf9Tj3A5pjbUgr3C9a1yo160=;
	b=bIlBG3morf+ey28lhlJVcejZPo+DUhX3bM1pxjWZYrD88EiMAtzmY1dNZrqSFTrZRN
	uOT7+wU6mImFrf7tsXDzF9v8QGVzXWgkdWIenSOtZOnSwe8HTkScbbCCREVXWE7hnmYd
	qNYeJZ/g5M9WbOpHA8TN0m8cITcqGIxhGiRnaFryqnyuc8ek4puPgZh2c4Z1XRIWWi4K
	aE718q0UvMHV1rb2KcLS/ivDlTSL/+k2YlohPbzwEZHVd8V9uci5TdienhdJ3Uq2srMO
	lbwCyEWlLjjqxmJuXWLUN5G5kngkqFBSHhDCsNV36zD6JObln92wmGBvftUdrCmENL4J
	iYmA==
Received: by 10.180.79.202 with SMTP id l10mr2081754wix.9.1349429647981;
	Fri, 05 Oct 2012 02:34:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q7sm1613809wiy.11.2012.10.05.02.34.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 02:34:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2012 11:33:39 +0200
Message-Id: <33d674ec481219a0662a380ab5547013b894e115.1349429575.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349429575.git.Martin.Jansa@gmail.com>
References: <cover.1349429575.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349429575.git.Martin.Jansa@gmail.com>
References: <cover.1349429575.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] imagemagick: add fftw to DEPENDS
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
X-List-Received-Date: Fri, 05 Oct 2012 09:47:07 -0000

* it's autodetected and then later when it's not in sysroot it fails:
| /bin/grep: /OE/shr-core/tmp-eglibc/sysroots/tuna/usr/lib/libfftw3.la: No such file or directory
| /bin/sed: can't read /OE/shr-core/tmp-eglibc/sysroots/tuna/usr/lib/libfftw3.la: No such file or directory
| arm-oe-linux-gnueabi-libtool: link: `/OE/shr-core/tmp-eglibc/sysroots/tuna/usr/lib/libfftw3.la' is not a valid libtool archive
| make[1]: *** [wand/libMagickWand.la] Error 1
| make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/imagemagick-6.7.5-r3/ImageMagick-6.7.5-6'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
index 625a57e..5e8bc85 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
@@ -3,9 +3,9 @@ SECTION = "console/utils"
 LICENSE = "ImageMagick"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=944f66dcedc98d5a4e5d964bd3b32e7b"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
-DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib"
+DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw"
 
-PR = "r3"
+PR = "r4"
 
 PATCHSET = "6"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
-- 
1.7.12



