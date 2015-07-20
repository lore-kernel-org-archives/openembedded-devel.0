Return-Path: <kimmo.surakka@vincit.fi>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 83F2D65CBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 09:17:55 +0000 (UTC)
Received: by wgkl9 with SMTP id l9so125366410wgk.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 02:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=CyoRSO4xYfZcVt+eSg+V5RZaUFuaIp7Ey8LWY+z2zIE=;
	b=S68FPzvSPgZdZQOw/orS6UN0FjdEPBpDVevlv0xeixCyn0zVDwwReg+GKFcwbmSod3
	iGx4mtqN6FKLa6h6ka9j3pT1FhbGb3C398XMbmm51HdHoRPk2vaOenA2YrYv30yvB01v
	1J6zI146K4rdy1kU3fHDVibcSdn1QUZOV44asdyVbSzEYr1zjgiUId5MyKCUDKgGM0qa
	YX6nD1TvtloixuCv1ghz1r25uSqScRJjgw6ywoUGaELEsBbusvWcZbvkPnG/SOl8Mj5d
	UDOqyzbUOEAu4hw4RsKgSqA2jpCb/n4DecA0KG7dmLcK7WqCCfghQcX6DlzXhUNGnomV
	MSrw==
X-Gm-Message-State: ALoCoQnWB6pLap8JL6h0jegcrcCo7nKbyO1tC5KhZ2hggd1FeEdQcwj5bv3IBS/rbbJbH+HmGg5H
MIME-Version: 1.0
X-Received: by 10.194.59.98 with SMTP id y2mr55478770wjq.42.1437383874993;
	Mon, 20 Jul 2015 02:17:54 -0700 (PDT)
Received: by 10.194.100.1 with HTTP; Mon, 20 Jul 2015 02:17:54 -0700 (PDT)
Date: Mon, 20 Jul 2015 12:17:54 +0300
Message-ID: <CAPwmkWyXiyKFiCWH52JKA-gAJH9jqfpUG1Z7TrLCTdLp9HgvBg@mail.gmail.com>
From: Kimmo Surakka <kimmo.surakka@vincit.fi>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] imagemagick: update patchset from 4 to 9
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
X-List-Received-Date: Mon, 20 Jul 2015 09:18:01 -0000
Content-Type: text/plain; charset=UTF-8

The ImageMagick-6.9.1-4.tar.xz is gone on the download server, there is
ImageMagick-6.9.1-9.tar.xz now.

Signed-off-by: Kimmo Surakka <kimmo.surakka@vincit.fi>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
index 6ee3724..e7c5374 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM =
"file://LICENSE;md5=0887b670be7ef0c3cb37092b64d57514"
 # FIXME: There are many more checked libraries. All should be added
or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"

-PATCHSET = "4"
+PATCHSET = "9"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz
\
 "
-SRC_URI[md5sum] = "b5929717d848a386f2674aeb31257c42"
-SRC_URI[sha256sum] =
"74973478058069ce44040ff76b61df713d70adcadfd207836cc0622cadf1e4bf"
+SRC_URI[md5sum] = "5a3a60d1dae65ee7b1cc88498e3a0008"
+SRC_URI[sha256sum] =
"83cd785caeb26a171e185b5deba2900c5b73e79c97364caa4c879d26c9f4a91b"

 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"

--
1.8.3.1

