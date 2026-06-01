Return-Path: <Shilong.Jiao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70356CD6E4C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 08:22:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23726.1780302120450708297
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2026 01:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Kv12btQz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0612baab07=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6516gEap2850951;
	Mon, 1 Jun 2026 08:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=MryFJlLZu
	m7YeNNz/zNZs140+BBGl6kFE6hpP3ca4CY=; b=Kv12btQzyeD5xGNLYwAjbVAIE
	eBeNzxRsgJqkgmyUgE0GJOpayaedv2PFEvZGcUsvhxc94JqEW78Bj5EuymFtmdT6
	CdNityTNelPI5lKNME5dmfzuFLuOKqjl133Cae1Z11zhR2eUT9d7s+HLMhUd8048
	o7/6xMLkpzjWQcO7k9ti9gsLFKR2ah55eYMi3aUwcYA+xvDGDnOCrGIMujPuBaQ7
	jKFKIqVbSLBeApkvRaUCRH7kJojnq5daM+NLso8WZOvHSmWT7vwx/zluPTY+692k
	4QE3L2SAT66cWh1zYjxpZnyCp3cCV+/zPJFqRJJtRGyPM2Ur8ph0MFbJSZzGQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efn402s7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 01 Jun 2026 08:21:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Jun 2026 01:21:57 -0700
Received: from pek-lpgtest26.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Jun 2026 01:21:57 -0700
From: <Shilong.Jiao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <sjiao@windriver.com>
Subject: [meta-oe][PATCH v3] lcms: add ptest support
Date: Mon, 1 Jun 2026 16:21:55 +0800
Message-ID: <20260601082155.424766-1-Shilong.Jiao@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YapMhANEbcakBmV_SomqH15uXahsicBy
X-Proofpoint-GUID: YapMhANEbcakBmV_SomqH15uXahsicBy
X-Authority-Analysis: v=2.4 cv=GI441ONK c=1 sm=1 tr=0 ts=6a1d4127 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=XWbmxvukGjTj0yYCZ74A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA4MyBTYWx0ZWRfX4oPnBksFSeWJ
 pSxRRP2oQt6eX9kSJLK08IYtnOlT+SV0Y26AquKwtdeqUZbF6+R6DrjjJCVPa9/cfQNtg7hNp/a
 ZwUPTlit8HBsyAeWQLg5DHlmLsC9zsNYlDXLKDdp52L9lCCnCdAY068HNcXw2Cf1P8CqholspgH
 fHzfLyotYm/+mU4975U26CgDArjK5J8nT0Pz3+ipFHVN1mFGoqXy0FrdiefUsvJpjK4mxCOnq3K
 Otz27y/+xHUcrh8Q2ZbZog8Va5xdxbai2wF/SnBP2FWcifYJybonR5wpqCVvrnFWq8O678ZvDAj
 FLFQfnI0rYEb6jjaenuw9maTkzcZQpzpBR3XKkusAymka+nXGRuvQwBWJWZxqnzAFHsi5QIdGTi
 hGG3/Lc4PI+Bf//HZZWtncB3wyBof5Hfhf0CwEgGYqxGu768DqsxCjc0Q3Qf0fLmyeju9MD/NuN
 I3BnhrQR6MsD1yKay7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2026 08:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127308

From: Shilong Jiao <Shilong.Jiao@windriver.com>

