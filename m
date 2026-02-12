Return-Path: <mikhail.anikin@solid-run.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67533EB48EE
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 09:08:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.115])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41571.1770887318472107520
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 01:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@solidrn.onmicrosoft.com header.s=selector1-solidrn-onmicrosoft-com header.b=ZmI0hU0Q;
 dkim=fail reason="dkim: body hash did not verify" header.i=@solidrn.onmicrosoft.com header.s=selector1-solidrn-onmicrosoft-com header.b=ZmI0hU0Q;
 spf=pass (domain: solid-run.com, ip: 52.101.65.115, mailfrom: mikhail.anikin@solid-run.com)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ie790euXpltGU7m5Yy8l9I8Dk9IJbVzqfJFLQ6oBnhsOnz+bMrKOlqnPj/IKExN37ZdImRDc0Lfgto8XCLTwgxV4iixaclakxOGVBziMW5xk4iD58TrafSyWBmCJyXGIuvEQ3MSHMcw5WSZnZD0lPfNMb9Sx7l1QPZD+j3Y45LHaFF2b4XmNVNIJ2QePL/tZkdrd1dILeRJl4c4uw8V2+dX3Cj0jQ1H+FsTOQAsFPCAuXoOj2zHIRSddyuZRERl10RKrTRx+Ni4xuB2CHm1J56LxYspxtffm+JK/wsstSThwzNhXoil8LTVDxteGST1CsF9UqYP4JcSBmm24WW6K+Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DoMF44swu7UP/Ym3rRRZguqG6hrR/mNSEOG63+iuWQ=;
 b=LuJHQxSXAPmbt8i4qIJYSry7BtXPe8uVrvDVWbHeWgbZv6JXJ2PCFtCWslEPS12elPdbD7f15GQapM8oaQPmagjxxnI7R8B5RfCKNlLWeMxfr8sX5EKfocGpz0aG8urgp6mIhpneU0NXjm1Hd0oJWQ4x5Z+WvyLhWCgizCQfvCkO5rSRho7n4I/tmt39mvmpNe5Fl+9UTal3ZTN6M0J33kuABxYMsWs4UFC0zc95tyL1/dO3Qg05hLmRjPTAknha5Ms2XksoGUCdQ8al6vrV/tLUiiIBSvE4JIxjK7Kur23BNsxrpoXY90ZMunHB5Ew5pN8Ai8Qio9LUiaweZNwU3w==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=solid-run.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DoMF44swu7UP/Ym3rRRZguqG6hrR/mNSEOG63+iuWQ=;
 b=ZmI0hU0QBjAC33Z/1ZutV4j/jSBhA6nHSHRAZXHrSHXDnzPwbf4mE3XJPUQ9Y2qLHK0bx8Bo35o4L8PCOYlWe75uOfV8osqMdkdhWYVAOW9/Hmcuke6L8dcKKWGUzx4wGjpEWOFkPK3dEJi6GgJRd0iwCfAoakXi1Ggogw5ZNss=
