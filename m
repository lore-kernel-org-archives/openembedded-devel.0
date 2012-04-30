Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkIi-0003WQ-D6
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:41:36 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so1805040wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iTthc7LoCdv+GIbNWqFE7eLsUS6AhPAJfFxWMITZ/iM=;
	b=w59MskQgxabT2gatjelKVfr8lVmhbS3jyafSFLDE8M7x2nCmo6BPsM5UL6fyZRN4Oq
	WVGHm7nBPKt+Q24MNzwFPIj+VE2OhXhye6xICmW9kbpY8MdPSWJ2Pa2mSKLiKVczKnvF
	zS1dN3wt+pO80zvTmvj6mpfQ8TYGo0Nxpmgm6OGg+Qh/8Z2Hoyr8dSWL1kK4aPxXgsIo
	tJ7WCeMbfWG5bM0xQqxI/YYE8c1CNCKn0tDWCtTY8DthvT55QpyV3mGkQw9wOFLpQTbZ
	wlN2h7986YHgUeJUoOqi/uXVOQGo4uZwCZgk58xqjL0tdhY9UJp9qw8UQuj6gyZEdAfc
	KoQQ==
Received: by 10.180.96.228 with SMTP id dv4mr4387120wib.14.1335767516977;
	Sun, 29 Apr 2012 23:31:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm41899630wib.2.2012.04.29.23.31.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:31:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:31:12 +0200
Message-Id: <a34b7affb9e7f37246e9256659102a14e263609d.1335766581.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 5/6] tangogps: fix build with glib-2.32
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
X-List-Received-Date: Mon, 30 Apr 2012 06:41:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../tangogps/tangogps-0.99.4/glib-2.32.patch       |   11 +++++++++++
 .../recipes-navigation/tangogps/tangogps_0.99.4.bb |    6 ++++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/tangogps/tangogps-0.99.4/glib-2.32.patch

diff --git a/meta-oe/recipes-navigation/tangogps/tangogps-0.99.4/glib-2.32.patch b/meta-oe/recipes-navigation/tangogps/tangogps-0.99.4/glib-2.32.patch
new file mode 100644
index 0000000..0579455
--- /dev/null
+++ b/meta-oe/recipes-navigation/tangogps/tangogps-0.99.4/glib-2.32.patch
@@ -0,0 +1,11 @@
+diff -uNr tangogps-0.99.4.orig/src/map_management.c tangogps-0.99.4/src/map_management.c
+--- tangogps-0.99.4.orig/src/map_management.c	2010-06-25 11:40:05.000000000 +0200
++++ tangogps-0.99.4/src/map_management.c	2012-04-30 07:43:58.551301271 +0200
+@@ -2,7 +2,6 @@
+ 
+ #include <glib.h>
+ #include <gtk/gtk.h>
+-#include <glib/gstring.h>
+ #include <glib/gprintf.h>
+ #include <gconf/gconf.h>
+ #include <math.h>
diff --git a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
index 3a1ea3d..5a4231a 100644
--- a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
+++ b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
@@ -5,10 +5,12 @@ SECTION = "x11/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "curl gtk+ gconf sqlite3 libexif libsoup-2.4 bluez4"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.tangogps.org/downloads/${P}.tar.gz \
-           file://remove.unused.header.patch"
+           file://remove.unused.header.patch \
+           file://glib-2.32.patch \
+"
 SRC_URI[md5sum] = "0f07ede94a21eb84f5e017fa88a1fc3d"
 SRC_URI[sha256sum] = "660fdf89ef3c379f2fc0c2a9d0c9d3bfa5345835786b72bf9f513ba9ec2c812a"
 
-- 
1.7.8.6



