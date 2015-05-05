Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id E302973E6B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 19:09:16 +0000 (UTC)
Received: by iecrt8 with SMTP id rt8so153249688iec.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RFFrJPkRyP/LZTjnG1L2OJ24KBTNnSk/BtiEeWfxk+Q=;
	b=Lld6boVzl7yNL8otHDkmxN0bUSs04uOgwDH1Rc0gr3Vj5d86ge5prUM0h+YSjiuGgh
	WP+TFp6C0cQQ/iqI4f0BOFrDHBvBuYWLmI3Gocyie2+qaoU4te+DjN+IFES2Sns+R4gX
	8rqoeFxpVBwvu5jRRm2EgJRp+9cyj0Uco6u0lMPmpiQldTCCmI1T+6WBaPlj58oZbxJy
	P8ebB0lgVEcJHAohVkkaqbRrR0RVumM5kQjmGAoN3ywskGwABrK2VpT8o/sbMRSu0RVt
	pQ6Mp44Nbv5s7haYZzDVRwX2gkIYeixQER1mTM4dmNBdTleR3fiGx82J/ToPWt+Ip2X+
	wQ4A==
X-Received: by 10.107.3.17 with SMTP id 17mr34651558iod.60.1430852957851;
	Tue, 05 May 2015 12:09:17 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id vk8sm135395igb.4.2015.05.05.12.09.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 12:09:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2015 12:09:07 -0700
Message-Id: <1430852951-18707-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
References: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/7] imagemagick: Update PATCHSET to 10
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
X-List-Received-Date: Tue, 05 May 2015 19:09:17 -0000

PATCHSET 9 is removed from upstream URL

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
index 1252020..accbbed 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d84c6ddd4028aa53d028b4c50f9361e"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 
-PATCHSET = "9"
+PATCHSET = "10"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
 "
-SRC_URI[md5sum] = "971648be6ae5f5070d98e2b6c5fb004d"
-SRC_URI[sha256sum] = "ea0c4f00019b58b290b1329e4e747972c61a00780a67b35df9228a76f26f1592"
+SRC_URI[md5sum] = "c4f70046420db9b22d9dfd1c3d179b55"
+SRC_URI[sha256sum] = "4e702c1c3b4632fde2a93af33dcd3d013a9ebfa598060aca11f06d80676ecbf4"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
2.1.4


