Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E970C78766
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:02 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id z81so15081370wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AVnEoTf2VWnamnb+0PVN66Sf7l3zK0eRWu7GCmuRhzU=;
	b=N58r/X2X2mXBq15G9FtGnlFX+VBdUIttI3rVm1uWXLetFe6eDE4o2xMlBhQGGV8obq
	QWWuvfzuxQ+CQgHqdKnzapI7vgq0jFSRWtXP3Fq9zvYT0HBJkIVojhZ3Llt2dA63SMrR
	efrpBIOBReyN/2XrHQOFl6y3Ux3q/34Uf90tdGkj2jcuNo5Kovcxx8gNnFv5mI7NXmiq
	vlIDzTxFkWlgXBgOutdW6v+1RKR1YKVaY2o1GyAM2EKd9I+a87ox/twIR/w2/2/n+ySu
	Ch4hIO+V1owoEqu1zdVIvSshr+oINIUm6t0TYkGTrTC9SWY+kMPjJCZj9T27FBgebSHu
	cGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AVnEoTf2VWnamnb+0PVN66Sf7l3zK0eRWu7GCmuRhzU=;
	b=o6itdB5v1+yTrALPzqNaQYPHzBZbcNEUQYEeljXZ/Ns/Fv1j8YUWLjxeo5lF7k1VSH
	C/7CAn8/8xvcmta0Ka0dZ+IppMswBH2hiN/+/ZSx2QKhh3woKpy66llnUqSMqkE0er0m
	XxYsLMykd6s9jCXl7g3pSBJ77AKMklq5AXMU6Duj7uI6Lvvpk7c4jFe3PF2vVoE3uQbD
	TQLou/blSJ/fPPSdh0tuYmuuYWAuy7CSGCWpb/r6jpOKfrCBBXbesHxOXcu9RamFh5dw
	y+9Saem4fKNfrqzvE3mNMixsCmepSELWSyU341tYwxdRpaSO3p6R0S8H/MqJEy9zQ9P7
	NuVg==
X-Gm-Message-State: APf1xPCPUyfA4UznO7KLL1BC+neQnE3f9HlWx3UkQ/MZ+4Dyj0MhZt3v
	GJBUeuNlgqeDB36SUCbffrfCUg==
X-Google-Smtp-Source: AG47ELtNpdOg3G3Rdprq86543/4Wske5YBpfYXaFzONm0TVn4SBSJYO7FbXumBPNCq5Mg+scTYwlDg==
X-Received: by 10.28.139.19 with SMTP id n19mr3249791wmd.40.1519945323048;
	Thu, 01 Mar 2018 15:02:03 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:36 +0100
