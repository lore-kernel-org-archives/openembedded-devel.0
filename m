Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8539.1792579595400692147
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=kl287rgl;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=Atw9xaT5;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69LA5VPZ1201893;
	Wed, 21 Oct 2026 05:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=m9uuvcrQWs2BB
	yuzyLiNAH6G1UzY21mV8Ll7HDaEcUw=; b=kl287rglKS0RCO/9snezNd8WOoxQ6
	mkjHFpmDJNmcnFei8xZ4zGr6oirx/NL9JDhKLYlUuoDPLwmy6LSk7TN7wPg++TiL
	GzNEbqCSX4liQOF/OWt7BEZ6/ak3XhZe1Q/jSaNKR1ElkdRuQRxX+onIN4NSqba6
	3foHfiLACGk3mNxsX+qwkHbpVdzppYkU9lNWpcUWl9SxNLjXuw7CmvTcTnZt96Xf
	4L4nMxcdMxuRx02iv/O0GSSAl6Dsn6H/oEo2bKIV5xCiTVmfNEgkMys4P1hAYxl+
	QECz59S7vvhhGFKiib++q/ufRIPkHD/cCGM/dxu7MGWn9f1V4JzlPzXbg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012056.outbound.protection.outlook.com [40.93.195.56])
	by m0380145.ppops.net (PPS) with ESMTPS id 4he9376h6f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 05:46:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyXG4qOYyS3DhOGHU1nM82LAASUThS4FWW+uV8SM5jCSZz+6/7v3HA7j2+4AF1El30A+CY6/JGh+MkRXVquDzRTkLeVuPY4OsNTPZo71T+pZOWSTI0h3OcInZITgXa6YSFMeHd7z/li6YmGcIPZaV9APzUHQdnS34uJYMI57OFNn8djBFUGC2AQaIXC6aRDcPWKLvd4xclNjCjyB5rmZ7M0xiE4M4Jbc/nwQqMF3LCCljHUuq/6H+XqtyqK6//JRvtcdlq+D4EVg7dSajnvBy3yj4OKxFKHxU8gdZYm2rUqX8rRfzgcSYEDZZg71P1Y5ju2FOyJHC2/Fv0+hL0n3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9uuvcrQWs2BByuzyLiNAH6G1UzY21mV8Ll7HDaEcUw=;
 b=KOpFeVCgXPrFZzAZgGBFPmiQ7+VOudZqDms9NAE+fHZajk71hgybh/m7Y4Ob2pZVtvQ8R0b9GeVuQe6I3vWnqvI5O6HSp42Bdep8t/jSv63ND/wvuTlyWuftIbsgyI1ZSpRL8LBoQcw+Yv5Pbir1GBTJX5DJsYZeZV3QdSA2sctYFPtes34q2Dl3AanKjGJZcCcZ+9EExGu0CGYaNOwXpYSpe1kb8XJ/YKp5asgiI/KdDF+Ay787mxkFH/0Pyl1Hs2O4ZN6MLqCXEO1IOvc3umi5uSnH7h4S9+Ra4b/cSussAIff34y/nFfdaQ+1x1A2akIRGeSC5HzmcAGfS1NZpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9uuvcrQWs2BByuzyLiNAH6G1UzY21mV8Ll7HDaEcUw=;
 b=Atw9xaT5nran2VA50GXwuIHdDuD683zs5y4Gl1B3dQTJb/wxNtgObb3j99oQAJKySmij6g1kEf/q90go3gFuyq/HovC0JNBGz1Z6bmeC8rkeYdmNS2bDrIM17nb+Wrz8Pi25TqKe4JekmX1M6iUgPQNFUNy8/SokdpYWGXSbpoQ=
