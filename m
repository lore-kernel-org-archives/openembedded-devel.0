Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D615CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 02:44:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3388.1778640240626776799
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 19:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FsRnTwoN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=959356aca3=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D2631g013086
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 02:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=XKYVUe0YwgjSydEZDRq+
	ycHeeZ0ASZIsR3HMnuRGZgs=; b=FsRnTwoNmgm7mXAg8ZM6wVsRN8+fTC3yINSI
	PV3arbgNLtV1NLlBituSPdv9OXsa/WVsmE/g9R2b+CQ4cJgEer/MIInKnrQnJzd0
	6zqkjThH1GVy8PpDMJg3HZqUY4DplhHA3NaexaM6VNABLONdSZqsFgoa87r1hSs2
	BnYAsGRlhtqJWSNdpu2YWLE1CbdV650S0CsSMdYHvaKHDHYgr4nioayz+64Tpc0Q
	5tY9q8frzIiZ/LGDbyyWv04mUQpZMCptL58kUapSi5OJ4YhSnL0X+Og+YM6Hz9XM
	sRWjMHLrnpCphMxgV5i8thp4GAeacYgagQp+QSYMjs6xZmDzQQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4g7fg0yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 02:43:59 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 12 May 2026 19:43:58 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 12 May 2026 19:43:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] thin-provisioning-tools: fix compile failure on 32bit BSPs
Date: Wed, 13 May 2026 10:43:51 +0800
Message-ID: <20260513024351.1552422-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nEv3eeXAqvD0U40mbrhy2wJgqODuadfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAyNSBTYWx0ZWRfXy9kf842VidYj
 p18bH6o5jGRHOjX+AQmJKMRZNyNR4i/WXA/ysaeNDYWwEjXCtwv0u+0BhuJNaHQBPQ32DTgvxWJ
 wuGzvjVwCb6UsTxmA0c5THJJ1Uj7E/AiPQ+UcgDTRaUWtcg++1TuAU82sdZ2EXWVfP7H3ByOybn
 pW30Tswamfa3x+tF9+pjmz4OLpRqrM2W+KknDjE3p+ClHIwM7loyxD/xR4y4vAUSI2QhWMtocF5
 1s7RheXE/aL/mOEdj3BXQ12eJgoDf9RJL1mJ7Z7GsbzMW+Ucq0dSS53RM44rzMfbbesnxhceP9r
 hsxmzqsAyuc04i0/CtYVOWSmfRw1lQOZejkn0R1dxJ0n7n3OjqMFNJxICV8a/qe92nqpE824mxv
 29OYKH58/X928Vrt04f8KdWnRwFlzqleEjy/SdcgS/AuVn2nbbwb/Ssb+0Ub08mbNLht2ESS+Oo
 Z14H1FQ+Jf9xwAJshMQ==
X-Proofpoint-ORIG-GUID: nEv3eeXAqvD0U40mbrhy2wJgqODuadfh
X-Authority-Analysis: v=2.4 cv=V81NF+ni c=1 sm=1 tr=0 ts=6a03e56f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=lmjVNyejk7XCqKGie1UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 02:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126881

$ echo 'MACHINE = "qemux86"' >> conf/local.conf
$ bitbake thin-provisioning-tools
```
error[E0080]: index out of bounds: the length is 1 but the index is 4
--> tmp/work/core2-32-wrs-linux/thin-provisioning-tools/1.3.1/build/target/release/build/devicemapper-sys-f88f57f28cd965d2/out/dm-bindings.rs:3:8718
|
3 | ...usize] ; ["Alignment of dm_ioctl"] [:: std :: mem :: align_of :: < dm_ioctl > () - 4usize] ; ["Offset of field: dm_ioctl::version"...
|             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `_` failed here
```

Inherit siteinfo to use SITEINFO_BITS replace TUNE_FEATURES
to test 32bit BSPs

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
index 4d8d2a04df..bdfadc04e8 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     git://github.com/device-mapper-utils/thin-provisioning-tools;branch=main;protocol=https;tag=v${PV} \
     file://0001-Use-portable-atomics-crate.patch \
     file://disable-cargo-metadata.patch \
-    ${@bb.utils.contains('TUNE_FEATURES', '32', \
+    ${@bb.utils.contains('SITEINFO_BITS', '32', \
         'file://dms-no-layout-check.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/devicemapper-sys-0.3.3', \
         '', d)} \
     "
@@ -19,7 +19,7 @@ SRCREV = "8b663fb4c6fb8e52ca06cea57b986c5ba45f668d"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cargo cargo-update-recipe-crates
-inherit pkgconfig
+inherit pkgconfig siteinfo
 
 DEPENDS += "udev libdevmapper libdevmapper-native clang-native"
 
-- 
2.34.1


