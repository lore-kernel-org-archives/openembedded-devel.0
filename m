Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RsfWA-0001Ue-Qb
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 20:06:54 +0100
Received: by eaal10 with SMTP id l10so133438eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 10:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=jn630ivdxvHKWdIQn2ivhuLeE2L3eeoDnCTk7LIxaMo=;
	b=nWlUa4MMYRbQecqI035tKSyZFec7w+qxGS7/PptblN/jzVa50O4QZFDUMrUXk9Clj2
	7Dcbvbvoe6qU4fUZIzlc8OSwjCjN8p4RQu1mL5Xy01g6QE4lqZuhwroC5p1L2IB1tFmZ
	kHseVwg1pnf2Y5klh+MD7dZ2IW9Yy8YkjMlGo=
Received: by 10.213.28.132 with SMTP id m4mr14877ebc.3.1328122738940;
	Wed, 01 Feb 2012 10:58:58 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id o49sm53424384eeb.7.2012.02.01.10.58.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 10:58:58 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Feb 2012 19:56:50 +0100
Message-Id: <1328122610-16076-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1328044407-30273-1-git-send-email-tworaz666@gmail.com>
References: <1328044407-30273-1-git-send-email-tworaz666@gmail.com>
Cc: Piotr Tworek <ptworek@opera.com>
Subject: [meta-gnome][PATCH v3] gnome-mplayer: Add recipe for version 1.0.5.
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
X-List-Received-Date: Wed, 01 Feb 2012 19:06:54 -0000

From: Piotr Tworek <ptworek@opera.com>

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
new file mode 100644
index 0000000..0927bde
--- /dev/null
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A GTK+ interface to MPlayer"
+HOMEPAGE = "http://code.google.com/p/gnome-mplayer"
+SECTION = "multimedia"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS = "gmtk gtk+ alsa-lib libnotify glib-2.0 dbus-glib virtual/libx11 libxscrnsaver"
+
+SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.gz"
+SRC_URI[md5sum] = "1d3ab24c5501b5528e357931ca4dc6da"
+SRC_URI[sha256sum] = "ac3c179345baecb4ca5237782aa33e83253a87bf8b42ce6eb3a9207a340f61b2"
+
+EXTRA_OECONF = "--with-gio --with-alsa --with-dbus --with-libnotify"
+
+FILES_${PN} += "${datadir}/gnome-control-center/default-apps/${PN}.xml"
+
+inherit gettext pkgconfig mime gtk-icon-cache autotools
+
+RDEPENDS_${PN} = "mplayer"
-- 
1.7.3.4



