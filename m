Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05328C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 22:09:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4675.1699913365823339589
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 14:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gRh4IkXr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9681bd899c=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3ADKf4ou026674
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 14:09:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=jO0pA
	oyXr7kr5hqloF/aVddzbZtddzYNTeHrjxETzCo=; b=gRh4IkXrChE7bwXohz+5V
	uHZaT0EfztJtkQ4DvAwKNmh0r8RT97q9nPljbRR9VqCcJBcrDNxz/RmRYgnf6Q8B
	Ufb7UtB/YfTmjvzDQ8glwlDi40/+rityMqTz22FOmmj0GG7kwAoT4rOm2P1GiKT4
	YgKW5v+kWsBugPDwUQFymjQS3qiqBuqpbPwDo2wj5GUE+WvPowP9DX5/a181JwKP
	3GTfjNcU/LLY9QwwL/bhzBLk0QBrOhVGuF9KgdZaM7gg1fzlqr3EZz2TElqbsXDI
	LA9GRnktEkk2zcVtfQ9OI1kaMq9IWJHt7TPd4hPxAKZ9Gqh6ItmDX/R3ZBmRu5W+
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uaa0khr18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 14:09:25 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 14:09:29 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 14:09:29 -0800
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [mickledore][meta-python][PATCH 1/1] python3-pynacl: add RCONFLICTS with python3-nacl
Date: Mon, 13 Nov 2023 14:09:24 -0800
Message-ID: <20231113220924.2770520-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UOT13zgjO3ZYu5ALsYy2Bb2lkv52J21E
X-Proofpoint-GUID: UOT13zgjO3ZYu5ALsYy2Bb2lkv52J21E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_12,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=647 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311130171
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 22:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106686

From: Joe Slater <joe.slater@windriver.com>

python3-nacl is in the meta-virtualization layer.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 74e31e51ffbd52b8864fed4debe7711e3ef4d739)
---
 meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
index 6e53461979..5a8ed131af 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
@@ -10,6 +10,10 @@ PYPI_PACKAGE = "PyNaCl"
 
 inherit pypi python_setuptools_build_meta
 
+# in meta-virtualization layer
+#
+RCONFLICTS:${PN} = "python3-nacl"
+
 DEPENDS += "\
     ${PYTHON_PN}-cffi-native \
     libsodium \
-- 
2.25.1


