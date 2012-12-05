Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgN7U-0000Dx-MR
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:07:08 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3179783eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iji/Suu5G/rSbhsSIoCwoPznrQLCw5M/lf0JNufuHzQ=;
	b=UEWOrO11SZ2K6+3tdbfQpHg824XIlfhpniZYfS7fCq0FCe/FoUoDcdG5bTidzxINHa
	Xr2OV5cif7P/2FEWPVCItAVtZeL3p/OX/Mql8nyKLJ080rtcWkj6+Q6RzMYqTATAoi0C
	ilodbSAeFxrk7rsAULm96Ygs6QNopY34lH3ugUdHLTaVoN7pVDROBsICG7TxLZ8JBeOu
	0riDI6EHVKjMxJNbnceuY0AI2XFX9ZQ4Rx6IrIzscjiba+c2EQDLccqrY4rQZmnjgDln
	OtrxNqsSUKbds7PKoLuDZ+SwA6gKODep+sqdYGdmMwyAIsIVPuuIeRQDg+H15nCL8NI6
	I+Ng==
Received: by 10.14.2.196 with SMTP id 44mr65167457eef.25.1354744366079;
	Wed, 05 Dec 2012 13:52:46 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm11748114eel.14.2012.12.05.13.52.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:52:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:52:03 +0100
Message-Id: <a5926ffa3f7d8ce9ab2be7b52e8957848c00237e.1354743849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354743849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 80/85] libwmf: fix QA warnings
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
X-List-Received-Date: Wed, 05 Dec 2012 22:07:08 -0000

* fixes:
libwmf-0.2.8.4: non -staticdev package contains static .a library: libwmf-dev path '/work/armv4t-oe-linux-gnueabi/libwmf/0.2.8.4-r2/packages-split/libwmf-dev/usr/lib/gtk-2.0/2.10.0/loaders/io-wmf.a'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index cedfd3b..c06b906 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS_virtclass-native = "libpng-native jpeg-native"
 DEPENDS = "libpng jpeg expat gtk+"
@@ -21,6 +21,7 @@ SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"
 SRC_URI[tarball.sha256sum] = "5b345c69220545d003ad52bfd035d5d6f4f075e65204114a9e875e84895a7cf8"
 
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/2.10.0/loaders/.debug"
-FILES_${PN}-dev += "${libdir}/gtk-2.0/2.10.0/loaders/*.la ${libdir}/gtk-2.0/2.10.0/loaders/*.a"
+FILES_${PN}-dev += "${libdir}/gtk-2.0/2.10.0/loaders/*.la"
+FILES_${PN}-staticdev += "${libdir}/gtk-2.0/2.10.0/loaders/*.a"
 FILES_${PN} += "${libdir}/gtk-2.0/2.10.0/loaders/*.so"
 
-- 
1.8.0



