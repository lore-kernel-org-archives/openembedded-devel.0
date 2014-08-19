Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 513FD617B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 11:50:05 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XJhvS-000424-6S from Yasir_Khan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Aug 2014 04:50:06 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 19 Aug 2014 04:50:05 -0700
From: Yasir-Khan <yasir_khan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Aug 2014 16:49:24 +0500
Message-Id: <1408448964-11764-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 19 Aug 2014 11:50:06.0061 (UTC)
	FILETIME=[B82639D0:01CFBBA3]
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH] lmbench: if a machine config file exists, install it
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
X-List-Received-Date: Tue, 19 Aug 2014 11:50:13 -0000

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 41db150..a3873a6 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -60,6 +60,13 @@ do_install () {
            ${D}${bindir}/lmbench-run
     install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
     install -m 0755 ${S}/scripts/* ${D}${datadir}/lmbench/scripts
+
+    # If the machine installs a config file, install it to the appropriate place
+    if [ -f ${WORKDIR}/CONFIG.${MACHINE} ]; then
+        install -D 0644 ${WORKDIR}/CONFIG.${MACHINE} \
+                        ${D}/${datadir}/lmbench/bin/${TARGET_PREFIX}/CONFIG.${MACHINE}
+    fi
+
 }
 
 pkg_postinst_${PN} () {
-- 
1.7.9.5


