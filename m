Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38C8772FCB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1B0441834E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lzjhps5tX9-7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:09 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 12FDF180D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:09 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F02DB1A160
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:08 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E58C21A15F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:08 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:08 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id D8FFC784
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:08 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1SFs84S015191
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:54:08 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1SFs8ls015190
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2017 16:54:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2017 16:54:04 +0100
Message-Id: <20170228155405.15144-1-pkj@axis.com>
X-Mailer: git-send-email 2.9.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] syslog-ng: Run autoreconf twice to avoid problems with libtool
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
X-List-Received-Date: Tue, 28 Feb 2017 15:54:13 -0000

syslog-ng has sub-projects with their own autotools configurations.
Something has been messed up after the switch to RSS and now it
requires autoreconf to be run twice to fully update all files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc      | 11 ++++++++++-
 meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb |  2 --
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 21d1748..a5e1bfe 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -22,7 +22,7 @@ SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source
            file://configure.ac-add-option-enable-thread-tls-to-manage-.patch \
 "
 
-inherit autotools systemd pkgconfig update-rc.d
+inherit autotools gettext systemd pkgconfig update-rc.d
 
 EXTRA_OECONF = " \
     --enable-dynamic-linking \
@@ -55,6 +55,15 @@ PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
 PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
 PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
 
+do_configure_prepend() {
+	olddir=$(pwd)
+	cd ${AUTOTOOLS_SCRIPT_PATH}
+
+	ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} -I ${S}/m4 ${ACLOCALEXTRAPATH} || die "extra autoreconf execution failed."
+
+	cd $olddir
+}
+
 do_install_prepend() {
     sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
     sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
index bee1e19..73609af 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
@@ -13,5 +13,3 @@ SRC_URI += " \
 
 SRC_URI[md5sum] = "e9f401615e92e5eb27396c995c1446ba"
 SRC_URI[sha256sum] = "7be11df31ac7d716f1f952e22b5ae8e2049edd633a41b223776a853d9106f4e7"
-
-PNBLACKLIST[syslog-ng] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130631/"
-- 
2.9.0


