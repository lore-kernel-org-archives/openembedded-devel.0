Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9df6-00059r-Hg
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 15:34:16 +0100
Received: by wibhj13 with SMTP id hj13so3333557wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 07:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=55aAH5dvx3vpanWLvVooS6WDDs9V8/xerHhHfpbMXRI=;
	b=TUgMqXcO/R9HQCXRCpVEd4zpn3JoJaCiCaghSXrljTl9Q1emBF3HaEAt+KQ1qz4w7W
	BTBVjTEPq8HD/ghVrkOm0ErZ/8p5IHbSDt7Ob2udavblXQSBkJObMaf0byNFkT8yxoPA
	d2vStd0sojQtGkjLE+t5ApzRkqZs20FsQ775sxPaaktzmlaXyxN4njCMaziL3+D2+hj/
	Ljt5ONSlOjX5/nEU7kZUwigbljVOpSje+nnFV1yzNLvioRZcCP7zWofEgblqA4vB/yLA
	PUiaXvxeWRUg/DguNQfw505AjzUXNwpFc+2u5TOSvUDeQq6i9BUbJ5sAY5nrG55q3N+W
	9R+Q==
Received: by 10.216.135.225 with SMTP id u75mr6661903wei.97.1332167125285;
	Mon, 19 Mar 2012 07:25:25 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm41884944wib.4.2012.03.19.07.25.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 07:25:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2012 15:25:14 +0100
Message-Id: <1332167114-24083-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1332167114-24083-1-git-send-email-koen@dominion.thruhere.net>
References: <1332167114-24083-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlW6qjyQYvn7P2+m5okSVfP+GcPLWNvsdGX0CXsiOm42AyQCo2/qVVRW4TxRBUkqcLbqx8V
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 3/3] busybox: update bbappend to match update recipe in oe-core
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
X-List-Received-Date: Mon, 19 Mar 2012 14:34:16 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |   26 --------------------
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |   26 ++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
 create mode 100644 meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend

diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
deleted file mode 100644
index 2c73732..0000000
--- a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
+++ /dev/null
@@ -1,26 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 3}"
-
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://busybox-syslog.service.in \
-            file://busybox-klogd.service.in \
-            file://busybox-syslog.default"
-
-SYSTEMD_PACKAGES = "${PN}-syslog-systemd"
-SYSTEMD_SERVICE_${PN}-syslog-systemd = "busybox-syslog.service"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/default
-	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
-
-	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
-	     > ${D}${systemd_unitdir}/system/busybox-syslog.service
-	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
-	     > ${D}${systemd_unitdir}/system/busybox-klogd.service
-
-	ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
-}
-FILES_${PN}-syslog-systemd = "${systemd_unitdir}/system/syslog.service"
diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
new file mode 100644
index 0000000..2c73732
--- /dev/null
+++ b/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -0,0 +1,26 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 3}"
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
+	install -d ${D}${sysconfdir}/default
+	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
+
+	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
+	     > ${D}${systemd_unitdir}/system/busybox-syslog.service
+	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
+	     > ${D}${systemd_unitdir}/system/busybox-klogd.service
+
+	ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
+}
+FILES_${PN}-syslog-systemd = "${systemd_unitdir}/system/syslog.service"
-- 
1.7.2.5



