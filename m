Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3165C7608A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:41 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id k16-v6so17799953wro.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=udqT96zSB5Ir3ZUbK7xbRaadaKW/zS3rScOJktUtvGM=;
	b=F5e3LqQmNicUOniCwEJk/V8fTjK6ql3jJhf2ypi/06B07/ghrm0F8Qkf+IfrSwK5x/
	S1FHswNO4+PsMmjLNOVXDbAnAh/J5fr/E3oPaVc7T7aCl8zrgwKo9seentrOSZG6Ka+8
	hnSaEuWOtuc8vmm8OprnucwlCJ+DoVGd7ElnibTokUkkK53+CbsqZ+PCKb76cenpyIra
	DwRP3rJMyUlNR85hYCitBkL4OxL8M/0fpPXQEEaYbO4mvE4f6XLgn3mhsVjDfGpjUtkN
	/TLVrKm4yXudWqA5lwbAUsXm/NDYYLlOHiPztTE3zOlKlKm05R0hnyBe4IxwIdIKO3vd
	D9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=udqT96zSB5Ir3ZUbK7xbRaadaKW/zS3rScOJktUtvGM=;
	b=WvGnm+XM0eSVkNIO0pyQzb6w02fDNgwqwiTfR86Mqosq5mU7gYgt/nSrw9Jq0JDto7
	yezcENKPXt1d79x3t9t9rl8C1FcD5JHx/Zdhl4omIlVcwCCnpY+dg7k0G2TO6l2qhcvt
	USFPg/PjI5GiNcOe95Uk9XAc5ZIx8GFTSe5GDuZuIi7n4B7PukTp15xfXh8mtbN3qUt+
	FZ0XnoZj7LAFUvwOf5EvK32e1tQgLc47gxno3+aJr74vN587OdVoOXAUFD+CD+ok3Fy/
	fqJQJ1KtFIWmM2C/WPG2iqb+97WEHKpzSnBvaJ0c4sGEh1uIe/QIGpsRrYjEMffZP/BJ
	0UXg==
X-Gm-Message-State: APt69E2swy8787uNe0Yhq7IqljFjxk2o5+i19+Lqr9B3iNHZtFzaY+ll
	5EXRjxjgBJvNyIHvH8xUfnwecQ==
X-Google-Smtp-Source: ADUXVKI7LOb3/fLyib1pzRl5XTB7v6A923duob5YGGPfjkBDwzVBpdzA3P6MGMBIdBPINUUTXZZuGQ==
X-Received: by 2002:adf:84c2:: with SMTP id
	60-v6mr10934135wrg.167.1528643321416; 
	Sun, 10 Jun 2018 08:08:41 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:02 +0200
Message-Id: <20180610150821.9536-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 00/19] meta-xfce: Move towards GTK3 slightly
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some patches of these I carry around for a while. At the time of making
xfce4-panel was not yet ready for use - This has changed by 4.13.3.

As we are about to move to gcc8 and we can expect fallout, I'd be happy
to ignore gcc8 caused breakers - I promis to take care in a follwo up.

The following changes since commit bb57bac845f3cd1634862fa9868bc8e294ba74a9:

  libgpiod: add packageconfig for python bindings (2018-05-26 21:10:55 -0700)

are available in the Git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git xfce-patches

for you to fetch changes up to b5e8688651bbbe63183eb0a9e10b0fe1d82fc966:

  thunar-plugin.bbclass: pack GTK3 plugins properly (2018-06-10 15:03:14 +0200)

