Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406F5D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:10:02 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7291.1765285793703458367
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:09:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=DPh8OHy3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NHdIO543539
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=F9EQAvHjZkjx6tKlfxhfBnH9gOOQWliv6zbnu3gldB0=; b=
	DPh8OHy3FP5W9Xrq7LkJKBn0qsvuPLez8q7l2/FnnWPvRGPh5wWBijjsRbIWf4BD
	5ZVDrF3HVenDbs6V2yul7ufpnxVn/VQMJIMrb92IXYIvUcvb/EBBzYCSh+5dWASQ
	Qh7qOXIeqYPeC68db/9O4OpswJ9cmrTcap/b3grC5mYdUU1EEu7Fu/SS3GjmZda+
	VGCLsyFGY1SbWaX0byoMOnN3gFN5AO1tW2dsD2q53B9DHaA68ad64a6H1fAXZ8Cu
	kfmKwN4C8XGALlcxMS4hxn6upwKoWqhlsRSHITN9ZmCWHLXuL97f04EJK+OSWk4p
	5pjO7hv1h4qzgwhunRKmhA==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6s4a87p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:09:51 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:09:51 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:09:50 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 1/9] libgpiod: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:09:05 +0100
Message-ID: <20251209130913.388053-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
References: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NCBTYWx0ZWRfX9bG4hu9OgehL
 rjUprxcBGirQ2gmoHzQjBGFtO9Fvk68YbAoxkdahegiyA2cCaBaiOA/RGT+OTjXTSyhI6wwvAHM
 qQtW4mY2r6jlqvmy3GTsM8GpVCJ0ek1+rsXuJgyYLnJCTqKAx8CFLGKmi6PDYOxGjsD0l+c3X5d
 QEWpAyfRy85i73aBSptPajYEpaAT41gQVZ6g2YP4DLz43stPB1spSOAMB1+QGU5/2nDENabQHPI
 2SlphtJaOawiJ1H/XKVyhyQbvAx2yS/Elf1nWfGqW47I9FfB6G6kg/M3dLDvq6PxrLkdwyKGWUj
 F8PLxN3UPyQQme7y88rrcDkhLbkh14dDKuZkOnIaXucf7/3lVKnkfM2cTGhPBhv3Sjty/i698Zr
 PtSzbR5dEfi1+QfTCIjN4ioaZbmESw==
X-Proofpoint-ORIG-GUID: 4pqyo_z1uFeJ0ZV_9OsmH5JIRgwWKVGs
X-Proofpoint-GUID: 4pqyo_z1uFeJ0ZV_9OsmH5JIRgwWKVGs
X-Authority-Analysis: v=2.4 cv=N/ck1m9B c=1 sm=1 tr=0 ts=69381f9f cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=n9SCklZpAAAA:8
 a=PDEq06S-YjvzlooFpfMA:9 a=0lgtpPvCYYIA:10 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122447

Add HOMEPAGE variable to libgpiod recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index fb309c5644..202d09c002 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -1,4 +1,5 @@
 SUMMARY = "C library and tools for interacting with the linux GPIO character device"
+HOMEPAGE = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
 RECIPE_MAINTAINER = "Bartosz Golaszewski <brgl@bgdev.pl>"
 
 inherit autotools pkgconfig ptest
-- 
2.50.1


