Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82AFC7FC9D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 18:20:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA1IK6qN020782
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Nov 2019 11:20:06 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 1 Nov 2019 11:20:05 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 11:20:05 -0700
Message-ID: <20191101182005.127439-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] syslog-ng: add volatile directory init for systemd
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
X-List-Received-Date: Fri, 01 Nov 2019 18:20:05 -0000
Content-Type: text/plain

systemd requires volatile file/directory specifications to
be in a tmpfiles.d directory.  We put ours in /etc/tmpfiles.d.

Also eliminate SRC_URI duplication in .bb and .inc files.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/files/syslog-ng-tmp.conf |  1 +
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc            |  6 ++++++
 meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb      | 10 ++++------
 3 files changed, 11 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng-tmp.conf

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng-tmp.conf b/meta-oe/recipes-support/syslog-ng/files/syslog-ng-tmp.conf
new file mode 100644
index 0000000..32a7953
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng-tmp.conf
@@ -0,0 +1 @@
+d /var/run/syslog-ng 0755 root root
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index b00cb91..4c22d4b 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=24c0c5cb2c83d9f2ab725481e4df5240"
 # util-linux added to get libuuid
 DEPENDS = "libpcre flex glib-2.0 openssl util-linux"
 
+# We expect the recipe to add anything specific for that version to these defaults.
+#
 SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
            file://syslog-ng.conf.systemd \
            file://syslog-ng.conf.sysvinit \
@@ -74,8 +76,12 @@ do_install_append() {
     install -d ${D}/${sysconfdir}/${BPN}
     install -d ${D}/${sysconfdir}/init.d
     install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog
+
     install -d ${D}/${sysconfdir}/default/volatiles/
     install -m 755 ${WORKDIR}/volatiles.03_syslog-ng ${D}/${sysconfdir}/default/volatiles/03_syslog-ng
+    install -d ${D}/${sysconfdir}/tmpfiles.d/
+    install -m 755 ${WORKDIR}/syslog-ng-tmp.conf ${D}/${sysconfdir}/tmpfiles.d/syslog-ng.conf
+
     install -d ${D}/${localstatedir}/lib/${BPN}
     # Remove /var/run as it is created on startup
     rm -rf ${D}${localstatedir}/run
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
index 4eecf6b..852343c 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
@@ -1,15 +1,13 @@
 require syslog-ng.inc
 
-SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
-           file://syslog-ng.conf.systemd \
-           file://syslog-ng.conf.sysvinit \
-           file://initscript \
-           file://volatiles.03_syslog-ng \
-           file://configure.ac-add-option-enable-thread-tls-to-manage-.patch \
+# We only want to add stuff we need to the defaults provided in syslog-ng.inc.
+#
+SRC_URI += " \
            file://fix-config-libnet.patch \
            file://fix-invalid-ownership.patch \
            file://syslog-ng.service-the-syslog-ng-service.patch \
            file://0001-syslog-ng-fix-segment-fault-during-service-start.patch \
+           file://syslog-ng-tmp.conf \
            "
 
 SRC_URI[md5sum] = "aa79bc13d9fd925aa5fb9516e87aacd3"
-- 
2.7.4


