Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 037F665C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:22 +0000 (UTC)
Received: by wicmc15 with SMTP id mc15so48671928wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Ajm0zKFbFzgYc5Hne7B+8+cNi8wXCzdUDssITpVeRNw=;
	b=HJOEVjC0h64i+zQa+dUxO1rdkNkNFd65lIFaE7Li7EnUmhpjbwv5lxzJa1Yr/5LV9j
	Is80/KqMqmy7EQ/fs5Gie+VU0i4OM5OX+iG7bVaFPyVWKKNxrXedb/7iwMo/WA5kV7QX
	fMsiW52sNPZbwI2YIGujrAgf70jYtyZ+li0OV5fMN8KuMDB7k013tLioAx48a6ygBo+h
	tq1b3dkoQjOjMgVSigww8dOps1AnbT4OH1/la1C1hTpR6LC2paNPhG0ollPIrS15p5Q8
	SwvNEToV5o35obEVyWGc3XWLz/cEbzpxKP0bS4tXTf5+z6GTKYb7bbMO+hnLkD6Is0zj
	sKhA==
X-Received: by 10.180.206.229 with SMTP id lr5mr34935519wic.86.1432588463167; 
	Mon, 25 May 2015 14:14:23 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:13:57 +0200
Message-Id: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 00/12] xfce4 updates ++
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
X-List-Received-Date: Mon, 25 May 2015 21:14:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 175406cdca39bf5b218bb4127a3e9c9bd11b653f:

  recipes-multimedia: add gstreamer-0.10 recipes (2015-05-22 20:14:07 +0200)

are available in the git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to 3722a2accf58637c0e175525f8778ce2718802fa:

  imagemagick: update to 6.9.1.3 / add packageconfig for openjpeg (2015-05-25 23:06:31 +0200)

----------------------------------------------------------------
Andreas Müller (12):
      fontforge: add 20141126
      openjpeg: initial add 2.1.0
      poppler: update 0.33.0 to and enhance packageconfigs
      poppler-data: update to 0.4.7
      thunar: update to 1.6.10
      xfdesktop: update to 4.12.2
      xfwm4: update to 4.12.3
      orage: update to 4.12.1
      xfce4-notes-plugin: update to 1.8.0
      xfce4-equake-plugin: update to 1.3.7
      exo: update to 0.10.6
      imagemagick: update to 6.9.1.3 / add packageconfig for openjpeg

 meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb                                                          |  41 +++++++++++++++++++
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb                                                               |  18 +++++++++
 meta-oe/recipes-support/imagemagick/{imagemagick_6.8.9.bb => imagemagick_6.9.1.bb}                                |  11 ++---
 meta-oe/recipes-support/poppler/{poppler-data_0.4.6.bb => poppler-data_0.4.7.bb}                                  |   4 +-
 meta-oe/recipes-support/poppler/{poppler_0.26.5.bb => poppler_0.33.0.bb}                                          |   9 +++--
 meta-xfce/recipes-apps/orage/{orage_4.10.0.bb => orage_4.12.1.bb}                                                 |   8 ++--
 meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.6.bb => xfce4-equake-plugin_1.3.7.bb}             |   4 +-
 meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch                               | 128 ----------------------------------------------------------
 ...tus-icon.c-remove-deprecated-g_type_init.patch => 0001-main-status-icon.c-remove-deprecated-g_type_init.patch} |   0
 meta-xfce/recipes-panel-plugins/notes/{xfce4-notes-plugin_1.7.7.bb => xfce4-notes-plugin_1.8.0.bb}                |   7 ++--
 meta-xfce/recipes-xfce/exo/{exo_0.10.4.bb => exo_0.10.6.bb}                                                       |   4 +-
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.8.bb => thunar_1.6.10.bb}                                               |   6 +--
 meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.0.bb => xfdesktop_4.12.2.bb}                                     |   4 +-
 meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.2.bb => xfwm4_4.12.3.bb}                                                 |   4 +-
 14 files changed, 91 insertions(+), 157 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
 rename meta-oe/recipes-support/imagemagick/{imagemagick_6.8.9.bb => imagemagick_6.9.1.bb} (83%)
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.6.bb => poppler-data_0.4.7.bb} (78%)
 rename meta-oe/recipes-support/poppler/{poppler_0.26.5.bb => poppler_0.33.0.bb} (69%)
 rename meta-xfce/recipes-apps/orage/{orage_4.10.0.bb => orage_4.12.1.bb} (53%)
 rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.6.bb => xfce4-equake-plugin_1.3.7.bb} (74%)
 delete mode 100644 meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch
 rename meta-xfce/recipes-panel-plugins/notes/files/{0002-main-status-icon.c-remove-deprecated-g_type_init.patch => 0001-main-status-icon.c-remove-deprecated-g_type_init.patch} (100%)
 rename meta-xfce/recipes-panel-plugins/notes/{xfce4-notes-plugin_1.7.7.bb => xfce4-notes-plugin_1.8.0.bb} (63%)
 rename meta-xfce/recipes-xfce/exo/{exo_0.10.4.bb => exo_0.10.6.bb} (87%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.8.bb => thunar_1.6.10.bb} (85%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.0.bb => xfdesktop_4.12.2.bb} (73%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.2.bb => xfwm4_4.12.3.bb} (87%)

-- 
1.9.3


