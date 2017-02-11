Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id E5BB6772B8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 18:33:56 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k90so18433742wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 10:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9UidUICH8rDrzTjI83DxxPMHAcnPCzqiCMV7pUv4MDI=;
	b=QU/Yqt4XX9Ez89nOKP92DDcGTy4EDH9Jd189KfGcBqO2jbcaxgopQluHZH1RPLKJHD
	C8j8HwUmZ+SvF8esO0/hlStTaapOFpbSQi+hOlRJfzh0FpxeZUNDGQqU75RXm0VRiRfF
	h3YH8XpIyVBWfKe8/3qr6DEFOWyxmUrB5Yr9u+KAShUD5eSVEJe571nRCFyNQuzYtpjv
	d7bfFW1giKM7C/W8J/Za60d3Sn00NIrTwN98VIdDXi8iHBYRh3rhvVfMF68XfczuiElT
	jGsocf43OF6ELzXQNTpeznNYDP+nyIadUjlJb5I6TLxe3tYHN0KCISkdi6eoja8l+Vbn
	aP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9UidUICH8rDrzTjI83DxxPMHAcnPCzqiCMV7pUv4MDI=;
	b=be3+T8VCWAImBzvddn6PKlpSRO+YuDRx0xQfgb233IfQJuEvVX83hv6jwsyWie9XK3
	jI3MP5Ejdd3FXJKxiwnNNR36YlNN9G5dFeqNWmCX7C+9njZBk8l8Vh2DL7v/sUIC+UP8
	H1VF7RKOrerGnMT5dPsLXm+cKEaDAfkPWuxKAv2Uvhjc/Fy4sNHgwsZrKQ7D4s+kUb9s
	V6deVhsn+URmSFff0hb9qZwUjA9NfX+GKUNPRCqS4STNRU+5r/e3tGTMcDFEwXl4yZB7
	YEHMqIgWHf7m2Q+omUi7QhpK3xD67CW+2IJeyp5E6MQ13pX1QxZOInbHj/bEqICtqeYK
	76xA==
X-Gm-Message-State: AMke39nNqbIrJf06JPfjNNmgsebHe9nlkYfbO2ZuU3rROWeE4r6DVB4cEaNZ1+60pFk0Bg==
X-Received: by 10.223.150.58 with SMTP id b55mr13052124wra.192.1486838036581; 
	Sat, 11 Feb 2017 10:33:56 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c133sm5987371wmd.13.2017.02.11.10.33.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Feb 2017 10:33:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2017 19:33:50 +0100
Message-Id: <20170211183350.4889-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170211183350.4889-1-Martin.Jansa@gmail.com>
References: <20170211183350.4889-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2][meta-oe 4/4] recipes: blacklist recipes runtime depending on blacklisted recipes
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
X-List-Received-Date: Sat, 11 Feb 2017 18:33:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb             |  6 ++++++
 meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb     |  4 ++++
 meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb     |  2 ++
 .../packagegroups/packagegroup-efl-standalone-sdk-target.bb    |  2 ++
 meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb  |  6 ++++++
 meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb       |  4 ++++
 meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb   |  4 ++++
 meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb        | 10 ++++++++++
 .../usb-modeswitch/usb-modeswitch-data_20140529.bb             |  4 ++++
 meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb   |  4 ++++
 meta-python/recipes-devtools/python/python3-requests_2.13.0.bb |  4 ++++
 meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb            |  6 ++++++
 .../packagegroups/packagegroup-xfce-multimedia.bb              |  6 ++++++
 .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb                 |  6 ++++++
 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb              |  6 ++++++
 .../whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb              |  2 ++
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb |  2 ++
 .../recipes-xfce/packagegroups/packagegroup-xfce-extended.bb   |  6 ++++++
 18 files changed, 84 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
index 704e43d..f75f9ea 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
@@ -29,3 +29,9 @@ do_install() {
 }
 
 FILES_${PN} = "${datadir}/enlightenment/data/themes/"
