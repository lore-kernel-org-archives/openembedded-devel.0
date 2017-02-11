Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1C07198A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 18:33:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v77so11684402wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 10:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=akjZ2wuFu8SfP+kzEedgVuJwUKahH00lGIppdUVz0RE=;
	b=vZPvPzlIDsIuCKcOJVae2S4DpXp2H60ZxUV95anZJPBWdYEtbqmePr42DxH5hk3UHg
	TgTAdYcXu77pJ0I6b7qC9zl+VC4TYYhPudBRscb3shdYJERY2icwjHx6OmLf1uDNQFIS
	aQZ/PCe6YXbgcCIQYBW0/Zr3f6LxbLys/pS3Xcu1JuI2Ugd516PxKekbC2zvygCQ6V1M
	CCtJ8p48M7VykSl3gKw58FucrVVrN0R7hmrWUc0ZKMkhXl7jZh/wXSrP/150q8LIlXhA
	L4hLSSOzVqM9uV4s8yj08y3g4gHfW8psDeNGIfi6yLQQ+8S4V+qtHYEE5AO7H58QfBhb
	izjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=akjZ2wuFu8SfP+kzEedgVuJwUKahH00lGIppdUVz0RE=;
	b=JmTDSpfyDpDXft/bd+PDC2JYh4/J9Pnrk37icDEdZ7+YLMAXp2XlmOpdO0jHjGBhJU
	TNjP0ExwBSq4xWR58atw8wKrbXH0UtUz+u+cR6cwzKl4h3U1dOAQS6DAbqqeCxogofMG
	1sfk7VskA/bpWB0agWYqgecNIGamyEMtIE8seHSCspioNyfqjHFKD/8iMH0hIwH73aS+
	q4Nm3NS/85WAL3ezUQ1JcIu61OhWjNQELrhc6AO5vdatKVv0CbpyGHUgo9NQVk2ImINS
	jzWK3m7SwQ95rMTvPFWQ7KS/JESzjUaux5wtZprpy5LDsAUtknhxNm4D4OPN+eekyQM/
	WNlw==
X-Gm-Message-State: AMke39mP1e+/W2lbG1r/OFnuCjwpm1FeGcm6BO7qOHrG7qDlGt2HyZWKfX647mIXkV8OKw==
X-Received: by 10.28.214.144 with SMTP id n138mr29764405wmg.136.1486838035282; 
	Sat, 11 Feb 2017 10:33:55 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id q1sm6038722wmd.6.2017.02.11.10.33.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Feb 2017 10:33:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2017 19:33:49 +0100
Message-Id: <20170211183350.4889-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170211183350.4889-1-Martin.Jansa@gmail.com>
References: <20170211183350.4889-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2][meta-oe 3/4] recipes: blacklist recipes depending on blacklisted recipes
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
X-List-Received-Date: Sat, 11 Feb 2017 18:33:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl_1.15.0.bb                 | 2 ++
 meta-efl/recipes-devtools/python/python-efl_git.bb                    | 2 ++
 meta-efl/recipes-efl/e17/cpu_svn.bb                                   | 2 ++
 meta-efl/recipes-efl/e17/e-tasks_git.bb                               | 2 ++
 meta-efl/recipes-efl/e17/e-wm_0.18.8.bb                               | 2 ++
 meta-efl/recipes-efl/e17/e-wm_0.19.10.bb                              | 2 ++
 meta-efl/recipes-efl/e17/e-wm_git.bb                                  | 2 ++
 meta-efl/recipes-efl/e17/edje-viewer_svn.bb                           | 2 ++
 meta-efl/recipes-efl/e17/elfe_git.bb                                  | 2 ++
 meta-efl/recipes-efl/e17/enjoy_git.bb                                 | 2 ++
 meta-efl/recipes-efl/e17/ephoto_svn.bb                                | 2 ++
 meta-efl/recipes-efl/e17/exalt-client_svn.bb                          | 3 ++-
 meta-efl/recipes-efl/e17/exalt_svn.bb                                 | 2 ++
 meta-efl/recipes-efl/e17/flame_svn.bb                                 | 2 ++
 meta-efl/recipes-efl/e17/forecasts_svn.bb                             | 2 ++
 meta-efl/recipes-efl/e17/places_svn.bb                                | 2 ++
 meta-efl/recipes-efl/e17/rain_svn.bb                                  | 2 ++
 meta-efl/recipes-efl/e17/terminology_0.9.1.bb                         | 2 ++
 meta-efl/recipes-efl/e17/uptime_svn.bb                                | 2 ++
 meta-efl/recipes-efl/efl/epdf_svn.bb                                  | 2 ++
 meta-efl/recipes-efl/efl/libeflvala_svn.bb                            | 2 ++
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb                       | 4 ++++
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb                     | 2 ++
 meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb                   | 2 ++
 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb                 | 2 ++
 meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb             | 2 ++
 meta-gnome/recipes-gnome/evince/evince_3.18.2.bb                      | 2 ++
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb                        | 2 ++
 .../gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb             | 4 ++++
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb                | 2 ++
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb                      | 2 ++
 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb                  | 3 +++
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb            | 2 ++
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb                | 3 +++
 meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb                      | 2 ++
 meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb                  | 2 ++
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb                     | 2 ++
 meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb                      | 2 ++
 meta-gnome/recipes-gnome/pimlico/contacts_git.bb                      | 2 +-
 meta-gnome/recipes-gnome/pimlico/dates_git.bb                         | 2 ++
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb                | 2 ++
 meta-gnome/recipes-support/florence/florence_0.5.4.bb                 | 4 ++++
 meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb                    | 3 +++
 meta-gpe/recipes-graphics/minilite/minilite_0.50.bb                   | 2 ++
 meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb                 | 2 ++
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb                | 2 ++
 meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb    | 2 ++
 meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb         | 1 +
 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb                   | 2 ++
 .../recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb      | 2 ++
 .../gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb                   | 2 ++
 .../recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb           | 2 ++
 .../recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb           | 2 ++
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb      | 2 ++
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb     | 2 ++
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb        | 2 ++
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb     | 2 ++
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb     | 2 ++
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb  | 2 ++
 meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb                  | 2 ++
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb       | 2 ++
 .../telepathy/telepathy-mission-control_5.16.1.bb                     | 2 ++
 meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb                  | 2 ++
 meta-oe/recipes-devtools/glade/glade3_3.8.5.bb                        | 2 ++
 meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb             | 2 ++
 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb              | 2 ++
 meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb                          | 4 ++++
 meta-oe/recipes-multimedia/esound/esound_0.2.36.bb                    | 2 ++
 meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb                   | 2 ++
 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb                  | 4 ++++
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb                    | 2 ++
 meta-oe/recipes-support/xchat/xchat_2.8.8.bb                          | 2 ++
 meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb                     | 2 ++
 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb              | 2 ++
 meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb             | 2 ++
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb                      | 2 ++
 76 files changed, 163 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb
