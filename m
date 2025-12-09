Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426D4D3B7F3
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:10:02 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7295.1765285798997135095
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=ijPyMx1k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NHdIQ543539
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=JAGnKcFxTlrmqxdSL9ic8SolJDp4yncVBDX3ov4G4fI=; b=
	ijPyMx1kDfrqC1AUFQm6uzUr0Ev2CCO3rYhHtFErYKZsvriM/jzTyHQh3awu7H2i
	MwmmtjYgF35dpKPR6FXiEgTBwPXM6tYY5OXwvrxY8SRozjuvylrrjbyHBgLy++sZ
	Thx6mjFpX4XZ9OGuKR/05+hMAcExQR827ZubkX1cWHOYio1/pGjw3cBVH+x5LMXP
	wwFojhJG1ps+f8XBMy0jGRcq7JPIhh56YSsgi3b8g48mo7yuqWqXSucpX6Qd86uz
	t5kdOrsvTvbHwsO+mGm7RpwYjiyPHfchY/SvR31pzR2yq5J9by5BbugGHJN2X+6P
	oUmcICrLyqG7LBSk4r5QqQ==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6s4a882-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:09:57 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:09:56 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:09:56 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 3/9] upower: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:09:07 +0100
Message-ID: <20251209130913.388053-4-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
References: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NCBTYWx0ZWRfX3l0BP3SfWASz
 PdcQYNHrwZ8iC8t6FLqJ4/Kvc+gJlcMNiY+s5ZhsJ4WrCjmxPeCAo06JMe/TA+p9emvGlunDsX+
 QK4G6C+AYY4SRh5ff1XQW3SDIp/FEs0eLOWyWcLf7rsMEiRedvVDCCEYLwv/RiZG9sJSzxArrsa
 xUwUQZsOLwgXwBYBUoJHlH69FZsk3BPF680gizJ28sNcGLJElycIQrTMcWCDeDSJfH73X1kqkCR
 MUIztdjcFUWBYtwgc+4giDNlN8HPR2pDbabpA7YU3J+5voiePsBYHUeR0IyiY56apf/TVMAt7t0
 tLjmCkZbjGwJkAasoU5ZWnR+mFuuIA7IHxnWkC1lk+N2TV3z5r0m83RBpFXJdHMbN4yLKLrAdQI
 c9ktH4EI1OohuykZ6JP1sLWpiAoOYQ==
X-Proofpoint-ORIG-GUID: xiSruxNWYOEEHmrmqnLyd10Bot1GgnNB
X-Proofpoint-GUID: xiSruxNWYOEEHmrmqnLyd10Bot1GgnNB
X-Authority-Analysis: v=2.4 cv=N/ck1m9B c=1 sm=1 tr=0 ts=69381fa5 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=n9SCklZpAAAA:8
 a=d_zq-5R5v5O3VGAzeD8A:9 a=Vxmtnl_E_bksehYqCbjh:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122449

Add HOMEPAGE variable to upower recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-support/upower/upower_1.91.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/upower/upower_1.91.0.bb b/meta-oe/recipes-support/upower/upower_1.91.0.bb
index 9d20e0a432..b81d0c2971 100644
--- a/meta-oe/recipes-support/upower/upower_1.91.0.bb
+++ b/meta-oe/recipes-support/upower/upower_1.91.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "UPower is an abstraction for enumerating power devices"
 DESCRIPTION = "UPower is an abstraction for enumerating power devices, listening to device events and querying history and statistics."
+HOMEPAGE = "https://upower.freedesktop.org/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
-- 
2.50.1


