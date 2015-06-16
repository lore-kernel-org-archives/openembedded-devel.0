Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id E9DC365C78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 17:51:55 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so19258719pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 10:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=z/9ZASnQPVG0dGr0pmsREPkmkWVnssQC1PF0obReLrQ=;
	b=O6iqePicR0WUqt7SYzf5I6zdh9Ajz/iQJITWTo5/1ON9/AOk2gkKsGfF373JDUzZHw
	s7TxnR/bPV89nxkZlbj6jZP9HmyxIiUnLQ50QdzaW724OLqRTArbs1+SZb/0jFO5LGqL
	hoHYeqgczyC5nkbpXYT2EEu+N3PoSXY8W1ZXN8aigCbdD8XMslTXSPVs4idhnrfKsLA7
	f3uQkzu6nlHuu/dMbXmldmEEBe6CKet/VJkTgJT1gHOkjjragaBwyKjyXwgmWkiqEfZ+
	euMrpwoWb1A26YLk7oxdv/wXenoaiUCkKvRO/CIm5isieqVx859bIabtUkITBageW90n
	0qWg==
X-Received: by 10.68.224.35 with SMTP id qz3mr2607013pbc.165.1434477116692;
	Tue, 16 Jun 2015 10:51:56 -0700 (PDT)
Received: from localhost.localdomain (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180])
	by mx.google.com with ESMTPSA id kk6sm2042161pdb.94.2015.06.16.10.51.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Jun 2015 10:51:56 -0700 (PDT)
From: Adam YH Lee <adam.yh.lee@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Jun 2015 10:51:46 -0700
Message-Id: <1434477106-25870-1-git-send-email-adam.yh.lee@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [[meta-oe][PATCH]] nm-applet: Install glib schema
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
X-List-Received-Date: Tue, 16 Jun 2015 17:51:58 -0000

Unless we inherit gsettings class, glib schema does not get installed and
users cannot launch nm-applet:

	GLib-GIO-ERROR **: Settings schema 'org.gnome.nm-applet' is not
installed

Signed-off-by: Adam YH Lee <adam.yh.lee@gmail.com>
---
 .../network-manager-applet/network-manager-applet_0.9.8.10.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
index 00cea74..72c9ae6 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = "libnotify libsecret networkmanager dbus-glib gconf gnome-keyring libgnome-keyring iso-codes"
 
-inherit gnomebase gtk-icon-cache
+inherit gnomebase gsettings gtk-icon-cache
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
2.1.4


