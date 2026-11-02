Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.87])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9479.1793613931264093301
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 02:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=pXeZTdbt;
 spf=pass (domain: gomspace.com, ip: 52.101.84.87, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rY4BQFD+Eo9RIemWQnWJsMOd9LWiJjr2vugViAL/P36FDbdk0bcuT8T/Yz3Uf8Halp/f6H/5QaiEDmF1di1KveVtjPa0QhRIrWVGrfsMs5dNHfs7qWqNsSrEI+YD9E4kk0T/RqDdDW3Gxb9MF9EKvJaJcXaKHUJfKZytQ2E2sVXC9zoEFzkVQeZKvolSyY2lYGNaEU5yUNzU+u2NBquvmgxzD2DReU5D5ldB8YuYASaTmiFoJRAwAwn5JO4aiJrGNGk7S+nh/a8hWnQZMkY6X5asEMbad0OsiNYvYzn/Y1DSYGjt1bW8d3ndXgspnbwRxqiFwtz0Xnhp3zb+qb2g8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ope+5LFeh/Sn/CVwqhIyn/P5tnXWqz8/2kwoUItjcT8=;
 b=BhWg/U+5xS/R025pOTHEbiCgnBTCOVilKwgBNekRw8G9C1J/IviF1rY8qRWsLbYnNGyJ/nIiYqB90i9lGdnKyO8zjjMX/GgmAs3OJMikSElk1qIEKbyTmPJXW9ykDX5HK/xwzJ1xaBfnRWiw7IC6aAPEahk8gmbBBlmT6GvJ1eSstzEr+nJfmiE6gPHCtkSGLg7fqCkKzM3m6TMAxD5xDkNZPFhSt16uFxki8GCc5vT9QWPnaDIy5GHbo7evQRLnBUCs/kuXMdcr/MJFAYTnwGCDh0cus/4wX1KjgVMMC1GFcjMJ/j5j8UWb4Kn8MinrGTCIrStzWrAkZQMpZRbUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 77.233.245.163) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=gomspace.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ope+5LFeh/Sn/CVwqhIyn/P5tnXWqz8/2kwoUItjcT8=;
 b=pXeZTdbt5bWovR51uW4e1pbJUTeKOhh3NpfaKAmPhqylQaY+g1hAPet+CwRMQ/2kxc0OqBqJnBQCq+tUHi5KznOtgyQD9shjVCIAL8BAGjhCXm3NPxOakzRoPVmBY9YUtX4XC/cmQ8aPl/h1TpyOeHEUas12OpOm4iFeJM6T6t4=
Received: from DUZPR01CA0311.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::12) by AM9PR08MB5890.eurprd08.prod.outlook.com
 (2603:10a6:20b:281::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:05:24 +0000
Received: from MA3PEPF00000408.eurprd04.prod.outlook.com
 (2603:10a6:10:4ba:cafe::22) by DUZPR01CA0311.outlook.office365.com
 (2603:10a6:10:4ba::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 10:05:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 77.233.245.163) smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 77.233.245.163 as permitted sender) receiver=protection.outlook.com;
 client-ip=77.233.245.163; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (77.233.245.163) by
 MA3PEPF00000408.mail.protection.outlook.com (10.167.241.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 10:05:24 +0000
Received: from DK-AAL-EX03.gomspace.lan (10.0.1.61) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 11:05:23 +0100
Received: from ThinkStation-P3.gomspace.lan (10.0.8.56) by
 DK-AAL-EX03.gomspace.lan (10.0.1.61) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 11:05:23 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>, Khem Raj
	<khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 1/1] spitools: upgrade 1.1.1 -> 1.2.0
Date: Mon, 2 Nov 2026 11:05:02 +0100
Message-ID: <20261102100502.3571949-2-mns@gomspace.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102100502.3571949-1-mns@gomspace.com>
References: <20261102100502.3571949-1-mns@gomspace.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: mns@gomspace.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000408:EE_|AM9PR08MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d10c18-50e3-4702-0ec8-08df38c8cfd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 1T/iBGUSETm3VyDBABEeyF2ZE1yJgq1pIEh5VENpsMwHFYKDJVrXOwyZtzlwx0NLnHj2DtyS0feicPp29lh6PqLyr0ttCfb/VnCPzl397+34UyA3EWEJhf/KI3iiE6y2rVWtyR/Um7rdg7n5hqHejDZbUmE5ye6oirh6Ub0xgZBgrqQwnFofQbgK3GG176y3wzwicnOodrJhF/f3DQVm1cAVr6/S6MB4QlaB21KgJA70pNKPoukHBwJrwYol3j6zq0JJzG7DcYp/Vlydq2Ud9dhyLz5YN+ava6n9F0YHSEtvq46j4Abo81n1II0O5NaWypTV2Oj3gzZDRtrQ3JYOgetCrZ3PU1beASDJ8HBTu2QsLb26NSM1mW/AgU3M2vu6J1+LhUFjLqOvyHuZtez4uhxHTmK+Tm4nmHXPrdcX6N9Hpk9Lzn4Ynaw6kpC/aCuuflGY3A/sdFLw5jFG60pOF356MIIN9PxqW42WK5sCtXpPRrp0ROtzaDyaTZ467LUFqZvwocanLfOe1yqiXEZqFT0JRlquSEPhlOtX9qy4N1nIHbS+f8aYsgggTfetKI1bjyxmZoXLXDhYytN2sOVu1FknuJYb3Sr39yNwvJGqDoYWrPv5Wy2zWzcUMDzSkLXQfQ7uzCzta4CoDKbMcgfo3pyA5knT+WGoa4/e60D0FiYbvQ8/cFjwLx0nVS9Tft4rAZINSmqNojKR3K5HJzBT/g==
X-Forefront-Antispam-Report: CIP:77.233.245.163;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aQw26VFClXyN5VNyIMhPlNpJv0KuSyMC0kPaSkRuPi0ipPTHCEN6KZWfbUIOuO0yIztLzQUFONCMOy7E0qFrXmXCyVvbfcR70McgEYLdvZv7WpTqmCXxJ17M61Ch11T4w+lmB/gaqfi67FzIEUee0aBpPS9NAiJzQbJdsZ2zTqApeQPyWaMJpQ4YR4Ejt5uCy3lH32UDNrwJB2h/+9cJWjqj0LHLNq7XHOvJEWDiLTdzA9UoXnUjBaw9wPtevoxNsq0nwxRxLwkKn8vjz8SblKgSuCKitlQBbd7jVmgYAbtHwCB3g6dTSvMvbiVMJ2RVOxT/OMp9M+cr5+g5qXXAHcAszfcqk+454A7ZMzYAXhfSbAwzSOFe0x5gcI0hNC23m86uffmsVL63x7P0KXQC3coJkzuOVDIOoOMsfsmAyNQAYBD+lHGocpjKeV2tvWPf
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:05:24.0510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d10c18-50e3-4702-0ec8-08df38c8cfd6
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[77.233.245.163];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: MA3PEPF00000408.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5890
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 10:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131745
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

