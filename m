Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E582B6E64A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 14:19:49 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id f206so215498174wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 06:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yDgvFCa/+lBCWK+g4C3pWf2LyJS6pzPENMX+/k9F++Y=;
	b=WZH2GXiDs76StGoQ+8HeUILiAvGRaD+Q5it2blgaiTsIY6StWcDQWxYxSSxc5FOTj2
	wsTk9kzw2AukLV9qGslkU7cOM1jdLY/Gd9D2NG3OoMNzOG+vBFRw1XK+6S0/ol2yH6Ev
	lsRiTyb7hk2MIe6NXtufvNoHhbHkjsjY1jNZcL8l09gSmTf5iWUb03Xr+otIzLoj9ADR
	bBwQ3zYBeHvaVie9YvuWXK6WY4aoapBgekNOiXz3+njWiiAjwUBfXR0jJ9o5yIhXsf8C
	6SjzmrTR/km7+kwGcb0XY8xv6Lh7jBf4ZGso+7/3sRDl/12YhPpb1n2FJta03AHgQKQd
	r6ig==
X-Received: by 10.28.173.71 with SMTP id w68mr61888688wme.88.1451917189957;
	Mon, 04 Jan 2016 06:19:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	143sm78205236wmv.18.2016.01.04.06.19.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 06:19:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jan 2016 15:23:59 +0100
Message-Id: <1451917439-25774-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][meta-oe] xf86-video-{nouveau, ati}: blacklist because of xorg-xserver upgrade
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
X-List-Received-Date: Mon, 04 Jan 2016 14:19:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb     | 3 +++
 meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
index d4d9591..bc2e957 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
@@ -13,5 +13,8 @@ RRECOMMENDS_${PN} += "linux-firmware"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
+# http://errors.yoctoproject.org/Errors/Details/25837/
+PNBLACKLIST[xf86-video-ati] = "not compatible with xorg-xserver 1.18.0 from current oe-core"
+
 SRC_URI[md5sum] = "5ab9a826699e5c86ef89fca43ebb3821"
 SRC_URI[sha256sum] = "f30f5efdc8d7d18d06eda7ef2f91a8b7290f1cfbf6ff26362cd47ab8969daec4"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb
index 7b52de0..71a0362 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb
@@ -12,5 +12,8 @@ RDEPENDS_${PN} += "xserver-xorg-module-exa"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
+# http://errors.yoctoproject.org/Errors/Details/25839/
+PNBLACKLIST[xf86-video-nouveau] = "not compatible with xorg-xserver 1.18.0 from current oe-core"
+
 SRC_URI[md5sum] = "8b2c0df5de3929597ade8c5ddb489a44"
 SRC_URI[sha256sum] = "b247c800e532fad1c80a5666d8ca0d4e5712064b6d7a3b030b32206a8de04482"
-- 
2.6.4


