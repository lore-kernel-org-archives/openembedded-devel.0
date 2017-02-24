Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 093C1774D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 23:10:01 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n127so4725310qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 15:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xDrsHKjslPK00SSiCngtjECnj6qdO2kBSH4m/PqJDyI=;
	b=YD4eYxbJUTjR0haVPOpPxHBnB1rckebKJXyjSRABpK5Q4hwXSMsGuYyb49ZbHdU0pX
	EZUIACJj1CjHC0hApxURxPgAyCF4isfvSPHS1WyhgieCFxXKDGL8KlSXwH2mnQnrj/0b
	LDlO6PLcFcGCWBidnYDDu8gxwBqrq6H1u+l8E+u2tFCt/CIXzoi0mXIbmp72hGSziiiY
	+WBoBPhOUtvZOr6ac0OFN+UQxTH2EGes0ET3DubY7m9+GU6R0R1A1Y6xe7XFSWK413dh
	3axfDxzF/xoXWXMgq2gfxlUuC3Iz9IJ+MRdSSbf9flS8ub3M8XOJvdDgTdKaE39QMrE4
	aEgA==
X-Gm-Message-State: AMke39nA7xCqOYJeTZVGI/BsmKZQ1Fwba4cLOG2B5VLjr+Bahcd5QPSh6BYI2d3oynAxuA==
X-Received: by 10.55.39.147 with SMTP id n141mr5084494qkn.103.1487977802917;
	Fri, 24 Feb 2017 15:10:02 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	k62sm5723463qkd.21.2017.02.24.15.10.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 15:10:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 18:09:53 -0500
Message-Id: <1487977795-2611-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/3] font-misc-misc: update depends to fix builds with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 23:10:02 -0000

Resolves build issue exposed by RSS
See http://errors.yoctoproject.org/Errors/Details/130628/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
index 342572a..e4cd90a 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
@@ -6,7 +6,7 @@ SECTION = "x11/font"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=200c507f595ee97008c7c5c3e94ab9a8"
 
-DEPENDS = "util-macros-native font-util-native bdftopcf-native"
+DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS_${PN} = "encodings font-util"
 
 inherit distro_features_check
@@ -15,5 +15,3 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "c88eb44b3b903d79fb44b860a213e623"
 SRC_URI[sha256sum] = "b8e77940e4e1769dc47ef1805918d8c9be37c708735832a07204258bacc11794"
-
-PNBLACKLIST[font-misc-misc] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130628/"
-- 
2.7.4


