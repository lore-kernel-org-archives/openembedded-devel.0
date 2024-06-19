Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7FAC2BA15
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 13:11:33 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.134])
 by mx.groups.io with SMTP id smtpd.web11.20517.1718802692853546449
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jun 2024 06:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=R7vQW1Sy;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.8.134, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1ccgV0PSYZhCQTAfVh1M61ah3+txD6hnAVlhf8xYxAuoM3c7p0Yq6xYEXBfopi3eXJQyEGMHcn7zxxKYHDXW4g1waXFf89plDCUvKJBA6rjUKLu6o3ru/hV3zmy1+TSaDZzy+Dx59dCqVOw+vYIhc8X7PTVTZfFzor1C0OBD/caKTrLOjDI5XZDEVF08frLmJdvjeetRX3xifC1tSlnFk3+kp6jJpOxZy7DQygt4xNdm+skbRNZePbEx/NblPM8MCrG1hdjwVlVSOs4Eh9U1yN9VDZFWAPsNGsh0nilIeWoquQE9N6YTtIDgEFudy+qUCdsrxnfSsfDx56TOPSnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEpqfWjky344x5b8XUyCzjmtKfvJSA6bDH4d8XVrtv0=;
 b=QazDZpQazZ2OvYlomce4eP1lWQ+UQ3fmDykcAqsqweBQR02rkskIK5iQ7AVHVfWW3j3/ACR24XrbBcp0sVD6Rf0DAWMakVAQ1fab6RJBjvd7XEJJIp/+aXi9LYaxpW8YLTHdDIHZ0PPv5uT3xeJufr2B4RkScORqrIyDUjdIJHneHaLOipxqwpEKPA/LcKRCD2Ru7A1puedf9nVbf57Ir8HaoZnGVDY8xYFWYcDBANntHQzb/PGA6AQp7D8rxZaF2M2XVCtWOrOI8UzebxSdcm8b2HprVfpxheUFYd4SZOOY5iZasHnEQxcoBJ+US7+mZsGnzXdUyrZOlYQRcCJBtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEpqfWjky344x5b8XUyCzjmtKfvJSA6bDH4d8XVrtv0=;
 b=R7vQW1SyAylYl7TS0enQrRjyISXJQ7kc0MrL8joapsXP3Wr1hSMuTdQ+D3x57cnz2zouJ+4qZdC/hWwi/mrMSN0XaEJ3DMawQhaFqe7dNKodw2hgjnao3k+/hoWjJeGIORFxR2UMj+mHtDeWqYDeKiz9S0OBjN9O1ev8QWW0HdB0L0BARCQ/ZAYA1rVl6qEzd8RkUwGWXiIrCsDRQzsyPRE9wXJSKy9Vhw/LNHUHcBTRZzDF05HbBVMWSFUcCda0Bz2l7MHcuXt5lBrxBKIvQSRaWbmpY7jWy25o7e+YVYylP3u4Y2i5IwqLi9IAWV2txwQMdzYpdB46ihnTQl8clA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS4PR06MB8544.eurprd06.prod.outlook.com (2603:10a6:20b:4e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 13:11:29 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 13:11:29 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-webserver][kirkstone][PATCH] nginx-1.21.1: Drop reference to removed patch
