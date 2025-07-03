Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310F1C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 06:07:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15950.1751522821115602369
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jul 2025 23:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9279aa10a7=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5635A9Yk022247
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Jul 2025 23:07:00 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp4d48j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 23:07:00 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 2 Jul 2025 23:07:03 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 2 Jul 2025 23:07:03 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] libblockdev: fix CVE-2025-6019
Date: Thu, 3 Jul 2025 14:07:01 +0800
Message-ID: <20250703060702.1836226-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AKqrs6ox81VL09H2RU0HkoUGzClGENIx
X-Proofpoint-ORIG-GUID: AKqrs6ox81VL09H2RU0HkoUGzClGENIx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA0NyBTYWx0ZWRfXzimsuf8S+Mxd orCV6oo+0rFdK5EAJGBuSpeBWNVzayFVO0JT1qIgxPtk3y5tM/1mKSg5rgPG7fSNxoSAbiGUEYq i9Hzzlo66s7UeRj9v7VIQF2963jbBuvgIxNN9zSSn4eerR3dhn+6mXFMhXCY6kCZoObEUJbSg1x
 hG/LNN5bcwCLWDxMxQ53kfWISzNWqpv6ZNxi0TC5ROa4weVEkv5thZ55Wd7geMo+kV+BzfCMbJd 2IH/nTeZakGNI5Hk1QvDEgr5qD+zOy8sQS9eC7IdhtVgFxFu8BAFoOXwN/t/LPxhv++BadYWH9u G0Kh4wTEeCakTLmW4xgQVwlqOl97YD0wpTsl8dKuh9HbwM83FyjzdON8+fG2dZA2wf9GxqJNNUn
 d5YbNhS/SW2aQm/VREofgPrAI+T7+STTUnUNodIvF8he705WtDfMj/wCfqjb9ldYf1X85hdU
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=68661e04 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=-Z0NSjAlAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=iox4zFpeAAAA:8 a=9FXtMitqcUCsedRI3UEA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 06:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118206

From: Changqing Li <changqing.li@windriver.com>

CVE-2025-6019:
A Local Privilege Escalation (LPE) vulnerability was found in
libblockdev. Generally, the "allow_active" setting in Polkit permits a
physically present user to take certain actions based on the session
type. Due to the way libblockdev interacts with the udisks daemon, an
"allow_active" user on a system may be able escalate to full root
privileges on the target host. Normally, udisks mounts user-provided
filesystem images with security flags like nosuid and nodev to prevent
privilege escalation. However, a local attacker can create a specially
crafted XFS image containing a SUID-root shell, then trick udisks into
resizing it. This mounts their malicious filesystem with root
privileges, allowing them to execute their SUID-root shell and gain
complete control of the system.

Refer:
https://cdn2.qualys.com/2025/06/17/suse15-pam-udisks-lpe.txt

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libblockdev/files/CVE-2025-6019.patch     | 31 +++++++++++++++++++
 .../libblockdev/libblockdev_3.2.1.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch

diff --git a/meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch b/meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
new file mode 100644
index 0000000000..2575578e77
--- /dev/null
+++ b/meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
@@ -0,0 +1,31 @@
+From b2e9c16c726f62e500241617f8f3a03aa658fbe3 Mon Sep 17 00:00:00 2001
+From: Thomas Blume <Thomas.Blume@suse.com>
+Date: Fri, 16 May 2025 14:27:10 +0200
+Subject: [PATCH] Don't allow suid and dev set on fs resize
+
+Fixes: CVE-2025-6019
+
+CVE: CVE-2025-6019
+Upstream-Status: Backport [ https://github.com/storaged-project/libblockdev/commit/46b54414f66e965e3c37f8f51e621f96258ae22e ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/plugins/fs/generic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/plugins/fs/generic.c b/src/plugins/fs/generic.c
+index 2b2180aa..60f7d75e 100644
+--- a/src/plugins/fs/generic.c
++++ b/src/plugins/fs/generic.c
+@@ -661,7 +661,7 @@ static gchar* fs_mount (const gchar *device, gchar *fstype, gboolean read_only,
+                              "Failed to create temporary directory for mounting '%s'.", device);
+                 return NULL;
+             }
+-            ret = bd_fs_mount (device, mountpoint, fstype, read_only ? "ro" : NULL, NULL, &l_error);
++            ret = bd_fs_mount (device, mountpoint, fstype, read_only ? "nosuid,nodev,ro" : "nosuid,nodev", NULL, &l_error);
+             if (!ret) {
+                 g_propagate_prefixed_error (error, l_error, "Failed to mount '%s': ", device);
+                 g_rmdir (mountpoint);
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
index 37c514a219..48e6971d1a 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
@@ -14,6 +14,7 @@ DEPENDS = "autoconf-archive-native glib-2.0 kmod udev libnvme"
 
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=3.2.x-branch;protocol=https \
            file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
+           file://CVE-2025-6019.patch \
            "
 SRCREV = "b829b60d9ff049abb190f09a3b9a5fac648cd5a3"
 
-- 
2.34.1


