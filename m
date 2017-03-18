Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D30D577B27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Mar 2017 00:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 19B7D1832F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:22:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lQxhBlnSshbL
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:21:58 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C9B1218095
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:21:58 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FEB21A065
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:21:58 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94B6F1A040
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:21:58 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:21:58 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 86D4D1065
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:21:58 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2I0LwOW002715
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:21:58 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2I0LwVd002702
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Mar 2017 01:21:58 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Mar 2017 01:21:57 +0100
Message-Id: <20170318002157.2377-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] lvm2: Avoid an unnecessary dependency on bash
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
X-List-Received-Date: Sat, 18 Mar 2017 00:22:00 -0000

Rather than having the lvm2 package depend on bash, modify the init
scripts it may contain to use /bin/sh instead of /bin/bash.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc              |   2 +-
 .../lvm2/0001-Avoid-bashisms-in-init-scripts.patch | 182 +++++++++++++++++++++
 2 files changed, 183 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms-in-init-scripts.patch

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 3e795525f..75fc51f8d 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -12,6 +12,7 @@ SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
            file://0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch \
            file://0004-tweak-MODPROBE_CMD-for-cross-compile.patch \
+           file://0001-Avoid-bashisms-in-init-scripts.patch \
            "
 S = "${WORKDIR}/LVM2.${PV}"
 
@@ -98,7 +99,6 @@ FILES_libdevmapper-dev = " \
 "
 
 RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