Received: from DU7P194CA0016.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::19)
 by AS5PR04MB9854.eurprd04.prod.outlook.com (2603:10a6:20b:673::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 09:08:35 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::47) by DU7P194CA0016.outlook.office365.com
 (2603:10a6:10:553::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 09:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 12 Feb 2026 09:08:34 +0000
Received: from emails-1814509-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-6.eu-west-1.compute.internal [10.20.5.6])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 924A98074E
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 09:08:34 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1770887314; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=1DoMF44swu7UP/Ym3rRRZguqG6hrR/mNSEOG63+iuWQ=;
 b=WExG7wgEBrdSePqVyVia814eqNB/Y4KaYtILBB3NTAK22xJDmUX4PnrNWSUxehmGEjrCM
 zbiVy8Zno/uVVzYgilT6DB5pshTgfRijUDegphlYQ3zxuozEwg6x7RottR5uD2VmD3IPdWI
 OISuOC3zlZrrFmiWeb/rPBE0yj5I8m4=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1770887314;
 b=pQ7oLt2u/H88+1cJr8KqfguYtnkNHbstRECv4lRoYJ13nJ773zGR7kCcjp79T7M4ET1Ic
 rV99/5TdyV70H/sL2iNzcmkpTbGVqCDxK6Y161KrkWwbKxN56YzGPfkd6nbVH5Kfr8Wu8vE
 jKRDEa0AfqneWpNpJD+zDN+M2zTeT/Q=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHF9fibrnRTim4wS7FnbHfJvI/f54kjeIMpQWDwiqaLpXcTS+Jjs/dr1uAU2iWdJqhbwKqS8ZYFp34/vAxkyyY8fAwG3oDiMEzukwDIFdgsf3mCWl5WJ9CI/EW4c4ufNba4pNR8d5zoKugJf+GOl2AAIKgUU6bKKrslTRupGVQSGY2oOm63ieyioWfQpsxChI0zkDUpIfVvTCI2RnvyF3wLlD+gyL1OCLlLyZA49mCAtq2e5qxs5vbnecH70UCdaPWTDfweOOrEFLTVnscAK5l4OSB84g1mLTyyjSntTfW1SW/Ag9AjybSx1gSQ+uVJw5lGIfULzUh7jDAM32+aPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DoMF44swu7UP/Ym3rRRZguqG6hrR/mNSEOG63+iuWQ=;
 b=SpPDRUTL3mShqZtOtVbP7+wpzKuKcQVlN3E4v1PIiwocFYbW1oMi2vg6qveCH38G4WLwCFylF1iUQo0oCMnYCwkhufnYUcTRB/5YXdPHvbvqE7DyGo1N+LzcN4maCerK2g5rtlIJJT2pLEiOLg9k3+CTd+eZOPXToTWVWhdm65EgHgDJows0hS+xQUgY0Q6k3QQyu1eG74wtt9CL5CP18uXZQ+yZnlUF4PkJTG1kE8ZSVD6ODhN0qG1ZcDr1XclXXYNg11cvKXrK3pOrfFdNmQ+qYnSxtdsecmQ9UXb7kWnmccWSqMOx7qLx9vC1+z+V0ShR1zZayhYhjNywVbl2jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DoMF44swu7UP/Ym3rRRZguqG6hrR/mNSEOG63+iuWQ=;
 b=ZmI0hU0QBjAC33Z/1ZutV4j/jSBhA6nHSHRAZXHrSHXDnzPwbf4mE3XJPUQ9Y2qLHK0bx8Bo35o4L8PCOYlWe75uOfV8osqMdkdhWYVAOW9/Hmcuke6L8dcKKWGUzx4wGjpEWOFkPK3dEJi6GgJRd0iwCfAoakXi1Ggogw5ZNss=
