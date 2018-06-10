Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id B1D15751D5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:09:00 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id w10-v6so17777928wrk.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=mggubdTmYQfYP/BH6MrZcEcc9iqAIDuipsUZ7Xe//Co=;
	b=GhKzfU6bedW7KC+lhT4Ywk4cNTDz1KEXdY2I8mV1iwM9mbw9hDhAobMSKGQfKWceU7
	84PR6JVEgSGXYmWNwQLrwLc3wSO1Jl5LzmVmTIiqwzNm1NqrVF0fYr1/qFaJQRB+Bx4P
	Of1jdLH0RS6TKKpyy7ica+Cl704g/IQwYdL+3nA8WMewa+xOOx7wOXIMPNS0Tx7DNApm
	vZgpa4BcEzL0dda0zCARTzzvKtxFUzPs9JPWSBBwTJbGK0gRosFVqveWHBWEP+iDWZS1
	+AxZCcjC7WQsSpSSOcm3RGJzhR3DfXO+IvZeeCUdeMOg3qfh+XM53VnLzuDVXtPvHit2
	Wdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mggubdTmYQfYP/BH6MrZcEcc9iqAIDuipsUZ7Xe//Co=;
	b=Y1NK9O7o2VcJGDpvw4JC1mBMVLh3cP6clHSbylmhO5zNnsDGKrjUuewcAq1io2YOvj
	jv2gTIp0ZxonopGKspZ7MrYeoTL5X3AChokbhGP7nwVIaXh74syWw2Utgi3MzPgBzEgh
	aPrkq+iQ7mkd+jceVk3HRNyIES6SvT9BpKuqPCgAd++91KuInqvtrsQd772MWK6jDaNA
	HoP20xEirbx9cArpJ0Rd0LNkTqLTBroB8bjmW6wh9s5ObBjmEnFqFa3FsW+NkRZ++Kjf
	lSl6n7Nd3s/0KQSoKuTx3db9ojyJdo29hcToygkjyZadCCkP9yrTtocNKNs9Zjc8lXru
	8a1A==
X-Gm-Message-State: APt69E0eXU2UzpaXrTzWEV1aShl3nilWusR81iYC7yQJmRPCuQXVW+6P
	8oJNiynaPjZTWvLIlDS8gtf68A==
X-Google-Smtp-Source: ADUXVKJV9YK8HZPvg4cefvzEv58+U/SkqQm5qc8hHto5zXIcRERAvlDZP34oVp/XRC+a3ebiWhN4UA==
X-Received: by 2002:adf:e392:: with SMTP id
	e18-v6mr10861707wrm.94.1528643341106; 
	Sun, 10 Jun 2018 08:09:01 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.09.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:09:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:20 +0200
Message-Id: <20180610150821.9536-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 18/19] various classes recipes: Remove FILES entries for dbg/dev packages
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
X-List-Received-Date: Sun, 10 Jun 2018 15:09:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These entries are no more required - oe-core defaults were reworked long time
ago.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/classes/thunar-plugin.bbclass                         | 3 ---
 meta-xfce/classes/xfce-panel-plugin.bbclass                     | 2 +-
 meta-xfce/classes/xfce.bbclass                                  | 8 --------
 meta-xfce/recipes-apps/orage/orage_4.12.1.bb                    | 1 -
 meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb             | 2 --
 meta-xfce/recipes-xfce/exo/exo_0.12.0.bb                        | 3 ---
 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb | 5 -----
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb          | 3 ---
 meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb                   | 4 ----
 meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb                 | 7 -------
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb        | 3 ---
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb    | 2 --
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb                    | 2 --
 13 files changed, 1 insertion(+), 44 deletions(-)

diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
index 95f7d0088..447f02cee 100644
--- a/meta-xfce/classes/thunar-plugin.bbclass
+++ b/meta-xfce/classes/thunar-plugin.bbclass
@@ -7,6 +7,3 @@ DEPENDS += "thunar"
 SRC_URI = "http://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
 
 FILES_${PN} += "${libdir}/thunarx-2/*.so"
-FILES_${PN}-dbg += "${libdir}/thunarx-2/.debug"
-FILES_${PN}-dev += "${libdir}/thunarx-2/*.la"
-
diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
index 6515dc0d4..fbc754c18 100644
--- a/meta-xfce/classes/xfce-panel-plugin.bbclass
+++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
@@ -10,4 +10,4 @@ FILES_${PN} += "${datadir}/xfce4/panel-plugins/"
 FILES_${PN} += "${datadir}/xfce4/panel/plugins/"
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/*.so"
 FILES_${PN} += "${libdir}/xfce4/panel/plugins/*.so"
-FILES_${PN}-dbg += "${libexecdir}/xfce4/panel-plugins/.debug"
+
diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index b49bba19b..7abe46f71 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -12,11 +12,3 @@ DEPENDS += "intltool-native"
 
 FILES_${PN} += "${datadir}/icons/* ${datadir}/applications/* ${libdir}/xfce4/modules/*.so*"
 FILES_${PN}-doc += "${datadir}/xfce4/doc"
-
-FILES_${PN}-dev += "${libdir}/xfce4/*/*.la"
-FILES_${PN}-dev += "${libdir}/xfce4/*/*/*.la"
-FILES_${PN}-staticdev += "${libdir}/xfce4/*/*.a"
-FILES_${PN}-staticdev += "${libdir}/xfce4/*/*/*.a"
-FILES_${PN}-dbg += "${libdir}/xfce4/*/.debug"
-FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"
-
diff --git a/meta-xfce/recipes-apps/orage/orage_4.12.1.bb b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
index a2f25682b..22af379a7 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
@@ -14,6 +14,5 @@ PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
 
 PACKAGES =+ "xfce4-orageclock-plugin"
 FILES_${PN} += "${datadir}/dbus-1"
-FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug"
 FILES_xfce4-orageclock-plugin = "${libdir}/xfce4/panel/plugins/*.so ${datadir}/xfce4/panel/plugins"
 
diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb b/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb
index 05d92ffd4..7e11b7718 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb
@@ -34,5 +34,3 @@ FILES_${PN} += " \
     ${datadir}/appdata \
     ${libdir}/parole-0/*.so \
 "
-FILES_${PN}-dbg += "${libdir}/parole-0/.debug"
-FILES_${PN}-dev += "${libdir}/parole-0/*.la"
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.0.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.0.bb
index d256b5769..85c95faf2 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.0.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.0.bb
@@ -31,9 +31,6 @@ FILES_${PN} += "${datadir}/xfce4/ \
                 ${libdir}/xfce4/exo-1 \
 "
 
-FILES_${PN}-dbg += "${libdir}/gio/modules/.debug \
-"
-
 FILES_exo-csource += "${bindir}/exo-csource"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
index ef4f4bfa8..aae07e1e2 100644
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
@@ -21,10 +21,5 @@ FILES_${PN} += "${libdir}/gtk-2.0/*/engines/*.so"
 FILES_gtk3-xfce-engine += "${libdir}/gtk-3.0/*/theming-engines/*.so"
 FILES_${PN}-themes += "${datadir}/themes"
 
-FILES_${PN}-dbg += "${libdir}/gtk-3.0/*/theming-engines/.debug \
-                    ${libdir}/gtk-2.0/*/engines/.debug"
-FILES_${PN}-dev += "${libdir}/gtk-2.0/*/engines/*.la \
-                    ${libdir}/gtk-3.0/*/theming-engines/*.la"
-
 RDEPENDS_${PN} += "${PN}-themes"
 RDEPENDS_gtk3-xfce-engine += "${PN}-themes"
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb
index 298f8a109..8a385baeb 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.4.bb
@@ -24,9 +24,6 @@ PACKAGES =+ "${PN}-gtk2 ${PN}-gtk3"
 FILES_${PN}-gtk2 += "${libdir}/libxfce4ui-1.so.* ${libdir}/libxfce4kbd-private-2.so.*"
 FILES_${PN}-gtk3 += "${libdir}/libxfce4ui-2.so.* ${libdir}/libxfce4kbd-private-3.so.*"
 
-FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
-FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
-                   ${datadir}/glade3/catalogs/*.in"
 PACKAGES += "${PN}-glade"
 FILES_${PN}-glade = "${libdir}/glade3 \
                      ${datadir}/glade3"
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
index 65d6b28c5..f03fd63e0 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
@@ -29,8 +29,4 @@ FILES_${PN} += " \
     ${datadir}/xfce4/panel/plugins/* \
 "
 
-FILES_${PN}-dbg += "${libdir}/thunarx-2/.debug/ \
-                    ${libdir}/xfce4/panel/plugins/.debug/ \
-                    ${libdir}/Thunar/.debug/"
-
 RRECOMMENDS_${PN} = "gvfs gvfsd-trash"
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
index 7e0c555a4..611315058 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
@@ -26,10 +26,3 @@ FILES_${PN} += "${datadir}/dbus-1/services \
                 ${libdir}/tumbler-1/plugins/*.so \
                 ${libdir}/tumbler-1/plugins/cache/*.so \
 "
-
-FILES_${PN}-dev += "${libdir}/tumbler-1/plugins/*.la \
-                    ${libdir}/tumbler-1/plugins/cache/*.la"
-FILES_${PN}-dbg += "${libdir}/tumbler-1/.debug \
-                    ${libdir}/tumbler-1/plugins/.debug \
-                    ${libdir}/tumbler-1/plugins/cache/.debug \
-"
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
index dea0c357e..6625f0573 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
@@ -36,6 +36,3 @@ FILES_${PN}-gtk3 = " \
     ${libdir}/libxfce4panel-2.0${SOLIBS} \
     ${libdir}/xfce4/panel/wrapper-2.0 \
 "
-FILES_${PN}-dbg += " \
-    ${libdir}/xfce4/panel/plugins/.debug \
-"
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
index a24720603..899edbf0a 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
@@ -27,6 +27,4 @@ FILES_${PN} += " \
     ${datadir}/polkit-1 \
 "
 
-FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"
-
 RDEPENDS_${PN} += "machine-host"
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb
index 2aa68e3fd..a075f13b9 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb
@@ -26,5 +26,3 @@ RDEPENDS_${PN} = "xfwm4-theme-default"
 FILES_${PN} += "${libdir}/xfce4/xfwm4/helper-dialog \
                 ${datadir}/xfwm4/defaults \
 "
-FILES_${PN}-dbg += "${libexecdir}/xfce4/xfwm4/.debug/*"
-
-- 
2.14.3


