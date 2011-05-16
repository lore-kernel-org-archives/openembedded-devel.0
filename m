Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLy4S-0007zD-5a
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 15:42:52 +0200
Received: by ywg8 with SMTP id 8so1631846ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=R8siZLG3Hpk533Yt3ZQoYt9ed/hQEAlTT4/58Yf53B8=;
	b=x0V8uG997EiEa4cDsVqPgD8VRxfXCCku2G3M9Ry+1KHKLC4B1YARuVebX4n5aakAJ/
	Zng0u9bdMmOYY16egfLD0r3L4VrapMk8IlJktFgp8YIkj827mxA33Ag06zxwFlwBRVk/
	B5uSVQ3s22z4HhIgQPZFshq+onG3KPQTvxovY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=adJb9mnWl3toCjc0qrG9ib0evLOR4CjWCwEdT90ur61hGT0mzlmRqgmOoZ6CCKJicm
	cjpbgCFEVQ7+t2xwAIuwWhUHc2rllL/0lqk6ER/t0MzDiEtRT76KA0rAvgjWlgeaS5uj
	ziB1bFB7upuCDIauawUBIF6pOLZ5qku/2GvBY=
Received: by 10.151.92.14 with SMTP id u14mr3259503ybl.275.1305553199326;
	Mon, 16 May 2011 06:39:59 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id b4sm1552105ybo.8.2011.05.16.06.39.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 06:39:58 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 13:39:47 +0000
Message-Id: <1305553187-25173-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2] libpcsclite: add version 1.7.2
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
X-List-Received-Date: Mon, 16 May 2011 13:42:52 -0000

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
index 0000000..7626a4d
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
+	sed -i 's,/usr/sbin,${sbindir},g' "${D}/${sysconfdir}/init.d/pcscd"
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



