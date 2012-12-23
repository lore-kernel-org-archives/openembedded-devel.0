Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkr6-0001rf-F0
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:40:41 +0100
Received: by mail-ee0-f48.google.com with SMTP id b57so3241112eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=f6xMfWGTZ6pX/jZ/2WxMD8raZ+9XQ7SVcCMAAY0kPlw=;
	b=irpcCQqukIHjwPiGw1h7BTVq7fq2hp9AavHIydmPRVpckc9Nf2jHrEljQlh/TQzzee
	fDB98QqstP7fvlxrlDJUf/fOgrhLnXrs3HwqDpEmymarjFZbbh1LCDrwxf4u2SIUeoV2
	txwMEGzZ/+TITw5hknpRq2VfEOF0R8WEa1Re0xmWIUiol/XucicAjBWZFLYOmYCNoSrz
	7kCkXaIR0MN2a1+nuH2Zpv6Ty3sWsMSqNjbVGzmTOzwTqz+QFP3AD9Pux0Z3i8XCM/H8
	/xUMRU4cB9OWkeU3/1WJlSnP3cecy67qp0dzx3/Ktco8shyLAFsz1DvalCA7YCjoLezB
	B1+Q==
X-Received: by 10.14.223.200 with SMTP id v48mr48030295eep.24.1356265547961;
	Sun, 23 Dec 2012 04:25:47 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm34566373eeo.11.2012.12.23.04.25.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:25:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:51 +0100
Message-Id: <c7ff376b90090d8639db611a748ce609c3885906.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 26/30] libgnomeprint: fix build with newer toolchain
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
X-List-Received-Date: Sun, 23 Dec 2012 12:40:50 -0000

* FILE is not defined without stdio.h

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome/libgnomeprint/fix.includes.patch      | 11 +++++++++++
 meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb        |  4 ++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomeprint/fix.includes.patch

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint/fix.includes.patch b/meta-gnome/recipes-gnome/gnome/libgnomeprint/fix.includes.patch
new file mode 100644
index 0000000..53235a1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint/fix.includes.patch
@@ -0,0 +1,11 @@
+diff -uNr libgnomeprint-2.18.7.orig/libgnomeprint/modules/cups/gnome-print-cups-transport.c libgnomeprint-2.18.7/libgnomeprint/modules/cups/gnome-print-cups-transport.c
+--- libgnomeprint-2.18.7.orig/libgnomeprint/modules/cups/gnome-print-cups-transport.c	2009-04-19 19:45:36.000000000 +0200
++++ libgnomeprint-2.18.7/libgnomeprint/modules/cups/gnome-print-cups-transport.c	2012-12-23 12:34:52.058643537 +0100
+@@ -35,6 +35,7 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#include <stdio.h>
+ #include <locale.h>
+ 
+ #include <cups/cups.h>
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
index c0ea12a..328da68 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
@@ -1,12 +1,16 @@
 LICENSE = "GPLv2"
 SECTION = "x11/gnome/libs"
 
+PR = "r1"
+
 DEPENDS = "libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome-common"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit pkgconfig gnome
 
+SRC_URI += "file://fix.includes.patch"
+
 SRC_URI[archive.md5sum] = "d66b81ee8aa3b3a33f5efc9a47ce07e3"
 SRC_URI[archive.sha256sum] = "8b34f81599423ef3da9c43775495da602f83cbbee069c9e760ffeae6aa4768e6"
 
-- 
1.8.0.2



