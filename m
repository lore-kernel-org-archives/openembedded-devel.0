Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rsgds-0004e1-T5
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 21:18:56 +0100
Received: by eaal10 with SMTP id l10so153026eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 12:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=7cFLJfUJ0XPmdmE8ohlKlmk+8p2QhpprKR0hF+HO3Wk=;
	b=Y9oYUqwOEEw0dXXAPsy+2dyXXsyPvgAArOcrU8iYlOheERykvh0PVA2zPq/Ikqikw9
	1ZKAtomU+t3iY+j++zGvDAbe5aB9Wvqr4coX0FW7ie7hTy/gnqwT71f8hcPtHASe2RpI
	V0PvnQds2aVDlBs2KyhFyf4RO+5eTWZsc07Yo=
Received: by 10.213.11.19 with SMTP id r19mr1321227ebr.111.1328127061435;
	Wed, 01 Feb 2012 12:11:01 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id a58sm176525eeb.8.2012.02.01.12.10.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 12:11:00 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Feb 2012 21:08:53 +0100
Message-Id: <1328126933-25472-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <CAMKF1srQR9S3PPbhTDH3SM22Ji-M=rauFv=M+nKKVs44dj1p-w@mail.gmail.com>
References: <CAMKF1srQR9S3PPbhTDH3SM22Ji-M=rauFv=M+nKKVs44dj1p-w@mail.gmail.com>
Cc: Piotr Tworek <ptworek@opera.com>
Subject: [meta-gnome][PATCH v4] gnome-mplayer: Add initial recipe for version 1.0.5.
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
X-List-Received-Date: Wed, 01 Feb 2012 20:18:57 -0000

From: Piotr Tworek <ptworek@opera.com>

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
new file mode 100644
index 0000000..b755dfa
--- /dev/null
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A GTK+ interface to MPlayer"
+HOMEPAGE = "http://code.google.com/p/gnome-mplayer"
+SECTION = "multimedia"
+
+LICENSE = "GPLv2+"
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



