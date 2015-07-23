Return-Path: <kimmo.surakka@vincit.fi>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2DBD2761B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 14:50:53 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so212073129wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 07:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H8z73unhVG+1Zf1xqNkFupKZzk/1xWdcoD7RQWTAOKI=;
	b=P3VMoIhipoQQdje9k4vj4JtfboVjuHN3HyVUV+rRw87d5F1glS9glX5ABXzTWejLfi
	yzmzE7hGGIUmqlcv6HOYXC4Vz7nMg9/p7zdC8hQTBTj4tYwO7MC74M6KKugYmZiH/xwj
	UJUxnhU9Kq5IVTGPee9x36le9hyc0JKMsM20e5J6eCTSdonglE4YGZO05yqBlgh7TZjf
	PYFZnBdbfBMoQbNF16mbWoLaj+0b+XbFiSBpUtugAR/JkE6LjsBw7lMEaMRzMNOeUL41
	cakgHdcVNm0/iMDFFcDEzGAEjTNlRPoOjGrv0IYApUqo7NsDzE61pTLCbuq/W4dsZ17B
	PWCA==
X-Gm-Message-State: ALoCoQkQJfgskt7hSVi254HWzhiWxe0eX0m+/PGtm0MvyEPtVPDj5qWoBYc/RMBo687BxfQ7jyRK
X-Received: by 10.180.102.74 with SMTP id fm10mr53817446wib.25.1437663053538; 
	Thu, 23 Jul 2015 07:50:53 -0700 (PDT)
Received: from mail-rly-prd-01.am.health.ge.com ([194.9.252.237])
	by smtp.gmail.com with ESMTPSA id d7sm8956308wij.0.2015.07.23.07.50.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jul 2015 07:50:52 -0700 (PDT)
From: Kimmo Surakka <kimmo.surakka@vincit.fi>
X-Google-Original-From: Kimmo Surakka <kimmo.surakka@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jul 2015 17:50:41 +0300
Message-Id: <1437663041-48177-1-git-send-email-kimmo.surakka@ge.com>
X-Mailer: git-send-email 1.9.1
Cc: Kimmo Surakka <kimmo.surakka@ge.com>
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
X-List-Received-Date: Thu, 23 Jul 2015 14:50:56 -0000

The ImageMagick-6.9.1-4.tar.xz is gone on the download server, there is
ImageMagick-6.9.1-9.tar.xz now.

Signed-off-by: Kimmo Surakka <kimmo.surakka@vincit.fi>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
index 6ee3724..e7c5374 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0887b670be7ef0c3cb37092b64d57514"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 
-PATCHSET = "4"
+PATCHSET = "9"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
 "
-SRC_URI[md5sum] = "b5929717d848a386f2674aeb31257c42"
-SRC_URI[sha256sum] = "74973478058069ce44040ff76b61df713d70adcadfd207836cc0622cadf1e4bf"
+SRC_URI[md5sum] = "5a3a60d1dae65ee7b1cc88498e3a0008"
+SRC_URI[sha256sum] = "83cd785caeb26a171e185b5deba2900c5b73e79c97364caa4c879d26c9f4a91b"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
1.9.1


