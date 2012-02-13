Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rx2hC-0003N6-BQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 21:40:22 +0100
Received: by eaal10 with SMTP id l10so1586277eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 12:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=IrkDbWcYIlCk7ov4ExGRaF1bvI6lwae4VdUjbWTPNbU=;
	b=w7O06XEDa85Myya0Qatw5ZM7NPqzy/sC4RGk9Uujcs9Fl7FmKWTVM5oqA8d1nke+rD
	EcFXzKVpAPDAzCGaydKp9YVs1FVVt/tPifAtBWtwMJpqOoWvJednvLdOZRrituhBuGDK
	333BHH55A3OHamAd20qBlsxdO7fwbdztIwURc=
Received: by 10.213.25.78 with SMTP id y14mr2876476ebb.125.1329165131749;
	Mon, 13 Feb 2012 12:32:11 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id n17sm64687727eei.3.2012.02.13.12.32.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 12:32:09 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2012 21:29:46 +0100
Message-Id: <1329164986-17671-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <CAK18fxFyXnwuFj-=caU3e-Dy+tGZVwgTpP7NmsZ4opWB_gJCWA@mail.gmail.com>
References: <CAK18fxFyXnwuFj-=caU3e-Dy+tGZVwgTpP7NmsZ4opWB_gJCWA@mail.gmail.com>
Subject: [PATCH 2/3 v2] xfce4-settings: Update to latest stable version 4.8.3.
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
X-List-Received-Date: Mon, 13 Feb 2012 20:40:22 -0000

http://git.xfce.org/xfce/xfce4-settings/tag/?id=xfce4-settings-4.8.3

Run tested on netbook pro.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../xfce4-settings/xfce4-settings_4.8.2.bb         |   16 ----------------
 .../xfce4-settings/xfce4-settings_4.8.3.bb         |   16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.bb

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
deleted file mode 100644
index 258c238..0000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Xfce4 settings"
-SECTION = "x11/wm"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier"
-
-PR = "r1"
-
-inherit xfce
-
-SRC_URI += "file://0001-xfsettingsd-use-gnome-as-default-icon-theme.patch"
-
-SRC_URI[md5sum] = "a45420fea20f29265ab6785cb1d07377"
-SRC_URI[sha256sum] = "3f79865a6a3817f3c868f2412cbf105e73e54810438f62035699ae5fd72c29d0"
-
-RRECOMMENDS_${PN} += "gnome-icon-theme"
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.bb
new file mode 100644
index 0000000..2dbdd81
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Xfce4 settings"
+SECTION = "x11/wm"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "exo gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier"
+
+PR = "r1"
+
+inherit xfce
+
+SRC_URI += "file://0001-xfsettingsd-use-gnome-as-default-icon-theme.patch"
+
+SRC_URI[md5sum] = "4669298cc8a4abf0e5a410016b575030"
+SRC_URI[sha256sum] = "d878cc474e1e677e9607279b9a1007cb90ed35ff078de180259a8b2b8d06bc2e"
+
+RRECOMMENDS_${PN} += "gnome-icon-theme"
-- 
1.7.3.4



