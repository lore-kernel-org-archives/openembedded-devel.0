Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B1CCD4851
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 05:48:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28921.1778824097741650336
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 22:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UtYQDsfN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9595c36ec5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F40svS1465884
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 22:48:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=tUdyUJneN/AHdVysRom5
	kpTHgjClOzOkgJ0/MG+vU0c=; b=UtYQDsfNixSDD6zzNIfUXOLO2Xt97/QvQFPP
	LW/xLaH9BZ/U/0NLsQRrjTdOBLpqYWhFQmi/fwxXjbqW6a5/sNL5jAvxtHfRuhJg
	mzoxubHLLK9rJKs5TX1sQcWnCn3+s77ECYQLBv9jOj4SyjlzMrawKzSmcETbL2vv
	9vdLdxw4aHNXCkx2GWF+58lvwUflWMCB/2WHbDYWAgeGX39uwK6kWbFZuoElV/hZ
	wdGOP9irC679VCVCa+C0G1uZCyYdJcj9yHWtIK5cHkTDrfu1Q0Oo+ZzD7AOCcU64
	RGTIxNawSNUE+gig8l4bnJ4U9sTYx4IeTUpMDI6Jr7tvG5+pdQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m67rfuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 22:48:17 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 14 May 2026 22:48:16 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 14 May 2026 22:48:15 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] 7zip: do not provide p7zip
Date: Fri, 15 May 2026 13:48:13 +0800
Message-ID: <20260515054814.107161-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: iEGJTqpHvfmHd7NKcmNPtN8CtEACGX-n
X-Proofpoint-ORIG-GUID: iEGJTqpHvfmHd7NKcmNPtN8CtEACGX-n
X-Authority-Analysis: v=2.4 cv=LMRWhpW9 c=1 sm=1 tr=0 ts=6a06b3a1 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=8PZdtX0_bW_Oo8Ii0J0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA1NSBTYWx0ZWRfX33fX1A+rHUK9
 XPYYgbMVU4dXwXKMk5PQVi31wFYHQy6hdNkDcs5hfaxrJxnw4uGrzcKNSuKHKQmwe2N9Sj+JDoK
 nzNFajtzqJTh075thK+/BuCDKVYUjT1RnJYiEgXjojFL9hACUdiFfRVtWVvueUz2mwYJ77mJkjY
 E7G+7+n0MANXpFaU4vL/dLWOAwVJyBMZ2WEIlRJg995xKIGMpkyEW2Otgy9K12y2JPtr4mkrGO7
 42yH7jbQuBN/V328xY1klN9RLClACP9DkEYBwABXGqawoeOmA52Vmoc0tlnMc+/vyBgU309MFhB
 jxlYsN6+xQbtwJMAsF5F6C7REgBC1cc5sxCIgC9JyMxLe5/0NlCVIrfDfacbWJvgQwySbgIPF3p
 zTUGDrUp2K/fBC7EOwUAisvv4Og2Vb70J+ryGpNfEboMl6NeRVK/LHdejVKtAnUvF/QZqVrZPiJ
 vyNYyKmxog3ptqgGGlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 05:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126999

We have replaced p7zip more than 2 years, do not make 7zip provide
p7zip any more, then CVE scan on p7zip would be skipped

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/7zip/7zip_26.01.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.01.bb b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
index a3e124518a..61be89c7ba 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.01.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
@@ -64,8 +64,7 @@ do_install() {
 	install -m 0644 ${S}/DOC/readme.txt ${D}${includedir}/${BPN}/DOC
 }
 
-PROVIDES += "p7zip"
-RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so p7zip"
+RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so"
 RPROVIDES:${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


