Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RsLAn-0007n2-2m
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 22:23:29 +0100
Received: by eaao11 with SMTP id o11so143673eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 13:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uSq8MMmO58rnrojQTxYcKCxElmXSmXagCLKWjCG1RC4=;
	b=tZx1vl4WiquuNPH45OuspO5VCWiqSOaWrst7UZLkQPgBiq2LG3zmwbKJ8pFk31TDkK
	cHGlZh+Pj8Rzs1O0yjNrSffdMLiLI4/TgQcc5Z15ar2vH3K+gyE6hSZn1CIzrOgQRrzK
	/AN6XNKKqBX6L7xr8BOTQwQDb/IxrLQd5/iBY=
Received: by 10.213.32.140 with SMTP id c12mr638163ebd.8.1328044534849;
	Tue, 31 Jan 2012 13:15:34 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id a58sm10844121eeb.8.2012.01.31.13.15.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 13:15:34 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2012 22:13:26 +0100
Message-Id: <1328044407-30273-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-gnome][PATCH 1/2] Add recipe for gmtk 1.0.5.
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
X-List-Received-Date: Tue, 31 Jan 2012 21:23:29 -0000

Run tested on netbookpro.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../recipes-apps/gnome-mplayer/gmtk_1.0.5.bb       |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
new file mode 100644
index 0000000..9aa4e04
--- /dev/null
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "GTK+ widget and function libraries for gnome-mplayer"
+HOMEPAGE = "http://code.google.com/p/gmtk"
+SECTION = "libs"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS = "gtk+ alsa-lib glib-2.0 virtual/libx11"
+
+SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.gz"
+SRC_URI[md5sum] = "e06e9ca8d61d74910343bb3ef4348f7f"
+SRC_URI[sha256sum] = "a07130d62719e8c1244f8405dd97445798df5204fc0f3f2f2b669b125114b468"
+
+EXTRA_OECONF = "--disable-gconf --with-gio --with-alsa --enable-keystore"
+
+inherit gettext pkgconfig autotools
-- 
1.7.3.4



