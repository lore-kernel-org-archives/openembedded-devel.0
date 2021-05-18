Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10116.1621351052476806757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 08:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40576 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lj1TM-0007X5-RB; Tue, 18 May 2021 18:17:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] surf: Upgrade 2.0 -> 2.1
Date: Tue, 18 May 2021 18:17:22 +0300
Message-Id: <20210518151722.13739-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgade Surf browser to release 2.1:

- Remove accelerated canvas parameter
- Remove external plugin handling

License-Update: Update contributors in file LICENSE

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...01-config.mk-Fix-compiler-and-linker.patch | 35 ++++++-------------
 .../surf/{surf_2.0.bb => surf_2.1.bb}         |  6 ++--
 2 files changed, 14 insertions(+), 27 deletions(-)
 rename meta-oe/recipes-graphics/surf/{surf_2.0.bb => surf_2.1.bb} (75%)

diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
index fb90432eac..93f1a9f42e 100644
--- a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
+++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
@@ -1,41 +1,28 @@
-From e97bb73851f5bbd94260da553a222526485cdfb1 Mon Sep 17 00:00:00 2001
+From 9de4f5fa81891e14e205fe61e1408f1218369e55 Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Fri, 15 Nov 2019 18:24:42 +0000
+Date: Tue, 18 May 2021 15:03:22 +0000
 Subject: [PATCH] config.mk: Fix compiler and linker
 
-Do not set explicitly compiler and linker.
+Fix LIBS
 
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- config.mk | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+ config.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/config.mk b/config.mk
-index df6e812..5deb991 100644
+index 2eb9fb0..032bf9f 100644
 --- a/config.mk
 +++ b/config.mk
-@@ -15,17 +15,17 @@ GTKINC = `pkg-config --cflags gtk+-3.0 webkit2gtk-4.0`
- GTKLIB = `pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
+@@ -19,7 +19,7 @@ WEBEXTLIBS = `pkg-config --libs webkit2gtk-4.0 webkit2gtk-web-extension-4.0 gio-
  
  # includes and libs
--INCS = -I. -I/usr/include -I${X11INC} ${GTKINC}
--LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 ${GTKLIB} -lgthread-2.0
-+INCS = ${GTKINC}
+ INCS = $(X11INC) $(GTKINC)
+-LIBS = $(X11LIB) $(GTKLIB) -lgthread-2.0
 +LIBS = -lc -lX11 ${GTKLIB} -lgthread-2.0
  
  # flags
- CPPFLAGS = -DVERSION=\"${VERSION}\" -DWEBEXTDIR=\"${LIBPREFIX}\" -D_DEFAULT_SOURCE
- CFLAGS = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
--LDFLAGS = -s ${LIBS}
-+LDFLAGS = ${LIBS}
- 
- # Solaris
- #CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
- #LDFLAGS = ${LIBS}
- 
- # compiler and linker
--CC = cc
-+CC ?= cc
+ CPPFLAGS = -DVERSION=\"$(VERSION)\" -DGCR_API_SUBJECT_TO_CHANGE \
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-oe/recipes-graphics/surf/surf_2.1.bb
similarity index 75%
rename from meta-oe/recipes-graphics/surf/surf_2.0.bb
rename to meta-oe/recipes-graphics/surf/surf_2.1.bb
index 989730186a..307ee9b981 100644
--- a/meta-oe/recipes-graphics/surf/surf_2.0.bb
+++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
@@ -3,16 +3,16 @@ DESCRIPTION = "Simple open source web browser based on WebKit2/GTK"
 HOMEPAGE = "https://surf.suckless.org/"
 SECTION = "x11/graphics"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2a6f86d002ae9ae1eb1ccc466289f146"
 
-DEPENDS = "webkitgtk gtk+3 glib-2.0"
+DEPENDS = "webkitgtk gtk+3 glib-2.0 gcr"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
            file://0001-config.mk-Fix-compiler-and-linker.patch \
 "
-SRCREV = "b814567e2bf8bda07cea8de1c7a062f4aa437b65"
+SRCREV = "bcd7d74e613fb8af11b40c351f0a6c1a771b2d2b"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

