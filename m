Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43A796C56B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Feb 2019 23:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id BAC7F181DE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 00:56:00 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Z_vN1bXKBiyF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 00:55:59 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1F202181C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 00:55:59 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1AAB1A060
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 00:55:58 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E64641A05C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 00:55:58 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 00:55:58 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id DA9272C1C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 00:55:58 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x1ANtvZD002116
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 00:55:57 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x1ANtvYM002115
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2019 00:55:57 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2019 00:55:55 +0100
Message-Id: <20190210235555.2070-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] atop: Update to 2.4
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
X-List-Received-Date: Sun, 10 Feb 2019 23:56:00 -0000

* Remove 0001-add-sys-sysmacros.h-for-major-minor-macros.patch as it
  is no longer needed.
* Update the remaining patches to avoid fuzz.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...dd-sys-sysmacros.h-for-major-minor-macros.patch | 26 -------------------
 .../atop/atop/fix-permissions.patch                | 29 ++++++++++++++--------
 .../atop/atop/remove-bashisms.patch                | 20 ++++++++++-----
 .../atop/atop/sysvinit-implement-status.patch      | 11 ++++++--
 .../atop/{atop_2.3.0.bb => atop_2.4.0.bb}          |  7 +++---
 5 files changed, 44 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-support/atop/atop/0001-add-sys-sysmacros.h-for-major-minor-macros.patch
 rename meta-oe/recipes-support/atop/{atop_2.3.0.bb => atop_2.4.0.bb} (89%)

diff --git a/meta-oe/recipes-support/atop/atop/0001-add-sys-sysmacros.h-for-major-minor-macros.patch b/meta-oe/recipes-support/atop/atop/0001-add-sys-sysmacros.h-for-major-minor-macros.patch
deleted file mode 100644
index 564606197..000000000
--- a/meta-oe/recipes-support/atop/atop/0001-add-sys-sysmacros.h-for-major-minor-macros.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 13f3771655f859d5e0332dd65b9c43f572f6359d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Aug 2018 16:02:06 -0700
-Subject: [PATCH] add sys/sysmacros.h for major/minor macros
-
-photosyst.c:1465:19: error: called object 'major' is not a function or function pointer
-     dmp->major  = major(statbuf.st_rdev);
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- photosyst.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/photosyst.c b/photosyst.c
-index 38828ec..caed352 100644
---- a/photosyst.c
-+++ b/photosyst.c
-@@ -152,6 +152,7 @@
- static const char rcsid[] = "$Id: photosyst.c,v 1.38 2010/11/19 07:40:40 gerlof Exp $";
- 
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <stdio.h>
- #include <string.h>
- #include <unistd.h>
diff --git a/meta-oe/recipes-support/atop/atop/fix-permissions.patch b/meta-oe/recipes-support/atop/atop/fix-permissions.patch
index ee7419993..8488b3800 100644
--- a/meta-oe/recipes-support/atop/atop/fix-permissions.patch
+++ b/meta-oe/recipes-support/atop/atop/fix-permissions.patch
@@ -1,15 +1,22 @@
-Update permissions of executable files that remove setuid bit and make everyone
-could read.
+From d9498d10d0e8241749835dbc9fa229465d4fdfd7 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 6 Feb 2019 13:58:04 +0000
+Subject: [PATCH] Fix permissions
 
-Upstream-Status: Inappropriate [embedded specific]
+Update permissions of executable files that remove setuid bit and make
+everyone could read.
 
+Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
+ Makefile | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
 diff --git a/Makefile b/Makefile
-index a65b9b6..21d9828 100644
+index 3bf5929..1221ee4 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -66,7 +66,7 @@ systemdinstall:	genericinstall
+@@ -72,7 +72,7 @@ systemdinstall:	genericinstall
  		chmod 0644            $(DESTDIR)$(SYSDPATH)/atopacct.service
  		cp atop.cronsystemd   $(DESTDIR)$(CRNPATH)/atop
  		cp atop-pm.sh         $(DESTDIR)$(PMPATHD)
@@ -18,7 +25,7 @@ index a65b9b6..21d9828 100644
  		#
  		# only when making on target system:
  		#
-@@ -91,11 +91,11 @@ sysvinstall:	genericinstall
+@@ -97,11 +97,11 @@ sysvinstall:	genericinstall
  		#
  		if [   -d $(DESTDIR)$(PMPATH1) ]; 			\
  		then	cp 45atoppm $(DESTDIR)$(PMPATH1); 		\
@@ -32,7 +39,7 @@ index a65b9b6..21d9828 100644
  		fi
  		#
  		#
-@@ -139,7 +139,7 @@ genericinstall:	atop atopacctd
+@@ -145,7 +145,7 @@ genericinstall:	atop atopacctd atopconvert
  		#
  		cp atop   		$(DESTDIR)$(BINPATH)/atop
  		chown root		$(DESTDIR)$(BINPATH)/atop
@@ -41,12 +48,12 @@ index a65b9b6..21d9828 100644
  		ln -sf atop             $(DESTDIR)$(BINPATH)/atopsar
  		cp atopacctd  		$(DESTDIR)$(SBINPATH)/atopacctd
  		chown root		$(DESTDIR)$(SBINPATH)/atopacctd
