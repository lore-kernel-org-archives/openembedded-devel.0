Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758C7C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 04:11:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.335.1750392695246729447
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 21:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82667ab89c=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4AAC4021181
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 21:11:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c8729b24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 21:11:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 19 Jun 2025 21:11:33 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 19 Jun 2025 21:11:32 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <liezhi.yang@windriver.com>, <changqing.li@windriver.com>
Subject: [meta-oe][PATCH] xmlsec1: avoid hardcoded ${RECIPE_SYSROOT} in xmlsec1-gnutls.pc
Date: Fri, 20 Jun 2025 12:11:31 +0800
Message-ID: <20250620041131.2424118-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAyOSBTYWx0ZWRfX2Pg09fS9WWIm UtSBjrpmTBg9onWSy62J3WGPzkUfuu++aTupqRo6FJB00czVs6PX0vjtrotx3MmK5x6JlJdCA2b ty3HoTDjlEz12VlgyT6Hqx7FUAymh6YcC7gims5a+VdXZGX+FCpmB4oPEvmFGd1Rjxwc2RdHOdW
 lq88hNkNjPFoSfMsY4BXQsfudYIi0XfX3ASsOqdIxDSwtyDKPWxoZk6Wz28EGbcsHhNjAAr985w RsKyDnlHRtXI6kKyDXQzHtNt3GnPXU8PcDaceMlJR5QouR367s1ipbFp1W831ZnKLXQDKp8Snuh GhJ4mvyEB8E/yEg1Q+X9hdiXRkzOTL8SjpS0dt+VyJWn60tjvhfGk3GuYYZKeSnCloedWThkv5u
 XuMvGfCdme6BvyKSb0vZlxYVCxWGKz5clRJHXRzGH8sQmdJi1zQETP8eeWMNVHP8imoXmvjT
X-Proofpoint-GUID: GJy5o-zPZS-WMAa4V86l7HIi2mXf9aJ8
X-Proofpoint-ORIG-GUID: GJy5o-zPZS-WMAa4V86l7HIi2mXf9aJ8
X-Authority-Analysis: v=2.4 cv=RpXFLDmK c=1 sm=1 tr=0 ts=6854df76 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=rxPG2xO6JBkilPhHeE8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=987
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506200029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 04:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117960

From: Jiaying Song <jiaying.song.cn@windriver.com>

Fix do_package_qa error by removing ${RECIPE_SYSROOT} from the installed xmlsec1-gnutls.pc file.
This ensures the generated .pc file does not leak build-time paths, complying with QA checks.

Fixes QA error:
ERROR: xmlsec1-1.3.7-r0.wr2500 do_package_qa: QA Issue: File /usr/lib/pkgconfig/xmlsec1-gnutls.pc in package xmlsec1-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
index 2fdfd55f24..0f4ae205b1 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
@@ -54,8 +54,11 @@ do_compile_ptest () {
 }
 
 do_install:append() {
-    for i in ${bindir}/xmlsec1-config ${libdir}/xmlsec1Conf.sh \
-        ${libdir}/pkgconfig/xmlsec1-openssl.pc; do
+    for i in \
+        ${bindir}/xmlsec1-config \
+        ${libdir}/xmlsec1Conf.sh \
+        ${libdir}/pkgconfig/xmlsec1-openssl.pc \
+        ${libdir}/pkgconfig/xmlsec1-gnutls.pc; do
         sed -i -e "s@${RECIPE_SYSROOT}@@g" ${D}$i
     done
 }
-- 
2.34.1


