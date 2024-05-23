Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FB3C25B7C
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 01:55:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5888.1716429313575342803
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 May 2024 18:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58736b22d2=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44N13v88005188
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 01:55:12 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y9utd00wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 01:55:12 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 18:55:11 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 18:55:10 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][meta-oe][PATCH V2] fuse3: remove sysv init script and install fuse kernel module explictly
Date: Thu, 23 May 2024 09:55:10 +0800
Message-ID: <20240523015510.1988259-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tqcOE3lFk4F4TbXIDPPEazx-1AJgxEzG
X-Proofpoint-GUID: tqcOE3lFk4F4TbXIDPPEazx-1AJgxEzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_14,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 01:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110492

From: Changqing Li <changqing.li@windriver.com>

For systemd, there is not a fuse.service since systemd provides
sys-fs-fuse-connections.mount to mount the fuse control filesystem, so
instead, only fuse3.conf is added to modules-load.d to load the required
fuse kernel module.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/fuse/fuse3/fuse3.conf |  1 +
 meta-oe/recipes-support/fuse/fuse3_3.16.2.bb  | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/fuse/fuse3/fuse3.conf

diff --git a/meta-oe/recipes-support/fuse/fuse3/fuse3.conf b/meta-oe/recipes-support/fuse/fuse3/fuse3.conf
new file mode 100644
index 000000000..a517c488f
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse3/fuse3.conf
@@ -0,0 +1 @@
+fuse
diff --git a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
index 307544bf3..b799b2c6b 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
@@ -27,6 +27,7 @@ inherit meson pkgconfig ptest
 
 SRC_URI += " \
     file://run-ptest \
+    file://fuse3.conf \
 "
 
 RDEPENDS:${PN}-ptest += " \
@@ -78,6 +79,20 @@ FILES:fuse3-utils = "${bindir} ${base_sbindir}"
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


