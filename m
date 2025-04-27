Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2D2C369D3
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 02:39:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20339.1745721571619328303
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 19:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6212614de0=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53R1oZmO030251
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 02:39:30 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq196py-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 02:39:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sat, 26 Apr 2025 19:39:29 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sat, 26 Apr 2025 19:39:29 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2 2/2] ptest-packagelists-meta-python.inc: Add python3-pykickstart
Date: Sun, 27 Apr 2025 10:39:27 +0800
Message-ID: <20250427023927.2504776-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250427023927.2504776-1-mingli.yu@eng.windriver.com>
References: <20250427023927.2504776-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680d98e2 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=5qBrznAP3dz6ixwHqT4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7ChJemF3rmVB7v9XHlHjCCSfauwzu6zG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDAxOCBTYWx0ZWRfX4HRiqovANOO1 F5rsYnPPUx5VotaTikIJj3YrSVyE451Nt7dsZedw+BRwAyGxQ1wXWbNEs6e+0S/SQV6wDmnmVDA eyDIekaQVxlnPZgvyCjIXNaNs2nPgWPrPEBUQ/4BSojQDXZeDpUbHEhPcwuGrc+3gd/WcZYfiQc
 LCOhpAN6VF7c6pr/WpJywh8v/0952vqcKBckPCwt4Db3Y1f+k/3iDKzEAo3a4hogbsdd4h4Dyg9 ydekT0CSr7OO1Eoyp+M4G4efsCdKJ0iVAzgNzHs9z9WV/GXbrSy84qn6XTd+vJRrrVrLzrxmZbP vRcNZQpFZkDZgcJmNIE+01K9m+lJLvk86vhAUhy0kydf5yDuvKqp9P3k4oLpN/XRKZCppUxi7hJ
 Qmtvmj2Ex5+T7IcSZNHSwdYDtAlEBoRKgoXeVWm8NOKRuuUCrKAHpvcL3DjZfWHRWgJ9RLxf
X-Proofpoint-GUID: 7ChJemF3rmVB7v9XHlHjCCSfauwzu6zG
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504270018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 02:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117156

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


