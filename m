Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5776160807
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:38:51 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id y17so14125249wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7ooc4NUgE5KKH3tyRLvYmTvm6jxIM59b9+K0R5Sjqcg=;
	b=YlVYZAIYnofVV/SCweXyp5AeYtF1U/dELqnuecmdg/P10W5P4DX1lYXLOzLJuErj3W
	eu7mRgSvI4Ou64cuKFHnn+aQR/CcqCsp3dAZ2UEy+YPu6AEnYDkX2HzTaKAkpudsqkml
	hlCR+hiYREQlnOakEFxTVhGnInfCzZVlakd6Lht+qYFdogjyyfORjHMpDifz2nd/hzhB
	X4aMi0q8V71BDMJLOLA0uq40EmIi5wOj/Cxizy6XzsYyEQ20FSk3PnpCjDkRZNpknO22
	oMeGYIZR2UOM868EWxTWDvb2wdICWbSZM5PHGpwPnreyfXGMFsTrsR4VQPhcnEHBNPiV
	E/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7ooc4NUgE5KKH3tyRLvYmTvm6jxIM59b9+K0R5Sjqcg=;
	b=Cn94UJOqNMt9JVdbJMhZQssMRGtnl1weru2fjJSz/zAq9P3kevaRoCTHijXBpbCMiB
	+nxQqTR0q89PucMblGo+9dUC1NGB46iEFuIxVcPntIV1xo/5SbU3vPoculOM/8WnSmLy
	3zVN84swv4QOjgDSK0X2kpcnkBmnCJRsbpcbnz3lGOAtwkroHW56S70rG5U51lTzGM2x
	n16mHDa67cbzWTwnv2U5FZHj4fRf2s9he5d4DErBSIucgK/dVmKVURZmCeGzhuqjOMIQ
	qdm67UE06rC7RJ9CjzYbeJWLSzvmDcJGihqh4PnYmjTiDyYJDVxQcuz3eF5e/nyqPAI1
	nVLw==
X-Gm-Message-State: APjAAAXmg9ULhR5VUrnMjIWYoxBAkboZSfesr0oJEFastMcF7Uol12ET
	+aJSwydikj5sJFIaeXLPhsYXSQ9M
X-Google-Smtp-Source: APXvYqxWRQJoC/bC8+N6lDuFlH4K8vDaM6eI0X4iqxU98W8AoFP3zeBGElAAkQBt9FemVsx5lx/U0w==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr28356172wrm.13.1575851931529; 
	Sun, 08 Dec 2019 16:38:51 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.38.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:38:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:11 +0100
Message-Id: <20191209003840.3383-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH][v2 00/29] Gnome cleanups & desktop patches
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
X-List-Received-Date: Mon, 09 Dec 2019 00:38:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2:
* gjs 1.58.1 -> 1.58.3 (desperate attempt to fix mips/gobject-introspection/qemu)
* gnome-control-center: distro-features + systemd
* gnome-flashback: distro-features + systemd/pam
* gnome-online-accounts: distro-features + x11
* gnome-panel: distro-features + systemd/pam
* gnome-session: distro-features + polkit systemd pam gobject-introspection-data
* gnome-shell-extensions: distro-features + x11 polkit systemd pam / upstream-version-is-even
* gnome-shell distro-features + systemd pam
* rest: --without-gnome
* accountsservice: musl build fix
* packagegroup-gnome-apps: add gnome-system-monitor only if polkit in distro feature
* packagegroup-gnome-desktop: + polkit systemd pam gobject-introspection-data
* some patches added to adjust required distro features (they popped up during tests)

Andreas Müller (29):
  pinpoint: remove dead project
  gnome-keyring: upgrade 3.28.2 -> 3.34.0
  libgsf: upgrade 1.14.45 -> 1.14.46
  libgnome-keyring: remove
  gjs: initial add 1.58.3
  gdm: re-add 3.34.1
  gnome-shell: initial add 3.34.1
  gnome-shell-extensions: initial add 3.34.1
  accountsservice: initial add 0.6.55
  rest: initial add 0.8.1
  gnome-online-accounts: initial add 3.34.1
  gvfs: upgrade 1.41.2 -> 1.42.1
  grilo: initial add 0.3.10
  gsound: initial add 1.0.2
  gnome-control-center: re-add 3.34.1
  gnome-session: inital add 3.34.1
  gnome-backgrounds: initial add 3.34.0
  metacity: upgrade 3.32.0 -> 3.34.1
  gnome-panel: (re)add 3.34.1
  gnome-flashback: initial add 3.34.1
  Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
  glfw: add features_check to inherit
  stalonetray: Add x11 to required distro feature
  projucer: add x11 to required distro features
  colord-gtk: add polkit to required distro features
  yelp: add x11 to required distro features
  file-roller: remove nautilus from DEPENDS
  libgdata: add x11 to required distro features
  accountsservice: Hack musl build fix

