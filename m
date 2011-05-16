Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLyFl-0008Vc-Pb
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 15:54:36 +0200
Received: by gwb11 with SMTP id 11so1633023gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 06:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=Yx0nRCM5fq4/PssH0M5iehDPeWimm50Mp7crNlNrp6s=;
	b=nxtzMeE0HL7oik0oWJUb2T99nQpsYxgtoXBL03Yp2FH5aYgKUe1xGV68K5Qor4s2zw
	FWlhOeiBbwH5qtpd/lHNPFZnplHS5eJ3lcl8K+/eeGQDXGJyBE3Xg8EUS3VRHWMMNgus
	P2DxSr7ZRbau9ebfCKcrTqHg3Zp9dAt25Hu4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=P4DyPi3YA433nZ0+l0BmZsy6HPOHX80guIXJ7iPCNl07lfCNLEvgD3gc11m8jAvcAs
	4xQVPiofpQsus4TOSMMIzsMSjD60Pc3gVx3aDVMD5TgB+LDBY81RBQQA/jTLzyw3JzUS
	vAoqvgWy1l0xFIGgj5KiGfzDutwOM7omjKHTg=
Received: by 10.150.207.17 with SMTP id e17mr3463720ybg.383.1305553841886;
	Mon, 16 May 2011 06:50:41 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c3sm1555674ybn.9.2011.05.16.06.50.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 06:50:40 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 13:50:30 +0000
Message-Id: <1305553830-26165-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3] libpcsclite: add version 1.7.2
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
X-List-Received-Date: Mon, 16 May 2011 13:54:36 -0000

The recipe name libpcsclite has been choosen since this is the most
important and used part of the project. The daemon itself is optional
and not always required to be installed.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/pcsc-lite/files/pcscd.init |   32 ++++++++++++++++
 .../recipes-support/pcsc-lite/libpcsclite_1.7.2.bb |   39 ++++++++++++++++++++
 2 files changed, 71 insertions(+), 0 deletions(-)
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
index 0000000..48d555b
--- /dev/null
+++ b/meta-oe/recipes-support/pcsc-lite/libpcsclite_1.7.2.bb
@@ -0,0 +1,39 @@
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
+	install -d "${D}/${sysconfdir}/init.d"
+	install -m 755 "${WORKDIR}/pcscd.init" "${D}/${sysconfdir}/init.d/pcscd"
+
+	# handle vars values
+	sed -i 's,/usr/sbin,${sbindir},g;s,/var,${localstatedir},g' "${D}/${sysconfdir}/init.d/pcscd"
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