Message-Id: <20180301230148.2284-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 00/12] meta-xfce updates + fix
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To be honest:
* For those patches possible a run test was performed
* Builds were made close to rocko (don't have enough build machines :) so hope
  world build does not turn red on these..

The following changes since commit d0619b667202cb1e99f5eec2232b86d509437b3d:

  xrdp: enable cpliboard (2018-02-23 20:29:06 -0800)

are available in the Git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to b97e5db88cebbd1f06b3840a8b170b1816da3fef:

  fltk: rework packaging (2018-03-01 23:40:58 +0100)

----------------------------------------------------------------
Andreas Müller (12):
      xfce4-panel: add gtk-icon-cache to inherit
      devilspie2: update 0.42 -> 0.43
      xfce4-whiskermenu-plugin: update 2.1.4 -> 2.1.5
      xfce4-terminal: update 0.8.6 -> 0.8.7.1
      exo: update 0.11.5 -> 0.12.0
      thunar: update 1.6.13 -> 1.6.14
      xfce4-timer-plugin: update 1.6.0 -> 1.7.0
      menulibre: update 2.1.3 -> 2.1.5
      xfce4-notifyd: update 0.4.0 -> 0.4.2
      parole: update 0.8.1 -> 1.0.0
      xfce4-pulseaudio-plugin: update 0.3.4 -> 0.3.5
      fltk: rework packaging

 meta-gnome/recipes-gnome/devilspie/{devilspie2_0.42.bb => devilspie2_0.43.bb}                                        |   4 ++--
 meta-gnome/recipes-gnome/devilspie/files/devilspie2.desktop                                                          |   1 +
 meta-oe/recipes-support/fltk/fltk.bb                                                                                 |  10 ++++++++-
 meta-xfce/recipes-apps/menulibre/files/0001-add_launcher-Exit-early-if-no-row-is-selected.patch                      |  37 ------------------------------
 meta-xfce/recipes-apps/menulibre/files/0002-setup.py-avoid-usr-share-share-paths.patch                               |  40 ---------------------------------
 meta-xfce/recipes-apps/menulibre/files/0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch                       |  36 ------------------------------
 meta-xfce/recipes-apps/menulibre/{menulibre_2.1.3.bb => menulibre_2.1.5.bb}                                          |  21 ++++++++++--------
 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch           | 105 --------------------------------------------------------------------------------------
 meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.4.0.bb => xfce4-notifyd_0.4.2.bb}                              |   5 ++---
 meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.6.bb => xfce4-terminal_0.8.7.1.bb}                         |   4 ++--
 meta-xfce/recipes-multimedia/parole/{parole_0.8.1.bb => parole_1.0.0.bb}                                             |   4 ++--
 meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.4.bb => xfce4-pulseaudio-plugin_0.3.5.bb}    |   4 ++--
 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin/0001-Specify-string-format-explicitly.patch                 |  32 --------------------------
 meta-xfce/recipes-panel-plugins/timer/{xfce4-timer-plugin_1.6.0.bb => xfce4-timer-plugin_1.7.0.bb}                   |   6 ++---
 meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.4.bb => xfce4-whiskermenu-plugin_2.1.5.bb} |   4 ++--
 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch                                                |   8 +++----
 meta-xfce/recipes-xfce/exo/{exo_0.11.5.bb => exo_0.12.0.bb}                                                          |   4 ++--
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.13.bb => thunar_1.6.14.bb}                                                 |   4 ++--
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb                                                             |   5 +++--
 19 files changed, 47 insertions(+), 287 deletions(-)
 rename meta-gnome/recipes-gnome/devilspie/{devilspie2_0.42.bb => devilspie2_0.43.bb} (87%)
 delete mode 100644 meta-xfce/recipes-apps/menulibre/files/0001-add_launcher-Exit-early-if-no-row-is-selected.patch
 delete mode 100644 meta-xfce/recipes-apps/menulibre/files/0002-setup.py-avoid-usr-share-share-paths.patch
 delete mode 100644 meta-xfce/recipes-apps/menulibre/files/0003-MenulibreXdg.py-fix-loading-of-desktop-files.patch
 rename meta-xfce/recipes-apps/menulibre/{menulibre_2.1.3.bb => menulibre_2.1.5.bb} (53%)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.4.0.bb => xfce4-notifyd_0.4.2.bb} (77%)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.6.bb => xfce4-terminal_0.8.7.1.bb} (68%)
 rename meta-xfce/recipes-multimedia/parole/{parole_0.8.1.bb => parole_1.0.0.bb} (86%)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.4.bb => xfce4-pulseaudio-plugin_0.3.5.bb} (73%)
 delete mode 100644 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin/0001-Specify-string-format-explicitly.patch
 rename meta-xfce/recipes-panel-plugins/timer/{xfce4-timer-plugin_1.6.0.bb => xfce4-timer-plugin_1.7.0.bb} (65%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.4.bb => xfce4-whiskermenu-plugin_2.1.5.bb} (66%)
 rename meta-xfce/recipes-xfce/exo/{exo_0.11.5.bb => exo_0.12.0.bb} (88%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.13.bb => thunar_1.6.14.bb} (88%)

-- 
2.14.3


