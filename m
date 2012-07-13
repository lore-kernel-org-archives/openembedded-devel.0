Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSO-0007zx-I9
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:37 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247517bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=yDKZed6D2woxSt5rRTwq/HVkByYeZ7/tKozcrqnIGGA=;
	b=gmTBCo+4uT8XtbuQLcLbOMJxXfLqv0ZySAONJbWzO2BZwwGVoPLYSm0QmaxadXYMxG
	eoFUwuJDemFj96pD+xRlhSsxGCaNFmkmEiEAuElRL++HnLZhGAdOojM482j0iXC2lMle
	x2oZFDElrLBEvDk3+6RZvaq42rQ+qHy2o9ntsyzGnM+CJxSwjxdft8HXIoWEKseLOwV7
	jToeBhLYFXes6QrwIPZwGVzrspfYk3k66RHWsosmrFSlLbwTfaD8DnG0w1Xu/fuMWX4q
	94tuivpGbXeYSc0vwpa+9BHLe2mRZgjMXpWiVPaqRoKq2FGbhf1dvQcqCzRN3Kkv9cIp
	2L5Q==
Received: by 10.205.139.6 with SMTP id iu6mr173292bkc.20.1342168284714;
	Fri, 13 Jul 2012 01:31:24 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:20 +0200
Message-Id: <1342168240-7760-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe,V2 12/32] ntp: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   18 +-----------------
 .../meta-oe/recipes-support/ntp/ntp}/ntpd.service  |    0
 .../recipes-support/ntp/ntp}/ntpdate.service       |    0
 .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |   20 ++++++++++++++++++++
 4 files changed, 21 insertions(+), 17 deletions(-)
 rename {meta-oe/recipes-support/ntp/files => meta-systemd/meta-oe/recipes-support/ntp/ntp}/ntpd.service (100%)
 rename {meta-oe/recipes-support/ntp/files => meta-systemd/meta-oe/recipes-support/ntp/ntp}/ntpdate.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend

diff --git a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
index a3d719e..89a272a 100644
--- a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
+++ b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
@@ -1,11 +1,6 @@
 require ntp.inc
 
-PR = "r5"
-
-inherit systemd
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "ntpd.service"
+PR = "r6"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
         file://tickadj.c.patch \
@@ -13,8 +8,6 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
         file://ntpd \
         file://ntp.conf \
         file://ntpdate \
-        file://ntpdate.service \
-        file://ntpd.service \
 "
 
 SRC_URI[md5sum] = "59876a9009b098ff59767ee45a88ebd2"
@@ -28,17 +21,8 @@ do_install_append() {
 	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
-
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
-	install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
 }
 
-PACKAGES =+ "${PN}-systemd"
-
-FILES_${PN}-systemd = "${systemd_unitdir}/system/"
-RDEPENDS_${PN}-systemd = "${PN}"
-
 FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
 FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd"
 FILES_${PN}-tickadj = "${bindir}/tickadj"
diff --git a/meta-oe/recipes-support/ntp/files/ntpd.service b/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service
similarity index 100%
rename from meta-oe/recipes-support/ntp/files/ntpd.service
rename to meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service
diff --git a/meta-oe/recipes-support/ntp/files/ntpdate.service b/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service
similarity index 100%
rename from meta-oe/recipes-support/ntp/files/ntpdate.service
rename to meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service
diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend b/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
new file mode 100644
index 0000000..c6cd031
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
@@ -0,0 +1,20 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SYSTEMD_PACKAGES = "${PN}-systemd ntpdate-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "ntpd.service"
+SYSTEMD_SERVICE_ntpdate-systemd = "ntpdate.service"
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
1.7.6.5



