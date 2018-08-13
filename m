Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3617060291
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:05 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id f1-v6so7184069pgq.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lPnd7VuE2NqVvBFaGoOZkFBuBztvCeeUwvpsWofO5rE=;
	b=MYl0ZNG3EKEgJF7MTzkB4NtIf3N+wu35CfPOvcQ5XKoxTOVXiY4HwsuHoMrAdhIMMV
	JpJ8jlxYpP595UCWdzWTLPEQhi+nNEW22H3qxK5IQps54IkRJXVXo3NQKNybJZU5EqTm
	BS8LBGovtg9234sgPXp4OwDFTfwh+QSZrLpU+1VMfB3Y6eXU4zlpjymln0NLjWhhxm5h
	vhCbgavWU68DBhlSFfonELyRp5kO4BjUgNIY7Ndpp74muQImjoWzAr9P41DmWWABq1on
	tyC//e7c/zFKEOF0831PL4kKSVHFmE6xmUkOUoBuxAAs6d+3w0sdBCBgnjjkQWQ9IELd
	Qv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lPnd7VuE2NqVvBFaGoOZkFBuBztvCeeUwvpsWofO5rE=;
	b=H92uA29HgEw6V/AV2CHnCDyery9190WqFHdIgc0gPX5RckTzi2GJOhjlDSTkrcUeby
	d0qYr12zZ5wZlZbl+iUq8cvVIl8l+jjO0FEkPkerQoDz+7RW+nZGYFQB8TU63JB51AYg
	k26Jqq1TGGWWZfg6eHGuJd/wNxGz2fU3RwZk7U4OYuFNBsrhTp6RYPotDjRXMusdbTFu
	Qf70Lpnuz6opBfWbLCWKyLhbZWwewLcvXEeq5GnjoV0AG0xbqm2nU9CeD+UbtIOurTAa
	TiwW9/ZCiJ6S3IC/s7YETIadcMrjyhHhkxlG2u9AgkY0Z0lkOHekUiTTOiKxATNMnsiZ
	W16Q==
X-Gm-Message-State: AOUpUlE69O46nAK/W7MD5RuO3BmnuLj/kXZUIBNyXIamZk+c8HV8PjHV
	fC00VRhPIatJaGIzXOvM/dQb7W0r
X-Google-Smtp-Source: AA+uWPzwHTKnm/LiaInLk+Wrmp1EX2HiyqM4/xVB8cbQ7ICLCheGIxbUFZTJm748sgXDkz/2/wPsXw==
X-Received: by 2002:a62:1449:: with SMTP id
	70-v6mr18051341pfu.222.1534148285901; 
	Mon, 13 Aug 2018 01:18:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:33 -0700
Message-Id: <20180813081742.6961-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/21] atop: Upgrade to 2.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 08:18:05 -0000

Drop already upstreamed patch
Fix build with glibc 2.28+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-sysmacros.h-for-major-minor-macros.patch | 26 +++++
 .../0001-include-missing-header-files.patch   | 97 -------------------
 .../atop/{atop_2.2.3.bb => atop_2.3.0.bb}     | 28 +++---
 3 files changed, 37 insertions(+), 114 deletions(-)
 create mode 100644 meta-oe/recipes-support/atop/atop/0001-add-sys-sysmacros.h-for-major-minor-macros.patch
 delete mode 100644 meta-oe/recipes-support/atop/atop/0001-include-missing-header-files.patch
 rename meta-oe/recipes-support/atop/{atop_2.2.3.bb => atop_2.3.0.bb} (69%)

