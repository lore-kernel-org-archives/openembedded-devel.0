Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32789D2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:22 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12686.1765363454763127942
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:44:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=Yp5n7kN6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=24394d3a2e=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9hHJE1039780;
	Wed, 10 Dec 2025 10:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=yJBKWM4JZdlW/LDG4bE0GoiAqFkh9riXauKs8Uyw3I8=; b=
	Yp5n7kN6ITZMT/mgtM6SYDfq3uSqXza2X3ygliFH9fasnQc58CLNMRrxsFo4P1iM
	veKzl4qC5hnoQhZbQ064KO/oItfBDIPTw/6t2Z8SyRy2rb71qCAJUeio6eKEw6Ke
	fMwkCnO2tqWgAGc2TuFDrNVQ6ITPIlD6AiOLBUwChGQ6GIqX71mZYXFZAZspzz+w
	flIbbi0mGW42dZGtgdXk/xG/onXV1kQCrpDFGr5Es162lViuhFwX9/KKfKaYnbDv
	fSjxcWLtHldaJFPpI6g8gE6yTB96x5z0YtVaQozcZA6aIarWndJ/Qi999VzVAW2V
	3cITp6fYzT7JcJ/NC4Xwrg==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4axrnwacjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:44:11 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:44:10 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 11:44:10 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <brgl@bgdev.pl>, "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH v2 9/9] rwmem: Add HOMEPAGE variable
Date: Wed, 10 Dec 2025 11:43:25 +0100
Message-ID: <20251210104325.175100-10-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
References: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=NejrFmD4 c=1 sm=1 tr=0 ts=69394efb cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=n9SCklZpAAAA:8
 a=m4VOkzDYT4OWU75DWFkA:9 a=zZCYzV9kfG8A:10 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NiBTYWx0ZWRfX/lGZC/Uf2DPw
 c+sN33T5SLkeZLxR1PFeM2Uxla4SXy81Hta6E1andOPo/lg6XTXSDQT21taJ01Anz+llLS729q6
 Drxt1f7EHcn1AgZXJI7D1M5HtYU5/4TKvMQcVKexkSBfMA3sjNaKSrxH8n33Q/xUNDN7rCsoteG
 uSHYwnGwazIWkMR58KC+EjRZ1pMOEjvT+hYZ3o1pGkLBbHFgdwW+YQFeOr+BL7SIno5mo92i2Z2
 dfoCijdeEH3KhUnjnLDr3ORqm4G/Uj/hUhm7PjoXWRQBzWM/6C2vlkP/DJ0Qsv4LTTq9F04HZ42
 S58/U7EihHLc0rfNyITx7MnsNn3VpwlfobNRKXHVad0kXFjU49FaUyO/DcwaMl2qYiclv0VQF/d
 vjj5RJx0nvwd0wJO10mhxXxBmryXVA==
X-Proofpoint-ORIG-GUID: GxxXp9TxnbH-G4GNuzNuC8G0Nzeumm9y
X-Proofpoint-GUID: GxxXp9TxnbH-G4GNuzNuC8G0Nzeumm9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 10:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122504

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


