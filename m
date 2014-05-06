Return-Path: <donald.poole@swri.org>
Received: from esg260-1.itc.swri.edu (esg260-1.itc.swri.edu [129.162.252.40])
	by mail.openembedded.org (Postfix) with ESMTP id 312C065F0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 18:35:19 +0000 (UTC)
Received: from victory-embedded-dev.dyn.datasys.swri.edu
	(victory-embedded-dev.dyn.datasys.swri.edu [129.162.107.136])
	(authenticated bits=0)
	by esg260-1.itc.swri.edu (8.14.5/8.14.5) with ESMTP id s46IZ5fL019102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 May 2014 13:35:20 -0500
From: "Donald R. Poole, Jr." <donald.poole@swri.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 13:34:24 -0500
Message-Id: <1399401265-29167-2-git-send-email-donald.poole@swri.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1399401265-29167-1-git-send-email-donald.poole@swri.org>
References: <1399401265-29167-1-git-send-email-donald.poole@swri.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.11.96, 1.0.14,
	0.0.0000
	definitions=2014-05-06_06:2014-05-06, 2014-05-06,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=0
	kscore.is_bulkscore=1.24208421325989e-11 kscore.compositescore=1
	circleOfTrustscore=0 compositescore=0.997781753771917
	urlsuspect_oldscore=0.997781753771917 suspectscore=1
	recipient_domain_to_sender_totalscore=0 phishscore=0 bulkscore=0
	kscore.is_spamscore=0 recipient_to_sender_totalscore=0
	recipient_domain_to_sender_domain_totalscore=0
	rbsscore=0.997781753771917
	spamscore=0 recipient_to_sender_domain_totalscore=0 urlsuspectscore=0.9
	adultscore=0 classifier=spam adjust=-40 reason=mlx scancount=1
	engine=7.0.1-1402240000 definitions=main-1405060276
Subject: [meta-qt5][PATCH] qmake5_base.bbclass: Add install support for native builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 May 2014 18:35:20 -0000

From: "Donald R. Poole, Jr" <donald (dot) poole (at) swri (dot) org>

Currently, if you are building native applications with Qt5, the current qmake5_base_do_install() method assumes an install into the image folder for the target. Since the native builds handle this a little differently, this patch should account for the native install scenario.
---
 classes/qmake5.bbclass      |    8 ++++++--
 classes/qmake5_base.bbclass |   46 +++++++++++++++++++++----------------------
 2 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/classes/qmake5.bbclass b/classes/qmake5.bbclass
index e1dda0d..01454f3 100644
--- a/classes/qmake5.bbclass
+++ b/classes/qmake5.bbclass
@@ -19,6 +19,10 @@ do_configure() {
     qmake5_base_do_configure
 }
 
-do_install() {
-    qmake5_base_do_install
+do_install_class-target() {
+    qmake5_base_do_install_target
+}
+
+do_install_class-native() {
+    qmake5_base_do_install_native
 }
diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index df8a59a..5a380d0 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -161,32 +161,32 @@ qmake5_base_do_configure () {
     ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} -r $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error calling $CMD"
 }
 
-qmake5_base_do_install() {
+qmake5_base_do_install_target() {
     # Fix install paths for all
-    if [ "${BUILD_SYS}" = "${HOST_SYS}" ] ; then
-        find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT),(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
-    else
-        find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
-    fi
+    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
 
     oe_runmake install INSTALL_ROOT=${D}
 
-    # Only do this for target builds. Native install work a little differently
-    if [ "${BUILD_SYS}" != "${HOST_SYS}" ] ; then
-        # everything except HostData and HostBinaries is prefixed with sysroot value,
-        # but we cannot remove sysroot override, because that's useful for pkg-config etc
-        # In some cases like QtQmlDevTools in qtdeclarative, the sed above does not work,
-        # fix them manually
-        if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n "${STAGING_DIR_TARGET}" ] ; then
-            echo "Some files are installed in wrong directory ${D}${STAGING_DIR_TARGET}"
-            cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
-            rm -rf ${D}${STAGING_DIR_TARGET}
-            # remove empty dirs
-            TMP=`dirname ${D}/${STAGING_DIR_TARGET}`
-            while test ${TMP} != ${D}; do
-                rmdir ${TMP}
-                TMP=`dirname ${TMP}`;
-            done
-        fi
+    # everything except HostData and HostBinaries is prefixed with sysroot value,
+    # but we cannot remove sysroot override, because that's useful for pkg-config etc
+    # In some cases like QtQmlDevTools in qtdeclarative, the sed above does not work,
+    # fix them manually
+    if [ -d ${D}${STAGING_DIR_TARGET} ] ; then
+        echo "Some files are installed in wrong directory ${D}${STAGING_DIR_TARGET}"
+        cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
+        rm -rf ${D}${STAGING_DIR_TARGET}
+        # remove empty dirs
+        TMP=`dirname ${D}/${STAGING_DIR_TARGET}`
+        while test ${TMP} != ${D}; do
+            rmdir ${TMP}
+            TMP=`dirname ${TMP}`;
+        done
     fi
 }
+
+qmake5_base_do_install_native() {
+    # Fix install paths for all
+    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT),(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
+
+    oe_runmake install INSTALL_ROOT=${D}
+}
-- 
1.7.9.5


