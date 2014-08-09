Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id F1AB0610F5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 10:58:39 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so3568702wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 03:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=//B1nxkbcIyE8yTQ3x4AHTNNP0JGQex1QiGJWJlKX88=;
	b=i5yb1XuoawF2QhAu7PWujVyA5NyJ5mlHiCthJTcp2IYc1qzqBB4MpvKFl8rRaUgdhJ
	LOeNhXkdP2FWsm545ZMO7go+N/cxnAea/G93FjH/WOAHgitJ4cdu3JkSLYSe7RLM2LCZ
	+Zt7LiijKaKMSRhp1PZ87ZqkmUihAeqbT+CPY8GsIy+rP687B1dKx9s/vMA+Whnjd1PZ
	29HekdobCf1hblN0Zy9jh6UxiAAyExE6mxYIULSaWNSG2dTXwREChNdaNnSimc9i9OsY
	cCGvwXWUTxzD0n/GlmlGv2qn/nUlKEyICtzNTmYYwitCgNv35sA/FSpBblcgRdQrYSB2
	YzWw==
X-Received: by 10.180.188.203 with SMTP id gc11mr10022865wic.59.1407581919659; 
	Sat, 09 Aug 2014 03:58:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	co6sm23848741wjb.31.2014.08.09.03.58.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 03:58:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 12:59:09 +0200
Message-Id: <1407581949-17124-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-oe][WIP][PATCH] tracker: add all floating dependencies
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
X-List-Received-Date: Sat, 09 Aug 2014 10:58:41 -0000

* fixes following warnings:
  WARN: tracker: tracker rdepends on dbus-lib but its not a build dependency?
  WARN: tracker: tracker rdepends on eglibc but its not a build dependency?
  WARN: tracker: tracker rdepends on enca but its not a build dependency?
  WARN: tracker: tracker rdepends on gdk-pixbuf but its not a build dependency?
  WARN: tracker: tracker rdepends on glib-2.0 but its not a build dependency?
  WARN: tracker: tracker rdepends on glib-2.0-utils but its not a build dependency?
  WARN: tracker: tracker rdepends on gsettings-desktop-schemas but its not a build dependency?
  WARN: tracker: tracker rdepends on gtk+3 but its not a build dependency?
  WARN: tracker: tracker rdepends on gvfs but its not a build dependency?
  WARN: tracker: tracker rdepends on libcap but its not a build dependency?
  WARN: tracker: tracker rdepends on libexif but its not a build dependency?
  WARN: tracker: tracker rdepends on libffi but its not a build dependency?
  WARN: tracker: tracker rdepends on libgcc but its not a build dependency?
  WARN: tracker: tracker rdepends on libgcrypt but its not a build dependency?
  WARN: tracker: tracker rdepends on libgee but its not a build dependency?
  WARN: tracker: tracker rdepends on libgnome-keyring but its not a build dependency?
  WARN: tracker: tracker rdepends on libgpg-error but its not a build dependency?
  WARN: tracker: tracker rdepends on libgsf but its not a build dependency?
  WARN: tracker: tracker rdepends on libsqlite3 but its not a build dependency?
  WARN: tracker: tracker rdepends on libstdc++ but its not a build dependency?
  WARN: tracker: tracker rdepends on libunistring but its not a build dependency?
  WARN: tracker: tracker rdepends on upower but its not a build dependency?
  WARN: tracker: tracker rdepends on util-linux-libuuid but its not a build dependency?
  WARN: tracker: tracker rdepends on zlib but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on cairo but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on eglibc but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on enca but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on expat but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on fontconfig but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on freetype but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on giflib but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on glib-2.0 but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on gstreamer but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on lcms but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libbz2 but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libexif but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libffi but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libgsf but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libgstpbutils-0.10 but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libgsttag-0.10 but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libjpeg-turbo but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on liblzma but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libpng but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libpoppler but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libpoppler-glib but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libsqlite3 but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libstdc++ but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libunistring but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libx11 but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libxau but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libxcb but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libxcb-render but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libxcb-shm but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libxdmcp but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libxext but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libxml2 but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on libxrender but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on pixman but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on taglib but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on taglib-c but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on tiff but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on tracker but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on tracker but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on util-linux-libuuid but its not a build dependency?
  WARN: tracker: tracker-dev rdepends on zlib but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on atk but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on cairo but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on eglibc but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on expat but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on fontconfig but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on freetype but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on gdk-pixbuf but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on glib-2.0 but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on gtk+ but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on harfbuzz but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libffi but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libpng but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libsqlite3 but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libunistring but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libx11 but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxau but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxcb but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxcb-render but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxcb-shm but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxdmcp but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxext but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on libxrender but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on pango but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on pixman but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on tracker but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on util-linux-libuuid but its not a build dependency?
  WARN: tracker: tracker-nautilus-extension rdepends on zlib but its not a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index eea8edc..21df29d 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "Tracker is a tool designed to extract information and metadata about your personal data so that it can be searched easily and quickly."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ee31012bf90e7b8c108c69f197f3e3a4"
-DEPENDS = "file gstreamer gamin dbus libexif gettext sqlite3 icu"
+DEPENDS = "file gstreamer gamin dbus libexif gettext sqlite3 icu gst-plugins-base libgnome-keyring poppler tiff enca libgsf libunistring giflib taglib bzip2 upower gtk+3 libgee"
+
 RDEPENDS_${PN} += " gvfs gsettings-desktop-schemas"
 HOMEPAGE = "http://projects.gnome.org/tracker/"
 
-- 
2.0.4


