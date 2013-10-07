Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id CF09460FCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 23:04:20 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so3555820eaj.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 16:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=W5wgeS62yujPXlxg6VJPEj5QU0vcDCWRAiRj9SHz4g8=;
	b=KnHI92tWYmn67LZ0PUDvt3LTmmzsEprQEBg4fZIetoUKdCEp1JEP7rNCaJlOTw/eX5
	qkryhEKTUqI9qJWR6Pyf129d2THLQMHpb782C2crbRiJ0ud/MJwgQSk0pgtujuDVlkzZ
	Ft5T9guvVMJy0vwUwa16ni2JqH76dqD21aOXmWPn6jWSv6+Cvc/R4hhWlIPoJ05GOEF3
	O4JhUg/cLvJTtfB6+kMD7Y2Ke7L2KiaAiOd0U/KxWb5/cQImabmbBHx14IMizgYpqkDK
	hbi3n0hSRH/qjUykg6/nsESH+tbNC96kdnxzJ24kEom9RugWK/u0ejOU8T4mpJK4ctO0
	4daw==
X-Received: by 10.15.53.132 with SMTP id r4mr5295605eew.5.1381187061681;
	Mon, 07 Oct 2013 16:04:21 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2967.dip0.t-ipconnect.de.
	[91.10.41.103])
	by mx.google.com with ESMTPSA id m54sm68507239eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 16:04:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 01:03:50 +0200
Message-Id: <1381187036-3005-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 0/6] minor (world) fixes
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
X-List-Received-Date: Mon, 07 Oct 2013 23:04:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 2a463dddcf76d7fa437e96f6cf0210143e97a904:

  thunar-volman: Add PACKAGECONFIG for notify (2013-10-05 14:24:05 +0200)

are available in the git repository at:

  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

for you to fetch changes up to 27173266bdfa868c3027ce3713bfd8bf48e02bae:

  xfce4-icon-theme: add xfce4-dev-tools-native to DEPENDS (2013-10-08 00:57:05 +0200)

----------------------------------------------------------------
Andreas Müller (6):
      qt-creator: add qt4-plugin-sqldriver-sqlite to RRECOMMENDS_${PN}
      xfce4-settings: set correct version
      xfce4-settings: add exo-native to DEPENDS
      xfce4-weather-plugin: add libsoup-2.4 to DEPENDS
      xfwm4: add exo-native to DEPENDS
      xfce4-icon-theme: add xfce4-dev-tools-native to DEPENDS

 meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb                     | 4 +++-
 meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb      | 2 +-
 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb | 2 ++
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb           | 4 ++--
 meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb                             | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

-- 
1.8.3.1


