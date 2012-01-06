Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjF8I-00081Y-8Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 20:07:18 +0100
Received: by mail-gy0-f175.google.com with SMTP id r17so795459ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 10:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=EqSwZI6B9p0H20M4vLj0xFdnBlv8EvwZS+SZtKj/wj0=;
	b=g4C4N80ImjokxQSDMooGnDC2fae3r327YVl5zGPxkrkHnVcnNllO0Exgynb7waTZRo
	20YMH+PwxUNzKCWCXEXyHMQJmAWdSqWmfWowHLCvPtrt/qTC7pym/v3MPdUBjO+88k14
	wlFO1MDmx3wrxC7rMOrWAJ96v7cKMFEUqpEnE=
Received: by 10.236.192.229 with SMTP id i65mr9379013yhn.4.1325876396150;
	Fri, 06 Jan 2012 10:59:56 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f17sm17744177ann.21.2012.01.06.10.59.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 10:59:55 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jan 2012 18:59:34 +0000
Message-Id: <5456f45166311ed151abb6b3bbf80a3c2f3940a9.1325876341.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325876341.git.otavio@ossystems.com.br>
References: <cover.1325876341.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325876341.git.otavio@ossystems.com.br>
References: <cover.1325876341.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/5] busybox: add systemd support for syslog service
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
X-List-Received-Date: Fri, 06 Jan 2012 19:07:18 -0000

This uses a busybox-syslog default file to pass options to
syslogd. For it, the 'OPTIONS' variable needs to be set.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../busybox/busybox/busybox-klogd.service.in       |    8 +++++
 .../busybox/busybox/busybox-syslog.default         |    1 +
 .../busybox/busybox/busybox-syslog.service.in      |   13 ++++++++
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |   30 ++++++++++++++++++++
 4 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in
 create mode 100644 meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
 create mode 100644 meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
 create mode 100644 meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend

diff --git a/meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in b/meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in
new file mode 100644
index 0000000..d7c7755
--- /dev/null
+++ b/meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in
@@ -0,0 +1,8 @@
+[Unit]
+Description=Kernel Logging Service
+
+[Service]
+ExecStart=@base_sbindir@/klogd -n
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default b/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
new file mode 100644
index 0000000..8a21e6d
--- /dev/null
+++ b/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
@@ -0,0 +1 @@
+OPTIONS="-C64"
diff --git a/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in b/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
new file mode 100644
index 0000000..db90082
--- /dev/null
+++ b/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
@@ -0,0 +1,13 @@
+[Unit]
+Description=System Logging Service
+
+[Service]
+ExecStartPre=/bin/systemctl stop systemd-kmsg-syslogd.service
+EnvironmentFile=-/etc/default/busybox-syslog
+ExecStart=@base_sbindir@/syslogd -n $OPTIONS
+Sockets=syslog.socket
+Wants=busybox-klogd.service
+
+[Install]
+WantedBy=multi-user.target
+Also=busybox-klogd.service
diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
new file mode 100644
index 0000000..46177e3
--- /dev/null
+++ b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
@@ -0,0 +1,30 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://busybox-syslog.service.in \
+            file://busybox-klogd.service.in \
+            file://busybox-syslog.default"
+
+SYSTEMD_PACKAGES = "${PN}-syslog-systemd"
+SYSTEMD_SERVICE_${PN}-syslog-systemd = "busybox-syslog.service"
+
+do_install_append() {
+	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
+
+	install -d ${D}${base_libdir}/systemd/system
+	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
+	     > ${D}${base_libdir}/systemd/system/busybox-syslog.service
+	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
+	     > ${D}${base_libdir}/systemd/system/busybox-klogd.service
+
+	ln -sf /dev/null ${D}${base_libdir}/systemd/system/syslog.service
+}
+
+PACKAGES += "${PN}-syslog-systemd"
+
+RDEPENDS_${PN}-syslog-systemd += "${PN}-syslog"
+FILES_${PN}-syslog-systemd = "${base_libdir}/systemd"
-- 
1.7.2.5



