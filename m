Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ROXhI-0006yA-QT
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 17:41:54 +0100
Received: by mail-yx0-f175.google.com with SMTP id m3so2138832yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 08:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ceOH/ogy6HCKTu2Vx4zAPn2NyseEo4kO9pFiNCjhAQo=;
	b=muFS8G5LxWXpDEB15qzPgn6+1A/98oEDYn9WjgeMy3y5bfBK5pPBIkPVeOTBB0u97P
	328tBUZIOaaktoPCod/hep1t8pUg3UlCUg8gsNSbzDiwyF216f76K0CKCNuuogzvA+xF
	UjyBIrsIFrKsKQdQDA+pRAOAv0DtMioBLNtJs=
Received: by 10.146.173.19 with SMTP id v19mr323466yae.4.1320942915864;
	Thu, 10 Nov 2011 08:35:15 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f76sm12832266yhj.21.2011.11.10.08.35.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 08:35:14 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Nov 2011 16:35:05 +0000
Message-Id: <2c620d32a60fd571d00a4b98b572d60f49bf8b0f.1320942838.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320942838.git.otavio@ossystems.com.br>
References: <cover.1320942838.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320942838.git.otavio@ossystems.com.br>
References: <cover.1320942838.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] atftp: add 0.7 version
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
X-List-Received-Date: Thu, 10 Nov 2011 16:41:54 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   51 ++++++++++++++++++++
 meta-oe/recipes-extended/atftp/files/atftpd.init   |   37 ++++++++++++++
 .../recipes-extended/atftp/files/atftpd.service    |   11 ++++
 3 files changed, 99 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/atftp/atftp_0.7.bb
 create mode 100644 meta-oe/recipes-extended/atftp/files/atftpd.init
 create mode 100644 meta-oe/recipes-extended/atftp/files/atftpd.service

diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bb b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
new file mode 100644
index 0000000..b84819a
--- /dev/null
+++ b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "Advanced TFTP server and client"
+SECTION = "network"
+PRIORITY = "optional"
+HOMEPAGE = "http://packages.debian.org/atftp"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;name=archive \
+           ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;name=patch \
+           file://atftpd.init \
+           file://atftpd.service"
+
+S = "${WORKDIR}/atftp-${PV}.dfsg"
+
+inherit autotools update-rc.d systemd useradd
+
+SYSTEMD_PACKAGES = "atftpd-systemd"
+SYSTEMD_SERVICE_atftpd-systemd = "atftpd.service"
+
+INITSCRIPT_NAME = "atftpd"
+INITSCRIPT_PARAMS = "defaults 80"
+
+USERADD_PACKAGES = "atftpd"
+USERADD_PARAM_atftpd = "--system --no-create-home --shell /bin/false \
+                        --user-group nobody"
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/atftpd.init ${D}${sysconfdir}/init.d/atftpd
+
+    install -d ${D}${base_libdir}/systemd/system
+    install -m 644 ${WORKDIR}/atftpd.service ${D}${base_libdir}/systemd/system
+
+    install -d ${D}/srv/tftp
+
+    rm ${D}${sbindir}/in.tftpd
+}
+
+PACKAGES =+ "atftpd-systemd atftpd"
+
+FILES_${PN} = "${bindir}/*"
+
+FILES_${PN}d = "${sbindir}/* ${sysconfdir}/init.d/* /srv/tftp"
+
+FILES_atftpd-systemd += "${base_libdir}/systemd"
+RDEPENDS_atftpd-systemd += "atftpd"
+
+SRC_URI[archive.md5sum] = "aa269044a6f992eca78fee2f6119643c"
+SRC_URI[archive.sha256sum] = "18815f5b67290fac087c6b9da28dfa5e0feb722096f5c5de52e59b46026da559"
+SRC_URI[patch.md5sum] = "1636f199bf32c754a7bf34a5c647d138"
+SRC_URI[patch.sha256sum] = "0df33f6c09c2b2de58a84d7bb757844fc9538cd4d6c8d9c463da5270ebc2e41d"
diff --git a/meta-oe/recipes-extended/atftp/files/atftpd.init b/meta-oe/recipes-extended/atftp/files/atftpd.init
new file mode 100644
index 0000000..161d97a
--- /dev/null
+++ b/meta-oe/recipes-extended/atftp/files/atftpd.init
@@ -0,0 +1,37 @@
+#! /bin/sh
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/atftpd and type
+# > update-rc.d atftpd defaults 60
+#
+
+
+test -f /usr/sbin/atftpd || exit 0
+
+test -d /srv/tftp || mkdir -p /srv/tftp
+
+case "$1" in
+  start)
+    echo -n "Starting tftp daemon: atftpd"
+    start-stop-daemon --start --quiet --exec /usr/sbin/atftpd -- --daemon --port 69
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping tftp daemon: atftpd"
+    start-stop-daemon --stop --quiet --exec /usr/sbin/atftpd
+    echo "."
+    ;;
+  reload|force-reload)
+    start-stop-daemon --stop --quiet --signal 1 --exec /usr/sbin/atftpd
+    ;;
+  restart)
+    $0 stop
+    sleep 1
+	$0 start
+    ;;
+  *)
+    echo "Usage: /etc/init.d/atftpd {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-extended/atftp/files/atftpd.service b/meta-oe/recipes-extended/atftp/files/atftpd.service
new file mode 100644
index 0000000..c7aa29c
--- /dev/null
+++ b/meta-oe/recipes-extended/atftp/files/atftpd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Advanced TFTP Server
+After=syslog.target network.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/atftpd.pid
+ExecStart=/usr/sbin/atftpd --daemon --port 69
+
+[Install]
+WantedBy=multi-user.target
-- 
1.7.2.5



