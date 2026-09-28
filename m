Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E79CA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 11:48:30 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56521.1790596101307522185
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 04:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=mCy/8+s+;
 spf=pass (domain: de.bosch.com, ip: 52.101.84.50, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGptAodZS9Ev+qyLthmD1fp8jLaPMA52BbhIp3/nMATAr+qamOKNiHa2TeaD/N5PmOPxrXvdm7pSNMoKrmTjk+2nwEGbmcEG/BaJL3yZT7GGRnIVqFrYOGjrsZxIdH/86gswffbGsXdL2WzKbT5UgkIeeqf35omi60e+AoRp8i6RvPwS8M6UuAGuAGstMwGzPGPGXT3WttIBPjl02k+7D48USFSzq/YIF4UjP8z8XBvIJO0IVWivRUW44GCMury1lGMJ6gRbCEeirxMKQ2wBSNw1PfVjWKG4Anb6gCEYzST/W/dtXrxlBO2pgRYyc/CZMZECeyAr2fMaz0u1fB2JPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZfXB5+ExX0fheyzVaIo5jVEuXunxPTtkCEbvd/AN70=;
 b=X4ODiW7zS9Ubtb8w3V6deMA2WVjJBRQf+o5Qk7F7e6HwfISEz/CFMQgq8Fg/4F61JeQl7ysSjX/pnunyZgjDGxcq0a/eSQ2fvDIMDOS6KCR4XWu3+3+CU1nDSD66+uNQv0xF8+IiDC36jgND4Qs8nPnrvNsHjAVMZ83NqE0mRgjxD8Vcs3YwtL+L4j20j28Y6XpnPFw7fVoGBG2ON5oOSkC7tvIYKgZWcwmCH2Udeuw4zOcs0IHv95oKth1Exupg4mkb0JNpobu20KcOmT+hkudScrhAoNm54KdOKZJzUJiMt6tLX1YzQqi5StqtUnfVxpUDAM9c3bO/Qg3IAdPnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZfXB5+ExX0fheyzVaIo5jVEuXunxPTtkCEbvd/AN70=;
 b=mCy/8+s+Y+ajNnrdKr/0GDjJ8PEeR17FpyVrEcYuRAP4O8ZUIfvO23OmtFzOIjwKZWK9ZIUEZaApBA3NXzOimjuKOlthcwfUfZ+AZ5thC1feQsT8RlYXIQEe+1NqIOibc5gwricy7E30UV0HZBSIaxMLj8Kb+vu61OB/JJ0EQhkdSzhuTkxtQlesl66NmoW4uqnA+2woAtWZwpf76kjvvMQd2kECfJA/pc59a6991uLUp+XKHxpFBxFSEf+6nH7dHFXJNxieIEEItnX59goz/fveEvfDAcgQjy8Z/yiCmEVQxj/1++TCjr20ilG9T7oP5vG4DQf6nKTjscbRYbkfGg==
Received: from WA2PEPF000008B2.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d8::697)
 by DB9PR10MB7193.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:459::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 11:48:16 +0000
Received: from WA1PEPF00009B3D.eurprd05.prod.outlook.com (2603:10a6:1d8::11b)
 by WA2PEPF000008B2.outlook.office365.com (2603:10a6:1d8::697) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13
 via Frontend Transport; Mon, 28 Sep 2026 11:48:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 WA1PEPF00009B3D.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 11:48:15 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 13:47:50 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.65.242) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 28 Sep 2026 13:47:50 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>, "Mark
 Jonas" <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH v2 0/2] libgpiod: detail package licensing
Date: Mon, 28 Sep 2026 13:47:02 +0200
Message-ID: <20260928114704.2719-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.65.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3D:EE_|DB9PR10MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: f35406d7-7cf4-4fe9-40f5-08df1d5661f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|11063799006|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	RNFtwsUnhFbsIDIN7HdB3Z+HDR9rp5lLD8G9wEGfi11ZvotfySSZtWRu1auAm8stCJiN1vJTygY7zAiF71ujzoSEh7xVqcZnPqVwGdquc6MnJ/W/sO/rrxfbbZuPs8vqEp+AMdbYbUFLvw5oE8BpEHH7rrB9FELaS/8TzkudMuGviRHxxDmSQNly6avWYW/5HafGVtl80Q0fJozbTUynorztQIj+U+HgOlsP1aNs62FNIsqeRK/Ejb6WWA8WjHbsd9tOcnQcMbAm16U+DfpHHmLc4A/ZmP9i4xVW7kcvjataKjemXQXq0XhbvE8yBXrQo9/ph1q58NZfhMCtbtYRzNMvyfxxE5FIjfkCARBpm5khDgOmCF12OytG/omTnu2hTay8jspVwjFCYAR9ptWM7mj8/3KWUgU+wi8+pntkdEcWZz5dOVmeAlMPTEuYwvG4PErwnYv42jn7Lrmzt4SdaU2ASiUZTQrptWGL5/KnsWHBilLd0VWPdZNVLoAhtAXMWkfMCjlk3jx1aZSjyXKtwDSVY6hAEpbhEw7zAqKU7ERV/FH93Vuma2tmju9vPSqgCzuC+LofZveyCAXxQjuDhvpFBU4Ij2rJVJjptVXoyvhXprCLLiUolN478zsy6JioUIXSo8J/xxBJi0Nt2cVWHt8nbgFiCs6Dn3c6cBYNgPiwRpM/sEoOZjfMA6I/nW5v+fXup02W2BeM4hEc1bVDFg==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	h7CVDbZwxuXJcvhn4RqTlxbJVGRa64/NXX/t/AB4ORsS1B18QFIS+3bHTDXiE2YZ8N+kV9JSMxLEDyYYW0LcxkdjHkx/fFZIu81Md7xFosRi63sVZaWvBOVO00sfAEdnjcxYeAiT/hHImo0ZeZi1yuTi5fCFlWD0D6Rwzi9I0lA5x5FQKstXU055LwdQijU0bni098zfNlBnxIGGkW42svTN+Sa7iEjJAW1mDi2XWyZL8U9ZwKZDx5uGtTYS/1vG2ot5vRXtLcGTQImJ0CM1Bel38PVwjVEPpkNi3ktP43cblSk6V0/gJP2ck2Gjdcp1bsmJF2tQAwqbfXMBHrEzpdI5NleLQ2W7Znnnxkja2V0AQKoxitorM6xu4Ocs3dkwIshH/kk3IiXEWzHvJXvrlKIva9R6AnPmd+Mao/rx6i9LbOO4b8/F224JZNHEUsQb
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:48:15.6990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f35406d7-7cf4-4fe9-40f5-08df1d5661f9
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	WA1PEPF00009B3D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 11:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130431

From: Mark Jonas <mark.jonas@de.bosch.com>

This series corrects the licensing metadata:

  - Patch 1 splits the recipe-wide LICENSE into per-package assignments,
    so each package reports its own license (e.g. the library as
    LGPL-2.1-or-later, the CLI tools as GPL-2.0-or-later).

  - Patch 2 backports a patch which fixes the libgpiodbus license

Changes since v1:
- Squashed addition of missing CC0-1.0 license into setting of
  per-package license assignements.
- Backported the license change of libgpiodbus from GPL-2.0-or-later to
  LGPL-2.1-or-later.=20

Ricardo Simoes (2):
  libgpiod: set per-package license assignments
  libgpiod: update libgpiodbus license

 .../libgpiod-2.x/fix_gpiodbus_license.patch   | 26 +++++++++++++++++++
 .../libgpiod/libgpiod_2.3.1.bb                | 15 ++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiod=
bus_license.patch

--=20
2.34.1


