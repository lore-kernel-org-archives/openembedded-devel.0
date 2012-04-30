Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkKk-0004Uh-7g
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:43:42 +0200
Received: by wibhm17 with SMTP id hm17so2032732wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=S0jEk7SUUaj/e2x0lNZlliKi3TejJoRcyG5QqJ6iaRA=;
	b=tdvO9D0sIGM45uoJvo13voR59n41bwk6zucN8DdgCImB6IQnJdIcyRyRhUmKILpf3c
	esEVclExsfdbKeGX54sHLS3Ke9WMJsh6r5AJvHoELsDSjzzY81UOkWDxbcu8gbrq4jq3
	YndD4lkYeYB5KL4AhLnA8eBEMbJ6ljztBgecC0Evj7fKGwu530okYA0cPY8o4bh6qr/X
	LWQTXB7F8mJJyqPDFfQoWnDLF347Z1JiXPStGyHBoC9ngzn+rZBH96DBFKKxfTq7/3aZ
	paDHyKXHw+KbajkeLNQw6Xq2gvniTEt0CiXZiV5ZUBVGFpWZr0fKmawXeVASjuGVVxVb
	MclA==
Received: by 10.180.78.164 with SMTP id c4mr11277822wix.10.1335767640938;
	Sun, 29 Apr 2012 23:34:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 6sm26404677wiz.1.2012.04.29.23.33.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:34:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:02 +0200
Message-Id: <cf4979889002b5ee146c185d499cd25e68be91a8.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/16] gpsd-3.4: fix DSO build correctly
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
X-List-Received-Date: Mon, 30 Apr 2012 06:43:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...t-fix-DSO-build-for-ntpshm-garmin_monitor.patch |   41 ++++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |    4 +-
 2 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch
new file mode 100644
index 0000000..1aa4304
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch
@@ -0,0 +1,41 @@
+From e1f780fc2355c22c2c3f0a70c1a1ef2669779c53 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 24 Apr 2012 13:42:38 +0200
+Subject: [PATCH] SConstruct: fix DSO build for ntpshm, garmin_monitor
+
+| x86_64-oe-linux-gcc -m64
+--sysroot=/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -o gpsmon
+--sysroot=/OE/shr-core/tmp-eglibc/sysroots/qemux86-64
+-Wl,-rpath=/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/gpsd/gpsd-3.4-r2/gpsd-3.4
+-Wl,-rpath=/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib gpsmon.o
+monitor_italk.o monitor_nmea.o monitor_oncore.o monitor_sirf.o
+monitor_superstar2.o monitor_tnt.o monitor_ubx.o monitor_garmin.o -L.
+-L/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib
+-L/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/lib -lrt -lbluetooth
+-lgpsd -lusb-1.0 -lbluetooth -lgps -lncurses -ltinfo
+
+/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/4.6.4/ld:
+* ntpshm.o: undefined reference to symbol 'log@@GLIBC_2.2.5'
+* monitor_garmin.o: undefined reference to symbol 'hypot@@GLIBC_2.2.5'
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ SConstruct |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 7bd44a1..9ff00c1 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -806,7 +806,7 @@ if qt_env:
+ # The libraries have dependencies on system libraries
+ 
+ gpslibs = ["-lgps"]
+-gpsdlibs = ["-lgpsd"] + usblibs + bluezlibs + gpslibs
++gpsdlibs = ["-lgpsd"] + ["-lm"] + usblibs + bluezlibs + gpslibs
+ 
+ # Source groups
+ 
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 9584e55..bb79368 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -6,6 +6,7 @@ DEPENDS = "dbus dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
+  file://0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch \
   file://gpsd-default \
   file://gpsd \
   file://gpsd.socket \
@@ -23,12 +24,9 @@ INITSCRIPT_PARAMS = "defaults 35"
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "${PN}.socket"
 
-LDFLAGS += "-L${STAGING_LIBDIR} -lm"
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-CC += "${LDFLAGS}"
-
 EXTRA_OESCONS = " \
   libQgpsmm='false' \
   debug='true' \
-- 
1.7.8.6



