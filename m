Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id D661B7422C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:34:11 +0000 (UTC)
Received: by wicpl12 with SMTP id pl12so4078780wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 03:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=LY5uZeH9KUyAVTL7oA86APpPNAnyrFd0kzqhwjNpkDU=;
	b=nBijkyYpfQf802BxwUeMYr3xe8p6+r/cM6pjxzkHm70pHMWTB4kR4rl9xUfzlBNYrv
	yDsNTzKb4mqcsBnFhaM2kLYhYmkU9WGxJNYHgpvHcPDSDOThy+HQ6Jh3+iLexHiY8uPH
	Es9uK2Mnx6N0Khb8/Okz3vRdi3eHP0ZczsIbd8ygeYAiWxP9OOmZ65mqd2r/4RDq2pxP
	pngAQ2c0YZyYki3JIYS8Tkr6MxvAkzIuBJljjFKklEhKHwhO8MJHrtG9XcY6YayxrBid
	IVzWKszpwK1D1AvElj9ZC9K9rEkU0P5KO1M8I3H5yxZAdOOv4sfWweOuCVRy1jNcz3rO
	C0rg==
X-Received: by 10.194.120.198 with SMTP id le6mr20968969wjb.133.1440930851153; 
	Sun, 30 Aug 2015 03:34:11 -0700 (PDT)
Received: from localhost.localdomain (p54AA5C5E.dip0.t-ipconnect.de.
	[84.170.92.94]) by smtp.googlemail.com with ESMTPSA id
	h9sm16778522wjx.20.2015.08.30.03.34.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Aug 2015 03:34:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Aug 2015 12:33:54 +0200
Message-Id: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCHv2 0/6] updates and fixes again
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
X-List-Received-Date: Sun, 30 Aug 2015 10:34:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Note: xfce4-icon-theme patch is OK I've checked meanwhile

V2: appended gnome-bluetooth libnotify fix

The following changes since commit 985fca448f2593f5e5aeba07656eb8f2dad60183:

  dhcp: fix parsing warning (2015-08-24 14:06:58 +0200)

are available in the git repository at:

  git://github.com/schnitzeltony/meta-openembedded.git patches1

for you to fetch changes up to 8402dae17d7b30c74fccc666acd13a2b3598292c:

  gnome-disk-utility: fix build for libnotify 0.7.x (2015-08-27 16:44:42 +0200)

----------------------------------------------------------------

Andreas Müller (5):
  fontforge: update to 20150824
  rodent-icon-theme: add RPROVIDES/RREPLACE/RCONFLICTS for
    xfce4-icon-theme
  xfce4-notifyd: fix build for libnotify 0.7.x
  gnome-disk-utility: fix build for libnotify 0.7.x
  gnome-bluetooth: fix build with libnotofy >= 0.7.0

Martin Jansa (1):
  xfce4-icon-theme: remove

 .../0003-Fix-build-with-libnotify-0.7.0.patch      |  47 +++++++
 .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |   1 +
 .../0002-Require-libnotify-0.6.1.patch             |  49 +++++++
 .../gnome-disk-utility_2.32.0.bb                   |   1 +
 ...fontforge_20141126.bb => fontforge_20150824.bb} |  11 +-
 ...ore-libnotify-version-7.0.0-compatibility.patch | 152 ---------------------
 .../xfce4-notifyd/xfce4-notifyd_0.2.4.bb           |   1 -
 .../rodent-icon-theme/rodent-icon-theme_5.0.bb     |   5 +
 .../xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb     |  14 --
 9 files changed, 109 insertions(+), 172 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0003-Fix-build-with-libnotify-0.7.0.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-Require-libnotify-0.6.1.patch
 rename meta-oe/recipes-graphics/fontforge/{fontforge_20141126.bb => fontforge_20150824.bb} (77%)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Restore-libnotify-version-7.0.0-compatibility.patch
 delete mode 100644 meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb

-- 
2.1.0


