Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F1FCAC5B0
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 05:27:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12122.1759814855746612307
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 22:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P6YuUmHw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2375170c05=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59758v412261803
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Oct 2025 05:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=p85sf9b4WR2TY5PKaHcG
	kEKOPG0v//sknfWg9rMGeOw=; b=P6YuUmHwZ9gK8Hfk+G8zuVRCs2EzIT9u/jTu
	yOkIAyHgQ/UCADgb7zbD4gxud7Q7cXdUEM2RV0cp5E8je49ZgIe9Lvn7n/R+t5p4
	++ezsuJK57DUCf+UFkxvjYfjHbck8GV69IAya/Wa4tnXyZ9qIF9AN0IL6T5bTtnV
	DcV1k3iL7nBcH9boiU7L+wNvNVnxp8W0zsK4oEIgtf97UzpHlgKtyi54bhsvUtSB
	IemIw/x6qTvoiPpGHcFHf5jURaV4SCdxgczIDJITWGEXFyrDV07FGtLiadjW041q
	vWxzjQlxlya0Avy8m4NTZeymVwP333whEoyTgX3G944mfKqsDA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jtj3ahdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 05:27:34 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 6 Oct 2025 22:27:33 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 6 Oct 2025 22:27:32 -0700
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][Kirkstone][PATCH 1/1] udisks2: fix CVE-2025-8067
Date: Tue, 7 Oct 2025 10:57:26 +0530
Message-ID: <20251007052726.2425336-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CXeE1SUC4G2qHkNZl6JSriNl9YA0YXjw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDA0MSBTYWx0ZWRfX4+LkLKZBeWlM
 YVRdr3gN0EBPo5yQ7VLem1JcxRr6R3V2aGF5/OP/ZNjGZ2HQEiI0bSnsWtFYXkPadPxMvw06BpG
 HLkFFrWpLdxTcak7PnMWA8HjDdDwJoBGH8JijlMXq0nB3Sm9HoV9TqmCuOCDQC+voAcBSs1rhde
 JwfGVhGvKM7lI30MJqcYM8+ZWoxc3InilcSJUiMfByz2SVXBzUm+c68Ceg9J+6Ejfmc701sRWbO
 dTI4txgFv7S/JvgAvOh0S5VgXrhxe03ffLf7OzHaAKT7Me0kxR4orSjI8+82JGyWLk8Vn3olqb+
 nqIPagJDf22pfERsBNNsBXt2S8p8A9XHP4xh1b/heneOMTK7SGNQcRAjGUVCYmY/CR6VlRT273N
 eQttwCuuY1jRkp/+mQPF43KuMIYlwg==
X-Proofpoint-ORIG-GUID: CXeE1SUC4G2qHkNZl6JSriNl9YA0YXjw
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=68e4a4c6 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=DfNHnWVPAAAA:8 a=qDn-v1om22YIBEUWLCoA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510070041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 05:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120320

Reference: https://nvd.nist.gov/vuln/detail/CVE-2025-8067

Upstream-patch:
https://github.com/storaged-project/udisks/commit/9ed2186f668c76aeb472de170d62b499d85a1915

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../udisks/udisks2/CVE-2025-8067.patch        | 37 +++++++++++++++++++
 .../recipes-support/udisks/udisks2_2.9.4.bb   |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2025-8067.patch

diff --git a/meta-oe/recipes-support/udisks/udisks2/CVE-2025-8067.patch b/meta-oe/recipes-support/udisks/udisks2/CVE-2025-8067.patch
new file mode 100644
index 0000000000..93e79c1e18
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/CVE-2025-8067.patch
@@ -0,0 +1,37 @@
+From 9ed2186f668c76aeb472de170d62b499d85a1915 Mon Sep 17 00:00:00 2001
+From: Marc Deslauriers <marc.deslauriers@canonical.com>
+Date: Tue, 15 Jul 2025 13:34:08 -0400
+Subject: [PATCH] udiskslinuxmanager: Add lower bounds check to fd_index
+
+CVE: CVE-2025-8067
+
+Make sure fd_index isn't negative as this can lead to an OOB read
+resulting in a crash, or to exposing internal file descriptors.
+
+Reported by Michael Imfeld (born0monday).
+
+(cherry picked from commit 280b127124332c6436bc8273ef677f218b435593)
+
+Upstream-Status: Backport
+[https://github.com/storaged-project/udisks/commit/9ed2186f668c76aeb472de170d62b499d85a1915]
+
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ src/udiskslinuxmanager.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/udiskslinuxmanager.c b/src/udiskslinuxmanager.c
+index 7a614f44..76694cfd 100644
+--- a/src/udiskslinuxmanager.c
++++ b/src/udiskslinuxmanager.c
+@@ -359,7 +359,7 @@ handle_loop_setup (UDisksManager          *object,
+     goto out;
+
+   fd_num = g_variant_get_handle (fd_index);
+-  if (fd_list == NULL || fd_num >= g_unix_fd_list_get_length (fd_list))
++  if (fd_list == NULL || fd_num < 0 || fd_num >= g_unix_fd_list_get_length (fd_list))
+     {
+       g_dbus_method_invocation_return_error (invocation,
+                                              UDISKS_ERROR,
+--
+2.39.4
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
index 10d564658c..979b0efae7 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
@@ -18,7 +18,9 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 RDEPENDS:${PN} = "acl"
 
 SRC_URI = "git://github.com/storaged-project/udisks.git;branch=2.9.x-branch;protocol=https \
-           file://CVE-2025-6019.patch "
+           file://CVE-2025-6019.patch \
+           file://CVE-2025-8067.patch "
+
 SRCREV = "001c486e6d099ed33e2de4f5c73c03e3ee180f81"
 S = "${WORKDIR}/git"
 
-- 
2.35.5


