Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PF4qA-0008DU-8h
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 13:59:26 +0100
Received: by ewy2 with SMTP id 2so2319527ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 04:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=2mgSp0ahJlWea67PKK/PE369Cm03UQMvHuh8R9GgOfM=;
	b=CQzv07/Q/4dGhZ9fuEb8J6P0x/p26hEQ641Iet2XTSGm6g+lkBeskoyZZupw/Bx68C
	CGe3W8p3b+zn9nQyRQWsTLw+rtRWW6x+LIJ15DRbXw0RbU4rIVCgchfD/ibqEQcIjNzP
	/5RJtT0TOi3Ruuo+iZZwV0CB6jejaUGgMAeWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=vZTKUGadNz5RCyRuZPYAbLMD8fKNa2t0+Df33mQlmWrpdiQpgvX9ldIUAT5d1Qo3fH
	morcU9fTrmMLhwwJJvyxTizAj9Q4tHbRfx0lZVVQDrHzvgFP2XQCI0FDZljY0IGLW9L7
	LGZAFzRfZHV8gOE7Zz59eS5DI1pW4UWQ3gADg=
Received: by 10.14.37.142 with SMTP id y14mr2441999eea.26.1289134705219;
	Sun, 07 Nov 2010 04:58:25 -0800 (PST)
Received: from localhost.localdomain ([93.182.199.230])
	by mx.google.com with ESMTPS id w20sm3151660eeh.18.2010.11.07.04.58.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 07 Nov 2010 04:58:24 -0800 (PST)
Sender: Camille Moncelier <pixdamix@gmail.com>
From: Camille Moncelier <moncelier@devlife.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Nov 2010 12:58:14 +0000
Message-Id: <1289134694-11903-1-git-send-email-moncelier@devlife.org>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1288774046-28629-1-git-send-email-moncelier@devlife.org>
References: <1288774046-28629-1-git-send-email-moncelier@devlife.org>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: [PATCH 04/11] rng-tools_2: Add a file in /etc/default to configure hrngdevice
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
X-List-Received-Date: Sun, 07 Nov 2010 12:59:26 -0000

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



