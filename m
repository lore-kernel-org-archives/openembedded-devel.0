Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F66D3B9A9
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:43:52 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12675.1765363429697808890
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=J2RxHPor;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24394d3a2e=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9hvlv086678;
	Wed, 10 Dec 2025 10:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=02LhJ
	y+LgZDpHBoJCjxQSzVNHh/chPclZNcT2mhNyM0=; b=J2RxHPor9Chsmf2h1DEwI
	DtzVXd9nkpr1VjAGPyZfuTNyZg47zv4d1BR/9JeAZzcvAmEC3iiLUkHA/auYn0GR
	f4NR2QulE/OtFMNCdix0QjFxwXg4deVWqY9FZli6GDJPRHd9MWGbs7vv1dey/8ig
	JzAa72l/AsuyfjpHe9gGxOu/XjOwDrkj9Veq7AEMjG8a1LkQS2l51DD/MgLfFWv0
	P7LMgBXkhmEdLHu2bxf3wBqswL/kFK8V77zpCnfKMvAoK+XQ6x4fcwWTU8K6oK0g
	K/nCvSBBFB2K3dx8g90Dxt7DYrc+7r+NNQAbztNlj5+0Gn9f7ZfvF/mFWaBU+rNV
	w==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4axts7swya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:43:47 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:43:46 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 11:43:46 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <brgl@bgdev.pl>, "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH v2 0/9] Add HOMEPAGE variable to several recipes.
Date: Wed, 10 Dec 2025 11:43:16 +0100
Message-ID: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: oFtDdHVlHHkFEZxghtk8o1ilzvQ5zwjh
X-Proofpoint-GUID: oFtDdHVlHHkFEZxghtk8o1ilzvQ5zwjh
X-Authority-Analysis: v=2.4 cv=N9Ek1m9B c=1 sm=1 tr=0 ts=69394ee3 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=QmTELifqY9-FJ72p2CcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NiBTYWx0ZWRfXyVG9o0CZ/Vos
 9e/WYgaYmXcYtirLACD6qPv4VUBv/9DvLK8iHCr4n9wdlqYnMf4qQ6EtdPAUcx1QGKtzdsvGcrM
 1XLDOHn/CsQbR02zFLCgjW0N1JuyrfMZWFero2L6YlnH7aTiV6Icqb64AJgvXmmI7gF11uNCv+4
 IcqQkbLUAaKB3jbV9BFWKb774UrWlx3pO6rmSq6PLI08PiKhx0CUgkLqsW9tRngYWF1TmNzpAp9
 NrS6ZeLDxvKedTZnAXBONXvnJ12LBYhtPgjje9iUX3NXs+StVBZIy3D+YAgNpKOt2eQya6qouAX
 45CTvsmx2KGTpeCvHNlov5RIWGC6JX802PtdBUn9E0Nl5Roh5e/z6RN6NGKy3hdKW1xLd1s47OG
 F2skMaQ5UfkgcySiZJLJeo4aRo7/og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 10:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122495


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


