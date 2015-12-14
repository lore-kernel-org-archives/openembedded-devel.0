Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id BC2326FF84
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:32:01 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id p66so57370384wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 10:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PXUGo3P6daI9O4xADbfP4MGa0XGUgmSct6Eoml8DfP4=;
	b=0kK51LDIlqUmPrq74jJIiEW0LMV0E9N1PhoHh3JqIZvcB8qs7Ktra5kzEaTKp2W+HG
	fJ+kksjn5FvtJsuNSwKDMXp4NXc1X6pgr44EUu4ubpvdwfn053wuWoYXQhbCZNdIaYxr
	dvfGm8jNiG6XeOct5/CT4DEC56JCd36jL4fnt1JRJnMriJv1IwUWTeX1SMM3y9/SjiFA
	kBavX2/BAj9ysI4T/Tsz6ZPXbCLxJ1zpKUwxInsaWoi+LzkghjWBDwre1VsSU9eQM7h2
	ThHh/hiomcaTCZ0ASO0FswcS2gNR1Vz6HT5vpTmE+kkjbnebrO4smqiFrCKtyZ4S7YYv
	tVZA==
X-Received: by 10.194.185.42 with SMTP id ez10mr45351437wjc.82.1450117921852; 
	Mon, 14 Dec 2015 10:32:01 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	an7sm30969359wjc.44.2015.12.14.10.32.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 10:32:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 19:34:01 +0100
Message-Id: <1450118041-19638-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][meta-gnome] gnome-panel: add dependency on dbus
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Dec 2015 18:32:02 -0000

* it's autodetected from sysroot:
  WARN: gnome-panel: gnome-panel rdepends on dbus-lib, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 3a413bd..47c8b80 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -10,7 +10,7 @@ SECTION = "x11/gnome"
 PR = "r7"
 
 DEPENDS = "gnome-doc-utils-native gconf glib-2.0 gnome-desktop gtk+ \
-           pango libwnck gnome-menus cairo libgweather dbus-glib \
+           pango libwnck gnome-menus cairo libgweather dbus dbus-glib \
 	   librsvg libcanberra"
 RDEPENDS_${PN} = "python"
 
-- 
2.6.4


