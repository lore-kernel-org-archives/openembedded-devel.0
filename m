Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id ACF3076DC5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:34:12 +0000 (UTC)
Received: by wicfv10 with SMTP id fv10so46407711wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 03:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=rzlPsi4vx2+a/5UMStLzDFMmJcxwZVrD0dfSTTmwLIA=;
	b=HmxQ44R4OXycs96prNXi0RX+gup1nkxfpKb9RP1L594Ebs9s48IughUx7j2QvQ5K9z
	IuHkQWw4yHDa6kjixB5s15NNWgmWe/r3Ua4Yyo2N1aASeQAe1BLrpsWTw44B7UlvJrJe
	0RpyMTctUuP9FmQgSNBdWbLfIjhp0ZW16AHz/G0MW5UTd1RNpzh95GBGw7BbYT5CZKcO
	3j7dvDHBAWEhu8LYn2vgwrcmtSdO9cWjovqAu/ltk7uJDSFnSRpCw36XstUNHOC1onAn
	AgBEvyRvZV2YNCp6lBlYoiMIBDxqVlN1/bcXR8G/4vBSiaSuhiV7Hu95ryCylbrpro8g
	SNMw==
X-Received: by 10.180.106.68 with SMTP id gs4mr13309162wib.61.1440930852227;
	Sun, 30 Aug 2015 03:34:12 -0700 (PDT)
Received: from localhost.localdomain (p54AA5C5E.dip0.t-ipconnect.de.
	[84.170.92.94]) by smtp.googlemail.com with ESMTPSA id
	h9sm16778522wjx.20.2015.08.30.03.34.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Aug 2015 03:34:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Aug 2015 12:33:55 +0200
Message-Id: <1440930840-3459-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCHv2 1/6] fontforge: update to 20150824
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
X-List-Received-Date: Sun, 30 Aug 2015 10:34:14 -0000
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


