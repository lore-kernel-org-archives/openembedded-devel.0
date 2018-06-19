Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F040700F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 09:46:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5J9kxhF014382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 02:47:00 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 19 Jun 2018 02:46:59 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jun 2018 17:46:58 +0800
Message-ID: <1529401618-187590-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] [meta-oe] syslog-ng: fix syslog-ng startup problem with systemd
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
X-List-Received-Date: Tue, 19 Jun 2018 09:46:59 -0000
Content-Type: text/plain

1. Fix syslog-ng service cannot startup after upgrade to 3.15.1

   1) Align path of syslog-ng.conf between syslog-ng@default
      and do_install in syslog-ng.inc
   2) create a default instance for syslog-ng
   3) Install default parameter file to /etc/default according
      to https://github.com/balabit/syslog-ng/commit
      /649d1151e79033cc2b81b3353917507266814436

2. Fix "Failed to acquire /run/systemd/journal/syslog socket,
   disabling systemd-syslog source;" accordint to below content
   from syslog-ng admin guide.

   1) for linux, If the host is running under systemd, syslog-ng
      OSE reads directly from the systemd journal file using the
      systemd-journal() source.
   2) If possible, use the more reliable systemd-journal() driver
      instead.
   3) The socket activation of systemd is buggy, causing some log
      messages to get lost during syst

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{syslog-ng.conf => syslog-ng.conf.systemd}     |  2 +-
 .../{syslog-ng.conf => syslog-ng.conf.sysvinit}    |  0
 .../syslog-ng.service-the-syslog-ng-service.patch  |  3 ++-
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    | 23 ++++++++++++++--------
 4 files changed, 18 insertions(+), 10 deletions(-)
 copy meta-oe/recipes-support/syslog-ng/files/{syslog-ng.conf => syslog-ng.conf.systemd} (99%)
 rename meta-oe/recipes-support/syslog-ng/files/{syslog-ng.conf => syslog-ng.conf.sysvinit} (100%)

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
similarity index 99%
copy from meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
copy to meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
index fb183ee..9e910ca 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
@@ -16,7 +16,7 @@ options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
 # This is the default behavior of sysklogd package
 # Logs may come from unix stream, but not from another machine.
 #
-source s_src { unix-dgram("/dev/log"); internal();
+source s_src { systemd_journal(); internal();
        	     file("/proc/kmsg" program_override("kernel"));
 };
 
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
similarity index 100%
rename from meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
rename to meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
index dc2ba16..39c3f59 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
@@ -32,10 +32,11 @@ index 02da288..3a8215d 100644
 --- a/contrib/systemd/syslog-ng@default
 +++ b/contrib/systemd/syslog-ng@default
 @@ -1,5 +1,5 @@
- CONFIG_FILE=/etc/syslog-ng.conf
+-CONFIG_FILE=/etc/syslog-ng.conf
 -PERSIST_FILE=/var/lib/syslog-ng/syslog-ng.persist
 -CONTROL_FILE=/var/lib/syslog-ng/syslog-ng.ctl
 -PID_FILE=/var/run/syslog-ng.pid
++CONFIG_FILE=/etc/syslog-ng/syslog-ng.conf
 +PERSIST_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.persist
 +CONTROL_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.ctl
 +PID_FILE=@LOCALSTATEDIR@/run/syslog-ng.pid
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index cf6a3de..09c2f51 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -16,7 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=24c0c5cb2c83d9f2ab725481e4df5240"
 DEPENDS = "libpcre flex glib-2.0 openssl util-linux"
 
 SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
-           file://syslog-ng.conf \
+           file://syslog-ng.conf.systemd \
+           file://syslog-ng.conf.sysvinit \
            file://initscript \
            file://volatiles.03_syslog-ng \
            file://configure.ac-add-option-enable-thread-tls-to-manage-.patch \
@@ -71,7 +72,6 @@ do_configure_prepend() {
 
 do_install_append() {
     install -d ${D}/${sysconfdir}/${BPN}
-    install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${BPN}/${BPN}.conf
     install -d ${D}/${sysconfdir}/init.d
     install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog
     install -d ${D}/${sysconfdir}/default/volatiles/
@@ -82,17 +82,24 @@ do_install_append() {
 
     # support for systemd
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install ${WORKDIR}/syslog-ng.conf.systemd ${D}${sysconfdir}/${BPN}/${BPN}.conf
+
         install -d ${D}${systemd_unitdir}/system/
         install -m 0644 ${S}/contrib/systemd/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@.service
-        install -m 0644 ${S}/contrib/systemd/${BPN}@default ${D}${systemd_unitdir}/system/${BPN}@default
+        install -m 0644 ${S}/contrib/systemd/${BPN}@default ${D}${sysconfdir}/default/${BPN}@default
+
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
+        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
+        sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
 
-        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@default
-        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@default
-        sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@default
+        install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
+        ln -sf ../${BPN}@.service ${D}${systemd_unitdir}/system/multi-user.target.wants/${BPN}@default.service
+    else
+        install ${WORKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
     fi
 }
 
-FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
+FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools ${systemd_unitdir}/system/multi-user.target.wants/*"
 RDEPENDS_${PN} += "gawk ${@bb.utils.contains('PACKAGECONFIG','json','${PN}-jconf','',d)}"
 
 FILES_${PN}-jconf += " \
@@ -124,7 +131,7 @@ RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${BPN}@default ${BPN}@.service"
+SYSTEMD_SERVICE_${PN} = "${BPN}@.service"
 
 INITSCRIPT_NAME = "syslog"
 INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
-- 
2.7.4


