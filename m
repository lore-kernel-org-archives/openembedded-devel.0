Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J9kaq-0001eW-9P
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jan 2008 18:08:00 +0100
Received: by fg-out-1718.google.com with SMTP id 22so2587223fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jan 2008 09:01:37 -0800 (PST)
Received: by 10.86.60.7 with SMTP id i7mr7773778fga.67.1199206897168;
	Tue, 01 Jan 2008 09:01:37 -0800 (PST)
Received: from widy.lan ( [194.79.8.36])
	by mx.google.com with ESMTPS id y18sm18975893fkd.17.2008.01.01.09.01.35
	(version=SSLv3 cipher=OTHER); Tue, 01 Jan 2008 09:01:35 -0800 (PST)
Date: Tue, 1 Jan 2008 19:03:54 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1067194706.20080101190354@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1J9k05-00006v-OV@linuxtogo.org>
References: <E1J9k05-00006v-OV@linuxtogo.org>
MIME-Version: 1.0
Subject: [oe-commits] org.oe.dev gpsd: Provide working default configuration and init-script for fic-gta01. This makes gpsd device-specific for gta01, please check the feeds.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Jan 2008 17:08:06 -0000
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 8bit

Hello,

      Working default configuration should go to ${PN}-conf or
something, like most of OE does, and few remaining uncomplying packages are
being converted. This helps with build, QA, and release management. Thanks.


This is a forwarded message
From: coredump2 commit <openembedded-commits@lists.openembedded.org>
To: openembedded-commits@lists.openembedded.org
Date: Tuesday, January 1, 2008, 6:29:57 PM
Subject: [oe-commits] org.oe.dev gpsd: Provide working default configuration and init-script for fic-gta01. This makes gpsd device-specific for gta01, please check the feeds.

===8<==============Original message text===============
gpsd: Provide working default configuration and init-script for fic-gta01. This makes gpsd device-specific for gta01, please check the feeds.

Author: coredump2@openembedded.org
Branch: org.openembedded.dev
Revision: bc99dc2db85d728b06d198abe611e989797af107
ViewMTN: http://monotone.openembedded.org/revision/info/bc99dc2db85d728b06d198abe611e989797af107
Files:
1
packages/gpsd/files/fic-gta01
packages/gpsd/files/fic-gta01/gpsd
packages/gpsd/files/fic-gta01/gpsd-default
packages/gpsd/gpsd_2.34.bb
mtn:execute
true
Diffs:

