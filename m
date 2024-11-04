Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86887D132DD
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:07:33 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.63])
 by mx.groups.io with SMTP id smtpd.web11.59668.1730732842249319372
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Nov 2024 07:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=dWtQb769;
 spf=pass (domain: arri.de, ip: 40.107.21.63, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdw07WPCWPna05RLKRA6f1/q22QurERX21ZDJV3UG5sutLMTKs8V74R/rjUotsHGVX43SiHCtO4JA5zHv88DPH6vkJ2RnqgNFxc2q0s8q2G8mIfzudM0tVoJswFLWUooRWYb3dbGwWo1pwXHAQiHwJmnYzkFXicfvs+ryYcmSKST/icGp3PWTW4eNgRjBPiLCPSH6Ufwj+ajgK763A1jPz3sUqj0aAYnV79UQut6p9y5fL7BmTio5z24lw+mScK1bgZe79ijEOBnEKCd+dEKlRaNYxxWm9lcfzUwa4eQnwXVOZ+FEGUOCjyK5OErW4DRx/upGtYExLAQzp+NuIh9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMCyiT28wefM/aG4o8plTSC9firPBR/R5NEjwo0yKzk=;
 b=uDEbg+SdeMNWznlQaklOCPY2bI63llUhsSbYyfhvgnF2WG3NfslwtHib3caNEB27R+yBPzpvaRw9KjhvUXdYXrMbQtV4ygT2HHComUeVdCKO3qdWF+aAQJwqWwpaZynTbkCbuGkbsXeo8CM3iQkmFb0gx5FaMbDDZM0exmqx741zdQbYc/tE5SAXaGZuYYh+Kjz0O85ZvwRPiKZ98hHBJ79JRDHGcG2WdCV9fjqP9b9vX466c/r3PT4+jVg1239zFL9vof8xtGoQ4tnNDmlA4notTd9FcCao39MHVKynlEtnR++ZI7RlOGL3RUsppksl6OZdH5mClhg2XBTYrOve7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMCyiT28wefM/aG4o8plTSC9firPBR/R5NEjwo0yKzk=;
 b=dWtQb769fgrAvN3v4tmJE7GUMvBghwXiSdRSHSMU/ucOvGSk3+hzxIlaE83o6yEfdQk0UI84PTgG/fU5WwXOqk+M7FME5dZ1iqxfWBtvKrRBG7sO6PiOG/XyUuwoVf2GmzqsMttxV6xvGGMPYPpPKj/kiD+W+bYL58X12IulnW0=
Received: from MW4PR03CA0056.namprd03.prod.outlook.com (2603:10b6:303:8e::31)
 by AS2PR07MB9304.eurprd07.prod.outlook.com (2603:10a6:20b:60b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Mon, 4 Nov
 2024 15:07:17 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10b6:303:8e:cafe::b7) by MW4PR03CA0056.outlook.office365.com
 (2603:10b6:303:8e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 15:07:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Mon, 4 Nov 2024 15:07:13 +0000
Received: from N9W6SW14.arri.de (10.30.4.236) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 4 Nov
 2024 16:07:13 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] glibmm: use ${bindir_native}
Date: Mon, 4 Nov 2024 16:07:04 +0100
Message-ID: <20241104150704.24868-1-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.4.236]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79C:EE_|AS2PR07MB9304:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b200c61-6ba0-4d24-aee0-08dcfce25d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nyhFYrQM34VMNrh5J6z8OR/RvJ7FQnorv4nrTMVXVPndYQF/nYQ3fYRJ/t2z?=
 =?us-ascii?Q?mmCo47GUnaV8TmFBMZUrjPaSYrj+TNhzqLq5XHX8UiTJPbkUDE8gdnMS81QW?=
 =?us-ascii?Q?/OR/jxCgwGZPsLOXSh6Q98OJlnAA9g8q6z+DR1bRETv3rsfInJ2V/IWKvQnE?=
 =?us-ascii?Q?2oYFW7VKpmE+XK79GpUMTuqYbqymRXWK2UNvPSMCwKpsU9pfinaJByInRshY?=
 =?us-ascii?Q?XGd4+ABkgF4s/JIQB9UJN4+2NeWxWv/gI7FkydbODofqbmDxnj/jSoR96WLh?=
 =?us-ascii?Q?E+86YQKU+MXpk191Fxuwo3L4Mh1YcekBk+LRGUwzwJHzivgHnwcLYORqpzzW?=
 =?us-ascii?Q?8aJzt65JkNA0aVI14je0KBAyYz9f3J4k7p1mQfidAw9FvOJ9jXqWlhlEP1UM?=
 =?us-ascii?Q?r1xiH/IL+0mwfh/JVKEnXSR8CMHbJZPICckX50G4VegSb/2FuhMVzCReP4/m?=
 =?us-ascii?Q?ZZDUi+7Z3U/WZdG8NuwGbaMvxu3UvJ8/qBlqFTfM7gbsupQqu+x8nRy/TSXJ?=
 =?us-ascii?Q?XO/myW0Iw6aB94gFga6JfJHXXZ1Wp0QZHc51eV7X8e62jhhBjX1ekbDn5HW/?=
 =?us-ascii?Q?I263zARIPpwd4XihBLmHN7Ur8NbtRQgwaqhMexuWrq6/BKhlHBp7m+MM003L?=
 =?us-ascii?Q?UEyY7t4snWpiuHg1WOaVPjFN9hqU89YvtW0Df9F9cVXqBJQlXMvH9FGj+8tD?=
 =?us-ascii?Q?w9XqQYhfKP6/qSpEnm9TUpU6UWIwROl+VRQ9IkPC6vcsT9dTaoi6X+9lyO3o?=
 =?us-ascii?Q?7yMg7JoCA9TtL3iA5IFSGm7hXMLnDsrbjRnue2OFitSj/+0vhXWxtI2c6LWT?=
 =?us-ascii?Q?ovP8NdXfRZEV06Ggsv3z83VO7kbiJ3yP1i8VSnjKSKIvv7eGkYyq58HjyoZI?=
 =?us-ascii?Q?ZSi6R8n0m1PWXeveIKlLG9hgmsmNs406Nj5eEFg3f6jSndZNGWAI2y0+Uu+Z?=
 =?us-ascii?Q?E0owTwhyQPEDUmtMZ8+mOIW+ehHskoH76B3lkNnt7OvW+i/ugorpuf5Y6oob?=
 =?us-ascii?Q?BHxBavOauoSEz1HtjV0/4OY0egovtfYhPmvY/nya+MhSsoXTHODf26g7pJkf?=
 =?us-ascii?Q?llePhKY6+iAD8buBT9FVo1V+vTjJ6+yxT/lLbQfC9hl0tz6GZTkMKCkh+nzw?=
 =?us-ascii?Q?wIq4nQCRvIjDKQHaxcEvXDrK8mFxMNBbs7QeqAqLCJ/Nz9nAHauQASElu22k?=
 =?us-ascii?Q?+jDS3s5Qx5oizrNnJFHadkQs9O2IW4P7fJPhgRVEoEC6XBhCxlEkgQb43SFF?=
 =?us-ascii?Q?1Mgn4qUnvql5RECICcYEWIDLUFfEuwp2+8n2zTJz6iXlzv/F5nQJopjSl5HS?=
 =?us-ascii?Q?2GJsL9awbiNMpzKwJKKb+VqmHVTKdtaROxOx/tovI/gT9mpNTqHfzJiFQJot?=
 =?us-ascii?Q?j0MXfWfqqg6Xj9I65vt9V9xoDcZtEuVABwTDrlnK7JcRk34jkg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 15:07:13.9470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b200c61-6ba0-4d24-aee0-08dcfce25d69
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9304
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 15:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113407

With the current ${bindir} the build fails if BBCLASSEXTEND'ing to
nativesdk and enabling maintainer-mode.

Fixes: 3d0279c18738 ("glibmm: fix reproducibility issues")
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
N.B. Enabling maintainer-mode (e.g. after adding patches) needs further
packages in DEPENDS, but I think this should be bbappend'ed locally.

 meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb b/meta-oe/recip=
es-core/glib-2.0/glibmm_2.66.7.bb
index 46519384998d..7c7a3fafb74c 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
@@ -24,7 +24,7 @@ EXTRA_OEMESON +=3D "--cross-file=3D${WORKDIR}/meson-${PN}=
.cross -Dmaintainer-mode=3Dfa
 do_write_config:append() {
     cat >${WORKDIR}/meson-${PN}.cross <<EOF
 [binaries]
-m4 =3D '${bindir}/m4'
-perl =3D '${bindir}/perl'
+m4 =3D '${bindir_native}/m4'
+perl =3D '${bindir_native}/perl'
 EOF
 }
--=20
2.43.0


