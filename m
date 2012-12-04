Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi6i-00040y-IW
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:19:50 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926936eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Fn4zEmEU1u/l4rc9toFiO8TcO3d+dWPWTrWklEGwmWw=;
	b=S6yAO54HwqBwQc9AYLK0zQN1i+r/yvFVBYN3gZDeWsEI2Xx/90JNy4EPuI91VWzR3I
	VsZ/hWCPerUnqI6Vm0eAErBi8elpy+eaKfL7rnh5Ru387DlucG+weTadatOtaOfntx1e
	MjRpJPKWHRfzSPQSbkKaY22tso5lPUhkW372mWswufphXyHOpRLCOk0KfWVqvfl26AOV
	eTseSEQ/p2nYuiNY5dV46sGalzfTlURhpW0ieFc3K1snjiGEAWuPC74xn9iyc+J9rP5f
	k6QH6l/t8th6R3FHHiQTtnvC3+WAjCfoYcmw+643mtfbgmUVhlsJowxThF/ecDykTUaR
	Z/Yg==
Received: by 10.14.194.4 with SMTP id l4mr42755254een.42.1354586716985;
	Mon, 03 Dec 2012 18:05:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm8844087eeo.13.2012.12.03.18.05.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:05:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:14 +0100
Message-Id: <5fbe36c977a1eca71a265856bacff52232749a12.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 41/58] libgnome: fix QA warnings from packaging
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
X-List-Received-Date: Tue, 04 Dec 2012 02:19:51 -0000

* fixes:
libgnome-2.32.1: non -staticdev package contains static .a library: libgnome-dev path '/work/armv7a-vfp-neon-oe-linux-gnueabi/libgnome/2.32.1-r0/packages-split/libgnome-dev/usr/lib/bonobo/monikers/libmoniker_extra_2.a'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
index 4acbfa7..0c0a0df 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
@@ -5,6 +5,8 @@ SECTION = "x11/gnome/libs"
 
 inherit gnome lib_package
 
+PR = "r1"
+
 SRC_URI[archive.md5sum] = "a4345e6087ae6195d65a4674ffdca559"
 SRC_URI[archive.sha256sum] = "b2c63916866485793b87398266dd7778548c1734923c272a94d84ee011b6f7a4"
 
@@ -20,6 +22,6 @@ do_configure_prepend() {
 
 FILES_${PN} += "${libdir}/bonobo/servers ${libdir}/bonobo/monikers/*.so \
                 ${datadir}/gnome-background-properties ${datadir}/pixmaps"
-FILES_${PN}-dev += "${libdir}/bonobo/monikers/*a"
+FILES_${PN}-dev += "${libdir}/bonobo/monikers/*.la"
+FILES_${PN}-staticdev += "${libdir}/bonobo/monikers/*.a"
 FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug"
-
-- 
1.8.0



