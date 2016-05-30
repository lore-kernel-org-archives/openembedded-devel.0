Return-Path: <ian.ray@ge.com>
X-Greylist: delayed 3182 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 May 2016 11:52:41 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 56A957321C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 11:52:41 +0000 (UTC)
Received: from pps.filterd (m0048275.ppops.net [127.0.0.1])
	by m0048275.ppops.net-00176a03. (8.16.0.11/8.16.0.11) with SMTP id
	u4UAvX3N017964 for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 06:59:40 -0400
From: Ian Ray <ian.ray@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2016 13:59:28 +0300
Message-Id: <81d598f577d1c451bfefd78b31901047990b6b55.1464605344.git.ian.ray@ge.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1464605344.git.ian.ray@ge.com>
References: <cover.1464605344.git.ian.ray@ge.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-05-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=15
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1605300136
Subject: [meta-oe][PATCH 1/1] syslog-ng: expand service file @variables@ earlier
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
X-List-Received-Date: Mon, 30 May 2016 11:52:43 -0000

Move variable expansion of @SBINDIR@, @LOCALSTATEDIR@, and @BASEBINDIR@
earlier during install, to before the systemd service file is installed
by an automake rule.

Signed-off-by: Ian Ray <ian.ray@ge.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index ed41f01..a158e7f 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -60,6 +60,12 @@ do_configure_prepend() {
     eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
 }
 
+do_install_prepend() {
+    sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
+    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
+    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${S}/contrib/systemd/*.service
+}
+
 do_install_append() {
     install -d ${D}/${sysconfdir}/${BPN}
     install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${BPN}/${BPN}.conf
@@ -70,9 +76,6 @@ do_install_append() {
     install -d ${D}/${localstatedir}/lib/${BPN}
     # Remove /var/run as it is created on startup
     rm -rf ${D}${localstatedir}/run
-    sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
-    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
-    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${S}/contrib/systemd/*.service
 }
 
 FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
-- 
2.7.1


