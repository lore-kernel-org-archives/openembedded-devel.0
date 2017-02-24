Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id B2B1D6E630
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 23:06:41 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r90so4675980qki.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 15:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IvXuTMAWqGdzgOyf7s7owvnNUFPBMDIpLJuzfPydARk=;
	b=AqxqI+l5+U93jfD+KdWEwdBSv75zyYgzovR9PXxD5FZfWmL3gkWOy2Amoi6+zKowYq
	EGn+svsHtPdVxnlLv/boiabI98EvUGIErnIrLHDJKLBIkxqjhWAb9achFDJjQH5Ev2g/
	TT1TnGGEnSI8G+8RpSedBndlOSaO25z/JgSTd2raPrtv/0H8Z6lojw1V+K9gSb7C+2nf
	ZqB1ciyI0AaggG6fQstzXTLySfqoK4kNp2okbUgBDKVYbNLEykO5ynbPOrQ/eHOoXlVe
	jp357OtjbRYmD/TyEYmbvB0P2f3gqE4EkXy1euY14kv7yLeF8NXSIjTItIZNPAbUbqOF
	tPzg==
X-Gm-Message-State: AMke39mjqxnym5WNRa+YSTDooe16eJ2drLBcPy3ThFYBioCNBUusV94g85FJCI8Upy7sjA==
X-Received: by 10.55.161.140 with SMTP id k134mr4903374qke.171.1487977602356; 
	Fri, 24 Feb 2017 15:06:42 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	l91sm5676903qte.55.2017.02.24.15.06.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 15:06:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 18:06:35 -0500
Message-Id: <1487977595-2418-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] font-adobe-utopia-100dpi: update depends to fix builds with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 23:06:41 -0000

Resolves build issue exposed by RSS
See http://errors.yoctoproject.org/Errors/Details/130623/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
index 54be284..898850b 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
@@ -6,7 +6,7 @@ SECTION = "x11/font"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fa13e704b7241f60ef9105cc041b9732"
 
-DEPENDS = "util-macros-native font-util-native bdftopcf-native"
+DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS_${PN} = "encodings font-util"
 RDEPENDS_${PN}_class-native = "font-util-native"
 
@@ -16,5 +16,3 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "66fb6de561648a6dce2755621d6aea17"
 SRC_URI[sha256sum] = "d16f5e3f227cc6dd07a160a71f443559682dbc35f1c056a5385085aaec4fada5"
-
-PNBLACKLIST[font-adobe-utopia-100dpi] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130623/"
-- 
2.7.4


