Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7266678E00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:27:55 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id c14-v6so5340855wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TrYEQZJIXjWp4R8/mfjysnVTQXYEwug8/nmAtSqNQNM=;
	b=VUzt4ae/ncknL/MKzMDxzsnEAwtU7kOOmB3s6sMggdlaQCdogGaIWPVf6MzyOo0KT0
	LCB+3hu50Jv6UpqKCKsXJCyWUSAV03LmbE6YnkFVZbFqxAsGOvTqIErjjSS1btG/si1j
	+Scto3cg+AU71I6JddmbIry2s+AjWO5E+s5Y+2bqeCVffVyFDwONVpprrV8sBh/Bisjz
	H1qSyYzC9Vraa6NbdFcsF0ERGAz1OG4N2a2BoylrKQiy7FUKlSM/YMd19+OMDwH4u39W
	aS24hnFESyGz5w0WdITXK8Rj0ADY3ksMfBktmZyqaXezO5iN10eP/q06+f/ivNdcKCV3
	9TCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TrYEQZJIXjWp4R8/mfjysnVTQXYEwug8/nmAtSqNQNM=;
	b=ZvMWZ53/4714jQ91nIYFWRe/GUJpYqXT/3oY2cpxVnTLhBQ1mVHN0dm+AosGKuhe0M
	S8WMHurxN2MclS2MTqanLCZPxOX0t7Ageeur40zydmCOIkDV2EZCDJwiNqxNalSBU31O
	EdeXX2Dql5ImT3zNZb21NUbVY80ySCMUsh1NfaPS5GTx2CdVA7OrQrDSL2DLmG4tAcb/
	Cz6/6FRWWVTi7Ttm0rEzKimmWMpnpTc1W4WF2A1TxDj9009mGhNtDqOhf120UKIiQOyz
	RzYtz7SptaCxW90M7MONeaOWNblzUnL2OcwfGqcZPo2lKRrTBeuQiptkHgfBj6z167MC
	RxkA==
X-Gm-Message-State: AOUpUlF7fHZGy+FnAHZGz60FCC4pLimF/4x+9BtZ4r+J0XZX1LHplUdE
	3lHr1WFAD9JnT12iFdhE8XQSNK14
X-Google-Smtp-Source: AA+uWPz49dM7VjmhSMUOZTTQvLwzvzUFIwpNwp/CYhsKsWARpqsBvqy25rIVLOah+qLF0J009xoZXg==
X-Received: by 2002:a1c:a401:: with SMTP id
	n1-v6mr17742754wme.125.1534444075677; 
	Thu, 16 Aug 2018 11:27:55 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.27.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:27:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:32 +0200
Message-Id: <20180816182748.2400-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH 00/16] updates & minor cleanups
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
X-List-Received-Date: Thu, 16 Aug 2018 18:27:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some of them I carry along for a while. Patches were tested with glibc 2.28. In
case of trouble I'll take care.

