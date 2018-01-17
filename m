Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFD178689
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:34:51 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t74so13500658wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OCjX4Xg46UFS+Jjqyh2QRUfZapSij5KX2jJ+dMhK69Q=;
	b=gqPPV6CdiBXl13gcRKx2WN32JX9Wzd44Qza14jdWfUwuBwMtGZW1tj1HfJpRJuqm5E
	WELl8EcPjhiF46FRbfFWq5tXsUTZtA1xmXbd0T+tA4l05xSecr/M9/AfOtH1/9sxDdL6
	OYYRXNUhAR4EJu//xMynL8M9nIVb/rkYs213yUsEbsCDovaxgmb2ueDazlXbhX+h7VPv
	upkabwJ6Hx1pt8ThzwR5s6GXD+jnuYChBewB3ov/X0/u8HriqX/s3QAa32TCVXgfMc4B
	N3UAzN//NpLDyq/q9m3aSw2I5Rngup1ScLtzicN/kk+oeg1IvDdw73FQTpMRahm5j1sX
	A2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OCjX4Xg46UFS+Jjqyh2QRUfZapSij5KX2jJ+dMhK69Q=;
	b=sedBhCFbSQgExCrB5SdM6TvBPXwq5A35JfPanzhkcdSmLfeAlgp21Zl7iyhXemD0hU
	OOpxQDx9twLBnBZBJI2Tyzvosdpzl2KhFeyVldva1hpcU+c08RmkC1FlvreNUfEj+op1
	0F2Y/IhZBQ5YhHTGCsTSu9zkgci3L9Ow94DNfhTjgt9bTtXcsZj2x358bIas0m9GEVz6
	XVfRhLiSn5+Jix/eTGL54W3+IAdCT3cqNFuo/U68OsZg+71hjaVcD1K42dbN2bUbLMel
	U12+YEKfUN6SAHFH9piSljhmO9uPn/zjQbEm2Zl+1Ul/J+DotK15lj4VEPR9GSvQ9I1O
	UTTg==
X-Gm-Message-State: AKwxytdAI892Bd8yJPuJyP4NS8DQSipHWz9d7lTey6ndddKP3BjI/qcu
	78lbdX5OLYH3JBnWDJd1zfNNnQ==
X-Google-Smtp-Source: ACJfBotcNlKdNsOX3VsT0wzZYFfTinN2bfBz2s4fZp2VPioPWnBCwTl9nWuW0jxifNfsl478NfK+ug==
X-Received: by 10.28.175.66 with SMTP id y63mr1290981wme.7.1516178091338;
	Wed, 17 Jan 2018 00:34:51 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.34.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:34:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:07 +0100
Message-Id: <20180117083421.30233-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 00/14] Updates and cleanups
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
X-List-Received-Date: Wed, 17 Jan 2018 08:34:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 8cef6b38e62e6c79ec857510df454cefc868b0df:

  meson: remove recipe and class (2018-01-16 21:41:26 -0800)

are available in the Git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to f65bdf54ec9709f5d1e1bc4fbb1e43c393644725:

  xfce-polkit: fix Name/Comment fields in desktop file (2018-01-17 09:24:28 +0100)

