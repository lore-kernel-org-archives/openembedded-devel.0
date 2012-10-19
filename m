Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1TPLks-0008HK-48
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 01:13:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9JKcESv003651
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2012 13:38:15 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Fri, 19 Oct 2012 13:38:14 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Oct 2012 16:38:11 -0400
Message-ID: <1350679091-5909-4-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1350679091-5909-1-git-send-email-morgan.little@windriver.com>
References: <1350679091-5909-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][meta-networking][PATCH 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Fri, 19 Oct 2012 23:13:26 -0000
Content-Type: text/plain

Clean up recipes to make them easier to read and to allow ntp-ssl to build
 * Move common portions to ntp.inc
 * Update ntp-ssl to require ntp.inc oppose to ntp_4.2.6
 * Change ntp-ssl EXTRA_OECONF to append so it won't try to configure snmp as
it will use local paths and cause a error while configuring

Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         |   13 +++---
 meta-networking/recipes-support/ntp/ntp.inc        |   47 +++++++++++++++++--
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |   43 +-----------------
 3 files changed, 50 insertions(+), 53 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
index 201b272..d45945a 100644
--- a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
+++ b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
@@ -1,11 +1,12 @@
-require ntp_${PV}.bb
+require ntp.inc
 DEPENDS = "openssl"
 
-S = "${WORKDIR}/ntp-${PV}"
+PR = "r0"
 
-EXTRA_OECONF = "--with-openssl-libdir=${STAGING_LIBDIR} \
-	        --with-openssl-incdir=${STAGING_INCDIR}/openssl"
+S = "${WORKDIR}/ntp-${PV}"
 
+EXTRA_OECONF += "--with-openssl-libdir=${STAGING_LIBDIR} \
+		 --with-openssl-incdir=${STAGING_INCDIR}/openssl \
+		 --with-crypto"
 
-SRC_URI[md5sum] = "00df80a84ec9528fcfb09498075525bc"
-SRC_URI[sha256sum] = "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
+FILES_${PN} += "${bindir}/sntp ${bindir}/ntp-keygen"
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 1d740f0..20b9060 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -8,14 +8,17 @@ LICENSE = "ntp"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
 RSUGGESTS_${PN} = "iana-etc"
 
-SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
-	file://ipv6only-workaround.patch \
+SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
+	file://tickadj.c.patch \
+	file://ntp-4.2.4_p6-nano.patch \
 	file://ntpd \
 	file://ntp.conf \
 	file://ntpdate \
-	file://ntpd.service \
 "
 
+SRC_URI[md5sum] = "00df80a84ec9528fcfb09498075525bc"
+SRC_URI[sha256sum] = "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
+
 inherit autotools update-rc.d
 
 INITSCRIPT_NAME = "ntpd"
@@ -24,12 +27,46 @@ INITSCRIPT_PARAMS = "defaults"
 
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
 # readline or curses
-EXTRA_OECONF = "--without-openssl --without-crypto ac_cv_header_readline_history_h=no"
+EXTRA_OECONF += " --with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no"
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
-PACKAGES += "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
+do_configure(){
+	oe_runconf
+}
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
+FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir}"
+FILES_${PN}-tickadj = "${bindir}/tickadj"
+FILES_${PN}-utils = "${bindir}/*"
+FILES_${PN}-date += "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate"
+
+# ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
+# with wonky clocks (e.g. OpenSlug)
+RDEPENDS_${PN} = "${PN}-tickadj"
+
+PACKAGES += "${PN}-date ${PN}-bin ${PN}-tickadj ${PN}-utils"
 # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
 # or the ntpdate systemd service
 
 # This should use rc.update
 FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/init.d/ntpdate"
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
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
index c542873..9c677c3 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
@@ -2,46 +2,5 @@ require ntp.inc
 
 PR = "r0"
 
-SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
-        file://tickadj.c.patch \
-        file://ntp-4.2.4_p6-nano.patch \
-        file://ntpd \
-        file://ntp.conf \
-        file://ntpdate \
-"
-
-SRC_URI[md5sum] = "00df80a84ec9528fcfb09498075525bc"
-SRC_URI[sha256sum] = "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
-
-EXTRA_OECONF += " --with-net-snmp-config=no --without-ntpsnmpd" 
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
-FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd"
-FILES_${PN}-tickadj = "${bindir}/tickadj"
-FILES_ntp-utils = "${bindir}/*"
-FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate"
-
-# ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
-# with wonky clocks (e.g. OpenSlug)
-RDEPENDS_${PN} = "${PN}-tickadj"
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
+EXTRA_OECONF += "--without-openssl --without-crypto"
 
-- 
1.7.0.4



