Received: from exprod5og106.obsmtp.com ([64.18.0.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NteHv-0003yD-72
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:51:22 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob106.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6c8z5Y5c1eh9XCiGsJ26QoJWusEepJP@postini.com;
	Mon, 22 Mar 2010 02:48:05 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip09.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:32:28 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:32:28 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:35:43 +0000
Message-ID: <20100322093543.27540.54412.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.182
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 10/12] Add hwclock script to util-linux-ng
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
X-List-Received-Date: Mon, 22 Mar 2010 09:51:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Busybox provides a script for managing the RTC, this is not provided by
anything else and will be required for busybox-less builds. Add it to
util-linux-ng for now.

This script is a part of busybox and is used by the boot process.
---

 recipes/util-linux-ng/files/hwclock.sh  |   76 +++++++++++++++++++++++++++++++
 recipes/util-linux-ng/util-linux-ng.inc |    6 ++
 2 files changed, 81 insertions(+), 1 deletions(-)

diff --git a/recipes/util-linux-ng/files/hwclock.sh b/recipes/util-linux-ng/files/hwclock.sh
new file mode 100644
index 0000000..6c0af34
--- /dev/null
+++ b/recipes/util-linux-ng/files/hwclock.sh
@@ -0,0 +1,76 @@
+#!/bin/sh
+# hwclock.sh Set system clock to hardware clock, according to the UTC
+#               setting in /etc/default/rcS (see also rcS(5)).
+#
+# WARNING:      If your hardware clock is not in UTC/GMT, this script
+#               must know the local time zone. This information is
+#               stored in /etc/localtime. This might be a problem if
+#               your /etc/localtime is a symlink to something in
+#               /usr/share/zoneinfo AND /usr isn't in the root
+#               partition! The workaround is to define TZ either
+#               in /etc/default/rcS, or in the proper place below.
+
+[ ! -x /sbin/hwclock ] && exit 0
+
+. /etc/default/rcS
+
+[ "$UTC" = yes ] && UTC=--utc || UTC=--localtime
+
+case "$1" in
+        start)
+                if [ "$VERBOSE" != no ]
+                then
+                        echo "System time was `date`."
+                        echo "Setting the System Clock using the Hardware Clock as reference..."
+                fi
+
+		if [ "$HWCLOCKACCESS" != no ]
+		then
+			if [ -z "$TZ" ]
+			then
+	                   hwclock -s $UTC;# --hctosys
+			else
+			   TZ="$TZ" hwclock -s $UTC;# --hctosys
+			fi
+		fi
+
+                if [ "$VERBOSE" != no ]
+                then
+                        echo "System Clock set. System local time is now `date`."
+                fi
+                ;;
+        stop|restart|reload|force-reload)
+		#
+		# Updates the Hardware Clock with the System Clock time.
+		# This will *override* any changes made to the Hardware Clock.
+		#
+		# WARNING: If you disable this, any changes to the system
+		#          clock will not be carried across reboots.
+		#
+		if [ "$VERBOSE" != no ]
+		then
+			echo "Saving the System Clock time to the Hardware Clock..."
+		fi
+		if [ "$HWCLOCKACCESS" != no ]
+		then
+			hwclock -w $UTC;# --systohc
+		fi
+		if [ "$VERBOSE" != no ]
+		then
+			echo "Hardware Clock updated to `date`."
+		fi
+                exit 0
+                ;;
+	show)
+		if [ "$HWCLOCKACCESS" != no ]
+		then
+			hwclock -r $UTC;# --show
+		fi
+		;;
+        *)
+                echo "Usage: hwclock.sh {start|stop|show|reload|restart}" >&2
+		echo "       start sets kernel (system) clock from hardware (RTC) clock" >&2
+		echo "       stop and reload set hardware (RTC) clock from kernel (system) clock" >&2
+                exit 1
+                ;;
+esac
diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 1c6e8a8..b2045d7 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -12,7 +12,8 @@ INC_PR = "r16"
 # allows for a release candidate
 RC ?= ""
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${PV}/util-linux-ng-${PV}${RC}.tar.bz2;name=archive"
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${PV}/util-linux-ng-${PV}${RC}.tar.bz2;name=archive \
+		file://hwclock.sh "
 
 SRC_URI_append_chinook-compat = " file://chinook_libtool.patch;patch=1 "
 
@@ -157,6 +158,9 @@ do_install () {
                 fi
         done
 
+	install -d ${D}${sysconfdir}/init.d/
+	install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
+	
 	install -d ${D}${sysconfdir}/default/
 	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall.${PN}
 


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