----------------------------------------------------------------
Andreas Müller (14):
      xfce4-panel: update 4.12.1 -> 4.12.2
      xfce4-power-manager: update 1.6.0 -> 1.6.1
      xfce4-pulseaudio-plugin: update 0.3.3 -> 0.3.4
      evolution-data-server: update 3.2.3 -> 3.26.3
      pimlico/dates: remove recipe
      remove gdm leftovers
      remove gnome system-tools leftovers
      remove libgnomecups leftovers
      remove gnome tracker leftovers
      jack: Update 1.9.12
      fluidsynth: update 1.1.8 -> 1.1.9
      gtksourceview3: initial add 3.24.6
      gtksourceview-classic-light: initial add 1.0
      xfce-polkit: fix Name/Comment fields in desktop file

 meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch                                                                          |  39 ++++++++
 meta-gnome/recipes-gnome/eds/evolution-data-server/0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch                                                                    |  33 -------
 meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch                                                                  |  53 +++++++++++
 meta-gnome/recipes-gnome/eds/evolution-data-server/0002-Fix-for-automake-1.12.x.patch                                                                                          |  32 -------
 meta-gnome/recipes-gnome/eds/evolution-data-server/0003-Disable-Werror-for-automake.patch                                                                                      |  97 -------------------
 .../eds/evolution-data-server/{0001-contact-Replace-the-Novell-sample-contact-with-somet.patch => 0003-contact-Replace-the-Novell-sample-contact-with-somet.patch}             |  21 +---
 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch                                                             |  39 --------
 meta-gnome/recipes-gnome/eds/evolution-data-server/0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch                                                                         |  77 ---------------
 meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch                                                                          |  34 -------
 meta-gnome/recipes-gnome/eds/{evolution-data-server_git.bb => evolution-data-server_3.26.3.bb}                                                                                 |  84 +++++++++-------
 meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml                                                                                                                               | 492 ----------------------------------------------------------------------------------------------
 meta-gnome/recipes-gnome/gdm/gdm/Default                                                                                                                                       |  96 -------------------
 meta-gnome/recipes-gnome/gdm/gdm/cross-xdetection.diff                                                                                                                         |  96 -------------------
 meta-gnome/recipes-gnome/gdm/gdm/gdm                                                                                                                                           |  89 -----------------
 meta-gnome/recipes-gnome/gdm/gdm/gdm-pam                                                                                                                                       |  11 ---
 meta-gnome/recipes-gnome/gdm/gdm/gdm.conf                                                                                                                                      |  80 ----------------
 meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in                                                                                                                                |  10 --
 meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-cups-1.6.patch                                                                                                  | 288 -------------------------------------------------------
 meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-glib.h.patch                                                                                                    |  42 --------
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light/classic-light.xml                                                                                           | 131 +++++++++++++++++++++++++
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb                                                                                                      |  21 ++++
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.6.bb                                                                                                                |  21 ++++
 meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png                                                                                                                    | Bin 2311 -> 0 bytes
 meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png                                                                                                                     | Bin 2280 -> 0 bytes
 meta-gnome/recipes-gnome/pimlico/dates.inc                                                                                                                                     |  11 ---
 meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch                                                                                                 |  54 -----------
 meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch                                                                                                      |  44 ---------
 meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch                                                                                               |  37 -------
 meta-gnome/recipes-gnome/pimlico/dates_git.bb                                                                                                                                  |  18 ----
 meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends                                                                                       |  74 --------------
 meta-gnome/recipes-support/tracker/files/90tracker                                                                                                                             |   4 -
 meta-gnome/recipes-support/tracker/files/tracker-dbus.service                                                                                                                  |  15 ---
 meta-gnome/recipes-support/tracker/files/tracker-miner-fs.service                                                                                                              |  12 ---
 meta-gnome/recipes-support/tracker/files/tracker-store.service                                                                                                                 |  12 ---
 .../recipes-multimedia/fluidsynth/files/{0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch => 0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch}   |   0
 meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch                                                                |  32 -------
 meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_1.1.8.bb => fluidsynth_1.1.9.bb}                                                                                     |   5 +-
 meta-oe/recipes-multimedia/jack/jack/0001-typecast-input-parameter-to-int-for-abs.patch                                                                                        |  32 -------
 meta-oe/recipes-multimedia/jack/jack_git.bb                                                                                                                                    |   8 +-
 meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch                                                                                                    |  34 +++++++
 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb                                                                                                                          |   5 +-
 meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.3.bb => xfce4-pulseaudio-plugin_0.3.4.bb}                                                              |   4 +-
 meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.12.1.bb => xfce4-panel_4.12.2.bb}                                                                                            |   4 +-
 meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.0.bb => xfce4-power-manager_1.6.1.bb}                                                                      |   4 +-
 44 files changed, 366 insertions(+), 1929 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0002-Fix-for-automake-1.12.x.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0003-Disable-Werror-for-automake.patch
 rename meta-gnome/recipes-gnome/eds/evolution-data-server/{0001-contact-Replace-the-Novell-sample-contact-with-somet.patch => 0003-contact-Replace-the-Novell-sample-contact-with-somet.patch} (95%)
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch
 rename meta-gnome/recipes-gnome/eds/{evolution-data-server_git.bb => evolution-data-server_3.26.3.bb} (68%)
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml
 delete mode 100755 meta-gnome/recipes-gnome/gdm/gdm/Default
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/cross-xdetection.diff
 delete mode 100755 meta-gnome/recipes-gnome/gdm/gdm/gdm
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/gdm-pam
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/gdm.conf
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in
 delete mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-cups-1.6.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-glib.h.patch
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light/classic-light.xml
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.6.bb
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates.inc
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates_git.bb
 delete mode 100644 meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends
 delete mode 100644 meta-gnome/recipes-support/tracker/files/90tracker
 delete mode 100644 meta-gnome/recipes-support/tracker/files/tracker-dbus.service
 delete mode 100644 meta-gnome/recipes-support/tracker/files/tracker-miner-fs.service
 delete mode 100644 meta-gnome/recipes-support/tracker/files/tracker-store.service
 rename meta-multimedia/recipes-multimedia/fluidsynth/files/{0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch => 0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch} (100%)
 delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_1.1.8.bb => fluidsynth_1.1.9.bb} (83%)
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-typecast-input-parameter-to-int-for-abs.patch
 create mode 100644 meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.3.bb => xfce4-pulseaudio-plugin_0.3.4.bb} (73%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.12.1.bb => xfce4-panel_4.12.2.bb} (91%)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.0.bb => xfce4-power-manager_1.6.1.bb} (90%)

-- 
2.14.3


