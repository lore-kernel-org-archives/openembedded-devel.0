Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1592F6AC95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:29 +0000 (UTC)
Received: by wghq2 with SMTP id q2so81037490wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=1P22Ny6UWMK7zexNIQTvj+oHBz8xNaGAKXLNiPrAHCs=;
	b=qXE61w1saW6RhfhxJ507qZlqiz94W/Viv8p/dIxWCkiI5ZZ52ApPuOR05lexfaosP7
	pt02J3Whzo4BYH0JzeQGOc7nR53lXD8nKe8kYUG1yC9oONF2uaeu85/8MwlgsjhNlHAH
	6Li6lMCSaccTKEecLfbfXiAffAyrf/851GTZPhgGZF+eZeMzU/fRx1FtOyMNtcrmJ99G
	67N/mej2crBJRBaGvAb+X6T6CWaPq8AMeaELAEiFO+/+a/kQj8YPSCR63sP7/hQWgXxP
	3ZSV+s8Bpwor44WtpuQKXwK0xY6cff/N71HjbEzMprjeuSClZmeKMARs8S24nxDeRGaW
	6Mng==
X-Received: by 10.194.81.169 with SMTP id b9mr23616795wjy.126.1432588470194;
	Mon, 25 May 2015 14:14:30 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:14:00 +0200
Message-Id: <1432588449-31413-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/12] poppler: update 0.33.0 to and enhance packageconfigs
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
X-List-Received-Date: Mon, 25 May 2015 21:14:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

qt5 packageconfig fixes:

| WARNING: QA Issue: poppler rdepends on qtbase, but it isn't a build dependency? [build-deps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../poppler/{poppler_0.26.5.bb => poppler_0.33.0.bb}             | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.26.5.bb => poppler_0.33.0.bb} (69%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.26.5.bb b/meta-oe/recipes-support/poppler/poppler_0.33.0.bb
similarity index 69%
rename from meta-oe/recipes-support/poppler/poppler_0.26.5.bb
rename to meta-oe/recipes-support/poppler/poppler_0.33.0.bb
index d119639..6e8446b 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.26.5.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.33.0.bb
@@ -5,17 +5,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
 "
-SRC_URI[md5sum] = "786c943eee550e3a977c181e7778b1c8"
-SRC_URI[sha256sum] = "de7de5fa337431e5d1f372e8577b3707322f1dbc1dc28a70f2927476f134d1ee"
+SRC_URI[md5sum] = "69927d1614d6704021c0b0dd0ee6a852"
+SRC_URI[sha256sum] = "a5fa6d7f7dc5382b48caca82b147c54bdffda02698611af76db5326ba64995a6"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
 inherit autotools pkgconfig gtk-doc
 
-PACKAGECONFIG ??= "jpeg png tiff"
+PACKAGECONFIG ??= "jpeg openjpeg png tiff ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
 PACKAGECONFIG[jpeg] = "--enable-libjpeg,--disable-libjpeg,jpeg"
 PACKAGECONFIG[png] = "--enable-libpng,--disable-libpng,libpng"
 PACKAGECONFIG[tiff] = "--enable-libtiff,--disable-libtiff,tiff"
+PACKAGECONFIG[curl] = "--enable-libcurl,--disable-libcurl,curl"
+PACKAGECONFIG[openjpeg] = "--enable-libopenjpeg=openjpeg2,--disable-libopenjpeg,openjpeg"
+PACKAGECONFIG[qt5] = "--enable-poppler-qt5,--disable-poppler-qt5,qtbase"
 
 EXTRA_OECONF = "\
     --enable-xpdf-headers \
-- 
1.9.3


