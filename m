Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id E910D6AC33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:07 +0000 (UTC)
Received: by wibg7 with SMTP id g7so25189370wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=UAoGJndgr4NSxiMw6fF7m5H6W0jC6I70ts0RugZBTWc=;
	b=OsuUBe/WKznL6GdToZZb8zXaBsYoD2PJmlbg3MOeXDUP+A3FEAE+N1tchyF3NQoEhB
	RZQV2RR16FBxbBQYcQAij2kb4MvzEPFSuIkFK40Btym1DC87fQXmnYSAUOY9gkNoxnxv
	bcgSUWFXHREVdsgEno8yPxea7JH0X7gE4WgygNBCFjOjG1UMd04M9VKtyRjW7YEOPpRL
	iREzeB0gfsV9XeWRuq+DvFTrAci4FkfbRlpQgJHlTInvHOCj/4m5vROrIiLg/Z7CbsVG
	S/WqjiHTbPQOEFiRyWINb0Q/wCQ8RRYfb2GsfV4nhA8UIqbJu1qaa0987cX7sbzPMZlv
	NFng==
X-Received: by 10.194.60.203 with SMTP id j11mr119731708wjr.5.1426462448972;
	Sun, 15 Mar 2015 16:34:08 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:20 +0100
Message-Id: <1426462419-10173-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 11/30] thunar: update to 1.6.6
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../thunar/{thunar_1.6.3.bb => thunar_1.6.6.bb}    | 24 +++++++++++++---------
 1 file changed, 14 insertions(+), 10 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.3.bb => thunar_1.6.6.bb} (56%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.6.bb
similarity index 56%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.6.6.bb
index 36c5ed0..ca48767 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.6.bb
@@ -2,25 +2,29 @@ SUMMARY = "File manager for the Xfce Desktop Environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify xfce4-panel udev"
+DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui xfconf libsm dbus-glib startup-notification libnotify xfce4-panel udev"
 
-inherit xfce
+inherit xfce gtk-doc
 
-SRC_URI[md5sum] = "4f10d5d5576ce5127308d6badbac3afa"
-SRC_URI[sha256sum] = "9a2706f6881ac29cda9f0b0325d179153bc09e37bcbafcab9823c1c1ec89579d"
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
+SRC_URI[md5sum] = "27a5343174593dd0067906c922e6af96"
+SRC_URI[sha256sum] = "b9a55104b18ae01c5190d7ea02cbd7ba56d7affed9df416bf7fec6dff2d889b2"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
 
-FILES_${PN} += "${libdir}/thunarx-2/* \
-                ${libdir}/xfce4/panel/plugins/* \
-                ${libdir}/Thunar/[Tt]hunar* \
-                ${datadir}/dbus-1 \
-                ${datadir}/Thunar \
-                ${datadir}/xfce4/panel-plugins/*"
+FILES_${PN} += " \
+    ${libdir}/thunarx-2/* \
+    ${libdir}/xfce4/panel/plugins/* \
+    ${libdir}/Thunar/[Tt]hunar* \
+    ${datadir}/appdata \
+    ${datadir}/dbus-1 \
+    ${datadir}/polkit-1 \
+    ${datadir}/Thunar \
+    ${datadir}/xfce4/panel/plugins/* \
+"
 
 FILES_${PN}-dbg += "${libdir}/thunarx-2/.debug/ \
                     ${libdir}/xfce4/panel/plugins/.debug/ \
-- 
1.9.3


