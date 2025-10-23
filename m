Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF1BCCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 03:59:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12386.1761191976117697042
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 20:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BTLHzFuN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2391fd9ab2=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N3TpGS3969333
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 03:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=XkhVQRBH6x0FOsfGw8OF
	6pVf2d6Ef5EN8LPZzNf+P/w=; b=BTLHzFuNBUy6bcyn3Hg/iJf6mA6OlTdhbso+
	bv2j0TjESIEAJWRzvHa1O+Z4fXpI1bsDWWyWqtk/5L1vmwfEteUmDdf/t4Wmx3kY
	GdQg5teFuift0xoSvK7FjjE5yKqPlItayXclcNxCTWNVNy2+hZYfPzuv+uyGGsWF
	vI+7TvKNCVDiYier8hfOlryoYVtBGEcRxY0vkV3nVR2e7bdrzvNthLIULdE3BRUQ
	lRBreXGwwFYVmSZr/vOca2eyTJGQR8sYIFUWFT/KAP/6XNzDVyfeSemDlbFWK3E4
	J1+4cpMX0M8MNLYs3oMfmMBSmWxsEHxrz9WyUmRlK/HSqOXgIw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8atg6py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 03:59:35 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 22 Oct 2025 20:59:33 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 22 Oct 2025 20:59:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libyang: explicitly add xxhash to DEPENDS
Date: Thu, 23 Oct 2025 11:59:32 +0800
Message-ID: <20251023035932.2091333-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68f9a827 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=4jKKVLvjYUhfqMih-J0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDAzNCBTYWx0ZWRfX2AEAn6eRm49t
 Ghct7oU+Rj684o6+7PdkcaZovYkHMwl44WypfT7UEzewZQBRNsVspv/SZUT6zh+Bjx2ou15IsFz
 fi8bos4aU+5l9C4AoJLftWXX4/C84i6WK02tDFRDQZH02Brf3bBYatea5/dd/btru5B+WkL4/EC
 YHf6Vn6Cn4+iNu6ijx5Es5mXSPdgVCjfIeOswx72/g+YLbtKnffNIYmoh2TynZ8pQvoHdii614D
 xiPaP4Bjr5ekzy/XbyIbHwe5UzEfAY8/kZr33tZ9E6tc2rh3QB/aXPr7RGayiOugcT7E3rn2+W4
 DcxllmbZY1DhpiIeDDzTvYQ3IlJW1vFN6LUjZHbzFaF5FCeKbG7fvpGxA0rCwTybRt4lPWH9Tfg
 JNSZedw53lUrko3UdT9wHU5pQc1e8A==
X-Proofpoint-ORIG-GUID: E-oeCqEONFp1HK2H2b5mvcm6FCNF1_kk
X-Proofpoint-GUID: E-oeCqEONFp1HK2H2b5mvcm6FCNF1_kk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 03:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120915

When xxhash was included indirectly, there is a QA issue
at do_package_qa
...
|ERROR: QA Issue: /usr/lib64/libyang.so.3.9.13 contained in package
libyang requires libxxhash.so.0()(64bit), but no providers found in
RDEPENDS:libyang? [file-rdeps]
...

Explicitly add xxhash to DEPENDS, then:
...log.do_configure...
-- Found XXHash: build/tmp/work/x86-64-v3-wrs-linux/libyang/3.13.5/recipe-sysroot/usr/include
-- Hash algorithm: xxhash
...log.do_configure...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/libyang/libyang_3.13.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.5.bb b/meta-oe/recipes-extended/libyang/libyang_3.13.5.bb
index 9dad6ba279..4260111200 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.13.5.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.13.5.bb
@@ -16,7 +16,10 @@ SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=
 
 # Main dependencies
 inherit cmake pkgconfig lib_package ptest multilib_header
-DEPENDS = "libpcre2"
+DEPENDS = " \
+    libpcre2 \
+    xxhash \
+"
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}"
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
-- 
2.34.1