-RDEPENDS_${PN} = " bash"
 RDEPENDS_libdevmapper-dev = "libdevmapper (= ${EXTENDPKGV})"
 RRECOMMENDS_${PN} = "${PN}-scripts (= ${EXTENDPKGV})"
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms-in-init-scripts.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms-in-init-scripts.patch
new file mode 100644
index 000000000..e86ab25e6
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-Avoid-bashisms-in-init-scripts.patch
@@ -0,0 +1,182 @@
+From 916ea0c70fd063ab7b81f16fd917a75dc02edf4f Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Fri, 17 Mar 2017 03:18:28 +0100
+Subject: [PATCH] Avoid bashisms in init scripts
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ scripts/blk_availability_init_red_hat.in      | 4 ++--
+ scripts/clvmd_init_red_hat.in                 | 6 +++---
+ scripts/cmirrord_init_red_hat.in              | 4 ++--
+ scripts/lvm2_cluster_activation_red_hat.sh.in | 4 ++--
+ scripts/lvm2_lvmetad_init_red_hat.in          | 4 ++--
+ scripts/lvm2_lvmpolld_init_red_hat.in         | 4 ++--
+ scripts/lvm2_monitoring_init_red_hat.in       | 4 ++--
+ scripts/lvm2_monitoring_init_rhel4            | 4 ++--
+ 8 files changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/scripts/blk_availability_init_red_hat.in b/scripts/blk_availability_init_red_hat.in
+index a84ffe7..6b855b7 100644
+--- a/scripts/blk_availability_init_red_hat.in
++++ b/scripts/blk_availability_init_red_hat.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
+ #
+@@ -53,6 +53,6 @@ case "$1" in
+   status)
+ 	;;
+   *)
+-	echo $"Usage: $0 {start|stop|status}"
++	echo "Usage: $0 {start|stop|status}"
+ 	;;
+ esac
+diff --git a/scripts/clvmd_init_red_hat.in b/scripts/clvmd_init_red_hat.in
+index d7f3392..abc8011 100644
+--- a/scripts/clvmd_init_red_hat.in
++++ b/scripts/clvmd_init_red_hat.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # clvmd - Clustered LVM Daemon init script
+ #
+@@ -161,7 +161,7 @@ restart() {
+ 	fi
+ }
+ 
+-[ "$EUID" != "0" ] && {
++[ "$(id -u)" != "0" ] && {
+ 	echo "clvmd init script can only be executed as root user"
+ 	exit 4
+ }
+@@ -206,7 +206,7 @@ case "$1" in
+ 	;;
+ 
+   *)
+-	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
++	echo "Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
+ 	rtrn=2
+ 	;;
+ esac
+diff --git a/scripts/cmirrord_init_red_hat.in b/scripts/cmirrord_init_red_hat.in
+index d4b7e37..d442cbc 100755
+--- a/scripts/cmirrord_init_red_hat.in
++++ b/scripts/cmirrord_init_red_hat.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # chkconfig: - 22 78
+ # description: Starts and stops cmirrord
+@@ -101,7 +101,7 @@ case "$1" in
+ 		;;
+ 
+ 	*)
+-		echo $"Usage: $0 {start|stop|restart|status}"
++		echo "Usage: $0 {start|stop|restart|status}"
+ 		;;
+ esac
+ 
+diff --git a/scripts/lvm2_cluster_activation_red_hat.sh.in b/scripts/lvm2_cluster_activation_red_hat.sh.in
+index abea026..d8cba2e 100644
+--- a/scripts/lvm2_cluster_activation_red_hat.sh.in
++++ b/scripts/lvm2_cluster_activation_red_hat.sh.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ sbindir=@sbindir@
+ 
+@@ -54,7 +54,7 @@ case "$1" in
+ 	rtrn=$?
+ 	;;
+   *)
+-	echo $"Usage: $0 {activate|deactivate}"
++	echo "Usage: $0 {activate|deactivate}"
+ 	rtrn=3
+ 	;;
+ esac
+diff --git a/scripts/lvm2_lvmetad_init_red_hat.in b/scripts/lvm2_lvmetad_init_red_hat.in
+index b2f5d50..96269a9 100644
+--- a/scripts/lvm2_lvmetad_init_red_hat.in
++++ b/scripts/lvm2_lvmetad_init_red_hat.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
+ #
+@@ -105,7 +105,7 @@ case "$1" in
+ 	;;
+ 
+   *)
+-	echo $"Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
++	echo "Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
+ 	;;
+ esac
+ 
+diff --git a/scripts/lvm2_lvmpolld_init_red_hat.in b/scripts/lvm2_lvmpolld_init_red_hat.in
+index c521955..cdbaece 100644
+--- a/scripts/lvm2_lvmpolld_init_red_hat.in
++++ b/scripts/lvm2_lvmpolld_init_red_hat.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # Copyright (C) 2015 Red Hat, Inc. All rights reserved.
+ #
+@@ -107,7 +107,7 @@ case "$1" in
+ 	;;
+ 
+   *)
+-	echo $"Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
++	echo "Usage: $0 {start|stop|force-stop|restart|condrestart|try-restart|status}"
+ 	;;
+ esac
+ 
+diff --git a/scripts/lvm2_monitoring_init_red_hat.in b/scripts/lvm2_monitoring_init_red_hat.in
+index de7ff0d..9ff6bb7 100644
+--- a/scripts/lvm2_monitoring_init_red_hat.in
++++ b/scripts/lvm2_monitoring_init_red_hat.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # Copyright (C) 2007-2009 Red Hat, Inc. All rights reserved.
+ #
+@@ -128,7 +128,7 @@ case "$1" in
+ 	;;
+ 
+   *)
+-	echo $"Usage: $0 {start|stop|restart|status|force-stop}"
++	echo "Usage: $0 {start|stop|restart|status|force-stop}"
+ 	;;
+ esac
+ 
+diff --git a/scripts/lvm2_monitoring_init_rhel4 b/scripts/lvm2_monitoring_init_rhel4
+index 8eb06c5..2e8d0f7 100644
+--- a/scripts/lvm2_monitoring_init_rhel4
++++ b/scripts/lvm2_monitoring_init_rhel4
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # Copyright (C) 2007 Red Hat, Inc. All rights reserved.
+ #
+@@ -93,7 +93,7 @@ case "$1" in
+ 	;;
+ 
+   *)
+-	echo $"Usage: $0 {start|stop|restart|status|force-stop}"
++	echo "Usage: $0 {start|stop|restart|status|force-stop}"
+ 	;;
+ esac
+ 
+-- 
+2.12.0
+
-- 
2.12.0


