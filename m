Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF28D116E2
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 06:26:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15331.1764570384610944640
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 22:26:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dSkWsd97;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4430ff5fe6=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B14kCXM3262746
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Dec 2025 06:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=N4fH++jRm8k8xPCzYlBH
	F3YTxFj2O4610dNtmaGBw4g=; b=dSkWsd97/RPNjeFO5BslErV1hPmwoCcLQuaS
	gkujIHpZT08aMhhKCPDiHdu/xVD7kv+73htAhMZOA0LLYY6CkeOAM4H7aLamqH5I
	M9MB8R0Iut3hDe7wlYwmdTfa1om/5qfL2/YD5aYstmfgKqbu65B2lPpGbo4Ic9Od
	Ey/sDHr68c4FaeL+y5/vL9N6Jqpk6W0qvq6kWXywrRaSvijaMmzPYHrOauJATsbq
	DrUKLhxmK537P9mGY8FIfZ46SdC4wyBDQLuViA3pkb0ePluvTuQZxMU8LmRmSxaZ
	IXDc0IgQ0J24xuYyMtXp1A0kk8Hca6OkYfQY1OVaZLDakS/jJw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21sgek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 06:26:23 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 22:26:22 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 22:26:21 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] hdf5: add pkgconfig-native as DEPENDS explicitly
Date: Mon, 1 Dec 2025 14:26:20 +0800
Message-ID: <20251201062620.2517114-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AAfa7h6tmzYtTcrxeuFuQQqWMYZFqMwM
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692d350f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=a4ZxNzwYAAAA:8 a=t7CeM3EgAAAA:8
 a=BYXpZBSoZnFq5YHxWOMA:9 a=ye-Csp9iz97B4shCVKju:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1MCBTYWx0ZWRfX/cmI/qoMcltT
 6nnSRjW7whunn8dBqxKg3oe2EjtBIZ6rKOcxFUeUUxv3Lf+OHaaFtJQGUCAYDM+vgVgkHcX86Vg
 RQQauAEokqMmRAAyeofjPKdUfg+MawOMTqqLYMDD8EiW2t+odkyz1bQ3h0Zldso25bopCapXMCG
 CRup6quryidMWef5kQlKMMLyKJihBNFLxwk40cZIYEaPZ8Y+e22XIizBszKv/jwMRz56wCltcgU
 VjUswveYrETCvVPpLrFuVbBzX5pWmWPBw3RTaN/tT1hQ2ng42n9uRFEkJPyVStBRCnGvOMe9Tmc
 FEOehAu+ixHUxBrzxhKNzuADwtpkEEwJ81VuJd//TA2f6Rczp789SngPUM6lUwyN1nQDJoIrwt6
 hX+z2w+0/cfY/9x+vHuAc9ewK3sPOA==
X-Proofpoint-ORIG-GUID: AAfa7h6tmzYtTcrxeuFuQQqWMYZFqMwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 06:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122191

From: Changqing Li <changqing.li@windriver.com>

Add pkgconfig-native as DEPENDS explicitly, this can avoid install
conflict when enable multilib when pkgconfig is installed on host,
and also improve build reproducibility

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 798ca1b83f..9f77028ce1 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -7,9 +7,9 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71a191398102f76050a4e56e78cb4891"
 
-inherit cmake siteinfo qemu multilib_header
+inherit cmake siteinfo qemu multilib_header multilib_script
 
-DEPENDS += "qemu-native zlib"
+DEPENDS += "qemu-native zlib pkgconfig-native"
 
 SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BPN}-${PV}.tar.gz \
            file://0002-Remove-suffix-shared-from-shared-library-name.patch \
@@ -48,8 +48,11 @@ do_configure:append() {
 do_install:append() {
     # Used for generating config files on target
     oe_multilib_header H5pubconf.h
+    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' ${D}${bindir}/h5cc
 }
 
+MULTILIB_SCRIPTS += "${PN}:${bindir}/h5cc"
+
 BBCLASSEXTEND = "native"
 
 # h5fuse.sh script needs bash
-- 
2.34.1


