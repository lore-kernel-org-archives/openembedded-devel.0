Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4858B6F8A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:22:04 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id p61so6337547wes.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=BuXyOFMPAMgJoQbHpXDDRbPwHp9PBrtL7/tTN8dTtu0=;
	b=dXApyOjdDvsBykTqH3JeHwmpU+e2cQ3JzWsIn5EV3irPf0gM1mE0bWFOF50BiaaAeo
	RJEtJZGyeLwJCvNsScA5ZX+u5SNSacTyLVTjqD4IWYZcjrPNBdGxBsoZgNfEzROZSBRK
	e1xYx6Cq68jCVJ63n4pFLDL065lNk+66PmYZNzc7jYhnIM68j5BsLm4QO/TIR27HBx2h
	Zk+Z66gqZVIN6HW2eZ74ybwkvUJ4IjgmcYKSitoDXSB+Oh1KSYsldmj/oOcMmkviz+/f
	+vTFl1Nk6dGAbTh54hNmdjVMqfetz+X7wVL7QKP9KlXNCsYqbtSgtxBfbbdQXA3i0mgH
	lwow==
X-Received: by 10.194.48.80 with SMTP id j16mr21689726wjn.44.1396365725651;
	Tue, 01 Apr 2014 08:22:05 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id 48sm41246865eee.2.2014.04.01.08.22.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 08:22:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:21:43 +0200
Message-Id: <1396365706-14220-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce/meta-gnome 07/10] xfce4-settings: fix configue by inheriting xfce-git.bbclass
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
X-List-Received-Date: Tue, 01 Apr 2014 15:22:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index f7fc244..b34bb7a 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo exo-native garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier"
 
-inherit xfce
+inherit xfce xfce-git
 
 SRC_URI = " git://gitorious.org/xfce/xfce4-settings.git;protocol=git;branch=for-oe \
             file://0001-xsettings.xml-remove-trouble-causing-comment.patch \
@@ -31,10 +31,6 @@ PACKAGECONFIG[datetime-setter] = "--enable-datetime-settings, --disable-datetime
 PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
 PACKAGECONFIG[sound-setter] = "--enable-sound-settings, --disable-sound-settings, libcanberra, libcanberra-gtk2 sound-theme-freedesktop"
 
-do_configure_prepend() {
-    NOCONFIGURE=yes ./autogen.sh
-}
-
 FILES_${PN} += " \
     ${libdir}/xfce4 \
     ${datadir}/xfce4 \
-- 
1.8.3.1


