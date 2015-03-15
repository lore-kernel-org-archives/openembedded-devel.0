Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1497391E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:26 +0000 (UTC)
Received: by wixw10 with SMTP id w10so29398542wix.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=3byIhwhVlQhhTOPeEl+Od0h5leMROeCYQi9/S3DTOas=;
	b=JII4Ldk04h/yj8kYgRkH33KyC22xWzQypKmNUZEyktlt/mUW5IpGxX/w7Jz499vyQM
	kRxt8PxhXhiph+j/+7bV6iMzf+11UPRxnIbkN7G/tC+dY1EPNMrnF2Kst1Qz7uo4Nug0
	nsE++4DwgOs+0Be+2D+AvgkjfZt32dQmsG1PpSmxnQo5Mfh5D0qrZgsIIwVaW0R3qUi4
	8Pcip47ZmhmdJ4+2MLEEzmS/gdWnm9+6ZDWq0HLsKbPoI1EaPHOfQkKCVC+Y0vIK4Pu/
	ks1We6k1ASnlCFIOMqNBlir2uMOGKBUq4fkVObmpJdYb3oGml2/h/Qk6aJEUMGIYm4In
	jGaQ==
X-Received: by 10.194.60.203 with SMTP id j11mr119733175wjr.5.1426462467257;
	Sun, 15 Mar 2015 16:34:27 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:33 +0100
Message-Id: <1426462419-10173-25-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 24/30] xfce4-settings: update to 4.12.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Source is taken from external git repo as before due to problems patching
  binary files (icons). The revision is 4.12 release + Date/Time setter which
  was not accepted upstream.
* Touchscreen/invisible mouse pointer patches do not apply anymore and it is
  not a matter of simple rebasing due to new libinput support. Patches were
  kept because reimplemementation is in progress. This - together with
  libinput support - will be sent in a follow up patch.
* git repo was moved to github

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0002-xsettings.xml-Set-default-themes.patch       |  2 +-
 .../recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 19 +++----------------
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch
index 498f8d0..44478e6 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch
@@ -24,7 +24,7 @@ index 49a4c1e..5ec94e9 100644
 -    <property name="IconThemeName" type="empty"/>
 +    <property name="ThemeName" type="string" value="Xfce"/>
 +    <property name="IconThemeName" type="string" value="gnome"/>
-     <property name="DoubleClickTime" type="int" value="250"/>
+     <property name="DoubleClickTime" type="int" value="400"/>
      <property name="DoubleClickDistance" type="int" value="5"/>
      <property name="DndDragThreshold" type="int" value="8"/>
 -- 
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index 290ec3d..5ce38b9 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -6,20 +6,13 @@ DEPENDS = "exo exo-native garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib l
 
 inherit xfce xfce-git
 
-SRC_URI = " git://gitorious.org/xfce/xfce4-settings.git;protocol=git;branch=for-oe \
+SRC_URI = " git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.0 \
             file://0001-xsettings.xml-remove-trouble-causing-comment.patch \
             file://0002-xsettings.xml-Set-default-themes.patch \
-            file://touchscreen/invisible \
-            file://touchscreen/wait \
-            file://touchscreen/0001-add-cursor-theme-xfce-invisible.patch \
-            file://touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch \
-            file://touchscreen/0003-XfcePointersHelper-gets-a-pointer-to-XfceXSettingsHe.patch \
-            file://touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch \
-            file://touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch \
 "
-SRCREV = "b7a0e1fd77f5bb5c372223ff62aec7acf252f061"
+SRCREV = "a4540c2350cecf53f7095027edd102c6a24e36af"
 S = "${WORKDIR}/git"
-PV = "4.11.0+git${SRCPV}"
+PV = "4.12.0+git${SRCPV}"
  
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
@@ -36,12 +29,6 @@ FILES_${PN} += " \
     ${datadir}/xfce4 \
 "
 
-do_install_prepend() {
-    # somehow binary files are not patched correctly by oe-patch - so copy them
-    cp ${WORKDIR}/touchscreen/invisible ${S}/cursors
-    cp ${WORKDIR}/touchscreen/wait ${S}/cursors
-}
-
 RRECOMMENDS_${PN} += "gnome-icon-theme"
 RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES','alsa','libcanberra-alsa','',d)}"
 RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES','pulseaudio','libcanberra-pulse','',d)}"
-- 
1.9.3


