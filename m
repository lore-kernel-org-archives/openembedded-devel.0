Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B14C83F04
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 11:03:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19690.1751540609707855605
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 04:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9279aa10a7=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637QTvV028899
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jul 2025 11:03:28 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9ddye-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 11:03:28 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 3 Jul 2025 04:03:31 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 3 Jul 2025 04:03:31 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH 2/2] udisks2: Hardening measure of CVE-2025-6019
Date: Thu, 3 Jul 2025 19:03:29 +0800
Message-ID: <20250703110329.860545-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703110329.860545-1-changqing.li@windriver.com>
References: <20250703110329.860545-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Uo29jSK7YnKc4xJh6odSv3JRA6Ggi_Nq
X-Proofpoint-GUID: Uo29jSK7YnKc4xJh6odSv3JRA6Ggi_Nq
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=68666380 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=-Z0NSjAlAAAA:8 a=xNf9USuDAAAA:8 a=fxJcL_dCAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=Fk5FKYzdMtvwwneLGJ8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA5MSBTYWx0ZWRfX5qBC4Bjl3iq9 d5u4KBnN4YRDPjCU87m8ecX8WJzDdHtLxCFtpD82xhUypnr2/pLnzrElunO+eLmaLMovq1je3Fv ry61IJPMTzVKRJlCDSxHronqfWEbGBsORe62LbqJz/PuJ0WL+7dy6HLuRn2Ua8GcswD5OOBzvHr
 a3XNi5Bzg8XLBjXYQeEJYTlBHNylp++ngBye9TMhuDGinRl+fUBcoG29XHsH7fl+oWPWHWmaY3I h1J9b9cEeXCj5r/dhs0qhYkm2oJpSuGCpnwkXYtUhaJWDqfP44e/Eu5P0tlOFH9VM69dbC5+Hfl vO5HkQJMJHZckc0OD/XBzbStifIsEmDICZnRwQ16Jd2M+A9P2WKDcNs+xdKW2MairhNap/8C0Nm
 9zpu2nEayRqf7VK94rFtk4GBCaR5OP7+6Wg6nTEHLX/grvqLtRGuo5RNgh6Q0+uW564DZZ6Q
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118221

From: Changqing Li <changqing.li@windriver.com>

Refer [1], CVE-2025-6019 is strongly related to udisk daemon, and
this is a hardening measure related to this.

[1] https://cdn2.qualys.com/2025/06/17/suse15-pam-udisks-lpe.txt
[2] https://security-tracker.debian.org/tracker/CVE-2025-6019
[3] https://ubuntu.com/blog/udisks-libblockdev-lpe-vulnerability-fixes-available

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../udisks/udisks2/CVE-2025-6019.patch        | 51 +++++++++++++++++++
 .../recipes-support/udisks/udisks2_2.9.4.bb   |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
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
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
index 3de5557238..10d564658c 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
@@ -17,7 +17,8 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 RDEPENDS:${PN} = "acl"
 
-SRC_URI = "git://github.com/storaged-project/udisks.git;branch=2.9.x-branch;protocol=https"
+SRC_URI = "git://github.com/storaged-project/udisks.git;branch=2.9.x-branch;protocol=https \
+           file://CVE-2025-6019.patch "
 SRCREV = "001c486e6d099ed33e2de4f5c73c03e3ee180f81"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


