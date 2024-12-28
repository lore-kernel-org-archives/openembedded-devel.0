Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB5EE77188
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 09:09:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26706.1735376936308066446
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Dec 2024 01:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=209293c779=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BS92DCn018254
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Dec 2024 09:08:55 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t6j0g7se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Dec 2024 09:08:55 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sat, 28 Dec 2024 01:08:54 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sat, 28 Dec 2024 01:08:53 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] pahole: update COMPATIBLE_HOST setting
Date: Sat, 28 Dec 2024 17:08:52 +0800
Message-ID: <20241228090852.702714-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=V7KH0fni c=1 sm=1 tr=0 ts=676fc027 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=usxJHlrkmP7g1vUbw9YA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: aBzuXKJo7EJfvHdmU6WaShpjKjedski2
X-Proofpoint-GUID: aBzuXKJo7EJfvHdmU6WaShpjKjedski2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-28_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=643 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412280075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Dec 2024 09:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114576

Due to pahole build depend on pahole, and libbpf added more architectures
to COMPATIBLE_HOST [1], add the same COMPATIBLE_HOST setting to pahole

$ echo "MACHINE = 'qemuloongarch64'" >> conf/local.conf
$ bitbake world
ERROR: Nothing PROVIDES 'libbpf' (but meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.27.bb DEPENDS on or otherwise requires it)
libbpf was skipped: incompatible with host loongarch64-wrs-linux (not in COMPATIBLE_HOST)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'pahole', 'libbpf']

[1] https://git.openembedded.org/meta-openembedded/commit/?id=bb8049afe96db57707afc259743e288bec456117

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/pahole/pahole_1.27.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.27.bb b/meta-oe/recipes-devtools/pahole/pahole_1.27.bb
index b899684eb2..902b0e61b5 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.27.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.27.bb
@@ -7,8 +7,7 @@ DEPENDS = "elfutils zlib libbpf"
 
 # Depends on MACHINE_ARCH libbpf
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_HOST:mips = "null"
-COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
 
 SRCREV = "3e265dac5ec85b956c664464072196c37d2af4f3"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
-- 
2.34.1


