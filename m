Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC486B720
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:21:56 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id x13so7684051wgg.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=gle7hHbdnJ1mXpBDo/poO+1gvIJhn3paAq3JUdSgOoA=;
	b=J16wnb4i6alB8Oee/W3Kv3EhHIJj/pmNdBtbddwulOytG2C8WyCJvv4JIrp2Z84Z3y
	m+3LB2LagqJU1wyyYkn74vq+CHRz0clba7sd7qpX3+WS8IwVYR7QKTKBIhxxSb0IK2/D
	yHKZcMJYwrYa42H27lwFTVDGA4dGQV38rF7pQ4Nsn1aS3dNtE1alcMLUR4hMMSJ2Ffp/
	Nb/HoRJrhldkBCN2gLTd3I9iJns9atTwqNlv9lX9akSTYC2eguFXAGrRPHobqzakVLWL
	sAdMW/GRLorXUE4O7VUYAP6D63WcyTprfME8ZR9GB5/oMkCG1jLEh4IEb8Os8hlBeGZr
	zp2g==
X-Received: by 10.180.106.134 with SMTP id gu6mr20671951wib.61.1396365717240; 
	Tue, 01 Apr 2014 08:21:57 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id 48sm41246865eee.2.2014.04.01.08.21.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 08:21:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:21:36 +0200
Message-Id: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-xfce/meta-gnome 00/10] world-fixes
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
X-List-Received-Date: Tue, 01 Apr 2014 15:22:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mousepad seems already fixed in secret shr repo

The following changes since commit c04626475be6f0e52400552d5aed044062aac4dd:

  exo: Add intltool-native as native dependency (2014-03-29 22:51:36 +0100)

are available in the git repository at:

  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches-for-world

for you to fetch changes up to 4972401d7133f07f732a06d47bc9bce664465493:

  abiword: update to 3.0.0 to fix build (2014-04-01 17:12:30 +0200)

----------------------------------------------------------------
Andreas Müller (10):
      xfce-git.bbclass initial add
      xarchiver: fix configue
      xfwm4: fix configue by inheriting xfce-git.bbclass
      libxfce4ui: fix configue by inheriting xfce-git.bbclass
      xfce4-taskmanager: fix configue by inheriting xfce-git.bbclass
      xfce4-closebutton-plugin: fix configue by inheriting xfce-git.bbclass
      xfce4-settings: fix configue by inheriting xfce-git.bbclass
      xfce4-dev-tools: update to 4.11.0
      sound-theme-freedesktop: fix configure
      abiword: update to 3.0.0 to fix build

 meta-gnome/recipes-gnome/abiword/abiword/abiword-cxx-for-ld-fix.patch                           |  12 ---------
 meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.glib-2.32.patch                            |  21 ----------------
 meta-gnome/recipes-gnome/abiword/abiword/cdump.pl                                               |  32 ------------------------
 meta-gnome/recipes-gnome/abiword/abiword/debian_patches_boost54.patch                           |  32 ++++++++++++++++++++++++
 meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch                           | 104 ----------------------------------------------------------------------------
 meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch                                         | 102 --------------------------------------------------------------------------
 meta-gnome/recipes-gnome/abiword/abiword/nodolt.patch                                           |  12 ---------
 meta-gnome/recipes-gnome/abiword/{abiword_2.8.6.bb => abiword_3.0.0.bb}                         |  39 +++++++++++------------------
 meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb                          |   2 ++
 meta-xfce/classes/xfce-git.bbclass                                                              |   5 ++++
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb                                               |   8 ++----
 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb                               |   6 +----
 meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb                     |   6 +----
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb                                          |   8 +-----
 meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.10.0.bb => xfce4-dev-tools_4.11.0.bb} |   4 +--
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                     |   6 +----
 meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb                                                       |   6 +----
 17 files changed, 63 insertions(+), 342 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/abiword-cxx-for-ld-fix.patch
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.glib-2.32.patch
 delete mode 100755 meta-gnome/recipes-gnome/abiword/abiword/cdump.pl
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/debian_patches_boost54.patch
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/nodolt.patch
 rename meta-gnome/recipes-gnome/abiword/{abiword_2.8.6.bb => abiword_3.0.0.bb} (83%)
 create mode 100644 meta-xfce/classes/xfce-git.bbclass
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.10.0.bb => xfce4-dev-tools_4.11.0.bb} (78%)

-- 
1.8.3.1