index 7abbc32..5018d9b 100644
--- a/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb
+++ b/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb
@@ -2,3 +2,5 @@ require ${BPN}.inc
 
 SRC_URI[md5sum] = "f7c5d557336ea9df69bcca09c420711a"
 SRC_URI[sha256sum] = "11e607b465cb66dafe05c66e02d61e09335b370fe9fd2a74d88282b3ee597bcc"
+
+PNBLACKLIST[python-efl] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-devtools/python/python-efl_git.bb b/meta-efl/recipes-devtools/python/python-efl_git.bb
index 83a01ac..4bff50f 100644
--- a/meta-efl/recipes-devtools/python/python-efl_git.bb
+++ b/meta-efl/recipes-devtools/python/python-efl_git.bb
@@ -7,3 +7,5 @@ DEFAULT_PREFERENCE = "-1"
 SRC_URI = "git://git.enlightenment.org/bindings/python/${BPN}.git;branch=python-efl-1.12"
 
 S = "${WORKDIR}/git"
+
+PNBLACKLIST[python-efl] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/cpu_svn.bb b/meta-efl/recipes-efl/e17/cpu_svn.bb
index 14eb08f..15d1eb4 100644
--- a/meta-efl/recipes-efl/e17/cpu_svn.bb
+++ b/meta-efl/recipes-efl/e17/cpu_svn.bb
@@ -8,3 +8,5 @@ PR = "${INC_PR}.0"
 require e-module.inc
 
 SRC_URI += "file://configure.patch"
+
+PNBLACKLIST[cpu] ?= "Depends on blacklisted e-wm"
diff --git a/meta-efl/recipes-efl/e17/e-tasks_git.bb b/meta-efl/recipes-efl/e17/e-tasks_git.bb
index 6065157..540df5f 100644
--- a/meta-efl/recipes-efl/e17/e-tasks_git.bb
+++ b/meta-efl/recipes-efl/e17/e-tasks_git.bb
@@ -30,3 +30,5 @@ do_install_append() {
 }
 
 FILES_${PN} += "/usr/share/e-tasks/* /usr/share/applications/* /usr/share/pixmaps/*"
+
+PNBLACKLIST[e-tasks] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
index 6b4c9fc..819d1b0 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
@@ -13,3 +13,5 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "79c9f524e1d0510061c62c4b038a8ece"
 SRC_URI[sha256sum] = "14c9bde4334d2f8b0776c6113d02b923ab159eea1cbf7013489e4f3bf37a51bb"
+
+PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
index 86ce03d..62408b8 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
@@ -17,3 +17,5 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "9063617760329445ada8635270a4e627"
 SRC_URI[sha256sum] = "484d305bcf403303b18c46a3a498445b93689cd325010ae8d0601551926469d8"
+
+PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/e-wm_git.bb b/meta-efl/recipes-efl/e17/e-wm_git.bb
index 9eb839b..95572fa 100644
--- a/meta-efl/recipes-efl/e17/e-wm_git.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_git.bb
@@ -12,3 +12,5 @@ SRC_URI = " \
 S = "${WORKDIR}/git"
 
 SRCREV = "4545d4a70031e0b2565b8d83d5f756bff1a584d0"
