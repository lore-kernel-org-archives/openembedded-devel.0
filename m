Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2026977115
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:29 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so256969wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=HPKjZSmCYcsrAzQtQYKX5K6MSS6JxBIFfIEsgN4eOsg=;
	b=bpGbk/W3MZFEiOAl5q8u0U34+ZFdzRaPZfs60wzuv3tl2Pqniw/JR2ukwOupU3Iomv
	D+x6GQjukwOuHf3olSb4eUJpFtIchAd8A2dosb5vkcBFhdBkGv5XlHtRJhgDPVMsCqkE
	5xWM/I7zHYu+dRz7gyACsFwCVGkALi9LYFAwcyzNSEArN51egyWY3mQ+9CjhG/6IRyfH
	4UAUMkvlJo47Fst4+SFieCZDPHZLJg69aLqaD9AWIbitj/hcwxHLVmv6vweClAIRveVr
	LP7/kWzHQcFlRYWhdj7I3+kM8rcE41OHn7Sn+me5DwYiOTaSGPFhFp0NyFlw0CybgGWw
	XDpA==
X-Received: by 10.28.11.208 with SMTP id 199mr6787992wml.75.1446680669894;
	Wed, 04 Nov 2015 15:44:29 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:55 +0100
Message-Id: <1446680640-31722-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 13/18] fontforge: avoid cloning uthash during do_compile
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
index 5fab79c..b50202d 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=3f922b42ed0033fa0fd4cd3268f6429c \
 "
 
-DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
+DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash"
 DEPENDS_append_class-target = " libxi"
 
 inherit autotools-bootstrap pkgconfig pythonnative distro_features_check
@@ -20,7 +20,14 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF_append_class-native = " with_x=no --disable-python-extension --disable-python-scripting"
 
-EXTRA_OEMAKE = "CFLAGS='${CFLAGS} -I${B}/uthash/src'"
+do_configure_prepend() {
+    # uthash sources are expected in uthash/src
+    currdir=`pwd`
+    cd ${S}
+    mkdir -p uthash/src
+    cp ${STAGING_INCDIR}/ut*.h uthash/src
+    cd $currdir
+}
 
 PACKAGES =+ "${PN}-python-dbg ${PN}-python"
 
-- 
2.1.0


