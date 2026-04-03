Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1953DE8536A
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 13:12:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11383.1775221937701984183
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 06:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WGl0dIUj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85536a21e9=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633C4lRO3003596
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Apr 2026 06:12:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=j3GivxLI//UvXRKOGV+c
	dz3Hr0YBVW5dvlaL9EjswNE=; b=WGl0dIUjsH4nBsgRw5BQCK/ln8pge3Huh6Kg
	asdsSBwkTfQIldKpvuSb0co1lIcvVj8NqbV2jocux+XxCdFgmHEhsl5RLLBJbsuZ
	6rTAYlmMkovOB2GPbBpObA21ZYzWN+SGp6nzJVLI0Qn8G45fRf4B52uoikOl8X0j
	R4vPDU2rmJXNrLrsRvTVgRHpy7bsMV5az0QELdIVDjDoi/NnJjVfSnsWsB56dK9b
	ao1ZK1Smzfd4tIp8k9k44FDFeYYl+PauYwdS7HFgzBWz4iT5aG1oCYIQAFhT6ML9
	c36XEhDUtgUwQyQweJJcgooluZLsKmXg6G5MeOTuEK9XyDyUbw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6egc1126-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 06:12:17 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 3 Apr 2026 06:12:16 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 3 Apr 2026 06:12:15 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-icu: enable building -native and nativesdk- variants
Date: Fri, 3 Apr 2026 21:12:15 +0800
Message-ID: <20260403131215.730747-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDExNyBTYWx0ZWRfX0SucyzJDaZ8Z
 k7TaFvbfAmBo7u8Hx5UAC63CBuh+RAfWwmYCGgHvkq5XU/fSB0K6p9X1ljI0Y6scJ+grzVX8iJV
 XvHZIjbMkE4n82og2Kets+eGMcgRsUsUxhan1g0iGSWzExKQEjjbaw7FosHNBGTYOXEFjwqdG65
 +l6/8tRUW+KA0o7PEKdcmwUd3JXXPs5mT5NMmkNZ66yjRNKVG547JuhHm/sYw4s1RIAn6NvhGEQ
 gFx5240n0LIuGFDv32NoZ1tQhIbfB+VOFezXL4nCxcqvegKjqDtYCUywcvCZvRKXiF5K6D5Ajfe
 X1QgpRl2YsNBlUoWZHaQNm8BKXSZST4A51SaKRJW94NAH5R6SR5AhrjcvcizEQTbpDqWITjKA6Q
 z7sD/2GdnLWyiuQQg6Rmh/4I1ZxQs0AFrsUF6Qu0+nGa2mCG5jHQDoa4XIvV87GU0Q0mwX3OnBj
 8B9fwzAqoZTAYXiFCOg==
X-Proofpoint-ORIG-GUID: J5LzIpyvnHbWANb2YaMSKsuI1YKtlY5H
X-Proofpoint-GUID: J5LzIpyvnHbWANb2YaMSKsuI1YKtlY5H
X-Authority-Analysis: v=2.4 cv=fvrRpV4f c=1 sm=1 tr=0 ts=69cfbcb1 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=nMlaJpEpjzBjw_TlLpgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 13:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125986

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-icu_2.16.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb b/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
index bfc37c2763..ca7cca4457 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
@@ -18,3 +18,5 @@ inherit pkgconfig pypi python_setuptools_build_meta
 
 # it's lowercase pyicu instead of ${PYPI_PACKAGE} in this version
 S = "${UNPACKDIR}/pyicu-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