+
+PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
index 2b927a0..8746f09 100644
--- a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
+++ b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
@@ -14,3 +14,5 @@ SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 FILES_${PN} += "${datadir}"
+
+PNBLACKLIST[edje-viewer] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/elfe_git.bb b/meta-efl/recipes-efl/e17/elfe_git.bb
index fcb97a9..bdec107 100644
--- a/meta-efl/recipes-efl/e17/elfe_git.bb
+++ b/meta-efl/recipes-efl/e17/elfe_git.bb
@@ -13,3 +13,5 @@ S = "${WORKDIR}/git"
 SRCREV = "1ec0e7713c3ca901014811ff78277d9e2aaac981"
 
 DEPENDS += "elementary"
+
+PNBLACKLIST[elfe] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/enjoy_git.bb b/meta-efl/recipes-efl/e17/enjoy_git.bb
index 297cbd5..cab1bd4 100644
--- a/meta-efl/recipes-efl/e17/enjoy_git.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_git.bb
@@ -46,3 +46,5 @@ pkg_postinst_${PN} () {
     echo "enjoy:"
     echo "enjoy:    Use test-lms -P to see available formats that can be scanned"
 }
+
+PNBLACKLIST[enjoy] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/ephoto_svn.bb b/meta-efl/recipes-efl/e17/ephoto_svn.bb
index 5cecda5..c7b2d7c 100644
--- a/meta-efl/recipes-efl/e17/ephoto_svn.bb
+++ b/meta-efl/recipes-efl/e17/ephoto_svn.bb
@@ -17,3 +17,5 @@ SRCNAME = "${PN}"
 B = "${S}"
 
 SRC_URI += "file://configure.patch"
+
+PNBLACKLIST[ephoto] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/exalt-client_svn.bb b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
index afed0e8..f294736 100644
--- a/meta-efl/recipes-efl/e17/exalt-client_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
@@ -22,4 +22,5 @@ FILES_${PN}-staticdev += "${libdir}/enlightenment/modules/*/*/*.a"
 FILES_${PN}-dev += "${libdir}/enlightenment/modules/*/*/*.la"
 FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug"
 