+
+PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm"
+
+PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm-theme-b-and-w"
+
+PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm-theme-b-and-w-dev"
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
index 965e4e9..6032f20 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
@@ -33,3 +33,7 @@ do_install() {
 }
 
 FILES_${PN} = "${datadir}/enlightenment/data/themes/"
+
+PNBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted e-wm"
+
+PNBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted e-wm-theme-illume-efenniht"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
index 5ead412..8c42dbd 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} = "\
     packagegroup-core-sdk \
     ${SDK-EFL} \
     ${SDK-EXTRAS}"
+
+PNBLACKLIST[packagegroup-efl-sdk] ?= "Runtime depends on blacklisted elementary-dev"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
index 6a3f33d..8aed43a 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} = "\
     packagegroup-core-standalone-sdk-target \
     ${SDK-EFL} \
     ${SDK-EXTRAS}"
+
+PNBLACKLIST[packagegroup-efl-standalone-sdk-target] ?= "Runtime depends on blacklisted elementary-dev"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
index 9997828..2519da0 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
@@ -22,3 +22,9 @@ RDEPENDS_${PN} = "\
     e-wm \
     ${ECONFIG} \
 "
+
+PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm"
+
+PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm-config-mobile"
+
+PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm-theme-default"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
index 955d02b..49e0b4d 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
@@ -18,3 +18,7 @@ SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "kodi.service"
 
 RDEPENDS_${PN} += "xinit kodi"
+
+PNBLACKLIST[kodi-startup] ?= "Runtime depends on blacklisted kodi"
+
+PNBLACKLIST[kodi-startup] ?= "Runtime depends on blacklisted kodi-startup-dev"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
index 2a4b067..1bb56ea 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
@@ -43,3 +43,7 @@ RDEPENDS_${PN}-debug = "\
 RRECOMMENDS_${PN}-debug = "\
     ltrace \
 "
+
+PNBLACKLIST[packagegroup-cli-tools] ?= "Runtime depends on blacklisted dbus-daemon-proxy"
+
+PNBLACKLIST[packagegroup-cli-tools] ?= "Runtime depends on blacklisted packagegroup-cli-tools"
diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
index 45e3f7b..0e1164d 100644
--- a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
+++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
@@ -12,3 +12,13 @@ RDEPENDS_${PN} = "\
     font-bh-lucidatypewriter-100dpi \
     font-bitstream-100dpi \
 "
