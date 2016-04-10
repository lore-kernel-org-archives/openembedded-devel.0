Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CD664771E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l6so16766295wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IcIFJzjXzAx4POShfcpYgN7kdKQ0cHEKOa9cMkNnw90=;
	b=Ew/sG1mWaGP1/iEkl1wcz5xGeu/c8ZEh6PvUgP+ZeJnIU2dJ9fjzz9l9VxMOXIFTgx
	d3AlQqdwT9dYTbBHY9YwS2OqMzjgSOJ+3B3QVK/wtwYxwru+CiUKaNYTuYoj+G/E1yVP
	fnQ7pbHaGhG0wNNQbn9BairiMo2RdGMCA4qi8sdFuZp6gLcJtUvKHmrr/PZt0stvsLHF
	G+TdvoFMcggNvpJishTt/JKsLuv6KDJ76ZGKrdsSySvDRvCrT7/R/nzlnBRV29+1xEnU
	xqdDoO4JKaG3EK/jhBaBXsBlIyDpRGaPwpeJc82o1Y7ebcpH020LySlMynjs+hoQyk7M
	fC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IcIFJzjXzAx4POShfcpYgN7kdKQ0cHEKOa9cMkNnw90=;
	b=BGJ26aGMy8hfp0OOUt7o5WxBwU201+vTNVFmcqdJb/6gtgK54BvAKUY7JJoJN6RiwU
	7FURSv9swAA6G13sp/Fgj25lA+s86/C8zN4MSvjvgDM/F8p57Oy1oRkGqsiaoue0x/es
	l3UdICL0b9bSW0w5B4S4Q0czrHqTxRrCPTgRSc0A3aNiYQHBiONyDKwTXTe/kww7FEUs
	VYX3bsWJbQX2hMJgUJaxEC3vmjrN8/tkSPYc3ipfQWH2dbKIys21HTLy1gFbifwcEHZb
	lxVx0PAoVPFrMAxKc+1DI2WeXnkiEI8nRWYX3TEP6BPlvJaQ2X0A+gacjZH1Z/MS+iel
	1zGA==
X-Gm-Message-State: AD7BkJKSgC+MQc9SCq1Teg0Ychxr25uoAIliYbHN37EEBllH2Ij4JnYo5qyNqiAi2tGrdw==
X-Received: by 10.28.156.135 with SMTP id f129mr13689354wme.99.1460317306805; 
	Sun, 10 Apr 2016 12:41:46 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:40:59 +0200
Message-Id: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 00/31] Update Qt5-core recipes to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2: qtquick1 was already reporting 5.6.1. I made this mistake due to 
missing version tag in git repo. It was detected by depneding recipes
(qt-gstreamer) configutring with cmake and not properly finding qtquick1.

The following changes since commit d6fe20e6083d421cc6091892e1d302c46e2d075d:

  qtwebengine: enable ARMv7VE support (2016-03-07 13:09:55 +0100)

are available in the git repository at:

  https://github.com/schnitzeltony/meta-qt5.git qt5.6

for you to fetch changes up to a40bacb5dd0989623efb1d946a2bc5c829a313e0:

  qtquickcontrols2: initial add 5.6.0 (2016-04-10 14:10:54 +0200)

----------------------------------------------------------------
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


