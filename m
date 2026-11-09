Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1913.1794212303142857762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 00:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=0DAp8DH4;
 spf=pass (domain: topic.nl, ip: 40.107.159.82, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ffz+Eb97ls4WvWRLL/2L6v3y3ohWFW9VN8KFMBM7wyJS/E0aXY40zFi7X1G9Q/Dx9E6RsYdfZT2jDON4JNxoOPuanoufQrS0pakHGb1IBXcZS5AbOQaiuHmpFvJyp2c/3RbvfPzzLtzDr2bF8OwiugjU48NDS9hb0GAVpmWNCtK75cVuUcaar054AYShRY3ZTDPwmHOvalZFss5JtYpfkYIOY4JSv8aW+SD0kpUPFNtI9mavkXNUba5VEfW3RZDWBwMLtwoYSPdTrn7c3O8hnqmmqiBQWJUqWUTjzOfpMgKtqE3WIC4ml/a0gV5rGDX3zo7I+msUA6R9Nrb3u7iiUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gi74AaMX2K6sJOY9XZ3DChu8u3xOUGEn9ZCunvLJvGE=;
 b=Eow5ZsOCjwVElR7/lZsPoXNOSujQ6uUR8dV/XT1s7+aOjEcKPU8/fK+xze0kTgcwVm4jAtfd59agxS7YOhraMaN7zBV93J8QHHBOkhGaeQQqZjg6Efh0kgfJ1wrpaKphCiAZa6nnG1BuQhCVEiTlA61TvDXfoGnR+CyEJrNpXsHIRkqifGrZlbVJcKx9N+SSRuouTgZa2QVlAqDR27USH32lkWjZoR4ccR6tZXjBp0cz3vi2/LOtBK7MZIewijIysB/R2IprhCGRDe8mtQoS9M2Yg6fdklEDd5KDsqbyI5p/RKkFKl5r3BaO5yQxWau2optWlNfkTgzGtVrnL/scGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gi74AaMX2K6sJOY9XZ3DChu8u3xOUGEn9ZCunvLJvGE=;
 b=0DAp8DH4Mv0VOmlPwDoyWvP/9Uk6Myk0Cw2GFqmOZ2y85bFRtwY908i7xZHM/d+ZjreizoLZRIMat/f1olWJWAxTlw0N64Z2L+dwfeOHS2ke6/6pUjnMU4ml9W0heI9O8RDol5vu3MIEokq8KJesybiakTxUbBG5fB+h5JKxOYINIj5lRAAXdkozgONfsKnw7Mh+SvnGMxFee9fo/+DbBxvUgziL/0ioC7xpIuL71Xg9nGMHPK3qMpJplH/FNSr5F+tHp+OtUzT74Z2aQvByMjvXqCvMokG+Dy47a8KuBPR0xrV1ZTMh2IilnKWPvB+lXNKe/nwHw4i1QAQqJSTGaA==
Received: from PAZP264CA0055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fd::7)
 by GV2PR04MB12190.eurprd04.prod.outlook.com (2603:10a6:150:338::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 08:18:14 +0000
Received: from MI3PEPF0000855C.eurprd05.prod.outlook.com
 (2603:10a6:102:1fd:cafe::a3) by PAZP264CA0055.outlook.office365.com
 (2603:10a6:102:1fd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 08:18:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 MI3PEPF0000855C.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 08:18:13 +0000
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.50) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 09 Nov 2026 08:18:12 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by DB9PR04MB9892.eurprd04.prod.outlook.com
 (2603:10a6:10:4ec::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 08:18:06 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 08:18:06 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
CC: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 0/4] Apply the mongodb patches from the scarthgap branch, which is ahead
Date: Mon, 9 Nov 2026 09:17:49 +0100
Message-ID: <20261109081800.69803-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::6) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Return-Path: mike.looijmans@topic.nl
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR04MB12030:EE_|DB9PR04MB9892:EE_|MI3PEPF0000855C:EE_|GV2PR04MB12190:EE_
X-MS-Office365-Filtering-Correlation-Id: 4925ad2e-6c19-42e7-3116-08df3e39ffca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|18002099003|10067099003|261028144727099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|56012099006|261026140227099003|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original: U/Fqxz9lzFmX7d5BVfxD7352/7qqQfAoW6iJ8LxV8Hlb6pn+TX8nkmvBgFInqF1eOC/shi+5lQmS/8vFxYQB2uVu9JEZxldNROp0z8p2HzVZhkmGKqT+Y5qEUB9tY0UN03Ff9hZt0il1OJqCvRkwssUdwT8rYLmG25uc6O+ooDCt0xho78FVaHjGOpBsty7GP7LBbnJ7IT9uD79jKluJtmv6It4MVnnTcheUD4HFaJk+LDKHy/QhhpMpFb25lemWxxGaN2YyCS+M9SuOPMF75obM1Q0K4/RA4dsmYQOnwNy7d+X1eYOLCQeiGMd9JnczVvd2omtZ2niOr/jJw6/j8dGBGNDjRrL0Z+uLdadZnkgQkvM1YuWT5x6UYQmJo04POXdGiC7Ay/Ol/i1yYB3U1RgCFBW9kqfQknr2DT+xJRTwTPqCmqdYPv5hiOu0+xhaQKa8a+06tsFvD4GyUZykszfkv1LidQyvCvIMl3/0NM4ytbWAM28WP+JjJZA9jALaA0HciDOeggGSFdm30gnETY/q6a5equzXiAk0aHKIjBX5niyFNFIIt9bUWe5+t6Cn+jJ+Lw6mIieFoXuaSAdbGgulTUcXJ58S78CIFQAnWROeQWajWMjPETyu/nIyqvxSHarb8Zck1LSIMyq7AvLbTwIVy4J5eDtIQHG2SLPkUB8aNJAdUX55S23IjUCWqBlYEMVj3KhPNNMnJ506ZlB2Ci6zowRl/5KeJirol5FjQ8E=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(18002099003)(10067099003)(261028144727099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(56012099006)(261026140227099003)(261009223027099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: 1BIObB+DffQWNxvTaLAKFXZeTjQXQCBym9mREwiNusG4AhFeR6Ybn732Tg8+ucCzmnC5bVybIDOgYeAKm0dA7ZzT2LLON0O0K6yH73/lvm3MHNGPZSQFT1wM2Av074RuSLhDF1Vjq3M3QGkbW6MJ56P2QiyEiyOJxfphNV8DptxEm8Igxsjd8WSiLN1PixWwc1UQrrYCbKyxZNoEbC6wnINjrwLOu1riXtCNkIQ6Z+/RAROyQ1vCILCIN4p9PyKyAzYO+BFGErmHDvl+dSDRx3SibRZ63WtmAw2lRL78QNy9jQzrxZympQQ5F6MMQPoJt9wEWNLUSGLH2oHQ4sOl4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9892
X-CodeTwo-MessageID: aa942ab7-d074-4241-877b-a9b235bb89f0.20261109081812@westeu11-emailsignatures-cloud.codetwo.com
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.60c45970-bf59-4753-942e-e3561e9c5a75@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MI3PEPF0000855C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a1fc8669-b838-442e-bb60-08df3e39fb6e
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|376014|23010399003|36860700016|1800799024|82310400026|56012099006|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: dfGXft7joOBstEhDTHtyf8k5f5ftEyhFOdVVMqAOu5MQbEjoVxRNvI38uB1Vg98PTmAi2s5/XjLUoFFMhBHGbAKMQlfvAJZSnZlNaPB6y7Da0lnFAOTQvyb6ZxVpEQORHN0K7T4XN89ccdwB+WlE1MBTZ6p5iqulL5i7ChJYcdeO+qh18nO1Ipr4EpTdetn9q3os1Z+oYF/gH6BkybrA9x5of2bPvCjZKpN9sTAIrCUSLtgrOKWbo/n7kpcGGJ1t+06AfwDoNLGU8qCqBNwG/62JFWfTPxmHugUbxK4n4R/1Q5GhgHf9jrJb/LtIthcthqWhZXKYvP2TKNpB2VCGvegdnMFGWdEXvGIRuga7ZI+G+IwYze7aNcid/PK4ZrzALXIMdrEbIHktZgfjeBVmsMLpT91e+KzT3T8VEjWRu6B85BxgwGdFzRryocVY3xmB9bmA5O4CPOKYgy5JB/Z3Qv2CWUeclerH+zPjpIxcHCPiZepT/ygmABS/I1PHfmVannPsznT4W3pr8NTTF25vzjYQ2fGKFDS6gBxYbOkjvjktwcsOUHSisZw1hO3vovVs9WMrvN9drNBtoGCIeO5+i+S1MPmyu7vJm+ATw5Lofmiy8dvKLMEj//J9ELBXytkppZBG0pUbO+l4aNgBxfqsZA==
X-Forefront-Antispam-Report: CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O58dlGbut2L7G7+7uWiUTjfe++8DbkG8K2/M+43h6a6Kydv9boPzI4c14xl/dlGfcvfVDx6zZFemRmpVqyoBTos7R14o2i7vG+6BUlM62yoJbV16CLhGWvALwg1Yi5vNzTEqQwDNcWdNmixzXJPeM/RwxsiBSrkM5/wzxBi+1Gpr+aCXVnn55eq7xHQvvgFPqXnrYgy6lBCO84HpwBSIeaH1Z+rZouZrljS2phUwfLQV/pYoyJ6tvxhT0HWkBLrO6NSKvkuNL5wZNe7s5u4aSSKkrQesjvOvYIOkFDU6MctPM4zYI3XrW0Os3YLNrGoAutgPNrQtoVLSTZCr5FRMXucaPqfJKCMZY612GKW/NphwvUExHCcFShyw2e0GoDlTmRjMeT+sK90CJEtvCTxRuKfUDenbS5ItW0Fvm5dqCtHl8nmpRgXA2QK8QPAQTFKL
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 08:18:13.4879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4925ad2e-6c19-42e7-3116-08df3e39ffca
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000855C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12190
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 08:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132053
Content-Type: text/plain; charset="utf-8"

of the current state and was apparently lost in master.

As wrynose introduces new build issues, this still won't build yet.


Awais Belal (2):
  mongodb: fix build with python 3.12
  mongodb: update to 4.4.29

Gyorgy Sarvari (2):
  mongodb: upgrade 4.4.29 -> 4.4.30
  mongodb: ignore CVE-2025-14911

 ...001-free_mon-Include-missing-cstdint.patch | 28 ---------
 ...econfig.py-python-3.12-compatibility.patch | 57 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        | 11 ++--
 3 files changed, 62 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/=
mongodb/0001-free_mon-Include-missing-cstdint.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/=
mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch

---
base-commit: c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e
branch: wrynose-mongodb

--=20
2.43.0


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