+
+PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-adobe-100dpi"
+
+PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted xorg-fonts-100dpi"
+
+PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-bh-100dpi"
+
+PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-adobe-utopia-100dpi"
+
+PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-bh-lucidatypewriter-100dpi"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
index a265411..434f68a 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
@@ -15,3 +15,7 @@ do_install() {
 RDEPENDS_${PN} = "usb-modeswitch (>= 2.2.0)"
 FILES_${PN} += "${base_libdir}/udev/rules.d/ \
                 ${datadir}/usb_modeswitch"
+
+PNBLACKLIST[usb-modeswitch-data] ?= "Runtime depends on blacklisted usb-modeswitch"
+
+PNBLACKLIST[usb-modeswitch-data] ?= "Runtime depends on blacklisted usb-modeswitch-data"
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb
index 4523d9e..582d01d 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb
@@ -1,2 +1,6 @@
 inherit pypi setuptools3
 require python-pymisp.inc
+
+PNBLACKLIST[python3-pymisp] ?= "Runtime depends on blacklisted python3-pymisp"
+
+PNBLACKLIST[python3-pymisp] ?= "Runtime depends on blacklisted python3-pymisp-dev"
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.13.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.13.0.bb
index 5e869b7..bbfbfeb 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.13.0.bb
@@ -3,3 +3,7 @@ require python-requests.inc
 
 # Add the runtime depends for selectors.py
 RDEPENDS_${PN} += "${PYTHON_PN}-misc"
+
+PNBLACKLIST[python3-requests] ?= "Runtime depends on blacklisted python3-ndg-httpsclient"
+
+PNBLACKLIST[python3-requests] ?= "Runtime depends on blacklisted python3-requests-dev"
diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb
index 7abf186..1aaf549 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb
@@ -13,3 +13,9 @@ SRC_URI[md5sum] = "5332876b627b3237eebb76db66e2fb11"
 SRC_URI[sha256sum] = "0b4c90c585166c958d479075b98da6e28ca500bda6f4d3443f20e0a2172030ee"
 
 FILES_${PN} += "${datadir}/appdata"
+
+PNBLACKLIST[ristretto] ?= "Runtime depends on blacklisted tumbler"
+
+PNBLACKLIST[ristretto] ?= "Runtime depends on blacklisted ristretto-dev"
+
+PNBLACKLIST[ristretto] ?= "Runtime depends on blacklisted ristretto"
diff --git a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
index 72a96f3..9377798 100644
--- a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
+++ b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
@@ -9,3 +9,9 @@ RDEPENDS_${PN} = " \
     xfmpc \
     xfce4-mpc-plugin \
 "
+
+PNBLACKLIST[packagegroup-xfce-multimedia] ?= "Runtime depends on blacklisted xfce4-mpc-plugin"
+
+PNBLACKLIST[packagegroup-xfce-multimedia] ?= "Runtime depends on blacklisted packagegroup-xfce-multimedia"
+
+PNBLACKLIST[packagegroup-xfce-multimedia] ?= "Runtime depends on blacklisted xfmpc"
diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
index f709e4d..105302e 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
@@ -13,3 +13,9 @@ RRECOMMENDS_${PN} = "mpd"
 
 SRC_URI[md5sum] = "13d5d95ef0c305bac45fde6231258e5d"
 SRC_URI[sha256sum] = "f1320916ae3112e6825699652a502cebfa78bb006c649b42d3d331dfe57b6cb0"
+
+PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted mpd"
+
+PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted xfce4-mpc-plugin"
+
+PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted xfce4-mpc-plugin-dev"
diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
index 3d902a1..19166f5 100644
--- a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
+++ b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
@@ -11,3 +11,9 @@ inherit xfce-app
 
 SRC_URI[md5sum] = "e2d2faeb7a6f62813e287f3d12522b71"
 SRC_URI[sha256sum] = "4189c0c82b66b758a6d5bc651493b675d3d46329e5f1a76ff26c448125f4fcb0"
+
+PNBLACKLIST[xfmpc] ?= "Runtime depends on blacklisted mpd"
+
+PNBLACKLIST[xfmpc] ?= "Runtime depends on blacklisted xfmpc-dev"
+
+PNBLACKLIST[xfmpc] ?= "Runtime depends on blacklisted xfmpc"
diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb
index 9feb864..b68ecdb 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "3cbbe6f233089b6923113f47d311f875"
 SRC_URI[sha256sum] = "1b7afb233c74c33f0ee26de6514c4168497f4aa584dc2f6778dff15d8d47b165"
 
 RRECOMMENDS_${PN} += "menulibre"
+
+PNBLACKLIST[xfce4-whiskermenu-plugin] ?= "Runtime depends on blacklisted menulibre"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index e2f238c..111589f 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -36,3 +36,5 @@ RDEPENDS_${PN} = " \
     thunar \
     thunar-volman \
 "
+
+PNBLACKLIST[packagegroup-xfce-base] ?= "Runtime depends on blacklisted xfce4-notifyd"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index c07188f..9aaa2f3 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -66,3 +66,9 @@ RRECOMMENDS_${PN} = " \
     xfce4-taskmanager \
     gigolo \
 "
+
+PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on blacklisted xfce4-mixer"
+
+PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on blacklisted xfce4-verve-plugin"
+
+PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on blacklisted ristretto"
-- 
2.10.2


