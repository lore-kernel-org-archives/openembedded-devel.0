Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D39C27C75
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 12:13:32 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.6988.1718280808845503249
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jun 2024 05:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=AaMOqmSH;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D4l1nL031688
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=cuLi4
	NcejwnUrl4u6JmUZUufU7V5SWEdgtVdhWhQpkI=; b=AaMOqmSH9tUN7gCfthFTB
	BeUNoyfHZC0chAxYADAmBni4cl8L5cmkNqHYn1bPafZdFPyoP7LqXV+r66eVsEy8
	iT2gL4Y2PlY9aP13yqCepKS6o+Bgb4XyW0JFJsuE+mLWwEnUlITHXo5blcfWVYGW
	9U4YFUM6WrRMJsl+5h1GFc/x5tA40lx/e5VyJ3VuXqV8hsGq06ziL99ym8SsIrfZ
	EP+96lq1swipwcR4k56JJBQjKxIaHI4bhbh9blKlwaFEOjqcV5fiSytBgwrgIsYw
	6I/quDPiDwFR8nxOa+ewrOflP4dj39W+gTlmfI/ZrZQ7H9zklIWW8tSIT2psiqVc
	Q==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 3yq7nj2xhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:13:26 +0000 (GMT)
Received: from TUT-EX20-PV.KSTG.corp (10.0.10.224) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 14:13:26 +0200
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX20-PV.KSTG.corp
 (10.0.10.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 14:13:25 +0200
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 13 Jun 2024 14:13:25 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 0/2] libblockdev: Fix dependency issues.
Date: Thu, 13 Jun 2024 14:12:58 +0200
Message-ID: <20240613121300.156560-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uWKFmoFiikBf0oIhOpuYPVwkh8JbOlhf
X-Proofpoint-ORIG-GUID: uWKFmoFiikBf0oIhOpuYPVwkh8JbOlhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_04,2024-06-13_02,2024-05-17_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110890

This branch adds some missing dependencies to libblockdev
in order to fix the problems reported in the issue
https://github.com/openembedded/meta-openembedded/issues/832.

Weisser, Pascal (2):
  libblockdev: Add missing dependency on e2fsprogs to fs PACKAGECONFIG.
  libblockdev: Add missing dependency on keyutils to crypto
    PACKAGECONFIG.

 meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.45.2


