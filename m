Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C97E7605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:36:24 +0000 (UTC)
Received: by wgck11 with SMTP id k11so61484870wgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=gDdM4B77OG1rQcPrmLslAflavuw1p4aJclyFvBAYs6g=;
	b=U+m0QpKFPLj+xWOy5X4BqFBHfKJNZLRR+CUDOdDYjRtbFZokDDqec98UiZOX8NdZi1
	jC1caG0ysDk4lIgwuzw37igyalA0ePDdwEDYgYODf7gUHtCZ3T/Lwk+zLhmaFey8ZPW5
	d2Hou0x4sE0ze6VIJ3Xjx32+QpNB/EgyLq4ZMPdVlz6j0aR8X0JDKDmNuL8wo2Kk/FtX
	E2bgnuCxAa6T4BFXAfuf6wny0VrZ1hA/184ZlaW0bbX9kP6sMGd0/ZPtnD8IdzqMkFXM
	9HKV6lewxYurxY4yGiiK54JvB2O0w/DiKQh0v/ZWQw5VZ3xV648DU5WutcFdIhV+gjgL
	jX0w==
X-Received: by 10.181.27.131 with SMTP id jg3mr5232835wid.89.1435235785302;
	Thu, 25 Jun 2015 05:36:25 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id
	pg1sm45655780wjb.39.2015.06.25.05.36.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 05:36:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:35:47 +0200
Message-Id: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 0/7] here and there / some resend
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
X-List-Received-Date: Thu, 25 Jun 2015 12:36:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I saw that my last patches [1-3][5] did not make it into patchwork 
(german umlaut?) so I resend them as pull request:

The following changes since commit 34dcefb1bfbbac33a771b4b68748e0d9d877365e:

  lvm2: add systemd support (2015-06-23 12:43:12 +0200)

are available in the git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to 4f22e684e6950301816602fe17b4d06bc0a08078:

  gnome-settings-daemon: fix PACKAGECONFIG (2015-06-25 14:20:59 +0200)

----------------------------------------------------------------
Andreas Müller (7):
      libndp: initial add 1.5
      networkmanager: update to 1.0.2
      network-manager-applet: update to 1.0.2
      libxfce4ui: build gtk3 libs and pack gtk2/gtk3 libs in separate packages
      xfce4-session: ensure ip for machine is found by adding to hosts
      xfdesktop: fix settings for monitors containing white spaces
      gnome-settings-daemon: fix PACKAGECONFIG

 ...ort-for-AP-mode-setting-for-wifi-sharing.patch => 0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch} |   0
 .../network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch                  |  41 -----------------
 ...twork-sharing-if-device-supports-it.patch => 0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch} |   2 +-
 .../network-manager-applet/{network-manager-applet_0.9.8.10.bb => network-manager-applet_1.0.2.bb}                |  16 +++----
 meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb                                    |   2 +-
 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb                                                                 |  10 +++++
 .../networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch                 |  30 -------------
 meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8.10.bb => networkmanager_1.0.2.bb}               |  41 ++++-------------
 meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac-remove-optional-gtk3-support.patch                      |  37 ----------------
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb                                                            |   7 ++-
 meta-xfce/recipes-xfce/xfce4-session/machine-host.bb                                                              |  17 ++++++++
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb                                                      |   2 +
 meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-whitespaces-from-monitor-name-when-accessing-.patch            | 138 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.2.bb                                                              |   1 +
 14 files changed, 188 insertions(+), 156 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/files/{0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch => 0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch} (100%)
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
 rename meta-gnome/recipes-connectivity/network-manager-applet/files/{0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch => 0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch} (97%)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_0.9.8.10.bb => network-manager-applet_1.0.2.bb} (67%)
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8.10.bb => networkmanager_1.0.2.bb} (59%)
 delete mode 100644 meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac-remove-optional-gtk3-support.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/machine-host.bb
 create mode 100644 meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-whitespaces-from-monitor-name-when-accessing-.patch

-- 
1.9.3


