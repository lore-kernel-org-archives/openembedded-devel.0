Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89902C25B75
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 02:23:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7172.1716517434398061191
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 May 2024 19:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5874100442=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NN05al010632
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 02:23:53 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yaa9mgbvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 02:23:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 19:23:52 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 19:23:51 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][meta-filesystems][PATCH V2] fuse3: remove sysv init script and install fuse kernel module explictly
Date: Fri, 24 May 2024 10:23:50 +0800
Message-ID: <20240524022350.2415086-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vojsCuA7s0euUQQeFclFbqYb_QMXQymN
X-Proofpoint-ORIG-GUID: vojsCuA7s0euUQQeFclFbqYb_QMXQymN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_15,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 02:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110506

From: Changqing Li <changqing.li@windriver.com>

For systemd, there is not a fuse.service since systemd provides
sys-fs-fuse-connections.mount to mount the fuse control filesystem, so
instead, only fuse3.conf is added to modules-load.d to load the required
fuse kernel module.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/fuse/fuse3/fuse3.conf         |  1 +
 .../recipes-support/fuse/fuse3_3.16.2.bb          | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-filesystems/recipes-support/fuse/fuse3/fuse3.conf

diff --git a/meta-filesystems/recipes-support/fuse/fuse3/fuse3.conf b/meta-filesystems/recipes-support/fuse/fuse3/fuse3.conf
new file mode 100644
index 000000000..a517c488f
--- /dev/null
+++ b/meta-filesystems/recipes-support/fuse/fuse3/fuse3.conf
@@ -0,0 +1 @@
+fuse
diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
index 2b0797a6f..b946b63ee 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.gz \
+           file://fuse3.conf \
 "
 SRC_URI[sha256sum] = "f797055d9296b275e981f5f62d4e32e089614fc253d1ef2985851025b8a0ce87"
 
@@ -79,6 +80,20 @@ FILES:fuse3-utils = "${bindir} ${base_sbindir}"
 DEBIAN_NOAUTONAME:fuse3-utils = "1"
 DEBIAN_NOAUTONAME:${PN}-dbg = "1"
 
+SYSTEMD_SERVICE:${PN} = ""
+
 do_install:append() {
     rm -rf ${D}${base_prefix}/dev
+
+    # systemd class remove the sysv_initddir only if systemd_system_unitdir
+    # contains anything, but it's not needed if sysvinit is not in DISTRO_FEATURES
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
+        rm -rf ${D}${sysconfdir}/init.d/
+    fi
+
+    # Install systemd related configuration file
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/modules-load.d
+        install -m 0644 ${WORKDIR}/fuse3.conf ${D}${sysconfdir}/modules-load.d
+    fi
 }
-- 
2.25.1


