Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8E3CCA480
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 08:22:16 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.44])
 by mx.groups.io with SMTP id smtpd.web10.35683.1656663726996712514
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 01:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=SE9M5o8h;
 spf=pass (domain: kpit.com, ip: 40.107.222.44,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwN9Dnju2o9bWv3PGhQFNcBWmRBBq77P2yMibLaIYm35KYKm495EgE2HgBw8qw4esRQ9p0UOkYsCAJATObjZYuPFjYQgHp5fU1P1Y2y/xOFedDI1MSIIvbASlN3vG92h/VmtcMGkTU8MTKCSyKWZo+FiT1vG+dRgoPOs4BKNJ8WluAcAF+fOuqbvDyC9+fn1wng3iqtlEHKMkf+Mg/v17b6L7EqhBviCI9yupuXBPV3ppKv/jbDjaxKhLiaXNPuSew2FZ1hvZYNlM6n8vrK11CSj5WGToBujB14KBlty/WzxGshO1Yo6pxRSzteuqanSemWFG/Br3HawBbpCM59sRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IrkLvgGmn6AqJvEV9mHWqg3tiqHD5RWxemq/iiKJGQ=;
 b=fJ4laGTzB4oY7bpx3t9eWfWiIr+bSdQ23cKEBa6oxL3a6x9DQBNn/GsG4Uz5QNDB42YnwhCL2x7Uh1dfo5BaMWrMpWOt82/4rNWNUT0KgHoZu+qLtK3M9v/+RKmWOycbgAhjPaonahOTiJK1e3cIcQ/h2zKNiXrsU9zLv4ldAmRsXOcFtUiY39/x9kwa2fLYmUm2RrLQnEULbEhPxv9/mR+vBtcnzDbfFi3GsHyUyyl9K/++qFrAD+NgDzYOYiceu/PLbDKXIh3DUpeHBByhKcojZJJd0JuepK2Dge+87AwsY7UMfcAcp0pHC8CCAk+9G5kCh5rVOLkeii8uHQiJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IrkLvgGmn6AqJvEV9mHWqg3tiqHD5RWxemq/iiKJGQ=;
 b=SE9M5o8hrs3oYK05jYxNzrS/IGnPrd1Lf0VPMzWEnwyW3VnB6o8sB2Y0+LmJy5rHMSPTslDl/0eBZZWC2LEDfo4/qAXczPGjUu8US8Y/FEYAmsJb2qi6RX/5ha3TkuEviXF4oi2tTuD/OKvE0Qg3Z+LzhDeCpqRdlOX++DOIILQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by PN3PR01MB6983.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 08:21:57 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:21:57 +0000
From: Ranjith Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	omkar.patil@kpit.com
Subject: [oe][meta-filesystems][dunfell][PATCH 0/8] Multiple CVE Fixes
Date: Fri,  1 Jul 2022 13:50:54 +0530
Message-Id: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a7cf5f1-a709-459a-74eb-08da5b3ac2fb
X-MS-TrafficTypeDiagnostic: PN3PR01MB6983:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I01KFaSd5Chffp71mW5Gu1ai12TJyVUe3bN0uTZBnQfwifgwuHtsced8uWCpZ7otlEqYZTgn33E6svQVP+ORbsCn+9AApUB8HTCUF14GqKsfoTXr/BYx8x+WWbX94lG2oti/Ahj+9JEqdlSfhnKgEdx4RGGPvvHS3JcYegSoe4ek2diZrc61MAn1qDNS+2HUwW0P6qMmhG1hBQD9gcBJ9mbuyB5RNirrlaQzZv0DnLDdvnE5gNu0N0+xmhCJCYsflK5CV6s6hOW94j7CmuuUvCwjMfnzgv302jAsDJK7hvlG1Vvlh1Yxf9uQU12A1YKF7TKwG8l/FHLp2degNyPDk3QR8llV5A2OJ7YFEweaj7SvHEY2nW3PZmurcqL2nMDFuZJbcNtOKsgrTpJteWcKfg7isJfSkTKj0E5yW/bwzOk0cTOIKxubCeaQsls34M827ql3DTLfhuYxT3QQ6E7lilrxDm2X/njMb5KnuvrE8tPi944d/5mBnNzKQG4oAD8WXauKGeC6QQ10WFOE/pDvouAARm5SWS5+UO0dhLFkzBPLzx4/kpJ0T9lMUVYNNgTSBj3NgmY6AjlpcwML3e8J4F3pHVDgEh9i1ovGnd8GAIwU6jiftalwFPt3ndWW6zDu8cqX+M1EcWNd2V7nwU9wHD8krZF+doHYJfarrXcV9eTFmjH0kD7sGUOKDdqlIF8YDmmieDnN8neQn4cikgMTXuO7j3WAJKZQxBxfNLbDaII3sYyZK85Y0eYZObp6elwp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(6666004)(41300700001)(2906002)(86362001)(1076003)(2616005)(5660300002)(6486002)(186003)(6512007)(478600001)(6506007)(8936002)(52116002)(6636002)(38100700002)(316002)(36756003)(8676002)(66476007)(83380400001)(66556008)(66574015)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7rV7sjwg5qnShR6eRO/4OXXPSxSewEhC/nERGr+FoaTzjXtCyX2u0qQODHbE?=
 =?us-ascii?Q?7yWeJuvdbc4sZN4IbIRu/sap8HGYjpgJOHlfmemH3Fbzbj77y5xv//BxaHn+?=
 =?us-ascii?Q?sa4Jd3+belFOEjazukgNgHwFjzX0pgj+NX7KQ7lSjPQ64HsY/sqcOa+LHFcm?=
 =?us-ascii?Q?22fsP5GRtkd3o5xwUzEqJIrBoGDGd8+Oh7DTVkzbg66yF5LkdDlrpF2ZJ2iX?=
 =?us-ascii?Q?lYjZNqm4jVlgmwg+cHrEfyW4x8Pk1ezU1br7X7P3zod+nxmDfCYMu2ZAaV2y?=
 =?us-ascii?Q?Q6xWjFbjb6QOuDwlY+Ti+se57nS/qlLmrvfZnWhHb0OReP2VJI9ihLzMB2+D?=
 =?us-ascii?Q?6hKafrwfVDe6oYfmNpbZzdWuuuZfTy1pSl1HDETWaqJfPQF/lYnxYjTo+M5b?=
 =?us-ascii?Q?dKyeU65YJQpT/D3Ko521C5zb/bXPM3tQQLFC/qiPpgfEoLWyDLIKbjFTL10q?=
 =?us-ascii?Q?36F1T6T3A8+rJ6Foto0OB8SRuYVC6MisBeYY0XLGuzQZw3t34nN7bOoxoyGD?=
 =?us-ascii?Q?8UJHHegwh/VBGNYtQJYtRn8+YSOk+k/dI6R9cJn9x5jv12fkY9bGeP5AJhTz?=
 =?us-ascii?Q?dH5cxwCnMm5uqXhlUBOHy61zrOAXP72DqpdwzOpVC+MxVSB+NAdJ4cXiTjoq?=
 =?us-ascii?Q?Qd+PdEGEPjRUxB55Zz4jUxFxzFDzjyyshbV3f6FAffbr+8NInZFdHAUipbR/?=
 =?us-ascii?Q?xylcZTWtXPwQOl+2ieGiW/oNIeI5PJlPxOVq95lQ2rMz/jJ5ctXR3l4qnBZH?=
 =?us-ascii?Q?usXzCcf6jwlytfVoubQVIhkiEB/RV5vNZB/FP/7ZdEAhe9yhPtsZ43X/WgcH?=
 =?us-ascii?Q?FcKuVptWBZmUQY4GOgt+074DYQYXpoRmmHQ8ykc4hEIl6iDAbpxPhhpuc/98?=
 =?us-ascii?Q?YbwuNw64vnke4L7F3euVaVHAuonDuXXGcnQvSXnbLB0iHmAVBmyd+NNkvl6B?=
 =?us-ascii?Q?EFIeHk8kRy+GuQe+MPIr/oixGPGrlTzZKpMP6yr77EwDc+tu5sifFq7amNZ9?=
 =?us-ascii?Q?XD00ZNe3vYBsd+ye5p4CfZsDZRooh+eAXsS0aAvwGQbi2D8uuhDhFlAFfEYd?=
 =?us-ascii?Q?4Gf4HaAlHuSum983WDF54wYKUrrD/NTaRzBOzOSIJxQIR7eKCm40IjrlCRsr?=
 =?us-ascii?Q?iKoZFKxenbPobbqKspqYRF+AXpx+50O6GJE5TT5vmC4quqEJBJbNnv2bLvMh?=
 =?us-ascii?Q?278PsS8x9n1h/SB6L5jGP4ngbtbmunwR+F53ujo8esvwScnuMlrPs8f9aSL/?=
 =?us-ascii?Q?25+RPsTYZwiKDkl2R1ElfsuQJBE4ToNfSEATZPeR5WH27FtOX7lrIS46/AYs?=
 =?us-ascii?Q?yLCDb8Vri8sXSm/KO09YkNrYiwuHphrcCer3N/m+1xFR+F2oltM6LZeRV3H6?=
 =?us-ascii?Q?NWJuGb72rJxCoGn26JQKsqd/7QnNSxNlzWfIHx81cbhrMDbzoXrIYyNr2/FY?=
 =?us-ascii?Q?Gu32eQ/orLnzDfjmOqg4ESuVUAivWX+FIA6nbQ45vFN30qRqdzzl/G7bIAGq?=
 =?us-ascii?Q?+Igi5MnhdIFK3YtfhmiM2/qPPHQeiV6Le0hy+WUIvMekYGQtV9qdHR0tl6uD?=
 =?us-ascii?Q?Yjla/pz8P1Ccfps5p9QldPd8z4qfzYSP5JtsdQGB0JHnJnTaL8R4j4H9eNTa?=
 =?us-ascii?Q?+PtimCChsgK0xc71rfAlGCWv8tMaBS1uwkBQWHHzqutC0I8J2JB/aitsDzFr?=
 =?us-ascii?Q?DNHIjQ=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a7cf5f1-a709-459a-74eb-08da5b3ac2fb
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 08:21:56.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3v90AObzwlWrQCBnga4Y9mfBA44Yr9Jvn4wS3WLzAWfy6JobDg6VM+k0WKZFT5oJ4PhDypS9J/PNLXnSl31khg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6983
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 08:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97652

There are following unpatched CVEs that fixing them individually
would be a much bigger problem than just doing the update.

Fixed CVE's:
CVE-2021-33285
CVE-2021-33289
CVE-2021-33286
CVE-2021-35266
CVE-2021-33287
CVE-2021-35267
CVE-2021-35268
CVE-2021-35269
CVE-2021-39251
CVE-2021-39252
CVE-2021-39253
CVE-2021-39254
CVE-2021-39255
CVE-2021-39256
CVE-2021-39257
CVE-2021-39258
CVE-2021-39259
CVE-2021-39260
CVE-2021-39261
CVE-2021-39262
CVE-2021-39263

CVE-2022-30783
CVE-2022-30784
CVE-2022-30785
CVE-2022-30786
CVE-2022-30787
CVE-2022-30788
CVE-2022-30789

Chen Qi (1):
  ntfs-3g-ntfsprogs: upgrade to 2021.8.22

Omkar Patil (7):
  ntfs-3g-ntfsprogs: Fix CVE-2021-46790
  ntfs-3g-ntfsprogs: Fix CVE-2022-30783
  ntfs-3g-ntfsprogs: Fix CVE-2022-30784
  ntfs-3g-ntfsprogs: Add Patch For Multiple CVE
  ntfs-3g-ntfsprogs: Fix CVE-2022-30786
  ntfs-3g-ntfsprogs: Fix CVE-2022-30788
  ntfs-3g-ntfsprogs: Fix CVE-2022-30789

 .../ntfs-3g-ntfsprogs/CVE-2021-46790.patch    | 31 ++++++++
 .../ntfs-3g-ntfsprogs/CVE-2022-30783.patch    | 75 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs/CVE-2022-30784.patch    | 74 ++++++++++++++++++
 .../CVE-2022-30785_30787.patch                | 32 ++++++++
 .../ntfs-3g-ntfsprogs/CVE-2022-30786-1.patch  | 36 +++++++++
 .../ntfs-3g-ntfsprogs/CVE-2022-30786-2.patch  | 45 +++++++++++
 .../ntfs-3g-ntfsprogs/CVE-2022-30788-1.patch  | 51 +++++++++++++
 .../ntfs-3g-ntfsprogs/CVE-2022-30788-2.patch  | 30 ++++++++
 .../ntfs-3g-ntfsprogs/CVE-2022-30789.patch    | 68 +++++++++++++++++
 ...3.23.bb =3D> ntfs-3g-ntfsprogs_2021.8.22.bb} | 16 +++-
 10 files changed, 455 insertions(+), 3 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2021-46790.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30783.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30784.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30785_30787.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30786-1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30786-2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30788-1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30788-2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30789.patch
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntf=
sprogs_2017.3.23.bb =3D> ntfs-3g-ntfsprogs_2021.8.22.bb} (77%)

--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

