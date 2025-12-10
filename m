Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFEED3C52A
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:12 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12683.1765363450687561285
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=jFCQW7Jr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=24394d3a2e=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9heGk1040260;
	Wed, 10 Dec 2025 10:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=GIrQJDheWWKxlfewuJSxD551+62VvNeO4wEm/hpNQX4=; b=
	jFCQW7Jru5R3RH4NJotHuF5IhEU87h2yCiTf+l45rRo9oyd/hnWjqDnjyRggn/oR
	Gz9Bya4QetgwmwXFmD1dX796JIRKNvUMKvbQZfhRdSLICJ9Wiwo5RX5NMlDrwisC
	dY9IpOyaSCibiY8FQ3GnwHEYn0vJvVNqBxM74kjhiHUX448hXoWxDlykNaLm5bOB
	9bs5LKF04W0hr2piCkcyGZZW6VrTYhp9qX0f9ajOTunI9+2d2JrBYntbuMW7QVGi
	fMk90PW627VarkvZM43yLrgsPbE+gUGRm3Xe3SfRSlSQv8u94zmtebPeEqddP5Xw
	nztfbWDX7VMOdobyvo895Q==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4axrnwachy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:44:06 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:44:06 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 11:44:06 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <brgl@bgdev.pl>, "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH v2 5/9] v4l-utils: Add HOMEPAGE variable
Date: Wed, 10 Dec 2025 11:43:21 +0100
Message-ID: <20251210104325.175100-6-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
References: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=NejrFmD4 c=1 sm=1 tr=0 ts=69394ef6 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=xq3W2uTSAAAA:8 a=n9SCklZpAAAA:8
 a=gvYjutddmaRAU6QaVSgA:9 a=P5L7wpMTXyg1GfFA3Gwx:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NiBTYWx0ZWRfXwWgDx98/5PRz
 fiBRcJ+IN9/CUHAYPMwMXhtH7pVyph5BrNVWPPznT2Zu4to+VySuA2LS4+GyAsrBBWs/IJYd6S1
 MV9e63DYiMSBTZ8xG6yWtKwXgl1Pdm0FDv8KRzrsN/BsedWg7hnbhKc9rSyG5cE+I57LkRyL29D
 ak+TIWiuboiJpfgIAJOL/MMWPKqdAi8hNzvXrhPoQ022Xf1AbpMyacXN9XYgE7cGQ/LehOA9M6a
 ic6RjpX5nao5/QnqEOS7iUX7xto2K7kje7hexG7zty9ynuHfABCJ9h0QCKCqDd56aIpR/tw473O
 /Dv6hNitmQ03ivJLYLgZps53RJQyJDl0BR4zTiq5MTprdKi+bSr7hoFzOOM4vaYlaW7CCQHdPR7
 PN1ZeggexhAu3/FJ2XqL1PavVDZ8cQ==
X-Proofpoint-ORIG-GUID: odtMTMgFVC3i-nvFy41qNN6BaOj1i6uV
X-Proofpoint-GUID: odtMTMgFVC3i-nvFy41qNN6BaOj1i6uV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 10:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122501

Add HOMEPAGE variable to v4l-utils recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
index a719bff02e..14b8d12c45 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "v4l2 and IR applications"
+HOMEPAGE = "https://git.linuxtv.org/v4l-utils.git"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
                     file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
-- 
2.50.1


