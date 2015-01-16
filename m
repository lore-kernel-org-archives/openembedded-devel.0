Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8E672C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 06:14:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0G6ECWt016887
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 22:14:12 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 15 Jan 2015 22:14:11 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Jan 2015 14:14:03 +0800
Message-ID: <f309958a1014cfcdbf1444358c9a279882f017a1.1421388212.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421388212.git.jackie.huang@windriver.com>
References: <cover.1421388212.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] net-snmp: init script fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Jan 2015 06:14:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
1. Add source function and status command.
2. make it possible to change the start arguments with a default file
   in the same way as debian.
3. change the default INITSCRIPT_PARAMS
4. Add PIDFILE and fix restart
5. remove the postrm sicne we use the one from update-rc.d

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-protocols/net-snmp/files/init          | 51 +++++++++++-----------
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb | 11 +----
 2 files changed, 27 insertions(+), 35 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/files/init b/meta-networking/recipes-protocols/net-snmp/files/init
index 6b02570..2b8fe18 100755
--- a/meta-networking/recipes-protocols/net-snmp/files/init
+++ b/meta-networking/recipes-protocols/net-snmp/files/init
@@ -1,6 +1,8 @@
 #! /bin/sh
 # /etc/init.d/snmpd: start snmp daemon.
 
+. /etc/init.d/functions
+
 test -x /usr/sbin/snmpd || exit 0
 test -x /usr/sbin/snmptrapd || exit 0
 
@@ -10,21 +12,23 @@ SNMPDRUN=yes
 SNMPDOPTS='-Lsd -Lf /dev/null -p /var/run/snmpd.pid'
 TRAPDRUN=no
 TRAPDOPTS='-Lsd -p /var/run/snmptrapd.pid'
+PIDFILE=/var/run/snmpd.pid
+SPIDFILE=/var/run/snmptrapd.pid
 
-# Cd to / before starting any daemons.
-cd /
+# Reads config file if exists (will override defaults above)
+[ -r /etc/default/snmpd ] && . /etc/default/snmpd
 
 case "$1" in
   start)
     echo -n "Starting network management services:"
-    if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
-	start-stop-daemon -S -x /usr/sbin/snmpd \
-	    -- $SNMPDOPTS
+    if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf -a ! -f "$PIDFILE" ]; then
+	start-stop-daemon -o --start --quiet --name snmpd --pidfile "$PIDFILE" \
+		--exec /usr/sbin/snmpd -- $SNMPDOPTS
 	echo -n " snmpd"
     fi
-    if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
-	start-stop-daemon -S -x /usr/sbin/snmptrapd \
-	    -- $TRAPDOPTS
+    if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf -a ! -f "$SPIDFILE" ]; then
+	start-stop-daemon -o --start --quiet --name snmptrapd  --pidfile "$SPIDFILE" \
+		 --exec /usr/sbin/snmptrapd -- $TRAPDOPTS
 	echo -n " snmptrapd"
     fi
     echo "."
@@ -33,32 +37,29 @@ case "$1" in
     ;;
   stop)
     echo -n "Stopping network management services:"
-    start-stop-daemon -K -x /usr/sbin/snmpd
+    if [ -f  "$PIDFILE" ] ; then
+	start-stop-daemon -o --stop  --quiet --pidfile $PIDFILE --name snmpd
+    fi
     echo -n " snmpd"
-    start-stop-daemon -K -x /usr/sbin/snmptrapd
+    if [ -f "$SPIDFILE" ] ; then
+	start-stop-daemon -o --stop  --quiet --pidfile $SPIDFILE --name snmptrapd
+	rm -rf $SPIDFILE
+    fi
     echo -n " snmptrapd"
     echo "."
     ;;
+  status)
+    status /usr/sbin/snmpd;
+    exit $?
+    ;;
   restart|reload|force-reload)
-    echo -n "Restarting network management services:"
-    start-stop-daemon -K -x /usr/sbin/snmpd
-    start-stop-daemon -K -x /usr/sbin/snmptrapd
+    $0 stop
     # Allow the daemons time to exit completely.
     sleep 2
-    if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
-	start-stop-daemon -S -x /usr/sbin/snmpd -- $SNMPDOPTS
-	echo -n " snmpd"
-    fi
-    if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
-	# Allow snmpd time to start up.
-	sleep 1
-	start-stop-daemon -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
-	echo -n " snmptrapd"
-    fi
-    echo "."
+    $0 start
     ;;
   *)
-    echo "Usage: /etc/init.d/snmpd {start|stop|restart|reload|force-reload}"
+    echo "Usage: /etc/init.d/snmpd {start|stop|status|restart|reload|force-reload}"
     exit 1
 esac
 
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index 6736718..ecc5199 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -107,7 +107,7 @@ CONFFILES_${PN}-server-snmptrapd = "${sysconfdir}/snmp/snmptrapd.conf"
 
 INITSCRIPT_PACKAGES = "${PN}-server"
 INITSCRIPT_NAME_${PN}-server = "snmpd"
-INITSCRIPT_PARAMS_${PN}-server = "defaults"
+INITSCRIPT_PARAMS_${PN}-server = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)}"
 
@@ -133,12 +133,3 @@ RREPLACES_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
 RCONFLICTS_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
 
 LEAD_SONAME = "libnetsnmp.so"
-
-pkg_postrm_${PN}-server() {
-    if test "x$D" != "x"; then
-        OPT="-r $D "
-    else
-        OPT=""
-        /etc/init.d/snmpd stop
-    fi
-}
-- 
1.9.1


