Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4021E7DA6F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 06:56:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3U6uTeg025929
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 23:56:30 -0700 (PDT)
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 29 Apr 2019 23:56:29 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Apr 2019 14:56:27 +0800
Message-ID: <1556607387-26849-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [meta-networking][PATCH] openhpi: update openhpi-fix-testfail-errors.patch
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
X-List-Received-Date: Tue, 30 Apr 2019 06:56:31 -0000
Content-Type: text/plain

The openhpi-fix-testfail-errors.patch tries to fix 2 saftest failures.
But the second fix is not correct. It should not return false when there
is no surrogate pairs since for the code points in UTF-16 Basic
Multilingual Plane (BMP), there is no need surrogate pairs. We should
update saftest case to fix this failure.

Also add more description for the first fix.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...penhpi-fix-function-saHpiSensorThresholds.patch | 35 ++++++++++++++++++++++
 .../files/openhpi-fix-testfail-errors.patch        | 33 --------------------
 .../recipes-daemons/openhpi/openhpi_3.8.0.bb       |  2 +-
 3 files changed, 36 insertions(+), 34 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch
 delete mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch

diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch
new file mode 100644
index 0000000..b2771c0
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch
@@ -0,0 +1,35 @@
+From e0b2be7a1fce0fed63bac8c350b711b69edfe30e Mon Sep 17 00:00:00 2001
+From: "yanjun.zhu" <yanjun.zhu@windriver.com>
+Date: Tue, 30 Apr 2019 10:04:58 +0800
+Subject: [PATCH] openhpid/safhpi.c: fix function saHpiSensorThresholdsSet
+
+In COPY_TH the SensorThresholds->TH will be copied to tmp.TH only if
+TH.IsSupported == SAHPI_TRUE. So we should pass &tmp but not
+SensorThresholds as the argument to OH_CALL_ABI. Otherwise the TH will
+be set even if TH.IsSupported == SAHPI_FALSE.
+
+Upstream-Status: Submitted
+[https://github.com/open-hpi/openhpi/pull/2744/commits/77a78bb1ada56e55c5ba6d7a5987c214705bf035]
+
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ openhpid/safhpi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/openhpid/safhpi.c b/openhpid/safhpi.c
+index 28a2632..61b7f03 100644
+--- a/openhpid/safhpi.c
++++ b/openhpid/safhpi.c
+@@ -1933,7 +1933,7 @@ SaErrorT SAHPI_API saHpiSensorThresholdsSet (
+         oh_release_domain(d); /* Unlock domain */
+ 
+         OH_CALL_ABI(h, set_sensor_thresholds, SA_ERR_HPI_INVALID_CMD, rv,
+-                    ResourceId, SensorNum, SensorThresholds);
++                    ResourceId, SensorNum, &tmp);
+         oh_release_handler(h);
+ 
+         return rv;
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
deleted file mode 100644
index 60e2e79..0000000
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Fix for saftest failures.
-
-Upstream-Status: Pending
-
-Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
-
-Index: openhpi-3.6.1/openhpid/safhpi.c
-===================================================================
---- openhpi-3.6.1.orig/openhpid/safhpi.c
-+++ openhpi-3.6.1/openhpid/safhpi.c
-@@ -1933,7 +1933,7 @@ SaErrorT SAHPI_API saHpiSensorThresholds
-         oh_release_domain(d); /* Unlock domain */
- 
-         OH_CALL_ABI(h, set_sensor_thresholds, SA_ERR_HPI_INVALID_CMD, rv,
--                    ResourceId, SensorNum, SensorThresholds);
-+                    ResourceId, SensorNum, &tmp);
-         oh_release_handler(h);
- 
-         return rv;
-Index: openhpi-3.6.1/utils/sahpi_struct_utils.c
-===================================================================
---- openhpi-3.6.1.orig/utils/sahpi_struct_utils.c
-+++ openhpi-3.6.1/utils/sahpi_struct_utils.c
-@@ -3861,6 +3861,9 @@ SaHpiBoolT oh_valid_textbuffer(SaHpiText
-                                         /* found a unpaired surrogate */
-                                         return SAHPI_FALSE;
-                                 }
-+                        } else {
-+                            /*the first 2 bytes wrong*/
-+                            return SAHPI_FALSE;
-                         }
-                 }
-                 break;
diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index 14cc3d8..e3a0c2e 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://openhpi-glib-cross-compile.patch \
            file://openhpi-linkfix.patch \
            file://openhpi-fix-host-gcc.patch \
-           file://openhpi-fix-testfail-errors.patch \
+           file://openhpi-fix-function-saHpiSensorThresholds.patch \
            file://openhpi-add-libnetsnmp-when-link.patch \
            file://openhpi-invalide-session.patch \
            file://openhpi-use-serial-tests-config-needed-by-ptest.patch \
-- 
2.7.4


