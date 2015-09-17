Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id ED19D76DF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:58 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so2881282wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=d05j3wTShLOYeCvDVV0sEBp0xRbZWvVJpKBFDpholcw=;
	b=q/fAz71bS8umHF8hHBXnJCHhNoR1mnC4W8TpkdlGjo5KpSaMuBPGYKCYGa7lyD/nAr
	+u4rYp4zORRD0HW6XG1qao1CuSn/1MJmU5f2Ox5VO9UBYI4PBvSudemq7SP61yR9Kqos
	wB/PmrA0CzymnU969+ZaLiXw0uTECwCHEw9aGkRIcvXXDy385DCXaoKIv3wI3LYOc4JL
	XVHas3Mnl+v1G8zmmJV2Db3SBxlF+94lRYCcVDjBE4fJNC/IeBLHZzphEMW2uhFdAp6Q
	piy4oY5Wv/lCGwHongoQjI0bpCeq83VlwvqEH4u0n7wtYUi3msOtO87JMLEtLiduy9nc
	2ieA==
X-Received: by 10.180.101.198 with SMTP id fi6mr1976127wib.25.1442450519098;
	Wed, 16 Sep 2015 17:41:59 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:30 +0200
Message-Id: <1442450491-14912-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 18/19] xfce4-settings: get 0001-xsettings.xml-Set-default-themes.patch back
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch was accidently included in the git source branch. It is neither new
functionality nor bugfix. It is a configuration and should remain in meta-xfce.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-xsettings.xml-Set-default-themes.patch    | 33 ++++++++++++++++++++++
 .../xfce4-settings/xfce4-settings_git.bb           |  7 +++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch
new file mode 100644
index 0000000..8498d42
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch
@@ -0,0 +1,33 @@
+From 2218ba8a21e9f5715b652c6416c2ddb552686b14 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 20 May 2012 15:22:09 +0200
+Subject: [PATCH] xsettings.xml: Set default themes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstram status:  Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ xfsettingsd/xsettings.xml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xfsettingsd/xsettings.xml b/xfsettingsd/xsettings.xml
+index 65ba1ee..9efb3cd 100644
+--- a/xfsettingsd/xsettings.xml
++++ b/xfsettingsd/xsettings.xml
+@@ -1,8 +1,8 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+ <channel name="xsettings" version="1.0">
+   <property name="Net" type="empty">
+-    <property name="ThemeName" type="empty"/>
+-    <property name="IconThemeName" type="empty"/>
++    <property name="ThemeName" type="string" value="Xfce"/>
++    <property name="IconThemeName" type="string" value="gnome"/>
+     <property name="DoubleClickTime" type="int" value="400"/>
+     <property name="DoubleClickDistance" type="int" value="5"/>
+     <property name="DndDragThreshold" type="int" value="8"/>
+-- 
+2.1.0
+
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index 811866c..c8224a1 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -10,8 +10,11 @@ inherit xfce xfce-git
 # + datetime-setter - sent to mainline but strange response
 # + minor bugfixes - sent mainline but no response
 # + option to hide mousepointer for a specific (touch) input device - sent mainline but no response
-SRC_URI = "git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.0"
-SRCREV = "30bc3db17e0c634e41d2f099de6f39bb894906cd"
+SRC_URI = " \
+    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.0-1 \
+    file://0001-xsettings.xml-Set-default-themes.patch \
+"
+SRCREV = "c6683cb2cff489c16c2c7b5eab4017bb461f07f1"
 S = "${WORKDIR}/git"
 PV = "4.12.0+git${SRCPV}"
  
-- 
2.1.0


