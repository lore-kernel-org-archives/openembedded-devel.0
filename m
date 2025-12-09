Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A559FD3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:27:12 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7615.1765286829578251882
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=cNOdUtRx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B949YH22010753
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=1l6iI
	V3MI8uT03H99Wa8lyGPuLHlSOejtE+wLqf5wl4=; b=cNOdUtRxUcXlouVZsDj1a
	8t4pbtL56oD6SRiFTXUykDInQtXOJ1QRNzXquAfU2RXCiGFrDg8J1zxwq/A6WaNU
	Zsm5axuYhVTJbvqcmUMCJQYJzPibeCIQX+JXoXzG9i7hicgp4Q+U6bE8sfstlVK6
	l2Uatnm6MY74rlKdJyeDCBTs3gmGcISakPcN3j/qCnxO7kDeRDgGFQujdNfP711o
	XsKrZ8h8u3O3m4drD5I4yxwmxc7CearGiAa37k0yl4f+gdbPX2JEYh6JgszLL/Q2
	sDZnM7ENjCQlWgu6oUZqa9fp7cOIomEysPThF0ISfIsS9CMIokgsV6ykFP6yWQs9
	g==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6rdtaqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:27:07 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:27:07 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:27:07 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-multimedia][PATCH 0/1] Add HOMEPAGE variable to libcamera recipe.
Date: Tue, 9 Dec 2025 14:26:55 +0100
Message-ID: <20251209132656.405509-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=OamVzxTY c=1 sm=1 tr=0 ts=693823ab cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=by9tPA3xMxsRTaXn0gsA:9
X-Proofpoint-GUID: ohjeo8s5-Zvo6PrlVK_sizFlzIf1iSL3
X-Proofpoint-ORIG-GUID: ohjeo8s5-Zvo6PrlVK_sizFlzIf1iSL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5OCBTYWx0ZWRfXwjheR9nemhfX
 rN7x4DA3ZZ9xdSr1r21M86gVLN+6qBideWfb6hsnIMTeX075sIBN04BuWelHiLJ9q7BH/ia5Svf
 4jK5tKq9b05Z8O1aWkKb+1SPu0FLAFr+4PKtgQkG55eHoqjpHKgikULFlcFXuxo5D5K5mkJ8d/E
 Trbf/XVraDA/EJ7xOb2nhYWVj6MAGiRA/4F+plOjDjaT73QOujVsYRiY3pdGqiLlI426U2sia7N
 09fJmXfI5LSTPSFAn+qoh3ChKMPdQzibdYOcANNyi8ySUoY/MJQRxbvNG3GE1masD7b5TZzt135
 QAp0QQ/LBvPi3vQInuAsNXtVaYtiqdI8r0vWD1KPLcLPzAuK6Pd2IdSYzie6kxG2bySgYozQKLP
 Rn/PCMdEaWHpLfuSiOEp8Qs0CCgfWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122456


Weisser, Pascal (1):
  libcamera: Add HOMEPAGE variable

 meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
2.50.1


