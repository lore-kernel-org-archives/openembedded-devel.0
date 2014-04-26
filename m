Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 077EF60782
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:58 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id r10so4325272pdi.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6l/WTGYlIPuVks0MSY3qUTmD2tKHhsKK3zoV/KsPNcc=;
	b=jfngpKBU4hw8jYhextEKs6lQB7/jMRQqGPGmUWXLEpYOlHsTAZLaR2asF8n5f+v1kN
	rjvVLFeiuEpn1pXVXpdZ1P0OS/H9M9o+Vo8m+OkL/MzmVR4l3DwP6EhRDkPp4Zlm/vwJ
	Ysx3w7nF34eTctggnKah32o5tAV1PXBxFp8iuFx0A+I5mJ3Dnt9RzTd8/ytjIJMuS+dp
	mOnlbMjUwnNnqnsyRXEBbpOYkMsYvkL0N7rBJiBzOIlFwG6AHIIsIJzFh5WYFFWGZYwA
	8C6sluwn0hUqtbQqRBKDaQkD6j00iIq5GfbHHlwg15rYSnq34jmOwfH27tQ6Uur3VfT1
	iReg==
X-Received: by 10.66.150.228 with SMTP id ul4mr16059079pab.16.1398544380321;
	Sat, 26 Apr 2014 13:33:00 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:44 -0700
Message-Id: <1398544484-27299-21-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 21/21] abiword: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
index 073622a..39780bb 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "x11/office"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
 DEPENDS     = "perl-native wv libglade libfribidi jpeg libpng \
-               librsvg libwmf-native gtkmathview asio gtk+"
+               librsvg libwmf-native gtkmathview asio gtk+ evolution-data-server"
 RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
                glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
 RCONFLICTS_${PN} = "${PN}-embedded"
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "d17e318c00ff4eb353e0e7994b098b1d4f9ddd8712ac0261a0e38b8908
 #want 3.x from 3.x.y for the installation directory
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 PACKAGECONFIG ??= "collab-backend-xmpp collab-backend-tcp collab-backend-service"
 PACKAGECONFIG[spell] = "--enable-spell,--disable-spell,enchant"
@@ -44,17 +44,16 @@ EXTRA_OECONF = " --disable-static  \
 # AbiWord configure.ac does not play nicely with autoreconf
 # so use the autogen.sh script that comes with AbiWord
 do_configure() {
-    install -m 0755 ${WORKDIR}/autogen-common.sh ${S}/autogen-common.sh
-    cd ${S}
+    install -m 0755 ${WORKDIR}/autogen-common.sh ${B}/autogen-common.sh
     ./autogen-common.sh
     autotools_do_configure
 }
 
 do_compile() {
-    cd ${S}/goffice-bits2
+    cd goffice-bits2
     make goffice-paths.h
     make libgoffice.la
-    cd ${S}
+    cd ${B}
     oe_runmake
 }
 
-- 
1.7.10.4