-SRC_URI += "file://configure.patch"
\ No newline at end of file
+SRC_URI += "file://configure.patch"
+PNBLACKLIST[exalt-client] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/exalt_svn.bb b/meta-efl/recipes-efl/e17/exalt_svn.bb
index 1f1c850..e52c987 100644
--- a/meta-efl/recipes-efl/e17/exalt_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt_svn.bb
@@ -32,3 +32,5 @@ do_install_append() {
 
 FILES_${PN} += "${datadir}/dbus-1"
 
+
+PNBLACKLIST[exalt] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/flame_svn.bb b/meta-efl/recipes-efl/e17/flame_svn.bb
index 58c79a8..026c63c 100644
--- a/meta-efl/recipes-efl/e17/flame_svn.bb
+++ b/meta-efl/recipes-efl/e17/flame_svn.bb
@@ -13,3 +13,5 @@ do_configure_prepend() {
 }
 
 SRC_URI += "file://configure.patch"
+
+PNBLACKLIST[flame] ?= "Depends on blacklisted e-wm"
diff --git a/meta-efl/recipes-efl/e17/forecasts_svn.bb b/meta-efl/recipes-efl/e17/forecasts_svn.bb
index 473bdb9..d919179 100644
--- a/meta-efl/recipes-efl/e17/forecasts_svn.bb
+++ b/meta-efl/recipes-efl/e17/forecasts_svn.bb
@@ -8,3 +8,5 @@ PR = "${INC_PR}.0"
 require e-module.inc
 
 SRC_URI += "file://configure.patch"
+
+PNBLACKLIST[forecasts] ?= "Depends on blacklisted e-wm"
diff --git a/meta-efl/recipes-efl/e17/places_svn.bb b/meta-efl/recipes-efl/e17/places_svn.bb
index 54f0e01..915baf6 100644
--- a/meta-efl/recipes-efl/e17/places_svn.bb
+++ b/meta-efl/recipes-efl/e17/places_svn.bb
@@ -14,3 +14,5 @@ do_configure_prepend() {
 RRECOMMENDS_${PN} += "eject"
 
 SRC_URI += "file://configure.patch"
+
+PNBLACKLIST[places] ?= "Depends on blacklisted e-wm"
diff --git a/meta-efl/recipes-efl/e17/rain_svn.bb b/meta-efl/recipes-efl/e17/rain_svn.bb
index 7e85442..6d14eef 100644
--- a/meta-efl/recipes-efl/e17/rain_svn.bb
+++ b/meta-efl/recipes-efl/e17/rain_svn.bb
@@ -14,3 +14,5 @@ do_configure_prepend() {
 }
 
 SRC_URI += "file://configure.patch"
+
+PNBLACKLIST[rain] ?= "Depends on blacklisted e-wm"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.9.1.bb b/meta-efl/recipes-efl/e17/terminology_0.9.1.bb
index 482bd60..37ebe0b 100644
--- a/meta-efl/recipes-efl/e17/terminology_0.9.1.bb
+++ b/meta-efl/recipes-efl/e17/terminology_0.9.1.bb
@@ -6,3 +6,5 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "c7ce2e8ebc5f311d3d3f59ecfdf18f61"
 SRC_URI[sha256sum] = "7fb864a14202490e9181c5f254a7e772019216a3aa75c3952d0f12cd32113896"
+
+PNBLACKLIST[terminology] ?= "Depends on blacklisted elementary"
diff --git a/meta-efl/recipes-efl/e17/uptime_svn.bb b/meta-efl/recipes-efl/e17/uptime_svn.bb
index 5c9bfa9..15d3878 100644
--- a/meta-efl/recipes-efl/e17/uptime_svn.bb
+++ b/meta-efl/recipes-efl/e17/uptime_svn.bb
@@ -8,3 +8,5 @@ PR = "${INC_PR}.0"
 require e-module.inc
 
 SRC_URI += "file://configure.patch"
+
+PNBLACKLIST[uptime] ?= "Depends on blacklisted e-wm"
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index e32a5fd..1073bd1 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -25,3 +25,5 @@ EXTRA_OECONF = "\
 
 # Some upgrade path tweaking, as in evas
 AUTO_LIBNAME_PKGS = ""
+
+PNBLACKLIST[epdf] ?= "Depends on blacklisted poppler"
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index 4922b1b..87ea66b 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -19,3 +19,5 @@ S = "${WORKDIR}/${SRCNAME}"
 
 PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${datadir}/libeflvala ${bindir}/*"
+
+PNBLACKLIST[libeflvala] ?= "Depends on blacklisted elementary"
diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
index 6e0e0aa..682c6fa 100644
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -20,3 +20,7 @@ EXTRA_OECONF += "--disable-scrollkeeper"
 do_configure_prepend() {
     sed -i -e "s: help : :g" ${S}/Makefile.am
 }
+
+PNBLACKLIST[cheese] ?= "Depends on blacklisted gstreamer"
+
+PNBLACKLIST[cheese] ?= "Depends on blacklisted gnome-desktop"
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index 07b4831..6edd4b3 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -123,3 +123,5 @@ python populate_packages_prepend () {
 }
 
 FILES_${PN}-plugin-openxml += "${datadir}/${PN}-${SHRT_VER}/omml_xslt"
+
+PNBLACKLIST[abiword] ?= "Depends on blacklisted libglade"
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
index 8e00eb4..a9014e2 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
@@ -7,3 +7,5 @@ SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch \
 SRC_URI[archive.md5sum] = "27fa902d4fdf6762ee010e7053aaf77b"
 SRC_URI[archive.sha256sum] = "9160d4f277646400d3bb6b4fa73636cc6d1a865a32b9d0760e1e9e6ee624976b"
 GNOME_COMPRESS_TYPE="bz2"
+
+PNBLACKLIST[libbonobo] ?= "Depends on blacklisted orbit2"
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
index 627f37e..b26630a 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
@@ -19,3 +19,5 @@ FILES_${PN}-dev += "${libdir}/libglade/2.0/*.la ${datadir}/gnome-2.0/ui \
 FILES_${PN}-staticdev += "${libdir}/libglade/2.0/*.a"
 FILES_${PN}-dbg += "${libdir}/bonobo-2.0/samples/.debug \
                     ${libdir}/libglade/2.0/.debug"
+
+PNBLACKLIST[libbonoboui] ?= "Depends on blacklisted libglade"
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index aecf6a7..13453bd 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -114,3 +114,5 @@ FILES_libedataserverui = "${libdir}/libedataserverui-*.so.* ${datadir}/evolution
 FILES_libedataserverui-dev = "${libdir}/libedataserverui-*.so \
                               ${libdir}/pkgconfig/libedataserverui-*.pc \
                               ${includedir}/evolution-data-server-*/libedataserverui/*.h"
+
+PNBLACKLIST[evolution-data-server] ?= "Depends on blacklisted libglade"
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
index 4e3e0f0..09e0d7b 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
@@ -50,3 +50,5 @@ FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a \
                           ${libdir}/evince/*/backends/*.a"
 FILES_${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
 FILES_${PN}-browser-plugin = "${libdir}/mozilla/*/*so"
+
+PNBLACKLIST[evince] ?= "Depends on blacklisted poppler"
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 175b832..cc85a81 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -22,3 +22,5 @@ EXTRA_OECONF = "--disable-scrollkeeper \
 
 FILES_${PN} += "${libdir}/gedit-2/plugin* ${datadir}/gedit-2"
 FILES_${PN}-dbg += "${libdir}/gedit-2/plugin-loaders/.debug ${libdir}/gedit-2/plugins/.debug"
+
+PNBLACKLIST[gedit] ?= "Depends on blacklisted gtksourceview2"
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 393eb25..8a7425a 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -40,3 +40,7 @@ FILES_${PN}-dbg += "${libdir}/gnome-settings-daemon-2.0/.debug"
 FILES_${PN}-dev += "${libdir}/gnome-settings-daemon-2.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gnome-settings-daemon-2.0/*.a"
 
+
+PNBLACKLIST[gnome-settings-daemon] ?= "Depends on blacklisted libgnomekbd"
+
+PNBLACKLIST[gnome-settings-daemon] ?= "Depends on blacklisted gnome-desktop"
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 3ec6466..edf5bfc 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -56,3 +56,5 @@ python populate_packages_prepend () {
     plugindir = d.expand('${libdir}/gnome-vfs-2.0/modules/')
     do_split_packages(d, plugindir, '^lib(.*)\.so$', 'gnome-vfs-plugin-%s', 'GNOME VFS plugin for %s')
 }
+
+PNBLACKLIST[gnome-vfs] ?= "Depends on blacklisted gnome-mime-data"
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 13c027c..94a14c8 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -31,3 +31,5 @@ FILES_${PN} += "${libdir}/${BPN}/extensions/*.so \
 FILES_${PN}-dev += "${libdir}/${BPN}/extensions/*.la"
 FILES_${PN}-dbg += "${libdir}/${BPN}/extensions/.debug/"
 
+
+PNBLACKLIST[gthumb] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
index 0055ba4..c6da2a4 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
@@ -34,3 +34,6 @@ FILES_gnome-common-schemas = "${datadir}/gnome-background-properties ${datadir}/
 RDEPENDS_${PN} = "gnome-common-schemas"
 
 FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug"
+
+PNBLACKLIST[libgnome] ?= "Depends on blacklisted gnome-vfs"
+PNBLACKLIST[libgnome] ?= "Depends on blacklisted esound"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
index 41a89ce..6bca4bd 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
@@ -18,3 +18,5 @@ FILES_${PN} += "${libdir}/libglade/*/libcanvas.so"
 FILES_${PN}-dbg += "${libdir}/libglade/*/.debug/"
 FILES_${PN}-dev += "${libdir}/libglade/*/libcanvas*.la"
 FILES_${PN}-staticdev += "${libdir}/libglade/*/libcanvas*.a"
+
+PNBLACKLIST[libgnomecanvas] ?= "Depends on blacklisted libglade"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
index c4801a9..ccc75f1 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
@@ -27,3 +27,6 @@ EXTRA_OECONF = "--disable-gtk-doc"
 do_configure_prepend() {
     install -m 0644 ${WORKDIR}/gnome-stock-pixbufs.h ${S}/libgnomeui/pixmaps/gnome-stock-pixbufs.h
 }
+
+PNBLACKLIST[libgnomeui] ?= "Depends on blacklisted libbonoboui"
+PNBLACKLIST[libgnomeui] ?= "Depends on blacklisted libgnomecanvas"
diff --git a/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb b/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
index 86dfcf2..6a3ac55 100644
--- a/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
+++ b/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
@@ -11,3 +11,5 @@ inherit autotools pkgconfig binconfig
 
 SRC_URI[md5sum] = "bb8e10a218fac793a52d404d14adedcb"
 SRC_URI[sha256sum] = "c5d24d8c096546353fbc7cedf208392d5a02afe9d56ebcc1cccb258d7c4d2220"
+
+PNBLACKLIST[libidl] ?= "Depends on blacklisted libidl-native"
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index d29385e..9a57d2c 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
@@ -39,3 +39,5 @@ FILES_${PN} += "${datadir}/icons"
 # Don't make nautils3 drag us in
 PRIVATE_LIBS = "libnautilus-extension.so.1"
 
+
+PNBLACKLIST[nautilus] ?= "Depends on blacklisted gnome-desktop"
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
index f9af2ee..414bcf1 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
@@ -39,3 +39,5 @@ inherit autotools pkgconfig gtk-doc
 
 EXTRA_OEMAKE = "IDL_COMPILER='${STAGING_BINDIR_NATIVE}/orbit-idl-2'"
 EXTRA_OEMAKE_class-native = " "
+
+PNBLACKLIST[orbit2] ?= "Depends on blacklisted libidl-native"
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
index bdc7f48..06153d2 100644
--- a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
+++ b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
@@ -16,3 +16,5 @@ do_configure_prepend () {
     # It used 8 spaces to instead of a tab, but it doesn't work for us
     sed -i 's/^        $(MAKE) dist distdir=/\t$(MAKE) dist distdir/' Makefile.am
 }
+
+PNBLACKLIST[contacts] ?= "Depends on blacklisted evolution-data-server"
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
index 8a4a071..57ad78e 100644
--- a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
+++ b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
@@ -16,4 +16,4 @@ SRC_URI =+ "git://git.gnome.org/${BPN} \
 
 S = "${WORKDIR}/git"
 
-
+PNBLACKLIST[contacts] ?= "Depends on blacklisted evolution-data-server"
diff --git a/meta-gnome/recipes-gnome/pimlico/dates_git.bb b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
index a4a572f..6a9804f 100644
--- a/meta-gnome/recipes-gnome/pimlico/dates_git.bb
+++ b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
@@ -17,3 +17,5 @@ SRC_URI = "git://git.gnome.org/${BPN} \
     file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \
     file://0001-Update-to-new-evolution-data-server-e_source_-color-.patch \
 "
+
+PNBLACKLIST[dates] ?= "Depends on blacklisted libglade"
diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index 8c39ad7..89b63e9 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -31,3 +31,5 @@ SRC_URI += "file://iconpath-option.patch \
 SRC_URI[archive.md5sum] = "41db9e3cb25d35af2675c599e67944d1"
 SRC_URI[archive.sha256sum] = "8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a"
 GNOME_COMPRESS_TYPE="bz2"
+
+PNBLACKLIST[gnome-themes] ?= "Depends on blacklisted gtk-engines"
diff --git a/meta-gnome/recipes-support/florence/florence_0.5.4.bb b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
index dfdb6bd..032422e 100644
--- a/meta-gnome/recipes-support/florence/florence_0.5.4.bb
+++ b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
@@ -18,3 +18,7 @@ SRC_URI[sha256sum] = "26d33aa20d5fbf34ceeded4c41cb922d2988b6082e33d9acc46dd7bfe5
 inherit gettext autotools gconf pkgconfig
 
 EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet --without-xrecord"
+
+PNBLACKLIST[florence] ?= "Depends on blacklisted libglade"
+
+PNBLACKLIST[florence] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
index 3f1e27e..4316a81 100644
--- a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
+++ b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
@@ -21,3 +21,6 @@ SRC_URI += "file://0001-Fix-the-ordering-of-LDADD-options-to-fix-a-compilati.pat
 
 RREPLACES_${PN} = "gpe-screenshot"
 
+
+PNBLACKLIST[gpe-scap] ?= "Depends on blacklisted libglade"
+PNBLACKLIST[gpe-scap] ?= "Depends on blacklisted libgpewidget"
diff --git a/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb b/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
index 90960a2..830ea07 100644
--- a/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
+++ b/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
@@ -14,3 +14,5 @@ SRC_URI[md5sum] = "d81cecf269ad7bab0da960e6e7228332"
 SRC_URI[sha256sum] = "2b299425203246090a4949e034f1d0efb3ff99cd1591d0e16c57370a530b361e"
 
 export CVSBUILD="no"
+
+PNBLACKLIST[minilite] ?= "Depends on blacklisted libgpewidget"
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
index f8ecc93..6f14af5 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
@@ -42,3 +42,5 @@ do_install() {
 
 SRC_URI[md5sum] = "da9ec4721efdb0ec0aaa182bff16ad82"
 SRC_URI[sha256sum] = "328aec454db80e225aa0b5c31adef74bf62a14357482947e87e9731686b3c624"
+
+PNBLACKLIST[fbreader] ?= "Depends on blacklisted libgpewidget"
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 300daa5..06dbce3 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -39,3 +39,5 @@ do_install() {
 FILES_${PN} += "${datadir}/${BPN}"
 
 RDEPENDS_${PN} += "libdvben50221 libucsi libdvbapi"
+
+PNBLACKLIST[tvheadend] ?= "Depends on blacklisted dvb-apps"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
index 1f33a8a..adff73b 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
@@ -53,3 +53,5 @@ RDEPENDS_${PN} = "libkodiplatform"
 INSANE_SKIP_${PN} = "dev-so"
 FILES_${PN} += "${datadir}/kodi"
 FILES_${PN}-dbg += "${datadir}/kodi/addons/*/.debug/"
+
+PNBLACKLIST[kodi-addon-pvr-hts] ?= "Depends on blacklisted kodi"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
index 802259d..ea739c2 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
@@ -36,3 +36,4 @@ do_compile_prepend() {
 RPROVIDES_${PN} += "libkodiplatform"
 FILES_${PN}-dev += "${libdir}/*platform"
 
+PNBLACKLIST[kodi-platform] ?= "Depends on blacklisted kodi"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 6d8f2a2..e3a117e 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -192,3 +192,5 @@ RPROVIDES_${PN} += "xbmc"
 
 TOOLCHAIN = "gcc"
 
+
+PNBLACKLIST[kodi] ?= "Depends on blacklisted libsdl-mixer"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
index 1e2cd2a..e7c7c21 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
@@ -12,3 +12,5 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 SRC_URI[md5sum] = "adf0390f3416bb72f91c358528be0c38"
 SRC_URI[sha256sum] = "dae0d0559a4e159c0dd92b7e18de059a5783f8d038904c7de4ca6393f7d55c7d"
+
+PNBLACKLIST[gst-fluendo-mp3] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb
index 7bba41a..9787dba 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb
@@ -10,3 +10,5 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 SRC_URI[md5sum] = "7c4fb993f80b9ae631b11897733f0970"
 SRC_URI[sha256sum] = "df04c91cc8e5d9a892c2492ed989974b4547beaa2a3647649e85113317897424"
+
+PNBLACKLIST[gst-fluendo-mpegdemux] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
index 039abe1..afd6a58 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
@@ -71,3 +71,5 @@ RDEPENDS_gst-meta-video = "\
 
 RRECOMMENDS_gst-meta-video = "\
     gst-meta-audio"
+
+PNBLACKLIST[gst-meta-base] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb
index 2e01579..8b2bf75 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb
@@ -33,3 +33,5 @@ FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug/"
 
 SRC_URI[md5sum] = "4d0370bfe99dea20918c84347abadb4e"
 SRC_URI[sha256sum] = "9074d5a0591995133d19cfb15144f19664f902c1623f996595695cf2c2070e1f"
+
+PNBLACKLIST[gst-openmax] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
index 38fccc8..8abd63a 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
@@ -59,3 +59,5 @@ do_configure_prepend() {
 
 SRC_URI[md5sum] = "fcb09798114461955260e4d940db5987"
 SRC_URI[sha256sum] = "0eae7d1a1357ae8377fded6a1b42e663887beabe0e6cc336e2ef9ada42e11491"
+
+PNBLACKLIST[gst-plugins-bad] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
index eefd993..02252bf 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
@@ -42,3 +42,5 @@ CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmm
 
 # /usr/bin/gst-visualise-0.10 is a perl script.
 RDEPENDS_${PN}-apps += "perl"
+
+PNBLACKLIST[gst-plugins-base] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
index 6859f33..62a6754 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
@@ -23,3 +23,5 @@ EXTRA_OECONF += "ac_cv_header_GL_gl_h=no"
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-apps = "1"
 ALLOW_EMPTY_${PN}-glib = "1"
+
+PNBLACKLIST[gst-plugins-gl] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
index 7e4a525..cabbca5 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
@@ -46,3 +46,5 @@ SRC_URI[sha256sum] = "7e27840e40a7932ef2dc032d7201f9f41afcaf0b437daf5d1d44dc96d9
 
 FILES_${PN}-gconfelements += "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"
 FILES_${PN}-equalizer += "${datadir}/gstreamer-0.10/presets/*.prs"
+
+PNBLACKLIST[gst-plugins-good] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
index 199b47d..d8a8fd5 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
@@ -33,3 +33,5 @@ SRC_URI += "file://0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.pat
             file://0002-Fix-opencore-include-paths.patch"
 
 FILES_${PN}-amrnb += "${datadir}/gstreamer-0.10/presets/GstAmrnbEnc.prs"
+
+PNBLACKLIST[gst-plugins-ugly] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
index b78bcaf..b31a7ee 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
@@ -16,3 +16,5 @@ EXTRA_OECONF = "--disable-introspection"
 inherit autotools pythonnative gettext
 
 FILES_${PN}-dev += "${datadir}/vala/vapi/"
+
+PNBLACKLIST[gst-rtsp] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
index 679b102..fa2e67d 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
@@ -16,3 +16,5 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
 SRC_URI[md5sum] = "4970c110f160b33637a3515004c637b2"
 SRC_URI[sha256sum] = "7ab6bb47fd23bf4d3fa17424e40ea5552d08b19e5ee4f125f21f316c8086ba2a"
+
+PNBLACKLIST[libqmi] ?= "Depends on blacklisted libmbim"
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
index 5e4e220..cde9bf6 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
@@ -49,3 +49,5 @@ FILES_${PN}-staticdev += " \
 FILES_${PN}-dbg += "${libdir}/ModemManager/.debug"
 
 SYSTEMD_SERVICE_${PN} = "ModemManager.service"
+
+PNBLACKLIST[modemmanager] ?= "Depends on blacklisted libmbim"
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
index 582783c..09841a4 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
@@ -49,3 +49,5 @@ FILES_libmissioncontrol-server-dev = "${libdir}/libmissioncontrol-server.*"
 FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
+
+PNBLACKLIST[telepathy-mission-control] ?= "Depends on blacklisted libtelepathy"
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb
index 89bb966..34a6d5d 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb
@@ -261,3 +261,5 @@ RDEPENDS_${PN}-xmlsnippets = "${PN}"
 PACKAGES =+ "${PLUGINS}"
 RDEPENDS_${PN} = "${PLUGINS}"
 ALLOW_EMPTY_${PN} = "1"
+
+PNBLACKLIST[geany-plugins] ?= "Depends on blacklisted geany"
diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
index fd65536..403edd6 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
@@ -22,3 +22,5 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome] = "--enable-gnome,--disable-gnome,libbonoboui libgnomeui"
 
 FILES_${PN} += "${datadir}/icons"
+
+PNBLACKLIST[glade3] ?= "Depends on blacklisted libbonoboui"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb b/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
index 015d803..5facde6 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
@@ -30,3 +30,5 @@ do_install_append() {
 }
 
 FILES_${PN} =+ "${sysconfdir}/openlmi/storage/storage.conf ${datadir}/${BPN}/*"
+
+PNBLACKLIST[openlmi-storage] ?= "Depends on blacklisted pywbem"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index b23869d..cc8e829 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -21,3 +21,5 @@ do_compile_prepend() {
 do_install_prepend() {
     cd cli
 }
+
+PNBLACKLIST[openlmi-tools] ?= "Depends on blacklisted pywbem"
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
index 38e10ef..2ab63af 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
@@ -47,3 +47,7 @@ CFLAGS += "-fPIC"
 
 FILES_${PN}-dbg += "${libdir}/gimp/2.0/*/.debug"
 FILES_${PN}  += "${datadir}/appdata"
+
+PNBLACKLIST[gimp] ?= "Depends on blacklisted poppler"
+
+PNBLACKLIST[gimp] ?= "Depends on blacklisted gegl"
diff --git a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
index dc6c366..9e5061b 100644
--- a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
+++ b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
@@ -34,3 +34,5 @@ FILES_esddsp = "${bindir}/esddsp ${libdir}/libesddsp.so.*"
 FILES_esd = "${bindir}/esd"
 FILES_esd-utils = "${bindir}/*"
 
+
+PNBLACKLIST[esound] ?= "Depends on blacklisted audiofile"
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
index 1d531ae..3e66ce1 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
@@ -51,3 +51,5 @@ FILES_${PN}-dev += " \
     ${datadir}/dbus-1/interfaces \
     ${datadir}/gir-1.0 \
 "
+
+PNBLACKLIST[geoclue] ?= "Depends on blacklisted modemmanager"
diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index 2989850..a9ed091 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -28,3 +28,7 @@ FILES_${PN}-dbg += "${libdir}/*/.debug"
 
 SRC_URI[md5sum] = "e1f540cf3ebab06c3d7db1f46b44ac88"
 SRC_URI[sha256sum] = "3ae59aa61a8071c9fad111e5fd606aabc27961eb4192f8729987a27dae6b3974"
+
+PNBLACKLIST[farsight2] ?= "Depends on blacklisted gstreamer"
+PNBLACKLIST[farsight2] ?= "Depends on blacklisted libnice"
+PNBLACKLIST[farsight2] ?= "Depends on blacklisted gst-plugins-base"
diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 3c2a054..c4d4cd2 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -40,3 +40,5 @@ do_compile_append() {
 
 SRC_URI[md5sum] = "e5b9f799a57cb939ea2658ec35253ab9"
 SRC_URI[sha256sum] = "d8dd260c486a470a6052a5323920878a084e44a19df09b15728b85c9e3d6edf0"
+
+PNBLACKLIST[libnice] ?= "Depends on blacklisted gstreamer"
diff --git a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
index 6da11cd..f7d8cfd 100644
--- a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
+++ b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
@@ -35,3 +35,5 @@ FILES_${PN}-dbg += "${libdir}/xchat/plugins/.debug"
 
 SRC_URI[md5sum] = "6775c44f38e84d06c06c336b32c4a452"
 SRC_URI[sha256sum] = "0d6d69437b5e1e45f3e66270fe369344943de8a1190e498fafa5296315a27db0"
+
+PNBLACKLIST[xchat] ?= "Depends on blacklisted libsexy"
diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
index e87dea7..f0cb7f0 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
@@ -18,3 +18,5 @@ EXTRA_OECONF = "--disable-gtk3"
 
 FILES_${PN} += "${datadir}/glib-2.0/schemas"
 
+
+PNBLACKLIST[mousepad] ?= "Depends on blacklisted gtksourceview2"
diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
index bdbec45..2c91fa9 100644
--- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
@@ -12,3 +12,5 @@ SRC_URI[md5sum] = "1b3753b91224867a3a2dfddda239c28d"
 SRC_URI[sha256sum] = "fb0c1df201ed1130f54f15b914cbe5a59286e994a137acda5609570c57112de2"
 
 RDEPENDS_${PN} = "gst-meta-audio"
+
+PNBLACKLIST[xfce4-mixer] ?= "Depends on blacklisted gst-plugins-base"
diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb
index 8c04db6..590d9b9 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb
@@ -28,3 +28,5 @@ DEPENDS = "gtk+ gconf libnotify dbus-glib libgxim xfconf intltool-native"
 RDEPENDS_${PN} += "bash"
 
 FILES_${PN} += "${datadir}/dbus-1/* ${datadir}/gir-1.0/* ${libdir}/girepository-1.0/*"
+
+PNBLACKLIST[imsettings] ?= "Depends on blacklisted libgxim"
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
index 66385a4..45cc586 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
@@ -27,3 +27,5 @@ FILES_${PN}-dbg += "${libdir}/tumbler-1/.debug \
                     ${libdir}/tumbler-1/plugins/.debug \
                     ${libdir}/tumbler-1/plugins/cache/.debug \
 "
+
+PNBLACKLIST[tumbler] ?= "Depends on blacklisted poppler"
-- 
2.10.2


