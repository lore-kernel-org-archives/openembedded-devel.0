Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64014CA0FF2
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 04:20:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.57277.1756182033799453711
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 21:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QPeMIsC1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0333471bfd=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q3bhuw921577;
	Tue, 26 Aug 2025 04:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=qERR/AuSNWT+uv9ZsYTB
	RFk81/1DElJ7afMm9NT0MpY=; b=QPeMIsC1Reh535mqsnFdYIYzxJw7geqUdvg5
	ObEhDHp6+VMiQIvswByzwryW3NYr5oTXGQVJ//lN00oK8YiZ4MGkSW0GuKZeWy/s
	+nwuPQ15CE3QXAQz4C69RMVCeqQHc5xw/4MJhOp/D2weBUK+5YyBmPZM+4QgyP3V
	50NwIU15UIklndtncQ4n0CUDIYK0l8kz2muBDO8FBPsiZtOgLZvkyuSEuf7kYU53
	3cNGzs9wp1nDmjj5R428K+sesYE0NhALVe4v6PtX7w3cf4sNVz1MPpu9zFiGSfJ7
	jNGf0jp9i10csr9cEsuNNf2F4CssfPkKprBM2Qgge1hbtk3WLg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1apu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Aug 2025 04:20:32 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 Aug 2025 21:20:31 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 Aug 2025 21:20:30 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [PATCH v2] libconfig: switch source to GitHub repository
Date: Tue, 26 Aug 2025 12:20:28 +0800
Message-ID: <20250826042029.1612164-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2pniNE12N_wK1GYewRlDzDVOt5KRQy2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDAzNCBTYWx0ZWRfXx2V9m0eWbU54
 8enjI/bwSoeaSFfm9tGMvQT8Sx1k7KUjyb4P0g7514bb0z7fiBxBYPiqq1q/nCpOGOMGCPltwe/
 zt834FDlMMRFz/tN0+MowcYFKaq/S8L3iwYNCUet8sIOZXL9/ITBM4gpWEH7RIIfGmKJjL/zxaO
 tduox57gRnkx1Ee05Knxwr49Mmn/YD1YpGMHtyV0zUZmH+4wo3GxJM9RUErsEYG5ejwBh+Zhomj
 YIwXik4zfx0UqtIcGptuBrccu7+wcB/SsODvB5ECYhHhxs7+Mgi8CbMn5DOt5pzgn09EKXTGjmu
 wECpSjBJ1zBYa1gYX3mWDE2L0YJX2SqJtL/GAJlWUUqDVnwPIvroKh4NOtXqOs=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68ad3610 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=jn5mJRsBAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=t9np61nTB1atcGYidMMA:9 a=0flEoihKdI8QF1_aUImP:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2pniNE12N_wK1GYewRlDzDVOt5KRQy2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 04:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119107

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


