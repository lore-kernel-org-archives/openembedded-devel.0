Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TRfxj-0002cf-IK
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 11:12:19 +0200
Received: by mail-lb0-f175.google.com with SMTP id y2so1589361lbk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 01:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8rxR3l2DINjVJG2I/vHlACpNTP0Mx27yccdpjMNQMro=;
	b=sTas1aiyiMWMSkiPALYfBeuN68lQ/cIpE0VJMlF8dZT6p9dNmw0ay6cxkphkM1EqcV
	kh2k2zUylg2P2G6SBiNc8DYUrtdhVKIPMcqYhxpOJ1pdzWnRUpt5605XsFACdHhEFWe2
	JM3c9phhEW6PU2t+exQ5UIPS0gNWRMtIrA8tNIBahQ2E6cKKnrNgDVc2V2sg+ouij2wM
	zZmXSKcBFv6fWfhKjhm9A16raMDuVnR/cg+gkVAKy4RdchB6LIsr2aaXeTn5x4tvaWZd
	713WKoPsKFy2AEiTaSHnLe78xgvL/1JAeeG5MMy4L4BQiXLXPw2q3TTyA+8ObjJ8FzGv
	HzZw==
Received: by 10.152.106.171 with SMTP id gv11mr20146803lab.26.1351241926655;
	Fri, 26 Oct 2012 01:58:46 -0700 (PDT)
Received: from Perrin.lynet.no ([37.191.128.59])
	by mx.google.com with ESMTPS id hu6sm283139lab.13.2012.10.26.01.58.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Oct 2012 01:58:45 -0700 (PDT)
From: Martin Ertsaas <martiert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2012 10:58:39 +0200
Message-Id: <1351241920-15135-1-git-send-email-martiert@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-systemd][PATCH v2 1/2] meta-systemd: ntp: Change version to what is used in meta-networking.
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
X-List-Received-Date: Fri, 26 Oct 2012 09:12:19 -0000

Change version of ntp to match that in meta-networking. Also change ntpdate to ntp-date to
match the names used in meta-networking.

Signed-off-by: Martin Ertsaas <martiert@gmail.com>
---
 .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |   20 --------------------
 .../recipes-support/ntp/ntp_4.2.6p5.bbappend       |   20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p5.bbappend

diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend b/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
deleted file mode 100644
index c6cd031..0000000
--- a/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 1}"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SYSTEMD_PACKAGES = "${PN}-systemd ntpdate-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "ntpd.service"
-SYSTEMD_SERVICE_ntpdate-systemd = "ntpdate.service"
-
-SRC_URI += " \
-	file://ntpdate.service \
-        file://ntpd.service \
-"
-
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
-	install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
-}
diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p5.bbappend b/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p5.bbappend
new file mode 100644
index 0000000..bc2b2dd
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p5.bbappend
@@ -0,0 +1,20 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SYSTEMD_PACKAGES = "${PN}-systemd ${PN}-date-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "ntpd.service"
+SYSTEMD_SERVICE_${PN}-date-systemd = "ntpdate.service"
+
+SRC_URI += " \
+	file://ntpdate.service \
+        file://ntpd.service \
+"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
+	install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
+}
-- 
1.7.8.6



