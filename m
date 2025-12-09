Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B112D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:10:12 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7298.1765285803266768543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=mxfYXYQ0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B93TGHS983056
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=puqiAd7gPYLkiwme/k6HZ9FOzm7E7iSUL0J7rKlbsTE=; b=
	mxfYXYQ0HWhm6MHCKKn0OmGhJKYoI2LyMTAi5GrvwBzm+L18yHSMEmVy0u3QBmkO
	N0SFq3vr8yyXCziF6jlYYwpOPS/BxrI+5QFXTp0+EhwZ8p5PHhmzpww710NK+TQG
	B6UbjxU98PMH8opUP4WF3SIiJf5RDTtz3/nhrps56NOskBuHJOdt3C9grbIfePIU
	sTyYWqsGp0jGQwZBfE2Ip1PBcuZ2SyEt2rbWKvbnnjNPeY4uZOFRtD8t59YGZAls
	YylXZI5NdpxTCVCg/8HsxB7LOrVBdjIW/6qJOMUyKg05e5Ou53hmZKBuIkmPliFY
	7IzTOa3Xbg5Jkbj18oe55Q==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6s4a888-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:01 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:10:01 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:10:00 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 6/9] vboxguestdrivers: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:09:10 +0100
Message-ID: <20251209130913.388053-7-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
References: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NCBTYWx0ZWRfXx/nDfHp2ICjT
 TJVGA5IgIizW+M/3Kee374DIQ9znU3bhwbd9gr17INN5Q2CMfEVvwNtPESNZw3Vc4THSIoWAda8
 J5x64f/gDVggDGhch9tDobBD4jmMzqbjTO/Izmc7KlZMlR9dE3UO51qe12LcgcHO30fBUvJDG5M
 9cNDCvUOR9wc4A58TKo2y9t8G7S0K4QsooGafhbB57lz2lw9mZrL5OYyCX88oqzxRj1kpFubb4C
 v+qHC5Kn0OjU32vXt1fJ2U7LZKkiw8vSRFDaa2kl+/2rARXrqLnCCgbCWrLT4rRG6jj6rs/+6lG
 oLhk+vwVFh/FwiP6a+C0mh8mv6mYX1orY49Jfd7mzg0Xt3mHdXmsJ5MtUaJXCO+ax6FZBqA9vfC
 1RRFwh+Zdshhqh94Ap3BAcnTgfG8Rw==
X-Proofpoint-ORIG-GUID: Ziyu60piG5cZzz4lR2_eupKqWUkK5WjP
X-Proofpoint-GUID: Ziyu60piG5cZzz4lR2_eupKqWUkK5WjP
X-Authority-Analysis: v=2.4 cv=N/ck1m9B c=1 sm=1 tr=0 ts=69381fa9 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=p2QsaepqAAAA:8 a=n9SCklZpAAAA:8
 a=g7CHXTISLbrKoUue37IA:9 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122452

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


