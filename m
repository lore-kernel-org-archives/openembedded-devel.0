Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TRSr3-0006T7-SI
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 21:12:33 +0200
Received: by mail-la0-f47.google.com with SMTP id h5so1879814lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2012 11:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8rxR3l2DINjVJG2I/vHlACpNTP0Mx27yccdpjMNQMro=;
	b=UjBPqX7rNp2aeG3pd0R/Ar86RIh0nwNfaIyxSqjnD1wk1kXRaAGk3W3QDBP10anfXr
	h/EHiXhAr3lBIO69/UoyyS7vtIgtygYgfvYD2QLA7AXPFGFFDdIl8skJ/ygblo6yCh+D
	tbLpFmwZSOJGyRXAmc/7SjM9Hf4QtR9PVvwevbVau3VCBQYKi/x7HC/j5NCEGEgSqoAD
	SihKkUlHtLbHeqBNYCEIXd2cF6CWZ8dVqAmFugLYkzGNP8lBD3Rj6D81krBclb4ks9H1
	gOke8pHOAM0LglbBDRl97/bkBUgJ4tNo4q5847+krwMU6cIqW+GN3/CGUgpbB8/0aEZO
	wP0w==
Received: by 10.112.25.168 with SMTP id d8mr8002862lbg.61.1351191544839;
	Thu, 25 Oct 2012 11:59:04 -0700 (PDT)
Received: from Perrin.lynet.no ([37.191.128.59])
	by mx.google.com with ESMTPS id jk8sm6151501lab.7.2012.10.25.11.59.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Oct 2012 11:59:03 -0700 (PDT)
From: Martin Ertsaas <martiert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 20:58:48 +0200
Message-Id: <1351191528-13408-1-git-send-email-martiert@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-systemd][PATCH] meta-systemd: ntp: Change version to what is used in meta-networking.
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
X-List-Received-Date: Thu, 25 Oct 2012 19:12:34 -0000

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



