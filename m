Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9B86FD16
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:22 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id l18so473984wgh.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=dNW4IBBPkanDJlU7If2OyW5m8G0voIPXNDZE06F4YWY=;
	b=I6IQHgIcrDcGx8Lw+YExL9fF/kQ7sBHPIfvWxx0/ByKI/DUIspvMI1EC5TzGb1kiQf
	DO9MO0yJ8g417WFZPM9GM2hD6kmVjcx2+ZFXgNWzxNV45EJo7CZsKq1yExdslxKzZW6R
	UYVh7BhORMAuNPKJxKElchFzTQbj7IyOfaY7A/AlaLbgS2JPBGTydWjouaLNY0dnLKgr
	cj0o05Q6TBFo+dKqsWRsy+EdqYhsrUDvgp/Pr3GjQR5zcUSlRCa//349vzLVTEn1YFpQ
	rmqw+a2O/nTFGtcC+2jinFNjaSyvXDwaV72Ki4VItr8CikwhPbhDs6M4fBw3pJUIvCkN
	HneA==
X-Received: by 10.180.149.130 with SMTP id ua2mr11919972wib.68.1412151563317; 
	Wed, 01 Oct 2014 01:19:23 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:00 +0200
Message-Id: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe 00/15] unblacklist & updates
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Oct 2014 08:19:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 0d01e1b72333f49c29d1a27ad844c4cd9f90341c:

  smartmontools: add systemd service file (2014-09-26 05:42:54 +0200)

are available in the git repository at:

  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git fixes-and-updates

for you to fetch changes up to 3cf69539452c1be30a3b9547a51112f78897ca74:

  bash-completion: resolve sysroot conflicts for util-linux and networkmanager (2014-10-01 10:11:37 +0200)

----------------------------------------------------------------
Andreas Müller (15):
      faenza-icon-theme: initial add 1.3
      libsecret: initial add 0.18
      networkmanager update to 0.9.8.10
      network-manager-applet: update to 0.9.8.10
      tumbler: update to 0.1.30
      tumbler: fix build deps QA warnings
      ristretto: don't blacklist - tumbler is up again
      xfce4-power-manager:  don't blacklist - networkmanager is up again
      packagegroup-xfce-extended: don't blacklist - xfce4-power-manager is up again
      xfce4-taskmanager: update to 1.0.1
      polkit: update to 0.112
      poppler: update to 0.26.5
      xfce4-whiskermenu-plugin: initial add 1.3.2
      packagegroup-xfce-extended: add xfce4-whiskermenu-plugin
      bash-completion: resolve sysroot conflicts for util-linux and networkmanager

 meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch   |  42 +++++++-----------------------------------
 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-00.png                                            | Bin 494 -> 0 bytes
 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-100.png                                           | Bin 413 -> 0 bytes
 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-25.png                                            | Bin 500 -> 0 bytes
 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-50.png                                            | Bin 496 -> 0 bytes
 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-75.png                                            | Bin 474 -> 0 bytes
 .../recipes-connectivity/network-manager-applet/{network-manager-applet_0.9.8.0.bb => network-manager-applet_0.9.8.10.bb}      |  21 ++++++++-------------
 meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb                                                            |  25 +++++++++++++++++++++++++
 meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb                                                                           |  14 ++++++++++++++
 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-NetworkManager.service-remove-reference-to-NetworkMa.patch     |  32 --------------------------------
 meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8.0.bb => networkmanager_0.9.8.10.bb}                          |  11 ++++-------
 meta-oe/recipes-extended/polkit/{polkit_0.111.bb => polkit_0.112.bb}                                                           |  19 ++-----------------
 meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb                                                                 |   5 ++++-
 meta-oe/recipes-support/poppler/{poppler_0.22.4.bb => poppler_0.26.5.bb}                                                       |   6 +++---
 meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb                                                                            |   1 -
 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.0.1.bb                                                            |  10 ++++++++++
 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb                                                              |  18 ------------------
 meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb                                                      |  10 ++++++++++
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                                             |   3 +--
 meta-xfce/recipes-xfce/tumbler/tumbler/0001-configure-use-pkg-config-for-freetype2.patch                                       |  45 +++++++++++++++++++++++++++++++++++++++++++++
 meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.29.bb => tumbler_0.1.30.bb}                                                        |  11 +++++------
 meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb                                                        |   2 --
 22 files changed, 138 insertions(+), 137 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-00.png
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-100.png
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-25.png
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-50.png
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-75.png
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_0.9.8.0.bb => network-manager-applet_0.9.8.10.bb} (59%)
 create mode 100644 meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
 create mode 100644 meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-NetworkManager.service-remove-reference-to-NetworkMa.patch
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8.0.bb => networkmanager_0.9.8.10.bb} (87%)
 rename meta-oe/recipes-extended/polkit/{polkit_0.111.bb => polkit_0.112.bb} (76%)
 rename meta-oe/recipes-support/poppler/{poppler_0.22.4.bb => poppler_0.26.5.bb} (85%)
 create mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.0.1.bb
 delete mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb
 create mode 100644 meta-xfce/recipes-xfce/tumbler/tumbler/0001-configure-use-pkg-config-for-freetype2.patch
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.29.bb => tumbler_0.1.30.bb} (80%)

-- 
1.8.3.1


