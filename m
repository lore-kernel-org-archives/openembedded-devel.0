Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id DBCB571D31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:16 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id r141so59025072wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dUAnf6UXNEK29EKApgAKbK43gaMfJONZFTyudnY/zsE=;
	b=Ey6AKPHmoWuABQp8/ZXuu0tpRZdp59iK5jFN5TADyYAgbCFW4nzVE11DuF0m8M+m8o
	TAYBp+850SwVtttX0XO8gIGfMa6ftv42jE9W5bhpLjno3QV5cyfc9kaaxEoHGhqebO/2
	NZ/k4419dQcbFyl5Ru3Na/rFs1n+lvJszYCSvbCR5QhJ5VbZ+QhrBSGBSpsCBgF2c13K
	ALv1U/AEGA39idrN87dV7/0kGs1KAwIahX9nVwPkwS9LiNqU2QwAOZfLcSAxVqa8etot
	H1SbgUflLZX921UH/M+MtBa7mSBSZ01GSShU27mbeoS2QZXx/DcyqPSH3DQf4mv4L/dw
	T9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dUAnf6UXNEK29EKApgAKbK43gaMfJONZFTyudnY/zsE=;
	b=G9sjeeil7hiC+okCbbVfkX3lx0Gfd2LwcA6B+7uG62oWP4YA5jNggsm8FCmV8RDx8q
	noucCBt+faqY+5QRvneE22WiZ6ageh9W38N9JK4HDqbv3Hp3DE5qSWZeb1U5bLvHkLEx
	srVnrpmubTrKi9dh6KtlholeQsxDFP2dUdQAwUOeLtEWWwlSxcU4yL37fSy9ebfKPu2Q
	xUO6dbHDDyRotZDLkC5Iji8e08Vlrb334Tw7/jM1JW555WOzfr6OZOs/uzwlu3W04bG/
	cjsJCE5/k/llnFGvnn0qp3L+gYUqtPjtlb4xXt/BbloQsXZ0MQR6L+yncKJD08H6ZBRu
	e8wQ==
X-Gm-Message-State: AMke39nMxiNRZ6C7Eco8zgiUswqaETGpB1nBcooOF/6SeIopvtaA+GNmoxwBmXwQsIlJdg==
X-Received: by 10.28.86.214 with SMTP id k205mr10908231wmb.26.1487614036081;
	Mon, 20 Feb 2017 10:07:16 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:16 +0100
Message-Id: <20170220180700.29836-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 00/44] last weekend's unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some notes:

* Series is was build-tested with master-next without 'Samba: use built-in
  libtevent'
* I know there was a patch fixing gstreamer-plugins - but this was removed
  from master-next and there was only one patch touching many recipes. This is
  not the best idea under fragile circumstances (=it depends what is installed
  on build machine what recipes fail). I leave it up to others to decide which
  patches to apply for gstreamer-plugins.
* On my build machine I could not reproduce many errors mentioned. This is 
  caused by many build tools installed on my build machine. So fixes are
  sometimes guesswork and the chance is high that some recipes fail with follow
  up errors. So I expect for iterations for this patch series...


The following changes since commit ff4071986e4b11420f4bdc634e8b01880897505e:

  gitpkgv.bbclass: fix versioning with multiple repos (2017-02-20 17:51:10 +0100)

are available in the git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git rss-fixes-andmore

for you to fetch changes up to 84e932de92b61a00123f9a9ea0153bca8b5aef7e:

  packagegroup-xfce-extended: unblacklist - all dependencies are back (2017-02-20 18:50:13 +0100)

