Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFnY-000755-Mh
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 10:02:45 +0100
Received: by eekd41 with SMTP id d41so912479eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 00:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=E4NMmJiKGbIYqlaic/jkAPpdaWkNswHb8w99LlB7wHo=;
	b=bUIaf5N+k2e9jIU4AY+G9Y1ixTYskHaG9OqX2sMWkZWdr29aGFttM7lNEnIkS6NpIm
	xHBxlZJ0k7EIWqkJtu41KjRiQrKEukWbB4yPIMOKx9wMUX5934iS5iXvqvzc5HyO7MMn
	5CSCw2xd715AK8o4CY9zbYkkbw/GjHrPMqqD8=
Received: by 10.213.22.212 with SMTP id o20mr1304252ebb.26.1327308900981;
	Mon, 23 Jan 2012 00:55:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r2sm51266186eef.7.2012.01.23.00.54.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 00:55:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 09:54:21 +0100
Message-Id: <ac9b25879bb30175932595078deb53d17ac2d7e3.1327308791.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
References: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1327308791.git.Martin.Jansa@gmail.com>
References: <cover.1327308791.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 5/8] gtk+3: add gtk+-native dependency
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
X-List-Received-Date: Mon, 23 Jan 2012 09:02:45 -0000

* it's needed to provide gtk-update-icon-cache
  --enable-gtk2-dependency implies external gtk-update-icon-cache
  AM_CONDITIONAL(USE_EXTERNAL_ICON_CACHE, [test x = xyes || test x = xyes])
  unfortunately result of AC_PATH_PROG(GTK_UPDATE_ICON_CACHE, gtk-update-icon-cache, no)
  is not checked for no value before being used resulting in
  no --quiet --force --ignore-theme-index               \
          --source builtin_icons stock-icons > gtkbuiltincache.h.tmp &&        \
       mv gtkbuiltincache.h.tmp gtkbuiltincache.h
  /bin/sh: no: command not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb
index a08fb00..9a5f40d 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
            gtk-doc-native docbook-utils-native libxrandr libgcrypt \
-           libxdamage libxrender libxcomposite cairo gdk-pixbuf"
+           libxdamage libxrender libxcomposite cairo gdk-pixbuf gtk+-native"
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
-- 
1.7.8.4



