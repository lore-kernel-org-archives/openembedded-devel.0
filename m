Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C92FD75BD8
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 08:29:41 +0000 (UTC)
Received: from PAUP264CU001.outbound.protection.outlook.com (PAUP264CU001.outbound.protection.outlook.com [40.107.160.128])
 by mx.groups.io with SMTP id smtpd.web11.6472.1732177773316989998
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 00:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=dVXOUC2R;
 spf=pass (domain: ekinops.com, ip: 40.107.160.128, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UC6yoA2kdybBh2qp1PTWXeQusNh7gU2lRfbTgoRzB8BiXIVeLoPB5fSnRh366FylMW7s88TFp1YbFya/2cf4FIWknUrNJl+9zGEyeef0XMwek/hgUwuUmIHa/YGwffx3YFOfKyUTH/mPEb6QnwvCB9N5ONkAwfzNK2eb3dRDZoDrUAZ6hTKlR0RQdF5tzBDz5TQ310OkzfAmW7bA6RoelxQc/4P0akL9sEX83Np4ESuspqYUtmdHOejNtjE9ZiJtVJKLqvR82Z98Hoa+CgmnInOn4tLV2tQAWm0c3gyp2p3QdauHDAxd434DKQR20GauiL+Mt/sJXLc2u+cv0WPhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tzoe4u7LFI7nAuy4zSWa0mqg6FuVmyjRoFsHPR5EipI=;
 b=SvsMhIWwd4+sox3/a4FP4US5bhgvx9kp49RLxgZaS921u0W99P3pFVYO+QvSJTvmpzOwwevZKci6tXY6myLu/3f7Kz+qNKgI87WY0ukPj1jDHdLGLKLH61im6qrLf2y0jE7gNYs+L2c8KZEn0pkDNJICAolgkhDXq/DXYJryIc5/BMBrfSVdOlg/StUWjFgFDvlSTOisP5RsNy+XU89q1R7HiBC1W7YUA++ced+sDNOjFvGi5wXHzJox5JNEmJAA0lB6IbD9341zgoF7Sh3dCedWgb8TL2CEN9cIbTUdJRtoqzKTz8QLU5vK1uRPtLGR1SqyLKjeGrdOGqvKym17eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tzoe4u7LFI7nAuy4zSWa0mqg6FuVmyjRoFsHPR5EipI=;
 b=dVXOUC2RKZ8yS166RlYX9F0NiP4ZAYjYoNvcbTYVhzr4buOQvY/iZVKzzsKHR84mzoqL0ycgI5iGJ/Z/aN3b7ESWhuvy+6VvFVFrksrbVYt+S/DyTOIkTcKYOH1d1XMZq2lVakNWMoXcNKO1e2cyQ97WIzLa21QmOM8uaekCrJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:255::23)
 by PASP264MB5740.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:49e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 08:29:30 +0000
