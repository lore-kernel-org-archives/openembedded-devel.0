Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5AAC16FF6B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2015 07:20:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB47KsrK027824
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Dec 2015 23:20:54 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 3 Dec 2015 23:20:53 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 Dec 2015 15:09:16 +0800
Message-ID: <1449212956-2683-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1449212956-2683-1-git-send-email-kai.kang@windriver.com>
References: <1449212956-2683-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] mcelog: remove bashism and create ptest subpackage
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
X-List-Received-Date: Fri, 04 Dec 2015 07:20:54 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Create ptest subpackage. Add a patch to remove bashism and then only
ptest package depends on bash.

Inherit autotools-brokensep and re-write do_install as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mcelog/mcelog/mcelog-debash.patch              | 36 ++++++++++++++++++++++
 meta-oe/recipes-support/mcelog/mcelog/run-ptest    |  3 ++
 meta-oe/recipes-support/mcelog/mcelog_1.09.bb      | 32 ++++++++++++-------
 3 files changed, 60 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-support/mcelog/mcelog/mcelog-debash.patch
 create mode 100644 meta-oe/recipes-support/mcelog/mcelog/run-ptest

diff --git a/meta-oe/recipes-support/mcelog/mcelog/mcelog-debash.patch b/meta-oe/recipes-support/mcelog/mcelog/mcelog-debash.patch
new file mode 100644
index 0000000..bea2f62
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mcelog/mcelog-debash.patch
@@ -0,0 +1,36 @@
+From 8f57d35747a3b3fabc33466563077373090f869c Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 2 Sep 2014 07:05:15 -0700
+Subject: [PATCH] cache-error-trigger: remove bashism
+
+Use "$(cat $F)" to instead of "$(< $F)" to debash.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ triggers/cache-error-trigger |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/triggers/cache-error-trigger b/triggers/cache-error-trigger
+index e32bfd6..785526f 100755
+--- a/triggers/cache-error-trigger
++++ b/triggers/cache-error-trigger
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ # cache error trigger. This shell script is executed by mcelog in daemon mode
+ # when a CPU reports excessive corrected cache errors. This could be a indication
+ # for future uncorrected errors.
+@@ -28,7 +28,7 @@ for i in $AFFECTED_CPUS ; do
+ 	logger -s -p daemon.crit -t mcelog "Offlining CPU $i due to cache error threshold"
+ 	F=$(printf "/sys/devices/system/cpu/cpu%d/online" $i)
+ 	echo 0 > $F
+-	if [ "$(< $F)" != "0" ] ; then
++	if [ "$(cat $F)" != "0" ] ; then
+ 		logger -s -p daemon.warn -t mcelog "Offlining CPU $i failed"
+ 		EXIT=1
+ 	fi
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-support/mcelog/mcelog/run-ptest b/meta-oe/recipes-support/mcelog/mcelog/run-ptest
new file mode 100644
index 0000000..ba7a2c7
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mcelog/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -C tests test
diff --git a/meta-oe/recipes-support/mcelog/mcelog_1.09.bb b/meta-oe/recipes-support/mcelog/mcelog_1.09.bb
index 34ff643..542b2ba 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_1.09.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_1.09.bb
@@ -4,23 +4,33 @@ and 64bit Linux kernels (since early 2.6 kernel releases) to log machine checks
 and should run on all Linux systems that need error handling."
 HOMEPAGE = "http://mcelog.org/"
 SECTION = "System Environment/Base"
-DEPENDS += "bash"
-SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git"
+
+SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git \
+    file://mcelog-debash.patch \
+    file://run-ptest \
+"
+
 SRCREV = "0fc9f702232cb2d9969916f899c67c3e64deedda"
+
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;md5=3eb76ca64fa07ad53ebb0ebb5b4c8ede"
 
 S = "${WORKDIR}/git"
 
-do_install() {
-    install -d ${D}/${sbindir}
-    install -m 0755 ${S}/mcelog ${D}/${sbindir}
-    install -d ${D}/${mandir}/man8
-    install -m 0644 ${S}/mcelog.8 ${D}/${mandir}/man8/
-    install -d ${D}/etc/cron.hourly
-    install -m 0755 ${S}/mcelog.cron ${D}/etc/cron.hourly/
-}
+inherit autotools-brokensep ptest
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 
-RDEPENDS_${PN} = "bash"
+do_install_append() {
+    install -d ${D}${sysconfdir}/cron.hourly
+    install -m 0755 ${S}/mcelog.cron ${D}${sysconfdir}/cron.hourly/
+    sed -i 's/bash/sh/' ${D}${sysconfdir}/cron.hourly/mcelog.cron
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    cp -r ${S}/tests ${S}/input ${D}${PTEST_PATH}
+    sed -i 's#../../mcelog#mcelog#' ${D}${PTEST_PATH}/tests/test
+}
+
+RDEPENDS_${PN}-ptest += "${PN} make bash mce-inject"
-- 
2.6.1


