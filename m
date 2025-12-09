Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F8BD3B7F8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:10:12 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7339.1765285800617425221
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:10:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=bdQ9Zt0e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B946uHN2006884
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=3UyUpQzv/jvxVoX5oDm2KfgREZ2SYvX/kglbSDtMUhQ=; b=
	bdQ9Zt0e6y+Y8K6wgS+Arxokt9Swz/Bq0m5Sx5Y2KGALMHLoWGflKyIrHK6p9Qo6
	KAVL/uHADfXM5JGYOdxsl60jnMCf9ra68Q6/RccSl1p568Brc0aFJQ75WbCztpM8
	Cg10vFmWuwObmmhGwXiBwVcmw90SGMouMiVQBEk9sBGaEJYayw8ErzpPuM8yWle8
	F/5zbrZzciLos3NsVSHVwBK2ZsZVV1vm2OrCWQhwPbcX6+j3QVTkuHv/FSC+RZdp
	fmX4eCfE2MrL3H5hkQZ/J7n2PNsz5Qa41JAng5R0cwV8jnWuI9N3qHM3ACbZu5T8
	ZBGtmRpXOVDPhEwTs4+Gig==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6rdt8u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:09:58 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:09:58 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:09:57 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 4/9] polkit-group-rule.inc: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:09:08 +0100
Message-ID: <20251209130913.388053-5-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
References: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=OamVzxTY c=1 sm=1 tr=0 ts=69381fa6 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=n9SCklZpAAAA:8
 a=jJ2y_W-6InVZAyMRdHsA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-GUID: Z6ua14Ex_63OUWuaQ_eIit6Ig_56TQPu
X-Proofpoint-ORIG-GUID: Z6ua14Ex_63OUWuaQ_eIit6Ig_56TQPu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NCBTYWx0ZWRfX2MtLg7GMGXhF
 q2F5cCBhYsneY/PAH4F2tj26yrp8rAZUqrjR0N6HQhwoDOBbCjR+O7LqgphJwTBzSmQyXKvfQq4
 of2rDPzOsECox2IiVrNHdZ0dYCw9vUbpRJ52E2nkEQNw9gUviQQRUAm4/GcEKJjaby6tBUaxY6C
 xs4H5o9dHgsCz6YYAsx17olfIqJKL/gFs7A6JkScPq1NIhRXN9jwPf8fWhKI0pWCP8O+H3I5g7g
 R8A2QA1/83CiNUXV2aaduWrYJVeKKFyIRrl7MuHjnuRIpSSVhJY26zud7SsyZox/oBYG6099xn7
 sieJPGe9krjsxKuyS8SNIHgYkUEGTDoP+EzP/RfR35UBkNEWWP7u8oOGbVQ+aW6LvC8xfCz5hS9
 /8ht7dghAVCDkpaYYACrCmioXfcUKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122450

Add HOMEPAGE variable to polkit-group-rule-* recipes.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
index b1e16a924c..e8bbf48c43 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
@@ -1,3 +1,5 @@
+HOMEPAGE = "https://www.yoctoproject.org/"
+
 # polkit must prepare polkitd group
 DEPENDS += "polkit"
 
-- 
2.50.1


