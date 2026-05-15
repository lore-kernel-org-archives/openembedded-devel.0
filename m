Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16381CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 05:53:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28840.1778824417297636146
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 22:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bogyRl3O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9595c36ec5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F2mLvB1312165
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 22:53:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lnJQ1rDVU5024LZ1DK09f/R5w477kn/hEj3JPw/sW4c=; b=bogyRl3OX9Oq
	iP+98LVVnst8n1S1g0jnlyELw2eLc7CQ4LsYMzaCioAaLCB3gaaGdTKIl9LdnuIH
	QpoPTiiM6obxVDSK4qBVdMFOHCDFdwdzrHK2C2vtoEeRFAAioJ9lX3oD0mqXTPZT
	PcY8UXr8ksDu1BlvMdqIrg3gMmT0RsIMUaPG5vSbcQVZomupRhw6O3/eep5T96ZZ
	h1GnkSFRu2TJOgQh57RIIs/ddRM7MiKEdioFrifxdAJEfmtC1ukWoS6YVP9vkp7x
	XJEJnuxwgqdDUb2QtJYkkQCxIUGTWlQNgsdaOYon97D9V0EkAO4Jra92UzBCNveg
	5wMRCI094A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m688g1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 22:53:36 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 14 May 2026 22:53:36 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 14 May 2026 22:53:35 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] 7zip: update CVE_STATUS for fixed-version
Date: Fri, 15 May 2026 13:53:34 +0800
Message-ID: <20260515055334.466550-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <meta-oe/recipes-extended/7zip/7zip_26.01.bb>
References: <meta-oe/recipes-extended/7zip/7zip_26.01.bb>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NuSgUWVIPASuYwMH-UNhmUVYU1Y4n8e_
X-Authority-Analysis: v=2.4 cv=GoZyPE1C c=1 sm=1 tr=0 ts=6a06b4e0 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8 a=FP58Ms26AAAA:8 a=fZPMF-2OAAAA:8
 a=t7CeM3EgAAAA:8 a=-rZaKwcT2coRSLc01ZIA:9 a=O9lCZVmNj_uBxb2n18d4:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NuSgUWVIPASuYwMH-UNhmUVYU1Y4n8e_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA1NSBTYWx0ZWRfXwW2WT8wUzkej
 xHsklOXNnoHlD4ap8HVz7eJq1M085NZ7OkkF4Kf0pME/7TSNMwvHv7jiMelDdS1cRUoj+bD2kmz
 p5tCRF2K/EMXC0PV0piacHsXG5cyVSriSZlLNdTlRKEjrq/OZQfM7M9r77Dr2nPobmo0nkGtH9q
 WUgSnlMKR+ocGpwggGMvBwC+25/gfgaXs3lixO2xHAtQet+dSm93Smy5ekA87K0phl6rLbdpvvv
 5Mnc0YnVlcc6ahIAf58yywbl3gdpHCoJgFjP8FJ1un6qvHDvVc7dWejeJ7s61v/OxWKfZDdOzTm
 CqWJEfb/g6rS36JuHQKCsOuQLqHr6UBmtdy9gACaR/tDq0BkqerpIY1iK3ihItPrPaqs+bBBGVL
 dD2eSiihNs1h7OE1Fd0ldZNXLHPrIFHNjciXpVM8f2ePPMtdS6amhfphqP9OuVD8r5oP9HIMNXY
 oACj1UPtmANjHLAXExw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 05:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127001

These CVEs was fixed in current 7zip version

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/7zip/7zip_26.01.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.01.bb b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
index 61be89c7ba..6da5b08347 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.01.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
@@ -68,3 +68,15 @@ RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so"
 RPROVIDES:${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2022-47111
+CVE_STATUS[CVE-2022-47111] = "fixed-version: The issue was found in 7-Zip 22.01. Some later versions are unaffected."
+# https://nvd.nist.gov/vuln/detail/CVE-2022-47112
+CVE_STATUS[CVE-2022-47112] = "fixed-version: The issue was found in 7-Zip 22.01. Some later versions are unaffected."
+# https://sourceforge.net/p/sevenzip/patches/417/
+# https://www.appsecure.security/vulnerability-database/cve-2023-40481
+CVE_STATUS[CVE-2023-40481] = "fixed-version: That bug was fixed in v23.00."
+# https://www.appsecure.security/vulnerability-database/CVE-2023-52168
+CVE_STATUS[CVE-2023-52168] = "fixed-version: A high-severity vulnerability identified in the NtfsHandler.cpp NTFS handler of 7-Zip prior to version 24.01."
+# https://www.appsecure.security/vulnerability-database/CVE-2023-52169
+CVE_STATUS[CVE-2023-52169] = "fixed-version: Relates to the NtfsHandler.cpp NTFS handler in 7-Zip, affecting versions prior to 24.01."
-- 
2.34.1


