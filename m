Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84AAE80A9A
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 06:28:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11793.1695796096167206905
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 23:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nfghFB3s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7634a032c4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38R5qode000790
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 23:28:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Oxf0q
	NFIKHsc1QEJoGlKk6zKpgMSmcS29+MdLz5huko=; b=nfghFB3sqOPesgIi0vF46
	B1FYKsEK3fHUI7iyx1a+djaTN3yujbzSWU0IxvX7gKNEhWucL4fy5xemqvIGGEb/
	zsv0o9l3oVVukm3MvXmL/ATKZK1w4MT2OC5anOYYyUK953sADyhBgHK9BNmdJYVQ
	NvEJjI6QRJPKHUR/vR9glqi43cdDLLyy6utEVcPIk37gw66r4BGlu2/IeppZE94k
	67VeQ1OFGCm4koZga8KwHU2fAjehRGhKJ2h5METXreahYPv/myvvciG0aft3X8AA
	qZhNijsydZyyzI4brqs4ljnHfg0zo3WKqId6XQM1H2qJvdUYoUYqNOyjdiRF6Yfb
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9ua0ketp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 23:28:15 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 23:28:12 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 23:28:11 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mozjs-102: Remove the buildpath
Date: Wed, 27 Sep 2023 14:28:13 +0800
Message-ID: <20230927062813.2416905-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PZqpqeXawjC2lAaV85sG5XSH2Ssc8jX2
X-Proofpoint-ORIG-GUID: PZqpqeXawjC2lAaV85sG5XSH2Ssc8jX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_03,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=646 impostorscore=0
 adultscore=0 mlxscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 06:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105171

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: mozjs-102-102.9.0-r0 do_package_qa: QA Issue: File /usr/src/debug/mozjs-102/102.9.0-r0/intl/components/Unified_cpp_intl_components4.cpp in package mozjs-102-src contains reference to TMPDIR
File /usr/src/debug/mozjs-102/102.9.0-r0/intl/components/Unified_cpp_intl_components0.cpp in package mozjs-102-src contains reference to TMPDIR

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
index 08cfededa..15b90cb16 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
@@ -73,6 +73,8 @@ do_install:append() {
     sed -e 's@${STAGING_DIR_HOST}@@g' \
         -i ${D}${bindir}/js102-config
     rm -f ${D}${libdir}/libjs_static.ajs
+    # remove the build path
+    sed -i -e 's@${WORKDIR}@@g' `find ${B} -name Unified_c*.c*`
 }
 
 PACKAGES =+ "lib${BPN}"
-- 
2.25.1


