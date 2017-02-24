Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id E561B77534
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 23:03:26 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id s186so4706187qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 15:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Q8KleVrxS2o/xILqwwPQP+8tgV6++LVxw31xw2XAKQs=;
	b=Pl+roqM8DTTlbBX6ONjQnv16hTXJdKAd3YirAalqNoMir6/O62OFR82eMAboRDIxZ4
	FaWSbJap8wPV4UlbqBBdi+t4yAYZEh5IstFq/lPNhsu5hmn5RjUtHUexk73oEDjCN2TM
	clAxjU3fVHrnutnHH6CymNFkx4KIlGpZI+48mysFtMkqARvgkHIsTTpFK3NjLUvCt3xa
	6hR1yUb5vYZL//z/nA+Psh1/sUt5g5iGf7YQJ78uF7np0kxbIXUE64oA71QCOhJgto3P
	2kF0Yyjwced6ru37rpZKYgPdV+0dT9rdUh4gbK31BDC1f2EqYiGsgpyExlBq2A8Ps0eG
	FckA==
X-Gm-Message-State: AMke39kK8JUrg5Ge9LRggGPBUbsfL+lWRNNfUq12pt1WjE472F6QSuoOuwuvcuioiNUg+g==
X-Received: by 10.55.198.212 with SMTP id s81mr5483647qkl.132.1487977407956;
	Fri, 24 Feb 2017 15:03:27 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	l53sm5710667qtl.41.2017.02.24.15.03.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 15:03:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 18:03:06 -0500
Message-Id: <1487977386-2344-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] font-adobe-100dpi: update depends to fix builds with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 23:03:27 -0000

Resolves build issue exposed by RSS
See http://errors.yoctoproject.org/Errors/Details/130621/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
index 03ee525..29229bb 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
@@ -6,7 +6,7 @@ SECTION = "x11/font"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5dfa0fdf45473b4ca0acf37d854df10e"
 
-DEPENDS = "util-macros-native font-util-native bdftopcf-native"
+DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS_${PN} = "encodings font-util"
 RDEPENDS_${PN}_class-native = "font-util-native"
 
@@ -16,5 +16,3 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "1347c3031b74c9e91dc4dfa53b12f143"
 SRC_URI[sha256sum] = "b2c08433eab5cb202470aa9f779efefce8d9cab2534f34f3aa4a31d05671c054"
-
-PNBLACKLIST[font-adobe-100dpi] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130621/"
-- 
2.7.4


