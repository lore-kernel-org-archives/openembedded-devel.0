Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27538E7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 18:44:01 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.111])
 by mx.groups.io with SMTP id smtpd.web10.3469.1735929836799071494
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jan 2025 10:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=APeHfzfZ;
 spf=pass (domain: navimatix.de, ip: 40.107.249.111, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvJMe1T1NyOFM56mIgVm1HumpyIWKc8E0ZPL57ye3hJFB4igHx5ovyxvdgzKVvIHfo4DRpredeYcl7iEaPX+ohQNiX+dgaB4Q3CLMuzs8eCMnCDDWC7YykM2gaXqKf1xUl+tpfzKbDGYQmpcQDnbIXEuUXx0p6Z1bktqSHc+wDxiKHpvCNrF7NcLnNdWa+8jBnYyJ0IzWNrNs9uDQdkz/cueThnZxyxAO25FIJKBy7yNV9PgQ+EyPlJfzbG6A8ZqVOULH3AuKKemBa8KwishcgLMEs/5qIG3gGguAwXkfZN5WAPpNlC8198Au05gfQt662kfB4tKX8o2ihOAH9/rVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0JzgbsOqOv28DWZmzgjYKP0MsEuy8/AArq32eSPTr0=;
 b=OgY2FDfcGlRKAbUUhigb5IEo2YVZ4WXu0Cj499T8ZJinHdYBEsY9/cEoR6ROkL/zixq+wcb/Ya+4asDvTt9oR22dfcZaitK60I+F0PYwZkJM1ve/xA6p6kqeW4sChrqA3vnvsZPnz8zRL2ZVe6LWgrZHa/2E5e1QDNOYUvUWnASj2e7hwqcj4XR5IL22oTtsLkdsV0Ifst3PN+1DQmzmFTDEs288s0PDdeROBn+q8lP479VrMK59ccwSToAy7wwhrk2LERv7FK7PNsNLTWvGqSLvic9gS/SbYp7WSY+d0MiZ7GsQHPHVmdAf9aDbe8Ak/wA0Bo9GXa+kQv6cSLMmGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0JzgbsOqOv28DWZmzgjYKP0MsEuy8/AArq32eSPTr0=;
 b=APeHfzfZmvpRnxNw5xfgZtSdVG++AhVcWK4T+AhgROVO4w8EX5WIumSkbH1lzGUwtQ8xgYISaOV3cN8k4B2KdrJZ3dVg2rRZhn7/QdINPGMA7d2DajfT88EoRB23Z8V05Ey91v2Tsegl23sbptsqC4/TzzGLu50pRwMUr/fX9xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS4PR01MB10252.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4fd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 18:43:49 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%3]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 18:43:48 +0000
