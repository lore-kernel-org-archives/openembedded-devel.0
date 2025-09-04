Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A149FCA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 08:04:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.33947.1756973046654976400
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 01:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qJ8Tk3C+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13423ebaa7=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5847XCI32337911;
	Thu, 4 Sep 2025 08:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=nk50pDJdqAm2WjjvVY19
	xk6/L8gPQKhkxIbdroM8keo=; b=qJ8Tk3C+INM1ZUNat6wHdLeLd83C2Jyeeqc3
	H/uIZ/OpVowyxIVjn0daceJQcwbHJdaDUo1YNpxqltqPPy5Morn48kauaGCdsHNZ
	2n21gZGmCH9EUk4LTjIvh5okCo4qzrESRDdjCKMdxX3bG4OnMZwpIRss85gxyOzL
	JbLbTivfp+Z9wDrbWr6HuYof+dCt/0tEx3l/m2ofrsnTA3EhwithdjqNCWax69dn
	yEO+HGPWZIEoixTn3Gd+kUDnrDvZ7yMK9qgWZLbixON5W0lbNp8O5MKo06SaGFTL
	5sr1ImEL2RXBDhkO9b7G+JDAxBKWZ3+/JB7Td3MF8PgGhmABvA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y0wjr8hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 04 Sep 2025 08:04:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 4 Sep 2025 01:02:19 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 4 Sep 2025 01:02:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>,
        <ross.burton@arm.com>
Subject: [meta-oe][PATCH v2] libsdl2-ttf: add PACKAGECONFIG opengl conditionally
Date: Thu, 4 Sep 2025 16:02:17 +0800
Message-ID: <20250904080217.1602121-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QuFBrKwRVNyKAR3TI483T6WKWYIWCKqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDA4MCBTYWx0ZWRfX9Gms9IpKL8Yo
 TVuTv7m7cRyHnA8YVOL6H/wW6KFeATsPlkxmBfK4ORu+6W1xL1w9FRCEruoaOpu0aTZ6pTlr+nq
 2jNZp/4aU4FXPRi181kTCh/KlEYPuHSZ316kS633UCGE6tIK841WDwQDzxdna0h4qsVO4Rw+cCv
 nUWZ6QJ3QraPMbG4HBKzi1lfxxtKZlVy9lpJVHzW5A6sjxGFGG23qJy4JLLf6ed3yWQ/hg1GAS2
 i5jd1tgwzo6o1pY1ZJynQ4Q2Z8CkAbn++eSbs+qZDdnKeH4Ka9Xltd1dli8O3CHm7Fv4a5hrs13
 quBUlgLpKqoh4BIXoPmR1Dy4/G5LNz+HgkBv7jS/CfGJOeNL9wpaDH8Ll0nTlw=
X-Authority-Analysis: v=2.4 cv=WewMa1hX c=1 sm=1 tr=0 ts=68b947f2 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8 a=pmaWE53RENbzOb8Cv7QA:9
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QuFBrKwRVNyKAR3TI483T6WKWYIWCKqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 08:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119271

GL is only used for an example binary, add PACKAGECONFIG opengl to enable/disable
it according to 'opengl' in DISTRO_FEATURES or not. Otherwise it fails to build
world if 'opengl' doesn't exist in DISTRO_FEATURES.
...
|ERROR: Nothing PROVIDES 'virtual/egl' (but meta-openembedded/meta-oe/recipes-graphics/
libsdl/libsdl2-ttf_2.24.0.bb DEPENDS on or otherwise requires it). Close matches:
|  virtual/kernel
|  virtual/make
|  virtual/perf
|ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
|Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libsdl2-ttf', 'virtual/egl']
...

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb
index d06f41bd0e..eee22ba703 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Simple DirectMedia Layer truetype font library"
 SECTION = "libs"
-DEPENDS = "virtual/libsdl2 freetype virtual/egl"
+DEPENDS = "virtual/libsdl2 freetype"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"
 
@@ -12,3 +12,8 @@ inherit cmake pkgconfig
 S = "${UNPACKDIR}/SDL2_ttf-${PV}"
 
 FILES:${PN} += "${datadir}/licenses"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
+
+# GL is only used for an example binary
+PACKAGECONFIG[opengl] = "-DSDL2TTF_SAMPLES=ON,-DSDL2TTF_SAMPLES=OFF,virtual/egl"
-- 
2.34.1


