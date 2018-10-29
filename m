Return-Path: <brendank310@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id B295A78EFF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:39 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 189so3918458qkj.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iQbFUcdQjuDqjvy2uYMszyqgeEVe6WbG+HV6lYzSNqc=;
	b=DRZStCECskJu91f5kiC+HJ1vpKk99tNH7Z6SsxnlM0lAx4BFQrhZ58kYje9nNRQgDi
	+4o5hM3HAr/rTXXAoqZIdFNtDB6qzoLMAYjvAVeKXtpleJasVmyczJL3NS1ZNJBRPsAw
	4IUiNPuDIChCUYy+RCOlSwwNogkYfDdaJLmWlg3L4TBbykVpSfTBrPL4Qkxot6T2VUCF
	GoMcbPkII7pLnkwbcHddZ8DQaPJu0QxmeeKNX5u/aILNMRtkT8mnALpXrTofi++YldHz
	w9dRdvVyOnK4A2q1WvwHEelDmvLBHxqtL87sU74K9OSKxztjroVkMFHnlFiT5vZBm8qV
	ZHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iQbFUcdQjuDqjvy2uYMszyqgeEVe6WbG+HV6lYzSNqc=;
	b=Ldqy6X+ammtg0TNBrUkWuo6eDB8GpwWk36DKQpj3ROvwU4w4OQAAK4MhdlPiv/Fx6Z
	pB0eGeOPPDghi0pq8d1XGzr+1zL1Onw5GmyMaIhJwNQ22kPcGlrJetc39dmIhKMVziXA
	RlabEgrO6ZIx/XdzUb9C6Q9ao8tD3cL8ErV8rhTUNV/vvQBguh1/dMPnUE7zs0LJbuYY
	gI5MhJRahW66kkkYWO753+MdZ8Gm4tuakAtR7UPs2apXyQno0733wztRYEXw4zIo+pDH
	gQYpjrAK3KwVx8r/8WGY4dWEUqvnIEU9dUMguWPDvqrhYFyudANexkXLtb55tvo4OmJN
	bn0g==
X-Gm-Message-State: AGRZ1gKHxno13v25vzb8adfbSOKLB72nla1OA9o/9CpnpxtiWM8DiAQN
	fLHkG58X1ttaJ26eXxuCBidBDv5e
X-Google-Smtp-Source: AJdET5dxU8s3gW/V69Qs0PnhIAkppArNpx2c6gnnkhKn5zrp+tURTZJFhRCYJVbypnU5nnAbvIjoTA==
X-Received: by 2002:a37:a1c1:: with SMTP id
	k184mr12438531qke.166.1540831300309; 
	Mon, 29 Oct 2018 09:41:40 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:39 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:40:57 -0400
Message-Id: <cover.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 00/16] Add gnome-shell support
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:40 -0000

This adds gnome3/gnome-shell support (and required dependencies)
to meta-gnome.

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit f1511d254632a34c1deb51f4bf8b8c21e7423f51:

  libssh: Do not use thumb-1 ISA on armv5 (2018-10-27 18:29:32 -0700)

are available in the Git repository at:

  git://github.com/brendank310/meta-openembedded gnome-shell-support
  https://github.com/brendank310/meta-openembedded/tree/gnome-shell-support

Brendan Kerrigan (16):
  sassc: add recipes for libsass-native and sassc-native.
  ibus: add recipe for ibus to support gnome-settings-daemon and
    gnome-shell
  gjs: add a recipe for gjs (Gnome JavaScript engine)
  accountsservice: add recipe for Accounts Service
  lcms2: add recipe for Little Color Management System
  gnome-settings-daemon: add recipe for gnome-settings-daemon
  geocode-glib: add recipe for geocode-glib library
  libgweather: add recipe for libgweather
  gdm: add recipe for gdm (Gnome Desktop Manager)
  dconf-native: add dconf-native recipe
  libwacom: add recipe for libwacom
  mutter: add recipe for mutter window manager
  gnome-shell: add recipe for gnome-shell.
  packagegroup-gnome3-base: add packagegroup for installing
    gnome3/gnome-shell
  gnome-shell-extensions: add recipe for gnome-shell-extensions
  gnome-tweak-tool: add recipe for the GNOME Tweak tool

 .../dconf/dconf-native_0.28.0.bb              |  19 ++++
 .../accountsservice/0001-strip-out-intl.patch | 104 ++++++++++++++++++
 .../gnome3/accountsservice_git.bb             |  24 ++++
 meta-gnome/recipes-gnome/gnome3/gdm_git.bb    |  33 ++++++
 .../recipes-gnome/gnome3/geocode-glib_git.bb  |  21 ++++
 .../gnome3/gjs/0001-fix-override-allow.patch  |  75 +++++++++++++
 meta-gnome/recipes-gnome/gnome3/gjs_git.bb    |  30 +++++
 .../0001-remove-extraneous-plugins.patch      |  52 +++++++++
 .../gnome3/gnome-settings-daemon_git.bb       |  43 ++++++++
 .../gnome3/gnome-shell-extensions_git.bb      |  40 +++++++
 .../gnome-shell/0001-dont-detect-python.patch |  24 ++++
 .../recipes-gnome/gnome3/gnome-shell_git.bb   |  46 ++++++++
 .../recipes-gnome/gnome3/gnome-tweaks_git.bb  |  19 ++++
 .../ibus/0001-strip-out-dbus-build-dep.patch  |  29 +++++
 ...0002-decorate-automake-for-valaflags.patch |  46 ++++++++
 .../recipes-gnome/gnome3/ibus_1.5.19.bb       |  41 +++++++
 meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb  |  14 +++
 .../recipes-gnome/gnome3/libgweather_git.bb   |  23 ++++
 .../gnome3/libsass-native_3.5.4.bb            |  16 +++
 .../recipes-gnome/gnome3/libwacom_git.bb      |  17 +++
 .../mutter/0001-disable-zenity-check.patch    |  27 +++++
 ...spection-variables-with-correct-path.patch |  63 +++++++++++
 .../0003-packageconfig-variable-fixup.patch   |  29 +++++
 .../mutter/0004-fix-broken-includes.patch     |  37 +++++++
 meta-gnome/recipes-gnome/gnome3/mutter_git.bb |  59 ++++++++++
 .../gnome3/sassc-native_3.5.0.bb              |  15 +++
 .../packagegroups/packagegroup-gnome3-base.bb |  27 +++++
 27 files changed, 973 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/accountsservice/0001-strip-out-intl.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gdm_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/geocode-glib_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gjs/0001-fix-override-allow.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gjs_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon/0001-remove-extraneous-plugins.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-shell-extensions_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-shell/0001-dont-detect-python.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-shell_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/ibus/0001-strip-out-dbus-build-dep.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/ibus/0002-decorate-automake-for-valaflags.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/ibus_1.5.19.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/libgweather_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/libsass-native_3.5.4.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/libwacom_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/mutter/0001-disable-zenity-check.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/mutter/0002-fixup-introspection-variables-with-correct-path.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/mutter/0003-packageconfig-variable-fixup.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/mutter/0004-fix-broken-includes.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/mutter_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome3/sassc-native_3.5.0.bb
 create mode 100644 meta-gnome/recipes-gnome/packagegroups/packagegroup-gnome3-base.bb

-- 
2.17.1


