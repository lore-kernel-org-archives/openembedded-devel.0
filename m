Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E99BC04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 07:06:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6209.1715151959519164630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 00:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SqRTnk07;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5858e9fd0b=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448508EO001873;
	Wed, 8 May 2024 07:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/cBXi
	lviyXFFPyhBwT1ZdO+5fw+I4tu/+A56bDhAEoA=; b=SqRTnk07UUd6SgJAR7PH7
	of+3SAa2fRmUmoco8jqE5wk0z1FrC8T8zxt9+VOcuuHRxqQrcIGvWOxoPmOuX9Ls
	iyJI34B8Qa5lj+5MDKfHSbjCaCW4mS+Q0+jBObim6yrUYZbmWf1htKEO9z9gfaiK
	OEPZYjEAzGXhpkToP13FgIPPqErOed67pnQgvLGcGAfLeNE1Hlg0RqhO1aTAuICw
	WWAHRDK8MJw5WmijOBXW5o5hLknvjprqOVxCVYY2hxeC6kJ/HcNCs1WnMyrPgNHw
	xIJdP7nCfMDutmRiWzZ/bPF8oCayRBUYiW7nKF1YusAb/rOyzoUL500FI9K13eeL
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xysn50gdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 May 2024 07:05:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 8 May 2024 00:05:54 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 8 May 2024 00:05:53 -0700
From: <kai.kang@windriver.com>
To: <peter.kjellerstedt@axis.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH v3 0/1] apache2: fix multilib file conflicts
Date: Wed, 8 May 2024 15:05:50 +0800
Message-ID: <20240508070550.1641783-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Vq5gQ_UEbaaYSX_ayun-SIp--UKfXSGk
X-Proofpoint-GUID: Vq5gQ_UEbaaYSX_ayun-SIp--UKfXSGk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_02,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 07:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110273

From: Kai Kang <kai.kang@windriver.com>

v3:
* substitute the install dir of `build` directory for all layout just as
  the same as the `cgidir`

Hi Peter,

Please have a try. If not work for you, please let me know.

Regards,
Kai

Kai Kang (1):
  apache2: fix multilib file conflicts

 .../recipes-httpd/apache2/apache2_2.4.59.bb   | 37 ++++++++++++-------
 1 file changed, 23 insertions(+), 14 deletions(-)

-- 
2.34.1


