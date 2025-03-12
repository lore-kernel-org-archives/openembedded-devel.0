Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA4BC2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 01:00:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26894.1741741197801321896
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 17:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5166cf4169=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C0w3Xi028772
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 00:59:57 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45au8y09gg-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 00:59:56 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 17:59:56 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 17:59:55 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 4/9] pahole: upgrade 1.28 -> 1.29
Date: Wed, 12 Mar 2025 08:59:47 +0800
Message-ID: <20250312005952.1469547-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312005952.1469547-1-changqing.li@windriver.com>
References: <20250312005952.1469547-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sp1YqxGzoMQtytCfMUJbN_NGGZF1zhAx
X-Proofpoint-ORIG-GUID: sp1YqxGzoMQtytCfMUJbN_NGGZF1zhAx
X-Authority-Analysis: v=2.4 cv=ILoCChvG c=1 sm=1 tr=0 ts=67d0dc8c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=Kiih4ZaS0bSxit21UXEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=870 impostorscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503120005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115900

From: Changqing Li <changqing.li@windriver.com>

Upgrade to the latest version

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-devtools/pahole/{pahole_1.28.bb => pahole_1.29.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/pahole/{pahole_1.28.bb => pahole_1.29.bb} (95%)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.28.bb b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
similarity index 95%
rename from meta-oe/recipes-devtools/pahole/pahole_1.28.bb
rename to meta-oe/recipes-devtools/pahole/pahole_1.29.bb
index 83f4bbc7db..d5fa3b4746 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.28.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
@@ -9,7 +9,7 @@ DEPENDS = "elfutils zlib libbpf"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
 
-SRCREV = "1cb4202ed2cbd591734f6b7fb1d2b8aa8eb5a1c3"
+SRCREV = "b9cc7963051b2099795129450f9b70c81950d02f"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
            file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
 
-- 
2.34.1


