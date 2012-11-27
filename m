Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS5b-0005cR-4B
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:49:07 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=RWuJkVN8YpXQghQyUpIVVmB6jAjBYgzM64a/gK92O2U=;
	b=lQ3qchgRBwg4seFC8kK0YCkIppJorueXxozFSFHb1fPrR+Sj1/RXNXFJrHacSNSqI6
	sX+lyUYIm5liU1dxmY6WaS0CEIdO8K7DjLxZwmAY+kFtBNCYt1bIYhEBpIZG00Wu8TzG
	26atTXj9oGLADkVz7AJYL60evmwdLHmNDnQJxKHPMAGz2/OQcHdPkJsNKbPD+cbn8gKf
	MM/GlLY+gixaEWGw9FYNL65lAPVhg5yASewcf8o7coS72WEhi8YLcm1DQ7n4Wt4ZxujR
	I4jBTSodqii8Z8cDY39ZYjNrZ2ug6POm34TptC98FIt6KZL/yNRnbEgOLWF3lwKRpPS2
	d6Zw==
Received: by 10.14.199.134 with SMTP id x6mr62055953een.31.1354048495997;
	Tue, 27 Nov 2012 12:34:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm42851306eep.15.2012.11.27.12.34.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:34:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:44 +0100
Message-Id: <8a89f767d72414fbbb2bd87e6378aab3097c9479.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 07/21] ecore: disable some X extensions for native recipe and add libxfixes to target DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 20:49:07 -0000

* at least native libxrandr libxdamage libxcursor libxcomposite
  libxfixes are autodetected sometimes, leading to irreproducible builds
  and failing edje_cc
  /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/edje_cc: error while loading shared libraries: libXcursor.so.1: cannot open shared object file: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ecore.inc | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/ecore.inc b/meta-efl/recipes-efl/efl/ecore.inc
index 7744501..d329f57 100644
--- a/meta-efl/recipes-efl/efl/ecore.inc
+++ b/meta-efl/recipes-efl/efl/ecore.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Ecore is the Enlightenment application framework library"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d6ff2c3c85de2faf5fd7dcd9ccfc8886"
 DEPENDS = "virtual/libiconv tslib curl eet evas glib-2.0 gnutls \
-           libxtst libxcomposite libxinerama libxscrnsaver libxdamage libxrandr libxcursor"
+           libxtst libxcomposite libxinerama libxscrnsaver libxdamage libxrandr libxcursor libxfixes"
 DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
 # optional
 # DEPENDS += "directfb virtual/libsdl openssl virtual/libiconv"
@@ -10,7 +10,7 @@ DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
 inherit efl gettext
 
 BBCLASSEXTEND = "native"
-INC_PR = "r1"
+INC_PR = "r2"
 
 do_configure_prepend() {
     touch ${S}/po/Makefile.in.in || true
@@ -96,4 +96,19 @@ EXTRA_OECONF = "${ECORE_OECONF} \
 EXTRA_OECONF_virtclass-native = "\
                  ${ECORE_OECONF} \
                  --disable-curl \
+                 --disable-ecore-x-composite \
+                 --disable-ecore-x-damage \
+                 --disable-ecore-x-dpms \
+                 --disable-ecore-x-randr \
+                 --disable-ecore-x-render \
+                 --disable-ecore-x-screensaver \
+                 --disable-ecore-x-shape \
+                 --disable-ecore-x-sync \
+                 --disable-ecore-x-xfixes \
+                 --disable-ecore-x-xinerama \
+                 --disable-ecore-x-xprint \
+                 --disable-ecore-x-xtest \
+                 --disable-ecore-x-cursor \
+                 --disable-ecore-x-input \
+                 --disable-ecore-x-dri \
 "
-- 
1.8.0



