Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7FAD3C52C
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:12 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12679.1765363446826565445
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=kP60AnWP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=24394d3a2e=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9hVIh1040056;
	Wed, 10 Dec 2025 10:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=ng+nVv427fFzMPq9fM94+O8cimFLU1HsKKeFzG/dtrY=; b=
	kP60AnWPAPaqDCD1PCojGyLxGkPzCK2c2pWEE0yklHdCOF+VIWdyUJGIuUNOOdn/
	n/vfudR1dCgrugD5zvD/L795PxlUnPBpd5G6qNPMRsQPlIYa/OQ1aYXCTEArei2j
	SDGhGxGLSVKHUGy4uFsXmGM7i6pS8zdLYUYv+h+fVSYzq53fCLhUTKDB6wimkhNE
	nxbYu38EFAxE8nJ64Fr9C8zoVxkJDNR/WvfLfNoLfgFprO6KVXGa6OZQg+p2oxHT
	Fo1sYqGnX8ZGSE5pVW9uwbzcW650CwtVGv2isn7ItAu9x458pcdfiSPRIaEVQuc0
	d0dk+mQe5btyOPz4A/0l6A==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4axrnwachp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:44:02 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:44:02 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 11:44:02 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <brgl@bgdev.pl>, "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH v2 1/9] libgpiod: Add HOMEPAGE variable
Date: Wed, 10 Dec 2025 11:43:17 +0100
Message-ID: <20251210104325.175100-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
References: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=NejrFmD4 c=1 sm=1 tr=0 ts=69394ef2 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=UXIAUNObAAAA:8 a=n9SCklZpAAAA:8
 a=8oT4ZRS9jf6rA5zwr7QA:9 a=0lgtpPvCYYIA:10 a=a1s67YnXd6TbAZZNj1wK:22
 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NiBTYWx0ZWRfX+DFQXEIM8z3s
 ncfK4pVmaLZ4D4UO6RHRgW50QRZLVZb9uNRS0fcyD1Ojc6sFKZAcWi2bpnPDGRr6+jVbdAohBPW
 aqi8wmu8Dk4hwr1J2wQ4e3Zg1SdwuFtJuWmdYlCOFI91W+DaPvnzhKfwyX2BmKuJrh5EHFu2LqT
 SUGe1nwoZtgX4+38YylJwPvXtJJeSSGVPuzIgaPJmX0Op+jCIh/EsQOd2wV6dXairutrpm6rlXt
 QvvzU7EOwSwtoTbz1AF+63i9hNJS2JpTCgUmAU9nfRrfGLIQ06MLINwEqMXTPNQVz8h3yg3LYK7
 A8r6pGb2jphRB1WpIp9wNu2VdJ15U1xJqhjQjqTTYJt92rS5/0vceNgHrctRUP4VVf/x9utT61m
 JWDh/lnBOpEZS3/jE5D+zO/keKLnFQ==
X-Proofpoint-ORIG-GUID: xA-JKqG-nKLilzz1W1Xqnucdg70X0R-0
X-Proofpoint-GUID: xA-JKqG-nKLilzz1W1Xqnucdg70X0R-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 10:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122496

Add HOMEPAGE variable to libgpiod recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index fb309c5644..63ffdc2466 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -1,4 +1,5 @@
 SUMMARY = "C library and tools for interacting with the linux GPIO character device"
+HOMEPAGE = "https://libgpiod.readthedocs.io/"
 RECIPE_MAINTAINER = "Bartosz Golaszewski <brgl@bgdev.pl>"
 
 inherit autotools pkgconfig ptest
-- 
2.50.1


