Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3Q-0001fb-6M
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:12 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2267906wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=p1hhXN/XnaMpeybkkzGv2W6rAVwcH0Jb+5xeWWKU+3s=;
	b=eXO5xD7Y+8Kedmm+pI4jg1vO9bLtsvp/aX0wBtNRP1eJ/jUvpyh6q5Mg4lmw8iCXwn
	gm54S1KsDepPKBrgu6jNnPvw5Yo0XFIqi5S3yExMMB1kZH9HxiMFG6a9kzGmO+p1NKcs
	92Rr+UlFkLW3NMna3coYuj/4tz3GI+psFPI/TSd+j8NCxt/mzfUp/2hjftjgAZdsYFBQ
	XgMy1ippYjTi2XqEBxiQZRsQeQIlEu9uZtybu0S2BPMKjo1HzD/GZq8toRGcbtOVFhlu
	qdq+a2qFqvEQboAw8IHGBHL29FotKVKXijQdq4F4U5ZmgWQwAY/OTmRnQyeUh0IFEoT1
	EP0A==
Received: by 10.180.85.129 with SMTP id h1mr15695534wiz.2.1339364501868;
	Sun, 10 Jun 2012 14:41:41 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:39 +0200
Message-Id: <1339364820-2880-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 06/27] busybox: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:12 -0000
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
1.7.4.4