Received: from PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6d29:2327:f523:aa1]) by PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6d29:2327:f523:aa1%3]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 08:29:30 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-networking][PATCH 2/3] bridge-utils: add CVE_PRODUCT
Date: Thu, 21 Nov 2024 09:29:00 +0100
Message-ID: <20241121082901.2747720-3-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121082901.2747720-1-benjamin.bouvier@ekinops.com>
References: <20241121082901.2747720-1-benjamin.bouvier@ekinops.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0224.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:374::10) To PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:255::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR1P264MB4342:EE_|PASP264MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: a2819f7c-9be6-4e91-3921-08dd0a069ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iDH+uOcd+gRWAvSvCZKkEL+KC5yGAoSfJS88WvHpJ8vEFhuTT9eTFFY5B+iT?=
 =?us-ascii?Q?MdUSou3OrBVY7UxIPH07ty/j8euzRhqdgDpb19gxyd+FW3rpwfnJ6rTe38rX?=
 =?us-ascii?Q?CfTuWpqIE3g7FSu4PfcIB0113gN2Z0rFnza3m07A4im7JXinmm5ntOHKqn0m?=
 =?us-ascii?Q?5SWY6AdsbiOwnduls6Z1BHOXJPetgiXciKSQmZpn/4/pPo86LAWjNthKYFku?=
 =?us-ascii?Q?kZkhAmq9Vt0FagjdEUpoewxJiGmi+YEmQ2I/viA5EVganua7On5ePrrTJDBh?=
 =?us-ascii?Q?5FPduxhDyn2zAhqwKl4M7+7Gj5p2w0Ts7nylgzsl2O/jLYJ8ZufFr0u0XIbF?=
 =?us-ascii?Q?fo58JsFYppuXIpB4yIl1F93nQNoNMczpZb++56g5NA5HWF03hJuC5qPtuQlt?=
 =?us-ascii?Q?NOk9/Ww2OZEuVXoPq2xu9kPTghlAaNNUkjm0awEpmSHA/zw+j3hxB/myZjaJ?=
 =?us-ascii?Q?x2dCwbKYZqC4+DIPBhE2Qup+CFX5G3pDX3cfZ/7d5ZBE87j3HAvTRwqK2PjA?=
 =?us-ascii?Q?TojLTyFMJ09BdCWdZnGwnjCzKE3wOxibB2EJ4+x8rxvLX1I6tlByEoV6NzDQ?=
 =?us-ascii?Q?9YpAEJZnsYS0z12n+UuTIGMz8dukpvhtuUdwUethEX5VGAaVKOlSmUHGjnX6?=
 =?us-ascii?Q?i2CwlOD2SfUXIk6EvXZs1ZpqTexdkmFrnvSazHa17spvq9P4FUIynOb/Uy89?=
 =?us-ascii?Q?VNMx7Y8HsmsJbxoXi82KWYXPDo4EW/Irkl4HcTpZ1j6GVsGaTnPw+BbEhYVL?=
 =?us-ascii?Q?h6xTEBRHo9ZueCCatnZ3ekyzUShEqt8HJpkp1NrFIanudfZ8PijXvSAZARmu?=
 =?us-ascii?Q?LEEuljdIqtEUN1SdQL2XlCfrSf1Esce1kku9KpuixtCwn9BVTXly3uVuIBo0?=
 =?us-ascii?Q?0byUOX9lJmXOX5HRuOUHA9V5Wt3dTGcvl08p83D3iVbqh0eUcVbqWtZNK4Nj?=
 =?us-ascii?Q?qIcltR52xB0FL9NhEo/sB0D8TOvO7hKwYjYMx/zincieN8GCpDu3m66cF2Yz?=
 =?us-ascii?Q?Ah4hwdqcQZMlyNAJA/w64IpCZAODM66cwGNrlRw21dtlVvhUg9DS0+igkdBR?=
 =?us-ascii?Q?DsU+baMou+KGaJgd5HVVxr1kLPkL3OKCgDxnC/YYfIp5NIAPa9SIrzH5MPR5?=
 =?us-ascii?Q?1F4JWVFyupL3dd8wc20b5T+6ac++hzA7eXsL+vFxpsDV3QYwDwcDJVNaGt11?=
 =?us-ascii?Q?IsxU5habr+g3X+ZF+igk1I55glITz5Nsx6WOdBId74RNAm/mNuZS10AAr8hL?=
 =?us-ascii?Q?XXtipEj9dVEFB51DqGM8vWmwMhRTQCFEJLLb8oLdSBIUE6QXrHDYS3J4/LRd?=
 =?us-ascii?Q?Nuyp4ObjoPtXa0Ma36kt3uFDlfAk9afIF0mly+7gkQyH1Cx/9LYesqJIDhaa?=
 =?us-ascii?Q?B8mDJU0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9IfBBZjK5ddnazKDpJhKkevGYaplkZaDut0sI/HS3nBJchwpH9j2Mw+S9Ryb?=
 =?us-ascii?Q?7whN6mjNZtvy6CzHQBfSfo6txlBJyN/BFJ5Oaz7EZpHwrL+DA8Vr+hqe+oVc?=
 =?us-ascii?Q?y9uxyjpCwA6EUch1Ws5MbgA4EJiV7EUkdstyC7/DzVtTCsFn00sqg6U4Q4t5?=
 =?us-ascii?Q?7bhuJTk+QT7tBb4MZYqyWSTMtv5LEo9SWFJrAfrV59TW/q1zIyuMO7Xpz7G5?=
 =?us-ascii?Q?dq6G2JXT1LjwsfsKbmOa4WhiOifROBZNMMZ2Be1rKqIJHKsHwhz9yD+FL9f0?=
 =?us-ascii?Q?+w4+mFFSFyIlE6hkVEnzuHPPAY4nZ6vNiYAboHC/pMKrgICOGL8LLsJRtPwy?=
 =?us-ascii?Q?BB6RaeW1yD1UI2KRgzs6FLmZblzdR/FSjIPTKViS0ngOF+cx+UDUgiiuAtT3?=
 =?us-ascii?Q?MWvIae0x1vkmvJRRxRq8dIxpAWKvEvtWwmc79h91mE0s5eL/Yfcige+ptzdw?=
 =?us-ascii?Q?IRQPyDDmWH/JYiGgJlPG2C7/N31VBzIEPdHrxetZ90v/JZUqvRnlA0wOjwbk?=
 =?us-ascii?Q?O1rSl1KtBVMRshMIdA/YKX5UHRYTH5rPNWXu4bDqLXOEg+2isoy4NLQJcCpl?=
 =?us-ascii?Q?s9PavLY5Af/y2SBBX9rJnYhioVMgiCgh2zq5hh6N5l+MWrStrfw/8r+CCN9p?=
 =?us-ascii?Q?2+l1VBQpvZS2AGZujiPPotBzET/KqZ//HjCbk83Pdp0TSse8VqEXLszT5vwX?=
 =?us-ascii?Q?wZrdGeCNqXw4q+Rf9NZbhjSJ3+UyxCU2P5PFnRoQdaa2Z0KWPNi0E7h05z5L?=
 =?us-ascii?Q?qgAnx6Mh4VIAHr7irjjn22+FTSlPT1ojWBZp/AQ3zoJoLGaE4Euu0ModTzCb?=
 =?us-ascii?Q?YiZYMOrHWGE2Bz9sNoChKUYgr9s0I7vFzuP5He/t5wXOpujCQigR+CbWXJOA?=
 =?us-ascii?Q?YQLnLYWDnKzwq/OLUWvh4N/brEgCtoreKopm1uOzcrnjvyAoyO5xm3tSSfmA?=
 =?us-ascii?Q?gL6fj3X04zS1UxiVpi0HfOT3MJqBSMkEck0Nnh4fefPccj/s/gltVdF1gZEk?=
 =?us-ascii?Q?SmQ+BJYPGCBtoyULyzcS4wxVxTO/i7K4PfWMMt6Za27vfxPhzOFkERvItXZr?=
 =?us-ascii?Q?Wz+Xanpi6Lo3hiGj/5gtFaWCbotUCJpk5NLNqD7iYnKIKlHXN5PetbEsoSuW?=
 =?us-ascii?Q?MEVFBlFTZ9LiNkrKDhGHajVNAN0XydnZCpQ7T8ylQpthwcwxnb5TNjixqGnB?=
 =?us-ascii?Q?Y5i4RQlgfb+4ELXmVbMyHbb8dxSgBm3joQ5IIY+ByNZGAUJ3Ul8IQBP4Q7Dh?=
 =?us-ascii?Q?kvNjRmQQaSK0zkh7GBXTok2IVUSMLUPktCAqWWK785vKVy+w55lcND/77CbR?=
 =?us-ascii?Q?qXRaqrm2vuhjhowVUbjTk57Vwi7vNBBm3Vhv7kaHIaPFvnc6UW3hNt74VO4c?=
 =?us-ascii?Q?uwtEyS5aCflWUp/W4XWME09PevsXg63DaNzVUgOyhsd139phKBELvo0T+zYD?=
 =?us-ascii?Q?WqHs5fVT+yPkG+VosigJcBXq6r8wBRSpGlJnpguc08RWp7pwKlEE8FYiCYXa?=
 =?us-ascii?Q?gy9HNEpaJxOZSALMO/3MY8xSUnUe/KkeDRnfvcC61405JQ1HqG1FI4O05LUh?=
 =?us-ascii?Q?zCKpKg3N/SvvUfzANc6A7+2YxmHXFMdewRYJ8W9aNH42718gQQyEMOvLJ/V8?=
 =?us-ascii?Q?BA=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2819f7c-9be6-4e91-3921-08dd0a069ec3
X-MS-Exchange-CrossTenant-AuthSource: PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 08:29:30.7612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPbiOQ0rbg5OAT8qDIktOVpSuGBmBsbNO7EJA4udolRziujOL44RqjDkNex79ohEzogA49EzkaDIC04wW53/tEJhGJb9khPEY7rfskezdww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5740
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 08:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113959

Add exact CPE name in CVE_PRODUCT.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
---
 .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.=
1.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
index cf0fc1c33..66c8f2d05 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
@@ -19,6 +19,8 @@ S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "sysfsutils"
=20
+CVE_PRODUCT =3D "kernel:bridge-utils"
+
 inherit autotools-brokensep update-alternatives
=20
 ALTERNATIVE:${PN} =3D "brctl"
--=20
2.34.1