Date: Fri, 3 Jan 2025 19:43:47 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 1/2] libtinyxml: set CVE product to tinyxml
Message-ID: <ac298193710dab19a082c9d6cecc0d4c0503a3b3.1735929826.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0464.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::28) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS4PR01MB10252:EE_
X-MS-Office365-Filtering-Correlation-Id: 2778e64a-fd23-40d2-670f-08dd2c268f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IzcxFHZivNUt8ZABW+Rgh4bop9hIVUBaEeatixLQOSNNMaNqUFgo2EMBQpuv?=
 =?us-ascii?Q?+rQ6roZXH5azlnsszZBYLQCeJ11q6iikw7QXbkAZxikHkr0bB9as8ANu/dKZ?=
 =?us-ascii?Q?/GUzLRSK4G667+1Zi0U86H/G7tqgRIqyWvsbgcFAhPsEwRe1Nxlcuve8waZU?=
 =?us-ascii?Q?4PItkDukTx8nSKlVv7ZmN5vYzojsTwNXhznxIcaKLa3PMv1CIC+nIudVNlbu?=
 =?us-ascii?Q?CrSvRxLd/MT+xCzyRvu4jKmiZqN5hDIAsn/KvB+eIYMzuRqudYL1WGwY/kDZ?=
 =?us-ascii?Q?NnFVFhPkZ6TN2YaEJRBgI7mLKYA0NKcbvjX5c/k1Ww4SaDHECn+KvJX3rCRZ?=
 =?us-ascii?Q?I5Xb6iPt2RzGnBhaJkuEzxz7FyMiIwW5wjH/zcUo6TtPdeFiX9rWFp7sxSAB?=
 =?us-ascii?Q?hsxsaFcSbgp9JQnaYCNkD7vj8nwvxkez1KSwGCBEOxJ5yt5VWHBkYh+3k22r?=
 =?us-ascii?Q?SkTDCv6RP7euj50XmhJhthLYBpn0hV8BQQ1vEjx0qffQbq4De+SJt/JhwN0x?=
 =?us-ascii?Q?jNl8HLglvp3LxgD0zTCgmVM4DBAsHvl93ZypLMQk0XRnuJZzeGp1FzO8f2pe?=
 =?us-ascii?Q?JI/dmMDfIpD3gYiRwL7k5kGVVI0we8sJ8zUQ+yxENDYf4XLVAkFD6M4UnxEm?=
 =?us-ascii?Q?aMFnb+qm9B4Lb7qWPiLh7VdkSOAe4X+s0TVdZh8RijQVsfdSqb+FVHflBQL/?=
 =?us-ascii?Q?zu6/43kEnvvI0RnIIIV3iZGfpXKG7o6Hn7gQrnHN+jMPZbeqLye5bN6M2bGA?=
 =?us-ascii?Q?N/RohZCWQPAd2iCVGde4wZc54/liz++LObsQU+6IjM+TfsM5NDjzopB8Bdag?=
 =?us-ascii?Q?wZgdZoXgAaV5nZpPLHsSiflmiEEKj/+j+ifYE0wDazt4Lk9UMtjpMZz6FT1I?=
 =?us-ascii?Q?yhkdLHrlatNjTsXb9ZNbnt7oAO0TPRjzoe0ChpR4b2zln8pwzyzxHEHLKOOc?=
 =?us-ascii?Q?6KpbUL3vlfV3sB4R0mkRV5STJBj+YzsWccI8gLUjUj3goGU7YyKS9fvmSxpu?=
 =?us-ascii?Q?JHNm8sJNQx9jCuWh6sYop3ooW0YiYiEWNtfp/a+ueurO2In3oL4amMpL9BcP?=
 =?us-ascii?Q?DvgVIoYKrLgNbAN2SDyBQdAvyD0Sa+peTF5G+7r1LlqD22xwV8OBjQI0AjnT?=
 =?us-ascii?Q?RuHWUaZw/m9T4eKaOHrLREm/ArCSjue5A6SzJN404jiuJ71/l9A6+k6Yx3M6?=
 =?us-ascii?Q?n+uEn206x2OlJ8JIe5SJF1cxah3J9NEDCl2TVdLuGNhBcSxjZcKD9LXLeG67?=
 =?us-ascii?Q?+p9ljdXfeCyF67mTlHLMkDTWeywqRKXPEZEtTh6DGhMMij9mEYpbJNAArUwX?=
 =?us-ascii?Q?qQcXPgLsEDRndWrg66OyAqu3KLxLF5TTKXPYy/Q8I6bgGA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pGlhCzp4gExOHZjj079bjkZFEmu9TtcJ8OaDe6jRu34EWo9Z91iK1vSndthd?=
 =?us-ascii?Q?j5t01MXj4HPj94+iNiwf05mpfn3u4WbxUXIATn5olWags9ggOOzhHFOlF/BD?=
 =?us-ascii?Q?mgu037UkcQOLkkOsN7bSfSeP4ekRcfRXGfENdtTvuiwEodNVT7uNVH0BDCGw?=
 =?us-ascii?Q?KITIf8SywlMJzfOLlh1Q8M6x88gk4OUyw9cZMwNu+5OJWfoD52JrqrSa7d61?=
 =?us-ascii?Q?Izh9YhS4UHHxJm0BmmKxhNiZmy+8UqlayB7aVhA3apnq76Jau38x1qnOkZJD?=
 =?us-ascii?Q?Tycu9tpCIY7qEVCpKzI+gvBCY/DH8/jkYVfMquCF3NHyaLoNO3dR6q57HgK1?=
 =?us-ascii?Q?3Nb8aHMy3Ii82MlWrJh8w03A8WJOZAA9sJT+DcW9gwjq3LEV7b+ag9fbm9ZJ?=
 =?us-ascii?Q?OidhDdLoaenLu2ahK5fZzHajSQDrgpD7za3rmUIP5jlKMAIslB/NAUFvDV+0?=
 =?us-ascii?Q?pgTbuYzkl17Dso/h/i6rr2HPhsfGxpCjuZg1dvwyyPeIBMr9kAoWLJSq+FWU?=
 =?us-ascii?Q?T8NFcdaMnn+MZ8BRyRRF4D9lFimgmJqN7SSOEqQwEqt6BTWdu2nAbpc1dIOC?=
 =?us-ascii?Q?qMCDgCL8FEwHlBB6qVI66AuTH2XqWuUGK56fOlajBpStmjAPDVTaF+P7nWZN?=
 =?us-ascii?Q?VziOct6tsAoCHomQ8JShIC0WeVAOcI3ijfNOEDdLiv14KaH6guK8jMghjlnw?=
 =?us-ascii?Q?2baWhulmE6Zu+V8kDqKQplJ1db1y6pI9PZ4ZdUCx8f3+vsWRFtR95bTe3GWe?=
 =?us-ascii?Q?ck36LdomaMhACst3I68XLqENsK9i0kz6K2aZpN5jmTbtM3RXQ+QNqUC0jczP?=
 =?us-ascii?Q?Wr5f+etJcExt6oGj5TgzZo0S945SbTFBR+qtJPslCuat6v6TmdwW7CP7Z+aA?=
 =?us-ascii?Q?EfgM3KUx88VXYs8+/DPjFH66xNy22VsH11EZHS4m5gqYddaArMDqDSWSRRm0?=
 =?us-ascii?Q?uYXDO+I4quS+wHIe5m5GHHwtMJMfSzFQXQPTDY8JRB/a7u6V58meL2fHARZl?=
 =?us-ascii?Q?xWgRmbraq/+hontoWemyLUOQnkORl0EaUL5GpNGjtJ7xoCg1CSunJJFshzmV?=
 =?us-ascii?Q?GhM1m3GXdU3fIDU8sIzum2mzMpRFuLnzLXITWkQGTJOCxGTK2BX31VkCI99Z?=
 =?us-ascii?Q?wKWZw4MjWor57JjMa3xPSGqSC8fG44hHQgMBGaWJmLx8cihcZiuwOrJXL6Bb?=
 =?us-ascii?Q?d9xGrFpmqJZD09fL+481F19OyGcnW+ogQU1wvxSVamgXnhniUnFkUdH5xI3V?=
 =?us-ascii?Q?hRlx8H1UbaD2QkNNIH7Cx0pmIdGNY4LWkjVrmqHaJTUiQIQshLJZfOZW3tnA?=
 =?us-ascii?Q?YIyY64rRyRsXVXcVqZH3d3DaoJrXWzBJ/UEE7fNeIlJyMOTIghHzPv0Kp0nm?=
 =?us-ascii?Q?6wpPeERj1uzQKxy9fMrpyfomZ28DoERBs5K9V9F0dI0Zb6IQCKhMbnPe+sfA?=
 =?us-ascii?Q?KvSYqJ+P2NbUMLaIgnzCnhM3+zT7+ksGCfK+DLdZ4V43iMQ0MDn1P9ozSdXj?=
 =?us-ascii?Q?fdc6e9s9EkKjM83WUye5p+80kIsyVDfxQdKgMe+cly+yVIGAMm/D9m8fQ7VA?=
 =?us-ascii?Q?AHU3Us1ipQaU/8IfPdczxWaFhXx72IIGdWJ9YslbQBNkP2qWhHEdxuQ1fwcO?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2778e64a-fd23-40d2-670f-08dd2c268f75
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 18:43:48.5293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+igKawp7HHmQLAOYeNXLHF3XckhQ57woUamujLoJwFWrUjDZWQPr++bYcwIAzoEuTeNegnb+5YZBg0gDrYBqp9rQIOcPtWGFn5fuPBU/CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR01MB10252
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 18:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114628

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

This library gets tracked with the product name tinyxml:

https://nvd.nist.gov/products/cpe/detail/95BDA29F-257C-4C44-8847-25CFC10722=
8D

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-=
oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index f2d3b63647..0719ba5fd4 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -5,6 +5,7 @@ HOMEPAGE =3D "http://www.sourceforge.net/projects/tinyxml"
 LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://readme.txt;md5=3Df8f366f3370dda889f60faa7db16=
2cf4"
 SECTION =3D "libs"
+CVE_PRODUCT =3D "tinyxml"
=20
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.',=
 '_')}.tar.gz \
--=20
2.45.2


