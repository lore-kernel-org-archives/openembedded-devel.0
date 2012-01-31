Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RsLz0-0000lQ-O5
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 23:15:22 +0100
Received: by eekd41 with SMTP id d41so151125eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 14:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=pLl1CXQF95VvvfLtvURixooX/dxeeNyjtnkNH/oL43w=;
	b=QUgn+IoIUMwCcD+3QIkW7HpIJ3ob5oocYQo010+eR4fBt28quAr73hP0HvqOqK5ZYi
	oMoHuqvG0wx1mnr26sExB5FQQg9yMI63glWGIGzeAqMMC9WYsiz9SQDJ3X5R2GWsmOhJ
	fzyU022S9/ZWGA7Gquou8R0G7GebkCakyuzY4=
Received: by 10.14.99.71 with SMTP id w47mr1576973eef.78.1328047648665;
	Tue, 31 Jan 2012 14:07:28 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id y12sm90885696eeb.11.2012.01.31.14.07.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 14:07:28 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2012 23:05:22 +0100
Message-Id: <1328047522-19230-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1328044407-30273-1-git-send-email-tworaz666@gmail.com>
References: <1328044407-30273-1-git-send-email-tworaz666@gmail.com>
Subject: [meta-gnome][PATCH 2/2 v2] Add recipe for gnome-mplayer 1.0.5.
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
X-List-Received-Date: Tue, 31 Jan 2012 22:15:22 -0000

Run tested on netbookpro.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
new file mode 100644
index 0000000..55e82b5
--- /dev/null
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "A GTK+ interface to MPlayer"
+HOMEPAGE = "http://code.google.com/p/gnome-mplayer"
+SECTION = "multimedia"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS = "gmtk gtk+ alsa-lib libnotify glib-2.0 dbus-glib virtual/libx11 libxscrnsaver"
+RDEPENDS = "mplayer"
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
-- 
1.7.3.4



