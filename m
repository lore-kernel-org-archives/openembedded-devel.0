Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLjAu-0007BO-QW
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 23:48:32 +0200
Received: by yia13 with SMTP id 13so1354047yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=l91Kg+cTLR3A+rSJ5ncszlMP9UZSxfKkjGoFMPULm9s=;
	b=My6KnCs1cjXVloFiUe36rCCoDbV2GNCqSfOIBuwpCrneJNBQjPaSLJyyyHuvdgM61h
	NXIRu32gm/v3dHD/emtg6iVZ0dttNg3raYJ0nIZv5/0m/2UrBP7WBB1K/TONjfrrEpCA
	zrt8nxMR8h+PmHhurzTvLibFLms+tXXtmDWNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Bog8PVhaRy7WCyRbeH1uMs/yp5u/14hkPTDlYetQqHbYgoVo67DeUp/L6GRv1RCsXM
	4N7itkvTBfyqzEzDrR1e8gyZ0CcmVWNJXTbh1jJ/YSaoZpFnH45omi1qafgUds7YXOsl
	aIR6gSBgvTcRltcK/5ekn+DdKojb2dteBrDm0=
Received: by 10.236.66.101 with SMTP id g65mr3694747yhd.44.1305495940586;
	Sun, 15 May 2011 14:45:40 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l30sm2110499yhn.6.2011.05.15.14.45.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 14:45:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 21:45:25 +0000
Message-Id: <1305495926-21490-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1305495926-21490-1-git-send-email-otavio@ossystems.com.br>
References: <1305495926-21490-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1 2/3] libpcsclite: add version 1.7.2
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
X-List-Received-Date: Sun, 15 May 2011 21:48:33 -0000

The recipe name libpcsclite has been choosen since this is the most
important and used part of the project. The daemon itself is optional
and not always required to be installed.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/pcsc-lite/files/pcscd.init |   32 +++++++++++++++++
 .../recipes-support/pcsc-lite/libpcsclite_1.7.2.bb |   36 ++++++++++++++++++++
 2 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/pcsc-lite/files/pcscd.init
 create mode 100644 meta-oe/recipes-support/pcsc-lite/libpcsclite_1.7.2.bb

diff --git a/meta-oe/recipes-support/pcsc-lite/files/pcscd.init b/meta-oe/recipes-support/pcsc-lite/files/pcscd.init
new file mode 100644
index 0000000..92385ab
--- /dev/null
+++ b/meta-oe/recipes-support/pcsc-lite/files/pcscd.init
@@ -0,0 +1,32 @@
+#!/bin/sh
+DAEMON=/usr/sbin/pcscd
+NAME=pcscd
+DESC="PCSC Daemon"
+PIDFILE=/var/run/pcscd/pcscd.pid
+ARGS=""
+
+test -f $DAEMON || exit 0
+
+case "$1" in
+    start)
+        echo -n "Starting $DESC: $NAME"
+        start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $ARGS
+        echo "."
+        ;;
+    stop)
+        echo -n "Stopping $DESC: $NAME"
+        start-stop-daemon --stop --quiet --pidfile $PIDFILE --exec $DAEMON
+        echo "."
+        ;;
+    restart)
+        $0 stop
+        sleep 1
+        $0 start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/pcsc-lite/libpcsclite_1.7.2.bb b/meta-oe/recipes-support/pcsc-lite/libpcsclite_1.7.2.bb
new file mode 100644
index 0000000..6326152
--- /dev/null
+++ b/meta-oe/recipes-support/pcsc-lite/libpcsclite_1.7.2.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "PC/SC Lite smart card framework and applications"
+HOMEPAGE = "http://pcsclite.alioth.debian.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c8e551349dc346258274f0007679e149"
+DEPENDS = "udev"
+PR = "r0"
+
+SRC_URI = "https://alioth.debian.org/frs/download.php/3533/pcsc-lite-${PV}.tar.bz2 \
+           file://pcscd.init "
+
+SRC_URI[md5sum] = "47e7055cfc14399fdaa1b7a4aa06e5aa"
+SRC_URI[sha256sum] = "41f13d552eaa2c3978fbb6f2125e81903a0767011d999052fd1a6ee03880b398"
+
+inherit autotools update-rc.d
+
+INITSCRIPT_PACKAGES = "pcscd"
+INITSCRIPT_NAME_pcscd = "pcscd"
+INITSCRIPT_PARAMS_pcscd = "defaults"
+
+EXTRA_OECONF = " \
+	--enable-libusb \
+	--disable-libudev \
+	--enable-usbdropdir=${libdir}/pcsc/drivers \
+	"
+
+S = "${WORKDIR}/pcsc-lite-${PV}"
+
+do_install() {
+	oe_runmake DESTDIR="${D}" install
+	install -d "${D}/etc/init.d"
+	install -m 755 "${WORKDIR}/pcscd.init" "${D}/etc/init.d/pcscd"
+}
+
+PACKAGES =+ "pcscd"
+
+FILES_pcscd = "${bindir}/pscsd ${sysconfdir}/init.d"
-- 
1.7.2.5