Date: Wed, 19 Jun 2024 13:11:05 +0000
Message-ID: <20240619131105.1161515-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:208:122::38) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS4PR06MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e14326-5a03-4097-32b0-08dc906154fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|366013|52116011|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PHo7G6c49dJcviFaMMZY3JHOlQXd3MnXqlK+JgIuEk7bid6peW5zQdaJYjP2?=
 =?us-ascii?Q?S31u2IQdMFOsj7UXcMsclLYGgkwrp3PS9gVF1Xg7vAsl1HaFPvguEhl7I6Eu?=
 =?us-ascii?Q?Gz/+LCNGY9GoVsgFOkbhmwWfJcGXHL1oyjinj6k13FZrnj6aOMAd1J+o+75C?=
 =?us-ascii?Q?uO6zNB1tMugRXNXlKGSrVVMBB0lj97UhUbcQzSjPIkLtPVZMk8mHWz+UD/AV?=
 =?us-ascii?Q?i1UmmKxAki8JEWrd10V5Nx/YIDrFb0I3J/vOfP75ZWGcOkUolqTunGuZHC12?=
 =?us-ascii?Q?K9t9iIoQzewOS5EjCbgzdNPDx/VOBlwHSFteZ9vcmy8ljiHt3EqtdpoYTbyS?=
 =?us-ascii?Q?WJTCixl1DpOFH5MhX8aP2GAMalHfGPa8C+iLJziX5/RXdtfyVVcrj8jOGm+/?=
 =?us-ascii?Q?Til+xgZIrpWTD7TxvKpn+n6mmbb0UkDbzSsaxzudpCfZiNV3f3C0uNwBvbdT?=
 =?us-ascii?Q?mfqrND1bRDFcjG77knRxjWuLqVkxbk+LMjlzJDP5TutUfi7KMkoJ9IKMPE/l?=
 =?us-ascii?Q?5cix/6ksrKV0tu68Dv18aBHdKsh97nLSAFYcBMJUvhNJQHDMc0vx+ySLk9RL?=
 =?us-ascii?Q?2ywSnp/TxYxzjk1cqekrfITS/jUEd0gFFHgZBuyqX9U4LHCL2NZw/T/GtSyS?=
 =?us-ascii?Q?9HSmQfuGbvLoCOWvbgTuEe3EQsZsPVGBNbP/W9GI0GylabXRkc6D5kv/7wDT?=
 =?us-ascii?Q?QF4gpUrVouG0ZrzP2/gIN0XHx9lTakE6H4rHNHh9cobbkSxT2TpgaeZLJLC2?=
 =?us-ascii?Q?7DxomZd3+ZD1T06lJB9ovByGz58RvNX+g7eZV7okq+If8OVCx/GSuQLS6nDu?=
 =?us-ascii?Q?2opVWGL4SWVHN79KQTk8E4blDvWJBWnoNKGkacqE8EbjDVDL8jF1sTQeFVxr?=
 =?us-ascii?Q?YIkXAQamIE2ACFrk7asoxb9FkrHtvvpGieUHnfpGV7XDA94FamrdAZ3X1Tcm?=
 =?us-ascii?Q?jKS6HIjdrwEzPQZAu0XHb/iYV6h/Bz31LxSqQYHxjN/3l4DBRZLyeFYVafGA?=
 =?us-ascii?Q?qkjVFpR163HP/pbHgqgqiDmdxKOIirVsgZM/KPkALy9qgAC42UFJC6OHY3lb?=
 =?us-ascii?Q?bgAHB4PTSCKfxxQqXXLa6D5EiYfM7y5u/rFFS+OenHPI93WZ7id3bLxl0OJt?=
 =?us-ascii?Q?Y/ASRkvQ9vnlD/UNAa0W94JNUNYGq/v7k6YkF3tIRw4K4hDnyhLiNvvy7wZr?=
 =?us-ascii?Q?/9PVLAeSecdOP3GCi139KMPHX7Qrd3IhLfabs3YnJXf8W3/MBmjhn+aTdce6?=
 =?us-ascii?Q?tCUpPKW4mQ4j+34o5gjyHJVuxAuaiRGurx+dfOaRt3qJXDnJ38boH7wVEYdL?=
 =?us-ascii?Q?hcpF45BfBOXaDgQ6Ncj+zHVZfBdC7CHmCti4+ylVVf7ukNvH6ACJlrh3A3kL?=
 =?us-ascii?Q?dzTgQjA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(376011)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9yAOZJyXz4E2qGZ54JiTgjlEobkitFpL/BraW9KHvnL1KUKos8fALMRIjvJO?=
 =?us-ascii?Q?gDMXHZbK6CqwzGOsFs7O0Z5EfVqFxXjwpiM31nD3pPpl8WiCFAApNe5fgwDh?=
 =?us-ascii?Q?sP45yJA8DVx4QBc0dEiTE60htTwP4dcz7HhReF8aLzx/QCgJWO9+EW67f5Xc?=
 =?us-ascii?Q?8HEDLJD2WmGBYY88Z7Na8leWhMa9Mn1qySEj+08dvYWJxYR701xVYX+n2ucg?=
 =?us-ascii?Q?d59oYRLctk/gEAMvTAPM1LjqXfOn1r/RsMxdWuAvjLhCqScW8ux84qZ1S4SB?=
 =?us-ascii?Q?1NBoAW79tVBLONOa/fyS7oHHUcHH/3v5wjj9cRw+GVL2aOjPKM59CXPzQUfq?=
 =?us-ascii?Q?3euqTjlxM53wmke8HYC/6Lgbn7Z4HAtFABJsHwZwzuyZn0F1/bWaKx/KDSNu?=
 =?us-ascii?Q?eB+zbPKowZboTLnD1SLmzt13ffUBakcANUBm0ZcFa2/U9kc4d7C0TjYMet0y?=
 =?us-ascii?Q?PRYJbOTmV7BZb8UK3lWBW51fkxp+G/dRqd7wz1JDje9ZdzbTMCaEhb1zr9Lb?=
 =?us-ascii?Q?ZLMx3adhy9P0gaNX4FR5xYHz/iZlR5kCf4D9sUoFNurKBY3CxbBUs1Hzh7ee?=
 =?us-ascii?Q?SRTprT1xYELLPnnefzCtFOcYAuHRyaIsNKRQWHAf+UdqBrhjcyiX8KwC4t3T?=
 =?us-ascii?Q?6n2JyXldYhp2x4lwvBKZX8Mw2LoYwdY0Y6HIlN/sRBdKMGWJJVPQU6DfAc7a?=
 =?us-ascii?Q?RRsKHShmZuBEhtO6RRUtYCJbS/3LRbDb9nSftSQiI0s5G8Jhq7EBnQ+o6Yjw?=
 =?us-ascii?Q?qFrtsrAeWaEFZJ2U9g10tuwXfcQUSRLi9yzJwcOL8M5rVhLS3gneyjygPxHn?=
 =?us-ascii?Q?WBJarsnRTqRIbecjmkISV4i/lI1fBwNWkl25zMAs3IPUgCML0D8JyjEp2f4e?=
 =?us-ascii?Q?mO8Up2YDMEbaVsFueLGPZkY6l2rtwggvPU8PH+Xl1mXvxT7qgTP/dkqETwvk?=
 =?us-ascii?Q?LutmAH4a6HH2/VkDDNI3KsvFyrUFViHIGnFblqzixH07opZqgybxIPmZYEq0?=
 =?us-ascii?Q?Mi85LaiYvQshv1ucNWVzSuCurDpNRl28QJwlkCIFVtBV3xlsNxWvz81JX8NY?=
 =?us-ascii?Q?zyJJa0Ai0GKJcre/9p3mygpKo6deh5eN/pjDui9QOwnX3w2sx6juk7ANpi4i?=
 =?us-ascii?Q?hgs2UrxnnGXUHaP0Q0z4VLlnjF90CqFy83zN63srP9kDn+Tgf/V2LQ6rdpl1?=
 =?us-ascii?Q?gOuDbEuX/DXrZdm1ZfHsprv5jEB0hCZUKQhg5E38G5TzuhFxTOzK2gbwR3sw?=
 =?us-ascii?Q?mzL1U9Lh4+5jpJipO1CrkC1RfTRDSPVjA2rI4fr+Qt2U7qzgQ6LIXfYx5Hsv?=
 =?us-ascii?Q?v1q2li4EFJhpiKtfHLtk/tr/rURFRNizBDUsuO+SxTzPat0hP2uWl8nXtwhk?=
 =?us-ascii?Q?JCE0L732Cc12ky5MCdXwirgJVejuxJ87bhFKcXros7o59A1znCXK/XGFjlOE?=
 =?us-ascii?Q?XmpiZEMG7gvKq+62JtkVMtH0u4yOxNShhRiSzcFmpMnC8QVbkyseuWo0Zr9X?=
 =?us-ascii?Q?Vhoih4cuw9G59RNZJfJ3JA62qOsD4fwbVzKpfwmmIezN6S2TYQglaEesUuHv?=
 =?us-ascii?Q?6xcGHZGefv09KM+Ie2N5HcHPWU5Q0+PyehWk+KxNuQ60hInIEWOaIVWaQi34?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e14326-5a03-4097-32b0-08dc906154fd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 13:11:29.3367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YankB0IUY3ZEHOLXhgQ6vkaiV6SiH5XLC9OxMoaGwM+YMafjgCJWHUkcC/dDfYq0bN1sA0jHs5RiwFufw2q3iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR06MB8544
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 13:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110967

From: Niko Mauno <niko.mauno@vaisala.com>

Align to commit 8e297cdc841c6cad34097f00a6903ba25edfc153
("nginx: Remove obsolete patch") by removing reference to
removed patch file. By doing so we mitigate the following
BitBake complaint:

  WARNING: .../meta-openembedded/meta-webserver/recipes-httpd/nginx/nginx_1=
.21.1.bb: Unable to get checksum for nginx SRC_URI entry 0001-HTTP-2-per-it=
eration-stream-handling-limit.patch: file could not be found

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb b/meta-webs=
erver/recipes-httpd/nginx/nginx_1.21.1.bb
index 73b5c93c9..b69fd7dab 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
@@ -1,7 +1,5 @@
 require nginx.inc
=20
-SRC_URI +=3D "file://0001-HTTP-2-per-iteration-stream-handling-limit.patch=
"
-
 # 1.20.x branch is the current stable branch, the recommended default
 # 1.21.x is the current mainline branches containing all new features
 DEFAULT_PREFERENCE =3D "-1"
--=20
2.39.2


