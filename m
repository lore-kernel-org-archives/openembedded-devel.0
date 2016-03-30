Return-Path: <Catalin.Enache@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C005A6AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 09:06:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U965xr003157
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 02:06:05 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 02:06:04 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Mar 2016 12:08:07 +0300
Message-ID: <1459328887-21295-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] imagemagick: add PACKAGECONFIG for x11
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
X-List-Received-Date: Wed, 30 Mar 2016 09:06:07 -0000
Content-Type: text/plain

ImageMagick should X11 delegate libraries if they are available

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
index 12604c0..a1be5a6 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
@@ -23,13 +23,14 @@ inherit autotools pkgconfig update-alternatives
 EXTRA_OECONF = "--program-prefix= --program-suffix=.im6 --without-x --without-perl --disable-openmp --without-xml --disable-opencl"
 
 CACHED_CONFIGUREVARS = "ac_cv_sys_file_offset_bits=yes"
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[openjpeg] = "--with-openjp2,--without-openjp2,openjpeg"
 PACKAGECONFIG[pango] = "--with-pango,--without-pango,pango cairo"
 PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
 PACKAGECONFIG[wmf] = "--with-wmf,--without-wmf,libwmf"
+PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxt"
 
 FILES_${PN} += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
                 ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
-- 
2.7.4


