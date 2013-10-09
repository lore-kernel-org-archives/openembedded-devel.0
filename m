Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0EE6CED5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 06:19:09 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so140065eae.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 23:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cMHrIgZmeezz6Fn5Pex5qSMR1tmpwec7cmMk5RVIfX8=;
	b=CJuNGTMzJqfxF7fbJlmTzAlCVhvzJ4eXkWFZXoguTnX2HwSssaavqX+IUrQEy6Gge5
	CvgJb/RfbW0ncn18OTP4YBAm5AGoPKGzLDjZ2HsYIJvVAUvoZTUw6HXOo2OFa9QsR+HV
	PGW1L3D0reql0h0G6/0e0d678WY4D9rdH2lF4Pm5wqa84mc0kRq4MYBG4mDW1aVAwzUt
	qf/FzpYKJCbaAtQYrs2F158dK2xVd8q3XAJEj8XSUUo2CK4AYU2+a+M43S1UhgoFktL6
	D8RC5hiR405xrb2OXjCugCXwQaVOCRDwd6CC5QYbd14LXIqGKxo/XUsTKu9jUxgKncGy
	KsGw==
X-Gm-Message-State: ALoCoQk6EzkIh8g8AolGKcqfG1FclMi7cCl1wLA4DQ7sX9bsipF3HHA8vymCzECi4z2P+/qf8v3q
X-Received: by 10.15.99.72 with SMTP id bk48mr9106282eeb.22.1381299550657;
	Tue, 08 Oct 2013 23:19:10 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id f49sm84692076eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 23:19:10 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Oct 2013 08:18:54 +0200
Message-Id: <1381299534-15993-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.3.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] image-magick: update to latest patchset
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
X-List-Received-Date: Wed, 09 Oct 2013 06:19:10 -0000

And switch to upstream mirror which keeps old releases. This makes it fetch again.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
index 9963990..34e8013 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b1bf06a8d02cb00b02dea7d03ef9525f"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 
-PATCHSET = "8"
-SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
+PATCHSET = "10"
+SRC_URI = "http://www.imagemagick.org/download/legacy/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
            file://remove.dist-lzip.patch \
 "
-SRC_URI[md5sum] = "ea66fbb6fc1354312bc4971c0a0cfb3c"
-SRC_URI[sha256sum] = "eb33e0ba6aeb542b7127ee1c2f62961236428b233e9911aa86e1b66b3342ea1d"
+SRC_URI[md5sum] = "9034ab5bf6d63fe72230779f1f590691"
+SRC_URI[sha256sum] = "95b487bb0e4ebf97dd06b6d61f421a05e2666f253ae06352cb3262b34603b2a3"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
1.8.3.1


