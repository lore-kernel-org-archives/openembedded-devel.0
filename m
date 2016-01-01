Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id F374F73187
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2016 23:13:28 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l65so111888427wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jan 2016 15:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=QqFUych5zSL4+TbUX38yePKS6oEZM3cBU8OnWsgyJRM=;
	b=ahsvoAMwDWUDRsa2Yc038Qm/cvG036sB9/d0b/d0QXLOFHf4k4rMuZQ3QNlQztyQJD
	lc9+T55f0dXGlJcyxjmCbWhHuT5h8/G5+RM98EYMLcBKtjJIfi6N9w4JwITsCO6vbiaX
	6rL83Pt//K9OfenczomOA0fPoXi0bPZB19g6U/Y+ffZYLRsRJl2LUNeJiwrJTvr94Bm7
	KmYOPD0qngpao2uCO6WjqoqORdrcAKkJrFhQ0kp5kustzod8F4FWAguvd5ZDCX4bb/aA
	omKmZbIPz/7wf/xfIg/OljfJ4xOY5XItsDrvhrSjT+jzJ3WZJ/kpu7WN6aHPy5ZOl403
	+GWg==
X-Received: by 10.28.30.210 with SMTP id e201mr75209063wme.42.1451690009181;
	Fri, 01 Jan 2016 15:13:29 -0800 (PST)
Received: from localhost.localdomain (p4FDF0FE4.dip0.t-ipconnect.de.
	[79.223.15.228]) by smtp.googlemail.com with ESMTPSA id
	s129sm22130308wmf.18.2016.01.01.15.13.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jan 2016 15:13:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jan 2016 00:13:12 +0100
Message-Id: <1451689992-28225-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1451689992-28225-1-git-send-email-schnitzeltony@googlemail.com>
References: <1451689992-28225-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] libsdl2-ttf: initial add 2.0.12
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
X-List-Received-Date: Fri, 01 Jan 2016 23:13:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it is sdl2 version of libsdl-ttf and reuses patches from libsdl-ttf

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{libsdl-ttf-2.0.10 => files}/configure.patch   |  0
 .../use.pkg-config.for.freetype2.patch             |  0
 .../libsdl-ttf/libsdl2-ttf_2.0.12.bb               | 31 ++++++++++++++++++++++
 3 files changed, 31 insertions(+)
 rename meta-oe/recipes-support/libsdl-ttf/{libsdl-ttf-2.0.10 => files}/configure.patch (100%)
 rename meta-oe/recipes-support/libsdl-ttf/{libsdl-ttf-2.0.10 => files}/use.pkg-config.for.freetype2.patch (100%)
 create mode 100644 meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb

diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/configure.patch b/meta-oe/recipes-support/libsdl-ttf/files/configure.patch
similarity index 100%
rename from meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/configure.patch
rename to meta-oe/recipes-support/libsdl-ttf/files/configure.patch
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/use.pkg-config.for.freetype2.patch b/meta-oe/recipes-support/libsdl-ttf/files/use.pkg-config.for.freetype2.patch
similarity index 100%
rename from meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/use.pkg-config.for.freetype2.patch
rename to meta-oe/recipes-support/libsdl-ttf/files/use.pkg-config.for.freetype2.patch
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb
new file mode 100644
index 0000000..47ce115
--- /dev/null
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Simple DirectMedia Layer truetype font library"
+SECTION = "libs"
+DEPENDS = "virtual/libsdl2 freetype"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=cdd16c6436d6b8fcbdd22a54d68c6dd3"
+
+SRC_URI = " \
+    http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${PV}.tar.gz \
+    file://use.pkg-config.for.freetype2.patch \
+"
+
+S = "${WORKDIR}/SDL2_ttf-${PV}"
+#EXTRA_OECONF += "SDL_CONFIG=${STAGING_BINDIR_CROSS}/sdl-config "
+
+inherit autotools
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_configure_prepend() {
+    touch ${S}/NEWS ${S}/README ${S}/AUTHORS ${S}/ChangeLog
+
+    # Removing these files fixes a libtool version mismatch.
+    MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
+
+    for i in ${MACROS}; do
+        rm -f ${S}/acinclude/$i
+    done
+}
+
+SRC_URI[md5sum] = "79787216b56cb4707f39d538f2225e00"
+SRC_URI[sha256sum] = "8728605443ea1cca5cad501dc34dc0cb15135d1e575551da6d151d213d356f6e"
-- 
2.5.0


