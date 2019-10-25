Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1BFF77F7C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:23 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id w18so1059140wrt.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KE3jhhuB8nqIVXBxwuDdrdXGCNeJBT4/K/js5L3Bb9s=;
	b=H3Do6UxSsXL/z17kl/MwQXWfGjTi7yQ+ES03JXRT7FxBg1jxWRlf+4X8hKAKBGShO9
	k8KaWCOaKH9LnZQDYNl3CtMhhCd21ecNvYt8B1wwVSFUnFqmiMtcXUsoVS5YLmDKjkL/
	x6jEKRHPgDFhHUNd8p1fo3PrAPrqKUBKRzD7QnEDa0J/WmxocOrqM6nVRXkrvjJraQo5
	gJ9xVjiY6WMyATOapaOY8GuHaz4OI6JK2nC9CrWzyFJbmDMfSqKfMiuAtQ7m2u/X5ISz
	g89RZ8BwA2WgHmrCCbtmoZ10sUuCSLbkJjQW04jbQFFyzEPzcI/LTW0ZLkrjFM/ZXYdx
	1cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KE3jhhuB8nqIVXBxwuDdrdXGCNeJBT4/K/js5L3Bb9s=;
	b=qcauU6HhArTajeI/jnwyGbizmYbynGQXMe03utVzmwp8jX+ss9+mqG8wnd/vylP8pX
	rxkw+8+VcfBLQnlSu17XrsXNVLuachAjSAHGKgpo33MhtLLOkO2Skf+aoMnyxrJIYbD1
	CuZzWMDmuW0XnehZ9+ohFskj31Doyxw8s0F+OkKqeTAdjSvo4tOQ5+rLSRf1y2NmjlhI
	6XGUt4N1669k63VorwSmfbCJmSx22hpnY9Tihn8FVe9TRZLJB3SAMXN99xC6TYQz26ZN
	oYY37L+CHpPXoWvj1lvTFEs3AVFG+eSEcsHqfKMviZcVSrlo3m4OnJym6r2P21MUdB4G
	pwHA==
X-Gm-Message-State: APjAAAWAyHJI3rKdj/pnZ+vqblngDvgahjNsRX7rSqlbCfbBb0rxlNRW
	14msYHdcH0hUSGTZwlWvms7R6jV8
X-Google-Smtp-Source: APXvYqxpTtCno1M01Vk7bBhxzdYouuN7zcIV2KgIFbCQo8CnNcQiuMkCno+50i6GHSYj9h1OcgQdYA==
X-Received: by 2002:adf:f511:: with SMTP id q17mr1401027wro.3.1571988084336;
	Fri, 25 Oct 2019 00:21:24 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:20:58 +0200
Message-Id: <20191025072113.11172-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 00/15] Upgrades & GNOME preparations
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrades & tiny preparations for GNOME crusade

Andreas Müller (15):
  gtkmm3: upgrade 3.24.1 -> 3.24.2
  geany: upgrade 1.34.1 -> 1.36
  geany-plugins: upgrade 1.34 -> 1.36
  libstemmer: initial add 2.0.0
  appstream-glib: initial add 0.7.16
  yelp-xsl: initial add 3.34.0
  yelp-tools: initial add 3.32.2
  yelp: initial add 3.34.0
  zenity: pretify recipe a bit
  glibmm: upgrade 2.60.0 -> 2.62.0
  libsigc++-3: initial add 3.0.0
  ibus: initial add 1.5.21
  libgusb: initial add 0.3.0+
  colord: initial add 1.4.4
  colord-gtk: initial add 0.2.0

Build tested with current master of oe-core & meta-openembedded + dconf-fix

 .../recipes-gnome/yelp/yelp-tools_3.32.2.bb   |  22 +++
 .../recipes-gnome/yelp/yelp-xsl_3.34.0.bb     |  18 ++
 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb  |  33 ++++
 .../recipes-gnome/zenity/zenity_3.32.0.bb     |   5 +-
 .../appstream-glib/appstream-glib_0.7.16.bb   |  37 ++++
 .../colord-gtk/colord-gtk_0.2.0.bb            |  21 +++
 .../recipes-support/ibus/ibus-native.bb       |  28 +++
 meta-gnome/recipes-support/ibus/ibus.bb       |  33 ++++
 meta-gnome/recipes-support/ibus/ibus.inc      |  33 ++++
 ...start-dbus-we-do-not-have-dbus-lauch.patch |  39 ++++
 .../libstemmer/0001-Build-so-lib.patch        |  63 +++++++
 ...ds-do-link-with-LDFLAGS-set-by-build.patch |  46 +++++
 .../libstemmer/libstemmer_git.bb              |  39 ++++
 .../{glibmm_2.60.0.bb => glibmm_2.62.0.bb}    |   4 +-
 .../libsigc++-2.0/libsigc++-3_3.0.0.bb        |  20 +++
 ...-plugins_1.34.bb => geany-plugins_1.36.bb} |   6 +-
 .../geany/{geany_1.34.1.bb => geany_1.36.bb}  |   6 +-
 .../{gtkmm3_3.24.1.bb => gtkmm3_3.24.2.bb}    |   4 +-
 .../recipes-support/colord/colord-native.bb   |  64 +++++++
 ...n-cd_icc_create_from_edid-to-avoid-u.patch | 166 ++++++++++++++++++
 .../colord/colord-native/Makefile             |  48 +++++
 meta-oe/recipes-support/colord/colord.bb      |  45 +++++
 meta-oe/recipes-support/colord/colord.inc     |  13 ++
 ...Run-native-cd_idt8-cd_create_profile.patch |  59 +++++++
 .../recipes-support/libgusb/libgusb_git.bb    |  12 ++
 25 files changed, 851 insertions(+), 13 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
 create mode 100644 meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.16.bb
 create mode 100644 meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus-native.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.inc
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
 create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
 create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
 create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer_git.bb
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.60.0.bb => glibmm_2.62.0.bb} (87%)
 create mode 100644 meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.0.bb
 rename meta-oe/recipes-devtools/geany/{geany-plugins_1.34.bb => geany-plugins_1.36.bb} (98%)
 rename meta-oe/recipes-devtools/geany/{geany_1.34.1.bb => geany_1.36.bb} (69%)
 rename meta-oe/recipes-gnome/gtk+/{gtkmm3_3.24.1.bb => gtkmm3_3.24.2.bb} (78%)
 create mode 100644 meta-oe/recipes-support/colord/colord-native.bb
 create mode 100644 meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
 create mode 100644 meta-oe/recipes-support/colord/colord-native/Makefile
 create mode 100644 meta-oe/recipes-support/colord/colord.bb
 create mode 100644 meta-oe/recipes-support/colord/colord.inc
 create mode 100644 meta-oe/recipes-support/colord/colord/0001-Run-native-cd_idt8-cd_create_profile.patch
 create mode 100644 meta-oe/recipes-support/libgusb/libgusb_git.bb

-- 
2.21.0


