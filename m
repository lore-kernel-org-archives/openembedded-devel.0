Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIpmP-0000FH-3K
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 00:15:17 +0200
Received: by yia13 with SMTP id 13so1645011yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 15:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=ViiuTD2PfHEsP/ezQx7Dgs+5Mp9sxXcBh6mQJdYzBK0=;
	b=j/jVIygrMysUVIiKU0ycbjt7auwuKIPVULaHKLJrlNohHVfih4CibKaRcGTF94dZcV
	x29rE2JT52Ingn+11qvl0WLeBEiGnZe8uAKgIwX63hjyonWs2de5PeRJ67sUrURvg9II
	8ZkGDrX2/vv9JpNs7bcS0+C/tmk8vtxPc7moE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=f7ICwDBKwajg//oys5xdQipPmZSJSjkm2gpQe5x/Bkk5mxizLa2QsuNFy8TZW+Dtnq
	4AyVhLxv/+zBC0nymPbCdBdBOJZNxTUko9OrtwRvxJPOrxQcmuxU3If77Pj3tEkEykR/
	6LraVM1C1oyC+75B1oEMybGY/o96LSUY93k0o=
Received: by 10.236.109.39 with SMTP id r27mr6251255yhg.56.1304806349877;
	Sat, 07 May 2011 15:12:29 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g2sm2005922yhc.76.2011.05.07.15.12.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 15:12:29 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2011 22:11:54 +0000
Message-Id: <1304806316-9716-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304806316-9716-5-git-send-email-otavio@ossystems.com.br>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-3-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-4-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-5-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 6/8] p910nd: add 0.95 version
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
X-List-Received-Date: Sat, 07 May 2011 22:15:17 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/p910nd/files/avahi       |    9 ++++
 meta-oe/recipes-support/p910nd/files/p910nd.init |   38 ++++++++++++++++
 meta-oe/recipes-support/p910nd/p910nd_0.95.bb    |   51 ++++++++++++++++++++++
 3 files changed, 98 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/p910nd/files/avahi
 create mode 100755 meta-oe/recipes-support/p910nd/files/p910nd.init
 create mode 100644 meta-oe/recipes-support/p910nd/p910nd_0.95.bb

diff --git a/meta-oe/recipes-support/p910nd/files/avahi b/meta-oe/recipes-support/p910nd/files/avahi
new file mode 100644
index 0000000..313bc14
--- /dev/null
+++ b/meta-oe/recipes-support/p910nd/files/avahi
@@ -0,0 +1,9 @@
+<service-group>
+  <name replace-wildcards="yes">foonas p910nd on %h</name>
+  <service protocol="any">
+    <host-name></host-name>
+    <type>_pdl-datastream._tcp</type>
+    <port>9100</port>
+    <txt-record>product=foonas network printer</txt-record>
+  </service>
+</service-group>
diff --git a/meta-oe/recipes-support/p910nd/files/p910nd.init b/meta-oe/recipes-support/p910nd/files/p910nd.init
new file mode 100755
index 0000000..e5693e9
--- /dev/null
+++ b/meta-oe/recipes-support/p910nd/files/p910nd.init
@@ -0,0 +1,38 @@
+#! /bin/sh
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/p910nd and type
+# > update-rc.d p910nd defaults 60
+#
+# 
+
+
+test -f /usr/sbin/p910nd || exit 0
+
+test -d /var/spool/p910nd || mkdir -p /var/spool/p910nd
+
+case "$1" in
+  start)
+    echo -n "Starting p910nd printer daemon: p910nd"
+    /usr/sbin/p910nd -b -f /dev/usb/lp0 0
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping p910nd printer daemon: p910nd"
+    start-stop-daemon --stop --quiet --exec /usr/sbin/p9100d
+   echo "."
+    ;;
+  restart)
+    echo -n "Stopping p910nd printer daemon: p910nd"
+    start-stop-daemon --stop --quiet --exec /usr/sbin/p9100d
+    sleep 2
+    echo -n " ... Starting p910nd printer daemon: p910nd " 
+    /usr/sbin/p910nd -b -f /dev/usb/lp0 0
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/p910nd {start|stop|restart}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.95.bb b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
new file mode 100644
index 0000000..9a85b86
--- /dev/null
+++ b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "A small network printer daemon for embedded situations that passes the job directly to the printer."
+SECTION = "console/utils"
+HOMEPAGE = "http://p910nd.sourceforge.net/"
+SECTION = "console/utils"
+RDEPENDS_${PN}-avahi = "avahi"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+PR = "r0"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "p910nd"
+INITSCRIPT_PARAMS = "defaults 60 "
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/p910nd/p910nd-${PV}.tar.bz2 \
+           file://p910nd.init \
+           file://avahi"
+
+SRC_URI[md5sum] = "c7ac6afdf7730ac8387a8e87198d4491"
+SRC_URI[sha256sum] = "7d78642c86dc247fbdef1ff85c56629dcdc6b2a457c786420299e284fffcb029"
+
+PACKAGES_prepend = "${PN}-avahi "
+
+FILES_${PN}-avahi += "${sysconfdir}/avahi/services/p910nd.service"
+
+do_compile () {
+	${CC} ${LDFLAGS} -o p910nd p910nd.c
+}
+
+# The avahi stuff makes it work with bonjour printing
+do_install () {
+	install -D -m 0755 ${S}/p910nd ${D}${sbindir}/p910nd
+	install -D -m 0644 ${S}/p910nd.conf ${D}${sysconfdir}/p910nd.conf
+	install -D -m 0755 ${WORKDIR}/p910nd.init ${D}${sysconfdir}/init.d/p910nd
+	install -D -m 0755 ${WORKDIR}/avahi ${D}${sysconfdir}/avahi/services/p910nd.service
+}
+
+pkg_postinst_${PN}-avahi_append() {
+#!/bin/sh
+
+if [ "x$D" != "x" ] ; then
+        exit 1
+fi
+
+# If avahi is already running reload it to pickup the p910nd config
+PAV=`pidof avahi-daemon`
+if [ "x$PAV" != "x" ] ; then
+        /etc/init.d/avahi-daemon reload
+fi
+}
-- 
1.7.2.5



