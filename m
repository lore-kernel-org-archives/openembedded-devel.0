Return-Path: <Sandeep.J@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAA6CDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 04:53:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4554.1782363177499143888
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 21:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kg0R0dyA;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild12.wrs.com, ip: 205.220.178.238, mailfrom: prvs=0636eea621=sj10@oak-lpgbuild12.wrs.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P4quRo465947;
	Thu, 25 Jun 2026 04:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=gpK8HPkAb
	rJ5+2/Xxa57TZxANHOOxoshr+EerMprnrw=; b=kg0R0dyAtLPrvJNqPPpEgsIzQ
	KVLSJe3fe+KDE0W4E0j5uZboWkLvKXtbmdNPmGx7+2T9v+ELGG7lkePwSGXl9O1t
	InROEXrkqp4irx8J/MQG8rZBCie3yIeOgPxyXW5p7M3UpjxkmRo7HF1/CLQGab1S
	R8v+ratun6T7BwxG85e9V3OQVVnguDd/QHtBYGAC71V6ccxjuPCM1Gb4QJumtzN5
	U3rz6fQAh1J8rNR//qeRZje5/ZtOl2lslN8WYhG5F9ohco9+JIfQm834W3/YaEmp
	gOUAgK306WOwsCCuqYttSr2la2JTtSNLlG824QEaVwUtq2ahS+Q7eI6+vAEkA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f0t2c865x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 04:52:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 24 Jun 2026 21:52:55 -0700
Received: from oak-lpgbuild12.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 24 Jun 2026 21:52:54 -0700
Received: by oak-lpgbuild12.wrs.com (Postfix, from userid 1762445396)
	id AB47D390019F; Thu, 25 Jun 2026 04:52:54 +0000 (UTC)
From: Sandeep J <Sandeep.J@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Shiva.Komati@windriver.com>, <Randy.MacLeod@windriver.com>,
        Sandeep J
	<Sandeep.J@windriver.com>
Subject: [meta-webserver][PATCH] meta-webserver/README.md: update broken Yocto reference manual URL
Date: Thu, 25 Jun 2026 04:52:54 +0000
Message-ID: <20260625045254.1841772-1-Sandeep.J@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAzOSBTYWx0ZWRfX9nUCqAfo40mg
 1E1i6zR3cUgT6uw9ABOBlu0I0ziNAmwtokgtRMf21knuQYhpX4bdpAbR3LXGUJWTUJ4lwMeQAlR
 Xjyt9Q3DVucsScKqdTRqL5+BdAlljCkWrOW4ij9ULEfGoT0SbgZh+9sskdkZf3OF+dIfhE+wfMD
 G8A8Q5lG20FtqOOE90xDngZ9Y2tn8my3Sff7IO2ltpNmLZgZRZSq49nBHcD9hSbc6UNk/SrBbjF
 iPbAL03b5/G80qWHKKrJ/+r0JKi/DynR6b3aj7Kx26YzcLRoOlk3d1OEx+lJCOw04AN2QG0uEvT
 M60q02BHE1KsLme11n6xL1bni/edoCZEeBYSCHz2baaKQwNDN3JZ8Bcz69RzwH3Homx3GoVcps4
 n1DpcNNHCF2BYhIpHYnK4XsUjS+HHXB0MN1q1RIJAIdlSFcSt4v3Qp0NP2fil/mSw1jz+AjgBGg
 1+rKlrhe73qmXcyMZCg==
X-Proofpoint-GUID: h2jspWavXXwCcY_CLhea_DQQTkw4KFHO
X-Proofpoint-ORIG-GUID: h2jspWavXXwCcY_CLhea_DQQTkw4KFHO
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a3cb428 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8
 a=HPCHruN68qoECyIU7zUA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAzOSBTYWx0ZWRfX/2wCKjjIdzC/
 +MZbb91hyTwDAiFgvQ7jE+H2Rw8+CXqwYSMN0E7AoKwnyxa4t83y7EkXoZ16RDEre47llPkW8CR
 nRFr2w8jkuXY8hwSWoXnDdNm6edIY0Ah3IH43hDUsddfBvx0lsuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 04:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127732

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

