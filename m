Return-Path: <Shilong.Jiao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FC3CD5BD0
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 01:42:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2083.1779932541050546547
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 18:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pCdl3vkD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9608f5f826=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RNt9ET550478
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 18:42:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=CUiNevtgA8wqh+wrj+mB
	KfPYni991kFzuTBNf6UPnys=; b=pCdl3vkDUai3vN6plrUsL2QoHgrY+6whFBDz
	z9WjOOmPGy4l48bq1TWxhMWp78vERBK6KglaZJhSjJQgM7OM4FZrUV4gTRE2AOQn
	0B13ctBw5QAL69oTaeHBdUwy8TdhsYZFVRZJ7v84sI6ZvYjU7Qoh4pQSDYslJ9+8
	mHdA6Q2M+GQzlMuH6f8eiJTwTxwj/MHCfgyM9rHoTZ/gy8Jhv5hKObsjxW9zXZec
	WTBj9Y4lNPwC9tz88WHqDw+P0LA/6XleEYFVmD2zSOwA0Zr7UxNERaJWRWXSAzsZ
	DsIU3MxSCYhcZETDFY6Aog15GI0ARUSCoTGjkWOy12iCtCaZ7Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6r73k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 18:42:20 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 27 May 2026 18:42:19 -0700
Received: from pek-lpgtest26.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 27 May 2026 18:42:18 -0700
From: <Shilong.Jiao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] lcms: add ptest support
Date: Thu, 28 May 2026 09:42:18 +0800
Message-ID: <20260528014218.171858-1-Shilong.Jiao@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4s_vGNLBl7hjG8OkoUgXvdEnr7R_0B5K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAxMyBTYWx0ZWRfXyOUIN8ifO37R
 CQcVlJ4NGk6GCd2T3MtZXWFbthzNHXdDXvhPf3eB+Zi+jCh3YqL+ugt4SMgYCMqTHPSIHs5XyYa
 vMSA1xFfw3I3vnVT07MM0IIvpmcsTthwwc02LA+k6lLHU9o7sZiCb0DbgxZgRUIGlmt2CPDAaOG
 eZX9ahxdOkxp1gvydZLHdDGGynjOnqOPc9vu8Tfy3vJ8D2UVVcGykQh5hMUXj/oebr+DtHQICHa
 Us7bRgSVnB8e1Da4ozS9SUVKNm9tBeNrLNkMohlA6hBjcxGjr8USPbcE+MOyVkjsw/rpSb43Y4s
 5d1ADgbKi9ZKDQ4cY1mlAv5wBlNUDLgWLQKEAwlEVN7pGNyx7qGpthtzClOhrz/dpUD56wSyh/v
 wbKA8ozsLt6lpRHx82hgIGk/oslaeBKq2vAPtOsNR2H86WC+iqVa7ST3ETb1StJlzICUi0HguZ+
 jprFW+K7VvB5XqK8vrQ==
X-Proofpoint-ORIG-GUID: 4s_vGNLBl7hjG8OkoUgXvdEnr7R_0B5K
X-Authority-Analysis: v=2.4 cv=FcEHAp+6 c=1 sm=1 tr=0 ts=6a179d7c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=XWbmxvukGjTj0yYCZ74A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 01:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127269

From: Shilong Jiao <Shilong.Jiao@windriver.com>

Test results:
root@qemux86-64:~# ptest-runner lcms
START: ptest-runner
2026-05-28T01:12
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
DURATION: 11
END: /usr/lib/lcms/ptest
2026-05-28T01:13
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Shilong Jiao <Shilong.Jiao@windriver.com>
---
 .../conf/include/ptest-packagelists-meta-oe.inc   |  1 +
 meta-oe/recipes-support/lcms/lcms/run-ptest       |  4 ++++
 meta-oe/recipes-support/lcms/lcms_2.18.bb         | 15 ++++++++++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)
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
diff --git a/meta-oe/recipes-support/lcms/lcms_2.18.bb b/meta-oe/recipes-support/lcms/lcms_2.18.bb
index 1ff3b3908f..72cca1843f 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.18.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.18.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz \
            file://CVE-2026-41254_1.patch \
            file://CVE-2026-41254_2.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] = "ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347"
 
@@ -15,6 +16,18 @@ BBCLASSEXTEND = "native nativesdk"
 
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


