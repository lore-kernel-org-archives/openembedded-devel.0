Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7784.1793603727746850147
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 23:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=Q+h769CC;
 spf=pass (domain: gomspace.com, ip: 52.101.72.141, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2qi0ZtEzJ+FMdRl2JEDBidgt8seYQOcNsuPL5Mw/zRJc+25mRiMJX+Qi0qtQXkag4S2ymC8W6Wg1oMON7GwFw0lIez2DwDQu2ARNS5sK2lWvDrjbr0FlbRT42b2Qim/j2GjTFyRlh2p9fhaFWrx8yTu1d7+Z9IUDJXKwX/6oiYfjwBhwE8+go3ZvnCZHRGuicjfMBP2v00W6qrq2xzvYYKsGbWSaOW5F0aeT/2svUTUW9+ICW5KujvqTRM2ofrLv1LMUTpa1FA7J3gSDJNd+IBjbrQuvG6jbr0D8OMRnAxMEX07Ck0PVqa/wZg+B8yxwGl5VGTLz6UrxSNXeLmy+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ope+5LFeh/Sn/CVwqhIyn/P5tnXWqz8/2kwoUItjcT8=;
 b=jT9DGapfMcHZ1AOk03LtQ0Cl8x7HPQ8g9wZwn+TgvyUibREPQ+/fo8H8IQqhM6KD7qTPG3xSI4I3ONSNl7i5Aj62UvrOuQumX2+tQukwCNkrucAEOlpfreF6mJCs4TJL2fP6kWc9V6tRx8oVqz2xTTltML1Us8lcgtgwLKyMQIGoXahyMrfbJbNB1i7xX7TptNmXXvVMoL09hD+tYuTVjkLUwjoOBI+b6FAGm2fu0AUxRuOzeoI7t9sJVUVcrwZ6oANdeKUfbDJYnF0wsmBs0w38ZE7w3zfUXuIgeJ4KxTmx7XON0H+UhG8aUUYzbv9bwRvhvLfIGnpLmxk861j6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 77.233.245.163) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=gomspace.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ope+5LFeh/Sn/CVwqhIyn/P5tnXWqz8/2kwoUItjcT8=;
 b=Q+h769CC1Exh9qcLO3utQweGyxiq9MFdqWF0nddIkqslY0mRy/KfTso0a2JUcGD7pcImNigo8rKmjgacxDKfMwk1xux134PWjxOJjg15/Ge/P5EX1s8iXciNaqhqIJvf7eeacae7tZlmOERnKSBBk8GsC6rQ+rd/mYaRtZdtCsc=
Received: from BE1P281CA0321.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:87::18)
 by GVXPR08MB10686.eurprd08.prod.outlook.com (2603:10a6:150:150::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:15:19 +0000
Received: from WA1PEPF00009B3C.eurprd05.prod.outlook.com
 (2603:10a6:b10:87:cafe::61) by BE1P281CA0321.outlook.office365.com
 (2603:10a6:b10:87::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Mon, 2
 Nov 2026 07:15:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 77.233.245.163) smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 77.233.245.163 as permitted sender) receiver=protection.outlook.com;
 client-ip=77.233.245.163; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (77.233.245.163) by
 WA1PEPF00009B3C.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:15:18 +0000
Received: from DK-AAL-EX03.gomspace.lan (10.0.1.61) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 08:15:18 +0100
Received: from ThinkStation-P3.gomspace.lan (10.0.8.56) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 08:15:18 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>, Khem Raj
	<khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/1] spitools: upgrade 1.1.1 -> 1.2.0
