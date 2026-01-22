Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62450D3EE69
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 13:53:29 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37503.1769089998972410236
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 05:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=THWYi5c+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=2482ce05c7=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M2SioA4190164
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 13:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=WySGx
	DhJ35zpTEGkzQpgWJKlbLM/zL5H51TFDoxlrJg=; b=THWYi5c+VS+3g75+yIIJw
	7xP3rLepC0etSpcXSIPos1FWdbEA71sVuIbmRrnZbqLWwlyCUvHyLgRcayAXIMko
	cwVN/ujMlBICnlSQIbhWlrKSMt5FEdmQ4OubkzR5tnV9bljAglee1rpdenPPA9zB
	dBqQRYTyVLsCFTdCmh8ZzeGQAkWPgCeCZ54sBtB9JgJe1AwEyHJgM6qA9xPdMSUz
	xXNVZ6HxqcPA1tT4zt8vs3uL8r77SjjvbTJ36M/RFXnxUWwUCLYKraRi9CW/kWsk
	0jfDjAYSb9isbrISzAsPOEKrlErGscv5d+Prm9QJUdSNSCRl9aVWNG407fN23bla
	Q==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4bu1ngbh6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 13:53:16 +0000 (GMT)
Received: from TUT-EX02-PV.KSTG.corp (10.0.10.191) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 22 Jan
 2026 14:53:16 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.191) with Microsoft SMTP Server id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 14:53:15 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH] minicoredumper: Add HOMEPAGE variable
Date: Thu, 22 Jan 2026 14:53:08 +0100
Message-ID: <20260122135308.245551-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XxzuFvgAwQ3PQ87lRasPYAlaVL6DwvRM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwNSBTYWx0ZWRfX8cEvrWdxPh6k
 FvPdr+7Ku+S4mTRDfXGubHSXwFL1K5Nuq4ktgMjnSUrJSNQH/IgAovCgUy/hMU8KQaCe5u7EOrt
 uG5aD3Lp85YoAQ9tCAPpnES+Y5VzhJqsSVlbvaqpAnQHYWXUujTOxBqnqu04tyITHm9TIRdX2uU
 /CpvtoAM1OZ6qJSnu9Z4wdDo9lSRzSpfL/b7rThNNNn488Ai7NpcV19Fw2cZ0Zx0T3EoQmJKDqs
 fVTbnuZxqERTvlDhxthhllULiSgQWrfgk/StmsqpGuzPF8c4nP8ORmhmLno3LBVXw/O5DzPRggM
 ELu7mZPg5Gc4reQG7RKcIveRjxSe2JqKcRNDWqg8Fimy8wmENa6ycX5bPWsjIXgnm31MNsTiwRF
 0w9IOSb+EKfb/UWKvVuzudSUg+HzqvreByX/B+6GiK2MCeKB4ExJuJlc57+lSq5ZVMSaO2CV4MT
 txGhYH1NxjeM7fQ+/nA==
X-Proofpoint-GUID: XxzuFvgAwQ3PQ87lRasPYAlaVL6DwvRM
X-Authority-Analysis: v=2.4 cv=E4jAZKdl c=1 sm=1 tr=0 ts=69722bcc cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=hcxzT4NMAAAA:8 a=n9SCklZpAAAA:8
 a=btjoIo67w7BvahY7EM0A:9 a=qTCd_7tRWm03b--9HkOK:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 13:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123737

Add HOMEPAGE variable to minicoredumper recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
index f68984b072..44d85550ee 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
@@ -1,5 +1,6 @@
 SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
 to allow minimal and customized crash dumps"
+HOMEPAGE = "https://www.linutronix.de/minicoredumper/"
 LICENSE = " LGPL-2.1-only & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=71827c617ec7b45a0dd23658347cc1e9 \
                     file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
-- 
2.50.1


