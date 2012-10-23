Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1TQhQL-0007RH-Mh
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 18:33:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9NGKNlQ023234
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 09:20:23 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 23 Oct 2012 09:20:22 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Oct 2012 12:20:19 -0400
Message-ID: <1351009220-30119-3-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][meta-networking][PATCH V2 2/3] ntp: Uprev from 4.2.6p3 to 4.2.6p5
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
X-List-Received-Date: Tue, 23 Oct 2012 16:33:50 -0000
Content-Type: text/plain

Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 .../recipes-support/ntp/ntp-ssl_4.2.6p3.bb         |   11 -----
 .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         |   11 +++++
 meta-networking/recipes-support/ntp/ntp_4.2.6p3.bb |   47 --------------------
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |   45 +++++++++++++++++++
 4 files changed, 56 insertions(+), 58 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p3.bb
 create mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
 delete mode 100644 meta-networking/recipes-support/ntp/ntp_4.2.6p3.bb
 create mode 100644 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb

diff --git a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p3.bb b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p3.bb
deleted file mode 100644
index a158990..0000000
--- a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ntp_${PV}.bb
-DEPENDS = "openssl"
-
-S = "${WORKDIR}/ntp-${PV}"
-
-EXTRA_OECONF = "--with-openssl-libdir=${STAGING_LIBDIR} \
-	        --with-openssl-incdir=${STAGING_INCDIR}/openssl"
-
-
-SRC_URI[md5sum] = "98e16c7aa4ecd4c004b51bff18962e95"
-SRC_URI[sha256sum] = "9f4a5271a285d390c9225e3ea28f70049ea377d30fc6de4659007cfff278671a"
diff --git a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
new file mode 100644
index 0000000..a158990
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
@@ -0,0 +1,11 @@
+require ntp_${PV}.bb
+DEPENDS = "openssl"
+
+S = "${WORKDIR}/ntp-${PV}"
+
+EXTRA_OECONF = "--with-openssl-libdir=${STAGING_LIBDIR} \
+	        --with-openssl-incdir=${STAGING_INCDIR}/openssl"
+
+
+SRC_URI[md5sum] = "98e16c7aa4ecd4c004b51bff18962e95"
+SRC_URI[sha256sum] = "9f4a5271a285d390c9225e3ea28f70049ea377d30fc6de4659007cfff278671a"
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bb
deleted file mode 100644
index 89a272a..0000000
--- a/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-require ntp.inc
-
-PR = "r6"
-
-SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
-        file://tickadj.c.patch \
-        file://ntp-4.2.4_p6-nano.patch \
-        file://ntpd \
-        file://ntp.conf \
-        file://ntpdate \
-"
-
-SRC_URI[md5sum] = "59876a9009b098ff59767ee45a88ebd2"
-SRC_URI[sha256sum] = "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8a02e78be85a7c40e"
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
-
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
new file mode 100644
index 0000000..f7c5b68
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
@@ -0,0 +1,45 @@
+require ntp.inc
+
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
+
-- 
1.7.0.4



