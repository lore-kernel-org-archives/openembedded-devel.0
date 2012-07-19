Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srl6h-0005mE-Au
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 09:25:07 +0200
Received: by weyr6 with SMTP id r6so1447060wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 00:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tSY/2MNNOqPcgAGh/ZXE7ISXiQIGix2qYlwrjb/Wtqk=;
	b=QvSG0107zmZA9gEIdQwKP0RXLakZeBwbE+Vuilf5HrfxDIMfScPpBbEbFJfs4ZxohU
	CDNwI3m1AK83UYGmXoOIimf0sEBDs/EtE8lELyFot65OfU2TtPxidK6yBhyN4BAufgGi
	X+K6dl2IBQsg55e3aDd/dthOpC8eALG2g7LC3Y7KKcNvC8Pzeaxt8NvdB614DSZiyT7h
	JVcwFq2jjwk+Ccn5vOOOCQeJsYW+9Ql4sneHB0p3OmNxqURhTZ+0+H0Yuey3GAaOOKzy
	NBK7o9PQr30JUwLG03Z2xEuR+IOfFUNVLpl9b2ojnYZxj3RixZeXbyvDXZpOdH6WVzj0
	RzAg==
Received: by 10.180.81.133 with SMTP id a5mr1840477wiy.17.1342682026023;
	Thu, 19 Jul 2012 00:13:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm3907281wiz.11.2012.07.19.00.13.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 00:13:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 09:13:45 +0200
Message-Id: <a4b137f8756875cb7787453a60786361dd63e680.1342681929.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342681929.git.Martin.Jansa@gmail.com>
References: <cover.1342681929.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342681929.git.Martin.Jansa@gmail.com>
References: <cover.1342681929.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-gnome][PATCH 1/4] gnome-panel3: add dconf to DEPENDS
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
X-List-Received-Date: Thu, 19 Jul 2012 07:25:07 -0000

* fixes:
  | configure:14455: error: Package requirements (gdk-pixbuf-2.0 >=
  2.7.1 pango >= 1.15.4 gtk+-3.0 >= 3.0 cairo-xlib glib-2.0 >= 2.25.12
  gio-2.0 >= 2.25.12 gio-unix-2.0 >= 2.25.12 gnome-desktop-3.0 >= 2.91.0
  gconf-2.0 >= 2.6.1 libgnome-menu >= 2.27.92 dconf) were not met:
  |
  | No package 'dconf' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gnome-panel/gnome-panel3_3.0.2.bb              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index c7be8d0..bd21ca1 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SECTION = "x11/gnome"
 
-DEPENDS = "gnome-doc-utils-native gtk+3 gconf glib-2.0 gnome-desktop3 gtk+ pango libwnck3 gnome-menus cairo libgweather3 dbus-glib librsvg libcanberra" 
+DEPENDS = "gnome-doc-utils-native gtk+3 dconf gconf glib-2.0 gnome-desktop3 gtk+ pango libwnck3 gnome-menus cairo libgweather3 dbus-glib librsvg libcanberra" 
 
 inherit gtk-doc gnome gettext pkgconfig
 
-- 
1.7.8.6



