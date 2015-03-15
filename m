Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id A21456AC33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:12 +0000 (UTC)
Received: by wgra20 with SMTP id a20so27050903wgr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=F8iYKsP3RiVOchGLjbgHTGZlHNm5hd8AiBpGLwZxBuA=;
	b=Z3D35rH6Rw922H+Ufgttc+7H/UrshqQkekL5RQ1VdgLhjbzRkSZ5K/VGKS2p/Maixf
	AW1oWWwDmRpNGGRiKm/J8P1DsSGJA/RBhab5vAWuJweEvnI79AB2tqTePCmEajwepmAk
	CznH4xmD9gWe5yOG3BRsAwP3SmWm3sBc6jrsBYOnthyOutaXIznvykjGDO2XwD0D9Abu
	qQfVRoHMrXGA+UcJ+lii+GmVOSg8JLNJPsd+cZ5OpA5qb7bw3OUBFL+pGNPRcdTQrs2k
	8Jt0IymbY21LXrta/o2FeUz0NYfOpcJvrBr97fDNEMSgO0izJVwTT4xuf+9TT/XYzmsC
	wo2A==
X-Received: by 10.180.206.101 with SMTP id ln5mr50594137wic.55.1426462453180; 
	Sun, 15 Mar 2015 16:34:13 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:23 +0100
Message-Id: <1426462419-10173-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 14/30] tumbler: update to 0.1.31
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* static libraries are gone
* plugin link is created correctly so no need to recreate

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../tumbler/{tumbler_0.1.30.bb => tumbler_0.1.31.bb}          | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.30.bb => tumbler_0.1.31.bb} (68%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
similarity index 68%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
index 5359545..66385a4 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
@@ -6,17 +6,12 @@ DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl xfce4-dev-tools-native lib
 
 inherit xfce gtk-doc
 
-SRC_URI[md5sum] = "2524e39439c13238565160da0b6fed2d"
-SRC_URI[sha256sum] = "e7c20d79c830465f8b3b792893f05e8b8d5ba90aec4973e7517e07ef31537304"
+SRC_URI[md5sum] = "0067054e6f1f90a13f90faadfca1e89e"
+SRC_URI[sha256sum] = "d0fd329273ff6ac98885eade4c3d8c87a4dd0816f713646130808bfa90b87173"
 SRC_URI += "file://0001-configure-use-pkg-config-for-freetype2.patch"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-do_install_append() {
-    # correct tumbler-cache-plugin.so link (see plugins/xdg-cache/Makefile.am)
-    ln -sf ${libdir}/tumbler-1/plugins/cache/tumbler-xdg-cache.so ${D}${libdir}/tumbler-1/plugins/cache/tumbler-cache-plugin.so
-}
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gstreamer-thumbnailer] = "--enable-gstreamer-thumbnailer,--disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"
 
@@ -28,8 +23,6 @@ FILES_${PN} += "${datadir}/dbus-1/services \
 
 FILES_${PN}-dev += "${libdir}/tumbler-1/plugins/*.la \
                     ${libdir}/tumbler-1/plugins/cache/*.la"
-FILES_${PN}-staticdev += "${libdir}/tumbler-1/plugins/*.a \
-                          ${libdir}/tumbler-1/plugins/cache/*.a"
 FILES_${PN}-dbg += "${libdir}/tumbler-1/.debug \
                     ${libdir}/tumbler-1/plugins/.debug \
                     ${libdir}/tumbler-1/plugins/cache/.debug \
-- 
1.9.3


