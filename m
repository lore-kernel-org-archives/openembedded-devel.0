Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8628260043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:53:48 +0000 (UTC)
Received: by wicgk12 with SMTP id gk12so11936040wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=rzlPsi4vx2+a/5UMStLzDFMmJcxwZVrD0dfSTTmwLIA=;
	b=EI0DffSK/9fIT1pe5qFdcNdJhG1h+vU5bxiB2HjvBf4CDA6cpyZP7/RkL7eiGLHExk
	GqoC8TJ97FlZG9NpGkjztzYacSkX1UaCwUwYUo6tmVal7whr2uwpRCwQaHjTBj2v7FVC
	xXrwEIzGFsF2J+MrLbl44fdbO6ZlFP0QvcbMX4qIp68nc3sgpi4oxdtBYXknR70fvCOU
	DzTy9wy+bLZ6LLITeUd9IXs+bz5FsbieeKKWdoiFv/wg/rUD6FhOKncuwj2137o9eGOd
	JTpsGZWp8InGWX7xYz3X+MnkMx7xbJfTkBjJ5Zil0QHufV0qa+yJk9eWyJE4Y1LItv8P
	UtfA==
X-Received: by 10.181.13.204 with SMTP id fa12mr20428873wid.24.1440687228157; 
	Thu, 27 Aug 2015 07:53:48 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	p5sm12973681wiy.17.2015.08.27.07.53.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 07:53:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:53:13 +0200
Message-Id: <1440687197-26742-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] fontforge: update to 20150824
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
X-List-Received-Date: Thu, 27 Aug 2015 14:53:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* LICENSE was rewrittem stating out more clearly that huge parts were initially
  licensed under BSD clause 3 - so add that licence.
* Follow suggestion not to use github release tarballs [1] and use git as
  source.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2015-August/102843.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{fontforge_20141126.bb => fontforge_20150824.bb}          | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/fontforge/{fontforge_20141126.bb => fontforge_20150824.bb} (77%)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
similarity index 77%
rename from meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
rename to meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
index a2d6cc6..eb58d8f 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A font editor"
 HOMEPAGE = "http://fontforge.github.io/en-US/"
-LICENSE = "GPLv3"
+LICENSE = "BSD-3-Clause & GPLv3"
 LIC_FILES_CHKSUM = " \
     file://COPYING.gplv3;md5=d32239bcb673463ab874e80d47fae504 \
-    file://LICENSE;md5=71d636ba7678baa1573e1b531041386e \
+    file://LICENSE;md5=3f922b42ed0033fa0fd4cd3268f6429c \
 "
 
 inherit autotools pkgconfig pythonnative distro_features_check
@@ -12,9 +12,10 @@ DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
 DEPENDS_append_class-target = " libxi"
 REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz"
-SRC_URI[md5sum] = "0d6f5112c4e5689087339a94aceadf77"
-SRC_URI[sha256sum] = "9c90c640023463c0b2b97b87575a014fcf44f688c3763f4cd136d3c267092106"
+SRC_URI = "git://github.com/${BPN}/${BPN}.git"
+# tag 20150824
+SRCREV = "07d5ccff2704f8a56f1b3cc6695a4e31f85f88e6"
+S = "${WORKDIR}/git"
 
 EXTRA_OECONF_append_class-native = " with_x=no --disable-python-extension --disable-python-scripting"
 
-- 
2.1.0


