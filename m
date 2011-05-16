Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLycx-0004m4-J9
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 16:18:31 +0200
Received: by yxn22 with SMTP id 22so1643190yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 07:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=MN6zZ1cUOiNRe7fJVehFI/Bqm9l9yDRW//rHUn7gmio=;
	b=tDf+hdj3NJXp8G31ExfCIjl1wHA6rM0lSoIEnHOq/IB3PreTZeOotWGVZpw0uNznug
	yG+Y/t26rvoVkVCAFY6jZFqQD2S5gE6Muw6lb/uYe9tp9mcwPMi43+j9Bv2RdpDtiTCR
	6f/GaO0jIOW5GHyhtY7Zb76nyvwlVdmjH/vZY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=XEyChE9wpiAemk9I/3p8oORgd4PZWK8wiKBz25NNIVQslVFKPAUUwjvpnqthSFNUg3
	PIbKpwdz9IMCPCOR3eOUCk+1ViAd2MHEANvso0xERLOIEsQ4qdtYcMyhEgpYAAh2JJgW
	MDcMEntf+8VDMqLNB9KmOLdgbxY0lWx/kBQJ4=
Received: by 10.236.181.164 with SMTP id l24mr4196263yhm.71.1305555338076;
	Mon, 16 May 2011 07:15:38 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm2387111yhl.101.2011.05.16.07.15.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 07:15:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 14:15:26 +0000
Message-Id: <1305555326-32419-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v4] pcsc-lite: add version 1.7.2
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
X-List-Received-Date: Mon, 16 May 2011 14:18:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/pcsc-lite/files/pcscd.init |   32 ++++++++++++++++
 .../recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb   |   38 ++++++++++++++++++++
 2 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/pcsc-lite/files/pcscd.init
 create mode 100644 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb

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
diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
new file mode 100644
index 0000000..7d235d6
--- /dev/null
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
@@ -0,0 +1,38 @@
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
+PACKAGES =+ "${PN}-lib"
+
+INITSCRIPT_NAME = "pcscd"
+INITSCRIPT_PARAMS = "defaults"
+
+FILES_${PN}-lib = "${libdir}/lib*${SOLIBS}"
-- 
1.7.2.5



