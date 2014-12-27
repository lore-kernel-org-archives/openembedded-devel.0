Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id B7DA672623
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:13 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id ft15so14510014pdb.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=AGoU5ybJ0r5/G7Tk8Sm+vjdjioaiY15ZkO0Dr1SW9lA=;
	b=KyqVahGjJ61+pcqgAVxl2Imo11Ynweqk8ljBVHbdDkqD8MuHd1hoUryIaGYNcGB0LL
	ZiofebGMX4BmTJUTV9T5hlsp0ProwQJGe66Nga1tbvlUWxcUpnqzf3IhmmwrtN00wQOm
	9mze/U70SgDhGE3pVzGHASFqz8Gx8+R1YQs6dNDn8pX7LPbdqdjqLHj1hSBHLun43kQa
	OZVwQqijG4dYTMhRGpdKjInUNQvX9XBZ05443FGMR+IxAF08SytdMJTgpIwhp7B/z2lo
	UnqvoBYlYx+srspBU7AKkLYk+CD7Nqlcn/thQGvzDbiVQIKoNp801/sYtffieiywXBVv
	jB3A==
X-Received: by 10.70.35.227 with SMTP id l3mr76588367pdj.33.1419700934735;
	Sat, 27 Dec 2014 09:22:14 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:48 -0800
Message-Id: <82ce460437189e773308d3d81667938df0207d5a.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 01/27] imagemagick: update URI to allow fetching current and previous releases
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:15 -0000

From: Peter Bigot <pab@pabigot.com>

The only version available at the original URI is patch 9.  All releases
are available at the /releases sub-path.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
index 454db64..7cb8f01 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d84c6ddd4028aa53d028b4c50f9361e"
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 
 PATCHSET = "8"
-SRC_URI = "http://www.imagemagick.org/download/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
+SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
 "
 SRC_URI[md5sum] = "7e96f55156d72ce59c76ec93362ec72a"
 SRC_URI[sha256sum] = "51e0eb0b56e2f16be11c29086a97d474ffd07fe4eb5a9858d8a9c8e9c054c99a"
-- 
1.9.1


