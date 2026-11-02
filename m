Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.99])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9480.1793613933519970765
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 02:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=oQVZl/uv;
 spf=pass (domain: gomspace.com, ip: 52.101.72.99, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nI+SprbRfWvs3AhdxrxAIWmg6XfLbMiidQ6l+oTrh1ocsCV3MwW9MQSV45abh1SNPeGXmcAJrxIkfsZQD9OB2FDEP2glvotRxnmGoSH0lueG8x6c7aoVoTy5Q0IZrKM2m7CAk34EtSfIYz0fLeYuJ2xtP74C3mzRTvurM+Yc/trCDprhoPLlgmXV/KQrznvgXE04yTThdL2oZ2WpcMrA+pWPNshQuqEjSZ+2Cl0AK4ubTDb/1VwMCfeP6UWrfsnwiQpFMD8XK6iqeF5y/jkf11UyNsZI8i9yj3myH5sLd7L1Iu+b+PR0kYNv17cXjQbOE1RV8dC0l0R8NkKkihPj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+ZfNEfkFOPBlThN2PgNc+x8PzqBVBQwp0TeMkVuwhY=;
 b=HXzJab7r6++xcO25c7vzG5+Cm2rCuYs16u9F5kUYAaS2/TvzozzeONz8mKiDg5Y3u9OVS6z7mTV8q7YG8ls2pKN4sEf/Zxi0rlq9uWOCWO1VbxHihYX/awrfXcxHdQXL2s+m2AM5Aaf5DS9mbsPpXu52vcr9RUPFZXvBOpI9woR0yI+qOzdIKA9Ami3DY+qDNsugh2748rfx9W0wj6eKanWPlpR4qnPKhWQlpOBzV1pjC2nYXDJTTXuFWf/ycqFzCkiCbbkHpMuAV9V607ELojiwdG9i1vfXFWNyB6XrP7mV0A7kbpNYqIEmTFavOlsVwYGoaFh5JsXN19mlU0qAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 77.233.245.163) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=gomspace.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+ZfNEfkFOPBlThN2PgNc+x8PzqBVBQwp0TeMkVuwhY=;
 b=oQVZl/uv+YVr3+G7EGzrQk2ZLmw8VfpAEYnfxe9Vi0CPpRDPHJZhV9+2/+NRuwtIloWvl0/OzvFdkbdemp//H9wOaWjtkqyJCq74p1GtkrUPnySE2gVqeGws1iPJ/JesxKL/mQ5jgYjU5+qLrOYvL5lHiChOLIdz9uv3YmwUXEo=
Received: from DUZPR01CA0327.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::17) by GVXPR08MB7679.eurprd08.prod.outlook.com
 (2603:10a6:150:6f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:05:19 +0000
Received: from MA3PEPF00000408.eurprd04.prod.outlook.com
 (2603:10a6:10:4ba:cafe::58) by DUZPR01CA0327.outlook.office365.com
 (2603:10a6:10:4ba::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 10:05:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 77.233.245.163) smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 77.233.245.163 as permitted sender) receiver=protection.outlook.com;
 client-ip=77.233.245.163; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (77.233.245.163) by
 MA3PEPF00000408.mail.protection.outlook.com (10.167.241.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 10:05:16 +0000
Received: from DK-AAL-EX03.gomspace.lan (10.0.1.61) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 11:05:15 +0100
Received: from ThinkStation-P3.gomspace.lan (10.0.8.56) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 11:05:15 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [blacksail][PATCH 0/1] Backport of spitools 1.2.0 recipe into blacksail branch
Date: Mon, 2 Nov 2026 11:05:01 +0100
Message-ID: <20261102100502.3571949-1-mns@gomspace.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: mns@gomspace.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000408:EE_|GVXPR08MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d4bb66-faf4-46f4-7a86-08df38c8cbaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|261021123027099003|11063799006|56012099006|261009223027099003|261021121427099003|261022075727099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: Ro7iKEiaOIjsd0y7gR1oGGvfphLEz6zU761ULYFY+WnD6BGtAdrb4cO6Cskpze1Rfw3E2fETSXnHHpbhJuIgw37zvifhEVpMIC6UgnqCpn8NZUGz2j2aaZ38ZpS/AUBSvfXAUzUg1YCMn65RmjsN8rN0/QwIz+8QkM+elDViHftBxwMln6hQm/QwocjA16n0Sa115Vzh/BMm1aPLVC60g0S5AilPsjoDeIw4PXd2cjraT8duHRPAMPx/xVzUo94gcXhnOZUJHrFdhjGJB54unfnIMowQOqNEiYPJHKPlFspDvVCJ7LSX5yQAk4xNEkpKT5biQYfm8maEnnV5ZhwZI4+5Wz2m23JF+vOUqQ7XAYNnJN+8CQFfi6IfGjdoHTe8lBNMjwlbyVTzyOPF+kn7NXWoBjrheX67eJuofSSeaqtYWAPeZKsEvbhijc/eD5IaxKdsflUA6hUl1+jfjz20p8w3jtRqTFYESLCN8uqRreRD3cWliFPktqLw0yxjuzwqR1YiorisnH9MrYZiJx/+z2XyDvtUs0t5Z1jsS3JmG9h+i2jNcuKhsoIFFFnEtKzvG3juXr9N2UKMNiO+afOXugWFbwjkMenXWcSAQPlM+SskrOBUmVEKMvJJpoFGkFYyxKm9aHMXpKfuFswGL0w6+uFR4c6t2OHj/3O83wGDV9gXKr0YKWCWg5Y2C1MJA7Dff7oG1CV5EVjK/vnqOK7dqw==
X-Forefront-Antispam-Report: CIP:77.233.245.163;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(261021123027099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022075727099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NDWC7tdo3dzQEQ259nbBnWscoS1NgNCMh8dIPwWYWsgyT2duni1jx+8iQYHUJ8TnCq3jKeCGynxCQQ3lZNtixKOL1KYO0zYAe9ZVWVc7EcDIxcKneK6gQ6VB3OhVZsBYl9+rxORnLE1ord8LPltqtISSBAi0EngTW4D4tWfkilaGqWYA/mg2urBYoiqy3oZroFe5Ln0VevlZyYBCJ5NUYg9sTGV5FiEVTMdyNOwC6iVMmfq44LjG57R9g21TfZRn/9I2lJz9kFQMNvEJ+lokPiXJJPLJVgRyTsZ3ixYuWW8e/bu7M/bYSRwiPVZ251AolA+3WdLlHXZblDeqEnNNk3XfWYsLHZOivNY6zKrEVilThGo/kcNuRun1BE/gpd8bZUNKgJ/mBgtZnN4nuX0GiUD/DZO0wLA50ce4z4re2KxFVpTmLKzObPiHheZ8Uloq
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:05:16.9690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d4bb66-faf4-46f4-7a86-08df38c8cbaa
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[77.233.245.163];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: MA3PEPF00000408.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7679
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 10:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131746
Content-Type: text/plain; charset="utf-8"

As indicated through https://github.com/cpb-/spi-tools/issues/36 a
regression was introduced in 1.1.0/1.1.1 breaking the very basics

Martin Siegumfeldt (1):
  spitools: upgrade 1.1.1 -> 1.2.0

 .../spitools/{spitools_1.1.1.bb =3D> spitools_1.2.0.bb}         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-support/spitools/{spitools_1.1.1.bb =3D> spitools_1=
.2.0.bb} (86%)

--=20
2.55.0

