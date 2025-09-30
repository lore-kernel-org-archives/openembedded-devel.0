Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239E1CCA468
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 10:25:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20906.1759223380811881646
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WagwYopX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2368f9697a=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58U5KdxW1814299
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:09:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=GjnQ3El0KVO6+XQKO2/S
	qBAtXLvbSKF4NYnouwsmIf4=; b=WagwYopX0mFgV2yZBv5H7/Z+bmlsMl7IUnMj
	KP72Q/w/dPe5dn1Dv6xAT9hzoHsGciOuYaqr3/v0+FEsEp5hm3WXSC5adGatmIOx
	mO0gj+GrSG8bx/NWvD45HwOQyENabkpfwxtXdiEZoXPP4bXn1z2ECDNuLE4uFGQ6
	E22ttoZZ0xOG236NssBFgvXW1gAiY+uCnf6t+3Z4GwS4ICcPdLMZzD+LEXgEd8ND
	bsTkaT0AD6c5UFTeT8fUucf+merUX8Hing0kipsoHWNwawWXOKoJ2BjIh+U8zhIb
	8dkgXjEFxw+0QQJFnvelMVyXMLKN6wnG95L1a7hp/gUfy+3BTQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49efegaucv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:09:40 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 30 Sep 2025 02:09:39 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 30 Sep 2025 02:09:38 -0700
From: "Kadambathur Subramaniyam, Saravanan" <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][master][walnascar][PATCH 1/1] udisks2: upgrade 2.10.1 -> 2.10.2
Date: Tue, 30 Sep 2025 14:39:37 +0530
Message-ID: <20250930090938.1286816-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: Bp4RI8F1PQmeaPGmi-qmu6tv9HcJGp90
X-Authority-Analysis: v=2.4 cv=aKr9aL9m c=1 sm=1 tr=0 ts=68db9e54 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=BUH1krOO9SQA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=GWcqYlTyHeRk2dHaoGYA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-GUID: Bp4RI8F1PQmeaPGmi-qmu6tv9HcJGp90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDA4MSBTYWx0ZWRfX06jXpHI6HnK2
 Rc0Z4XM/aWSyynxQ58nFrvAQ6pm8GVGal0LIZWI/J0ZiU7rWK8y3WjBOE30XSQYqoJGfylnusxR
 xDKOSpmh6No3UVVRQATqE9irJvR3xO7XWJuq1Ycs0kvJJwiZyAoa2VsefbqmgaiY0/ipJzErK/v
 +ctOwCMS6LpJI+bP5jiQGUD5vOzvD1r6ZGDoDGCfmdMF/vIEBVE2YSXJBj3UY09NluX5rXhLTe0
 UdR2wrdjgFNX87w/Imcs8hoychP1Yfl6PQckD/Se+374vBpOfi1hvHYeIASM/M63eJ7xVFZ5O4W
 570pLQV/GSZHUh1SlNwr1M800Ug3lg3JgiR1hF6UoexaIULH+o6uUgPkbOoaR00DnVenbDcj+Qu
 8yVacLgkKJ6tO4ov6DcWyUWit3Exgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509300081
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 10:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120078

This patch addresses below CVE's:
CVE-2025-6019
CVE-2025-8067

Changelog:
https://github.com/storaged-project/udisks/releases

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../udisks/udisks2/CVE-2025-6019.patch        | 51 -------------------
 .../{udisks2_2.10.1.bb => udisks2_2.10.2.bb}  |  3 +-
 2 files changed, 1 insertion(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch
 rename meta-oe/recipes-support/udisks/{udisks2_2.10.1.bb => udisks2_2.10.2.bb} (95%)

diff --git a/meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch b/meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch
deleted file mode 100644
index 2e94c8497f..0000000000
--- a/meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From d0d04a381036b79df91616552706d515639bb762 Mon Sep 17 00:00:00 2001
-From: Tomas Bzatek <tbzatek@redhat.com>
-Date: Wed, 4 Jun 2025 15:26:46 +0200
-Subject: [PATCH] udiskslinuxfilesystemhelpers: Mount private mounts with
- 'nodev,nosuid'
-
-The private mount done in take_filesystem_ownership() should always
-default to 'nodev,nosuid' for security and 'errors=remount-ro' for
-selected filesystem types to handle an corrupted filesystem. This is
-consistent with mount options calculation for regular mounts.
-
-CVE: CVE-2025-6019
-Upstream-Status: Backport [ https://github.com/storaged-project/udisks/commit/5e7277debea926370e587408517560afe87d28c9 ]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/udiskslinuxfilesystemhelpers.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/src/udiskslinuxfilesystemhelpers.c b/src/udiskslinuxfilesystemhelpers.c
-index 7c5fc037..9eb7742c 100644
---- a/src/udiskslinuxfilesystemhelpers.c
-+++ b/src/udiskslinuxfilesystemhelpers.c
-@@ -123,6 +123,7 @@ take_filesystem_ownership (const gchar  *device,
- 
- {
-   gchar *mountpoint = NULL;
-+  const gchar *mount_opts;
-   GError *local_error = NULL;
-   gboolean unmount = FALSE;
-   gboolean success = TRUE;
-@@ -151,8 +152,15 @@ take_filesystem_ownership (const gchar  *device,
-               goto out;
-             }
- 
-+          mount_opts = "nodev,nosuid";
-+          if (g_strcmp0 (fstype, "ext2") == 0 ||
-+              g_strcmp0 (fstype, "ext3") == 0 ||
-+              g_strcmp0 (fstype, "ext4") == 0 ||
-+              g_strcmp0 (fstype, "jfs") == 0)
-+            mount_opts = "nodev,nosuid,errors=remount-ro";
-+
-           /* TODO: mount to a private mount namespace */
--          if (!bd_fs_mount (device, mountpoint, fstype, NULL, NULL, &local_error))
-+          if (!bd_fs_mount (device, mountpoint, fstype, mount_opts, NULL, &local_error))
-             {
-               g_set_error (error, UDISKS_ERROR, UDISKS_ERROR_FAILED,
-                            "Cannot mount %s at %s: %s",
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb b/meta-oe/recipes-support/udisks/udisks2_2.10.2.bb
similarity index 95%
rename from meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.10.2.bb
index cc0c19ec8e..081b315b9b 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.10.2.bb
@@ -20,9 +20,8 @@ RDEPENDS:${PN} = "acl"
 SRC_URI = " \
 	git://github.com/storaged-project/udisks.git;branch=2.10.x-branch;protocol=https \
 	file://0001-Makefile.am-Dont-include-buildpath.patch \
-    file://CVE-2025-6019.patch \
 "
-SRCREV = "18c9faf089e306ad6f3f51f5cb887a6b9aa08350"
+SRCREV = "bc623acf9e7488dc105e4b00069d57e303e2616b"
 
 CVE_PRODUCT = "udisks"
 
-- 
2.48.1


