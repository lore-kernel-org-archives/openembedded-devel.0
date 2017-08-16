Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE8FD78602
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 02:24:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7G2OHoB011072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 19:24:18 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 15 Aug 2017 19:24:17 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Aug 2017 10:23:41 +0800
Message-ID: <20170816022341.8084-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] logcheck: update to 1.3.18
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Aug 2017 02:24:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- logcheck should not be run as root, so inherit useradd
  and add proper user and group.

- Add missing runtime dependencies according to the file
  debian/control and simple test by running "logcheck -ot".

- For syslog, debian directly depends on rsyslog, but logcheck
  works with any syslog and we have busybox-syslog, sysklogd,
  syslog-ng and rsyslog, so use VIRTUAL-RUNTIME_syslog for the
  syslog dependency and set rsyslog as the default, which can be
  easily overridden in distro conf file or local.conf.

- Don't install /var/lock when populating rootfs. Do it
  through volatile.

- install header.txt for generated mails

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-extended/logcheck/files/99_logcheck    |  2 +
 .../{logcheck_1.3.17.bb => logcheck_1.3.18.bb}     | 52 +++++++++++++++++++---
 2 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-extended/logcheck/files/99_logcheck
 rename meta-oe/recipes-extended/logcheck/{logcheck_1.3.17.bb => logcheck_1.3.18.bb} (45%)

diff --git a/meta-oe/recipes-extended/logcheck/files/99_logcheck b/meta-oe/recipes-extended/logcheck/files/99_logcheck
new file mode 100644
index 000000000..4de33aca3
--- /dev/null
+++ b/meta-oe/recipes-extended/logcheck/files/99_logcheck
@@ -0,0 +1,2 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d logcheck logcheck 0755 /var/lock/logcheck none
diff --git a/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb b/meta-oe/recipes-extended/logcheck/logcheck_1.3.18.bb
similarity index 45%
rename from meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
rename to meta-oe/recipes-extended/logcheck/logcheck_1.3.18.bb
index ba4c2ab9a..f776f58dc 100644
--- a/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
+++ b/meta-oe/recipes-extended/logcheck/logcheck_1.3.18.bb
@@ -10,11 +10,20 @@ SECTION = "Applications/System"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-SRC_URI = "git://git.debian.org/git/logcheck/logcheck.git"
-SRCREV = "2429e67ad875fee8a0234c64d504277b038c89cd"
+SRC_URI = "git://git.debian.org/git/logcheck/logcheck.git \
+           file://99_logcheck \
+"
+SRCREV = "0a5865d80fa34c55387a1917a3e6f885bcff7f1d"
 
 S = "${WORKDIR}/git"
 
+inherit useradd
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "-m -g ${BPN} -G adm -r -d ${localstatedir}/lib/${BPN} \
+                       -s /bin/false -c 'logcheck account' ${BPN}"
+GROUPADD_PARAM_${PN} = "-r ${BPN}"
+
 do_install() {
     # Fix QA Issue
     sed -i '/install -d $(DESTDIR)\/var\/lock\/logcheck/s/^/#/' Makefile
@@ -25,14 +34,47 @@ do_install() {
     install -m 644 docs/logcheck-test.1 ${D}${mandir}/man1/
     install -m 644 docs/logtail.8 ${D}${mandir}/man8/
     install -m 644 docs/logtail2.8 ${D}${mandir}/man8/
-    sed -i "s/syslog/messages/" etc/logcheck.logfiles
-    sed -i "s/auth\.log/secure/" etc/logcheck.logfiles
+
     install -m 755 -d ${D}${sysconfdir}/cron.d
     install -m 644 debian/logcheck.cron.d ${D}${sysconfdir}/cron.d/logcheck
     install -m 755 -d ${D}/var/lib/logcheck
+
     oe_runmake install DESTDIR=${D}
+
+    # install header.txt for generated mails
+    install -m 0644 ${S}/debian/header.txt ${D}${sysconfdir}/${BPN}
+
+    chown -R ${BPN}:${BPN} ${D}${localstatedir}/lib/${BPN}
+    chown -R root:${BPN} ${D}${sysconfdir}/${BPN}
+
+    # Don't install /var/lock when populating rootfs. Do it through volatile
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/99_logcheck ${D}${sysconfdir}/default/volatiles
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d /var/lock/logcheck 0755 logcheck logcheck -" \
+            > ${D}${sysconfdir}/tmpfiles.d/logcheck.conf
+    fi
 }
 
-RDEPENDS_${PN} = "perl"
+VIRTUAL-RUNTIME_syslog ??= "rsyslog"
+
+RDEPENDS_${PN} = "\
+    bash \
+    cronie \
+    debianutils-run-parts \
+    grep \
+    lockfile-progs \
+    perl \
+    perl-module-file-basename \
+    perl-module-getopt-std \
+    perl-module-file-glob \
+    ${VIRTUAL-RUNTIME_syslog} \
+"
+
+# mime-construct is for mailing the reports, not mandatory
+RRECOMMENDS_${PN} = "mime-construct"
 
 FILES_${PN} += "${datadir}/logtail"
-- 
2.11.0


