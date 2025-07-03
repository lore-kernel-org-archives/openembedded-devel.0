Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFECC83030
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 06:07:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15951.1751522821822102394
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jul 2025 23:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9279aa10a7=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5634CblJ021746
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Jul 2025 23:07:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm4xmy-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 23:07:01 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 2 Jul 2025 23:07:04 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 2 Jul 2025 23:07:04 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] udisks2: Hardening measure of CVE-2025-6019
Date: Thu, 3 Jul 2025 14:07:02 +0800
Message-ID: <20250703060702.1836226-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703060702.1836226-1-changqing.li@windriver.com>
References: <20250703060702.1836226-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=68661e05 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=-Z0NSjAlAAAA:8 a=xNf9USuDAAAA:8 a=fxJcL_dCAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=Fk5FKYzdMtvwwneLGJ8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jOjsLKnXrLOTlqwb99cYiqjJlL4BoICa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA0NyBTYWx0ZWRfX4exZfWh1Czhc ImGcRMiGm2v8N5bAxGXb/Y0dBO+Fpyin8i+MKajdoNMqZv6H6fS4sIxApMITvVS9qPNY9AbVj7d MGVl5Swpp9rVuHf5VVRS2WMK3YENaDsGWWlt1+7SlhQ9H7bAKDbxkoFJe1hom0ZBIZmXjCkWmSx
 wgFG6xkVZi5E3y906IqJmL3/u4gQk9Nhn3Ntfld3O8NvufN0s7RYJ+LXqezH42ENqK8ROSpmoTB PXso2lRPOkDBrd74/9R0Y7kI50j4jxuJTre9e+HCOjxrQsx4nG0FFp0BFdToiWsZiIBdL5IGWN3 2Q4O2KLnzUyxu0v4Tshmc+U4ORiHyJeW/UlRvFtJ8jL/2QQGYAK0lEnEcs+S61m0h8Cioa/38Rm
 N+X0n4v8w75uFw9h4Xbx9J39JR+k2EsTKOrAQFOvxR2m7j5WltMgbrmfinl/kuqUGplURZjd
X-Proofpoint-ORIG-GUID: jOjsLKnXrLOTlqwb99cYiqjJlL4BoICa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 06:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118207

From: Changqing Li <changqing.li@windriver.com>

Refer [1], CVE-2025-6019 is strongly related to udisk daemon, and
this is a hardening measure related to this.

[1] https://cdn2.qualys.com/2025/06/17/suse15-pam-udisks-lpe.txt
[2] https://security-tracker.debian.org/tracker/CVE-2025-6019
[3] https://ubuntu.com/blog/udisks-libblockdev-lpe-vulnerability-fixes-available

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../udisks/udisks2/CVE-2025-6019.patch        | 51 +++++++++++++++++++
 .../recipes-support/udisks/udisks2_2.10.1.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch

diff --git a/meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch b/meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch
new file mode 100644
index 0000000000..2e94c8497f
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch
@@ -0,0 +1,51 @@
+From d0d04a381036b79df91616552706d515639bb762 Mon Sep 17 00:00:00 2001
+From: Tomas Bzatek <tbzatek@redhat.com>
+Date: Wed, 4 Jun 2025 15:26:46 +0200
+Subject: [PATCH] udiskslinuxfilesystemhelpers: Mount private mounts with
+ 'nodev,nosuid'
+
+The private mount done in take_filesystem_ownership() should always
+default to 'nodev,nosuid' for security and 'errors=remount-ro' for
+selected filesystem types to handle an corrupted filesystem. This is
+consistent with mount options calculation for regular mounts.
+
+CVE: CVE-2025-6019
+Upstream-Status: Backport [ https://github.com/storaged-project/udisks/commit/5e7277debea926370e587408517560afe87d28c9 ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/udiskslinuxfilesystemhelpers.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/udiskslinuxfilesystemhelpers.c b/src/udiskslinuxfilesystemhelpers.c
+index 7c5fc037..9eb7742c 100644
+--- a/src/udiskslinuxfilesystemhelpers.c
++++ b/src/udiskslinuxfilesystemhelpers.c
+@@ -123,6 +123,7 @@ take_filesystem_ownership (const gchar  *device,
+ 
+ {
+   gchar *mountpoint = NULL;
++  const gchar *mount_opts;
+   GError *local_error = NULL;
+   gboolean unmount = FALSE;
+   gboolean success = TRUE;
+@@ -151,8 +152,15 @@ take_filesystem_ownership (const gchar  *device,
+               goto out;
+             }
+ 
++          mount_opts = "nodev,nosuid";
++          if (g_strcmp0 (fstype, "ext2") == 0 ||
++              g_strcmp0 (fstype, "ext3") == 0 ||
++              g_strcmp0 (fstype, "ext4") == 0 ||
++              g_strcmp0 (fstype, "jfs") == 0)
++            mount_opts = "nodev,nosuid,errors=remount-ro";
++
+           /* TODO: mount to a private mount namespace */
+-          if (!bd_fs_mount (device, mountpoint, fstype, NULL, NULL, &local_error))
++          if (!bd_fs_mount (device, mountpoint, fstype, mount_opts, NULL, &local_error))
+             {
+               g_set_error (error, UDISKS_ERROR, UDISKS_ERROR_FAILED,
+                            "Cannot mount %s at %s: %s",
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb b/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
index 85859cd968..cc0c19ec8e 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
@@ -20,6 +20,7 @@ RDEPENDS:${PN} = "acl"
 SRC_URI = " \
 	git://github.com/storaged-project/udisks.git;branch=2.10.x-branch;protocol=https \
 	file://0001-Makefile.am-Dont-include-buildpath.patch \
+    file://CVE-2025-6019.patch \
 "
 SRCREV = "18c9faf089e306ad6f3f51f5cb887a6b9aa08350"
 
-- 
2.34.1


