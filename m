Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PDZ16-0004pM-Aa
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 09:48:26 +0100
Received: by wwi18 with SMTP id 18so349400wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=2mgSp0ahJlWea67PKK/PE369Cm03UQMvHuh8R9GgOfM=;
	b=mDbtX0w5vcZDMfxx4o5Is2JSmtLWdWSlal3uAxRSwDVyAaPEIZVsjwv/TJlfNKouUA
	KvzWP1AN59VZrHyv7FgNC9OU//+/0yogq0XahykSvMmIvIseByvP4Fdp8P8hWjyngasd
	5gXUJD8+YFUB+3aN+i7KGzECgnQDpS3Nnwcac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=DUDD1rUccSTRD/wmvyhuyNLj/iFGA0FKJ80Rs5kmUoq7CYiGw/X/BolbPDpslnScge
	snbPK8RrBVoynG3K9NwwM3XHtsgnczCmErNaKpaB9QuR29xGHiqzpLbh4uEYfO+ImXw0
	6Q/kZEKJn3DZNY2D5F4kAdsSKlMQIn9aBX1Lg=
Received: by 10.227.138.21 with SMTP id y21mr9242177wbt.38.1288774053624;
	Wed, 03 Nov 2010 01:47:33 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-258-1-39-42.w90-31.abo.wanadoo.fr [90.31.190.42])
	by mx.google.com with ESMTPS id b30sm7199929wbb.10.2010.11.03.01.47.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Nov 2010 01:47:32 -0700 (PDT)
Sender: Camille Moncelier <pixdamix@gmail.com>
From: Camille Moncelier <moncelier@devlife.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Nov 2010 08:47:26 +0000
Message-Id: <1288774046-28629-1-git-send-email-moncelier@devlife.org>
X-Mailer: git-send-email 1.7.3.1
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: [PATCH] rng-tools_2: Add a file in /etc/default to configure hrngdevice
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
X-List-Received-Date: Wed, 03 Nov 2010 08:48:29 -0000

* Fixed the executable path (No more /usr/local/bin)

* Changed the init file to try to autodiscover the HRNGDEVICE.
  (Stolen from debian)

* Added a conf file to be able to specify urandom as a source
  of random number (it helps producing random number faster
  with a small quality decrease)

Signed-off-by: Camille Moncelier <moncelier@devlife.org>
---
 recipes/rng-tools/files/init      |   48 ++++++++++++++++++++++++++----------
 recipes/rng-tools/files/rng-tools |    2 +
 recipes/rng-tools/rng-tools_2.bb  |    7 ++++-
 3 files changed, 42 insertions(+), 15 deletions(-)
 create mode 100644 recipes/rng-tools/files/rng-tools

diff --git a/recipes/rng-tools/files/init b/recipes/rng-tools/files/init
index e12f71c..e750685 100755
--- a/recipes/rng-tools/files/init
+++ b/recipes/rng-tools/files/init
@@ -5,37 +5,57 @@
 # > update-rc.d rng-tools defaults 60
 #
 
-rngd=/usr/local/sbin/rngd
-test -x "$rngd" || exit 1
+DAEMON=/usr/sbin/rngd
+test -x "$DAEMON" || exit 1
 
+DEVICELIST="hwrng hw_random hwrandom intel_rng i810_rng"
+HRNGDEVICE=/dev/hwrng
+RNGDOPTIONS=
+[ -r /etc/default/rng-tools ] && . /etc/default/rng-tools
+
+finddevice () {
+	[ -c "${HRNGDEVICE}" ] && return 0
+	for i in ${DEVICELIST} ; do
+		if [ -c "/dev/$i" ] ; then
+			HRNGDEVICE="/dev/$i"
+			return 0
+		fi
+		if [ -c "/dev/misc/$i" ] ; then
+			HRNGDEVICE="/dev/misc/$i"
+			return 0
+		fi
+	done
+
+	echo "(Hardware RNG device inode not found)"
+	echo "$0: Cannot find a hardware RNG device to use." >&2
+	exit 1
+}
 
 case "$1" in
   start)
-    echo -n "Starting random number generator daemon"
-    start-stop-daemon --start --quiet --exec $rngd
+    echo -n "Starting random number generator daemon "
+    finddevice
+    start-stop-daemon --start --quiet --exec $DAEMON -- -r ${HRNGDEVICE} ${RNGDOPTIONS}
     echo "."
     ;;
   stop)
     echo -n "Stopping random number generator daemon"
-    start-stop-daemon --stop --quiet -n rngd
+    start-stop-daemon --stop --quiet --exec $DAEMON
     echo "."
     ;;
   reload|force-reload)
     echo -n "Signalling rng daemon restart"
-    start-stop-daemon --stop --quiet --signal 1 --exec $rngd
-    start-stop-daemon --stop --quiet --signal 1 --exec $rngd
+    start-stop-daemon --stop --quiet --signal 1 --exec $DAEMON
+    start-stop-daemon --stop --quiet --signal 1 --exec $DAEMON
     ;;
   restart)
-    echo -n "Stopping random number generator daemon"
-    start-stop-daemon --stop --quiet -n rngd
-    echo "."
-    echo -n "Starting random number generator daemon"
-    start-stop-daemon --start --quiet --exec $rngd
-    echo "."
+    $0 stop
+    sleep 1
+    $0 start
     ;;
   *)
     echo "Usage: /etc/init.d/rng-tools {start|stop|reload|restart|force-reload}"
     exit 1
 esac
 
-exit 0
\ No newline at end of file
+exit 0
diff --git a/recipes/rng-tools/files/rng-tools b/recipes/rng-tools/files/rng-tools
new file mode 100644
index 0000000..777a816
--- /dev/null
+++ b/recipes/rng-tools/files/rng-tools
@@ -0,0 +1,2 @@
+# HRNGDEVICE=/dev/hwrandom
+# RNGDOPTIONS="-W 80% -t 20"
diff --git a/recipes/rng-tools/rng-tools_2.bb b/recipes/rng-tools/rng-tools_2.bb
index 523587c..dee6f45 100644
--- a/recipes/rng-tools/rng-tools_2.bb
+++ b/recipes/rng-tools/rng-tools_2.bb
@@ -1,8 +1,9 @@
 DESCRIPTION = "Random number generator daemon"
 LICENSE = "GPL"
-PR = "1"
+PR = "2"
 
 SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${P}.tar.gz \
+           file://rng-tools \
            file://init"
 
 inherit autotools update-rc.d
@@ -12,8 +13,12 @@ INITSCRIPT_PARAMS = "defaults"
 
 do_install_append() {
         install -d "${D}${sysconfdir}/init.d"
+        install -d "${D}${sysconfdir}/default"
         install -c -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
+        install -c -m 755 ${WORKDIR}/rng-tools ${D}${sysconfdir}/default/rng-tools
 }
 
+CONFFILES_${PN} = "${sysconfdir}/default/rng-tools"
+
 SRC_URI[md5sum] = "63d503191eabed630324c104cc024475"
 SRC_URI[sha256sum] = "1126f0ecc8cab3af14a562cddc5d8ffeef47df7eba34a7aadcdee35a25ec2b1e"
-- 
1.7.3.1