diff --git a/meta-oe/recipes-support/atop/atop/0001-add-sys-sysmacros.h-for-major-minor-macros.patch b/meta-oe/recipes-support/atop/atop/0001-add-sys-sysmacros.h-for-major-minor-macros.patch
new file mode 100644
index 0000000000..5646061971
--- /dev/null
+++ b/meta-oe/recipes-support/atop/atop/0001-add-sys-sysmacros.h-for-major-minor-macros.patch
@@ -0,0 +1,26 @@
+From 13f3771655f859d5e0332dd65b9c43f572f6359d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Aug 2018 16:02:06 -0700
+Subject: [PATCH] add sys/sysmacros.h for major/minor macros
+
+photosyst.c:1465:19: error: called object 'major' is not a function or function pointer
+     dmp->major  = major(statbuf.st_rdev);
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ photosyst.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/photosyst.c b/photosyst.c
+index 38828ec..caed352 100644
+--- a/photosyst.c
++++ b/photosyst.c
+@@ -152,6 +152,7 @@
+ static const char rcsid[] = "$Id: photosyst.c,v 1.38 2010/11/19 07:40:40 gerlof Exp $";
+ 
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
diff --git a/meta-oe/recipes-support/atop/atop/0001-include-missing-header-files.patch b/meta-oe/recipes-support/atop/atop/0001-include-missing-header-files.patch
deleted file mode 100644
index 3708f60ba0..0000000000
--- a/meta-oe/recipes-support/atop/atop/0001-include-missing-header-files.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 7b651793269b6b86f12c43c30b751b86def27222 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 18 Mar 2017 17:56:40 -0700
-Subject: [PATCH] include missing header files
-
-fixes build with musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- deviate.c     | 1 +
- procdbase.c   | 2 +-
- showgeneric.c | 2 +-
- showlinux.c   | 2 +-
- showprocs.c   | 2 +-
- showsys.c     | 2 +-
- 6 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/deviate.c b/deviate.c
-index 7cf1b49..8e615af 100644
---- a/deviate.c
-+++ b/deviate.c
-@@ -178,6 +178,7 @@ static const char rcsid[] = "$Id: deviate.c,v 1.45 2010/10/23 14:02:03 gerlof Ex
- #include <stdio.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <stdlib.h>
- #include <unistd.h>
- #include <limits.h>
- #include <memory.h>
-diff --git a/procdbase.c b/procdbase.c
-index 9cab347..0487d26 100644
---- a/procdbase.c
-+++ b/procdbase.c
-@@ -67,7 +67,7 @@ static const char rcsid[] = "$Id: procdbase.c,v 1.8 2010/04/23 12:19:35 gerlof E
- #include <fcntl.h>
- #include <unistd.h>
- #include <string.h>
--#include <malloc.h>
-+#include <stdlib.h>
- 
- #include "atop.h"
- #include "photoproc.h"
-diff --git a/showgeneric.c b/showgeneric.c
-index 775afa8..3d5be0e 100644
---- a/showgeneric.c
-+++ b/showgeneric.c
-@@ -268,7 +268,7 @@ static const char rcsid[] = "$Id: showgeneric.c,v 1.71 2010/10/25 19:08:32 gerlo
- #include <errno.h>
- #include <fcntl.h>
- #include <string.h>
--#include <termio.h>
-+#include <termios.h>
- #include <unistd.h>
- #include <stdarg.h>
- #include <curses.h>
-diff --git a/showlinux.c b/showlinux.c
-index 6e60754..aba2ee6 100644
---- a/showlinux.c
-+++ b/showlinux.c
-@@ -274,7 +274,7 @@ static const char rcsid[] = "$Id: showlinux.c,v 1.70 2010/10/23 14:04:12 gerlof
- #include <string.h>
- #include <errno.h>
- #include <fcntl.h>
--#include <termio.h>
-+#include <termios.h>
- #include <unistd.h>
- #include <stdarg.h>
- #include <curses.h>
-diff --git a/showprocs.c b/showprocs.c
-index 5194524..f0169ad 100644
---- a/showprocs.c
-+++ b/showprocs.c
-@@ -94,7 +94,7 @@ static const char rcsid[] = "$Id: showprocs.c,v 1.15 2011/09/05 11:44:16 gerlof
- #include <string.h>
- #include <errno.h>
- #include <fcntl.h>
--#include <termio.h>
-+#include <termios.h>
- #include <unistd.h>
- #include <stdarg.h>
- #include <curses.h>
-diff --git a/showsys.c b/showsys.c
-index 26331be..5a05fe5 100644
---- a/showsys.c
-+++ b/showsys.c
-@@ -80,7 +80,7 @@ static const char rcsid[] = "XXXXXX";
- #include <string.h>
- #include <errno.h>
- #include <fcntl.h>
--#include <termio.h>
-+#include <termios.h>
- #include <unistd.h>
- #include <stdarg.h>
- #include <curses.h>
--- 
-2.12.0
-
diff --git a/meta-oe/recipes-support/atop/atop_2.2.3.bb b/meta-oe/recipes-support/atop/atop_2.3.0.bb
similarity index 69%
rename from meta-oe/recipes-support/atop/atop_2.2.3.bb
rename to meta-oe/recipes-support/atop/atop_2.3.0.bb
index 1ab9e7cf9e..302813c2ea 100644
--- a/meta-oe/recipes-support/atop/atop_2.2.3.bb
+++ b/meta-oe/recipes-support/atop/atop_2.3.0.bb
@@ -15,21 +15,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "ncurses zlib"
 