-@@ -147,7 +147,7 @@ genericinstall:	atop atopacctd
- 		cp atop   		$(DESTDIR)$(BINPATH)/atop-$(VERS)
- 		ln -sf atop-$(VERS)     $(DESTDIR)$(BINPATH)/atopsar-$(VERS)
+@@ -159,7 +159,7 @@ genericinstall:	atop atopacctd atopconvert
+ 		chown root		$(DESTDIR)$(BINPATH)/atopconvert
+ 		chmod 0711 		$(DESTDIR)$(BINPATH)/atopconvert
  		cp atop.daily    	$(DESTDIR)$(SCRPATH)
 -		chmod 0711 	 	$(DESTDIR)$(SCRPATH)/atop.daily
 +		chmod 0755 	 	$(DESTDIR)$(SCRPATH)/atop.daily
  		cp man/atop.1    	$(DESTDIR)$(MAN1PATH)
  		cp man/atopsar.1 	$(DESTDIR)$(MAN1PATH)
- 		cp man/atoprc.5  	$(DESTDIR)$(MAN5PATH)
+ 		cp man/atopconvert.1 	$(DESTDIR)$(MAN1PATH)
diff --git a/meta-oe/recipes-support/atop/atop/remove-bashisms.patch b/meta-oe/recipes-support/atop/atop/remove-bashisms.patch
index f1fcbfed7..2aa3b2db4 100644
--- a/meta-oe/recipes-support/atop/atop/remove-bashisms.patch
+++ b/meta-oe/recipes-support/atop/atop/remove-bashisms.patch
@@ -1,7 +1,15 @@
-Upstream-Status: Inappropriate [embedded specific]
+From 71c377a37d3505a9eaaf26b952d48cffd7411f3b Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 6 Feb 2019 13:58:04 +0000
+Subject: [PATCH] Remove bashisms
 
+Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
+ atop-pm.sh | 2 +-
+ atop.daily | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
 diff --git a/atop-pm.sh b/atop-pm.sh
 index 7f41a86..3ff4ab5 100755
 --- a/atop-pm.sh
@@ -13,18 +21,18 @@ index 7f41a86..3ff4ab5 100755
  case "$1" in
  	pre)	/usr/bin/systemctl stop atop
 diff --git a/atop.daily b/atop.daily
-index 24d33bd..f29bd94 100755
+index 57a9507..ec58d7f 100755
 --- a/atop.daily
 +++ b/atop.daily
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  
- CURDAY=`date +%Y%m%d`
- LOGPATH=/var/log/atop
-@@ -16,7 +16,7 @@ then
+ LOGOPTS="-R"				# default options
+ LOGINTERVAL=600				# default interval in seconds
+@@ -38,7 +38,7 @@ then
  
- 	while ps -p `cat $PIDFILE` > /dev/null
+ 	while ps -p `cat "$PIDFILE"` > /dev/null
  	do
 -		let CNT+=1
 +		CNT=$((CNT+1))
diff --git a/meta-oe/recipes-support/atop/atop/sysvinit-implement-status.patch b/meta-oe/recipes-support/atop/atop/sysvinit-implement-status.patch
index 5994d3e08..1145a2493 100644
--- a/meta-oe/recipes-support/atop/atop/sysvinit-implement-status.patch
+++ b/meta-oe/recipes-support/atop/atop/sysvinit-implement-status.patch
@@ -1,11 +1,18 @@
+From bdd068873ed0979027c21773939bdb18046a8756 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 6 Feb 2019 13:58:04 +0000
+Subject: [PATCH] sysvinit: Implement status
+
 Implement the sub-command status.
 
 Upstream-Status: Pending
-
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
+ atop.init | 3 +++
+ 1 file changed, 3 insertions(+)
+
 diff --git a/atop.init b/atop.init
-index 108bdc5..9f89fad 100755
+index e6e11dc..e7b226d 100755
 --- a/atop.init
 +++ b/atop.init
 @@ -18,6 +18,8 @@
diff --git a/meta-oe/recipes-support/atop/atop_2.3.0.bb b/meta-oe/recipes-support/atop/atop_2.4.0.bb
similarity index 89%
rename from meta-oe/recipes-support/atop/atop_2.3.0.bb
rename to meta-oe/recipes-support/atop/atop_2.4.0.bb
index 302813c2e..89e0eba36 100644
--- a/meta-oe/recipes-support/atop/atop_2.3.0.bb
+++ b/meta-oe/recipes-support/atop/atop_2.4.0.bb
@@ -20,10 +20,9 @@ SRC_URI = "http://www.atoptool.nl/download/${BP}.tar.gz \
            file://remove-bashisms.patch \
            file://fix-permissions.patch \
            file://sysvinit-implement-status.patch \
-           file://0001-add-sys-sysmacros.h-for-major-minor-macros.patch \
            "
-SRC_URI[md5sum] = "48e1dbef8c7d826e68829a8d5fc920fc"
-SRC_URI[sha256sum] = "73e4725de0bafac8c63b032e8479e2305e3962afbe977ec1abd45f9e104eb264"
+SRC_URI[md5sum] = "1077da884ed94f2bc3c81ac3ab970436"
+SRC_URI[sha256sum] = "be1c010a77086b7d98376fce96514afcd73c3f20a8d1fe01520899ff69a73d69"
 
 do_compile() {
     oe_runmake all
@@ -49,7 +48,7 @@ do_install() {
 
 inherit systemd
 
-SYSTEMD_SERVICE_${PN} = "atop.service"
+SYSTEMD_SERVICE_${PN} = "atop.service atopgpu.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 FILES_${PN} += "${systemd_unitdir}/system-sleep"
-- 
2.12.0


