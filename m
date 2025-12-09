Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CEDD1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:10:12 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7301.1765285804478894732
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=dsTrRxTL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B91Lj9Y761291
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=B9rXewwsP6+Al4msyGECP02NgXw6+9HM7QrPQiBdPGQ=; b=
	dsTrRxTLjM15t+j+gLgBWoiJRjyn6/oiaPzwdEU+gjLp7MuPkOkFB+Sv21USzVJU
	tvUMZ3V2UJJa5PAjy48SSobsjvuBj+kSy0a8DF/a5lGIR+mZqLb7gGx676HKYcxQ
	FR28jywn1BrAvkHHdtbL8mT8lfEq8rcliy+FGXtjw9HVhQgbCtjTAhDdVkKV4Vjz
	uhst8rfKTRkks7yQqprfPMt6ggFvFi4d6jxbvg5e5v2trwkSkX8H4oAoHpcBqSZm
	52RAYvT4EoXP8R51ZU+k4HTmF3yjQQEMaPoy0kPxRWaFETnFy1+qtkokaZ2Pha6B
	nAmizy3ke4JJMTpKYtKiww==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6s4a88e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:02 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:10:02 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:10:02 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 7/9] pointercal: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:09:11 +0100
Message-ID: <20251209130913.388053-8-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
References: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NCBTYWx0ZWRfX6Q0TUlOTVGQE
 AEycSgnOVJreUvFyfb8H/v3mJvrN8fvnqnE7PYogY3DX9Cj0XPe/3dy7p65CJdJtxwAB6WFR9YH
 rL+qW2MwRKF2HxSCmRZjijM8DSj9LnYNfmnUWKDA3UbOriwphdp+3/qlnem5R9T5I1RGxmzKjVy
 bom+nKQV9lYnRldC+yI77Qf2VW+nbRCuo2URf+VbQYpWlLUHsLgkdqlVC29gmTl/xQtLjfYnXDh
 HB9RByOMeBPtikekoZkLONOCae2V4tTPixAgAjgV2NHxCo6Q3Ga2wFR3cNnh8RJ9G+5srUSyuuC
 Rro63GUlxBGsFfxTV4yQAUOxU9creikmBFqQeXVadqP8q45LL5XN5aisxxfwYdn/oZmZuIMtJCd
 urKsaF8JI521wUpFKP4+5vTvE2nugg==
X-Proofpoint-ORIG-GUID: tISiB9XQo5XYfN3fArTT3gpP6_xSYtK1
X-Proofpoint-GUID: tISiB9XQo5XYfN3fArTT3gpP6_xSYtK1
X-Authority-Analysis: v=2.4 cv=N/ck1m9B c=1 sm=1 tr=0 ts=69381faa cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=n9SCklZpAAAA:8
 a=EfmfeaBIqfpP1_J2BbgA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122453

Add HOMEPAGE variable to pointercal recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
index a270a23dde..a0d8b08490 100644
--- a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
+++ b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Touchscreen calibration data"
+HOMEPAGE = "https://www.yoctoproject.org/"
 SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4b5fcfc87fb615860d398b5e38685edf"
-- 
2.50.1


