Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A62ED3B9BE
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:12 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12684.1765363451315590752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=dD5cgRE3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=24394d3a2e=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9hS2Y1040037;
	Wed, 10 Dec 2025 10:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=puqiAd7gPYLkiwme/k6HZ9FOzm7E7iSUL0J7rKlbsTE=; b=
	dD5cgRE3E7AvM57bhna0xyKhcKWTG+4Kqw+zKjkPfPkYkt7XfuXC6cw3n7m2NxCk
	prY7OcF0wBfnY4zvq/1VeXSQr/Wf81DeMGMG+NGh07PAVZr/foMF2Km6Baw4TPpa
	JUxHWtYzCjS4ctkN7lQHn8rCH2fQbU5Yha5IzvrS2wYTbZ8LRPTaonTVx3q3MvYU
	HS7U6/uxox0uHRFbCJ4BGB5DWd+NwqHRDet2Lc507ZwHbvPzZJl0R+L6htjNk087
	E/EATOA1OLt336Q3UnvILmjLer0XVPJzfCVZT0wKM11Pm/kbQ3j1G6wYRhMFUQte
	WrKnAxrFl3gVYYLzRv3mdQ==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4axrnwacj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:44:07 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:44:07 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 11:44:07 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <brgl@bgdev.pl>, "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH v2 6/9] vboxguestdrivers: Add HOMEPAGE variable
Date: Wed, 10 Dec 2025 11:43:22 +0100
Message-ID: <20251210104325.175100-7-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
References: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=NejrFmD4 c=1 sm=1 tr=0 ts=69394ef7 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=p2QsaepqAAAA:8 a=n9SCklZpAAAA:8
 a=g7CHXTISLbrKoUue37IA:9 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NiBTYWx0ZWRfXzRxL1Q6lJJhP
 1xaq3zw3NOfvAipJQ1XaJ8tmqEn/IFXUV+/YPz1r1/BFeA3G+VTusnS81Bh+pjzGjFH33SCG53+
 UkP3MD9rf9iDr1+RJS+MYZehHEVHxC00Z3bkjjJTX+AM61lYwRzXUX5hlDw48U7x8+5oBfRZVuw
 2Jg+oYyBRep4hZabE5DF1tEs6xPctsfRC2x7oocWS60sTVGWwY8xSHg+H1S0YRixJG6yZp/SXjv
 3oT5jFH6un4UvCQebrJSbCj/6t5Xz+bDOoJatSeqXZeakD4oikbmQVOTLXOzwtdCpfkf9U/aq7G
 ieXYTLDpeh6TgkOkimuFyL6qLQCGSAeF8/KWRuJSwRg/aDDTVnApkqz9yO6Si1Y4K9fXZL1IM+e
 pxcMmxUYDV9zYSnt5xJvY2ltGDGPqA==
X-Proofpoint-ORIG-GUID: oxkz3PSAHZBlw6IbPVcz-iwgTSdAEUBg
X-Proofpoint-GUID: oxkz3PSAHZBlw6IbPVcz-iwgTSdAEUBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 10:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122502

Add HOMEPAGE variable to vboxguestdrivers recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 .../recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb
index 9b01964334..34b5e9ed04 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "VirtualBox Linux Guest Drivers"
+HOMEPAGE = "https://www.virtualbox.org/"
 SECTION = "core"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/${VBOX_NAME}/COPYING;md5=217590d3a513571b94632edf5fa1169a"
-- 
2.50.1


