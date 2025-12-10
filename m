Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0731FD2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:12 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12897.1765363447732237145
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=Zl14jC1L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=24394d3a2e=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9ha7b1040171;
	Wed, 10 Dec 2025 10:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=nUxdmYe5Y91ilQfIS4w7x2xc3ZuQHljfMnecnLfzNwY=; b=
	Zl14jC1L77rTFMeMA6FWxJTW7N3CiT2xby/OpZLeJvhIKj/cEpe53uX5HZhmxZ9K
	FEcXev7XmwsZ4Nh+bRmtP9Hh7tQKU4JdYuBVq7DxV9Ak+Q2lBN5KLmxlC/g5+BhF
	bBlhI5bktxjNb/DwztI6QDwOD4AaebK/U3SjqtdhOWFQUi/IFFUFTooUN5fABcjC
	n7DXW7h+chi1FZf1lR+9+ACtGOoTEjljdomDzJhTVGUygIPVSP9MIBmYXlA5T5i6
	ZfiTD8yCtGF1c3ghUAr/7er3RFWg8fTyy547U0XsxmKOAKydOIiJtH1lvdg8EYDN
	kQNxgUKLaWYFZrOCboVlog==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4axrnwacht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:44:04 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:44:03 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 11:44:03 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <brgl@bgdev.pl>, "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH v2 2/9] trace-cmd: Add HOMEPAGE variable
Date: Wed, 10 Dec 2025 11:43:18 +0100
Message-ID: <20251210104325.175100-3-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
References: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=NejrFmD4 c=1 sm=1 tr=0 ts=69394ef4 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=n9SCklZpAAAA:8
 a=TefjB8TjJWhxr7rzY2cA:9 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NiBTYWx0ZWRfX3vg5Ma69lwhs
 bKNmNyt567OHe5y0gzCsCbWBbidhMzPsCJGLerbZdpi6D44Do7ZP7lnlGFnteZtIIkzdCTGs2Ch
 GWTkZ5ktqxPRk+h/yK5w9lvcggrRLq5R+5D6RcSmdDia4wM4ZNSUtu0AnL0w4YVIb6ZVxMNdHOH
 ju62oL9NfcLIdkLKBmcVtY+KeiTwYuhgsKPTrZ4gyCwdQZGGIsxh1l3u0Natna/oI7IKeGzMMBL
 +xIfhSP2KHv71HDAmFZ08OLWCnnkIOiBgijnYfcLKP2DCdsqISIrTHaBai4hwsSiYkoRSOambPF
 Ep+nVc/AVXroAWv5rBDmSu5cFI5h6bRQGdUGrTQuym7cRku0M1PbfvAPwgC/5NjS8C7biDzjpyF
 AIQa+FKK43UGzktSEN0mS2l6T8GwQA==
X-Proofpoint-ORIG-GUID: 2c2I3EB6BiV30hjN72CccprOTLhWsnw4
X-Proofpoint-GUID: 2c2I3EB6BiV30hjN72CccprOTLhWsnw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 10:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122499

Add HOMEPAGE variable to trace-cmd recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index 38922126c5..6686f1ccd9 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -1,4 +1,5 @@
 SUMMARY = "User-space front-end command-line tool for ftrace"
+HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git"
 
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
-- 
2.50.1


