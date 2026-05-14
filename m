Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958B2CD4851
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 09:33:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6898.1778751215692535272
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 02:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=My3ZEPDi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9594220287=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E8grrC3664253
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 02:33:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2mahLOfjecf3HBC7gV8m
	X74bxZaNzeoXiTTEQH7iays=; b=My3ZEPDi6+Waw63dzW48wYaz3LGm5yE2CmBY
	x4kSRpjB8190grfIbXK0S1qRHKPmorDxLFTzJu8L07b4KVXmrdFuWTUVhm0qIIfj
	S+lsUlnb3RgAdi4dAojggO6z77710RzuU4F7a2r3ZJGPfTwhRXlmZG5H4vjHYnnR
	TB1CO/5pjZvSPCDHz89obULsFy4GXxt2gCcuqrZr71HQgoxLYLz6lvbVYn1ZdD4c
	zevR40QPTvpTGQYyGt52At2O3zPQx+vZdHP57nxFvKY7pKn3jDP8oyvYc+6HFGKf
	Mb+GqVZlQn9/S/DIC0R/i3JWkg5fr/ctIPYAHPuP6ZjPevEa2w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftba2kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 02:33:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 14 May 2026 02:33:34 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 14 May 2026 02:33:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] 7zip: update CVE_STATUS for CVE-2022-47111 and CVE-2022-47112
Date: Thu, 14 May 2026 17:33:32 +0800
Message-ID: <20260514093332.342177-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MyBTYWx0ZWRfX+/8m/ksgqOw6
 sqjtnJ+7Do8wS6xNv5NgPJbysDHbYDkhhXcVjpL7xHAlhmg7RCIitiIVxt+rV46PNB+L/BB/tIM
 1emAMy1JmOOScTHumwKrzPpOKvS+aAzPiCp06YxZC7mJqIghm571lpEQFa8bM/aZByEep/AWFfs
 GIGXpGJ6B/9uc5OLnt+F/FwyiuxBLrh/rLnPyJZEao+fkfSrQiwlnsgJ4STLM7H5ClbH4+bTT9N
 a+yiE3XlVG4yEqT4adcNBb+RDuNlGUwe62Gj9tA0YoxK0sZHuWaDC1LRuZz3357R/Yrxibx0x+t
 lufsaTBdxNx/IsDtX+PA2nQsLyQgL0+Bo0f4q8+X63RQpx0Qd6e4PDhrrroT5krmkVN9O/zczDf
 Xl3vU9oSff3Rn9vsVFOg6nqFKjFc5dpAbNPcSnuzuthxMmeSPw94UWrzKtwCcWaeduq4NPYZUeN
 BqH1m4PoYRurtCjufWw==
X-Proofpoint-GUID: iVDwoGM5Cn1sDgHX9_D-TwjOMX-8rVj_
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a0596ee cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=Iz78IysE6IyYlazwXiwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: iVDwoGM5Cn1sDgHX9_D-TwjOMX-8rVj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 09:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126986

The issues was found in 7-Zip 22.01. Some later versions are unaffected.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/7zip/7zip_26.01.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.01.bb b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
index a3e124518a..2729edb55d 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.01.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
@@ -69,3 +69,6 @@ RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so p7zip"
 RPROVIDES:${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2022-47111] = "fixed-version: The issue was found in 7-Zip 22.01. Some later versions are unaffected."
+CVE_STATUS[CVE-2022-47112] = "fixed-version: The issue was found in 7-Zip 22.01. Some later versions are unaffected."
-- 
2.34.1


