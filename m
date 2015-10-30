Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D26C376F58
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:25 +0000 (UTC)
Received: by wmff134 with SMTP id f134so10431564wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=/cwpZrhn/oydeVn6DBC0WEzMVoKe1XcHhEVJAITVmWM=;
	b=O618OoSreCAwCciaP288OqZBk9uvgLdpetGdjHWZLTOLsCeUg2wmq/UIHOvQJqH2EQ
	LkPRI5QVvhtkIKhRSfYiPUazuxk6rXqCGxgaHn6V06wk74oHT/1jNjZKlpSoHPKcXPBR
	CUEb2hFNR9yWt/IKjC0rNLfDh9G7Za1h9j/7UATeF0XPz5AyZySu83dSCH3M9A+a5+ho
	pgb88x41GFrHBppdRd/dmMEnz2/UT+KZnzH8jpjFSHimS9ln1As3fCS+KLDGyZ69iB3f
	52fgED7kNHXpaInR5pQLGmJFcFB3CBq5ZjnTqhJut1qBpfFljiNMrqXcJ1tSgJr2s2RN
	mrwg==
X-Received: by 10.28.6.70 with SMTP id 67mr3273273wmg.54.1446207266000;
	Fri, 30 Oct 2015 05:14:26 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:43 +0100
Message-Id: <1446207225-15386-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 11/13] fontforge: use bootstrap.bbclass
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
X-List-Received-Date: Fri, 30 Oct 2015 12:14:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
index eb58d8f..eb40eaa 100644
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
+inherit bootstrap pkgconfig pythonnative distro_features_check
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


