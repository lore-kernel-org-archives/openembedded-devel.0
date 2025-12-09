Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B161D3B7F3
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:10:12 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7344.1765285808111256899
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=Nux82be1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B93e2pY1960057
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=yJBKWM4JZdlW/LDG4bE0GoiAqFkh9riXauKs8Uyw3I8=; b=
	Nux82be1b4Cjnp/lLBqStPbaufKVpAky5J0sPf/z9mX4pBkEHHBTZMapGHnMAyGi
	N6KT9fN8UE4YzDTiSAcala2JwNmJ4GDXC37lAvngfLaF4H1lfPBAhwymVesNuNMN
	GKmLafamLaVs94Q7EWAqcwOZSoV71uOndceyI0htKcoecB1N5Vod6o3/TBVurHHA
	y7v4UFy2wQUx4PxOApvZWpEkZLC0h3carCYVq81CWpnSQqQaHU0tmbOLZJt3SDOm
	AHwkDJDMK/Nup1PmkjU1co308gXEXI3me6OtjL3+q9rae1Wtdz4B5aXRjfvfjxeN
	i3fkcEdrdFb2iuwMSkOAEQ==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6rdt8ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:06 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:10:06 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:10:05 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 9/9] rwmem: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:09:13 +0100
Message-ID: <20251209130913.388053-10-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
References: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=OamVzxTY c=1 sm=1 tr=0 ts=69381fae cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=n9SCklZpAAAA:8
 a=m4VOkzDYT4OWU75DWFkA:9 a=zZCYzV9kfG8A:10 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-GUID: Q4WnR37lu8_u3cS9lSXmhEJyi2mJbtd6
X-Proofpoint-ORIG-GUID: Q4WnR37lu8_u3cS9lSXmhEJyi2mJbtd6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NCBTYWx0ZWRfX5F/MQ1RVI/oF
 NxRv01CjV8gOHhHpYBQJF4si0WARJhpKF6HHe4nacYyP15sRtQIOXkoVfr5G+Oq+c1UFpqXgJcP
 O6yiZk+F6sJn+3irPX9YHLbtXunMffbtXjM4MgLK6NDeVZ9zVPgyzQuPLKLzrvsk4FIsOBrsWmM
 828KphyFezWZAWIc6FkUVO4cJhQIxslUlFJ8fRLH7F0bmWc8m/x5Sqgk9UXcGDbvpCXjHuC3HRf
 NN/ByZQMmwcIoAt3Z4G72cmwwXU5NCNai5mzllyJ/5wb3XhRKVBp9mulfWM7KQLWnqlFO1DEtn/
 bL0Uw/NINhqGx2ozu/74WMjFOD3yt8bwTLUdgHcqZjYKI3ks5KjWjLPWhIAEXdHF7jSENXC6qA0
 2TbVCwUWkGrbD5mQc8NC+PfEJfRnZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122455

Add HOMEPAGE variable to rwmem recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
index a32c9403c8..078be849a3 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -7,6 +7,7 @@ Using /dev/mem as the memory mapped file makes rwmem access memory and \
 can thus be used to access devices which have memory mapped registers. \
 \
 In i2c mode rwmem accesses an i2c peripheral by sending i2c messages to it."
+HOMEPAGE = "https://github.com/tomba/rwmem"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.50.1


