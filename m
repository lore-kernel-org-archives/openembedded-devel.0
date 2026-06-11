Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F45CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 21:25:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54549.1781205475865153712
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 12:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O9Eh5eg1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0622d0867b=venkatasainath.ravikanti@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BISIRw375452;
	Thu, 11 Jun 2026 12:17:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=kWMYAQZLZpmAxvn72B1bEN5HEIMSBKa8tichDmibUB4=; b=
	O9Eh5eg1FjVtA3Qrp9F7pYaSA0GqW/nGamZbDZ4/0I5/ftW/+vHxwP/7M59fji4y
	ZQ0nBcXhcmdvHD68kARmfUxqKZduUb3lHeZg6MyiVRnijbsDenJ1tOet/ZqCiTd+
	JPIjaIW0ISCwgJmAlat0kQNzVASX8j2K5Mxt6WXaJNlJCJRzi231PF+U+/o2J+bi
	D//RfZ4j+Bb3J2F1WVFs5nK340kLs22Z2p78VXodb1ejR/XgCNYuPcRclQp4OWUj
	f9XiWvUz2EcwM1s6KSk0V19lvRu5LQEUWC3GZ1JvPOqbmnHZTON62nyhjJdPSJLS
	3AE4OgQx1WIbl9D4qTNRAQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7ahqxd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 11 Jun 2026 12:17:50 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 11 Jun 2026 12:17:49 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 11 Jun 2026 12:17:49 -0700
From: "Ravikanti, Venkatasainath" <Venkatasainath.Ravikanti@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <khem.raj@oss.qualcomm.com>,
        <li.zhou@windriver.com>, <wangmy@fujitsu.com>,
        <venkatasainath.ravikanti@windriver.com>
Subject: [meta-oe][wrynose][PATCH 1/2] haveged: upgrade 1.9.19 -> 1.9.20
Date: Thu, 11 Jun 2026 19:17:48 +0000
Message-ID: <20260611191749.2897262-2-venkatasainath.ravikanti@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611191749.2897262-1-venkatasainath.ravikanti@windriver.com>
References: <20260611191749.2897262-1-venkatasainath.ravikanti@windriver.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 77pJkfsbtffBPNvUbSkqzDhQYPDcKlgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5MyBTYWx0ZWRfXzOm+ALReM3zo
 ohkr5uTHffFi8CbpH5z+2og938QUPQnp+hRlUpow55cmHuIj9vK06QutiDqcjFGWkQYL521vb51
 0Sn+8Obk5wFBd3iy9uxhzqWPMCqv4g6hyzPO1yLVS85O8OxB5248vgSaW6zVfDyveXKJ+/gC/DQ
 +PAR8STz4HzDQTqMvhHLdwUgIwec2nzSYiXfjh6reCPgfXgWudl5bssJv22SUC1pxrXMqACERR4
 04iplQE1OTF3idLPMA7c9vi/uzBpo7Lklk+ORsn0R95miocetOxORzT+c9T83XnADg/9f+KIzhw
 obA5USk2rv3bQ9F/XGTPQNSjKY167IfOS+oUNKlc12XAFmxnowk8EM4IYcvcImSO9ztr9U28NH1
 G935tBDhVVD3AR1e6TRDcG0tojczv0BLrzy/M2jyPhaZQ++lbkRG1jkONO6f7J2G05ZJ7dHsDW5
 LsJey/dspfaQnw3y7vA==
X-Proofpoint-GUID: 77pJkfsbtffBPNvUbSkqzDhQYPDcKlgJ
X-Authority-Analysis: v=2.4 cv=P+cKQCAu c=1 sm=1 tr=0 ts=6a2b09de cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=8nEx1NFfAAAA:20 a=kh0PQnTzAAAA:8 a=t7CeM3EgAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=xSd44BTG_p2soQ2pMy4A:9
 a=4Y7iCZ2k6v-lWCGmfGXo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5MyBTYWx0ZWRfX9bZLjlawSESZ
 7hT3Flsnf5rnuicYlqOENCoqPN7rMbKNp8QaWGxuKyCB4rJgRELIEB7CnrWoU1pn4CaSGFcvy5S
 tJL5C2hO+4wb8PPmpzCdb2e4fSV9ETstVDr1xM1jomUZuVNlIw6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110193
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 21:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127539

From: Li Zhou <li.zhou@windriver.com>

ChangeLog:
https://github.com/jirka-h/haveged/releases/tag/v1.9.20

Signed-off-by: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>
---
 .../haveged/{haveged_1.9.19.bb => haveged_1.9.20.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.19.bb => haveged_1.9.20.bb} (94%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
similarity index 94%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
index 69de5628c4..2ea12b3977 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "0ef7dd915ee8be4ca2bb10b5cc2bee92b8ede61d"
+SRCREV = "e2d96806273caa9ce7457e2f8669a3c40517ca27"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
 "
 
-- 
2.54.0


