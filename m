Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0C265C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:44 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so48673695wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=n3Td9s2hnXkAiusFFo2iCMj6now0ItR9E+2gqd0byuk=;
	b=HDIhUvBMxk81LK0HrlkOZAMXWe4lvWaBrZW7ZVakvi40SV5MHnIIMk9Fd+xyiNDaRm
	7ysLu2ShkcKEQtw2oJTqhRmlNJXZ3H1pkhQKAgnmTj3uLeYuUMy7H+nwVgWlJgUdCsNT
	jKxuQfbT2e3BnJRlWmsPzaa2cXH+IEwoTsljIKRsRgRPLgwdcZ0pQeao5INSMVdfwiOT
	Qm4lfdE/tCo7oIWocEQOTxPk5QLcMmD4SzjiAbbaXyHB7jTU54/Xdlo5vTeQhcC9yXlP
	0LJDF1oGQz2BtY9NcRGlXjgDLobvUt3hi4dpLNFsoGacub0aeFWdfHbBrp9TwrJxQOE/
	kCNw==
X-Received: by 10.194.23.197 with SMTP id o5mr43366125wjf.75.1432588486017;
	Mon, 25 May 2015 14:14:46 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:14:09 +0200
Message-Id: <1432588449-31413-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 12/12] imagemagick: update to 6.9.1.3 / add packageconfig for openjpeg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 May 2015 21:14:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* openjpeg is new and auto detected by configure
* choose tar.xz for download as the size is ~1/5 less
* checked LICENSE: only one year was changed 2014->2015

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{imagemagick_6.8.9.bb => imagemagick_6.9.1.bb}            | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_6.8.9.bb => imagemagick_6.9.1.bb} (83%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
similarity index 83%
rename from meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
index accbbed..e54135b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
@@ -1,15 +1,15 @@
 SUMMARY = "ImageMagick is an image convertion tools"
 SECTION = "console/utils"
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5d84c6ddd4028aa53d028b4c50f9361e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0887b670be7ef0c3cb37092b64d57514"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 
-PATCHSET = "10"
-SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
+PATCHSET = "3"
+SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
 "
-SRC_URI[md5sum] = "c4f70046420db9b22d9dfd1c3d179b55"
-SRC_URI[sha256sum] = "4e702c1c3b4632fde2a93af33dcd3d013a9ebfa598060aca11f06d80676ecbf4"
+SRC_URI[md5sum] = "1171a6837defe10be288ab44869cc3a0"
+SRC_URI[sha256sum] = "5fd180603e60c624c05c644a8340f4f4e92c19dc3c41d374d38f76c69cd48ba3"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
@@ -23,6 +23,7 @@ CACHED_CONFIGUREVARS = "ac_cv_sys_file_offset_bits=yes"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
+PACKAGECONFIG[openjpeg] = "--with-openjp2,--without-openjp2,openjpeg"
 PACKAGECONFIG[pango] = "--with-pango,--without-pango,pango cairo"
 PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
 PACKAGECONFIG[wmf] = "--with-wmf,--without-wmf,libwmf"
-- 
1.9.3


