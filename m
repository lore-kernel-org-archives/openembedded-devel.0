Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A531DCD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 20:13:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.138700.1781554161371688916
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 13:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Sth3ghO/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=062620d270=venkatasainath.ravikanti@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ0pgs1914477;
	Mon, 15 Jun 2026 13:09:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ZoryVxJ5KQXeX+RsOq1t0z77afV3jzByPmL6BqWD0AE=; b=
	Sth3ghO/+FgrUkMzO2vDp88B0TIZKEJzDbQgHmK0HwCwOrj/0jRqmRyJ1oRFUfLS
	lMxK3ETf5fYH0Cg9/xJuEziasqUh7wwvpLgKTNVH+dCGs7bWn55PMXDWSPOcV1HV
	feg1pJgf8z+RzrsOQ82bgoP/VWctQpysHYovwPJYaqmAacgw9j2bQdG6sNYjUMnD
	wpVC3a8Ub/mLMQbRfD2eCeR+aonaDNmML0Uy1w6IovWpCoFeJXnGoQ9/8r5s3s1j
	AwFklf/DBjELS/D7j74cJQegZImllaIwU6fxUHSz944vE+PAKTTtqRRH/qUhuM5j
	LRdGQUlcipn6vEM6ZyZdAw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es6qdu1g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 15 Jun 2026 13:09:16 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 15 Jun 2026 13:09:16 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 15 Jun 2026 13:09:16 -0700
From: "Ravikanti, Venkatasainath" <Venkatasainath.Ravikanti@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <anuj.mittal@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>,
        <Randy.MacLeod@windriver.com>, <li.zhou@windriver.com>,
        <wangmy@fujitsu.com>
Subject: Re: [meta-oe][wrynose][PATCH 0/2] haveged: upgrade to 1.9.22 (CVE-2026-41054)
Date: Mon, 15 Jun 2026 20:09:16 +0000
Message-ID: <20260615200916.1615129-1-venkatasainath.ravikanti@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611191749.2897262-1-venkatasainath.ravikanti@windriver.com>
References: <20260611191749.2897262-1-venkatasainath.ravikanti@windriver.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=DLq/JSNb c=1 sm=1 tr=0 ts=6a305bec cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=vi0Kot-ljazAF3UeVNMA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: h8W4ahDn2bOjQnyHebafIhoS16c-AtaM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIxMSBTYWx0ZWRfX3lt1l7eDfJh+
 ZusN+UJJsF3nO8LlfpwxrKe63wH4kROzcuuSsl+ygdklIEUMBQFIt6w525skGplyaIHC2Mspd8Y
 0b8In/7TIF/Mmk/RhyrCLRq5XF57ZHnkV+iKrQjkYDjqjoqhO/ibSrFlL1vP03HYBBvYMY+Pj70
 yqpbNl2Hcq1OlzW2e5kOMCTlva7KtJk2x/W9qmqpnWpFXefl+HGjwSeeFjheBaGWNbiCKZLm188
 Q4WxlJoy3+rVCY418PKamp/vp6VsZuTp9F3+CDN22bRgvb7wW+os38All5mOi8knScxzJP2zy9q
 lqHeyMOH8f0trofrixCbc9CvFfukn3WIiZx3RjTXH1fZRo7hierDDJL/7PkFfUHgnQt9moNdyo2
 kdRaKm2IY5sRpSDh45NZ+wPOY31Om9ESbfTCRH32tyqfCEVj43AikKzMr1XDciNrS0j5XF/SQIS
 aUOFEp0oRjfkxdWy+Hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIxMSBTYWx0ZWRfXw4uyjDhhupyJ
 mr90GZtgeVbfJ7W8qWw+OSDc+hCgN8XK1MnnBCHplGENzuKWAf64FyIHBBoY6lhEoHG+pFLVgy7
 sSVVkiTJwO555hqsyGYNny0pkmaqw4yx7OX/oola1emM5VQSBs+r
X-Proofpoint-ORIG-GUID: h8W4ahDn2bOjQnyHebafIhoS16c-AtaM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150211
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 20:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127594

From: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>

+CC Anuj Mittal (meta-oe maintainer)

Hi Anuj,

Could you review this series when you get a chance? It's a cherry-pick
from master to wrynose, upgrading haveged to 1.9.22 to fix CVE-2026-41054.

Thanks,
Venkatasainath Ravikanti (Venky)

