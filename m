Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1USCtR-0003PW-RV
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 22:54:25 +0200
Received: by mail-pb0-f48.google.com with SMTP id xb4so485282pbc.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 13:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=uxHqY/M6/4+vskRfZBafJxdGHXy8sA9YZkRvoZeuqJY=;
	b=zJJ+JZ2mca65rCAdDEUHrEhSBNyc1e04yrYG2Lj1gsdOLi+FE8FMDaC7TLNZ8mBx64
	9jkEoFIwLFHYBEhherQAT8985DY65RWFzDtinUdVKvnyLzmgr7aEwmPxDzJz3XR0IMCQ
	RdrSls5G7U373obRBzCfYNJpSbz4CfzbYAOkM+9Qd/1BkjBq54Lvi+ULpqfg6eB1ud5v
	1SgAWAQebDIO0of4QQf7wafjupnxREf64SHaKKG+ob/K4GtrbH/p7ObSrEJGawKJW59t
	F05AuKBWd5NMhst/6ZogVuDU6S2WpmaiChr8uJlAVwteLAGTzz2KyJM4eXYMJolCW1wM
	N/6Q==
X-Received: by 10.68.209.162 with SMTP id mn2mr5388742pbc.190.1366144610377;
	Tue, 16 Apr 2013 13:36:50 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id cp1sm3262263pbc.42.2013.04.16.13.36.48
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 13:36:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 13:35:50 -0700
Message-Id: <1366144550-1493-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH V2] ntp: Create a separate package for sntp
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
X-List-Received-Date: Tue, 16 Apr 2013 20:54:28 -0000

sntp provides the functionality of obsoleted ntpdate
so we have option of using ntpd as well as sntp
sntp does the immediate one time sync with time
server and corrects the tme immediately. it
replaces ntpdate nicely.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp.inc        |   13 +++++++++++--
 meta-networking/recipes-support/ntp/ntp/sntp       |    1 +
 .../recipes-support/ntp/ntp/sntp.service           |   11 +++++++++++
 3 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/sntp
 create mode 100644 meta-networking/recipes-support/ntp/ntp/sntp.service

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index a604b9c..004dc9b 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -20,6 +20,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpdate.default \
            file://ntpdate.service \
            file://ntpd.service \
+           file://sntp.service \
+           file://sntp \
 "
 
 inherit autotools update-rc.d systemd
@@ -52,15 +54,18 @@ do_install_append() {
 
     install -d ${D}/${sysconfdir}/default
     install -m 644 ${WORKDIR}/ntpdate.default ${D}${sysconfdir}/default/ntpdate
+    install -m 0644 ${WORKDIR}/sntp ${D}${sysconfdir}/default/
+
     install -d ${D}/${sysconfdir}/network/if-up.d
     ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/system/
 }
 
-PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils"
+PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils sntp"
 # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
 
 # ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
@@ -71,9 +76,10 @@ RPROVIDES_${PN}-utils = "${PN}-bin"
 RREPLACES_${PN}-utils = "${PN}-bin"
 RCONFLICTS_${PN}-utils = "${PN}-bin"
 
-SYSTEMD_PACKAGES = "${PN} ntpdate"
+SYSTEMD_PACKAGES = "${PN} ntpdate sntp"
 SYSTEMD_SERVICE_${PN} = "ntpd.service"
 SYSTEMD_SERVICE_ntpdate = "ntpdate.service"
+SYSTEMD_SERVICE_sntp = "sntp.service"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
@@ -94,6 +100,9 @@ FILES_ntpdate = "${bindir}/ntpdate \
     ${sysconfdir}/default/ntpdate \
     ${systemd_unitdir}/system/ntpdate.service \
 "
+FILES_sntp = "${bindir}/sntp \
+              ${sysconfdir}/default/sntp \
+             "
 
 CONFFILES_${PN} = "${sysconfdir}/ntp.conf"
 CONFFILES_ntpdate = "${sysconfdir}/default/ntpdate"
diff --git a/meta-networking/recipes-support/ntp/ntp/sntp b/meta-networking/recipes-support/ntp/ntp/sntp
new file mode 100644
index 0000000..f8c5895
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/sntp
@@ -0,0 +1 @@
+NTPSERVER="ntpserver.example.org"
diff --git a/meta-networking/recipes-support/ntp/ntp/sntp.service b/meta-networking/recipes-support/ntp/ntp/sntp.service
new file mode 100644
index 0000000..0f09e43
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/sntp.service
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
-- 
1.7.9.5



