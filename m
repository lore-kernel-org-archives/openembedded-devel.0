Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A00FF7765F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Mar 2017 01:07:06 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 67so3828542pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 17:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PiPRevbn72AhUpCWiZLtu8QYi/rpezJELuv1Brwjp8A=;
	b=d8dcWwwHWamY56AdfW9bbvb6Oat2b2eiNeBJ2yKN8FfqfcG68yUbTC7seihK2C5TCq
	RPs+qUHyMdT6ljox8gflkisDgSobyL4Gx221kwzvooczq71TbjvKf+PdzyXSnbvwq3u+
	8LCiVxd7G4Zt8krya9ZW1Gh1fcQK4Wvb3NvGuXJKdeQP0z9NIVuUbHEbV2PkwC2hHnpl
	1ieFX/i5UxBbcJDVBYMQwu//F6qlSDkHjo9OzdZry4T01NeQUs2ikrUvaO2C+4WLx4WE
	VrMgNmLLyX1uk3X7LR+BpKMzdE/mbQcztR3zPG4kcXDROT5wXFghOcxDNEZ/L3VK3wKu
	xIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PiPRevbn72AhUpCWiZLtu8QYi/rpezJELuv1Brwjp8A=;
	b=GGO2F29iwZfYJ0dEYDdbQtZ+7JFzr0f/ZWZMOreM7o/HKnFioO5ePpCVCGHKA2nEIy
	T2aBIuDTTLFtpFdXcJkERJ4Uny5K2ys18+iyugehWzeuaCbcRFLLT05/VKnMkJYjMky+
	9miv40hsBin6vGSWOMj/4VpynbfRSo9JOXvDYFLUr3vtEHVRO9OlUsHxf0EsDEIrC6dx
	MTOiHAe6j5Zi5eCCUca8HwSmakqxhebPWAfawWGdljIiJfFCcEFpGPazpmeDuqeR8aex
	fmvJ2dYHr+5nWWxKM0xTa8ZboB9vtYt6hbMxXXoyhaBCWVsvykVrd3ALdHWIwHGocdEg
	PCNQ==
X-Gm-Message-State: AMke39mRHPMTzyv5bSO8oSNuC/4AujkAzl/E324og2TOAd0O6TaDyBN6bftOK27FAAmILw==
X-Received: by 10.99.67.130 with SMTP id q124mr138524pga.221.1488503228240;
	Thu, 02 Mar 2017 17:07:08 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	b70sm19298055pfc.100.2017.03.02.17.07.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Mar 2017 17:07:07 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Mar 2017 17:07:01 -0800
Message-Id: <1488503221-17569-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libmng: fix duplicate dependency on lcms + misc cleanup
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
X-List-Received-Date: Fri, 03 Mar 2017 01:07:07 -0000

The dependency on lcms is handled via the PACKAGECONFIG option, so
doesn't need to be hardcoded in DEPENDS. Also update HOMEPAGE, add
support for libmng-native and fix typo in PACKAGECONFIG[lcms].

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
index 3771840..ba928d2 100644
--- a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
+++ b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
@@ -2,13 +2,13 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 DESCRIPTION = "Development files for the Multiple-image Network Graphics library"
-HOMEPAGE = "http://www.libmng.com/"
+HOMEPAGE = "http://www.libpng.org/pub/mng/"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=32becdb8930f90eab219a8021130ec09"
 SECTION = "devel"
-DEPENDS = "zlib lcms"
+DEPENDS = "zlib"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${P}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "7e9a12ba2a99dff7e736902ea07383d4"
 SRC_URI[sha256sum] = "cf112a1fb02f5b1c0fce5cab11ea8243852c139e669c44014125874b14b7dfaa"
@@ -18,5 +18,6 @@ inherit autotools-brokensep pkgconfig
 PACKAGECONFIG ??= "jpeg"
 
 PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
-PACKAGECONFIG[lcms] = "---with-lcms2,--without-lcms2,lcms"
+PACKAGECONFIG[lcms] = "--with-lcms2,--without-lcms2,lcms"
 
+BBCLASSEXTEND = "native"
-- 
1.9.1


