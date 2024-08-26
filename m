Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B434C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 14:17:32 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.40])
 by mx.groups.io with SMTP id smtpd.web11.53210.1724681845555305076
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 07:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=CVgjCIT6;
 spf=pass (domain: de.bosch.com, ip: 40.107.22.40, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmrm5/1RudyNuf4bD+f+UVwkGmMcENRcZAMs/1IIGugSSeZyO0KSEZD6w/RWejs04RmdH/GI9NfSf4M1Rvy79voO6koeVRr5Z+9cHt/1LO3kF5JEt5IsI64/OIdokGepFVmj1jmTg+xHbpfszFHJqJZ+GmzdAobI8iJMsuWMJn9dk80o6W7gdnnVrBgdLqCoOOE3HWVfB0B8PT9o421Br9cyFkCxbTb+kX11Zwi20MyQWXcv2PKlo9+Kk803DiJDjoZAPA1gwSQnrEtHVx1M96XEFgsCu4/2X/V5KF9R9ofDNpBW66rUEGBcnKS73OMiEp9WkFmmeVzdnD8Ed4rTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSHm1qC6YfXynW8Q9EsEhzKBl88CK3EHX2NF78nlzB8=;
 b=e/xJivH/RAIUbYXP7eyiLWM7sBGwX/lQM4EUh3KJ/0fbyTnCPgsb8ud1zzGrCIAmZGvq6L/NSXm7DN2ZbYXm37eEIUbxjTCsFym1JTrwSINjAFEszoSrrCyUmtd9eikUXG3ZEwZrdk1Kb6jECL7aLpOeptpGXWJzfneM7VFoJ/EHca0VvDFWowkHawJbMhAmPA74tiBx8Uc/rKxw+QDOBgSUsKqWIQP3lkQgufLbnMbeV863+zdMAf5Wtkc6c+QKX2ecHaDdJXIc+BAmQUx5zhiSmlLWLbghqPU4mbnVv7OkNAHOJYAnbuR/DQ533kIiH/lCvq1mh71oK4syzP85+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSHm1qC6YfXynW8Q9EsEhzKBl88CK3EHX2NF78nlzB8=;
 b=CVgjCIT6q8StKJfCZZ2UxefWtM2XObSnttyISJ9qdabn8P/mnWyeHT3gGXtRogphAz2QOnme8vuqSFsl1EC16JmkFE7PwUUX1+y/qArEQEpBdtpIGYOJGiZE0XgvMyLAJH68w3o9PnRkeGsxjXmjqBj4BJoTZNNFL3YRR8nNPd4CSGwOT6pCNReSoRPtM3N1dUF9Ng+wwGhXcXPcyjFnrS3YNaxbFidn+njaHyRiFxMtePPveCcV4Q0BTO3oWQoXBACYBIa5ZqYXgcnGMigb/D/RpfM64OzvbNT6z51fryjOkJAyGNwLRjK+9zzEVYetx3IW3KvRHZPlqcaKAODdvw==
Received: from AM6P193CA0097.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::38)
 by PAVPR10MB7468.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 14:17:22 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:209:88:cafe::82) by AM6P193CA0097.outlook.office365.com
 (2603:10a6:209:88::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24 via Frontend
 Transport; Mon, 26 Aug 2024 14:17:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 14:17:22 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 16:17:13 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 16:17:13 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH 1/4] directfb: Order PACKAGECONFIG alphabetically
