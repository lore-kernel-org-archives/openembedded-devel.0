Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AD9C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 11:03:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19689.1751540609026438962
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 04:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9279aa10a7=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637QTvU028899
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jul 2025 11:03:28 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9ddye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 11:03:27 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 3 Jul 2025 04:03:30 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 3 Jul 2025 04:03:29 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH 1/2] libblockdev: fix CVE-2025-6019
Date: Thu, 3 Jul 2025 19:03:28 +0800
Message-ID: <20250703110329.860545-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: aKiGKackWRnnDhBBDZdpMS2AMZ_BhtPG
X-Proofpoint-GUID: aKiGKackWRnnDhBBDZdpMS2AMZ_BhtPG
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=6866637f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=-Z0NSjAlAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=iox4zFpeAAAA:8 a=pl4uIf748DSZNejoQeEA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA5MSBTYWx0ZWRfX5DlBOBbWd+oe kpJhapEMbYR1T9COxxWXavNWqXU3UKJNaauZJ6mgdTE0QWCE61misjA7T2Cr/6IbvwULQy2EwSj cjuOTqPVQI9pPqELIrJh4AFnwfDQxKYJ6Enu5HOGao3mwqULhjrmEI4Fye4Rfb9i7Jp3uTLwOTV
 ppaTJ0m0JsHyORsi3GQFmMyyuS1iLop4qNfxKp6HM4eWypUbdWoY9tJp3N5tMaHeLXTprb0WnZ4 YMOFuQA61pNXpmBzaMdQD9Qo4vuQQrIB954XxX3VPpRhAv3CIxBHHH47gzJlYJQ1vEl8BkHjqYm 9nwIrxzFbfDIt1fiYOGbvOmzlLCA9/O0AOnxiTfqlzEriSZr5mHdo504zXAuTIvp7/v+OEBTRhU
 +BgexaY6AeHT4P6B1nb7t2FcQWrSBOcIVocbEyVA1dbJiH0KfIh+Hh9X0G5UborkI8kY9BJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 11:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118220

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
 .../libblockdev/libblockdev_2.26.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch

diff --git a/meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch b/meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
new file mode 100644
index 0000000000..4bca3f7564
--- /dev/null
+++ b/meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
@@ -0,0 +1,31 @@
+From d92467589216059aff46f545a7c3eba594103ee3 Mon Sep 17 00:00:00 2001
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
+index eb6b5567..86051391 100644
+--- a/src/plugins/fs/generic.c
++++ b/src/plugins/fs/generic.c
+@@ -409,7 +409,7 @@ static gboolean xfs_resize_device (const gchar *device, guint64 new_size, const
+                              "before resizing it.", device);
+                 return FALSE;
+             }
+-            ret = bd_fs_mount (device, mountpoint, "xfs", NULL, NULL, error);
++            ret = bd_fs_mount (device, mountpoint, "xfs", "nosuid,nodev", NULL, error);
+             if (!ret) {
+                 g_prefix_error (error, "Failed to mount '%s' before resizing it: ", device);
+                 return FALSE;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
index 3e6df5689a..cb3fde288d 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
@@ -12,6 +12,7 @@ inherit autotools gobject-introspection pkgconfig
 
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=2.x-branch;protocol=https \
            file://0001-lvm-Do-not-include-duplicate-entries-in-bd_lvm_lvs-o.patch \
+           file://CVE-2025-6019.patch \
 "
 SRCREV = "47ff12242c89e36a33259d18b7068b26c3bb1c64"
 S = "${WORKDIR}/git"
-- 
2.34.1


