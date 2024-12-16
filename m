Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E83CE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 08:22:48 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.117])
 by mx.groups.io with SMTP id smtpd.web11.52113.1734337363104456942
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 00:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@os.amperecomputing.com header.s=selector2 header.b=D6C4VAwU;
 spf=pass (domain: os.amperecomputing.com, ip: 40.107.92.117, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiE5m4sOwe+DeKxcvy8NVunwhyrVRf7TyJttZe5pg+jztQMTo7Hbh7Xx2JSOo1tbFGt1nclaYBxHKkiQW4wvSXmHIGGiNW0kXYb3EEQsGhFBa3YCYjFplZQZ8oBoYhjC3IrKhqotX7f2aXptjVBXxJU8aAJuiuQ+AprSGfIxyDH1Gcwo88qQ0TAQWUq4QqrlkQPGxWVED2D9HdBj2sGqXyUi3oSvR4FrlJcbH2gXw9TLVdMg3L6vtQpgtBR+mrL7g8pTesacR5wrya/2EK4VGA4JtDnSWTDNiWavq3aa1h6HyUBPrFgBjGqhZtlsXXwC67DN4/8tUeoXSDO4ZoT5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25NnDo742WQbf1n5tNoNOMcHLqPc/wKLwwLdN3BM+jM=;
 b=tweJON0AVgY6fA0aNrAL5hsqk/bd3+4wP7OS0YdJ3Or4Vle0MM7uqTtGMhe/ncEIx8OjL4vt/uMQBHZc5ixNhv+M5y+CpKpdoNm5azv28TZ5iJkai7z4YUB+QyI/cXM2D7jokh2E9VBoiNrsJTUwOtrD6RUvYoInPTIfZwdqOisI62b/kE3BAkZGd3PiwwFGP9MYRyihqOKi6hOgVf7U1Ur2sa3wm0BUZOE6gXpN0dk0gVcfAuuKelJ4+0vrp1ZqwVO5LaHMP3xD/tAyh1nxKQu5whZwrbCbR2K3JQPcpMAchTYG/yMMd7wZ2B71fNOt/4nMeUYUlYGegNH49LHKlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25NnDo742WQbf1n5tNoNOMcHLqPc/wKLwwLdN3BM+jM=;
 b=D6C4VAwUESAC0oqjGu3iZPgsk37gHnH4TFKDk5R/vlXJRmiKFYgyyN9IZVjCFa5dACl57gKgL0hukc0yq4UzdgzI2lkn1kQMIq3I4aNR0viT8V8fsLdjNPHI25HmTO6bEZELdr/tHMbkn007H2lSqFQzVM1VHk0+Yi2wTfUd/Yw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA1PR01MB6592.prod.exchangelabs.com (2603:10b6:806:185::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.6; Mon, 16 Dec 2024 08:22:39 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.8272.005; Mon, 16 Dec 2024
 08:22:37 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Khem Raj <raj.khem@gmail.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	openembedded-devel@lists.openembedded.org
CC: Phong Vo <phong@os.amperecomputing.com>,
	Thang Nguyen <thang@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Thu Nguyen <tbnguyen@amperecomputing.com>,
	Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: [meta-networking][PATCH] mctp: upgrade 2.0 -> 2.1
Date: Mon, 16 Dec 2024 08:22:01 +0000
Message-ID: <20241216082201.3302723-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SA1PR01MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: 570ba5ef-bbca-417e-ff08-08dd1daaccbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PhxKvcJi1R5+BGvrf+2//Hxxki/r7OTPLIQxK2HYULg2mTI5bXSv5H3oOEAt?=
 =?us-ascii?Q?FexEY5HBHPMfUHTQGO9SYQD6N+5xrCtNRPzuN+86CrAO01HApxrh8AuHuuSd?=
 =?us-ascii?Q?YTkAhd+bRWc/NknC4qZGYAYijb/9zwpDhnCWiM6/xjLEOBN3vOQBUhI3netl?=
 =?us-ascii?Q?w2pS/YMvaVVByliktIRB4exWXP2KKJiw6t/SnxC29XBn7bgK63IKjwYFljrg?=
 =?us-ascii?Q?9ypPCRVV+exAeC8n9haCOKrJFO8AjW3jXowCm1bGiz3D4knMS4kdPdRCtswq?=
 =?us-ascii?Q?GJD6E8PIbo51xccfBbltUtBL9TwsjoOWUWYwe491DCKUcOhcnneg2TwWluPY?=
 =?us-ascii?Q?8+tN8jgAEF63etxN9hVSodAbsGnyNtYy3T/WLPFfMizoT6ypAA7Ql9j7CVf3?=
 =?us-ascii?Q?jevlbJyPniAXmiMTXmnvZCF2zQ65jIHa7nxk2U8GvFJSKvC9aFO4riLYZqts?=
 =?us-ascii?Q?dHHldkK8CwRAETSv8EtqCGi7nv0mDTTZvP0WneFjhN+gCGqvQOau8Z0zShrm?=
 =?us-ascii?Q?KAQrqRDtbSk8lzVAHM4kgttHAc+5XwTAsNMypbj7dRNAu8k82Y+DWGDkalbL?=
 =?us-ascii?Q?hj7p19FEI5Y7VV9nat3Cs+WZxHeSZPQqPlPUTy2df4/6GpnFuktCYLdjsiZj?=
 =?us-ascii?Q?mvianyYPuuSuDOpYl1Rk6Fsmvmn+cp3Ub92lIl675lXGdu2SmbkpFkoE/B3r?=
 =?us-ascii?Q?gofpG8KIISMJirtET8Z6UpuaEWnI8nWOnvcI5bQ6f0tJRTHoAW9rjeOmPzyx?=
 =?us-ascii?Q?sGpWvurVBQRi/9UtZth5XCI0H5pguI9Sukl3AoOS8o3ma4Ski6gM7h0pu+LQ?=
 =?us-ascii?Q?IMREFW2lLI2ndFthAFllkm8ns5TFVikeprTC0iFaeieE1V898RR6Jqf7Ax47?=
 =?us-ascii?Q?rwW+b+cOMJgWSQSwrze86cYxu7/fLsTqt16HpEDgHjCN910C/LwfEpD0WiR+?=
 =?us-ascii?Q?ZU9mIR6ANRc8R58hX3KUeLGRXDHRqcAcwFdimkc1ZV9xuXxu/8ZmIYST/VBg?=
 =?us-ascii?Q?UCS7Rvvk/xeT1EqE+0Kxca0C1NyzPeGMZ103Z6CO8ObZNqua5O5tthP63oaE?=
 =?us-ascii?Q?PXugToWC7Cz7a/REBqSyibrca5VcPtpjPUs0xkGBVFnxTGStXPCmDP9a0zXy?=
 =?us-ascii?Q?s2tC0119XM1cVAY2qK9mxFB2iLHXrAXssYC16SRtKuBPzC/I/qz4nLDTYGAA?=
 =?us-ascii?Q?f7SC6kFqZ/4oDWV8PnPDMjIvhUl4yQzka+sw/E8JcVbRewq0D79qHNt4mul7?=
 =?us-ascii?Q?4SA7bJldX/MgSgtKv3JuBwvy27C1WjFochQdSeZX1JU2b6SxXMR7GfB+M5L+?=
 =?us-ascii?Q?1lCk3yL35t9ZFeDm+RoJo76eB0E0ajwB334DpNPRVLTVYXui3eF6X3TWWOJ0?=
 =?us-ascii?Q?6D20u8y5YIqYCiHa8MtRiEYcVXlv0pppognB6BwMGk+NAXE14f5Ud+pkuywK?=
 =?us-ascii?Q?YdQ+W8ktS5V+0eQhFn5YiiF1YUhUj9Y7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o9ic2OtYiy8RpI7+eyXUJeiRQMH7hA8poPbjd+kMJZPyHqS+uV3o/S3XkpKO?=
 =?us-ascii?Q?qoRJ3epLIrvb6DRAF9lGimZmw0B212DTxwZwBA3kvNaVmo4pq+aMDPXOKAp1?=
 =?us-ascii?Q?bxljiACT0IV6Vp7DHBxAY8giDDhjGw6n3pz8KeKk5aBy4jeXPPbc5X07tP55?=
 =?us-ascii?Q?HwB1NzxNRUsy9UHt/wQhDvm9+eC0cMKWtG4q/M/nqN3N888sCgzhsCTLNqNc?=
 =?us-ascii?Q?i/O9YhYcvF586NM0hFwsDAn8uVjtTMazHOpxCzkUY1BpxBnM8ybRiUgWMKxR?=
 =?us-ascii?Q?px4/po6QkZB4W0gCS06vZr/mi12fbIfVFTwGGFsN50necGhuyJmfNX1PbFq0?=
 =?us-ascii?Q?X7FlujGnJdQhvph4kxbBIIdy5prQjaFdyDGh+P2a4LwRcaFbkbuS8bBYHluU?=
 =?us-ascii?Q?cSNubFHTddsOI+FAHCxMQo0hctyLvJsWHk0Q/+f9/1E0DAfreI47VFhcGIZX?=
 =?us-ascii?Q?8dONHmFojwojwHt/EHZtI1iYrMUzN8UVDK9hFFVRKFB9hD29x+drTtaqDZbY?=
 =?us-ascii?Q?e/pXn+7Q3FOj6HMsbdkqi1KmefpHbIJQTP/unM+fROs+MorNvdVhXDx66COe?=
 =?us-ascii?Q?vtsWzG58bI+NmScQ7sYQB35kh/QXjNDnmHuvnbIDNe24OnQ8CF4H+jkoEWLJ?=
 =?us-ascii?Q?yFpr6zXCuw3/+Bfi/d9q8x7RueVbTY9P/Rh6TxwzpI1Jic04XNHjQMRoCywk?=
 =?us-ascii?Q?nBeskeUxKwylBW5EZhIEJBuGEfqVzEEOwPFCKawwY0tnqR4ONtfN056nCseY?=
 =?us-ascii?Q?NxVy32eo91AaRjG1x3SJi8koKZwwvIp8O+mW0JEPQu+6Ge2twl/2gKqh6pIy?=
 =?us-ascii?Q?DqRRcIA7bXa93GYmdXcCBlnsdTNv6LPUZR1Ee1DxdB5ENE2pI9Qw26xQGFcD?=
 =?us-ascii?Q?nnQPP5GnDmqrY7AKxAbHDoX7L8c7NaWw9r6UuFi9HqfQTAXHtdZb86SkRgzg?=
 =?us-ascii?Q?vWypW9UrTzlI7XTPqisAAanN9aL5Ajpu2ZDHKbrdc01Au5GY0qU+Nm04BrEt?=
 =?us-ascii?Q?QfBNSjnI9bjnBqzHEAVRHum9TEzPUfsA0f9GiWXqf/XPUox2lRVJiAVAI1LK?=
 =?us-ascii?Q?udSE22gKsTYRPBtmoEq5KmV/V82uY+HnX8RwzpLvdTfmSbf9zHgyBhx7ETBB?=
 =?us-ascii?Q?zl+xGO3fYJFBG539NrD6oZYAxfktvUijQwx01oOE3hsZAsz96V/jwbWo2ngT?=
 =?us-ascii?Q?kSP3zhfGqkwLrt0sMqpioZ+ZgE9jjbArYbtik7SOAR+dc6Elx+sLpbjmeUql?=
 =?us-ascii?Q?ez6E6ViVH1qBrAiVkKI7HwuH2dwpEJZS2Wo3CmcmAPtRAz1vm+PLeDTpJ8IH?=
 =?us-ascii?Q?svfpZPvNZakoUM3DbqkPpYkIFV4sjCqfIZ+ffu6ZRKlts/fs4+sH/p6dL/36?=
 =?us-ascii?Q?GAXbKS+pbcbe67zbBhB663gNQvhwC3zceIrEiUXsvgRYegMpUVFLseNn3tT6?=
 =?us-ascii?Q?f0OavAQV/DsrGCg4H/iPKNz1BhVqkbE2ckIjWeisC4aXbeVRbhYinAsVXEWX?=
 =?us-ascii?Q?5m7FTgHgPbPyM8gqKSl24Puf54JBZPQzzadkWIZ40a4Ww4bWeBDz7d3qW78U?=
 =?us-ascii?Q?33txYvQrdsaB9GLA5I6Vsr9myKThczralnNM4xGw8mSwcf3as5PCC8k5hiF/?=
 =?us-ascii?Q?U+C+FNMy68vnG2oEpi/t/i8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 570ba5ef-bbca-417e-ff08-08dd1daaccbb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 08:22:37.7356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6I+qjC4qCVj63sKY1EKwBkqLNv0JvaQTLhltDVraDk+Q+FWtky1mZ6fNRgG56Y5Okjct7ADbPnAwOeOmk6Fpw718sw9b3Ok1gKhuLt+Yd0mH16F9/wdOc5x+1BEee8n7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6592
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 08:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114322

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../recipes-support/mctp/{mctp_2.0.bb =3D> mctp_2.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/mctp/{mctp_2.0.bb =3D> mctp_2.1.bb}=
 (96%)

diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/meta-networ=
king/recipes-support/mctp/mctp_2.1.bb
similarity index 96%
rename from meta-networking/recipes-support/mctp/mctp_2.0.bb
rename to meta-networking/recipes-support/mctp/mctp_2.1.bb
index 24f974774..931a4535a 100644
--- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.1.bb
@@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db2=
1"
=20
-SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
+SRCREV =3D "9042704131d270e713fc267d3cc84273bc995315"
=20
 SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https"
=20
--=20
2.34.1


