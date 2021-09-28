Return-Path: <ckalluri@xilinx.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CC8C433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 02:49:43 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.63])
 by mx.groups.io with SMTP id smtpd.web08.8783.1632797381544972376
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 19:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com
 header.s=selector2-xilinx-onmicrosoft-com header.b=Xr1lKR9r;
 spf=pass (domain: xilinx.com, ip: 40.107.96.63,
 mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFzBnyHl/LgRqF6s5PEn6fhvorBX+IeGQvnh9J7LRZkVF5US2NWkf9hMgnhuOGDQhMko8pvkJVUXM2oBUgux95h+M1ojjRx4QLhO1kLPyllEgTqB5Gwj6FZdHoApz6IZADPVlLuMLLLc2RY+iQPll7bZ4Kc7Jw/8mZmMsBwJqgzgm31AhVuLclx8EnWwT4hJ9EX3dwX8TJF5dKN2p1tYeowIkC2D1eRLWm+j4XOCIDGrRDo46Zoge8vACTRoHQN/GgXu+Ou0FQ0PHQmW6sKLYla0pVowG7Bsd+VRFe6ogowgw2rEN+xe40lw2klepYylOjXeNDjPYhm094tqnaYicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xmOlYsX4M4UcTkXgvDtLy5cb3ejKKn0bYfAKNSsW2z4=;
 b=NXbQ3WfZ/WBRLT+6A4Sh3jXDM08nMgAUX4WzKe46bvDErIXKjtFcZydn6H51yLkeJ1B5oxXVjWv37UEo+DfuffT9Tgq5SUIZH57lWZXoGSxsl/USnwyVlApADM3nVEYqPBjIPqOUNI4GyFmJdl6YuW+n0/L1TPa1r0dRohMR6qjED1Tc4RbZ0xwv4BLu/bZ5VOPqQlUlrHgLjV4eUfXr/AtXpq4/0iUcauFvGk9TYVWPvPvHITkQOOxYHb/4xYO0Z/jiEfAii3aOnb4jQTpBP1beGHuIW0qZGQu7s6r371cJ+0wnxys+72ZzMnyEQ/w8Qkm6tsFROUjfzVEdZB69Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmOlYsX4M4UcTkXgvDtLy5cb3ejKKn0bYfAKNSsW2z4=;
 b=Xr1lKR9roe380Z2/5by0DIRAcjtDBuzt5I0AciIIF9+TpIYYddIHkQVMzfy/xKPg/UhEDsZXYiwHjFdmk5BmnFSD431HZtRu4iynAZgtcoX0ZdYv8k1X98OAGE/s7KbgMQZN/hjqj49tU+ULTR/T8jT83q/NaX6nDQ8PWERddrE=
Received: from BN6PR17CA0013.namprd17.prod.outlook.com (2603:10b6:404:65::23)
 by BYAPR02MB5830.namprd02.prod.outlook.com (2603:10b6:a03:122::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Tue, 28 Sep
 2021 02:49:39 +0000
Received: from BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:65:cafe::2a) by BN6PR17CA0013.outlook.office365.com
 (2603:10b6:404:65::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Tue, 28 Sep 2021 02:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT051.mail.protection.outlook.com (10.13.2.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 02:49:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 27 Sep 2021 19:49:37 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 27 Sep 2021 19:49:37 -0700
Envelope-to: openembedded-devel@lists.openembedded.org
Received: from [172.19.2.12] (port=41598 helo=xsjckalluri50.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1mV3BZ-0004P7-Lq; Mon, 27 Sep 2021 19:49:37 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [oe][meta-python][PATCH] python3-humanfriendly: Add nativesdk to
 BBCLASSEXTEND
Date: Mon, 27 Sep 2021 19:49:36 -0700
Message-ID: <1632797376-32747-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e95e3761-2dba-4100-dfb1-08d9822a9d84
X-MS-TrafficTypeDiagnostic: BYAPR02MB5830:
X-Microsoft-Antispam-PRVS: 
	<BYAPR02MB5830ABC37CD7DEE98BE75E87B0A89@BYAPR02MB5830.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wABpuDWZn+k/7UcHwCtBjj+KX+6MdmB1k3UOm8UwmKyvoPnIpiAjwHMvk9Q0gNU351/K2AuIULRKgd5q+b0vgOvtRmiw5Sb4H5hv/BSaS8WZo4jXxPONxYeNNMiyczEUCYQ01/LXv4wWyUB/McxMKZu9NxAulJ7BQqMeX9Gkgc41J1m2RsPflTNHy3LVFQsrrUfgirgogfFejhpflCvQDWQTBneQIUafKfiYM6OJqADBGTSgnZmzAFbctza0PJR+SH7GjO59vp2UEHKZFdxidrKRa7Iv0YIPfIlJsJGDZpBe6p5z9FcIBNQT8MC26/H/r3ncRJycptqd2kkhDPrPb0+cTx24ttVFGACbeyc7sAbh66+28bMBQ4xLXSBbbkWdopgMDK9tVEc1/iVsPLgvn0lep3EXwLH+9nPXYEBuEdKuZeD0WqCMktHnz0cSNhsBgjjnfXrNyrL687HitgUq8TxgaAMR8PcggC8s8Y9jLuXtLlySuBJ/Iybb9MLaBeJHraaWOrel2DvTTHZUf4Fk/0Rs8ik+aX1jVSWPvtZhgnLPHNEtNBifVd6fjgsYfPYWDfLvcFqIqDolq6kp1kKsFOcsgV2hEv38tYu/a3tBkDxbvoc+oZPldu6QaJZbcgUNHx0DvjMu8iQ0PLqxrTtNu7I2YFH84rIdz+ot1zUpx4SY7wpCv5pz3PPvIUxlMn6BXTjxFg3k9QfgiE8bx/Pbr6c20ZojgUxfZ5sOHyhTBZA=
X-Forefront-Antispam-Report: 
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(9786002)(5660300002)(426003)(4744005)(336012)(4326008)(26005)(6916009)(508600001)(186003)(36756003)(7696005)(2616005)(8936002)(70586007)(70206006)(8676002)(36906005)(7636003)(83380400001)(2906002)(82310400003)(36860700001)(356005)(107886003)(316002)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 02:49:39.1204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e95e3761-2dba-4100-dfb1-08d9822a9d84
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5830
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Sep 2021 02:49:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93159

Add nativesdk to BBCLASSEXTEND to enable recipes that produce files intended
for host portion the SDK

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
index d87ed4d..e4b9e88 100644
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-stringold \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


