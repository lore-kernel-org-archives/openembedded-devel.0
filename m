Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D00CCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 11:59:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14414.1760529533697771888
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 04:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rE21pyDm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23839a5c94=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F5wNx71953204
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 11:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=JdrBuOtt277Ak1oNzMfQ
	oBWac3VYMx4aZbtNN8fZ8Dk=; b=rE21pyDmueHCXVEOxt6alBTO8Ik8Xb/STvmE
	/ny5NImwTXKiVfa+bSOG7x61bUoXM11ttPbvvfy2x9VPbrpa6dTazVyV7k+jcDJD
	7L77o5DHih+fliFpi1eNZ1XlJvForsCv2KED8vZTLYSQl5NWqm2ALheQwd4IYvhX
	YrfDi2VfyIe/W5YpBcGPrqyXibj+xNxfe7Dxjp8fFbbSY8MMs9x8mNM5hHZZyoC1
	5HeSXGlYE1eRZVwTAfbM1EezZsk38dDboiipqh3+5byWuRLXW8CAKFWiHb/xt4h8
	IBud8HCVI5CacgFGO/QKKORiy9upnIgFijE+nwgiRU6qgpk5xQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewmxx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 11:58:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 15 Oct 2025 04:58:51 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 15 Oct 2025 04:58:49 -0700
From: <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] yasm: fix CVE-2024-22653
Date: Wed, 15 Oct 2025 17:28:45 +0530
Message-ID: <20251015115845.2059924-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7rRR55--6qOsCxJtQkw9f7kxMd-q1PBj
X-Proofpoint-ORIG-GUID: 7rRR55--6qOsCxJtQkw9f7kxMd-q1PBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA5MyBTYWx0ZWRfX9Tt//3poTP7t
 hUOxSLwGQ6CzZjIMd4j0XX3vhllXN6UQ+5EMfa5GP7KMWH6Rh61FIKrjZ+cy6B/+D+B+OkiOoSL
 v+Dim/l4h5KGoUzlBsRA6Qp2AVfYzwxKccdT1QPwdZRrf8Gn8C9e+7WAdhdPft49q3cJEZRGaIc
 HUyG4s5R6g+hqQqYf+eQa/qLf6Luk5X4zBjKzMPhf4FmZxlZjKkuYp0TYBW4sEeraMmu49B8Q8A
 2mnjamjmeKvccRPuceb6MrYGCJYaleZpbrOGzJ8ai8CgWSnf6OacsH9nLC+fVxP9JkKnBztE/An
 QWRQs70VBnmQbItOXo88ppR8xy0sxWcubiTdO0EnPkOmHpPUdTyf3KdeU5nH8oJ/ghc252P2Yvi
 gXlo7mKV//tQ3dpGxAHGXw9Ya6C05Q==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ef8c7c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=8BzczKt8Np9Ig-cRJ64A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 11:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120707

From: Praveen Kumar <praveen.kumar@windriver.com>

yasm commit 9defefae was discovered to contain a NULL pointer
dereference via the yasm_section_bcs_append function at section.c.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-22653

Upstream-patch:
https://github.com/yasm/yasm/commit/121ab150b3577b666c79a79f4a511798d7ad2432

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../yasm/yasm/CVE-2024-22653.patch            | 32 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.patch
new file mode 100644
index 0000000000..dbbd4b94ef
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.patch
@@ -0,0 +1,32 @@
+From 121ab150b3577b666c79a79f4a511798d7ad2432 Mon Sep 17 00:00:00 2001
+From: haruki3hhh <135201297+haruki3hhh@users.noreply.github.com>
+Date: Mon, 24 Jun 2024 18:08:27 -0500
+Subject: [PATCH] Fix null pointer dereference in yasm_section_bcs_append
+ (#263)
+
+CVE: CVE-2024-22653
+
+Upstream-Status: Backport [https://github.com/yasm/yasm/commit/121ab150b3577b666c79a79f4a511798d7ad2432]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ libyasm/section.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libyasm/section.c b/libyasm/section.c
+index ba582bfa..1c1ba710 100644
+--- a/libyasm/section.c
++++ b/libyasm/section.c
+@@ -611,6 +611,10 @@ yasm_bytecode *
+ yasm_section_bcs_append(yasm_section *sect, yasm_bytecode *bc)
+ {
+     if (bc) {
++        if (!sect) {
++            yasm_error_set(YASM_ERROR_VALUE, "Attempt to append bytecode to a NULL section or with a NULL bytecode");
++            return NULL;
++        }
+         if (bc->callback) {
+             bc->section = sect;     /* record parent section */
+             STAILQ_INSERT_TAIL(&sect->bcs, bc, link);
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 60b00f7ff4..e6e4faa8a9 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0001-Do-not-use-AC_HEADER_STDC.patch \
            file://CVE-2023-31975.patch \
            file://CVE-2023-37732.patch \
+           file://CVE-2024-22653.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.40.0


