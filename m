Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 39180760A3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:10 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id gi1so30430803pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ArKrursLWPiLBPM8O/MydjpSUxwrLGcvtixkre3cIqY=;
	b=leIwMhUa+e3bGtSlcH9/ra7HFPJ+Of8i8zk0XnuvvQZ2PFNS6hhyY39amWiSRnrnFF
	yBAQQWbTl2CnBhqLalA2/slTxBzmuapNiXga2B9hcDlxuCJ5siTqqSSz6iy0gZB6K8Ww
	ED7f+GIn/agFQHpGW3N5uVZDn7ud1VaB4c9VXerTTnOoKdvD1EG1vyaX9VIJJ9tnsJIP
	050e6xJlE+Bp40baNb+cAAr8+iFJYT+BGyR8YsVTMdMLSMLVZj52RlhWuVKlzXuijuIO
	KoOJT2RBKHEHHOJF5gLwtjCOebsRQEWg7wNnzifCIQ5KX3E9k4Y/+ovL9TMuGY2XLSI9
	ja3g==
X-Received: by 10.66.55.66 with SMTP id q2mr103932135pap.120.1452387611291;
	Sat, 09 Jan 2016 17:00:11 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 7sm13756865pfc.69.2016.01.09.17.00.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 17:00:05 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 521DDFCC84A; Sat,  9 Jan 2016 16:59:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:41 -0800
Message-Id: <c3f058af9c5a033a8fe7feb158ce030e512f0fcb.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 18/22] polkit-gnome: remove unrecognized configure options
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
X-List-Received-Date: Sun, 10 Jan 2016 01:00:10 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Fix QA warning:
WARNING: QA Issue: polkit-gnome: configure was passed unrecognised options:
--disable-examples --disable-introspection [unknown-configure-option]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
index be33908..8e99731 100644
--- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
@@ -13,11 +13,7 @@ SRC_URI = "https://download.gnome.org/sources/polkit-gnome/${PV}/polkit-gnome-${
 SRC_URI[md5sum] = "50ecad37c8342fb4a52f590db7530621"
 SRC_URI[sha256sum] = "1784494963b8bf9a00eedc6cd3a2868fb123b8a5e516e66c5eda48df17ab9369"
 
-#PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
-
 EXTRA_OECONF = "\
-    --disable-examples \
-    --disable-introspection \
     --disable-static \
 "
 
-- 
1.9.1


