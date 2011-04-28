Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFais-000510-3F
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 01:34:15 +0200
Received: by pzk36 with SMTP id 36so1974523pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 16:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=vkMvaCS4BuSBfZosByCvK3VKZ6WRAnytKGh5WVTgi0Y=;
	b=Y+enR8TThqfHsHypBsU26Jcs9iJtMGlQh8ORO9lwl7yaUOnCPGLu51TKXfORxb8U37
	+oAVUO2xa741mNwArEWf01bkzpBX9xiHYjwsdLzA9MbTQ+ApxKa72FxD846IZLzIx+6x
	csAdN60d7hZhUw3bfwyskrrUi4aVovIUHfqqU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wyRLgopqFQE7yfhKNGkP5JP9AAhus9RiIGovqjwEZMcWh0hJK89gRVMrrdNUdQWBvu
	ZZv8Kmf3Ff1CY1QIHByclY3eetN5CaQpNJG7t4gGKjtE8fp2k2Z+fG61AYD9AK91iTuU
	bfUJ3fGaycm1TztOBxH++g9KRiAu9ErFEq3W8=
Received: by 10.68.63.36 with SMTP id d4mr555035pbs.60.1304033499718;
	Thu, 28 Apr 2011 16:31:39 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y7sm1508046pbk.30.2011.04.28.16.31.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2011 16:31:38 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Apr 2011 16:31:18 -0700
Message-Id: <1304033478-22959-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1304033478-22959-1-git-send-email-raj.khem@gmail.com>
References: <1304033478-22959-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] libx11_1.4.3.bb: Remove --without-xcb
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
X-List-Received-Date: Thu, 28 Apr 2011 23:34:15 -0000

From: Khem Raj <raj.khem@gmail.com>

--without-xcb is no longer supported and that made a lot of difference
in different BBCLASSEXTENDED recipes. It can be unified now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xorg-lib/libx11.inc      |   15 +++++----------
 meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb |    1 -
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libx11.inc b/meta-oe/recipes-graphics/xorg-lib/libx11.inc
index d1e646a..2aa9700 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta-oe/recipes-graphics/xorg-lib/libx11.inc
@@ -1,13 +1,10 @@
 require xorg-lib-common.inc
 
 DESCRIPTION = "Base X libs."
-COMMON_DEPENDS = "util-macros xtrans libxdmcp libxau \
-                  bigreqsproto xproto xextproto xcmiscproto \
-                  xf86bigfontproto kbproto inputproto xproto-native"
-
-DEPENDS = "libxcb ${COMMON_DEPENDS}"		  
-DEPENDS_virtclass-native = "${COMMON_DEPENDS}"
-DEPENDS_virtclass-nativesdk = "${COMMON_DEPENDS}"
+DEPENDS += "util-macros xtrans libxdmcp libxau \
+            bigreqsproto xproto xextproto xcmiscproto \
+            xf86bigfontproto kbproto inputproto libxcb \
+	    xproto-native"
 
 FILESPATHPKG .= ":libx11-${PV}:libx11"
 BBCLASSEXTEND = "native nativesdk"
@@ -22,9 +19,7 @@ FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
 XORG_PN = "libX11"
 
-EXTRA_OECONF += " --with-xcb --with-keysymdefdir=${STAGING_INCDIR}/X11 --with-groff=no --with-ps2pdf=no --with-fop=no"
-EXTRA_OECONF_virtclass-native = " --without-xcb --with-groff=no --with-ps2pdf=no --with-fop=no"
-EXTRA_OECONF_virtclass-nativesdk = " --without-xcb --with-groff=no --with-ps2pdf=no --with-fop=no"
+EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11 --with-groff=no --with-ps2pdf=no --with-fop=no --disable-specs"
 
 # Below option is added to overcome the GCC bug on ARM
 # see http://gcc.gnu.org/PR42981 for further details.
diff --git a/meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb b/meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb
index 481b90f..3c6a170 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
 #--without-xcb is not an option anymore
 #http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=15e5eaf62897b3179d1fbe457cb19f886f0449f8
-DEPENDS_virtclass-native = "libxcb-native ${COMMON_DEPENDS}"
 PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "85e942627aaa020813e0eb8433353563"
-- 
1.7.4.1



