Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4008F770CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:27 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so9267682wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=pu4nD+2WqXrJm9Cm9Iyd8ZHW/iobWWLy7FRHCA5oXEY=;
	b=zQcR98sPfVgbPipz/0aZ+gY9nnQmWuZ8FYXoOGcN70duT0Gw1cNbzm1KwjfROko8XQ
	67k65B4SmarsGgCn1waDQS5Cw9At3BR8uclSAtb7FU9JH3xztuzHgYWjEJQqnYSUHxpW
	Vx1zbxkQfQyg5usKflGAIC385h+XZ9oZO16eglTWar/EJ2KrGilfankgX75aNPl3YL9L
	iQXkmWHfKm8erXOOZCJhHqxwBKs940OpE1dbc37JlljF/dblVys6yu1vqK9EPXZMj1ai
	rr6Pem9qVInJHCbNTSTVK60+oNCizWn7HbT++UXsGZfmU67BcJCVM1dxsjJJNQf2gwvd
	pjjw==
X-Received: by 10.194.2.144 with SMTP id 16mr8212679wju.90.1446207267896;
	Fri, 30 Oct 2015 05:14:27 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:45 +0100
Message-Id: <1446207225-15386-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 13/13] fontforge: avoid cloning uthash during do_compile
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
X-List-Received-Date: Fri, 30 Oct 2015 12:14:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
index eb40eaa..21f955f 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=3f922b42ed0033fa0fd4cd3268f6429c \
 "
 
-DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
+DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash"
 DEPENDS_append_class-target = " libxi"
 
 inherit bootstrap pkgconfig pythonnative distro_features_check
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