Andreas Müller (16):
  gvfs: upgrade 1.36.0 -> 1.36.2
  gtksourceview3: upgrade 3.24.6 -> 3.24.8
  libxpresent: initial add 1.0.0
  xfce4-whiskermenu-plugin: upgrade 2.2.0 -> 2.2.1
  poppler: upgrade 0.66.0 -> 0.67.0
  fftw: upgrade 3.3.7 -> 3.3.8
  fftw: enable neon for single precision on aarch64 by default
  xfwm4: upgrade 4.12.5 -> 4.13.1
  dconf: prettify
  dconf-editor: re-add 3.28.0
  xfce4-session: upgrade 4.13.0 -> 4.13.1
  xfce4-screenshooter: upgrade 1.9.2 -> 1.9.3
  libsdl-net: initial add 1.2.8
  libsdl2-net: initial add 2.0.1
  move all libsdl recipes in one folder and follow oe-core's folder for
    libsdl
  libsdl2-image: upgrade 2.0.1 -> 2.0.3

 .../recipes-gnome/dconf/dconf-editor_3.28.0.bb     | 17 ++++++++++++++
 meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb     |  9 +++-----
 ...rceview3_3.24.6.bb => gtksourceview3_3.24.8.bb} |  4 ++--
 .../gvfs/{gvfs_1.36.0.bb => gvfs_1.36.2.bb}        |  4 ++--
 .../libsdl}/libsdl-image/configure.patch           |  0
 .../libsdl}/libsdl-image_1.2.12.bb                 |  0
 .../libsdl}/libsdl-mixer/configure.patch           |  0
 .../libsdl}/libsdl-mixer_1.2.12.bb                 |  0
 .../libsdl/libsdl-net/am_foreign.patch             | 11 +++++++++
 .../libsdl/libsdl-net/libtool2.patch               | 21 +++++++++++++++++
 .../recipes-graphics/libsdl/libsdl-net_1.2.8.bb    | 20 ++++++++++++++++
 .../libsdl-ttf/use.pkg-config.for.freetype2.patch  |  0
 .../libsdl}/libsdl-ttf_2.0.11.bb                   |  0
 .../libsdl/libsdl2-image_2.0.3.bb}                 |  6 ++---
 .../libsdl}/libsdl2-mixer_2.0.2.bb                 |  0
 .../recipes-graphics/libsdl/libsdl2-net_2.0.1.bb   | 27 ++++++++++++++++++++++
 .../libsdl}/libsdl2-ttf/automake_foreign.patch     |  0
 .../libsdl2-ttf/use.pkg-config.for.freetype2.patch |  0
 .../libsdl}/libsdl2-ttf_2.0.14.bb                  |  0
 .../recipes-graphics/xorg-lib/libxpresent_1.0.0.bb | 11 +++++++++
 .../fftw/{fftw_3.3.7.bb => fftw_3.3.8.bb}          |  7 ++++--
 .../{poppler_0.66.0.bb => poppler_0.67.0.bb}       |  4 ++--
 ...ooter_1.9.2.bb => xfce4-screenshooter_1.9.3.bb} |  4 ++--
 ..._2.2.0.bb => xfce4-whiskermenu-plugin_2.2.1.bb} |  4 ++--
 ...4-session_4.13.0.bb => xfce4-session_4.13.1.bb} |  4 ++--
 .../xfwm4/{xfwm4_4.12.5.bb => xfwm4_4.13.1.bb}     | 16 ++++++++++---
 26 files changed, 143 insertions(+), 26 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/dconf/dconf-editor_3.28.0.bb
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview3_3.24.6.bb => gtksourceview3_3.24.8.bb} (81%)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.36.0.bb => gvfs_1.36.2.bb} (93%)
 rename meta-oe/{recipes-multimedia/libsdl-image => recipes-graphics/libsdl}/libsdl-image/configure.patch (100%)
 rename meta-oe/{recipes-multimedia/libsdl-image => recipes-graphics/libsdl}/libsdl-image_1.2.12.bb (100%)
 rename meta-oe/{recipes-multimedia/libsdl-mixer => recipes-graphics/libsdl}/libsdl-mixer/configure.patch (100%)
 rename meta-oe/{recipes-multimedia/libsdl-mixer => recipes-graphics/libsdl}/libsdl-mixer_1.2.12.bb (100%)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-net/am_foreign.patch
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-net/libtool2.patch
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
 rename meta-oe/{recipes-support/libsdl-ttf => recipes-graphics/libsdl}/libsdl-ttf/use.pkg-config.for.freetype2.patch (100%)
 rename meta-oe/{recipes-support/libsdl-ttf => recipes-graphics/libsdl}/libsdl-ttf_2.0.11.bb (100%)
 rename meta-oe/{recipes-multimedia/libsdl-image/libsdl2-image_2.0.1.bb => recipes-graphics/libsdl/libsdl2-image_2.0.3.bb} (80%)
 rename meta-oe/{recipes-multimedia/libsdl-mixer => recipes-graphics/libsdl}/libsdl2-mixer_2.0.2.bb (100%)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
 rename meta-oe/{recipes-support/libsdl-ttf => recipes-graphics/libsdl}/libsdl2-ttf/automake_foreign.patch (100%)
 rename meta-oe/{recipes-support/libsdl-ttf => recipes-graphics/libsdl}/libsdl2-ttf/use.pkg-config.for.freetype2.patch (100%)
 rename meta-oe/{recipes-support/libsdl-ttf => recipes-graphics/libsdl}/libsdl2-ttf_2.0.14.bb (100%)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.0.bb
 rename meta-oe/recipes-support/fftw/{fftw_3.3.7.bb => fftw_3.3.8.bb} (87%)
 rename meta-oe/recipes-support/poppler/{poppler_0.66.0.bb => poppler_0.67.0.bb} (94%)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.2.bb => xfce4-screenshooter_1.9.3.bb} (80%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.2.0.bb => xfce4-whiskermenu-plugin_2.2.1.bb} (66%)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.13.0.bb => xfce4-session_4.13.1.bb} (86%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.5.bb => xfwm4_4.13.1.bb} (53%)

-- 
2.14.4


