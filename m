Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 97A1E65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:43:39 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so121942721wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=2uyegPCebIfKXTEW3P2U6rl+ess3fgJPeD/q4bS7yoQ=;
	b=yf/buSjCGUnp06y1Lm96WXmKPtwEnj5RwwXn0sv4RUV9Of4unjyD9F4apAp+Cnc6aG
	hDdFJwZ39EJZ6WcEWrkjEd6A0yRPxnhmXZIddYikABNCOEEBt0qxtyzOSHnEYzYICWec
	4lYFCLsVvTrq7DEopzVcDXQsZegPytpQUew0gjP40jU6OwqwczwN8tsFFfNDfEoMjtQQ
	ExhuzsGlcBAul4Yhbf4NLhsIuR1rwgMZ5HozDQO3X4jFensTnSuSPIA2gVcSOK5W5Wuw
	Jz4bndKZPGHoccVGYi07bpy/ERSIT8Y3UcNFJZ8zFpIGcFcmu7G+8piXJA6UBpvuwveV
	aSuQ==
X-Received: by 10.180.96.230 with SMTP id dv6mr46917303wib.23.1441727019241;
	Tue, 08 Sep 2015 08:43:39 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	lu5sm5496240wjb.9.2015.09.08.08.43.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:43:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:42:51 +0200
Message-Id: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 0/9] next series of fixes/updates
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
X-List-Received-Date: Tue, 08 Sep 2015 15:43:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit d36e2d1066f50036080f978583a58fe79ecfac54:

  libunique: add a recipe from oe-core (2015-09-08 16:30:24 +0200)

are available in the git repository at:

  git://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to a879e4b3c1b8fefef6d9614efffcb7021e868a22:

  libgtop: update to 2.30.0 (2015-09-08 17:35:03 +0200)

----------------------------------------------------------------
Andreas Müller (9):
      xfce4-equake-plugin: update to 1.3.8
      parole: initial add 0.8.0
      packagegroup-xfce-multimedia: add parole
      evolution-data-server: fix locale installation path
      openbox: update to 3.6.1
      openbox: add libcroco, librsvg and gdk-pixbuf to DEPENDS
      meta-xfce/README: mention meta-gnome in layers required
      gnome-settings-daemon: fix build for libnotify > 0.7.x
      libgtop: update to 2.30.0

 meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch | 34 ++++++++++++++++++++++++++++++
 meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb                                             |  1 +
 meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-Require-libnotify-0.6.0.patch               | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb                        |  5 ++++-
 meta-gnome/recipes-gnome/libgtop/{libgtop_2.28.2.bb => libgtop_2.30.0.bb}                             |  5 ++---
 meta-oe/recipes-graphics/openbox/{openbox_3.5.0.bb => openbox_3.6.1.bb}                               | 13 ++++++------
 meta-xfce/README                                                                                      |  2 +-
 meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb                            |  1 +
 meta-xfce/recipes-multimedia/parole/files/parole-0.8.0-appdata.patch                                  | 30 ++++++++++++++++++++++++++
 meta-xfce/recipes-multimedia/parole/parole_0.8.0.bb                                                   | 37 ++++++++++++++++++++++++++++++++
 meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.7.bb => xfce4-equake-plugin_1.3.8.bb} |  4 ++--
 11 files changed, 200 insertions(+), 13 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-Require-libnotify-0.6.0.patch
 rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.28.2.bb => libgtop_2.30.0.bb} (52%)
 rename meta-oe/recipes-graphics/openbox/{openbox_3.5.0.bb => openbox_3.6.1.bb} (84%)
 create mode 100644 meta-xfce/recipes-multimedia/parole/files/parole-0.8.0-appdata.patch
 create mode 100644 meta-xfce/recipes-multimedia/parole/parole_0.8.0.bb
 rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.7.bb => xfce4-equake-plugin_1.3.8.bb} (74%)

-- 
2.1.0