Received: from BN9PR03CA0055.namprd03.prod.outlook.com (2603:10b6:408:fb::30)
 by IA6PR10MB997682.namprd10.prod.outlook.com (2603:10b6:208:5dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 10:46:28 +0000
Received: from BN5PEPF0004698E.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::12) by BN9PR03CA0055.outlook.office365.com
 (2603:10b6:408:fb::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 21 Oct 2026 10:46:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN5PEPF0004698E.mail.protection.outlook.com (10.167.245.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 10:46:27 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 05:46:13 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 05:46:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 05:46:13 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LAkBNE2448222;
	Wed, 21 Oct 2026 05:46:12 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <v-singh1@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-sahu@ti.com>,
        <denis@denix.org>, <y-hegde@ti.com>, Paresh Bhagat <p-bhagat@ti.com>
Subject: [meta-multimedia][master][PATCH] wireplumber: enable systemd service
Date: Wed, 21 Oct 2026 16:15:57 +0530
Message-ID: <20261021104557.1975164-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698E:EE_|IA6PR10MB997682:EE_
X-MS-Office365-Filtering-Correlation-Id: 56df34b8-9818-473d-6e5c-08df2f608f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|18002099003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 49x579Ux5Rj9orisKtApScBsqyijlkLvZj87fS3H65o/WV+97Ud5bdDwlapoO2tGrqWZPoMIWYu2dl1b/o3Eogyyt5kwcd1JM5r28lAUwI3xmh6HgVYFF+ing75TevZ4BVLTN7BON8Wx3lm/nQJSgnEQIDdo+SwJYbfmVKMu1JcDS8/E4Ab2lfas+ckG6lqtxvZsssf2EtOjCAHvMhXFZ6ezOm6eB+J4pQQIXW5zsy34QPlbNF0WxSdPgMoLcE+/4dYJwT4IYbRHu3b4P6cilYriOMMzBYCHl+KGd0xjX54auFvI5Cp3ZnIdeSCd4hOlOZhXB5UgWcBdO0uuFFDHk74qFRQen4wrppUZWo6uvghu5xvA332X1rDz//RBzk8BgWFF2G3JZ4/iyjgaTZ/cRFioMBOxQhUnwLSiL6VB4RLQq3Tx7pUWm698u+vw7gc3CCKOEuxXu/8Fc8z0mYZMfoJKg67B9wKyY3CslI2P57LGF4i7+GV6SLG06SIoysqL2SCbGAFTliUeXCCydgUs377TRziUQ69nVx9wWOFUoUWIZG6gZUAtwFsFemDHtx7nkSGcRmEKBNyY2hhyplopWs2mPclRgjeI5h2gDoDunfihkXgVpdej7cz3NTwIjLs6hEWhoJB/Vtuxm53EBc90ConoMCmZPZMftqxPMltCxqDKIW3x8Uk4Id9mULHUd9RtRXadF60cjAjtsIM19xS+BA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(18002099003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mpLTfgtPMzs0bc57t/SYFv6/A0PU/n4rdhnF0aKSOeqfR4ZEZsAWqwS/EHs3uOzwK0QyYMHGXV2eVvEHGqMHaRC13aJ7JtRaQpEsDI8nLoxU1jTCO2iBBjrOnZ7WHgjqobGFBy7xtuVu+Wa2B8l8zZGF/iHx1l/8qooOWT0bu9yH8e4yD0NFegANfZKgGeYEgQJ+1vwxJUwTTW4o7ice/bhixGojCGR+6ORabGRjKenuPnafp/3Tfw6suuFvg9w4JJ6WSVRiwXc+LYjxYumKws2NmU8JI5AARESaLFuZ5YX0agbsazzgykvTuc+aLbRuccveu9V7N+yOemxNyWXTZjZiwti5ywG52z+/otkDz73zize4xxoaHNycT/g0vW5ALyAw1akvU6nNoVTLGAchbnze3hb6ZW5WTs/Yuy8Jh2TMOgzMZ+jOWlHHbkqZ2X6U
X-Exchange-RoutingPolicyChecked: vuxOI6mD1gxWLkma3nCSVI1iX090+CKwoUSpIabI/AYK2QpdqHxGujJdK6I8bnC6MAUPIejHw8L1caUzqxdqzuz6cHFICk1HsigxtlnA71O6D81CmYVaoge0HbOVyrLoIh4VBs+quJZXeAu4j3piSDHvh9I5cxAu0bnzYD/dawhfZdsJu4weEM+rxMj8b/x0rmXX8cSoaHC1ZwQ1tqUy4/sYZGJZF4IxVGnEh3VuGxwofKfHJH0/gzA+QcnW+RAnUoXCgK8HoVbXJolaQDOikJZ6X79UumlvNdG9wS4ihNqs3psuOBY81rmWSS/kVFUugR1uuqVNZmuwBY/jCMCE9g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 10:46:27.5948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56df34b8-9818-473d-6e5c-08df2f608f48
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN5PEPF0004698E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997682
X-Authority-Analysis: v=2.4 cv=F5HC5ahN c=1 sm=1 tr=0 ts=6ad89807 cx=c_pps
 a=3QgNZYwUpJBVNtkd9Eusrg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=6wSCqwXe1rLedLWJ1dsA:9
X-Proofpoint-GUID: oI7DAQyvO9246itvQ9ev_J7Pi4rtDwKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX+/NTbPFzbqwi
 EJlfEx6Nil9XdV9ZhMtvJaCkpngvGkE7B8LeBJJm1QAmfDHt+wvRMgMGFWLAbwvzOUDYNUmuA8C
 QsjPrzxrZP4Guaj9y9SiQ/6Or9/Txuv5AtU3nZlcbyjaZ3R/r3VdvZtl1IHi2UMHv1+GexSy0B6
 24AyxNNwWONlOGd/R8OIoMv4EnXIhZVWFGQ0MdQOiU/yNMwku91sXjz1y1a2dCFzmFhNFefqyso
 c51ixDjmHP5TPmdAZ3qbKr7gcKavrXPpt3lI6KWuw3RISSYr+0BkpSDassqxenRQ0e5lfr/3GX2
 vbUEYsfEoIl4ILXA4uS2/yqG7HlczIrKpk+YJu93dMd081MvDyB+RcFlyVWy353b1L5QeGh+62q
 a/17rKvHCvpwXXGj7nS9LSiMc2uOTYAQj/sjk8pHJx5q7ADhbZnOdnXCxVahW5A0Q+PIwHRVgvi
 IN5PEqwA9A9zfkM/OUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX4MHUuAiSv1Os
 l7MI5EXoYEKtm7H+lDj6RaIBQDKRlLFPte1eHHmSRBWbDto3HWldPUw7XweOf45PQ8urPOUWz2q
 In1nvdzRdOqg9FCU5WUhDln0hhdH+ko=
X-Proofpoint-ORIG-GUID: oI7DAQyvO9246itvQ9ev_J7Pi4rtDwKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131259
Content-Type: text/plain; charset="utf-8"

Add SYSTEMD_SERVICE variable to register wireplumber.service with
systemd to enable automatic service startup and management.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-multimedia/wireplumber/wireplumber_0.5.18.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.bb
index 0442c0861d..3b8494d124 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.bb
@@ -164,6 +164,8 @@ RRECOMMENDS:${PN} += "pipewire ${PN}-scripts ${PN}-modules-meta"
 
 FILES:${PN} += "${systemd_user_unitdir} ${systemd_system_unitdir} ${datadir}/zsh"
 
+SYSTEMD_SERVICE:${PN} = "wireplumber.service"
+
 FILES:libwireplumber = " \
     ${libdir}/libwireplumber-*.so.* \
 "
-- 
2.34.1

