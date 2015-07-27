Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0C875A60
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 20:53:46 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so129475116wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=EkBoubKA1EkjOgI+WF6ag22aNqcavZbMPZTmrUWlWLU=;
	b=P1SxJwDqdDHcJLec8DcxkvoN3I8/pzkMTyGlp9025YHu3EggzANzdrVS7pgOwdGor8
	DNIlP2xP8/JeZm6YRKOqvdmDPi7GxMCl1GaTupIMo/TEwzi2WuXc4HM9ckQ5eUnmMdBA
	U6fS4UjfgBQvLQUnNC2f0k4w1g5QlOPU+CdudOKd6LL4cXoE86bCgdgDlKZVbTt/x8a8
	rC6Kb3Inm7B54L+v230wRo+fVslrP06ws7CBm9dK8E2w06OFpLpBOqLDsff2vnbDsdIE
	YGKi5p2nASWrUH2KWejjWIgbohE5b/cbgzR2p7v9lB73iepdiUlcdiDcUcrqoXKUG2jz
	06HA==
X-Received: by 10.194.90.171 with SMTP id bx11mr55840660wjb.129.1438030426547; 
	Mon, 27 Jul 2015 13:53:46 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2DA2.dip0.t-ipconnect.de.
	[91.10.45.162]) by smtp.googlemail.com with ESMTPSA id
	k4sm15454909wix.19.2015.07.27.13.53.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 13:53:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jul 2015 22:53:31 +0200
Message-Id: <1438030411-5934-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1438030411-5934-1-git-send-email-schnitzeltony@googlemail.com>
References: <1438030411-5934-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH] imagemagick: update patchset from 9 to 10
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
X-List-Received-Date: Mon, 27 Jul 2015 20:53:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ImageMagick-6.9.1-9.tar.xz is gone again.

To avoid somebody doing the same mistake as I did - updating to an unfinished
series - a note was dropped. Hopefully we don't see too many further patchsets
within this version...

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
index e7c5374..d84d518 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
@@ -5,11 +5,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0887b670be7ef0c3cb37092b64d57514"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 
-PATCHSET = "9"
+# Important note: tarballs for all patchsets within a version are deleted when
+# a new pachset is created. To avoid multiple patches for each patchset, try to
+# update to the last pachset of a version
+PATCHSET = "10"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
 "
-SRC_URI[md5sum] = "5a3a60d1dae65ee7b1cc88498e3a0008"
-SRC_URI[sha256sum] = "83cd785caeb26a171e185b5deba2900c5b73e79c97364caa4c879d26c9f4a91b"
+SRC_URI[md5sum] = "cf5c663a31d0ca2975121d0803db0e61"
+SRC_URI[sha256sum] = "22565464059376513869b6626982e0726a33788ccc7e19a08e55ff1683d4ff92"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
2.1.0


