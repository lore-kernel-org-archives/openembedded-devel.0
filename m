Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5A2D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:27:22 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7618.1765286839271598204
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=dCsObzWy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B93gq7M1006301
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=w3YEOMQR+LVdWQT49RHpE0yiRgFVsBgxWfW3ftftNj8=; b=
	dCsObzWyvFGSjfvCT1z+dd+KjcIEyHGay+GF01c7YqlZZxxZS9DYkOZDzWANTHcS
	22Ztl2B/IZP8VpRM8mj6psroKL6x2tncj+Qfpqtb/jzLXdH5GRxp5Ac4fJCB+WIl
	mF7t2TRLeEaNBg32ddZCMYV2c7VwBWCOeVwujGciHxalnILR3diaHP+Ct6PL6zEG
	gW35K4MRmYxcqxw+rNlxx9kwrvvzixb/7W9lyGiyDEyVqZZ3qdVC0PI92V+Zpnpy
	YEqOFtx8B5N2cesL6Wdj7A2QrahhiCyFHhcNzUut+766QoofVVSbaaA96I5dtiIO
	5l4Wl9LAp0qlcoK7GMaiKg==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6s4aa2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:27:17 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:27:17 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:27:16 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-multimedia][PATCH 1/1] libcamera: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:26:56 +0100
Message-ID: <20251209132656.405509-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209132656.405509-1-pascal.weisser.ext@karlstorz.com>
References: <20251209132656.405509-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5OCBTYWx0ZWRfX1+EjICIhKBzm
 93BCITuTsVrXnzEEkWsNhfCovGHsf8i80PxQ0X79OovnSNETl6wdUQ1HbdNnvkIthO9HdaleF9n
 I5CZYIKxbTtjVEQIBYQMOgN3Uc8qG7si+xl8znOBc6kTFGTp8WNEDMFG9tuMYQ3yxzA8p2W+i0e
 aEUNhWATFaVnzY2xBmxS+Birh3TuX7CBGhxoTykCwG73rQ4VHPz8kngzTf7y3hm2PVRbF7WUa13
 Acwln3XeJpc4kmg3FFQhtTA3icMFn/YkaqrD/WCk7y+T7NuU5pwK7uy7aEULAqRlpPUn+vZdI9a
 hfStFuWRpugfY5gUuSYqYa2LXLdCUqDPgt2DAUocVPyyB98BsX0DN9iSmS+zkjW+GgSIrp52HzG
 XYrnW4FLJCKMiSWjjHsicv6oZ9JI+w==
X-Proofpoint-ORIG-GUID: qAE_HCtz-10KSpWfDhP-4j1kpDw7w_uB
X-Proofpoint-GUID: qAE_HCtz-10KSpWfDhP-4j1kpDw7w_uB
X-Authority-Analysis: v=2.4 cv=N/ck1m9B c=1 sm=1 tr=0 ts=693823b5 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=YAyIRdgMAAAA:8 a=n9SCklZpAAAA:8
 a=SoBJVqxPJzWt0OavZQUA:9 a=o1rO4XtwZBNj6n05oSJ_:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122457

Add HOMEPAGE variable to libcamera recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
index 0c6941213b..8ca9bcc7fd 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Linux libcamera framework"
+HOMEPAGE = "https://libcamera.org/"
 SECTION = "libs"
 
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
-- 
2.50.1


