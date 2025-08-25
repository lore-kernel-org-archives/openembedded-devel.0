Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0D9CA0FE1
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 07:46:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34025.1756107961871583652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 00:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CzNa2B55;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0332d1973f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57P5OPF22753569
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 07:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=AkWqK8uHjHNBmyhYOLnc
	4WTzVONZoSHkPY99SUbJ0xc=; b=CzNa2B55t8vRI0ehPLYQVgm8ScYpz4f1r3pS
	ZzJznBbWih87EL0O7qCug+Nc+jZq5FdL5KmORRVGcoQJroZ2VuQoqRAcKzOYA3nE
	KPNQnQ/R5n/Uz4Y0fUtGcHgb53KDToRDmBI/BixTI6w4pp2AMH+uPLCeqgor16XV
	XY4sHun7lyoZVoea0yNcyTPxdjzaVWb4zUk2YF0IAf52RHbgk/xqW3xijpJYRbjV
	d7bMgJiSk4nraQoGE4xAvLjBenevHvaTWW2TBylcgM6qUKArdM5oGpGPxCU4P0/a
	x9FFQlu75uklvveQDPV7/PIwkQ6VrWcaEpAT/z1XTye0fX7tsQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q4m3sjj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 07:46:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 Aug 2025 00:45:59 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 Aug 2025 00:45:59 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libconfig: switch source to GitHub repository
Date: Mon, 25 Aug 2025 15:45:58 +0800
Message-ID: <20250825074558.2945810-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDA2OCBTYWx0ZWRfX3A3QpZCXExju
 xLVA7WYfluYoRsJQCAyDDKPSBB/SPq9Z83UKBHyKNHWwN06wvVnjiCyTHBx2++3gH4EPCSuGhuJ
 hnxUbCvbWDXk4dzuGmP+OQTqOERJ4CcL7JDch9Al2M9eaLgnUMna3RGUzNzGqyiDa9fII+uFwcw
 63v/sxSA0I9c0RMtduyMHbx6BXbPe1TXWx7UutvnJE1/3IUOCwMA7pWiuuepLfh6zcOhZE5OhaN
 xUNDd41C3c09gtcubDpOT3O94hAEtJsuSbptzsBH5CLeLRFqfHtXclEBeNW0P/CMZ2nNMSv42BN
 jcUKe5TbUWqt7EE1kmM9sfvFX2Wfo7KjInzw688Nx1x1Wz0IQQaRm68lod4xMM=
X-Proofpoint-ORIG-GUID: lgLCXZUGSoL_e5tsqaRuBg_N07YQLoSn
X-Proofpoint-GUID: lgLCXZUGSoL_e5tsqaRuBg_N07YQLoSn
X-Authority-Analysis: v=2.4 cv=CcwI5Krl c=1 sm=1 tr=0 ts=68ac14b8 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=jn5mJRsBAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=EqJmOwNUkXt9ClG8XrMA:9 a=0flEoihKdI8QF1_aUImP:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 07:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119092

From: Jiaying Song <jiaying.song.cn@windriver.com>

The original tarball URL no longer provides version 1.7.3 or any other
historical releases.To ensure reproducible builds, the source has been
switched to the official GitHub repository.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
index a4df707dd7..ace2698fa4 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
@@ -7,9 +7,11 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
-SRC_URI = "https://hyperrealm.github.io/libconfig/dist/libconfig-${PV}.tar.gz \
+SRC_URI = "git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master \
     file://0001-Fix-declarations-to-allow-build-with-gcc-15.patch \
 "
+SRCREV = "525922a6b49ca19235cdf307376e7c9c539d1b93"
+S = "${WORKDIR}/git"
 
 # needed when we modify grammar.y with above patch
 DEPENDS += "bison-native"
@@ -19,7 +21,5 @@ UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
 
 inherit autotools-brokensep pkgconfig
 
-SRC_URI[sha256sum] = "545166d6cac037744381d1e9cc5a5405094e7bfad16a411699bcff40bbb31ee7"
-
 PACKAGE_BEFORE_PN = "${PN}++"
 FILES:${PN}++ = "${libdir}/${BPN}++*${SOLIBS}"
-- 
2.34.1


