Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TbAPQ-0007uY-KT
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 14:32:09 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so3901789eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 05:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=W6gDw1uGb0YFpjVe96EPVIxKH20QfqEU+mv6oRn3sWQ=;
	b=fZxgcDrORN2wLkqzM+D5pFsX0Mh/XCHRjOcgZKmQShcq8hSwP2BuNMxOswIAP33iqV
	xIrvAFewfRVxh88Qt0dHTmZySoLOC/b4If12TBW5aHMstKRglgBhMOZrRmkRRAgtKSts
	MZbXpPgrRiBmnNa8P03yBpJMJgVwsgP0EmdsfG+rZwhfbH9fcEfnyJsmalfZmlPvNjQ4
	X3AR7HOVb3oO+wu+54yc1YAWl3LNFfgSE9ncrg3Dse+HEjduxGji53lovF+vUiimFT9T
	kTPk+UFwLwYE3EKLFZ6O/egeJU6cuREEHiNLlMPNJo5fqeENqMcHAwCnX4HeVlt4nxLJ
	B4tg==
Received: by 10.14.203.3 with SMTP id e3mr45588570eeo.35.1353503883690;
	Wed, 21 Nov 2012 05:18:03 -0800 (PST)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id y44sm132711eel.14.2012.11.21.05.18.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 05:18:02 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2012 14:17:58 +0100
Message-Id: <1353503878-26344-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnHE0eA4hvx1sPpvk5nCSHQwVhePwScBJizGizil71b1JyBIS5758Mn938SoaCbvFBI2fMN
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH] Revert "ntp: Clean up recipes"
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
X-List-Received-Date: Wed, 21 Nov 2012 13:32:10 -0000

This breaks the upgrade path since 'ntpdate' has been renamed to 'ntp-date'. I don't know why this patch was applied when it was shot down on review.

This reverts commit d102fc3fe64844f5c85ff350874728139a63fe78.
---
 .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         |   11 +++--
 meta-networking/recipes-support/ntp/ntp.inc        |   49 ++------------------
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |   43 ++++++++++++++++-
 3 files changed, 53 insertions(+), 50 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
index e5851ae..a158990 100644
--- a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
+++ b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
@@ -1,10 +1,11 @@
-require ntp.inc
+require ntp_${PV}.bb
 DEPENDS = "openssl"
 
 S = "${WORKDIR}/ntp-${PV}"
 
-EXTRA_OECONF += "--with-openssl-libdir=${STAGING_LIBDIR} \
-		 --with-openssl-incdir=${STAGING_INCDIR}/openssl \
-		 --with-crypto"
+EXTRA_OECONF = "--with-openssl-libdir=${STAGING_LIBDIR} \
+	        --with-openssl-incdir=${STAGING_INCDIR}/openssl"
 
-FILES_${PN} += "${bindir}/sntp ${bindir}/ntp-keygen"
+
+SRC_URI[md5sum] = "98e16c7aa4ecd4c004b51bff18962e95"
+SRC_URI[sha256sum] = "9f4a5271a285d390c9225e3ea28f70049ea377d30fc6de4659007cfff278671a"
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index e2dbdad..1d740f0 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -8,19 +8,14 @@ LICENSE = "ntp"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
 RSUGGESTS_${PN} = "iana-etc"
 
-INC_PR = "r1"
-
-SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
-	file://tickadj.c.patch \
-	file://ntp-4.2.4_p6-nano.patch \
+SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
+	file://ipv6only-workaround.patch \
 	file://ntpd \
 	file://ntp.conf \
 	file://ntpdate \
+	file://ntpd.service \
 "
 
-SRC_URI[md5sum] = "00df80a84ec9528fcfb09498075525bc"
-SRC_URI[sha256sum] = "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
-
 inherit autotools update-rc.d
 
 INITSCRIPT_NAME = "ntpd"
@@ -29,46 +24,12 @@ INITSCRIPT_PARAMS = "defaults"
 
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
 # readline or curses
-EXTRA_OECONF += " --with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no"
+EXTRA_OECONF = "--without-openssl --without-crypto ac_cv_header_readline_history_h=no"
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
-do_configure(){
-	oe_runconf
-}
-
-do_install_append() {
-	install -d ${D}/${sysconfdir}/init.d
-	install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
-	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
-	install -d ${D}/${sysconfdir}/network/if-up.d
-	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
-}
-
-FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
-FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir}"
-FILES_${PN}-tickadj = "${bindir}/tickadj"
-FILES_${PN}-utils = "${bindir}/*"
-FILES_${PN}-date += "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate"
-
-# ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
-# with wonky clocks (e.g. OpenSlug)
-RDEPENDS_${PN} = "${PN}-tickadj"
-
-PACKAGES += "${PN}-date ${PN}-bin ${PN}-tickadj ${PN}-utils"
+PACKAGES += "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
 # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
 # or the ntpdate systemd service
 
 # This should use rc.update
 FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/init.d/ntpdate"
-
-pkg_postinst_ntpdate() {
-if test "x$D" != "x"; then
-        exit 1
-else
-        if ! grep -q -s ntpdate /var/spool/cron/root; then
-                echo "adding crontab"
-                test -d /var/spool/cron || mkdir -p /var/spool/cron
-                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.org" >> /var/spool/cron/root
-        fi
-fi
-}
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
index 175a1b0..f7c5b68 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
@@ -1,4 +1,45 @@
 require ntp.inc
 
-EXTRA_OECONF += "--without-openssl --without-crypto"
+SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
+        file://tickadj.c.patch \
+        file://ntp-4.2.4_p6-nano.patch \
+        file://ntpd \
+        file://ntp.conf \
+        file://ntpdate \
+"
+
+SRC_URI[md5sum] = "59876a9009b098ff59767ee45a88ebd2"
+SRC_URI[sha256sum] = "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8a02e78be85a7c40e"
+
+EXTRA_OECONF += " --with-net-snmp-config=no --without-ntpsnmpd" 
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/init.d
+	install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
+	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
+	install -d ${D}/${sysconfdir}/network/if-up.d
+	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
+}
+
+FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
+FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd"
+FILES_${PN}-tickadj = "${bindir}/tickadj"
+FILES_ntp-utils = "${bindir}/*"
+FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate"
+
+# ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
+# with wonky clocks (e.g. OpenSlug)
+RDEPENDS_${PN} = "${PN}-tickadj"
+
+pkg_postinst_ntpdate() {
+if test "x$D" != "x"; then
+        exit 1
+else
+        if ! grep -q -s ntpdate /var/spool/cron/root; then
+                echo "adding crontab"
+                test -d /var/spool/cron || mkdir -p /var/spool/cron
+                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.org" >> /var/spool/cron/root
+        fi
+fi
+}
 
-- 
1.7.10



