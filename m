Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKxH6-00059O-EZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 20:40:05 +0200
Received: by gwb11 with SMTP id 11so1066792gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 11:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=DGcGVvjK4YGXpzW7ZXRt8+boRwj1SF+YFEg29HcaCZw=;
	b=UWsww7xeP/hIjwLPSt8GNMlFqlgOsDB0HLtlEVccusvgqVQBIXnaU9NZyM7S7yBlcc
	nYaVREL2MIGBSLQPK1N+hOWYylFJaX9e6jTGanf+iWlgVWU74mIbRKbry5Ko/2AwF+Ha
	7q27z7c1GItpAoIWj3D1Biwll852TDflvwlQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=KqXrL44ab7UckjPOXxDk+cHROYRHzdj+v0DcNR6DZarKHecFF4BCKHZkgmpzCv5gcf
	+NWhpjsqiI64RYEonYBqq7FFiyPmVEtDghaITyZ/5I3MP4VzJX+Q/AlS3Yjpm2jdoTwO
	vfEU2qXIYSYXaFts1gSmWnKhkgL6xmMhhKFEw=
Received: by 10.101.214.10 with SMTP id r10mr1130364anq.75.1305311804091;
	Fri, 13 May 2011 11:36:44 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id s16sm1855267anj.26.2011.05.13.11.36.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 11:36:43 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2011 18:36:11 +0000
Message-Id: <1305311771-23547-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1305311771-23547-1-git-send-email-otavio@ossystems.com.br>
References: <1305311771-23547-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1 2/2] pcsc-lite: add version 1.7.2
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
X-List-Received-Date: Fri, 13 May 2011 18:40:05 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/pcsc-lite/files/pcscd.init |   32 +++++++++++++++++++
 .../recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb   |   33 ++++++++++++++++++++
 2 files changed, 65 insertions(+), 0 deletions(-)
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
index 0000000..25487de
--- /dev/null
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
@@ -0,0 +1,33 @@
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
+inherit autotools update-rc.d
+
+INITSCRIPT_NAME = "pcscd"
+INITSCRIPT_PARAMS = "defaults"
+
+EXTRA_OECONF = " \
+	--enable-libusb \
+        --disable-libudev \
+	--enable-usbdropdir=${libdir}/pcsc/drivers \
+	"
+
+do_install() {
+	oe_runmake DESTDIR="${D}" install
+	install -d "${D}/etc/init.d"
+	install -m 755 "${WORKDIR}/pcscd.init" "${D}/etc/init.d/pcscd"
+}
+
+PACKAGES =+ "libpcsclite"
+
+FILES_libpcsclite = "${libdir}/libpcsclite.so.*"
+
+SRC_URI[md5sum] = "47e7055cfc14399fdaa1b7a4aa06e5aa"
+SRC_URI[sha256sum] = "41f13d552eaa2c3978fbb6f2125e81903a0767011d999052fd1a6ee03880b398"
-- 
1.7.2.5



