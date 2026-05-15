Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED99ACD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 05:48:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28922.1778824099836605461
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 22:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dekVPyIQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9595c36ec5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4icCH1141741
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 05:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=uY/ccvrs7ZkNlfDOqoG76+Y93gBSuNTQxKlyyVD5X4k=; b=dekVPyIQ4sPM
	Q39+tf00EJ2fROXHCBmN4ydygHxo5lZY47fOm70UIVRnLjx6/44vrC4ArHlukGkL
	CzqMd8pqQVtCEpmmMsuBF58emV3xOLGli2yme6RuguDEi4/vmgcufvONCrZSgOuJ
	ZnJIgpl3lDvbRHSd7cQAlzN6X44zXUVEPqTeJUZG8x0dSHa5ZUfDojbkz6XS2MpJ
	M73o4t2ZNojce2cY/cjOI4H3Kerpj4GGBxZfVNDPxKqq4uLpV5bah9hYo404iibq
	kvxM1UM8wAR/1FT/Ek5Q9ga5lL3qHbS5gjrXt+H5vKeU+OWxFiHk1YwGvQuuNnZs
	SrFu22sIfw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m6b0g0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 05:48:18 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 14 May 2026 22:48:17 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 14 May 2026 22:48:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] 7zip: update CVE_STATUS for fixed-version
Date: Fri, 15 May 2026 13:48:14 +0800
Message-ID: <20260515054814.107161-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515054814.107161-1-hongxu.jia@windriver.com>
References: <20260515054814.107161-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA1NSBTYWx0ZWRfX9KkKjaojUs6w
 YFNWXl7vfVCcfmjuEWgd89ONL7dU2SrLmI0lWfMPOWjLp91WSvsf0vfU5fjLAqd9O0gBxr0TYA3
 phPuByzx2H36tCkpRwMRZahKBazNyDzK5wGU2hz0p+prU8vNT29sQ26oUfKJZMc6ZZEnToGPmwD
 PR7Mvb/11iukQTye+UOTDJSZvqoxCr+a5VQSCLYVS7G/QUUflfpb08F2jS3KtcSD40ZgYfQqHRb
 Swsob5RllsJoy4p+PA8J7NqKW9Z+tS2L3HiRV9wp0IlgEUIFay7//lDgwtfmRL5gVVB1sL4FOJR
 1b5bdG02yldI3cgJwv3U5lm27gGdA+dbvRDV/PW/od1SfCOhc8pHVa4eFtAxfx39cpYkOY1gHXp
 SlaAu9I1A2+FWSD4pZkaCkq5gXzupyA3eDsMJe8eTV6Vv2MskWbC+jbHoaEyQ072gdc9fDbLRM+
 rWN3jvsaQhOBlR6j29Q==
X-Proofpoint-GUID: LYi_c17sCYHpgxH01QVL4JNfuvW8ckWm
X-Proofpoint-ORIG-GUID: LYi_c17sCYHpgxH01QVL4JNfuvW8ckWm
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a06b3a2 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8 a=FP58Ms26AAAA:8 a=fZPMF-2OAAAA:8
 a=t7CeM3EgAAAA:8 a=-rZaKwcT2coRSLc01ZIA:9 a=O9lCZVmNj_uBxb2n18d4:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 05:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127000

These CVEs was fixed in current 7zip version

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/7zip/7zip_26.01.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.01.bb b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
index 61be89c7ba..3fc3037bcc 100644
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
+$ https://www.appsecure.security/vulnerability-database/CVE-2023-52169
+CVE_STATUS[CVE-2023-52169] = "fixed-version: Relates to the NtfsHandler.cpp NTFS handler in 7-Zip, affecting versions prior to 24.01."
-- 
2.34.1


