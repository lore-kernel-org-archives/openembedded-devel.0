Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF64C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:53:22 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.64])
 by mx.groups.io with SMTP id smtpd.web10.3601.1719478390045853903
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 01:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=bx/0/lh4;
 spf=pass (domain: arri.de, ip: 40.107.22.64, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cK3L0uji/+lD6vV8/JiT22zPyOVzWGIGhjbuyQfaDdHmu6lQIjtC6rOKVIYAbawFs0mSSEX/arZPB+YqYMrDPJh49nQUfsISrATQwExG1H+wwNY7BPDmYSVXmkhPXvJhpvZCFqZkk7O8kC2I6S+3wTICgrmw3tkkhY3fqtOX0+f4bY0UlXQo3nLEl9lppC86k16RKqXbkQbpT//PWhp+orrbaznU4ymW9ZxofWa/pLwgIs6A5kZ4hWUwHJUQjLVI1d+D5gzHsfV+b12UZTcehihc5sNoAV8LG3G+UzOeVericxS40DsBjuV5+UfBgAwyy8MDyEPVGZOPF3Rom+4E2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmgWDMBPuhLbct+qVRpmaGsfPcjEGYa2Avvp/cd3vww=;
 b=m1P8TggmbvR/u9vN6UmMXmpdHgnBgbuwG5IdNkbcEtYNKoU6bdWXhWm0zHTqKM6ordBz8tQFeyXHYzynNYVn1Iv+jBeE1zH3BRCQmLh8oCCla5YewKT0PaC3IxIXiiEauwU+1P9fqDDbbpHdglaib3l2fHUt4VDBak209PaNDdqYDd+odoqOVAfLnPlx0fcGRQ2mcuMuk2IKUFwjyHqITdvM3Ypu3NF+WAWWGPUquS1ClZahM/CUjBgw15aE1t7AL94XIDJKhGK5Ijlh//+lOxeHi+kTuN6yZStqIt/g3ElvGRXwVVd8JS2Lf0xRH53xtLOI8pdpmnlh3WX180KYjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmgWDMBPuhLbct+qVRpmaGsfPcjEGYa2Avvp/cd3vww=;
 b=bx/0/lh4dohWtwsu+K94/CiwdXAx72/nJAgqiKB0qHWgQZl0UdCbijo4Col1JySllPumvvCHIn0Hlk5NH5xkfwXojgPybTVWyeYfccEQs0KE27jD/JkWG0rWd6+MmxD6/7yWZGrrqspKfTDMtbBQb54Y2kMEpwWJd3ZqHrZk7XE=
Received: from AM0PR01CA0157.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::26) by AM0PR07MB6434.eurprd07.prod.outlook.com
 (2603:10a6:20b:15e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.25; Thu, 27 Jun
 2024 08:53:06 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:208:aa:cafe::ae) by AM0PR01CA0157.outlook.office365.com
 (2603:10a6:208:aa::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Thu, 27 Jun 2024 08:53:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 08:53:06 +0000
Received: from N9W6SW14.arri.de (10.30.4.242) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 27 Jun
 2024 10:53:05 +0200
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Marek Vasut <marex@denx.de>, Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH 1/2] lvgl: fix version in shared library file name
Date: Thu, 27 Jun 2024 10:52:55 +0200
Message-ID: <20240627085256.21526-1-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.4.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A792:EE_|AM0PR07MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ee788b-2dd3-439f-45d6-08dc96868fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J09YX3HwrST9og8RRMdwYPz2SnMvgBwOjv6nvX9dUi3WyWlyTOaHzM76kWly?=
 =?us-ascii?Q?bq/wjSJ4+HvIy9GTh/CtcTO+h6N5ByCH8X67EkZ4NQAL5+tfa6Jb2tIp9jYq?=
 =?us-ascii?Q?qhS0GHjZUinhlCRbG+P6/wnvup+IhcUz47Ih7NJvd5q4BDOO/JiPyBo6l53k?=
 =?us-ascii?Q?A1b5KgzZIRUdkIQl3rB5Zv708FfsSTNc0CWu6FAfh4EiB/XeTgD934HEV0y2?=
 =?us-ascii?Q?OUJhV1PTWXRr8mAWDLMYuPz7F79BmdIMAaGxkXeMHQwXxM4D5bsekL+SWT8u?=
 =?us-ascii?Q?sTjoqwDsr7U8KfnHsgIwFVCxNQPLnSUUSkZXhfNK4SvCPawx99GGD8UdE7nS?=
 =?us-ascii?Q?P1V6q5JHneCRzqnH7GYrLI1J4ey0Kgn1Z5ta0xR9f4/KJRRGwlIG6H77Iv6A?=
 =?us-ascii?Q?okl/Ev6pQQrjFl0jOjzzAEx0E2Ix87U+RBDT0peh3ITsRoXctaGyx2hJiYqR?=
 =?us-ascii?Q?noUZN07Qr2F+pJJn7TVUqEGycqcWBRRIR3L12V4V/fnvZk1VXYUeXOJG69Tq?=
 =?us-ascii?Q?YTPju7Yp1yZFp1N7e4+kvyOCXXOx5Sj0MNTSgi3L3qltVFtcI9B+JYopIdHr?=
 =?us-ascii?Q?LXzq7l1G/2KZCl4kSbTgiefQc+CSrSFcXGN92shg3n++1ZoC9Mt/TjbFwT0W?=
 =?us-ascii?Q?xcUhul4bD8mdCMapWPw/Uen4dSSWdJ00E3rpMMswQCxpHHAiQ4CtybNBEymQ?=
 =?us-ascii?Q?a8xsbeGgUAQvKfmXt+9KwliyOD4GN5iSaKADCbPhw64SDHvQbkaafEJPBiX7?=
 =?us-ascii?Q?yeGJlbuvkyNk82f6okHb/PgVgdJMhjGiNqBl6I9cMhgJ0jPY97kT+3HUVRMI?=
 =?us-ascii?Q?Row2lp+XD2wLlibvSbRD12jdrxJB6wlGjwSnKsjX/dl4iGaIJdE5QPst9sF/?=
 =?us-ascii?Q?iio3MTLQMptgM98FHH8zmDq6uIaySTYSOTB2Jt3ZtBIbd4EmJGsIoGDdRQqA?=
 =?us-ascii?Q?Udowij9XyRWYdjfBeVLqyal/mMBGacQnuThWKs7kpRqpsX9d8d5somVTbGuk?=
 =?us-ascii?Q?2gntnaexGn1tvGU2gH+3KkzfgIk87ZpDXgo6KULGByuW5srilyUrpt3oCy+/?=
 =?us-ascii?Q?QCdzHJWtZiCsg+UcHcD5VDeUAdqnW8ZxpDTjCZ3YuId8Wl47LdqtwvzvGLAH?=
 =?us-ascii?Q?CeAhDdOpqqBgYNe1txnkO9fJyESRskrtdVm/EvUXhVRK+n895u1A4NaQGmew?=
 =?us-ascii?Q?lBwnd0kV9wGhKlykd0jCXimSp7uQDVRJl1kni5pmSqTieazVwApY1lXcyGmA?=
 =?us-ascii?Q?E6lBufdsT7swObVX3eQpX9pMostZKsTOVynRFjL5ZE61QfIY9/oaE0uqFJ8M?=
 =?us-ascii?Q?bBAmk+R87MFMgBfum/9x740FWT7QS+ypZh3uXqgmHg5Jl6jkFDSHHW53V7sk?=
 =?us-ascii?Q?/QAxypLdX8VdNGDLhxFBOeWykB4T?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 08:53:06.0130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ee788b-2dd3-439f-45d6-08dc96868fb3
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB6434
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 08:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111119

