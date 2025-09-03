Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86BACA1007
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 06:25:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5884.1756880705302662764
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 23:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QkULZmWY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1341c1fd9b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5835OvkL3722475
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Sep 2025 06:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=zXIHksWZvxvTNoRW1xyI
	sftP9uw+/ZHQ/HFynLO9mT0=; b=QkULZmWYoJAaysDoCtO1LBbqcFNgrCuk+hCq
	S7jBGlFaS3/zWEGRCB+i4Sy8gfdtIRPrtsteftrSH4rIAEnuirTliY7AM/F/LaRV
	JjxG6tWTXzfqtyTlK0oLcmNm4Y/Ff8InkOxxuekMl0DDRC1JaDt+AuxkeKy7u0ha
	V5/nGXcHHiUmAWT6ln1AAhUbT6tC5fxKJk+4HK41NK2f3nyIWpGITrtkvdsaEH9n
	frNk3GMQIwESaz8KLxqry50B0O0KHR1DTcfdR9d7HkZN0a5tveDlEA7Q820rj1Zx
	grXi8lEj9CWjHdHkj/Iq4C3q48ILG5ZmaC/WDzylKsuDQv8y0g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48upgykqc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 06:25:04 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 2 Sep 2025 23:25:10 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 2 Sep 2025 23:25:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/3] libsdl2-ttf: require distro feature opengl
Date: Wed, 3 Sep 2025 14:25:01 +0800
Message-ID: <20250903062503.122121-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDA2MSBTYWx0ZWRfXy9VPjmQIrqQ+
 695dCqolBk7SguN9jAXduik1ze7c4tuuBUaB6d8WZJCYKGrh8YNLrpPYCEJMjS+6HkFnSjDP+CI
 13qDLx+IzltOxZWB9rp4Wz8zYPfLZ8wkbZ1kWmCfo07MIvhlpNSHX24HB2UWoto2n3COpRrVWyL
 CCvKHq775RUd8b8n88IYLFAllLcrlaQ/jmESbFH8NnUpXlE2DOtnXOpJcf/oC89luDkIUif0HaD
 uy+OnNoy/ZifCdSxypIh0w6F/LyCVamT5q4acS4nM1lIqsJMFiCmpWGIcOQut2yprhJWDydstr2
 4uKURpqn0I+amXbRD5aN8ZekBEtulYp7HmNieKeRdi4Gd8HHbFA3LbZ4HuwN+k=
X-Authority-Analysis: v=2.4 cv=eubfzppX c=1 sm=1 tr=0 ts=68b7df40 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=rApI4zH3AAAA:8 a=t7CeM3EgAAAA:8 a=MDuFjOD1L1dfYvjeUo8A:9
 a=nY6XeQbCzfSyNvKqsd4y:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zSyfP2ofg0FDcg6Jv2NEIVRi5dh0qvPE
X-Proofpoint-ORIG-GUID: zSyfP2ofg0FDcg6Jv2NEIVRi5dh0qvPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 06:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119190

Make libsdl2-ttf require distro feature opengl. Otherwise it fails
to build world if 'opengl' doesn't exist in DISTRO_FEATURES.
...
|ERROR: Nothing PROVIDES 'virtual/egl' (but meta-openembedded/meta-oe/recipes-graphics/
libsdl/libsdl2-ttf_2.24.0.bb DEPENDS on or otherwise requires it). Close matches:
|  virtual/kernel
|  virtual/make
|  virtual/perf
|ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
|Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libsdl2-ttf', 'virtual/egl']
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb
index d06f41bd0e..a3fb13c45d 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"
 SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${PV}.tar.gz"
 SRC_URI[sha256sum] = "0b2bf1e7b6568adbdbc9bb924643f79d9dedafe061fa1ed687d1d9ac4e453bfd"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 S = "${UNPACKDIR}/SDL2_ttf-${PV}"
 
-- 
2.34.1


