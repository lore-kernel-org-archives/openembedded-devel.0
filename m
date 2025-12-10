Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D201D3B9A9
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:12 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12680.1765363447812679929
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=lMvm2mrf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24394d3a2e=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9hMom085938;
	Wed, 10 Dec 2025 10:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=3UyUpQzv/jvxVoX5oDm2KfgREZ2SYvX/kglbSDtMUhQ=; b=
	lMvm2mrfq5C+PbtVQDL+E77ANvjILmvDOwjm4ebmYrzjiB85cklJ3FxQ6VXLWiPG
	xuNqFMMFYqppdOTLtMv8KS7x20L3jf3eRtCtY/Anc3jvnU0ZDhrhge3i/8O/adEE
	wDMPRV+SYRIZBVwLgDZQ0bHkkd1N65s81mFSPrcl/V4tGbIoPe2LGTo4W0Ast2E/
	UUBCI49324Qj8DOU+0XaKiMYzxln069e7a/KpA+TsL0+QM8nQz6vHszGv0kMkv/S
	0iCKl5QFpJPL4RO566NqwsigaTKJEY37M1aLIF6LJ9Lnt+8rfprgh7yPgCvl7MEj
	0yHeUbKbfr+tKL8+s/bnvQ==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4axts7sx0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:44:05 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:44:05 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 11:44:05 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <brgl@bgdev.pl>, "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH v2 4/9] polkit-group-rule.inc: Add HOMEPAGE variable
Date: Wed, 10 Dec 2025 11:43:20 +0100
Message-ID: <20251210104325.175100-5-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
References: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: u80pvAnXvNEPq33PAXoKX1r6jct1N_kc
X-Proofpoint-GUID: u80pvAnXvNEPq33PAXoKX1r6jct1N_kc
X-Authority-Analysis: v=2.4 cv=N9Ek1m9B c=1 sm=1 tr=0 ts=69394ef5 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=n9SCklZpAAAA:8
 a=jJ2y_W-6InVZAyMRdHsA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NiBTYWx0ZWRfX2oa46gHQ3JVZ
 J9jeLJK9ilbpXF0Ylz7Zp/Q9Sy3OquLrwoLHjjiLy36eIn/GjaaqDU+HvVcF3MkFOj5t7Lcizhh
 w/3ADR4FO1kD85g+4R9jRn+gMc94ZOLbPgRlnQzKwVWNzY7f+SvvXiHql+8ZKVri4WF3WJ9aYWG
 kMBeu2WuBye5HhSp5CSTjRro7rEd09yur4BfKWh3ZZk1LNnBLxlY8DGdNv5z/wnfthTSRBVilEK
 P0r8heOMA/Yzik+6tnd/T6lj7SKIFnxF92cufIgbAAtoqiaAJEhhBGPhC6jYMipnhQpcFiSxgo5
 vVxBQH9SzD0rwHlwRTxxE4OtaXSjCWPeNdQw4v0+gmaUGUBwWBiQ25ZBrjuLhT7d2X4Vey2U4hV
 xQNYBCxsD1yI8nKhvAtIk/NmQ0yjnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 10:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122498

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