----------------------------------------------------------------
Andreas Müller (19):
      libxfce4ui: upgrade 4.12.1-> 4.13.4
      libxfce4util: upgrade 4.12.1 -> 4.13.1
      xfconf: upgrade 4.12.1 -> 4.13.4
      xfce4-mixer: fix build after update of xfconf
      ristretto: fix build after update of xfconf
      xfce4-settings: fix build after update of xfconf
      xfce4-panel: upgrade 4.12.2 -> 4.13.3
      thunar: upgrade 1.6.15 -> 1.8.0
      thunar-volman: update 0.8.1 -> 0.9.0
      thunar-archive-plugin: upgrade 0.3.1 -> 0.4.0
      thunar-media-tags-plugin: upgrade 0.2.1 -> 0.3.0
      xfce4-whiskermenu-plugin: upgrade 2.1.7 -> 2.2.0
      xfce4-taskmanager: upgrade 1.2.0 -> 1.2.1
      mousepad: upgrade 0.4.0 -> 0.4.1
      xfce4-terminal: upgrade 0.8.7.3 -> 0.8.7.4
      xfce4-cpufreq-plugin: upgrade 1.1.3 -> 1.2.0
      packagegroup-xfce-extended: add mousepad
      various classes recipes: Remove FILES entries for dbg/dev packages
      thunar-plugin.bbclass: pack GTK3 plugins properly

 meta-xfce/classes/thunar-plugin.bbclass                                                                                                                                       |  5 +----
 meta-xfce/classes/xfce-panel-plugin.bbclass                                                                                                                                   |  2 +-
 meta-xfce/classes/xfce.bbclass                                                                                                                                                |  8 --------
 meta-xfce/recipes-apps/mousepad/{mousepad_0.4.0.bb => mousepad_0.4.1.bb}                                                                                                      |  4 ++--
 meta-xfce/recipes-apps/orage/orage_4.12.1.bb                                                                                                                                  |  1 -
 meta-xfce/recipes-apps/ristretto/files/0001-Fix-build-after-update-of-xfconf.patch                                                                                            | 40 ++++++++++++++++++++++++++++++++++++++++
 meta-xfce/recipes-apps/ristretto/ristretto_0.8.2.bb                                                                                                                           |  1 +
 meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-after-update-of-xfconf.patch                                                                                          | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb                                                                                                                      |  5 ++++-
 meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.2.0.bb => xfce4-taskmanager_1.2.1.bb}                                                                           |  4 ++--
 meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.3.bb => xfce4-terminal_0.8.7.4.bb}                                                                                |  4 ++--
 meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb                                                                                                                           |  2 --
 meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.1.3.bb => xfce4-cpufreq-plugin_1.2.0.bb}                                                                      |  4 ++--
 meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.7.bb => xfce4-whiskermenu-plugin_2.2.0.bb}                                                          |  4 ++--
 meta-xfce/recipes-thunar-plugins/archive/{thunar-archive-plugin_0.3.1.bb => thunar-archive-plugin_0.4.0.bb}                                                                   |  4 ++--
 meta-xfce/recipes-thunar-plugins/media-tags/{thunar-media-tags-plugin_0.2.1.bb => thunar-media-tags-plugin_0.3.0.bb}                                                          |  4 ++--
 meta-xfce/recipes-xfce/exo/exo_0.12.0.bb                                                                                                                                      |  3 ---
 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb                                                                                                               |  5 -----
 meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.12.1.bb => libxfce4ui_4.13.4.bb}                                                                                              |  9 +++------
 meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.12.1.bb => libxfce4util_4.13.1.bb}                                                                                        |  6 +++---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                                                                                            |  1 +
 meta-xfce/recipes-xfce/thunar-volman/thunar-volman/0001-Fix-return-with-no-value-in-function-returning-non-v.patch                                                            | 26 --------------------------
 meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.8.1.bb => thunar-volman_0.9.0.bb}                                                                                       |  7 +++----
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.15.bb => thunar_1.8.0.bb}                                                                                                           | 17 +++++++----------
 meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb                                                                                                                               |  7 -------
 meta-xfce/recipes-xfce/xfce4-panel/files/0001-clock-time-make-change-of-system-s-timezone-change-t.patch                                                                      | 42 ------------------------------------------
 meta-xfce/recipes-xfce/xfce4-panel/files/{0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch => 0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch} | 26 +++++++++++++-------------
 meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.12.2.bb => xfce4-panel_4.13.3.bb}                                                                                           | 16 +++++-----------
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb                                                                                                                  |  2 --
 meta-xfce/recipes-xfce/xfce4-settings/files/0002-Fix-linking-to-dbus-glib-bug-13633.patch                                                                                     | 41 +++++++++++++++++++++++++++++++++++++++++
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                                                                                                   |  1 +
 meta-xfce/recipes-xfce/xfconf/{xfconf_4.12.1.bb => xfconf_4.13.4.bb}                                                                                                          |  4 ++--
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb                                                                                                                                  |  2 --
 33 files changed, 201 insertions(+), 167 deletions(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.4.0.bb => mousepad_0.4.1.bb} (81%)
 create mode 100644 meta-xfce/recipes-apps/ristretto/files/0001-Fix-build-after-update-of-xfconf.patch
 create mode 100644 meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-after-update-of-xfconf.patch
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.2.0.bb => xfce4-taskmanager_1.2.1.bb} (61%)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.3.bb => xfce4-terminal_0.8.7.4.bb} (68%)
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.1.3.bb => xfce4-cpufreq-plugin_1.2.0.bb} (64%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.7.bb => xfce4-whiskermenu-plugin_2.2.0.bb} (66%)
 rename meta-xfce/recipes-thunar-plugins/archive/{thunar-archive-plugin_0.3.1.bb => thunar-archive-plugin_0.4.0.bb} (74%)
 rename meta-xfce/recipes-thunar-plugins/media-tags/{thunar-media-tags-plugin_0.2.1.bb => thunar-media-tags-plugin_0.3.0.bb} (63%)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.12.1.bb => libxfce4ui_4.13.4.bb} (74%)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.12.1.bb => libxfce4util_4.13.1.bb} (54%)
 delete mode 100644 meta-xfce/recipes-xfce/thunar-volman/thunar-volman/0001-Fix-return-with-no-value-in-function-returning-non-v.patch
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.8.1.bb => thunar-volman_0.9.0.bb} (55%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.15.bb => thunar_1.8.0.bb} (55%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-clock-time-make-change-of-system-s-timezone-change-t.patch
 rename meta-xfce/recipes-xfce/xfce4-panel/files/{0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch => 0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch} (67%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.12.2.bb => xfce4-panel_4.13.3.bb} (70%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0002-Fix-linking-to-dbus-glib-bug-13633.patch
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.12.1.bb => xfconf_4.13.4.bb} (75%)

-- 
2.14.3