Received: from AM0PR04MB5012.eurprd04.prod.outlook.com (2603:10a6:208:c0::11)
 by PA4PR04MB7502.eurprd04.prod.outlook.com (2603:10a6:102:ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 09:08:26 +0000
Received: from AM0PR04MB5012.eurprd04.prod.outlook.com
 ([fe80::cbea:5983:6991:5d87]) by AM0PR04MB5012.eurprd04.prod.outlook.com
 ([fe80::cbea:5983:6991:5d87%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 09:08:26 +0000
From: Mikhail Anikin <mikhail.anikin@solid-run.com>
To: openembedded-devel@lists.openembedded.org
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>
Subject: [meta-oe][PATCH] rsyslog: fix incorrect install -d usage in do_install
Date: Thu, 12 Feb 2026 11:07:40 +0200
Message-ID: <20260212090740.1250705-1-mikhail.anikin@solid-run.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: TL0P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::18) To AM0PR04MB5012.eurprd04.prod.outlook.com
 (2603:10a6:208:c0::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AM0PR04MB5012:EE_|PA4PR04MB7502:EE_|DB1PEPF000509FB:EE_|AS5PR04MB9854:EE_
X-MS-Office365-Filtering-Correlation-Id: c517d3d5-6b4d-484b-1fe1-08de6a164d07
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?H9CpculoejL2c9lfK3trRrbDxRNQo7DOmW+WmPcgZTiCTCaGc6tIryeHiYyn?=
 =?us-ascii?Q?SO9oPrSrNwmEnrGwz/yOqgrkr0zOCAa+f6zMVWc7JczIw2G3nZAIioZRRv/t?=
 =?us-ascii?Q?fnARKuM9u1xORRVA4eRn/wz6vzSFVUnKhCpXMr8gm0atAzgqszG3LljnENgA?=
 =?us-ascii?Q?RbNzI4M41CgGM+Qy02h0wd+RdSsERFTGCRtaHeHuRRm7RQp62cdIyZgr2Ib/?=
 =?us-ascii?Q?aJlYq9T4U3nyRPFZDxA+6OrNtfEmNAufqw31dny/+E4KXOROdH7Nn15bHAci?=
 =?us-ascii?Q?blff2bmT+eecJXpwEF4NjMqX/7D3gRynqFWz6Ptj7oi+wYGXB15SDJVJK/xR?=
 =?us-ascii?Q?eh8IAni1CdJx1fy8jWhGkPNL4RViYNt3YQA1GO78fUK92B/Pn8V6364L6TIY?=
 =?us-ascii?Q?rP+z96VaZiSBYO3XLA8EaubIXdtsYtvinQ2nm0hbD8+4+2GsqVMVTGMuiJ7t?=
 =?us-ascii?Q?bgNi0b9sY2aKhR69gDcnawQCigX3FFtf3eno47U8Ff4zDsLTU3xhDY+DaCib?=
 =?us-ascii?Q?zYvOhR/6AzBHNUkwLMZmmT+fyzpXGQ6Oi4c4AJroG0Mah3S9vT6fF1r6/XU2?=
 =?us-ascii?Q?OFYzdD6NOzNiuIRR2hwFSqFU0xZ19eIKxthdh45rJR/5OZY6hPJRHx9l1eFW?=
 =?us-ascii?Q?WKQirDtcTVvwRwtlqw2eYglSnGJbzmoEv880pMIjmz48GQ1jPv+uam03qh9b?=
 =?us-ascii?Q?kCvg51q+8A08Km0mUT6QOXmkjgUZn8jfjn+pFlFAUN1aST+4IphrzXxH+YfJ?=
 =?us-ascii?Q?4hE7PK4ZeHChbSYKKduzRnGkqd7LkF2TUZttOXXiBIBPFtk7Z3M+fsN0wjdV?=
 =?us-ascii?Q?VBdiQ7YYky1KBSVhOhpDODtfCwhu6GxBP0+NPR7tR8MYNk5mNjUwocUWXhDw?=
 =?us-ascii?Q?cPoV3dOt86ZUauqpECq0Jlp4RT0XbHAcM2Ixl22q4n1eoEELkLi4TgxJTNdP?=
 =?us-ascii?Q?eo7SEDzYL/jonnPzNjXSdpbv+le9+ZCM+YGZNGUO9Q/6ahPhFleEIf68Zp5s?=
 =?us-ascii?Q?Ls//0BhazVrtY0iawu4tewE1cS5FA03nEHFSSG5UfZEpsCl7zX6ToXlXshrv?=
 =?us-ascii?Q?zIgUGVH+CMKy9nN6hRnxsh+XiARAzH/qmhJQ43cTs1Nny7lq5GGo0AzhEdEw?=
 =?us-ascii?Q?S+sdV5bIyqridya0MenOxsvFB9QlpRr5zAHHAGgkPCsp2Jdh4YDIKRck+HEC?=
 =?us-ascii?Q?STF3AmZkyQsSMFdCGzwlJebz2Upo30+8oLBzaW3UFTcceAaWSEJCApx7BMHq?=
 =?us-ascii?Q?S00a8cm2QOYD+F8uxASF5BEx+87IZ29/hvVXfUtOvteuXjlq+/YzFQremD8+?=
 =?us-ascii?Q?8CjvtTMc7EH+j5nK3ntEIYa3Ixuk7fRlw+9IdTnD0W5a9SnoTJ7By8x0TTdX?=
 =?us-ascii?Q?yIkJz6+0jbAqLPlAdF0Vuy92V3g/DsRsWZ+3WrmMMHme00+Ai4pDxhb5iQKo?=
 =?us-ascii?Q?Cq+By8uH+PNtin2W4dt68vTzPe2oXtK4imGdU6hZKLmpAzi4AwLslkNolh+a?=
 =?us-ascii?Q?QDSCfR8KKX2USsdCxwYZDOQontTE6oESzlV/yu4RwdY4C9TlM9aHVhz/RGTX?=
 =?us-ascii?Q?n38Yvlzmgo6ZuLDxHtvBSGKmhGE6XcKbPV76B2SzOa/JEVi3GhVIzlOR314O?=
 =?us-ascii?Q?aw9L1hIA9lOqQ+B9YiNlnD0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5012.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7502
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1fa77cf81b3a41cb9dd7bbffb71cb05e:solidrun,office365_emails,sent,inline:6961d175b388e5fb13860b5063d2d4bf
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	386f2670-40f4-445b-7efd-08de6a16481c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nECsARQvCI8VosDzM0H9lMwgj2PPuoBczHLQSw/43p3gqgJs1R7BxvLu9iQD?=
 =?us-ascii?Q?K7/nz2ENuqFEFdjfss7dELswvAh+i1CUeu5QHciLP+Jh57UcxJQ7LcRQ+RwW?=
 =?us-ascii?Q?AP5DxUucfCXdQnuou/KgvYS7A5IHoatZJvM5k9V0hvMQZoASiLSKl48LI6C5?=
 =?us-ascii?Q?QRm7qpz7qxO6V8iMwQ5xYAN0j6i9ZRXGsPQmLmjmBF0OJedd+5e0+OSSrzyY?=
 =?us-ascii?Q?6AKvVrfCXU5iggjZu2xQW7Ng2RlgSQUOhMQN5fz2qYvqhwJ07Qwcwl/zU7td?=
 =?us-ascii?Q?7tc1UfOGkoEBxaRL5vqXJ2/lA9ewlRZFtVFmhrsnT1zbJBpYYVggy6r8maMO?=
 =?us-ascii?Q?iQPk7ty36cXwRwrskoCxunFMAeBU70NurgIK2WOMPS4wRA2JPDckRUi97B8O?=
 =?us-ascii?Q?2irAkKAOmhlQD256Z+pNMipdrVBF+hy+biHJqb3HuddGTlTjUFNZUSpK8DSE?=
 =?us-ascii?Q?PA9rY1wRKH1q4dwe45F48C8Z3UHDh8aaRPzvJ/qtciWB6THJ7NWbKdCmxkkO?=
 =?us-ascii?Q?q3I5M2cNIQoR2mncKPb1CBj0j/QtCMuN/7URrJJOGmFB9W08dlTkbmugwRqN?=
 =?us-ascii?Q?FPfWeLACVZ57y3EeDVanUvYKxmG0dRE0ENwEdOGTFDpWohCqY+N8ljEVlgvb?=
 =?us-ascii?Q?z56Pwyua3h7GZmB5l0RUmQNH3DOacMEbkA9Xi7Frf3wJPKUu1ov+mIJlsbwG?=
 =?us-ascii?Q?hkJfDnNZtFWWjp/i9SDL82m4KrSIiFbLCJteapOR9eGRkk3D39jziFotBJN9?=
 =?us-ascii?Q?jbd5CKJwZIQgX8cdIhNBHp4QtJnGF3HpKYx390o5BsK44lbeSV4A577z6jkT?=
 =?us-ascii?Q?tl3jURKsP/q9aHeyvF29cHn3a6uER9AxoEjskMRYuJJoXW1i6enfKFuOYrMX?=
 =?us-ascii?Q?tTrHCU5dcquNrgTwYzd9ZaMnnXKgM+y8JKw2Xa+hUADraLxRM8w24rDID8ST?=
 =?us-ascii?Q?UhY19UrKyEv0O2nPrT0xuCN+rRNtiJJCvhmRcNO5QgvzLFwPiXKDNyE7KqW3?=
 =?us-ascii?Q?FlEGOvEzQ1T5VeCRxIIEfm61fwEsHeksdYAwBp3DyJ2Id1Ucrbi/VO3AAAVB?=
 =?us-ascii?Q?T9AC4hMCV4JSYNdiJwr7iNVaCn0s0nGH6OBjGYqftxaZgoG0KEXYqcVuAMNj?=
 =?us-ascii?Q?8ldiovRC+k0rWTdi27/JG0bC8Rhcx9PHhCyQHJVRLjMjpd/RKzBLu9RiNAC6?=
 =?us-ascii?Q?M5+90xNY7usMASajjrwW6hBioZW7h2NRx3b8HntrM1WXMZiNMqcONzK3HEXT?=
 =?us-ascii?Q?crsa7j3I3goVlVnfFWpf2Egkxj75FK0hM6S3O2XbiJpcHhvFXxbXbuE0ud48?=
 =?us-ascii?Q?rphURrzWeq47ToGBOoQz59OCCJEtE7TWLFj5I4V7zqkOM3kLPb7OFjASJQoT?=
 =?us-ascii?Q?to6I85SmaH1Kc1NTNm6sWmR8gYHiG3Y2QAo8k+LEcXZDEe21o1Sz1Wzq+bJI?=
 =?us-ascii?Q?mPSY3Wi4ZoNGdlP3ZnUO4XFOi5eKr8WN16ZNbIJEb4JDNdSHfACT/2wsEL+Q?=
 =?us-ascii?Q?ofAsjwv1QNM70nTdAGy2UipacWIJImmFKXClRmaBEncaArB/iDudPUEN99Bj?=
 =?us-ascii?Q?2W9+ZKowdOd5t7rul/VdmYXgeVEjK2ll3OVgL20ceprNCP/DXwfQMzJcpcWE?=
 =?us-ascii?Q?wc0T+6OPaxC/avsHT/cwrdp/7K2X1tGkKJbYYLBx8Oj4Gaq8CA5WhYY4TNNk?=
 =?us-ascii?Q?bNiMlg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PUaC99osDKFfIB0l5NnPb6zdiSq5NPg2SbWd1GCtB10Q/H2xJSsaP4O96H7tifYKyTtT1XdEyb5YBY32oV7GRrNUsrKO7BIHSfSOuE+2U1AxbHOykC7kKNQWOW4b24x/N3OyXbpBTcVcceRhUYbc1D+47+9TSjjr43W82bDXcRVJKkwFtAhMIrvea1/H5y1dSL1RkTmNln4TuBpfqXIFAM8J4f4tWPxmbVF0sYB5hiSRX/IAio1MBpSStCO/S9+8QPLR56Qk6HLVP2mACOCKGNqbuocBL/4mmXvxjksUgZtMxoSfBdKT3eb5PfL1pUyqsoqWy/rBPpTx9nv9XkSZgUuHtuJpa6ve+K/DEd+tp3IyDQpNJyMoRn4oPgwXZvkX/lgr/fg/nq86O9coUiNxWwRZPU8kyVT6MK0uwwdN2OGgSWmhJYaDiu6fcIz3ztR+
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 09:08:34.6896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c517d3d5-6b4d-484b-1fe1-08de6a164d07
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9854
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 09:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124346

The rsyslog recipe incorrectly passes the permission mode as a
positional argument to install -d. In this form, the value is treated
as a directory name rather than as a mode, which will create an additional =
directory
and may result in unexpected behavior during installation.

Use the -m option to ensure the directory is created with the intended
permissions.

Signed-off-by: Mikhail Anikin <mikhail.anikin@solid-run.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
index 63233fd278..c50a7a3f7a 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
@@ -149,11 +149,11 @@ do_install:append() {
     sed -i -e "s#@BINDIR@#${bindir}#g" ${D}${sysconfdir}/logrotate.d/logro=
tate.rsyslog
=20
     if ${@bb.utils.contains('PACKAGECONFIG', 'imjournal', 'true', 'false',=
 d)}; then
-        install -d 0755 ${D}${sysconfdir}/rsyslog.d
+        install -d -m 0755 ${D}${sysconfdir}/rsyslog.d
         echo '$ModLoad imjournal' >> ${D}${sysconfdir}/rsyslog.d/imjournal=
.conf
     fi
     if ${@bb.utils.contains('PACKAGECONFIG', 'mmjsonparse', 'true', 'false=
', d)}; then
-        install -d 0755 ${D}${sysconfdir}/rsyslog.d
+        install -d -m 0755 ${D}${sysconfdir}/rsyslog.d
         echo '$ModLoad mmjsonparse' >> ${D}${sysconfdir}/rsyslog.d/mmjsonp=
arse.conf
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then