----------------------------------------------------------------
Andreas Müller (44):
      pavucontrol: add pulseaudio-server to RDEPENDS
      libidl-native: add flex-native to DEPENDS
      libidl: unblacklist - libidl-native is back
      orbit2: unblacklist - libidl-native is back
      libbonobo: unblacklist orbit2 is back
      libgnome: unblacklist gnome-vfs is back
      libbonoboui: unblacklist - libgnome and libbonobo are back
      mpd: rework DEPENDS and unblacklist
      mpd: update 0.19.21 -> 0.20.4
      libgnomeui: unblacklist - libgnome is back
      glade3: unblacklist - libbonoboui and libgnomeui are back
      xfmpc: unblacklist - all dependencies are back
      xfce4-mpc-plugin: unblacklist - all dependencies are back
      libgxim: add glib-2.0 to DEPENDS and unblacklist
      imsettings: fix build and unblacklist
      tumbler: add dbus-glib-native to DEPENDS and unblacklist
      ristretto: unblacklist - dependencies are back
      ristretto: update 0.8.1 -> 0.8.2
      menulibre: add intltool-native to DEPENDS and unblacklist
      xfce4-whiskermenu-plugin: unblacklist - menulibre should be back
      xfce4-whiskermenu-plugin: update 2.0.3 -> 2.1.0
      xfce4-verve-plugin: add dbus-glib-native to DEPENDS and unblacklist
      lmsensors: fix fetch and unblacklist
      xfce4-sensors-plugin: unblacklist - lmsensors is back
      gtksourceview2: add glib-2.0-native to DEPENDS and unblacklist
      mousepad: unblacklist - gtksourceview2 is back
      libmbim: add glib-2.0-native to DEPENDS and unblacklist
      modemmanager: unblacklist - libmbim is back
      gedit: unblacklist - gtksourceview2 is back
      xdg-user-dirs: fix build by disabling building of man pages and unblacklist
      libqmi: unblacklist - libmbim is back
      gst-fluendo-mp3: unblacklist - gstreamer is back
      gst-fluendo-mpegdemux: unblacklist - gstreamer is back
      gst-openmax: unblacklist - gstreamer is back
      gst-plugins-bad: unblacklist - gstreamer is back
      gst-plugins-base: unblacklist gstreamer is back
      gst-plugins-gl: unblacklist - gstreamer is back
      gst-plugins-good: unblacklist - gstreamer is back
      gst-plugins-ugly: unblacklist - gstreamer is back
      gst-rtsp: unblacklist - gstreamer is back
      gst-meta-base: unblacklist - all dependencies are back
      xfce4-mixer: unblacklist - gst-plugins-base is back
      packagegroup-xfce-multimedia: unblacklist - dependencies are back
      packagegroup-xfce-extended: unblacklist - all dependencies are back

 meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb                                                                  |  2 --
 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb                                                                |  3 ---
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb                                                                       |  2 --
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb                                                      |  4 +---
 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb                                                                 |  2 --
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb                                                               |  2 --
 meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb                                                              |  4 +---
 meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb                                                                     |  2 --
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb                                                                    |  2 --
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb                                         |  2 --
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb                                   |  2 --
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb                                              |  2 --
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb                                              |  2 --
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb                                         |  2 --
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb                                        |  2 --
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb                                           |  2 --
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb                                        |  2 --
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb                                        |  2 --
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb                                                 |  2 --
 meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.21.bb => mpd_0.20.4.bb}                                         | 45 +++++++++++++++++++++++++++++++++++++--------
 meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb                                                               |  4 +---
 meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb                                                                 |  2 --
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb                                                      |  2 --
 meta-oe/recipes-devtools/glade/glade3_3.8.5.bb                                                                       |  4 ----
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb                                                                    |  4 +---
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb                                                             |  2 ++
 meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb                                                                |  8 +++-----
 meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch          | 31 +++++++++++++++++++++++++++++++
 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb                                                          |  5 +++--
 meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb                                                                  |  4 +---
 meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb                                                                    |  3 ---
 meta-xfce/recipes-apps/ristretto/{ristretto_0.8.1.bb => ristretto_0.8.2.bb}                                          | 12 +++---------
 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb                                                             |  2 --
 meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb                                                            |  4 +---
 meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb                                           |  6 ------
 meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb                                              |  6 ------
 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb                                                                    |  6 ------
 meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb                                                |  2 --
 meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb                                                    |  4 ++--
 meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.0.3.bb => xfce4-whiskermenu-plugin_2.1.0.bb} |  6 ++----
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                                   |  6 ------
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb                                                                     |  4 +---
 42 files changed, 90 insertions(+), 125 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.21.bb => mpd_0.20.4.bb} (77%)
 create mode 100644 meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.8.1.bb => ristretto_0.8.2.bb} (50%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.0.3.bb => xfce4-whiskermenu-plugin_2.1.0.bb} (55%)

-- 
2.9.3


