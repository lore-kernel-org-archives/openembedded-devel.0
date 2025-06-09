Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2116DC61DB2
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 07:02:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.53436.1749452567588539417
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 00:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82555dc36a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5596J8ke021323
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Jun 2025 00:02:47 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm16a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 00:02:47 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 9 Jun 2025 00:02:46 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 9 Jun 2025 00:02:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] Correct recipe version to 1.64.4
Date: Mon, 9 Jun 2025 15:02:44 +0800
Message-ID: <20250609070244.111198-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pqBmsolEBQ4VKPV9TDhDWk63HOgx1VWF
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=68468717 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=1RAi-bJbzlqI2x5tJiIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA1NCBTYWx0ZWRfX92NhH2pE+3aU YHiKhtN+OdlVvbc9AGBtHbTg0ut9nTihx//fDFGey/HAteAa98tRWCXQA7RMYTQ2IXazr8WmYe9 GB9O4sBki4xpygV/0snsSp62TFIzY4z0lgMytb+I2dDsPdeVgnOskzGP1Jw+oJE6a5Lwvwihx3Y
 yKvSY5N8eDe1TGxfxZhxrgi5e90qsgllyMSfBn78nILFXOq55CD1gbK1rSHgjcdgnwAgG84CElS pnZBlGRatSLkjSd2rJPYmMTzgj/bWUTQ7XvubAeBsiarJYdRB6lxQDe/IuXH1qqifJCVpYrgsrm u8isUrI1eC3lV8EMeF3qxf9AVHmzLP/EkL4Ypq6qsvWZLbC/FfGihukiQwAs20ceWGN/r9NXFZq
 y0TXEdymv+5EQVIYV4F+LVe0VMDQfB9XbCwZbr7qlEEBRjb5ehicGRmH0DMHflD36jlcFgYF
X-Proofpoint-ORIG-GUID: pqBmsolEBQ4VKPV9TDhDWk63HOgx1VWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506090054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 07:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117781

Bump up minor version to 4 to follow the output of command
'xmlrpc-c-config  --version'

root@intel-x86-64:~# xmlrpc-c-config  --version
1.60.4

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../xmlrpc-c/{xmlrpc-c_1.64.0.bb => xmlrpc-c_1.64.4.bb}           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-devtools/xmlrpc-c/{xmlrpc-c_1.64.0.bb => xmlrpc-c_1.64.4.bb} (100%)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.4.bb
similarity index 100%
rename from meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
rename to meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.4.bb
-- 
2.34.1


