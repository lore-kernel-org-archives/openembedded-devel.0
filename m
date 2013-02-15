Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U6R7F-00050p-AJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 20:38:38 +0100
Received: by mail-pa0-f46.google.com with SMTP id kp14so1892594pab.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 11:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=L/mvsuh5hwftK7PdQDeaw8VXsEzk92EZINweY56PXbU=;
	b=KaVwx0JEDtAs+JFnBukOFyZziMoe6KntRAGDndvfGj2oTMCEcl5u1YeuMU1TvVjo0b
	YUR95v7hzIFI6wiO90WHnfvsTBFnytsqNmcbryfsLOw5cdj74HhCsEK2mUsSK3ceHujp
	wW5WRHqACRQtHT/dgwnJJZ703QYGNiSPKT37XbNDXwUDmnc49ez6yKeURrc+XpKP67si
	GBWyaGSpRrA4IoPKeLPHMpgc0XKTXQFnfGPFccy02NwFzQeNbqFgFzsJ8BCtE07ju94o
	JA7fk6qCD/Jdl2YmDPklchWi85b1/nzaIwkQkhbsMc+JO0X4hmu/fFp9RZooaT1fuFP1
	jaGg==
X-Received: by 10.68.213.7 with SMTP id no7mr8568344pbc.48.1360956150799;
	Fri, 15 Feb 2013 11:22:30 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id iu10sm5549152pbc.13.2013.02.15.11.22.29
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 11:22:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Feb 2013 11:22:18 -0800
Message-Id: <1360956138-30930-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][meta-systemd][PATCH] ntp: Create a separate package for sntp
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
X-List-Received-Date: Fri, 15 Feb 2013 19:38:38 -0000

sntp provides the functionality of obsoleted ntpdate
so we have option of using ntpd as well as sntp
sntp does the immediate one time sync with time
server and corrects the tme immediately. it
replaces ntpdate nicely.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp.inc        |    3 ++-
 .../meta-networking/recipes-support/ntp/ntp/sntp   |    1 +
 .../recipes-support/ntp/ntp/sntp.service           |   11 +++++++++++
 .../recipes-support/ntp/ntp_4.2.6p5.bbappend       |    9 ++++++++-
 4 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp
 create mode 100644 meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp.service

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index d93f22d..cec0f22 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -54,7 +54,7 @@ do_install_append() {
 	ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
 }
 
-PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils"
+PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
 # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
 
 # ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
@@ -69,6 +69,7 @@ RSUGGESTS_${PN} = "iana-etc"
 
 FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir}"
 FILES_${PN}-tickadj = "${bindir}/tickadj"
+FILES_sntp = "${bindir}/sntp"
 FILES_${PN}-utils = "${bindir}"
 FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate-sync ${bindir}/ntpdate-sync ${sysconfdir}/default/ntpdate"
 
diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp b/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp
new file mode 100644
index 0000000..9529cdf
--- /dev/null
+++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp
@@ -0,0 +1 @@
+NTPSERVER="pool.ntp.org"
diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp.service
new file mode 100644
index 0000000..0f09e43
--- /dev/null
+++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Simple Network Time Service Client
+After=network.target
+
+[Service]
+Type=oneshot
+EnvironmentFile=-/etc/default/sntp
+ExecStart=/usr/bin/sntp -s $NTPSERVER
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
index 4580cf7..d9715bd 100644
--- a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
@@ -4,19 +4,26 @@ PRINC := "${@int(PRINC) + 1}"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SYSTEMD_PACKAGES = "${PN} ntpdate"
+SYSTEMD_PACKAGES = "${PN} ntpdate sntp"
 SYSTEMD_SERVICE_${PN} = "ntpd.service"
+SYSTEMD_SERVICE_sntp = "sntp.service"
 SYSTEMD_SERVICE_ntpdate = "ntpdate.service"
 
 FILES_ntpdate += "${systemd_unitdir}/system/ntpdate.service"
+FILES_sntp += "${sysconfdir}/default/sntp"
 
 SRC_URI += " \
 	file://ntpdate.service \
         file://ntpd.service \
+        file://sntp.service \
+        file://sntp \
 "
 
 do_install_append() {
 	install -d ${D}${systemd_unitdir}/system
+	install -d ${D}${sysconfdir}/default
 	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
 	install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
+	install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/system/
+	install -m 0644 ${WORKDIR}/sntp ${D}${sysconfdir}/default/
 }
-- 
1.7.9.5



