Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E8FCD5BBF
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 06:50:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10404.1779688662354338749
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 22:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zsogs7XN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9605107f15=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P35JZI1347489
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 22:57:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=n5Lq0r/jRtoD35YPXP4O
	e+m73BULvQE2PWxv5paNc3s=; b=Zsogs7XNfh0xsB57oFU7dyyc9N7hYxxc7YMn
	OUMUZtkzFE4YCZLBgRs59sG5VJTHS0iyx8yPmniQstDknmZoSdkiDlKebg+P25dW
	8dglH0C6Jvz0bU305hG3tKuy3S2UWvJ+oMInxmNzMKRwmNy+LlZJ5YKJZ6N+grxl
	G2REEQ6EgLtc5q+7x6sPo7th579lUf7w46tMYEBPkUkcutFztlt51VSZFwRa6Zpc
	BvYPU9e7XkXylEDoExLGEwXTIsYSLtXxCe6iI432/jyTpJwANBrIKqULggyIxC9n
	LIIX6FolfUyHKfxI4aJinwp6u0fwuXO9SUk+c7dkRWYMAt8i9g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ebbrehv3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 22:57:41 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 24 May 2026 22:57:41 -0700
Received: from pek-lpgtest26.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 24 May 2026 22:57:40 -0700
From: Shilong.Jiao@eng.windriver.com
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] lcms: add ptest support
Date: Mon, 25 May 2026 13:57:39 +0800
Message-ID: <20260525055739.1795967-1-Shilong.Jiao@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: 4v2HDQ-F5Ak4DmwWvRuXKagFyCb3ltvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA1NiBTYWx0ZWRfX4O4O0Mj7y2R2
 pv/rDVvpapp1rB39NA714nWrt3G7kb0F33taOtcK2DhReWsXhnh7VgeD+S+wEgZr+TA7eQIcRlO
 htHX87WwjshmtcONm3o6NN4udp3bmYYpxba2rawFFUICO89n4SZmrk33pts4F4Mk/lmaiJU6I6c
 I0vug0unPBDwMZSucPvS8wnbhZto/8mZ6+STRICajKmKPQPqdpmhmKxGF9ByqM1rlrCQBLCZzgY
 rjYSQxqV6Vb1Wb6rvm579upuTE0a0wA/+uJy11yV9I0sdOVpE8bK2dhUzXuesnF5nuFdIpGpFie
 HZxa3O5arrE4JoshFgW0tk6H+5lhawBWlpRwVlZxOc9h6pacY4jEsHPjwq1LTiops0wqmP3E7EG
 84A60o/kWCnkE/apWG7rqu/VjdyLYaXP5b+H6+DndG5YUSFJWJfLSnZ4M5YpsL/jOadW1eHOV86
 ZT1btm5qXGG7O33E+ug==
X-Authority-Analysis: v=2.4 cv=IMUyzAvG c=1 sm=1 tr=0 ts=6a13e4d5 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=BjkWJgjJtEGrnpP-EDkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4v2HDQ-F5Ak4DmwWvRuXKagFyCb3ltvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250056
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 06:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127196

From: Shilong Jiao <Shilong.Jiao@windriver.com>

Add ptest support for lcms to enable automated testing of the
color management engine functionality.

Tested on qemux86-64 and qemuarm64:
- All 79 test cases passed
- Duration: ~163 seconds

Signed-off-by: Shilong Jiao <Shilong.Jiao@windriver.com>
---
 meta-oe/recipes-support/lcms/lcms/run-ptest |  4 ++++
 meta-oe/recipes-support/lcms/lcms_2.18.bb   | 15 ++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100755 meta-oe/recipes-support/lcms/lcms/run-ptest

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