#
# mt diff -r501fa938422c98da06cd4133211f6e771f97716f -rbc99dc2db85d728b06d198abe611e989797af107
#
# 
# 
# add_dir "packages/gpsd/files/fic-gta01"
# 
# add_file "packages/gpsd/files/fic-gta01/gpsd"
#  content [30f3c12ba74fb70a443b725f2bb81760e8c6b8d8]
# 
# add_file "packages/gpsd/files/fic-gta01/gpsd-default"
#  content [c45e36caad5bdf37b7d5defe8f18d431e25f9bd4]
# 
# patch "packages/gpsd/gpsd_2.34.bb"
#  from [4ea8e37b9fbdf1a614c46bcd12247dffa2d96067]
#    to [8e241bbd828101019cda7b30a6725fd6759f50f4]
# 
#   set "packages/gpsd/files/fic-gta01/gpsd"
#  attr "mtn:execute"
# value "true"
# 
============================================================
--- packages/gpsd/files/fic-gta01/gpsd  30f3c12ba74fb70a443b725f2bb81760e8c6b8d8
+++ packages/gpsd/files/fic-gta01/gpsd  30f3c12ba74fb70a443b725f2bb81760e8c6b8d8
@@ -0,0 +1,105 @@
+#!/bin/sh
+#
+# gpsd	This shell script starts and stops gpsd.
+#
+# chkconfig: 345 90 40
+# description: Gpsd manages access to a serial- or USB-connected GPS
+# processname: gpsd
+
+# Source function library.
+#. /etc/rc.d/init.d/functions
+
+RETVAL=0
+prog="gpsd"
+
+test -f /etc/default/$prog && . /etc/default/$prog
+
+start() {
+       # Start daemons.
+       echo -n "Starting $prog: "
+       # We don't use the daemon function here because of a known bug
+       # in initlog -- it spuriously returns a nonzero status when 
+       # starting daemons that fork themselves.  See
+       # http://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=130629
+       # for discussion.  Fortunately:
+       #
+       # 1. gpsd startup can't fail, or at least not in the absence of
+       # much larger resource-exhaustion problems that would be very obvious.
+       #
+       # 2. We don't need all the logging crud that daemon/initlog sets
+       # up -- gpsd does its own syslog calls.
+       #
+       
+       if test -e /home/root/gllin/gllin
+       then
+               /home/root/gllin/gllin >/var/log/gllin.log 2>&1 &
+       else
+               echo -e "\n\ngllin GPS driver for Neo1973 not found,"
+               echo "please install the gllin package from"
+               echo "http://3rdparty.downloads.openmoko.org/gllin/"
+               echo ""
+               exit 1
+       fi
+       
+       if [ -e "${GPS_DEV}" ]
+       then
+           gpsd ${GPSD_OPTS} -p ${GPS_DEV}
+            echo "success"
+       else
+           # User needs to symlink ${GPS_DEV} to the right thing
+           echo "No ${GPS_DEV} GPS device, aborting gpsd startup. Check /etc/default/$prog"
+       fi
+       RETVAL=$?
+       echo
+       [ $RETVAL -eq 0 ] && touch /var/lock/subsys/gpsd
+       return $RETVAL
+}
+
+stop() {
+       # Stop daemons.
+       echo -n "Shutting down $prog: "
+
+       gllin_PIDs="`ps ax | grep "/home/root/gllin" | grep -v grep | awk '{print $1}'`"        
+       test -n "$gllin_PIDs" && kill $gllin_PIDs
+
+        killall gpsd
+        killproc gpsd
+       RETVAL=$?
+       echo
+       if [ $RETVAL -eq 0 ]
+       then
+           rm -f /var/lock/subsys/gpsd;
+       fi
+       return $RETVAL
+}
+
+# See how we were called.
+case "$1" in
+  start)
+       start
+       ;;
+  stop)
+       stop
+       ;;
+  restart|reload)
+       stop
+       start
+       RETVAL=$?
+       ;;
+  condrestart)
+       if [ -f /var/lock/subsys/gpsd ]; then
+           stop
+           start
+           RETVAL=$?
+       fi
+       ;;
+  status)
+#      status gpsd
+#      RETVAL=$?
+       ;;
+  *)
+       echo "Usage: $0 {start|stop|restart|condrestart|status}"
+       exit 1
+esac
+
+exit $RETVAL
============================================================
--- packages/gpsd/files/fic-gta01/gpsd-default  c45e36caad5bdf37b7d5defe8f18d431e25f9bd4
+++ packages/gpsd/files/fic-gta01/gpsd-default  c45e36caad5bdf37b7d5defe8f18d431e25f9bd4
@@ -0,0 +1,3 @@
+# If you must specify a non-NMEA driver, uncomment and modify the next line
+#GPSD_OPTS=
+GPS_DEV="/tmp/nmeaNP"
============================================================
--- packages/gpsd/gpsd_2.34.bb  4ea8e37b9fbdf1a614c46bcd12247dffa2d96067
+++ packages/gpsd/gpsd_2.34.bb  8e241bbd828101019cda7b30a6725fd6759f50f4
@@ -1,4 +1,4 @@ require gpsd.inc
 require gpsd.inc
 
-PR = "r5"
+PR = "r6"
 



_______________________________________________
Openembedded-commits mailing list
Openembedded-commits@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

===8<===========End of original message text===========



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



