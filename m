Return-Path: <adam.chappell@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id B8101608B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 22:49:48 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t7KMnlaI026299 for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 17:49:47 -0500
Received: from ACHAPP.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015082017494782-322364 ;
	Thu, 20 Aug 2015 17:49:47 -0500 
From: adam.chappell@ni.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 17:48:22 -0500
Message-Id: <1440110902-11552-1-git-send-email-adam.chappell@ni.com>
X-Mailer: git-send-email 1.9.5.msysgit.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/20/2015 05:49:47 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/20/2015 05:49:47 PM,
	Serialize complete at 08/20/2015 05:49:47 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-08-20_10:, , signatures=0
Subject: [meta-webserver][PATCH] apache2: wait for server to start/stop/restart
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
X-List-Received-Date: Thu, 20 Aug 2015 22:49:49 -0000

From: Adam Chappell <adam.chappell@ni.com>

Change start, stop, and restart functions in apache2 init script to return only
after completion (i.e. the server has started/stopped, not just received a kill
signal). Starting and stopping the server in quick sucession results in an error
because the server will attempt to stop before it has had time to start and vice
versa.

Signed-off-by: Adam Chappell <adam.chappell@ni.com>
---
 meta-webserver/recipes-httpd/apache2/files/init | 165 +++++++++++++++++++++++-
 1 file changed, 161 insertions(+), 4 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/files/init b/meta-webserver/recipes-httpd/apache2/files/init
index a1adbd7..758d133 100755
--- a/meta-webserver/recipes-httpd/apache2/files/init
+++ b/meta-webserver/recipes-httpd/apache2/files/init
@@ -28,14 +28,161 @@ test -f $APACHECTL || exit 0
 # ensure we don't leak environment vars into apachectl
 APACHECTL="env -i LANG=${LANG} PATH=${PATH} $APACHECTL"
 
+apache_conftest() {
+    if $($APACHECTL configtest > /dev/null 2>&1 ); then
+        return 0
+    else
+        return 1
+    fi
+}
+
+apache_wait_start() {
+    local STATUS=$1
+
+    if [ $STATUS != 0 ] ; then
+        return $STATUS
+    fi
+
+    local i=0
+    while : ; do
+            PIDTMP=$(pidof $DAEMON | tr ' ' '\n' | grep -w $(cat $PIDFILE))
+            if [ -n "${PIDTMP:-}" ] && kill -0 "${PIDTMP:-}" 2> /dev/null; then
+                    return $STATUS
+            fi
+
+            if [ $i = "20" ] ; then
+                    return 2
+            fi
+
+            sleep 1
+            i=$(($i+1))
+    done
+}
+
+apache_wait_stop() {
+    local STATUS=$1
+
+    if [ $STATUS != 0 ] ; then
+        return $STATUS
+    fi
+
+    PIDTMP=$(pidof $DAEMON | tr ' ' '\n' | grep -w $(cat $PIDFILE))
+    if [ -n "${PIDTMP:-}" ] && kill -0 "${PIDTMP:-}" 2> /dev/null; then
+            local i=0
+            while kill -0 "${PIDTMP:-}" 2> /dev/null;  do
+                    if [ $i = '60' ]; then
+                            STATUS=2
+                            break
+                    fi
+                    sleep 1
+                    i=$(($i+1))
+            done
+            return $STATUS
+    else
+        return $STATUS
+    fi
+}
+
+#
+# Function that starts the daemon/service
+#
+do_start()
+{
+    # Return
+    #   0 if daemon has been started
+    #   1 if daemon was already running
+    #   2 if daemon could not be started
+
+    if [ -e $PIDFILE ] && pidof $DAEMON | tr ' ' '\n' | grep -w $(cat $PIDFILE) > /dev/null 2>&1 ; then
+            return 1
+    fi
+
+    if apache_conftest ; then
+            $APACHECTL start
+            apache_wait_start $?
+            return $?
+    else
+            return 2
+    fi
+}
+
+#
+# Function that stops the daemon/service
+#
+do_stop()
+{
+    # Return
+    #   0 if daemon has been stopped
+    #   1 if daemon was already stopped
+    #   2 if daemon could not be stopped
+    #   other if a failure occurred
+
+        local AP_RET=0
+
+        if pidof $DAEMON > /dev/null 2>&1 ; then
+                if [ -e $PIDFILE ] && pidof $DAEMON | tr ' ' '\n' | grep -w $(cat $PIDFILE) > /dev/null 2>&1 ; then
+                        AP_RET=2
+                else
+                        AP_RET=1
+                fi
+        else
+            AP_RET=0
+        fi
+
+        # AP_RET is:
+        # 0 if Apache (whichever) is not running
+        # 1 if Apache (whichever) is running
+        # 2 if Apache from the PIDFILE is running
+
+        if [ $AP_RET = 0 ] ; then
+                return 1
+        fi
+
+        if [ $AP_RET = 2 ] && apache_conftest ; then
+                $APACHECTL stop
+                apache_wait_stop $?
+                return $?
+        else
+                if [ $AP_RET = 2 ]; then
+                        kill $(pidof $DAEMON | tr ' ' '\n' | grep -w $(cat $PIDFILE))
+                        apache_wait_stop $?
+                        return $?
+                elif [ $AP_RET = 1 ] ; then
+                        return 2
+                fi
+        fi
+
+}
+
 case "$1" in
   start)
     echo -n "Starting web server: $NAME"
-    $APACHECTL $ARGS
+    do_start
+    case $? in
+        0|1)
+            echo .
+            exit 0
+            ;;
+        2)
+            echo failed
+            exit 1
+            ;;
+    esac
     ;;
 
   stop)
-    $APACHECTL stop
+    echo -n "Stopping web server: $NAME"
+    do_stop
+    case $? in
+        0|1)
+            echo .
+            exit 0
+            ;;
+        2)
+            echo failed
+            exit 1
+            ;;
+    esac
     ;;
 
   reload)
@@ -49,8 +196,18 @@ case "$1" in
     ;;
 
   restart)
-    $APACHECTL restart
-    exit $?
+    echo "Restarting web server: $NAME"
+    do_stop
+    case "$?" in
+        0|1)
+            do_start
+            exit $?
+            ;;
+        *)
+            # Failed to stop
+            exit 1
+            ;;
+    esac
     ;;
 
   force-reload)
-- 
1.9.5.msysgit.0


