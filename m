Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id EF34D73E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:53:47 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so80644679wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 07:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=cDU2OGxF0EWBy1NS1tgrWgNPE/Hm53g0njj0EM6lItE=;
	b=b0gdDEJo8spq5NgMj+v3NvonjyyueupxPHyBXoThQLUGz0P2bEfkON1mjXWFsx6OhP
	rzDPbWC+R2RW9As1N7SBiJMlSoIwEMr8LqT5+ovUivSkDNHNeBP+gJ6yECx/4zhK/37+
	F4Vjv0J2LrcAA6Xct5sj248szkRsHgXLJizavyV4DvgDS4cUGamUzisEgBkJdIEI9stS
	2kzyMXAGEn3p7BS/df41l2GURFXNh7siAliOpp44izXzC+W5QZo0GO6rfb8/QIbHPzVz
	ulUnhvlXxK65NszDeKwNh6Y3+m7ExqooSSc4Rq1iR3EjAOECY2/BmT27NwyKgif4EXi9
	jmWQ==
X-Received: by 10.180.75.48 with SMTP id z16mr19975811wiv.2.1440687227339;
	Thu, 27 Aug 2015 07:53:47 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	p5sm12973681wiy.17.2015.08.27.07.53.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 07:53:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:53:12 +0200
Message-Id: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 0/5] updates and fixes again
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
X-List-Received-Date: Thu, 27 Aug 2015 14:53:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Note: xfce4-icon-theme patch is OK I've checked meanwhile

The following changes since commit 985fca448f2593f5e5aeba07656eb8f2dad60183:

  dhcp: fix parsing warning (2015-08-24 14:06:58 +0200)

are available in the git repository at:

  git://github.com/schnitzeltony/meta-openembedded.git patches1

for you to fetch changes up to 8402dae17d7b30c74fccc666acd13a2b3598292c:

  gnome-disk-utility: fix build for libnotify 0.7.x (2015-08-27 16:44:42 +0200)

----------------------------------------------------------------
Andreas Müller (4):
      fontforge: update to 20150824
      rodent-icon-theme: add RPROVIDES/RREPLACE/RCONFLICTS for xfce4-icon-theme
      xfce4-notifyd: fix build for libnotify 0.7.x
      gnome-disk-utility: fix build for libnotify 0.7.x

Martin Jansa (1):
      xfce4-icon-theme: remove

 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-Require-libnotify-0.6.1.patch   |  49 +++++++++++++++++++++++
 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb                            |   1 +
 meta-oe/recipes-graphics/fontforge/{fontforge_20141126.bb => fontforge_20150824.bb}                 |  11 +++---
 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Restore-libnotify-version-7.0.0-compatibility.patch | 152 ------------------------------------------------------------------------
 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb                                         |   1 -
 meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb                                    |   5 +++
 meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb                                    |  14 -------
 7 files changed, 61 insertions(+), 172 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-Require-libnotify-0.6.1.patch
 rename meta-oe/recipes-graphics/fontforge/{fontforge_20141126.bb => fontforge_20150824.bb} (77%)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Restore-libnotify-version-7.0.0-compatibility.patch
 delete mode 100644 meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb

-- 
2.1.0


