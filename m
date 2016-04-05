Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF2A605BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:38:57 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i204so1220530wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nIe8vWs/AYPn2Mi2kEXQOUZB+gpYRdUirFzSmM5EDpU=;
	b=hBGR7jFVPcIlnaIXNJICWYDiVyMX3OA1yqdVwIjqfHDOzGcM3hfyVJI3J5zxj7/gV+
	RSUc4NUhiMlgzpkuHB17ITBUUSbCTSlA4mdLGadR0Nl6SSeP4l+Cx9vY9VSLmuYEgTlk
	nvEYxKGzlAU+ya3s41QlKnsMIoMM8xI87DjjwTSgEM+1bAMR/5BN96aNYo7qrdwRxZc8
	zxtB8RMuBOGaAsVZ48CPCxFc9Aq+LOOEQrdRJjNRO7BH/KoX/i7Lkmx7kNg3mKwjxaXG
	MKL6Jxo5kG/vQlg0kOD2tpiytMpr2760ZkKwmJvzEgFrDEXCmVpygx6ei/DPvjhDk6i0
	eakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nIe8vWs/AYPn2Mi2kEXQOUZB+gpYRdUirFzSmM5EDpU=;
	b=mHNYfgC5W9NVXMowGK+z7H/D9CalB9rjegD1B2vzZd0jwi5KYXFlxH1PPXM47yRrOd
	5BSuTaBF50IxkV31MStFVlPdTv3pK2nkgJZ6ZQ15l5tfRaHRTwMHdyLO/5Ze0zLu5Rn2
	euYd4CJJl/kCA6/BYhHpJJsrGMafsDWx6o5XLXjyrTQWJ6jdjs4vcGtIy+jFHxuhVDGW
	eIOXVtP2IthPLUE3Eaq0gI1hOWz/98uue7BkkVJIQOVuGlMrxP8+LYt/xJpo/JkFFPO0
	eq52ZoN9g1GmXWrr8cWKBEmaJs5Hl2PmaVh0QjYrj8ePiFFxXuIciIZmnk26sl67czZ0
	1Qpg==
X-Gm-Message-State: AD7BkJJkTOro8RL3RO0A3ZrGiSzmBouRi/eiX5eEz8BlPNYpI4PEb5qw1tEgdcGbMqDmUQ==
X-Received: by 10.28.11.69 with SMTP id 66mr15744629wml.103.1459834737664;
	Mon, 04 Apr 2016 22:38:57 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.38.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:38:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:09 +0200
Message-Id: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 00/31] Update Qt5-core recipes to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:38:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build tested with full kde/lxqt
* lxqt run tested on RaspberryPi2 / vc4 (mesa)

Andreas Müller (31):
  qtbase-native: update sources to 5.6.0
  qtwayland-native: update sources to 5.6.0
  qtbase: update sources to 5.6.0
  qtdeclarative: update sources to 5.6.0
  qttools: update sources to 5.6.0
  qtquickcontrols: update sources to 5.6.0
  qtsystems: update sources to 5.6.0
  qtscript: update sources to 5.6.0
  qtxmlpatterns: update sources to 5.6.0
  qtlocation: update sources to 5.6.0
  qtenginio: update sources to 5.6.0
  qtsensors: update sources to 5.6.0
  qtserialport: update sources to 5.6.0
  qtsvg: update sources to 5.6.0
  qtwebengine: update sources to 5.6.0
  qtwebkit: update sources to 5.6.0
  qtwebkit-examples: update sources to 5.6.0
  qtconnectivity: update sources to 5.6.0
  qtx11extras: update sources to 5.6.0
  qtwayland: update sources to 5.6.0
  qtgraphicaleffects: update sources to 5.6.0
  qtimageformats: update sources to 5.6.0
  qtwebsockets: update sources to 5.6.0
  qttranslations: update sources to 5.6.0
  qtmultimedia: update sources to 5.6.0
  qtwebchannel: update sources to 5.6.0
  qt3d: update sources to 5.6.0
  qtcanvas3d: update sources to 5.6.0
  qtquick1: update sources to 5.6.0
  qt5-git.inc: set packages version to 5.6.0
  qtquickcontrols2: initial add 5.6.0

 recipes-qt/qt5/qt3d_git.bb               |  2 +-
 recipes-qt/qt5/qt5-git.inc               |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb      |  2 +-
 recipes-qt/qt5/qtbase_git.bb             |  2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb         |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb     |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb      |  2 +-
 recipes-qt/qt5/qtenginio_git.bb          |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb     |  2 +-
 recipes-qt/qt5/qtlocation_git.bb         |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb       |  2 +-
 recipes-qt/qt5/qtquick1_git.bb           |  4 ++--
 recipes-qt/qt5/qtquickcontrols2_git.bb   | 15 +++++++++++++++
 recipes-qt/qt5/qtquickcontrols_git.bb    |  2 +-
 recipes-qt/qt5/qtscript_git.bb           |  2 +-
 recipes-qt/qt5/qtsensors_git.bb          |  2 +-
 recipes-qt/qt5/qtserialport_git.bb       |  2 +-
 recipes-qt/qt5/qtsvg_git.bb              |  2 +-
 recipes-qt/qt5/qtsystems_git.bb          |  2 +-
 recipes-qt/qt5/qttools_git.bb            |  2 +-
 recipes-qt/qt5/qttranslations_git.bb     |  2 +-
 recipes-qt/qt5/qtwayland-native_git.bb   |  2 +-
 recipes-qt/qt5/qtwayland_git.bb          |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb       |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb        |  4 ++--
 recipes-qt/qt5/qtwebkit-examples_git.bb  |  2 +-
 recipes-qt/qt5/qtwebkit_git.bb           |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb       |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb        |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb      |  2 +-
 31 files changed, 47 insertions(+), 32 deletions(-)
 create mode 100644 recipes-qt/qt5/qtquickcontrols2_git.bb

-- 
2.5.5


