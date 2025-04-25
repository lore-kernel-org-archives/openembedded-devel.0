Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEAEC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 09:49:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3298.1745574570461739803
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 02:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=621007b6a8=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P4AVVx021935
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 09:49:29 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh63jfp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 09:49:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 25 Apr 2025 02:49:28 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 25 Apr 2025 02:49:28 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/2] ptest-packagelists-meta-python.inc: Add python3-pykickstart
Date: Fri, 25 Apr 2025 17:49:26 +0800
Message-ID: <20250425094926.151102-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425094926.151102-1-mingli.yu@eng.windriver.com>
References: <20250425094926.151102-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Mr5sVEOEXsL2v8LkdFMVsx9NuHt8BHsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfXwkF1d/Xj4a8j GB+GMpZ53pD9LukKm28jR5ZKJOlHUkue3/H6nBysIEhTs9qlvXBH20TyvoBYiaknVh9ofLU0z7N owJdUkFzngP6COP+utuRuoEL5LxY2UrwIoac3AlUHxH5GrdxXGt+AVbfGcwn2pDBIwo2zmwzHLn
 bqTnjHrisMq3ewl0p+MME93tgor7D0gB/0rqZPtJTbpKGeWGyU7YaqUOHUIMwOZtqZcIsoA1s0X CdnVI2PF1OtYGVRPW9i5gK1Zyi9T+O6N/IblqXwNqUSOs0JkOe2/5dAEN7WCHIQVaikP3Fbfot3 etQLasROrTYnny+//a31QwE7c3HAT2VwBNKtroIplBdkoh6Gho7f3svxl8DXLq9I/J27jhikokW
 F4FWMTvLqNOZHMm/qWqI2xeChDP3H0L448N/yuh+TzHyC5m0BDFYcWIoCPMp44p/lH/Xo6TM
X-Authority-Analysis: v=2.4 cv=Lu+Symdc c=1 sm=1 tr=0 ts=680b5aa9 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=5qBrznAP3dz6ixwHqT4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Mr5sVEOEXsL2v8LkdFMVsx9NuHt8BHsX
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 09:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117124

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index f6a8129793..a1465dac7c 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -117,6 +117,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-marshmallow \
     python3-pillow \
     python3-pint \
+    python3-pykickstart \
     python3-pytest-localserver \
     python3-scrypt \
     python3-traitlets \
-- 
2.34.1


