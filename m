Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 056D77CF1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 05:50:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5J5o9tt011548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 22:50:47 -0700
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 18 Jun 2019 22:50:05 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Jun 2019 13:50:03 +0800
Message-ID: <1560923403-21694-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-networking][PATCH] snort: upgrade 2.9.11.1 -> 2.9.13
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
X-List-Received-Date: Wed, 19 Jun 2019 05:50:57 -0000
Content-Type: text/plain

* Add PACKAGECONFIG[appid] for application identification support.

* Set the variables 'have_daq_packet_trace' and
  'have_daq_verdict_reason' to 'no' since they are only supported in daq
  2.2.2 but not in 2.0.6.

* Cleanup snort.init script and fix the incorrect argument of mkdir

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...le-run-test-program-while-cross-compiling.patch |  4 +-
 .../recipes-connectivity/snort/snort/snort.init    | 53 +++++++++++-----------
 .../snort/{snort_2.9.11.1.bb => snort_2.9.13.bb}   |  5 +-
 3 files changed, 32 insertions(+), 30 deletions(-)
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.11.1.bb => snort_2.9.13.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch b/meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch
index 037962f..30ec174 100644
--- a/meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch
+++ b/meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch
@@ -226,7 +226,7 @@ index 4b3a5db..a6c5498 100644
 -]])],
 -[have_daq_packet_trace="yes"],
 -[have_daq_packet_trace="no"])
-+have_daq_packet_trace="yes"
++have_daq_packet_trace="no"
  AC_MSG_RESULT($have_daq_packet_trace)
  if test "x$have_daq_packet_trace" = "xyes"; then
      AC_DEFINE([HAVE_DAQ_PKT_TRACE],[1],
@@ -245,7 +245,7 @@ index 4b3a5db..a6c5498 100644
 -]])],
 -[have_daq_verdict_reason="yes"],
 -[have_daq_verdict_reason="no"])
-+have_daq_verdict_reason="yes"
++have_daq_verdict_reason="no"
  AC_MSG_RESULT($have_daq_verdict_reason)
  if test "x$have_daq_verdict_reason" = "xyes"; then
      AC_DEFINE([HAVE_DAQ_VERDICT_REASON],[1],
diff --git a/meta-networking/recipes-connectivity/snort/snort/snort.init b/meta-networking/recipes-connectivity/snort/snort/snort.init
index d8a00c4..0d90c9a 100644
--- a/meta-networking/recipes-connectivity/snort/snort/snort.init
+++ b/meta-networking/recipes-connectivity/snort/snort/snort.init
@@ -1,6 +1,6 @@
 #!/bin/sh
 #
-#   Snort Startup Script modified for OpenEmbedded
+# Snort Startup Script modified for OpenEmbedded
 #
 
 # Script variables
@@ -30,16 +30,16 @@ fi
 
 start()
 {
-
     [ -n "$LAN_INTERFACE" ] || return 0
     # Check if log diratory is present. Otherwise, create it.
     if [ ! -d $LOGDIR/$DATE ]; then
-        mkdir -d $LOGDIR/$DATE
+        mkdir -p $LOGDIR/$DATE
         /bin/chown -R $USER:$USER $LOGDIR/$DATE
-    /bin/chmod -R 700 $LOGDIR/$DATE
+        /bin/chmod -R 700 $LOGDIR/$DATE
     fi
 
     /bin/echo "Starting $PROG: "
+
     # Snort parameters
     # -D Run Snort in background (daemon) mode
     # -i <if> Listen on interface <if>
@@ -64,7 +64,7 @@ stop()
         RETURN_VAL=$?
         /bin/echo "$PROG shutdown complete."
         [ -e $DEL_PID ] && rm -f $DEL_PID
-    [ -e $DEL_PID.lck ] && rm -f $DEL_PID.lck
+        [ -e $DEL_PID.lck ] && rm -f $DEL_PID.lck
     else
         /bin/echo "ERROR: PID in $PID file not found."
         RETURN_VAL=1
@@ -72,12 +72,13 @@ stop()
     return $RETURN_VAL
 }
 
-status() {
-        if [ -s $PID ]; then
-                echo "$PROG is running as pid `cat $PID`:"
-        else
-                echo "$PROG is not running."
-        fi
+status()
+{
+    if [ -s $PID ]; then
+        echo "$PROG is running as pid `cat $PID`:"
+    else
+        echo "$PROG is not running."
+    fi
 }
 
 restart()
@@ -89,21 +90,21 @@ restart()
 }
 
 case "$1" in
- start)
-       start
-    ;;
- stop)
-       stop
-    ;;
- status)
-       status
-    ;;
- restart|reload)
-       restart
-    ;;
- *)
-    /bin/echo "Usage: $0 {start|stop|status|restart|reload}"
-    RETURN_VAL=1
+    start)
+        start
+        ;;
+    stop)
+        stop
+        ;;
+    status)
+        status
+        ;;
+    restart|reload)
+        restart
+        ;;
+    *)
+        /bin/echo "Usage: $0 {start|stop|status|restart|reload}"
+        RETURN_VAL=1
 esac
 
 exit $RETURN_VAL
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.13.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.13.bb
index c2eb95f..1b10dbd 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.13.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://disable-run-test-program-while-cross-compiling.patch \
 "
 
-SRC_URI[md5sum] = "378e3938b2b5c8e358f942d0ffce18cc"
-SRC_URI[sha256sum] = "9f6b3aeac5a109f55504bd370564ac431cb1773507929dc461626898f33f46cd"
+SRC_URI[md5sum] = "b61ae846af022018b05511076baad60c"
+SRC_URI[sha256sum] = "31447393d15286b848810dd78ab2cb3ad231fcd1f1663f959587690eeea75413"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
@@ -45,6 +45,7 @@ EXTRA_OECONF = " \
 PACKAGECONFIG ?= "openssl lzma"
 PACKAGECONFIG[openssl] = "--with-openssl-includes=${STAGING_INCDIR} --with-openssl-libraries=${STAGING_LIBDIR}, --without-openssl-includes --without-openssl-libraries, openssl,"
 PACKAGECONFIG[lzma] = "--with-lzma-includes=${STAGING_INCDIR} --with-lzma-libraries=${STAGING_LIBDIR}, --without-lzma-includes --without-lzma-libraries, xz,"
+PACKAGECONFIG[appid] = "--enable-open-appid, --disable-open-appid, luajit, bash"
 
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LDFLAGS += " -ltirpc"
-- 
2.7.4


