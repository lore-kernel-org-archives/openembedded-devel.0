Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkIA-0003WQ-Iv
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:41:02 +0200
Received: by wera1 with SMTP id a1so1805040wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=PTfr8aWNvLOnDaHqvRM8gfzOBI7+a9Xt50u53/WDVxs=;
	b=XA1VFdQ795TVpgxS2/WvqQRGg2xBi7fS7wX7z09FXj/g9fiMIIAYHch9FkucnPouLw
	MkdWPuS9vfMEiYYUjAW7/PL0KhJOu96pWxmx8bKtNonZRwZu82qny5JE1Z8BaW67GS3+
	YKT/4Gidh+hZ/KIE1dBKXdLGm/XABuaFuaxYc6ob/Djz+TI2g/eX27P2O7Xkd7kUahay
	ViBWgb0xgAsn4w9uSUceUj0b+PKJFG9Y045fZpDk33r70bZ18fLNZBWetkR9Khmk5QJZ
	G/DyEs9ZHSOc7VZZk0mDsdiJ4aWG3ZO3PeyOTQo0GVfyBROXJ2GPQWZvWwG4w/YF2q+F
	lH/w==
Received: by 10.180.88.169 with SMTP id bh9mr1679960wib.5.1335767481065;
	Sun, 29 Apr 2012 23:31:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fz9sm26385314wib.3.2012.04.29.23.31.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:31:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:31:07 +0200
Message-Id: <cover.1335766581.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-efl][PATCH 0/6] fixes for gcc, glib-2.0 upgrade
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
X-List-Received-Date: Mon, 30 Apr 2012 06:41:02 -0000

Tested only with this patchset applied:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-April/021626.html
so it would be nice to apply it after that.

Thanks

The following changes since commit 8f9b2e3a102e66426ce5b269a6827fc6a3218bef:

  kernel bbclass: recreate uImage unless KEEPUIMAGE is set (2012-04-27 21:57:32 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull2

Martin Jansa (6):
  libsoup-2.4, gobject-introspection: upgraded in oe-core
  midori: upgrade to 0.4.5
  libgpewidget: fix build with glib-2.32
  epdfview: fix build with glib-2.32
  tangogps: fix build with glib-2.32
  webkit-efl: fix build with gcc-4.7

 meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch  |   12 +++
 meta-efl/recipes-efl/efl/epdfview_0.1.8.bb         |    6 +-
 ...t-pass-P-to-the-preprocessor-when-running.patch |   76 ++++++++++++++++++++
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |    3 +-
 .../recipes-support/libsoup/libsoup-2.4_2.37.2.bb  |   25 -------
 .../use-usr-bin-env-for-python.patch               |   20 -----
 .../gobject-introspection_0.9.10.bb                |   32 --------
 .../gobject-introspection_git.bb                   |   34 ---------
 .../libgpewidget/libgpewidget/glib-2.32.patch      |   11 +++
 .../libgpewidget/libgpewidget_0.117.bb             |   10 ++-
 .../midori/{midori_0.4.4.bb => midori_0.4.5.bb}    |    6 +-
 .../tangogps/tangogps-0.99.4/glib-2.32.patch       |   11 +++
 .../recipes-navigation/tangogps/tangogps_0.99.4.bb |    6 +-
 13 files changed, 128 insertions(+), 124 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch
 delete mode 100644 meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection/use-usr-bin-env-for-python.patch
 delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_0.9.10.bb
 delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb
 create mode 100644 meta-gpe/recipes-graphics/libgpewidget/libgpewidget/glib-2.32.patch
 rename meta-oe/recipes-connectivity/midori/{midori_0.4.4.bb => midori_0.4.5.bb} (89%)
 create mode 100644 meta-oe/recipes-navigation/tangogps/tangogps-0.99.4/glib-2.32.patch

-- 
1.7.8.6



