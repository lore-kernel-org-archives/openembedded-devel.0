Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi6q-0002oS-5L
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:19:50 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8tqyNgSJU3ayJKjkU4odv7Vjr70QpBV3p0vPZ+Ip1rs=;
	b=cLZyOlMoV0rP3t2upRZT9H3GoXmTXTkmljrA6kAXXc1xErib7exoeTXUwvNrmhNoGE
	QG4S4jvFEXfq+9um6tw22MB7HS/yjCt+0MDyGTxIrJRNtzRwbj8FQd6Em8frxLYPoNu9
	G/yetKgtu9qfI9DH9smt9uFFaL6311TGNwkmVF/8hpyvys+uBAHKLmvajwUG1frc7lu4
	2CmivKWKcpQtBf+KVFlLckAaB2x/mTWy1unYqKb8RzbYMS0N2ogaHenHe55t/Y+id9SX
	3EJ/smsAX5JzKYC3xSUlvHYsOkZBcdmPzJjVfBzKRKiLp1pE5rhm+GGQYTZeU4z3MJ9h
	RMUQ==
Received: by 10.14.175.198 with SMTP id z46mr42739521eel.26.1354586724344;
	Mon, 03 Dec 2012 18:05:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm34840550eel.17.2012.12.03.18.05.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:05:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:15 +0100
Message-Id: <fb8a379950cf516942ab5917cb0a6d44d80d5f87.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 42/58] libbonoboui: fix QA warnings from packaging
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
X-List-Received-Date: Tue, 04 Dec 2012 02:26:50 -0000

* fixes:
libbonoboui-2.24.3: non -staticdev package contains static .a library: libbonoboui-dev path '/work/armv7a-vfp-neon-oe-linux-gnueabi/libbonoboui/2.24.3-r1/packages-split/libbonoboui-dev/usr/lib/libglade/2.0/libbonobo.a'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
index 328183f..fbbe806 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 inherit gnome pkgconfig gtk-doc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[archive.md5sum] = "3a754b1df0a4d5fd4836a05020a0bb4a"
 SRC_URI[archive.sha256sum] = "0be51ee3069a2ef21d98561ee28036dd263ac08b401776fe9164e084825ffd84"
@@ -13,7 +13,8 @@ SRC_URI[archive.sha256sum] = "0be51ee3069a2ef21d98561ee28036dd263ac08b401776fe91
 DEPENDS = "libgnomecanvas libbonobo libgnome glib-2.0 gconf libxml2 libglade"
 
 FILES_${PN} += "${libdir}/libglade/2.0/*.so"
-FILES_${PN}-dev += "${libdir}/libglade/2.0/* ${datadir}/gnome-2.0/ui \
+FILES_${PN}-dev += "${libdir}/libglade/2.0/*.la ${datadir}/gnome-2.0/ui \
                     ${libdir}/bonobo-2.0/samples"
+FILES_${PN}-staticdev += "${libdir}/libglade/2.0/*.a"
 FILES_${PN}-dbg += "${libdir}/bonobo-2.0/samples/.debug \
                     ${libdir}/libglade/2.0/.debug"
-- 
1.8.0



