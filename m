Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id AAE3C6D749
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2013 09:25:35 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y13so2326726pdi.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2013 01:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XHtRYcb7cMbulIMVy3mAoaOdrIid32nqR8XdYE3ULJg=;
	b=YbpQBNlWcAHyDITcOcNp9giKf69zvE0msG838lFNr+3gnaK1lfwgF7KWjD61XY+lA6
	tLs01u5WxAPdFmJPZ5JM66AS+4X44Hj2lhDWI1MpXRF+lv1YkRgpEZNz6ot6xXl2nuxl
	umSsnxosDisIqs8D7Ou4s4h0CwEfPajniciEA5soZWbru6t7PBGLErYq0HczNcr9SiaH
	ltR7rCbGWCJANE2tveebPWapEdWD6VCp4HAZjpX1FWGDjW7np9++3KPGNLdLvl2oTbr/
	nZMxdkC5p8fWrSgCbq19E/kzuUS8ZbyHpez4wW3B7P2Q4FR2zFSQBHKOQzd3AGEqP1KJ
	+hqQ==
X-Received: by 10.68.143.196 with SMTP id sg4mr9170766pbb.155.1386408335394;
	Sat, 07 Dec 2013 01:25:35 -0800 (PST)
Received: from ghoda.gateway.pace.com
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id vi2sm3102759pbc.21.2013.12.07.01.25.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Dec 2013 01:25:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2013 01:25:33 -0800
Message-Id: <1386408333-18772-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-gnome][PATCH] libgnomeprint: Upgrade 2.18.7 -> 2.18.8
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
X-List-Received-Date: Sat, 07 Dec 2013 09:25:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome/{libgnomeprint_2.18.7.bb => libgnomeprint_2.18.8.bb}  |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/gnome/{libgnomeprint_2.18.7.bb => libgnomeprint_2.18.8.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
rename to meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
index 606c752..13550d7 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
@@ -1,8 +1,6 @@
 LICENSE = "GPLv2"
 SECTION = "x11/gnome/libs"
 
-PR = "r2"
-
 DEPENDS = "libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome-common freetype"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
@@ -12,9 +10,8 @@ inherit pkgconfig gnome
 SRC_URI += "file://fix.includes.patch \
             file://freetype.patch \
            "
-
-SRC_URI[archive.md5sum] = "d66b81ee8aa3b3a33f5efc9a47ce07e3"
-SRC_URI[archive.sha256sum] = "8b34f81599423ef3da9c43775495da602f83cbbee069c9e760ffeae6aa4768e6"
+SRC_URI[archive.md5sum] = "63b05ffb5386e131487c6af30f4c56ac"
+SRC_URI[archive.sha256sum] = "1034ec8651051f84d2424e7a1da61c530422cc20ce5b2d9e107e1e46778d9691"
 
 FILES_${PN}-dbg += "\
     ${libdir}/${PN}/${PV}/modules/.debug \
-- 
1.7.10.4


