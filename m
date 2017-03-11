Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 27555778AB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 04:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 596012E440
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id AI+6gx15RZcH
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 8D9092E459
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B48F1E072
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7083E1E076
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 64BDA747
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2B4x1jA003832
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2B4x1Xj003831
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Mar 2017 05:59:01 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Mar 2017 05:58:54 +0100
Message-Id: <20170311045855.3665-4-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170311045855.3665-1-pkj@axis.com>
References: <20170311045855.3665-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 4/5] meson.bbclass: Support building for native
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
X-List-Received-Date: Sat, 11 Mar 2017 04:59:03 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/classes/meson.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index 8da06da7f..e3489dd12 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -9,9 +9,11 @@ do_configure[cleandirs] = "${B}"
 # Where the meson.build build configuration is
 MESON_SOURCEPATH = "${S}"
 
-# These variables in the environment override the *native* tools not the cross,
-# so they need to be unexported.
-CC[unexport] = "1"
+# These variables in the environment override the *native* tools, not the cross.
+export CC = "${BUILD_CC}"
+export CXX = "${BUILD_CXX}"
+export LD = "${BUILD_LD}"
+export AR = "${BUILD_AR}"
 
 def noprefix(var, d):
     return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
@@ -37,6 +39,9 @@ MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big',
 
 EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
 
+MESON_CROSS_FILE = ""
+MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
+
 def meson_array(var, d):
     return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
 
@@ -75,7 +80,7 @@ EOF
 CONFIGURE_FILES = "meson.build"
 
 meson_do_configure() {
-    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" --cross-file ${WORKDIR}/meson.cross ${EXTRA_OEMESON}; then
+    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then
         cat ${B}/meson-logs/meson-log.txt
         bbfatal_log meson failed
     fi
-- 
2.12.0