-ATOP_VER = "${@'-'.join(d.getVar('PV').rsplit('.', 1))}"
-
-SRC_URI = " \
-    http://www.atoptool.nl/download/${BPN}-${ATOP_VER}.tar.gz \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://volatiles.atop.conf', 'file://volatiles.99_atop', d)} \
-    file://0001-include-missing-header-files.patch \
-    file://remove-bashisms.patch \
-    file://fix-permissions.patch \
-    file://sysvinit-implement-status.patch \
-"
-
-SRC_URI[md5sum] = "034dc1544f2ec4e4d2c739d320dc326d"
-SRC_URI[sha256sum] = "c785b8a2355be28b3de6b58a8ea4c4fcab8fadeaa57a99afeb03c66fac8e055d"
-
-S = "${WORKDIR}/${BPN}-${ATOP_VER}"
+SRC_URI = "http://www.atoptool.nl/download/${BP}.tar.gz \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://volatiles.atop.conf', 'file://volatiles.99_atop', d)} \
+           file://remove-bashisms.patch \
+           file://fix-permissions.patch \
+           file://sysvinit-implement-status.patch \
+           file://0001-add-sys-sysmacros.h-for-major-minor-macros.patch \
+           "
+SRC_URI[md5sum] = "48e1dbef8c7d826e68829a8d5fc920fc"
+SRC_URI[sha256sum] = "73e4725de0bafac8c63b032e8479e2305e3962afbe977ec1abd45f9e104eb264"
 
 do_compile() {
     oe_runmake all
@@ -37,13 +31,13 @@ do_compile() {
 
 do_install() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        make DESTDIR=${D} VERS=${ATOP_VER} SYSDPATH=${systemd_system_unitdir} \
+        make DESTDIR=${D} VERS=${PV} SYSDPATH=${systemd_system_unitdir} \
             PMPATHD=${systemd_unitdir}/system-sleep systemdinstall
         install -d ${D}${sysconfdir}/tmpfiles.d
         install -m 644 ${WORKDIR}/volatiles.atop.conf ${D}${sysconfdir}/tmpfiles.d/atop.conf
         rm -f ${D}${systemd_system_unitdir}/atopacct.service
     else
-        make DESTDIR=${D} VERS=${ATOP_VER} sysvinstall
+        make DESTDIR=${D} VERS=${PV} sysvinstall
         install -d ${D}${sysconfdir}/default/volatiles
         install -m 644 ${WORKDIR}/volatiles.99_atop ${D}${sysconfdir}/default/volatiles/99_atop
         rm -f ${D}${sysconfdir}/init.d/atopacct
-- 
2.18.0


