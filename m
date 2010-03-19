Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Nsc6f-0001Od-1d
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 14:19:22 +0100
Received: from localhost.localdomain (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTP id B1E9F68773;
	Fri, 19 Mar 2010 16:06:44 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 16:11:19 +0300
Message-Id: <1269004282-10732-5-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1269004282-10732-4-git-send-email-khimov@altell.ru>
References: <1269004282-10732-1-git-send-email-khimov@altell.ru>
	<1269004282-10732-2-git-send-email-khimov@altell.ru>
	<1269004282-10732-3-git-send-email-khimov@altell.ru>
	<1269004282-10732-4-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: B1E9F68773.7D58A
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] squid: revamp init
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
X-List-Received-Date: Fri, 19 Mar 2010 13:19:22 -0000

Configure squid to create PID file by default, use SQUID_ARGS variable,
wait for it to actually stop when stopping (takes some time for squid
to do it).

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/squid/squid.inc        |    3 ++-
 recipes/squid/squid/squid.init |   23 ++++++++++++++++++-----
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/recipes/squid/squid.inc b/recipes/squid/squid.inc
index ff3789c..9004b6f 100644
--- a/recipes/squid/squid.inc
+++ b/recipes/squid/squid.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more"
 LICENSE = "GPLv2"
-INC_PR = "r3"
+INC_PR = "r4"
 DEPENDS = "squid-native-${PV}"
 
 SRC_URI = "http://www.squid-cache.org/Versions/v2/${SQUID_MAJOR}/squid-${PV}.tar.bz2;name=squid-${PV} \
@@ -42,6 +42,7 @@ do_install_append() {
 	mv ${D}${sysconfdir}/mime.conf.default ${D}${sysconfdir}/squid/
 	mv ${D}${sysconfdir}/squid.conf.default ${D}${sysconfdir}/squid/
 	install -m 0644 ${WORKDIR}/squid-volatiles ${D}${sysconfdir}/default/volatiles/squid
+	sed -ri "s,^\#?\ *(pid_filename.+)$,\1," ${D}${sysconfdir}/squid/squid.conf
 }
 
 # this packages the languages better and saves some space, installs
diff --git a/recipes/squid/squid/squid.init b/recipes/squid/squid/squid.init
index 61d9de4..d829cf9 100644
--- a/recipes/squid/squid/squid.init
+++ b/recipes/squid/squid/squid.init
@@ -3,7 +3,7 @@ DAEMON=/usr/sbin/squid
 NAME=squid
 DESC="Squid HTTP proxy"
 PIDFILE=/var/run/squid.pid
-SQUID_ARGS="-D -sYC"
+SQUID_ARGS="-D -sY"
 
 test -f $DAEMON || exit 0
 
@@ -36,11 +36,25 @@ start() {
         chown $owner $ldr
     fi
 
-    start-stop-daemon -S -p $PIDFILE -x $DAEMON
+    start-stop-daemon -S -p $PIDFILE -x $DAEMON -- $SQUID_ARGS
 }
 
 stop() {
-        start-stop-daemon -K -p $PIDFILE -x $DAEMON
+	EX=0
+	CNT=1
+	while [ $EX -eq 0 -a $CNT -lt 15 ]; do
+		echo -n .
+		sleep 1
+		start-stop-daemon -K -p $PIDFILE 1>/dev/null 2>&1
+		EX=$?
+		CNT=`expr $CNT + 1`
+	done
+	if [ $CNT -eq 15 ]; then
+		echo "failed."
+	else
+		echo "done."
+		rm -f $PIDFILE
+	fi
 }
 
 case "$1" in
@@ -50,9 +64,8 @@ case "$1" in
         echo "done."
        ;;
     stop)
-        echo -n "Stopping $DESC: $NAME... "
+        echo -n "Stopping $DESC: $NAME"
         stop
-        echo "done."
         ;;
     restart)
         echo "Restarting $DESC: $NAME... "
-- 
1.5.6.5



