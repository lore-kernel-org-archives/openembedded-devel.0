Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5C21F60620
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:55:49 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id b71so699086lfg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RMCySciVjkIKjI2n32369j/bnwkJGHutnfQjPC4/DHM=;
	b=J2u59RyspuIba5Jj/RFsNle2IQVTRTzMDFzSSA0Dhe+VlvRiaiiE9hGxvRh/IAC9Tc
	QhktlozWjTTdcTmRAdrg0YkNLmXXi+x9Nbrq+18j8aDjwx0fDjwdSkNOu5n1Gq8KMQpd
	NPlbMWK/+wwHEDk4Q+5C3zrCFqz1TVYkH45dLsldrlVLDsiWtMjm4k52YLO3QhB8qEpm
	N0GNr1nBjEGhQ8d/Xf0HRZ8ZtArlX68nb6hJsw9TicqBVGCZVx/R8qeNUufUlKfXZv8N
	/HFwVIvHqiRB/goDZ7t0d3sCuUVhjcm2CzzXm90UFn+NxFU+Nn6PGarwBlviTrP3kK4l
	qlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RMCySciVjkIKjI2n32369j/bnwkJGHutnfQjPC4/DHM=;
	b=BSk8bgUUm3ExvLhtxfcEIofSfyHl/2O/GcD/UnnL1+DVtOT+dyrkuCdZ5G+09sdJlW
	vUurupPSj7Z6QxdenWJXIKyFCcX628afYip4e3kw/QTGAaWtK3yALn8ytZKXMn5Cd9Gs
	Xzli++qdJoVaRSYjKa7tGYPiTf/yyMQsuFlIhh6lxHUubzB18p6gis4nmUeg73nw+eZi
	Is17r+MLKl8W6+lG+5GPbMKbpTzhJF2CZD8ZmMFlkRd0VNQOIcl8A5jwm1E32rvgkj4S
	nJih9eIi9ANkW3iem/nTbY+6l8S98DwktPDMUNllZlTQdaDVtTefcBrxwTmIMOC9QnY3
	JDbQ==
X-Gm-Message-State: AE9vXwNDQYmfBo2x4/sDpSlU+HIIL1NrqY2yT3ww+YbiZQm/CwA40EUQkYfK3uyFX82rRQ==
X-Received: by 10.194.120.37 with SMTP id kz5mr20388801wjb.196.1474955750014; 
	Mon, 26 Sep 2016 22:55:50 -0700 (PDT)
Received: from localhost.localdomain (p4FDF068E.dip0.t-ipconnect.de.
	[79.223.6.142]) by smtp.googlemail.com with ESMTPSA id
	f15sm1156668wmf.8.2016.09.26.22.55.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 22:55:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 07:55:24 +0200
Message-Id: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 0/9] xfce4 and other updates
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
X-List-Received-Date: Tue, 27 Sep 2016 05:55:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

More gtk3 for xfce4

Andreas Müller (9):
  xfce4-power-manager: update to 1.6.0
  exo: update to 0.11.1
  xfce4-whiskermenu-plugin: update to 2.0.1
  xfce4-weather-plugin: update to 0.8.8
  xfce4-calculator-plugin: update to 0.6.0
  xfce4-notifyd: update to 0.3.2
  xfce4-clipman-plugin: update to 1.4.0
  poppler: update to 0.47.0
  physfs: move to sources found at github/supertux

 .../physfs/files/0001-fix-build-with-gcc-6.patch   | 52 ++++++++++++++++++++++
 .../physfs/{physfs_2.0.3.bb => physfs_git.bb}      | 10 +++--
 ...dd-manadatory-options-to-find-qt4-qt5-moc.patch | 14 +++---
 .../{poppler_0.43.0.bb => poppler_0.47.0.bb}       |  4 +-
 ...ce4-notifyd_0.2.4.bb => xfce4-notifyd_0.3.2.bb} |  5 ++-
 .../calculator/xfce4-calculator-plugin_0.5.1.bb    |  9 ----
 .../calculator/xfce4-calculator-plugin_0.6.0.bb    |  9 ++++
 ...ugin_1.2.6.bb => xfce4-clipman-plugin_1.4.0.bb} |  5 +--
 ...ugin_0.8.7.bb => xfce4-weather-plugin_0.8.8.bb} |  4 +-
 ..._1.5.3.bb => xfce4-whiskermenu-plugin_2.0.1.bb} |  4 +-
 .../exo/exo/reduce-build-to-exo-csource-only.patch | 28 ++++++++----
 .../exo/{exo_0.10.6.bb => exo_0.11.1.bb}           |  4 +-
 ...nager_1.4.4.bb => xfce4-power-manager_1.6.0.bb} |  8 ++--
 13 files changed, 112 insertions(+), 44 deletions(-)
 create mode 100644 meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch
 rename meta-filesystems/recipes-support/physfs/{physfs_2.0.3.bb => physfs_git.bb} (55%)
 rename meta-oe/recipes-support/poppler/{poppler_0.43.0.bb => poppler_0.47.0.bb} (93%)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.2.4.bb => xfce4-notifyd_0.3.2.bb} (73%)
 delete mode 100644 meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.5.1.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.6.0.bb
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.2.6.bb => xfce4-clipman-plugin_1.4.0.bb} (68%)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.7.bb => xfce4-weather-plugin_0.8.8.bb} (72%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_1.5.3.bb => xfce4-whiskermenu-plugin_2.0.1.bb} (63%)
 rename meta-xfce/recipes-xfce/exo/{exo_0.10.6.bb => exo_0.11.1.bb} (87%)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.4.4.bb => xfce4-power-manager_1.6.0.bb} (78%)

-- 
2.5.5


