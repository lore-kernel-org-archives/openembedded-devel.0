Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id C1DD2605B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2014 14:40:54 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Jun 2014 15:40:51 +0100
Message-Id: <1401720051-23378-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.9.3
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH] ntp: fix incorrect pidfile handling in ntpd init script
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
X-List-Received-Date: Mon, 02 Jun 2014 14:41:01 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-networking/recipes-support/ntp/files/ntpd | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networking/recipes-support/ntp/files/ntpd
index a62b8ce..3cd1c6c 100755
--- a/meta-networking/recipes-support/ntp/files/ntpd
+++ b/meta-networking/recipes-support/ntp/files/ntpd
@@ -1,9 +1,22 @@
 #! /bin/sh
-#
+
+### BEGIN INIT INFO
+# Provides:        ntp
+# Required-Start:  $network $remote_fs $syslog
+# Required-Stop:   $network $remote_fs $syslog
+# Default-Start:   2 3 4 5
+# Default-Stop:
+# Short-Description: Start NTP daemon
+### END INIT INFO
+
 PATH=/sbin:/bin:/usr/bin:/usr/sbin
 
+DAEMON=/usr/sbin/ntpd
+PIDFILE=/var/run/ntpd.pid
+
 # ntpd	init.d script for ntpdc from ntp.isc.org
-test -x /usr/sbin/ntpd -a -r /etc/ntp.conf || exit 0
+test -x $DAEMON -a -r /etc/ntp.conf || exit 0
+
 # rcS contains TICKADJ
 test -r /etc/default/rcS && . /etc/default/rcS
 
@@ -23,12 +36,12 @@ startdaemon(){
 	# this.  If ntpd seems to disappear after a while assume TICKADJ
 	# above is set to a totally incorrect value.
 	echo -n "Starting ntpd: "
-	start-stop-daemon --start -x /usr/sbin/ntpd -- -u ntp:ntp -p /var/run/ntp.pid "$@"
+	start-stop-daemon --start --quiet --oknodo --pidfile $PIDFILE --startas $DAEMON -- -u ntp:ntp -p $PIDFILE "$@"
 	echo "done"
 }
 stopdaemon(){
 	echo -n "Stopping ntpd: "
-	start-stop-daemon --stop -p /var/run/ntp.pid
+	start-stop-daemon --stop --quiet --oknodo -p $PIDFILE
 	echo "done"
 }
 
-- 
1.9.3


