Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1B9CD4F26
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 08:38:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70717.1778575093969004624
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 01:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XaLY/0qy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9592ee7889=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C44G1g3342205
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 08:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mlREFHpSmNR2KGF1O5As
	j6TYYw0N92dq5/X/4bF+Xs4=; b=XaLY/0qyPgwf6VaxoylisoC/OQnkCTYXqEan
	8AOqPRXEEgyNEZTrQVrXpe2ASJBbscoq4ZMIHlwuYMZ6W2nQgtD7+OJ1tiz3y6+B
	SNAS9abyPiGxw0zF2JXBJwiYCa/VPPUQmcvIN4jThNOkqAnHfE2+zAdFSkoPUKSq
	HEcp6iajE09b4rYdFTTu8eQWLDKQdvysDhI/14tqkGnlcFA7nzst4zKMDHTbOBqN
	MlfttSiASv7wlCY5ZNzhdHwhnkEigJ+NYoXGDn8hxhD0unentfyaSVzdwjCKe0So
	RmKVALaxYI+2rruMDLg4u8ozs8qWPL3dXrjNPFvG/ntoFKxiEg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvhrmya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 08:38:12 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 12 May 2026 01:38:11 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 12 May 2026 01:38:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] thin-provisioning-tools: fix compile failure on 32bit x86
Date: Tue, 12 May 2026 16:38:10 +0800
Message-ID: <20260512083810.1201751-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Xe_oSOsTTedKMM9BLsc60SFlPgvElW7n
X-Proofpoint-ORIG-GUID: Xe_oSOsTTedKMM9BLsc60SFlPgvElW7n
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=6a02e6f4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=PvweanJvivybcSPT9agA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4NiBTYWx0ZWRfX9QFNQFKM0Y3L
 Rv+7T55BtceFUrrqXjAFeilKWDU1jphqJ9TphbpZCseA1kuHj14/jK7IYN4rW8GMMOzzc6d8LiG
 7o60mEaNv7twUF+zUpwAw+NIyx6XFZjvzRQIOIXa3TARmVrd8VrfweOQsFUOxUhIzncsamqhl8Z
 GJ1wobGjcouys4xzDSKgwCjOzonhVUz2omCGnsLblK+G2WUMzbjBvAUHMj/WY/iPCKZWj6K6r8X
 k0m97dxKt59CPwVRsalK5mND94xMUY9aA3R2eXyCBqD7uWJGU/MmoII6qrs8H2s8JgDpRC9ClgP
 kioUuSLg5yfnl04BL+kt1NDEvCUgXrjyYJBgr6Hsj4AmwFR+4W+Hd1nG81oLjKaG4R9evz2UeOT
 TRA6/PyYv4hII0Go3esrCCD7MGZV647zeCb7V/rYDxZmdvV5xKex8/Qvh8iwD5tyEeCWa6OEk+N
 sg+tLV3rtYt1h1V6pEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 08:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126864

$ echo 'MACHINE = "qemux86"' >> conf/local.conf
$ bitbake thin-provisioning-tools
```
error[E0080]: index out of bounds: the length is 1 but the index is 4
 --> tmp/work/core2-32-wrs-linux/thin-provisioning-tools/1.3.1/build/target/release/build/devicemapper-sys-f88f57f28cd965d2/out/dm-bindings.rs:3:8718
  |
3 | ...usize] ; ["Alignment of dm_ioctl"] [:: std :: mem :: align_of :: < dm_ioctl > () - 4usize] ; ["Offset of field: dm_ioctl::version"...
  |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `_` failed here
```

Tweak filter condition on TUNE_FEATURES to add m32,mx32 for 32bit x86

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
index 4d8d2a04df..6a58d090e8 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     git://github.com/device-mapper-utils/thin-provisioning-tools;branch=main;protocol=https;tag=v${PV} \
     file://0001-Use-portable-atomics-crate.patch \
     file://disable-cargo-metadata.patch \
-    ${@bb.utils.contains('TUNE_FEATURES', '32', \
+    ${@bb.utils.contains_any('TUNE_FEATURES', '32 m32 mx32', \
         'file://dms-no-layout-check.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/devicemapper-sys-0.3.3', \
         '', d)} \
     "
-- 
2.34.1


