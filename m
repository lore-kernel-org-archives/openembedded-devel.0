Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16ADCD3C529
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:12 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12682.1765363450626706391
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=LGhQeuq6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24394d3a2e=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9hKig085934;
	Wed, 10 Dec 2025 10:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=B9rXewwsP6+Al4msyGECP02NgXw6+9HM7QrPQiBdPGQ=; b=
	LGhQeuq6VT7H0ggCl0poMxTNnYvIzinMg9Z3oIDjbKTd+g0CKcct3aIwQZ3x0Yk2
	y8xn3O9BJwtBswrcbRK4y/MW+IZOLU+i/uYHSKXv9AXfoBSNUQ+o1sOnhX7afwZ/
	1ZOir9EG4ajvWm03s4j05fD8UJOWbtopXKT8VWsSvzdBI22JjNBX4Q0aASdkQZAW
	iXGmHRbejkqYxp5rOGlCek7EE84jo37sX3DPP0rSCR+SNlscOfB7oRouQBszi+cQ
	XQCrr5f7SVdGXHrS6IYVTJyeEFRq42DhOJt1c0tAfn4jHekUJ9yRZws2PvKCEpqF
	9fivLtdKnbHqb+7WSCWZcw==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4axts7sx13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:44:08 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:44:08 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 11:44:08 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <brgl@bgdev.pl>, "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH v2 7/9] pointercal: Add HOMEPAGE variable
Date: Wed, 10 Dec 2025 11:43:23 +0100
Message-ID: <20251210104325.175100-8-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
References: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: uZub_EnopcH713JtsdKE7UdkTmPdPo0-
X-Proofpoint-GUID: uZub_EnopcH713JtsdKE7UdkTmPdPo0-
X-Authority-Analysis: v=2.4 cv=N9Ek1m9B c=1 sm=1 tr=0 ts=69394ef8 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=n9SCklZpAAAA:8
 a=EfmfeaBIqfpP1_J2BbgA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NiBTYWx0ZWRfX5azRGW4tiZvx
 a9EJQVSGeXBuCZdUN5ldgJONDkqQOfdyjwFlMkaB+Ccyq2r87Z6YkkZ3hJi3Z+juqoMAN2nxK1D
 zOWrcKf3WRiiC9/t/INDd4P7+aDB3+vS88Rvw8rqqfw5gTrVUryz9q/gZ28fygaysQYERHG7PeP
 RlUtfRye4osEZyOmwbhju73UCYEppCsDfoBAvO386QmY0Co1nsjE/ax+hTDGKH6/HRmh4/BhNez
 787HGbo6OJptyBDKvSny6VPIaHMkkqfDPCIGg/Qo+5JIW2YHzbTrd2jv4OEC8CCMsKo41o3Bdsf
 5nOmv0R8dsdFurJur4o7yVqHTgJd9QY+JYOHQ6r0kqMNqrRMoNuUo37odCeXh4QbU8m5OaWW5am
 PWxyQ99Z6JKAmP2zfO/kK3nlGh/1lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 10:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122500

Add HOMEPAGE variable to pointercal recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
index a270a23dde..a0d8b08490 100644
--- a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
+++ b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Touchscreen calibration data"
+HOMEPAGE = "https://www.yoctoproject.org/"
 SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4b5fcfc87fb615860d398b5e38685edf"
-- 
2.50.1


