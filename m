Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2943E6E666
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 May 2016 23:18:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n129so14866710wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 May 2016 16:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ixnjqonl7pS+P5gFLpKMLM0ZckVHI3M0g+ZMUp28Jv4=;
	b=LQv7usKhFe+W0YH9eiGL1XprUsJ6pV1NxozIDhgQllDiSA/jujQUJgno2L4Wh5wEbR
	QDzkyY9n1fQ38joRq6jFMCY2VJdF7w/MPJi/ZSI/XZOvlX6QNCE7ZnLEjRRolCMnytO7
	4V5L5dbp8aiO/S3Ok0p6aqdHF7hD8lXqAmj9oDZsGd/FQZfpUGY6NjXkFHrds7AHwMmD
	/94dCIF8EMNpBJgjv9rRW1UoK7WW6KvhWC3pMpGaUKJJf7Mr7V+6Nk5MONWXfMUuzkz1
	ITDuyqOJOYNqgS5igqMSbvaRxtmrAyYp2hWaKAkmnelRr6w8uByniHQi3DWLC2JnI80P
	pW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ixnjqonl7pS+P5gFLpKMLM0ZckVHI3M0g+ZMUp28Jv4=;
	b=mG9+niGKXvpiWmlmxfY0Slg/EHvGoMTQam6S5zRFrmHF4ZA798gCCnXd/IStJ3mx+D
	wDytmuSSggsiOpw4GS4l1j+htdukW8uHr4l+6pGVDdzBTvNJPO/w/ealG06IpS4dJfpU
	b3kFjTI7a1aaHXsfwvRNS7nCYEwM256XjmKz4tXsxpc2m71+pAl96+BcmK/bJnH16/9K
	76ULLY/fSpmLnwnjQG2UlhwTnUyDLSYu03CmEmCFMoWqaQuIlWoTiX95WMyAO8A3DoXV
	EfjEu2sieBpdd1s3v7gUAYYvkTbNvcu0IkqyCAdWjQszL+z9x06biddsSV6AaiyHSDhT
	U+7w==
X-Gm-Message-State: AOPr4FUOzn3NX/6tq6n/DNiUN0MPb6D+flFvRmIn1fAim7Al071b8vcuWoWg+pWQHUZkmw==
X-Received: by 10.194.179.233 with SMTP id dj9mr23071901wjc.115.1462144684926; 
	Sun, 01 May 2016 16:18:04 -0700 (PDT)
Received: from localhost.localdomain (p5B0A03E5.dip0.t-ipconnect.de.
	[91.10.3.229]) by smtp.googlemail.com with ESMTPSA id
	e16sm15572258wmc.3.2016.05.01.16.18.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 May 2016 16:18:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 May 2016 01:17:45 +0200
Message-Id: <1462144669-18427-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/5] meta-xfce: add intltool-native to DEPENDS
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
X-List-Received-Date: Sun, 01 May 2016 23:18:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix tons of messages as:

| WARNING: foo do_configure: Missing DEPENDS on intltool-native

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/classes/xfce.bbclass                                          | 2 ++
 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb     | 2 +-
 meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb                     | 2 +-
 meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb       | 2 +-
 meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb | 2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index f4ef556..b49bba1 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -8,6 +8,8 @@ SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@xfce_verdir("${PV}")}/${BP
 
 inherit autotools gettext gtk-icon-cache pkgconfig
 
+DEPENDS += "intltool-native"
+
 FILES_${PN} += "${datadir}/icons/* ${datadir}/applications/* ${libdir}/xfce4/modules/*.so*"
 FILES_${PN}-doc += "${datadir}/xfce4/doc"
 
diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
index e24606c..cb1be67 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-app
 
-DEPENDS = "gtk+ cairo libwnck xfce4-dev-tools-native exo-native"
+DEPENDS += "gtk+ cairo libwnck xfce4-dev-tools-native exo-native"
 
 SRC_URI[md5sum] = "7da465a4798629ebd8650fef62770ab7"
 SRC_URI[sha256sum] = "2e1eb161f966cbfbd68bd029fb59115bc5ab0c0704cb500d20e7d73967e59ecb"
diff --git a/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb b/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
index 1514c61..f27396c 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-app gtk-doc mime
 
-DEPENDS = " \
+DEPENDS += " \
     glib-2.0 \
     dbus-glib \
     gtk+3 \
diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
index 142b289..313534b 100644
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-DEPENDS = "gtk+ libxfce4ui xfce4-panel xfconf libunique"
+DEPENDS += "gtk+ libxfce4ui xfce4-panel xfconf libunique"
 
 SRC_URI += " \
     file://0001-main-status-icon.c-remove-deprecated-g_type_init.patch \
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
index 81b6771..2070db2 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce
 
-DEPENDS = "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
+DEPENDS += "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
            libxrandr virtual/libx11 libxext xfce4-panel upower"
 
 SRC_URI[md5sum] = "e7d00548e58bf19229e727818184c1e0"
-- 
2.5.5


