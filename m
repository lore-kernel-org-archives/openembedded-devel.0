Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id EDCAC6CC86
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 00:34:43 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id rd3so3658518pab.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 17:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PWCwA0XU9ziJihskkJwBG/R+zktiPngTXBfwLMFe4AQ=;
	b=MwkvLuyGWraiA1b3CKG/E0WOJEKYJMj0MavZqK2BFTUdSNmfX+6vYRsu4HhCp0DXwO
	u5Kh2gxPgPTV2J1mY8K+MMv1YVSlfu2FKWmvsI+hNKeKVuZCv/js1NOIX0WiLsygxSxT
	UGsKtRu3UGbK+djpd+VwXnvS3RHGmyf1u4EV1Pb0Yn1plRK34lJxxGMi+DLlOFB6tb1e
	XI2Myrx34sE2dTR0h9a8Iu78siIm7OBPEhnIm1cph91SjEvb692y85FBBM3BoGbCtd0t
	meW0z0pDp7eZW4XBrR2eFUqmeUAQx2U+Gma+fex0XkWgEUbZFK8nzLbz9zp8aRAYbdr0
	kWyw==
X-Received: by 10.66.100.227 with SMTP id fb3mr754786pab.26.1382056485799;
	Thu, 17 Oct 2013 17:34:45 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id ho3sm6184508pbb.23.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 17:34:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 17:34:23 -0700
Message-Id: <1382056463-23262-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH] libdc1394: Remove redundant dependencies
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
X-List-Received-Date: Fri, 18 Oct 2013 00:34:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
index 87a12bd..2ce439d 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://sourceforge.net/projects/libdc1394/"
 SECTION = "libs"
 LICENSE = "LGPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c848e78d9a4a5cc69906178e4d6fbd64"
-DEPENDS += "libxv virtual/libsdl virtual/libx11 libusb1 libraw1394"
+DEPENDS += "libusb1 libraw1394"
 
 PV = "2.2.1+gitr${SRCPV}"
 
@@ -15,6 +15,6 @@ SRC_URI = "git://git.code.sf.net/p/libdc1394/code;branch=master;protocol=git \
 
 S = "${WORKDIR}/git/${PN}"
 
-inherit autotools pkgconfig sdl
+inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-doxygen-doc"
-- 
1.8.3.2