Date: Mon, 26 Aug 2024 16:16:41 +0200
Message-ID: <20240826141644.78746-2-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826141644.78746-1-mark.jonas@de.bosch.com>
References: <20240826141644.78746-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DF:EE_|PAVPR10MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: c01e3c9b-b945-4019-50ef-08dcc5d9cd71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v5Lb9yZ16LenY8APBgT+73p04wtD1N93Er012fLGrrfHlz6N3OmS8KXxoVRN?=
 =?us-ascii?Q?Hew5d3+nxPWdU3z0KkomoCot3apb2JlIfOL58OS7hZ17jdP5hB/eL52IyCqF?=
 =?us-ascii?Q?MchWrz3+DHBfPrzTJSuD6F7vZvFsvCwjUA7bhvJOXJwhYgXDSVcBWuLiFKFR?=
 =?us-ascii?Q?zfWSbSEvVru1BQL8AZrQ7wFMjAA4h/di7+ORbb42ZifOlen2BGU98Lp87j7B?=
 =?us-ascii?Q?8hD3pFur3yH2Te2h9CC//BNs2AXUlOR/6FigT62rLzLRxRVyxmVNE9P1Dce8?=
 =?us-ascii?Q?JOuSi6SiULLDwt4VBAQcduauGnWJEJN2QwMLA60DMcYest9mryeDb243OE7+?=
 =?us-ascii?Q?rMznrixwTG7ndGekn60rvH7A4gUk4RUxxcepboeEqw7JTCb8C2p56jI8NNME?=
 =?us-ascii?Q?+sLW8L/RgHjOKABRHHl0a5cSxKxFUsJ3vRSOfj275XFOJcI+YciCVcqWPM17?=
 =?us-ascii?Q?H0YjdUwsTAnfnQDjzqkvYH6hPlJlmcgU6WXU6zw+CfUSMnUR63Ss8DD69Eah?=
 =?us-ascii?Q?YvkbTtL+XXIqyBWLXWZ/6pIlHGmwAREF6uReW4bZ+rcBiaOUDUUOi9Kx4k62?=
 =?us-ascii?Q?7I+Ye7bjR4xwEDcOa8d6pLPhj4om+RkHLmBhij8b8OIOoPDaVBEnieaf0O4V?=
 =?us-ascii?Q?uoV8tFPD2zMLDVqlAnx9JR+Q0dnM2lGJqxoIwPTemnrL8paRMn6fboNFMRCR?=
 =?us-ascii?Q?zIkQ/li7cKHkw5F+3IeCECHgt1le+b6PUfy6b+zxJnnq6USd2K+Zardv+F0h?=
 =?us-ascii?Q?1LgLNBq+6TnwYMGMSQiXR1X/lHD3zg5u7aGEXItp32u8CHMkccbq4fUGKY/c?=
 =?us-ascii?Q?vTU1eZTJuaQoTu1y8rn7DiB3lnXM2o6D5vQCvcuGYmIQV2UzRw7RhPVTe1ln?=
 =?us-ascii?Q?+vpMZYnOSPcE7mGoHX1iQJ2a2FbCf8RFzbYF9g+GstQzrcBiNCDV50G+k+KY?=
 =?us-ascii?Q?fh2Bz99Ly+CyRI/Fg1w19fltq2LPbTRMpN0fNEfW6BQLmS3rqLN9RQbJbPku?=
 =?us-ascii?Q?dTSsnQEAdUz9FShOrqBDLVZ5yWxcHDfsvh/kX3AIjY25ug3jNooj6zochJjy?=
 =?us-ascii?Q?SPqs3ty8w7PqttgLuAf/AiUhvSWDSm7PXT/1gErB+XMsebpH2lyPOl9X6hRr?=
 =?us-ascii?Q?uF0BWG67hn5YPy5USwJyO4/DLaaQG1OwkfJQ9LmFe/gJA1rjkgNuy8249/BK?=
 =?us-ascii?Q?dXpg0JjqrBdYJnKh1/Hf09PlKxxm1EHaL1BEAmy2eTC/jFuZiuAOAhU1tS8L?=
 =?us-ascii?Q?d95qdudYNGnLOcsrUqfNfwA3btZSeuIpvD9hISWXcgP+5J9YjREiObskTpOE?=
 =?us-ascii?Q?7PaYCT4+2fqgLmPWzRhCqXzioRl8qq2/LbMHvhKNiuLgdA0YkxQ1S461Vc4R?=
 =?us-ascii?Q?9xBsvPtZRBC045x3qOOo/RaqkVls1p1TQurj3MFLyBrMyQa/SvLhItP0sy+j?=
 =?us-ascii?Q?/V2q4o1ilSuSjMHYylv5IcET6L90iL51?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 14:17:22.4473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c01e3c9b-b945-4019-50ef-08dcc5d9cd71
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7468
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 14:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111964

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-graphics/directfb/directfb.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recip=
es-graphics/directfb/directfb.inc
index 54aeb06aa..3fbfd9ce7 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -41,14 +41,14 @@ BINCONFIG =3D "${bindir}/directfb-config"
 inherit autotools binconfig-disabled pkgconfig
=20
 PACKAGECONFIG ??=3D "linuxinput"
-PACKAGECONFIG[jpeg2000] =3D "--enable-jpeg2000,--disable-jpeg2000,jasper"
 PACKAGECONFIG[drmkms] =3D "--enable-drmkms,--disable-drmkms,libdrm"
-PACKAGECONFIG[tiff] =3D "--enable-tiff,--disable-tiff,tiff"
-PACKAGECONFIG[webp] =3D "--enable-webp,--disable-webp,libwebp"
-PACKAGECONFIG[tslib] =3D "--with-inputdrivers=3Dtslib,,tslib"
+PACKAGECONFIG[jpeg2000] =3D "--enable-jpeg2000,--disable-jpeg2000,jasper"
+PACKAGECONFIG[mesa] =3D "--enable-mesa,--disable-mesa,virtual/mesa,"
 PACKAGECONFIG[linuxinput] =3D "--with-inputdrivers=3Dlinuxinput,,"
 PACKAGECONFIG[noinput] =3D "--with-inputdrivers=3Dnone,,"
-PACKAGECONFIG[mesa] =3D "--enable-mesa,--disable-mesa,virtual/mesa,"
+PACKAGECONFIG[tiff] =3D "--enable-tiff,--disable-tiff,tiff"
+PACKAGECONFIG[tslib] =3D "--with-inputdrivers=3Dtslib,,tslib"
+PACKAGECONFIG[webp] =3D "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,xserver-xorg,"
=20
 EXTRA_OECONF =3D "\
--=20
2.34.1


