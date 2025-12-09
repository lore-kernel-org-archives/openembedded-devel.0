Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EC6D3B7FC
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:10:12 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7340.1765285801635697043
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=aCL37+IS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B946uHO2006884
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=GIrQJDheWWKxlfewuJSxD551+62VvNeO4wEm/hpNQX4=; b=
	aCL37+ISq/VO/Iv5X5xZq3sFfWE6TcEiFYzsvBAL1rj6i9Rle2gbDGrWfExu1WnB
	jnBWzDcgKD5KjTlj0gxp4wij0+Xjpakp1Qou1P1Uh4HqC0QjxIlulHjFycKVYyJA
	uqq+ZhBJWbwpXuue97R+o79mIrTpjHIt05UBmm4H6mYTGeuAeJ59fdA3jUVyHdE6
	P/BhFfKHsDsyafMOc0v/u+mnM5v8Fi1R9Rt5LNMQITMogHk9/MstZtIfSfwJslxQ
	yR/zyQGF6gxeE2awlQsxUvm73i2iQef4eTfAwqqC9WknZhS3od2e/ju5g5Gs3g3j
	YDmY+ji9xXL7AbUIGQQvWg==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6rdt8u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:09:59 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:09:59 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:09:59 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 5/9] v4l-utils: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:09:09 +0100
Message-ID: <20251209130913.388053-6-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
References: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=OamVzxTY c=1 sm=1 tr=0 ts=69381fa7 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=xq3W2uTSAAAA:8 a=n9SCklZpAAAA:8
 a=gvYjutddmaRAU6QaVSgA:9 a=P5L7wpMTXyg1GfFA3Gwx:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-GUID: MuXgGRtVyOYQwSL0LZ4iLodS83iThY2t
X-Proofpoint-ORIG-GUID: MuXgGRtVyOYQwSL0LZ4iLodS83iThY2t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NCBTYWx0ZWRfX6wmiUzwMfyot
 S6Wp7zGgSZw8OcoldR2sf0gv67WfAkvgy2aDLYeo5osi7gG9dO1Qxk3ntbvsmyUc55LHCIHqKwO
 gIT0uSAueSRQ+dOKqzSkgSDzIKb49jKCG+SsEla2sTkEhxJxfQich7VYCFR8X1BIVkSXt5AYkAk
 6QWgb2O9oL0nhfZGJU9DfTC31vimzyIIg9YrvGnuPe03o7y2445msEjdl8pU+VT7S0nVrN0Ag0F
 5j6G292nj+bgZqmhdvY4mVRUtHxB8priKWePGUsqmx56CMd1IVie36DGrxPryoG2jrZP7rWKCLX
 +RA3s8dEih1hH8pwZI/cTY7uV8P7SREObClj5RUgLH2RPO8+X75XKxdT0ik1qwvB/3byA2918a+
 Q5nGWHvcTM/2Z1QnQf2SUMAJKWFG+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122451

Add HOMEPAGE variable to v4l-utils recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
index a719bff02e..14b8d12c45 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "v4l2 and IR applications"
+HOMEPAGE = "https://git.linuxtv.org/v4l-utils.git"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
                     file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
-- 
2.50.1


