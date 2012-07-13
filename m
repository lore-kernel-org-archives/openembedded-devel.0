Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSN-00080Q-A4
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:36 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247528bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=0F3w+wdjDc2E3m3yejWPobj47UFPE6wAlLD/U2J/FiY=;
	b=Y+VeWQwjG4lap7X7ht9+B1c/hS9USQkCFA/nPlgfwQNhPRBMVA3CXjr5okrUtNh+5r
	puciTes10HBRNioExUHfdK0jxOwdDYQ1LIRogWUyz/RIWayqZdvZWBdAAaZGOguhDuKl
	ML27IW4i2G+3p1y4545SF9RSFr4x+RcYr3QZhNeszo64O5RIdlvd2sGG6Gi1rF2EvEyp
	ejFXtKHde6s3RQR3/rPt65VN9KkWoR4mOzOl8r0UTxx8Ge8Ij2ZIHsVnBKXveysTXEuE
	eNDecZbeNT3WA9I4DbMe19Slfmuiv0QCN5P7xsGoWsQqRJxrTRTH6bg9AmkhYTPm1WC9
	Y6dg==
Received: by 10.204.156.4 with SMTP id u4mr176771bkw.6.1342168283301;
	Fri, 13 Jul 2012 01:31:23 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:19 +0200
Message-Id: <1342168240-7760-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 11/32] busybox: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |   20 +---------------
 .../busybox/busybox/busybox-klogd.service.in       |    0
 .../busybox/busybox/busybox-syslog.service.in      |    0
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |   23 ++++++++++++++++++++
 4 files changed, 25 insertions(+), 18 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/busybox/busybox/busybox-klogd.service.in (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/busybox/busybox/busybox-syslog.service.in (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend

diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
index 786e1d5..e9dd4ac 100644
--- a/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -1,27 +1,11 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 4}"
+PRINC := "${@int(PRINC) + 5}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI += "file://busybox-syslog.service.in \
-            file://busybox-klogd.service.in \
-            file://busybox-syslog.default"
-
-SYSTEMD_PACKAGES = "${PN}-syslog-systemd"
-SYSTEMD_SERVICE_${PN}-syslog-systemd = "busybox-syslog.service"
+SRC_URI += "file://busybox-syslog.default"
 
 do_install_append() {
 	install -d ${D}${sysconfdir}/default
 	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
-
-	install -d ${D}${systemd_unitdir}/system
-	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
-	     > ${D}${systemd_unitdir}/system/busybox-syslog.service
-	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
-	     > ${D}${systemd_unitdir}/system/busybox-klogd.service
-
-	ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
 }
-FILES_${PN}-syslog-systemd = "${systemd_unitdir}/system/syslog.service"
diff --git a/meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in b/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in
similarity index 100%
rename from meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in
rename to meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in
diff --git a/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in b/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
similarity index 100%
rename from meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
rename to meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
new file mode 100644
index 0000000..a0ae2ce
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -0,0 +1,23 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://busybox-syslog.service.in \
+            file://busybox-klogd.service.in"
+
+SYSTEMD_PACKAGES = "${PN}-syslog-systemd"
+SYSTEMD_SERVICE_${PN}-syslog-systemd = "busybox-syslog.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
+	     > ${D}${systemd_unitdir}/system/busybox-syslog.service
+	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
+	     > ${D}${systemd_unitdir}/system/busybox-klogd.service
+
+	ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
+}
+FILES_${PN}-syslog-systemd = "${systemd_unitdir}/system/syslog.service"
-- 
1.7.6.5



