Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 497A365E69
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 02:05:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3H25uU0022272
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 19:05:56 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 16 Apr 2014 19:05:56 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Apr 2014 10:06:49 +0800
Message-ID: <1397700409-29937-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] rsyslog: add status command and a minor fix for initscript
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
X-List-Received-Date: Thu, 17 Apr 2014 02:05:56 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- add status command
- add --oknodo for do_start

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-extended/rsyslog/rsyslog/initscript    |   32 ++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript b/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
index d011e8f..7a8f8f9 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
@@ -27,7 +27,10 @@ do_start()
         # Return
         #   0 if daemon has been started
         #   1 if daemon could not be started
-        start-stop-daemon -S --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS || return 1
+        #   if daemon had already been started, start-stop-daemon will return 1
+        #   so add -o/--oknodo(if nothing is done, exit 0)
+        start-stop-daemon -S --quiet --pidfile $PIDFILE --exec $DAEMON \
+                             --oknodo -- $DAEMON_ARGS || return 1
 }
 #
 # Function that stops the daemon/service
@@ -56,6 +59,20 @@ do_reload() {
         start-stop-daemon -K --signal HUP --quiet --pidfile $PIDFILE --name $NAME
         return 0
 }
+
+do_status() {
+        NAME=$1
+        PIDFILE=$2
+        # -t: test only but not stop
+        start-stop-daemon -K -t --quiet --pidfile $PIDFILE --name $NAME
+        # exit with status 0 if process is found
+        if [ "$?" = "0" ]; then
+                return 0
+        else
+                return 1
+        fi
+}
+
 case "$1" in
   start)
         echo -n "starting $RSYSLOGD ... "
@@ -82,8 +99,19 @@ case "$1" in
         $0 stop
         $0 start
         ;;
+  status)
+        echo -n "status $RSYSLOGD ... "
+        do_status "$RSYSLOGD" "$RSYSLOGD_PIDFILE"
+        if [ "$?" = "0" ]; then
+                echo "running"
+                exit 0        
+        else
+                echo "stopped"
+                exit 1        
+        fi
+        ;;
   *)
-        echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload}" >&2
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|reload|force-reload}" >&2
         exit 3
         ;;
 esac
-- 
1.7.9.5


