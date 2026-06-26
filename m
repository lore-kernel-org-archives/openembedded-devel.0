Return-Path: <Sandeep.J@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87E4CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 04:34:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28514.1782448446911522557
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 21:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rlfXopK9;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild12.wrs.com, ip: 205.220.178.238, mailfrom: prvs=06372738ae=sj10@oak-lpgbuild12.wrs.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q4FXwa2891732
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 04:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=gpK8HPkAb
	rJ5+2/Xxa57TZxANHOOxoshr+EerMprnrw=; b=rlfXopK9Mq5gfNzDWfCrm5JhG
	7M44VhA8i3sfhQHEUG9TcXn/oORBYKz7w56RPWaRWfFH2xjz4lOp+hfV9SD8kMaa
	PYrgoyPo2Nx9kFoHcOvDgiRGisav4ZWOGzDovKw0uIfmp6kLH3F9diUZJLPzymiY
	8SXiLU56hMrhbbuPuW+u8ccEcy45w6nZYKpQlFYcmQIwESuMPHXcirRATdi/bOBh
	8jTzs4Az2Xpo4hxoR6HGMDO4KUUG3SgzuwN0TzvClcnWowxucjRF//lEPEdq+bzI
	/TEZ7YhbZesPQs8Zpu+KHBozF6k3sCsp0SuLJ/wAG1U94hY9bUNGbV+5xAW9Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f1f0tr5jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 04:34:05 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 25 Jun 2026 21:34:04 -0700
Received: from oak-lpgbuild12.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 25 Jun 2026 21:34:04 -0700
Received: by oak-lpgbuild12.wrs.com (Postfix, from userid 1762445396)
	id 26C093900BBB; Fri, 26 Jun 2026 04:34:04 +0000 (UTC)
From: Sandeep J <Sandeep.J@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Shiva.Komati@windriver.com>, <Randy.MacLeod@windriver.com>,
        Sandeep J
	<Sandeep.J@windriver.com>
Subject: [meta-webserver][PATCH] meta-webserver/README.md: update broken Yocto reference manual URL
Date: Fri, 26 Jun 2026 04:34:04 +0000
Message-ID: <20260626043404.3399027-1-Sandeep.J@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: sO-ktp8jWSdIs3Q6_wgrdy02avIUjewf
X-Proofpoint-GUID: sO-ktp8jWSdIs3Q6_wgrdy02avIUjewf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAzMyBTYWx0ZWRfX41B0NouXtWlF
 wOMn73Xry3XK7xtqGL3Cvvi371rItUk+pkB2lIdwNlf16z8AllFLn/uRj8PdMUQS05ign+eX8Rz
 fN0peSwjZleqm6rwGi0SujgqSL4wZvY1YnwOttmfI1N7GHE1Hg86KKYUVzUQQFCF7+zoXHrJhG8
 c/toNJdJM4NOn5w+j/IhJ37XEaNJJCdEsSFAcjMtufjPHE3VHaNfICbnQ1Va/i4x4CvGBJWnYjX
 tdIPOB8h96/pGB5tQo1FdKktt2OM8+CGioORSQRAyX4Uyiq64kao7zqI6tRsHaSmbwTYkm5EcPf
 ts4uGTXeVDaMWkQ3HTiWDAIQy2i419e04Exq7kAKP5rZXMNsv/yOGQkNcFUKMh8Qz3GHN9/ykzm
 I9++fCJIKeuT6/uTvmOh6AjUPOkeICNwwjLoLzb3Cpjp0G8fWsEbgHNPSyjFLNu1/8KGqPG7ccA
 rOdY2HDiAEKGF2K5SuQ==
X-Authority-Analysis: v=2.4 cv=QaBWeMbv c=1 sm=1 tr=0 ts=6a3e013d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8
 a=HPCHruN68qoECyIU7zUA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAzMyBTYWx0ZWRfX+6/ml+mJZGRl
 IR3rRCLFlizxTwyMkqaWJsDYrOdntEWsQ1Gg62sywt2/9YffcsMaHPI7eTD1nUHvIDA19bDkS5T
 IzuzOWSRrf9epxT7bVUXzvaQH6XZM1ZDyGjdIlrIHWhiEBXqAzqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 04:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127786

Update old URL:
   http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG
to:
   https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFIG

Signed-off-by: Sandeep J <Sandeep.J@windriver.com>
---
 meta-webserver/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index 17c7c76d94..565269648d 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -43,7 +43,7 @@
   to the PACKAGECONFIG value for the php recipe in order to enable it.
   See here for info on how to do that:
 
-  http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG
+  https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFIG
 
 
 Maintenance

