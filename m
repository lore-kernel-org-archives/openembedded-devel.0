Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59001C3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 10:26:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12091.1746699954034504851
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 May 2025 03:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7223f3a5bd=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5487ktwA019871
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 May 2025 10:25:53 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430n2fq-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 10:25:52 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 8 May 2025 03:25:49 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] poppler: upgrade 25.01.0 -> 25.04.0
Date: Thu, 8 May 2025 10:25:27 +0000
Message-ID: <20250508102527.832022-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=BajY0qt2 c=1 sm=1 tr=0 ts=681c86b1 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Fi7xCRcZbbY3uOdkh6oA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BKyXRVHAhTLOhLK-1nsWeV9J0iPpOv6e
X-Proofpoint-ORIG-GUID: BKyXRVHAhTLOhLK-1nsWeV9J0iPpOv6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5MSBTYWx0ZWRfXyt3i+unE03YF clT+Yvv12tQptNhG1XK/j9/DjCf4S3w/y/5JKKvvam0aOAd9CossT6yN7gO/94KKkDSOTOVMX7F 8g1rLoOFrG7T9PUQNEBFWzN6+IXGOn8sySA3BbmVih+qvmBQ9yUCP38c9WULlfgWegySfx58JmF
 9SjodycXs/LXAr9Gkap+XCstYUUsHEEjrHtwMKZA0yUmIWtviOSZ/iOdqvUMudjFxC4tZgpuMoM JFmWs3LsIE/GwX+hSOBcsEYQbIBIhY7OAc9CroLiI1pF80sXj1TAfCXsmqVwA7IUxZmbc+9Y7Kl HXslj53iGovY8jWtgVmFJA0Kp8p99BZ6Qjie6YZMlNeSgiK2qKbrXA1UxZWTDbjr0JigoejR/EZ
 4aihMY5EIvq6xaXzHw/r0XMur8y1AYjcWMeEo+Q/Z3Y3/PO0ItmvuLkff/HTA0ifDq90bhCv
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505080091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 10:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117365

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2025-32364 and CVE-2025-32365

Changelog:
===========
core:
* Properly verify adbe.pkcs7.sha1 signatures
* Improve errors on signing failure
* Allow empty outline titles
* Fix error in Distinguished Name parsing
* Fix build with Android API < 29
* Fix parsing Level PG document string
* Internal code improvements
* Fix crashes in malformed documents

utils:
* pdfcairo: Fix document unit for SVG output

cpp:
* Add document::form_type
* Add document::has_javascript

build system:
* cmake: Use modern Python3 cmake module

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/{poppler_25.01.0.bb => poppler_25.04.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_25.01.0.bb => poppler_25.04.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_25.01.0.bb b/meta-oe/recipes-support/poppler/poppler_25.04.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_25.01.0.bb
rename to meta-oe/recipes-support/poppler/poppler_25.04.0.bb
index f7f2ea6cc6..1cd5f28cd8 100644
--- a/meta-oe/recipes-support/poppler/poppler_25.01.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_25.04.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            "
-SRC_URI[sha256sum] = "7eefc122207bbbd72a303c5e0743f4941e8ae861e24dcf0501e18ce1d1414112"
+SRC_URI[sha256sum] = "b010c596dce127fba88532fd2f1043e55ea30601767952d0f2c0a80e7dc0da3d"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 
-- 
2.40.0