The version in the patch file needs to be updated.

Fixes: 0c19e65a0969 ("lvgl: Update to 9.1.0")
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../0007-fix-cmake-generate-versioned-shared-libraries.patch  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-ve=
rsioned-shared-libraries.patch b/meta-oe/recipes-graphics/lvgl/files/0007-f=
ix-cmake-generate-versioned-shared-libraries.patch
index 6997d84153ce..64468313a312 100644
--- a/meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-versioned=
-shared-libraries.patch
+++ b/meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-versioned=
-shared-libraries.patch
@@ -7,7 +7,7 @@ Add missing version suffix to shared libraries. Currently t=
he filename of
 generated shared libraries is only liblvgl.so, which prevents coexistence
 of different versions of LVGL on the same system. Set VERSION and SOVERSIO=
N
 to make cmake add the version suffix to generated shared libraries. That
-changes the filename to liblvgl.so.9.0.0 and includes symlink with major
+changes the filename to liblvgl.so.9.1.0 and includes symlink with major
 ABI version, i.e. liblvgl.so.9 .
=20
 Upstream-Status: Submitted [https://github.com/lvgl/lvgl/pull/5865]
@@ -21,7 +21,7 @@ index 9800468eb..6f33f1cc8 100644
 --- a/env_support/cmake/custom.cmake
 +++ b/env_support/cmake/custom.cmake
 @@ -1,3 +1,6 @@
-+set(LVGL_VERSION "9.0.0")
++set(LVGL_VERSION "9.1.0")
 +set(LVGL_SOVERSION "9")
 +
  # Option to define LV_LVGL_H_INCLUDE_SIMPLE, default: ON
--=20
2.43.0


