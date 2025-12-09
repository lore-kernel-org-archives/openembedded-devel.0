Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64743D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:09:42 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7282.1765285779494973719
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=jk/WYna3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8LckVB368760
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=02LhJ
	y+LgZDpHBoJCjxQSzVNHh/chPclZNcT2mhNyM0=; b=jk/WYna3AitqMbpz5e0dK
	pVGmFp2bjOozweq3pub3DMsOu0HuBGtJYtgNCCUKGiPaP1QWrVaF6Tj6lBnzyJsE
	hZUgz98gdzo+17GdjB5Q02T4+zMDDL9IY1fFrdhA5aRNRRB19LQqfGfHWK1Esbba
	o16N8uP75ub7fM6IpiLwm3whHkOi/0D7nqn+wvZti3UAa+mFax/IFtgxqz/K4191
	So/PedGvJq2gxeqMWJIsdsiWUDNT6/WVCL6/IFvPQzhGhimkBVgVKO7ueslXKXlW
	58Bwq8glsLUf0cokqETyo6F6wRG1c2ShZRd7ay3JXWWn1dG/vCgP0B0hOnQRpg4X
	w==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6s4a874-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:09:37 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:09:36 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:09:36 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 0/9] Add HOMEPAGE variable to several recipes.
Date: Tue, 9 Dec 2025 14:09:04 +0100
Message-ID: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NCBTYWx0ZWRfXzBLGltH4x0rx
 hGjizB81tdIbYegNbWJ3bB+hDxRZsF8GhB1ZI3g7+TLJ8O3UKiSkdJhOZv9oPR7WuksEELPAoPr
 RYw6LaeOtcrwC2uKStzJbuY4ilw5HlQ2R1S6Yx+iYSas0VoDPZhA6NL1r9q265OfTO+lqoOV6OB
 f8c5202W+aTZmcBtT4GcuWDjFW94QTW9Oo6ZUP2j21doJ+EBvIPyW4m8EhIYe4RQMFidpMbd0qM
 R2Zll4YI6J6+JsUuXkH2oB8r0zIdWbqXjeTgPHuJsVnZKZc6OLuz0bU0kuM/2hy9cbsVIExiLy/
 27W8jpDG7mK/07qnOL5CZlGpRYRWDZVqGZciKmMrH7ijLJruyluUidfipm7SGs7UI02xnlm3glo
 5pRisVPeu5LquNraoYDuQza317AINA==
X-Proofpoint-ORIG-GUID: JFUmq31WVHAtZbvP6dHPpByj5C3deN-h
X-Proofpoint-GUID: JFUmq31WVHAtZbvP6dHPpByj5C3deN-h
X-Authority-Analysis: v=2.4 cv=N/ck1m9B c=1 sm=1 tr=0 ts=69381f91 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=QmTELifqY9-FJ72p2CcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122446


Weisser, Pascal (9):
  libgpiod: Add HOMEPAGE variable
  trace-cmd: Add HOMEPAGE variable
  upower: Add HOMEPAGE variable
  polkit-group-rule.inc: Add HOMEPAGE variable
  v4l-utils: Add HOMEPAGE variable
  vboxguestdrivers: Add HOMEPAGE variable
  pointercal: Add HOMEPAGE variable
  can-utils: Add HOMEPAGE variable
  rwmem: Add HOMEPAGE variable

 .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 1 +
 meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb                | 1 +
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc           | 2 ++
 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb         | 1 +
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb             | 1 +
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb         | 1 +
 meta-oe/recipes-support/libgpiod/libgpiod.inc                   | 1 +
 meta-oe/recipes-support/upower/upower_1.91.0.bb                 | 1 +
 .../recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb  | 1 +
 9 files changed, 10 insertions(+)

-- 
2.50.1


