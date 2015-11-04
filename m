Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 30EA677147
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:28 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so42200900wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=DcihCeK5o5l9JBB0h1ahzFbDT173Ogy/rmk7dpOWvvE=;
	b=FJZ63zHYUlGXr2G+k6bkO5ksj2kT0K8fQNxa8ba8KXsVjzCuPq4zqPCxpqsA2Up3PI
	munK+R+CNJ6fIrPAZjRJV2XfJ787AOeY+mRx8old1frQsWFsONKB/D4TQFTGc30msDvj
	aohjseQAXRh7HaMLwIj8T5kwMAqon7fXfevlcIaeDUqBflXLvrfTXixmjgegK6fyybpl
	OV3RVorIfvm1yaxX/i3v6tOL2XplLNphGTp7bsonRb1GW2PzXdHR4VY2jXakdqUQ9MxB
	bnNC7KiUzWbbxMTtadpFDCiRfE0GGn0zaEu7raNxJgpdR1qdvNOdSShodMeiU5dsGlm7
	VJqg==
X-Received: by 10.194.249.137 with SMTP id yu9mr4779119wjc.108.1446680668158; 
	Wed, 04 Nov 2015 15:44:28 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:53 +0100
Message-Id: <1446680640-31722-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 11/18] fontforge: use autotools-bootstrap.bbclass
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
index eb58d8f..5fab79c 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
@@ -6,10 +6,11 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=3f922b42ed0033fa0fd4cd3268f6429c \
 "
 
-inherit autotools pkgconfig pythonnative distro_features_check
-
 DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
 DEPENDS_append_class-target = " libxi"
+
+inherit autotools-bootstrap pkgconfig pythonnative distro_features_check
+
 REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
 
 SRC_URI = "git://github.com/${BPN}/${BPN}.git"
@@ -19,13 +20,6 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF_append_class-native = " with_x=no --disable-python-extension --disable-python-scripting"
 
-do_configure_prepend() {
-    currdir=`pwd`
-    cd ${S}
-    ./bootstrap --force
-    cd $currdir
-}
-
 EXTRA_OEMAKE = "CFLAGS='${CFLAGS} -I${B}/uthash/src'"
 
 PACKAGES =+ "${PN}-python-dbg ${PN}-python"
-- 
2.1.0


