Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYF-0003rN-LG
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:28:47 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592229fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=hSsi9ubXHbTXqhaPLWHJDIHyW0p2nw84mmT2HzMjnKU=;
	b=rQaWj7kffb5oeK+E31A3LQrqnJ57b50m9YvHbtkyPu5/eWtlWNvdTZXrD2A6WD969V
	v1gErA59lK3Hl3V+YH7xpdHb0xEv3rkSMb1vdtBRToV5DzexXVrblgR9t0yCRaxW0IU4
	YsBbLUATe3ktRguqeObKnLPJZKQxqWKwG1vvQ=
Received: by 10.223.58.209 with SMTP id i17mr2988925fah.22.1316345015067;
	Sun, 18 Sep 2011 04:23:35 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:34 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:05 +0400
Message-Id: <1316344999-26642-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 03/17] opie-taskbar: fix linking issues
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
X-List-Received-Date: Sun, 18 Sep 2011 11:28:47 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../opie-taskbar/fix-crypt-reference.patch         |   21 ++++++++++++++++++++
 recipes-opie/opie-taskbar/opie-taskbar_1.2.5.bb    |    3 +-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 recipes-opie/opie-taskbar/opie-taskbar/fix-crypt-reference.patch

diff --git a/recipes-opie/opie-taskbar/opie-taskbar/fix-crypt-reference.patch b/recipes-opie/opie-taskbar/opie-taskbar/fix-crypt-reference.patch
new file mode 100644
index 0000000..c086027
--- /dev/null
+++ b/recipes-opie/opie-taskbar/opie-taskbar/fix-crypt-reference.patch
@@ -0,0 +1,21 @@
+Index: launcher/server.pro
+===================================================================
+--- launcher.orig/server.pro	2011-09-05 01:45:20.000000000 +0400
++++ launcher/server.pro	2011-09-05 01:46:39.000000000 +0400
+@@ -80,14 +80,12 @@
+ INCLUDEPATH += mediummount
+ DEPENDPATH  += mediummount
+
+-LIBS         = -lqpe -lopiecore2 -lopieui2 -lopiesecurity2 -lqrsync -lsysfs
++LIBS         = -lqpe -lopiecore2 -lopieui2 -lopiesecurity2 -lopiepim2 -lqrsync -lsysfs
+ TARGET       = qpe
+
+ ## not ready for use yet
+ # DEFINES += QPE_HAVE_DIRECT_ACCESS
+
+-contains( $(CONFIG_TARGET_MACOSX), y ) {
+-  LIBS += -lcrypt
+-}
++LIBS += -lcrypt -lm
+
+ include( //home/users/mitya/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/tosa/usr/lib/opie/include.pro )
diff --git a/recipes-opie/opie-taskbar/opie-taskbar_1.2.5.bb b/recipes-opie/opie-taskbar/opie-taskbar_1.2.5.bb
index e71926f..89fe296 100644
--- a/recipes-opie/opie-taskbar/opie-taskbar_1.2.5.bb
+++ b/recipes-opie/opie-taskbar/opie-taskbar_1.2.5.bb
@@ -1,5 +1,5 @@
 require ${PN}.inc
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://sources.openembedded.org/opie-1.2.5-split_core_apps_calibrate.tar.bz2;name=split_core_apps_calibrate \
            http://sources.openembedded.org/opie-1.2.5-split_noncore_settings_mediummount.tar.bz2;name=split_noncore_settings_mediummount \
@@ -15,6 +15,7 @@ SRC_URI = "http://sources.openembedded.org/opie-1.2.5-split_core_apps_calibrate.
            file://server-pro-125.patch \
            file://firstuse-path.patch \
            file://force-firstuse-calibrate.patch \
+           file://fix-crypt-reference.patch \
           "
 SRC_URI[split_core_apps_calibrate.md5sum] = "ee5e06b781e92f01271d883f91f101b0"
 SRC_URI[split_core_apps_calibrate.sha256sum] = "5e0164a195a166fd15451164edf8a44d8f3a9f81dcf3edc3a8975f24bd4b45b6"
-- 
1.7.2.5



