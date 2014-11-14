Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16C57720D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:52:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAE9q29q013888
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 01:52:02 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 01:52:02 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Nov 2014 04:52:00 -0500
Message-ID: <1415958720-887-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] hostapd: several fixes for init script
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
X-List-Received-Date: Fri, 14 Nov 2014 09:52:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* restart: The stop may delay a few seconds according to different wireless
  devices, on debian/ubuntu, the init script directly sleep 8 seconds
  to wait the stop complete, here we add a delay function (sleep in a loop)
  to ensure the stop is completed before start.
* add status command.
* add --oknodo for stop so it will not break restart if there is no
  running process.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-connectivity/hostapd/hostapd-2.2/init  | 27 +++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init
index 79f74b6..8ba4e07 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init
@@ -8,6 +8,23 @@ test -f $DAEMON || exit 0
 
 set -e
 
+# source function library
+. /etc/init.d/functions
+
+delay_stop() {
+	count=0
+	while [ $count -lt 9 ] ; do
+	        if pidof $DAEMON >/dev/null; then
+	                sleep 1
+	        else
+	                return 0
+	        fi
+		count=`expr $count + 1`
+	done
+	echo "Failed to stop $DESC."
+	return 1
+}
+
 case "$1" in
     start)
 	echo -n "Starting $DESC: "
@@ -16,20 +33,24 @@ case "$1" in
 	;;
     stop)
 	echo -n "Stopping $DESC: "
-	start-stop-daemon -K -x $DAEMON
+	start-stop-daemon -K --oknodo -x $DAEMON
 	echo "$NAME."
 	;;
     restart)
 	$0 stop
-	$0 start
+	delay_stop && $0 start
 	;;
     reload)
 	echo -n "Reloading $DESC: "
 	killall -HUP $(basename ${DAEMON})
 	echo "$NAME."
 	;;
+    status)
+	status $DAEMON
+	exit $?
+	;;
     *)
-	echo "Usage: $0 {start|stop|restart|reload}"
+	echo "Usage: $0 {start|stop|restart|reload|status}"
 	exit 1
 	;;
 esac
-- 
2.0.0