Date: Mon, 2 Nov 2026 08:14:30 +0100
Message-ID: <20261102071431.2735305-2-mns@gomspace.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102071431.2735305-1-mns@gomspace.com>
References: <20261102071431.2735305-1-mns@gomspace.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: mns@gomspace.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3C:EE_|GVXPR08MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: f66ef417-7d1f-4bfe-e6bd-08df38b10cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|3023799007|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: RVzbRGitQ/BTCH+5rgKOd37Apr0IQkIbBJNQSZVFYtnLIpIOuSGpES9deKFDTkSHUZEe0W8bDvrl3VIjWo13GzhDQHm+qF5hjR1FR96u+D8XCiHVvuHvB5vH/7kzDTxTN3WiZWeABjqQUEz3UrfZwkGggHHCCuXxXepiImL1G3C6HljrR/+WiEo7EHbwLarIyjQ7PbZdIwZW6fkalj4qXKPEIYb09gVLWh0VjUYgf/XFGYKEXVYQ3EVaG6jSTkq0ZbxNVzb4laDDh5WLrsMjFVGQqq87U4kYBFN0uDtqRdCYu7Cf25IB4V4B+wqhMRxXgehqYi06eI0mokOvD0GQva+shb38RJvEXL0+/CMkYuDlOXleoTvn5K/1ejVWX3sF2unviieWaJrdicfYuvBmx8oljrPjmBOtN49bbqio4rgLvQGf7dhDgGgbh5+zPLDGOmuwT6jI+eCMt5kB4KuZ1MUEudPfAdTmKlUw0uaL1Yc+9BmOAxlaY6gcstEcVTSTfYcI5Kfr+yYeX7U+mKxD4KlisSVFJUWLOc71le/bFilqaOQSvv9dH9L2ch/7zaObCJ3dLllUgOcA2W8r0O6O4B8um1pugB3tGFyhh3PJk8+J/PULjRp1W4h+Jjg2aIauHn+MXoBZP+epCA4YmKVZdoD/DNyiOZofCy4bjnxFh9ADCtdXnNUm1aTxdYLvrYyZ0Tt+pFisjyK6nIRwVumMRA==
X-Forefront-Antispam-Report: CIP:77.233.245.163;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(3023799007)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AToWAwFJPDYBX47XBFlkTb/B/eViRtNjMs5smIwJlFyUCy1sEh0wwC3fXhxRZmWACbgjiJd9GadpRbF9bGkHu8OVLPNlmULBK3uZwfzmrH9ahe7BiT++g9ffGodWH3BenlepdkeOGJvHBahjKW123N+gSIulxJda2ayL3RJGHt48aKrZFZqmHnl94R03LKoL7oC6/dDUy+Ek5ov30mVAc4dGYTeOJT82qoC5B5ZcvmQQbifRZ3U7+/Z7onorX6l7o60vrqBTZgRK5gv8Y0PToIp438YJE791ASc25Mko+eSYRJvcVaygmx7tFI0F5yBpWW8icGYsc0+9uRVyKOP7GfsztnVHuNu5aA1vNtUs6ytxmdtWNEE2rXc2EERgmuTP5T1ZKidmMcoC22fTjFcgya3xVDSzI2ASjPtHAJr/aGY83VKnJsIfCeNLpIbAR/xS
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:15:18.5237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f66ef417-7d1f-4bfe-e6bd-08df38b10cd8
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[77.233.245.163];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF00009B3C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10686
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 07:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131741
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../spitools/{spitools_1.1.1.bb =3D> spitools_1.2.0.bb}         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-support/spitools/{spitools_1.1.1.bb =3D> spitools_1=
.2.0.bb} (86%)

diff --git a/meta-oe/recipes-support/spitools/spitools_1.1.1.bb b/meta-oe/r=
ecipes-support/spitools/spitools_1.2.0.bb
similarity index 86%
rename from meta-oe/recipes-support/spitools/spitools_1.1.1.bb
rename to meta-oe/recipes-support/spitools/spitools_1.2.0.bb
index e2ab0a5d11..d14affa9fe 100644
--- a/meta-oe/recipes-support/spitools/spitools_1.1.1.bb
+++ b/meta-oe/recipes-support/spitools/spitools_1.2.0.bb
@@ -3,10 +3,8 @@ HOMEPAGE =3D "https://github.com/cpb-/spi-tools"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c16666ae6c159876a0ba6309961438=
1"
=20
-SRCREV =3D "74ba65b19e0cf9d1eabd52d17d842200ef901d61"
-
+SRCREV =3D "57a950d2853aeac3e69c4f79873c0ab9930e4f7f"
=20
 SRC_URI =3D "git://github.com/cpb-/spi-tools.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV}"
=20
-
 inherit autotools
--=20
2.55.0

