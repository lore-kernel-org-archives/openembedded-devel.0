Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678CECA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 04:27:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.57020.1756182469877510391
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 21:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m5rsxgdD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0333471bfd=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q3uDFZ952162;
	Tue, 26 Aug 2025 04:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=qERR/AuSNWT+uv9ZsYTB
	RFk81/1DElJ7afMm9NT0MpY=; b=m5rsxgdDvQKd6Xy2/kTzZ6T5+KXs/dOTKJl3
	thlJv1GEwVG/UOvB+N4nsd8vOodeELZOjDuCwodzlx+vf7pclafOx13ouZ/8+I9w
	VE1D8SvW/3qH1faVjL6vJgnjgmWO0be1bbZrO9lGa/CXOUL3ADvSOCCS3evfFbQH
	9P6iJfJSqB/jIkXU7yl76515LGlve8uITIvlQQswcYnTUxZgYzcKSN16iL6jJIYh
	M3jRAvaXtcLM9dyBL5vDRslpR7JjCBpWvfbBb16N3fv/QG+NUtySMOBYXCQoNsZd
	2wvZHdxzKRnq8Op2u1SjI0fyauwhyMZfFxwfl3mQE8IO453wBA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1aq2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Aug 2025 04:27:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 Aug 2025 21:27:47 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 Aug 2025 21:27:46 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3] libconfig: switch source to GitHub repository
Date: Tue, 26 Aug 2025 12:27:44 +0800
Message-ID: <20250826042745.1629517-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vLnus6ybJYRxHW9clIZ7gFSowxmCr5rr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDAzNCBTYWx0ZWRfX6OiQgtDtvMoH
 0v/B7gAwbxhjae8R3uORQ7SJ6woLNp2ty60tR+fUsCc2XZOI5A1CGeUj8jOUP7w3s52201U2iLC
 X683bUTeqDUqBIbAIqn7izljycO66sQBqXtejF1UoQuBfQKHHX4sqPxQfIp3caHh2RZZOSSLXHJ
 SyQrda/bAKDDcppUaHUGaAN9pR2rS0nBjrDR20QHBpRxocCJUxU5TgjUiqZ6JiIIcNjuQIDAKGv
 PWEGXpIU9wnUWIopoUx1UJDLtXYk4k7Hs+qX6PAqYMHmSTeL9Si9kgWYxfo4g3hnPtid0YdU0GV
 o7gypG1f21anJnfWn4sAog2S0uE803/y9gh/JuFqBDluwCy69y6gLVYNT7+le8=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68ad37c4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=jn5mJRsBAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=t9np61nTB1atcGYidMMA:9 a=0flEoihKdI8QF1_aUImP:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vLnus6ybJYRxHW9clIZ7gFSowxmCr5rr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 04:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119110

From: Jiaying Song <jiaying.song.cn@windriver.com>

The original tarball URL no longer provides version 1.7.3 or any other
historical releases.To ensure reproducible builds, the source has been
switched to the official GitHub repository.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
index a4df707dd7..bd7d7e64b8 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
@@ -7,9 +7,10 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
-SRC_URI = "https://hyperrealm.github.io/libconfig/dist/libconfig-${PV}.tar.gz \
+SRC_URI = "git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v${PV} \
     file://0001-Fix-declarations-to-allow-build-with-gcc-15.patch \
 "
+SRCREV = "525922a6b49ca19235cdf307376e7c9c539d1b93"
 
 # needed when we modify grammar.y with above patch
 DEPENDS += "bison-native"
@@ -19,7 +20,5 @@ UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
 
 inherit autotools-brokensep pkgconfig
 
-SRC_URI[sha256sum] = "545166d6cac037744381d1e9cc5a5405094e7bfad16a411699bcff40bbb31ee7"
-
 PACKAGE_BEFORE_PN = "${PN}++"
 FILES:${PN}++ = "${libdir}/${BPN}++*${SOLIBS}"
-- 
2.34.1