Test results on qemux86-64:
START: ptest-runner
BEGIN: /usr/lib/lcms/ptest
PASS: Base types ...Ok.
PASS: quick floor ...Ok.
PASS: Fixed point 15.16 representation ...Ok.
PASS: D50 roundtrip ...Ok.
PASS: 1D interpolation in 2pt tables ...Ok.
PASS: 1D interpolation in 4pt tables ...Ok.
PASS: 1D interpolation in 18pt tables ...Ok.
PASS: 1D interpolation in descending 3pt tables ...Ok.
PASS: 1D interpolation in descending 18pt tables ...Ok.
PASS: 3D interpolation Trilinear (float)  ...Ok.
PASS: 3D interpolation Trilinear (16)  ...Ok.
PASS: Reverse interpolation 4 -> 3 ......Ok.
PASS: 3D interpolation with granularity ...Ok.
PASS: 4D interpolation with granularity ...Ok.
PASS: 6D interpolation with granularity ...Ok.
PASS: 8D interpolation with granularity ...Ok.
PASS: Lab to XYZ and back (float only)  ...Ok.
PASS: Lab V2 encoding ...Ok.
PASS: Blackbody radiator ...Ok.
PASS: Linear gamma curves (float) ....Ok.
PASS: Curve 2.2 (float) ...|Err|<0.001953 .Ok.
PASS: Curve 1.8 (table) ...|Err|<0.053287 .Ok.
PASS: Curve 3.0 (table) ...|Err|<0.049726 .Ok.
PASS: Curve 2.2 (word table) ...|Err|<0.972654 .Ok.
PASS: Parametric curves ...Ok.
PASS: Join curves descending ...Ok.
PASS: Join curves sRGB (Float) ...Ok.
PASS: Join curves sigmoidal ...Ok.
PASS: 1 Stage LUT  ...Ok.
PASS: 2 Stage LUT (16 bits) ...Ok.
PASS: 3 Stage LUT (16 bits) ...Ok.
PASS: 4 Stage LUT (16 bits) ...Ok.
PASS: 5 Stage LUT (16 bits)  ...Ok.
PASS: 6 Stage LUT (16 bits)  ...Ok.
PASS: XYZ to XYZ LUT (float only)  ...Ok.
PASS: Named Color LUT ...Ok.
PASS: Floating point formatters ...Ok.
PASS: ChangeBuffersFormat ...Ok.
PASS: Multilocalized Unicode (II) ...Ok.
PASS: Create named color profile ...Ok.
PASS: Header version ...Ok.
PASS: Error reporting on bad profiles ...Ok.
PASS: Curves only transforms .........Ok.
PASS: Encoded Lab->Lab transforms ...Ok.
PASS: Matrix-shaper transform (float) ...Ok.
PASS: Matrix-shaper transform (8 bits) ...Ok.
PASS: Known values across matrix-shaper ...Ok.
PASS: Gray Lab input profile ...Ok.
PASS: Gray Lab output profile ...Ok.
PASS: Matrix-shaper proofing transform (16 bits) ...Ok.
PASS: CMYK roundtrip on perceptual transform ...Ok.
PASS: Black ink only preservation ...Ok.
PASS: Deciding curve types ...Ok.
PASS: TAC detection ...Ok.
PASS: CGATS parser on junk ...Ok.
PASS: PostScript generator ...Ok.
PASS: MD5 digest ...Ok.
PASS: floating point tags on XYZ ...Ok.
PASS: Parametric curve on Rec709 ...Ok.
PASS: Floating Point segmented curve with short sampled segment ...Ok.
PASS: Check MetaTag ...Ok.
PASS: Set free a tag ...Ok.
PASS: Planar 8 optimization ...Ok.
PASS: Swap endian feature ...Ok.
PASS: Forged MPE profile ...Ok.
PASS: Empty MLUC ...Ok.
PASS: OkLab color space ...Ok.
PASS: centering of Lab16 ...Ok.
PASS: Unbounded mode w/ integer output ...Ok.
PASS: Bad CGATS file ...Ok.
PASS: Gamut check on floats ...Ok.
PASS: Context memory handling ...Ok.
PASS: Alarm codes context ...Ok.
PASS: 1D interpolation plugin ...Ok.
PASS: Parametric curve plugin ...Ok.
PASS: Tag type plugin ...Ok.
PASS: Optimization plugin ...Ok.
PASS: Full transform plugin ...Ok.
PASS: Double from float ...Ok.
DURATION: 10
END: /usr/lib/lcms/ptest
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Jiao Song <sjiao@windriver.com>
---
 .../include/ptest-packagelists-meta-oe.inc     |  1 +
 meta-oe/recipes-support/lcms/lcms/run-ptest    |  4 ++++
 meta-oe/recipes-support/lcms/lcms_2.19.1.bb    | 18 ++++++++++++++++--
 3 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100755 meta-oe/recipes-support/lcms/lcms/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index a9cbaf6982..8432ebfbf2 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -26,6 +26,7 @@ PTESTS_FAST_META_OE = "\
     imagemagick \
     jemalloc \
     jq \
+    lcms \
     leveldb \
     libcereal \
     libdbi-perl \
diff --git a/meta-oe/recipes-support/lcms/lcms/run-ptest b/meta-oe/recipes-support/lcms/lcms/run-ptest
new file mode 100755
index 0000000000..20d954c193
--- /dev/null
+++ b/meta-oe/recipes-support/lcms/lcms/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+cd $(dirname $0)
+./testcms 2>&1 | awk '/^Checking/{test=substr($0,10); sub(/ \.\.\.$/,"",test); getline; print (/FAIL!/ ? "FAIL: " : "PASS: ") test}'
diff --git a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb b/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
index 074a1c0428..281dce01b9 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
@@ -3,7 +3,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz \
+           file://run-ptest \
+           "
 SRC_URI[sha256sum] = "bfc54f7bab59fbc921012014a8032e4cba4abd46db47d46b76416a8c0b2815c8"
 
 DEPENDS = "tiff"
@@ -12,6 +14,18 @@ BBCLASSEXTEND = "native nativesdk"
 
 S = "${UNPACKDIR}/lcms2-${PV}"
 
-inherit autotools sourceforge-releases
+inherit autotools sourceforge-releases ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/testbed testcms
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    install -m 0755 ${B}/testbed/testcms ${D}${PTEST_PATH}/
+    install -m 0644 ${S}/testbed/*.icc ${D}${PTEST_PATH}/
+}
+
+RDEPENDS:${PN}-ptest += "bash"
 
 CVE_PRODUCT += "littlecms:little_cms_color_engine"
-- 
2.34.1


