Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkIT-0003Wd-N3
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:41:21 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2076709wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=TlO2wNYUiGIdqXEdESY7yuPNK+U+GbfnN/yzWMom4FI=;
	b=zxHcPHLW9GuAnHRCHe9kCiOrZmjh+Fi1nprTkR3o4aeDAc/FrNeNg8ejdMorPeuCnv
	eD7XS0/dxPkET06ekNua0PmUgSBm+CxEDQgaTDAco8AURLODkFbmJmNzJOgjMRMdzbE3
	V4HrDojeZyzBsDy/ZEY1FbIS27EpIsRXPFPYTCcidSQENDjQlCFtnW1/Jm0ct/KT5WOQ
	BgD250enxxYIOV6l7z00tetC7rgkCm5n8iuHe+vq6dWPtVBK5FIVmkGfy17pMsbjnpuP
	2wW8Z5owdEgv3KnsJsFruu8dtiofg8zKoDrjwj9rFLtcZ/K9AjeG7/IwXmokRTBE0sYN
	LRuA==
Received: by 10.180.79.72 with SMTP id h8mr3274895wix.1.1335767502472;
	Sun, 29 Apr 2012 23:31:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm26389912wib.2.2012.04.29.23.31.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:31:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:31:10 +0200
Message-Id: <3ab85cdf1c9217ff1a9f0055aba7faa8f159191a.1335766581.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 3/6] libgpewidget: fix build with glib-2.32
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
X-List-Received-Date: Mon, 30 Apr 2012 06:41:21 -0000

* SRC_URI needs to be after inherit gpe
  and pkgconfig.patch wasn't ever used

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgpewidget/libgpewidget/glib-2.32.patch      |   11 +++++++++++
 .../libgpewidget/libgpewidget_0.117.bb             |   10 ++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 meta-gpe/recipes-graphics/libgpewidget/libgpewidget/glib-2.32.patch

diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget/glib-2.32.patch b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget/glib-2.32.patch
new file mode 100644
index 0000000..f590caa
--- /dev/null
+++ b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget/glib-2.32.patch
@@ -0,0 +1,11 @@
+diff -uNr libgpewidget-0.117.orig/gpehelp.c libgpewidget-0.117/gpehelp.c
+--- libgpewidget-0.117.orig/gpehelp.c	2006-10-12 12:20:33.000000000 +0200
++++ libgpewidget-0.117/gpehelp.c	2012-04-30 07:45:57.813293792 +0200
+@@ -33,7 +33,6 @@
+ #include <gdk-pixbuf/gdk-pixbuf.h>
+ #include <gdk/gdk.h>
+ #include <glib.h>
+-#include <glib/gkeyfile.h>
+ 
+ 
+ /* helper function definitions*/
diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
index c4497de..e8abc43 100644
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
+++ b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
@@ -5,16 +5,18 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 DEPENDS = "gtk+ cairo libxinerama libxcomposite libxrender gtk-doc"
-PR = "r1"
+PR = "r2"
 
-SRC_URI += "file://pkgconfig.patch;striplevel=0"
+inherit gpe pkgconfig autotools
+
+SRC_URI += "file://pkgconfig.patch;striplevel=0 \
+  file://glib-2.32.patch \
+"
 SRC_URI[md5sum] = "b85a839264a35d0faf9a1a38c486e189"
 SRC_URI[sha256sum] = "f96d30c09b0395ea4e146730fd52d9ea303b619bb139051d9f12d3f868a9e18c"
 
 GPE_TARBALL_SUFFIX = "bz2"
 
-inherit gpe pkgconfig autotools
-
 EXTRA_OECONF = "--enable-cairo"
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-- 
1.7.8.6



