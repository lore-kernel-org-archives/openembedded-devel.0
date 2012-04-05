Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SFnZy-0004vF-2c
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 16:22:26 +0200
Received: by wibhj13 with SMTP id hj13so1242080wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2012 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WX92k4JVwy61s03dJ26xbwrDfRRVSlEpTP5X7Qz+N4w=;
	b=BbjLPZdEGC6AjQnwjIbAAUvFRHgELvZSx97/mtgyBCd8tst9IBaQ9G0yyF6IBimoNa
	FTwBKlxnXqdRTR166ORpJGkazeWZgeVDRw8WT+lJooeggMlSzMQbdGHYZL6y22WzYuJU
	/4FIeTKqE7xZjNL/XMa9qFsInb6RN/cMY9MYmaLkXYVAb2rkzwRv7FX0XarXlhNhTGK8
	6w+MTS2ZP9+anWgBHNNtsuLS2l0fCzGC4w06T6QEr2Fpo6+Utaave8gXY0ASCeaNgaVJ
	gJNwgG8RvwWg//jQgi0JW5CfpTLx6WksJYkR1Q+B0SOgyepnIBfFiQ2B4AUxaa/TY6Z4
	awBQ==
Received: by 10.216.132.8 with SMTP id n8mr1762249wei.36.1333635194384;
	Thu, 05 Apr 2012 07:13:14 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id w10sm17558651wiy.3.2012.04.05.07.13.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 07:13:14 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Apr 2012 16:12:52 +0200
Message-Id: <1333635172-6410-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH][meta-oe] network-manager-applet: Fix missing DEPENDS and QA warnings.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Apr 2012 14:22:26 -0000

This fixes:
| checking for ISO_CODES... no
| No package 'iso-codes' found.

and

| checking for GNOME_KEYRING... no
| configure: error: Package requirements (gnome-keyring-1) were not met:

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../network-manager-applet_0.9.2.0.bb              |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/networkmanager/network-manager-applet_0.9.2.0.bb b/meta-gnome/recipes-connectivity/networkmanager/network-manager-applet_0.9.2.0.bb
index aee599f..7939c1e 100644
--- a/meta-gnome/recipes-connectivity/networkmanager/network-manager-applet_0.9.2.0.bb
+++ b/meta-gnome/recipes-connectivity/networkmanager/network-manager-applet_0.9.2.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "gnome-bluetooth polkit-gnome libnotify networkmanager dbus-glib libglade gconf gnome-keyring"
+DEPENDS = "gnome-bluetooth polkit-gnome libnotify networkmanager dbus-glib libglade gconf gnome-keyring libgnome-keyring iso-codes"
 
 inherit gnome
 
@@ -32,5 +32,7 @@ FILES_${PN} += "${datadir}/nm-applet/ \
         "
 
 FILES_${PN} += "${libdir}/gnome-bluetooth/plugins/*.so"
+FILES_${PN}-dev += "${libdir}/gnome-bluetooth/plugins/libnma.la"
+FILES_${PN}-staticdev += "${libdir}/gnome-bluetooth/plugins/libnma.a"
 FILES_${PN}-dbg += "${libdir}/gnome-bluetooth/plugins/.debug/"
 
-- 
1.7.5.4



