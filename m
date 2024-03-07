Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085BAC54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 03:21:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14990.1709781668248179348
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 19:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XPpCnwGf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3796958646=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4272g2Ra032398
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Mar 2024 19:21:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=9CbX7
	Q5TE1Eogd+n7Rt7194kYZ4cvTNzDLWvSDqsltc=; b=XPpCnwGfwDPGHwEsJpjI/
	gtMzg7mPA35O/QxAHlc6c9VHU1sGKLU2bEnp3muC8PK4tvZkX2nzh5u/9l+EayG3
	AiXwu/iwbMwwQh+OI3rhZgMMCbxtWjnncomuopiSlNZqbv0NTL6ML4ZMXwPVRKH+
	mfYg1o1eVQJfs/mSCj8NBZMLbbJap0Mk5O9kQZBNR8NkjOi05A4Md0m3Ev5v8xZE
	IlCNbCTNq8rhBTc2zItb7ZNNhql+bGQfdb1nNweRlP8tfM9Ng9Oo5mobrRI9a5yn
	dKArhKI8FxdkVZoANnPlTws0D/ZHVE1oiuS0Q8vdaBxnH+khnaHrQEiJN8xW/iYS
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093vj02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 19:21:07 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 19:21:07 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 19:21:06 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] googletest: Pass -fPIC to CFLAGS
Date: Thu, 7 Mar 2024 11:21:04 +0800
Message-ID: <20240307032105.1806173-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EI8BcCE1s9Gg_j44wQxAR1f0WFcRIPRx
X-Proofpoint-ORIG-GUID: EI8BcCE1s9Gg_j44wQxAR1f0WFcRIPRx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_14,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=938 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 03:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109187

From: Mingli Yu <mingli.yu@windriver.com>

Fail to build re2 which depends on googletest as below:
/build/tmp-glibc/work/core2-64-wrs-linux/re2/2024.03.01/recipe-sysroot-native/usr/bin/x86_64-wrs-linux/../../libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/13.2.0/ld: /build/tmp-glibc/work/core2-64-wrs-linux/re2/2024.03.01/recipe-sysroot/usr/lib64/libgtest.a(gtest-all.cc.o): warning: relocation against `_ZTVN7testing8internal11MatcherBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE' in read-only section `.text._ZN7testing8internal11MatcherBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED0Ev[_ZN7testing8internal11MatcherBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED5Ev]'
/build/tmp-glibc/work/core2-64-wrs-linux/re2/2024.03.01/recipe-sysroot-native/usr/bin/x86_64-wrs-linux/../../libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/13.2.0/ld: /build/tmp-glibc/work/core2-64-wrs-linux/re2/2024.03.01/recipe-sysroot/usr/lib64/libgtest.a(gtest-all.cc.o): relocation R_X86_64_PC32 against symbol `_ZTVN7testing8internal17TestEventRepeaterE' can not be used when making a shared object; recompile with -fPIC
/build/tmp-glibc/work/core2-64-wrs-linux/re2/2024.03.01/recipe-sysroot-native/usr/bin/x86_64-wrs-linux/../../libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/13.2.0/ld: final link failed: bad value
collect2: error: ld returned 1 exit status

So pass -fPIC to fix the above issue.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-test/googletest/googletest_1.14.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
index 1b05f3d33..4c9d1e709 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
@@ -16,6 +16,7 @@ inherit cmake pkgconfig
 #
 PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
 
+CXXFLAGS:append = " -fPIC"
 
 ALLOW_EMPTY:${PN} = "1"
 ALLOW_EMPTY:${PN}-dbg = "1"
-- 
2.25.1