Kai Kang (1):
  thunar: 1.8.9 -> 1.8.10

 .../recipes-apps/pinpoint/pinpoint_git.bb     | 24 -------
 .../file-roller/file-roller_3.32.2.bb         |  1 -
 .../0001-Ensure-pam-file-installation.patch   | 48 ++++++++++++++
 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb    | 56 ++++++++++++++++
 .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 ++++++++++
 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb    | 37 +++++++++++
 .../gnome-backgrounds_3.34.0.bb               | 17 +++++
 ...001-Add-meson-option-to-pass-sysroot.patch | 45 +++++++++++++
 .../gnome-control-center_3.34.1.bb            | 55 ++++++++++++++++
 .../gnome-flashback/gnome-flashback_3.34.1.bb | 34 ++++++++++
 ...-agent-and-ssh-add-by-configure-opti.patch | 42 ++++++++++++
 .../gnome-keyring/gnome-keyring_3.28.2.bb     | 44 -------------
 .../gnome-keyring/gnome-keyring_3.34.0.bb     | 51 +++++++++++++++
 .../gnome-keyring/libgnome-keyring_3.12.0.bb  | 29 ---------
 .../gnome-online-accounts_3.34.1.bb           | 35 ++++++++++
 ...nd-ZONEINFO-it-tries-to-run-compiled.patch | 37 +++++++++++
 .../gnome-panel/gnome-panel_3.34.1.bb         | 28 ++++++++
 .../gnome-session/gnome-session_3.34.1.bb     | 39 +++++++++++
 .../gnome-shell-extensions_3.34.1.bb          | 29 +++++++++
 .../gnome-shell/gnome-shell_3.34.1.bb         | 64 +++++++++++++++++++
 .../recipes-gnome/grilo/grilo_0.3.10.bb       | 29 +++++++++
 .../recipes-gnome/gsound/gsound_1.0.2.bb      | 13 ++++
 .../gvfs/{gvfs_1.41.2.bb => gvfs_1.42.1.bb}   | 11 ++--
 .../libgdata/libgdata_0.17.10.bb              |  5 +-
 ...p-a-copy-paste-of-introspection.m4-m.patch |  0
 .../{libgsf_1.14.45.bb => libgsf_1.14.46.bb}  | 12 ++--
 .../recipes-gnome/metacity/metacity_3.32.0.bb | 41 ------------
 .../recipes-gnome/metacity/metacity_3.34.1.bb | 38 +++++++++++
 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb   | 33 ++++++++++
 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb  |  5 +-
 .../0001-musl-Hack-to-fix-build.patch         | 36 +++++++++++
 .../0002-musl-add-missing-fgetspent_r.patch   | 46 +++++++++++++
 .../accountsservice/accountsservice_0.6.55.bb | 33 ++++++++++
 .../colord-gtk/colord-gtk_0.2.0.bb            |  4 ++
 .../packagegroups/packagegroup-gnome-apps.bb  | 19 ++++++
 .../packagegroup-gnome-desktop.bb             | 26 ++++++++
 .../recipes-multimedia/juce/projucer.inc      |  4 +-
 meta-oe/recipes-core/glfw/glfw_3.3.bb         |  2 +-
 .../stalonetray/stalonetray_0.8.3.bb          |  4 +-
 .../{thunar_1.8.9.bb => thunar_1.8.10.bb}     |  7 +-
 40 files changed, 954 insertions(+), 162 deletions(-)
 delete mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-file-installation.patch
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.34.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sysroot.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
 create mode 100644 meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.41.2.bb => gvfs_1.42.1.bb} (87%)
 rename meta-gnome/recipes-gnome/libgsf/{files => libgsf}/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch (100%)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.45.bb => libgsf_1.14.46.bb} (59%)
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
 create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
 create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.9.bb => thunar_1.8.10.bb} (74%)

-- 
2.21.0


