Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690F5CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 10:00:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71702.1778580020158921453
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 03:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f73BwyI9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9592ee7889=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4s4sC3001100
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 03:00:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=brNzqAAgpt6A5uPC99HoQQgMMjUY4i2/yaagu2IvnMM=; b=f73BwyI9osu9
	rDwifM+cq87CFzo/pZVb+jQKH8VWVN8j1s90sPk0OVe/RHSup+5z4e0hC0fWM88r
	Sax/eWEJJ6hVnFKabs1mHKaD1hZF0IPJUR2crIT20UwadPOzXfYW8OilBZjuKRaG
	wPqa03EqKZYRV/q36A82PwYPIdj+tPUZLctlKhevvpGQOpXj2FU9xEfXpIKzymEd
	kYA18l8+apMCak5IaI3TlNzjW2Mslvzw3nMhofxO8p5KQq7W+jx7Db0A/PeY/+mG
	hAWJg4Nb2M0qIcOu+30bbdqLNdeSvR5Ep1fZ7X4yUT4YhpzcIjebZ4XgAFciRP3z
	4Juv6bmzsg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nv90qye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 03:00:19 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 12 May 2026 03:00:19 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 12 May 2026 03:00:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] thin-provisioning-tools: fix compile failure on 32bit arm
Date: Tue, 12 May 2026 18:00:17 +0800
Message-ID: <20260512100017.1253823-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <18AEC49FFA26B3B3.2455325@lists.openembedded.org>
References: <18AEC49FFA26B3B3.2455325@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -N2N63ORc9uuohX6Y2oH0B74ifj6V7SD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwMiBTYWx0ZWRfX9UDUjm4cklkn
 lmpa/Zgn+ZLSTb5FZ91JBhu3/ZxwHE/MAzEfNG69oAmZ1cP6t0L3lH/+HqpThPAc7VNuptxQC23
 Hi9NVOoiiSkyzwwdxjbviOwx6z2C8RMwo8C+fh8z523zz8/EfJ5O2nQNb85yqPrlQD9g5zn957Z
 ANUzJBEo90GPSOBlFXiQjquYgyg99lrvtNO3IdvNEBcgo5x74rGmsMMV6D6ngBuSk+rxFP7BxQR
 gDgHrMp9j+ouiNFBeXOQy1PdxijcOh2J/oiWytpWR0sbRSGLzWo/TTApOT4t3s60znQZZNQXyYI
 m+nFxtqBaWHKwTzv60XFn65XlHk/NgEAm3e4oSiIyBg3iBjTR3pGLhe9XVwTFCynV41ynihU4QJ
 4IX+u9PE68LN4l/t4E3fW5h9XraOHp087KlGR0n0BmeKvFywgZCSOCjRuqnFRKV5No9DeAtu7jL
 K+ZTtCboAGsKt/Vv9fQ==
X-Authority-Analysis: v=2.4 cv=OaWoyBTY c=1 sm=1 tr=0 ts=6a02fa33 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=kezPsl4VdMNyhdsTEhEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -N2N63ORc9uuohX6Y2oH0B74ifj6V7SD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 10:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126865

$ echo 'MACHINE = "beaglebone-yocto"' >> conf/local.conf
$ bitbake thin-provisioning-tools
```
error[E0080]: index out of bounds: the length is 1 but the index is 12
 --> TOPDIR/tmp/work/cortexa8hf-neon-wrs-linux-gnueabi/thin-provisioning-tools/1.3.1/build/target/release/build/devicemapper-sys-f88f57f28cd965d2/out/sem-bindings.rs:3:1177
  |
3 | ... _ : () = { ["Size of ipc_perm"] [:: std :: mem :: size_of :: < ipc_perm > () - 36usize] ; ["Alignment of ipc_perm"] [:: std :: me...
  |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `_` failed here
     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `_` failed here
```

Tweak filter condition on TUNE_FEATURES to add arm for 32bit arm

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
index 6a58d090e8..9ac9328507 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     git://github.com/device-mapper-utils/thin-provisioning-tools;branch=main;protocol=https;tag=v${PV} \
     file://0001-Use-portable-atomics-crate.patch \
     file://disable-cargo-metadata.patch \
-    ${@bb.utils.contains_any('TUNE_FEATURES', '32 m32 mx32', \
+    ${@bb.utils.contains_any('TUNE_FEATURES', '32 m32 mx32 arm', \
         'file://dms-no-layout-check.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/devicemapper-sys-0.3.3', \
         '', d)} \
     "
-- 
2.34.1


