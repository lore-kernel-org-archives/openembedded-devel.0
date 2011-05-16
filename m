Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLwp1-0005BA-Gu
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 14:22:51 +0200
Received: by gwb11 with SMTP id 11so1598488gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 05:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=zxXFKgmIPYcqRpMp6+nJu9r3rVMc/CPJadZEIe+EQr0=;
	b=XiRk11uSkEjON9V9BCnE4ildHk2c3a1Qak9NS7kChKXgMJqyPpE+3hZ79JpQ72C++o
	ka7wa2fNje58EDwVuHLpsQ1y31+dZ5FN2ayEYOxycIDsvSjgN8f9EBG12tFlzLjTcTmT
	BAqkxhfamFoLTAVQ+6Lvu29gbKyK4/RZAgj5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=k2ngdYr/bJy+qnJzlz1aAIleOq4t0PpRHdJTxAkMthf89Az/+mX4DH9QS4Beci2vx6
	z+XUIBJbwQ7sdoe5reZ91XjWARJiEyNQAwr/MbG/fUXGUGHN3I9bui68PJW18G62e+oc
	n8fefCPAuveTAptDFOh0G2GWMrEwlSgxOZD6Q=
Received: by 10.236.125.134 with SMTP id z6mr4249726yhh.58.1305548398126;
	Mon, 16 May 2011 05:19:58 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id z9sm1882350yhh.80.2011.05.16.05.19.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 05:19:56 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 12:19:44 +0000
Message-Id: <1305548385-10942-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1 1/2] libpcsclite: add version 1.7.2
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
X-List-Received-Date: Mon, 16 May 2011 12:22:51 -0000

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
index 0000000..99b0b95
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
+EXTRA_OECONF = " \
+	--disable-libusb \
+	--enable-libudev \
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
+INITSCRIPT_PACKAGES = "pcscd"
+INITSCRIPT_NAME_pcscd = "pcscd"
+INITSCRIPT_PARAMS_pcscd = "defaults"
+
+FILES_pcscd = "${bindir}/pscsd ${sysconfdir}/init.d"
-- 
1.7.2.5



