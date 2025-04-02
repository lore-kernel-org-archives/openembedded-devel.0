Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949A0C3601C
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:31:19 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.103])
 by mx.groups.io with SMTP id smtpd.web11.4913.1743589870249213268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=YmqCmlyv;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.159.103, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rB2VuWxj/7ekQ1ZuHvwkK24+cOEPqrKI8t+NPjz4WmA48WzR+NL0cbv4Uj9s9gtMR8JhXtL33X+IfsJ4vMj1nODjFenmp/qNyTvVRnaJhI417aaPVe8PWHH5N8CAeP5WNfqO5PungPivjCGujGkCm/f9fPzwNCP17WcFqGT0/mIuYJK3bZp+gqblKOum6vsW9OgfprCxsfCUeH3xt7hop1YkzmkuZlS8gIj3MUgLFgW/+S7lOZ5DyQj1h+wkAH/3a6ndOv88KUTqvI0BJT5PQmv6WPaskngmI/u+3jgQZ/q7YK+AgzYFZtsfVWMg8iMjjrXrw4UbSZWNh6iYatsIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq2LcczDs6o1NS1a6z5f636L4rQouzzGAWUeO7QDKZ4=;
 b=qWdY36iKtDMX0OG32HEYAC8eVxdLhqJUcpxSfHWjVfe62S3IqgRXRFSZZ1AiVbqAhQHHGnSoHz4gOmJ2grjOuD+RhjxkcX6ldY0l61nV7Crm0e2d6gb6U8fA2oyittk2xhujALKle6v14POgCAcMbEB+u4I41juR9jDw9IvdWUPuIandYe2H+LKvHlL1nsweea6lbrPzGrP44egafPIttbLzLMxK0RpTeu74qY4yo58Zu8IqgctRMCL/meZKhpPvgvabzPgNsgB9ASPElElPIzjkLDXlD9RwWjgXEifOflRKhncKXQ6XnifypmYqLEdFFeNeG+XzzFdh48087Dsjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq2LcczDs6o1NS1a6z5f636L4rQouzzGAWUeO7QDKZ4=;
 b=YmqCmlyvv0tAnbA/3zP6Upu3lpck5fU36PPsmUxysnkm916R+UoVJdmuFQNmc7vjWNvlcGejiCYz5llOZ/DLJNgK/fHR9e01rDGF2fo4WBT9tlNBInfbm08axznGKGMOlc5LYBfmilokdcFQUgyqmh3UxSqXymdf4nbJ0AiUrXK+AWko8TJ19nabbkiKYcGU+ScpTXL79EZCGIOMJ8Tp14zWDdRxTdkwl7Tlp5DCrzp63XxguvugYcVeYMK0WgvMgSydY/RCpYAV0jRI42iCCx+tyfexh7fu9P2XNQsMHA+X/JgA1jxyOfkm5wHZR0bXZRzGOGLtGWl/MMalkP+Hig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by PA2PR06MB9397.eurprd06.prod.outlook.com (2603:10a6:102:402::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 10:31:07 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%3]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 10:31:07 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 3/3] dbus-cxx: Support using alternative runtime D-Bus
Date: Wed,  2 Apr 2025 10:30:47 +0000
Message-ID: <20250402103047.3142275-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250402103047.3142275-1-niko.mauno@vaisala.com>
References: <20250402103047.3142275-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0045.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::16) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|PA2PR06MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0177cb-45c7-46aa-a581-08dd71d17a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Aw7nqDzmOy4eT11Yu59TaB/IYe8saW7CL0yfuYt+QnWLpNFp1oapWNeeucud?=
 =?us-ascii?Q?Q04uVAnd1eaDuDZHuVLXrD/eN4EYvQStX6gy4bYh6kYo+bmysWIYVa+rbCD3?=
 =?us-ascii?Q?GD9muQ0ZYwxmo42MAobNW5UfMUu9ONK+XxHT985CCjoA12wGjpiMlIKsFmyl?=
 =?us-ascii?Q?hU0/CscODlo6IMktOr7arkR2ViDiIE3gMY4fvCPQHSAdaVeD/l0I5dg7/CCI?=
 =?us-ascii?Q?Zj3XjwPVT1Q/ZnirSv0QlyMhY/NF3yoHPxFeQY4Q0CU2pq2k1PniyMX346m4?=
 =?us-ascii?Q?r7cC8+LwfQiEsELycUrAP4KggSdiKgQ53LbatBdsZ+zcx7N36tvwSSjwX9gp?=
 =?us-ascii?Q?ju8OaWOarTKcn9Ya4FE1MWMhntoKYxyjvEaDkasyOHXEXTObn8ziLIhjfHLJ?=
 =?us-ascii?Q?g/DH2dWegpOLkt30I2cAhZns/kr9V3KIfnNmjUJYfGHtcaAHK+0kdlAwUivS?=
 =?us-ascii?Q?K6GW6KN2ZJztNpVtYPLEb7Kasrra6kwbtQry7QGERCWg0jJa8XMj8op1U5Lu?=
 =?us-ascii?Q?ZHe9dJ4xyk8bf5IfecZkJL1tITJ7IWyTLVPKpi4nJLuwePjLx4KCnVpZCBvS?=
 =?us-ascii?Q?26Soxzeopj+aHbrcmrGMZY+INHkNhH6xdKVgdo1ewS5yV6bncA0rOU9eGzMx?=
 =?us-ascii?Q?OoGrqs9ynVLo5//Ic1wuEx8lSxXXXTCpQyScQFkTNFHrmvID0kdhKPWmipZh?=
 =?us-ascii?Q?CGZm7QBagtW6zrZAmIliJ02fuU/aF8DavQ87plvgw0W+O09sTS99Ao9jXu3j?=
 =?us-ascii?Q?mr/Jo/kaCGEycNtiLTOX/qEzML9LGF8ia0wbgZz+0L/1tDdExvocguHrQuQt?=
 =?us-ascii?Q?/X3T3G2R1lKq55gIKQH1xH1CXV2KQfwdpZHFRY5CKMkMHn5zQ78W3AOK0cmU?=
 =?us-ascii?Q?tqlUtJ4dVRzlrSc4bZ1TmsH+KvVL4arB8AhFfkCzs+yyed0rq3IxU0sMraS+?=
 =?us-ascii?Q?l4V1q1PYESp2gXANDO7T/aQoo8gZlP/3ftKdaDHUT0ePO6ERfo5VO5eu76F8?=
 =?us-ascii?Q?qluXzZb30vHkud4EJ2+2AjPenGzO+DtNZUE6IShETCicaNnCeWU52P9dnQvx?=
 =?us-ascii?Q?5/dUv2+wv8EoBNK4mPf4jBXI+8e4243/WXR3kacUPQI2XeeHjca53DmRXsf6?=
 =?us-ascii?Q?9WIYN4cujpEll9dVxN3lSsyMX8pqiKovnwLH3zsVs3U6CKgNNpNETwKDlLuR?=
 =?us-ascii?Q?2kWWgZrpqKRc8sTG9VWU8g+xWJlTNJeFCe2mlXKTo1fM++kSXhyWbJ/uw2zc?=
 =?us-ascii?Q?vGn6wjg4a3imKBTUJNOyLps7NpB/fhSim5HHmJxENb6PllNpaGy2RZeROR9o?=
 =?us-ascii?Q?f9uL0/qI8so16bvtJ4HJrZGTYF8KOBSf0Mfz1rmZS5+Tz8rKEjsM8sdCysYn?=
 =?us-ascii?Q?OFjY3vKXfrUXhf83Q8f/mQtrmLomUTQqfZy3Nl79d/b/0yauzlEXGShDKo8Y?=
 =?us-ascii?Q?pFAlFenrK4S0X0JqaSgvCMdwJlm3uqqoHYdN2NWavYE4kJuD29dDEA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R82aDHpK1LsNaP0c6xu5+isFpiRSnkBVKcinp0AMlK4CPEddwEG5bxcAbkAc?=
 =?us-ascii?Q?PpAs9so1ozNcJ45Ge/duseNx8fBOtsai01FZ73ldNGXD/OvENxxZ4ep9z5Cy?=
 =?us-ascii?Q?AXS9N/3+grOcLwc8OYcrAfvvmbnJCUOR3Vpkb7WFUCs13VhTZ07MSTo3cfuj?=
 =?us-ascii?Q?xLzvGgSBAv3RQEPZ4WkQJdu14sZq0d3VpTigdSymoGcYAOsN5lLzrkkMADBN?=
 =?us-ascii?Q?Oe84YRcNW90dPhwN8XAApky/BLgsTfP59kmA9q5y3LShI0w4Qq9R04InG8v5?=
 =?us-ascii?Q?K0KEAqnmlnCxhJ9mtViuel8RdVspFKEqL6FeKaiHekAX1RdX/pnI+ic1Hk2b?=
 =?us-ascii?Q?FkxccbkY273z57uke/7hiL59vOGeAzA7CtIqwH/r/Kt7Yz6xleDtFfkG77yV?=
 =?us-ascii?Q?oruvSQSMu6zikQON10djVtU6TjFrBHhl5veKxmxccBCe7wXDUrGegkFXkzrc?=
 =?us-ascii?Q?qUz0pJYgzinNAyeY8rAyx05LvOn22Hy5KTmWzgW7qNY2ZJEqJ0niRxZjbTQd?=
 =?us-ascii?Q?0/+wmgdUKGwUku/ROVXduDGKuh/Iy2IC2YXD6cCmN8tEskgJ1JIHOZ6ABqC2?=
 =?us-ascii?Q?0DasTMEmyqalyDZAVpj2XvqvDLwVlyQr2my/+BsH7FO4zqg7t89vjbLWsw+/?=
 =?us-ascii?Q?inBJFF7/30vA/0/60L0wvjrsdVak3uvd8Wg1wanPrw38Ehm3rOsDbhiHWBvg?=
 =?us-ascii?Q?CA0o74U3qsJe0GAABSIvmKYIyYSWmr336sYJKh0dlISzqyinQ0M2oHtY2YVO?=
 =?us-ascii?Q?6W2/w605V2fKoTB6gtcudLqLCUTBM6grwKV/yMPzER53B4P2FonhzGO3sgIe?=
 =?us-ascii?Q?Xh/v4Hc8S2BGg8GRcQm+sZGIiy3Q8omNsDpXiuoeGEfGZWH6m2IcO9CJQLuW?=
 =?us-ascii?Q?eAfFfsCB7xd8JKFXef2PEuEMePzSkB2mtWg+oQutAZC50Lstixb2tY+4kSLd?=
 =?us-ascii?Q?Xv27cIantK+dMpqunlT9H+6L9z/6v60JZAd5uur1qsul4LRnVpUTBiEUdr2h?=
 =?us-ascii?Q?lr2nuRv29gOPhY6fmc7XzTT8whq/AS8gMKOiBJOIpTsUCsD1DDk5jlTpt2x1?=
 =?us-ascii?Q?++dVtxsptrdRQ64C5WpwBKgZGcdWMWZzySbKsrtJLT4aJqdi/XJJgENRmm61?=
 =?us-ascii?Q?RDc/bkK8hqfPrEWtR8YhPysOyJBRyKyJeT9IPaQsoNr87bC5jBHKxyUXQ0OM?=
 =?us-ascii?Q?2VquDUyFvaD0F/5mlwQOOCps7ErUtxrvaa05EYen522nafOmr2OWXvQw2I0C?=
 =?us-ascii?Q?frRjeCZBPlrbrbu7+svZXjgPOabCtUNsPNX8PzFaFsmcPWdPlhGZqyhRXbfL?=
 =?us-ascii?Q?O90sPlMJ7o0kcpWrwB39vVXitlVS0Rl/cmH9EhHRHroHYNMadoKaP3tYdUzE?=
 =?us-ascii?Q?S2mcREPzim8enVmOpUKgiwu4fJxrRmJeFGHDukC5Ke8FJ0SXVoHlffz2tqy/?=
 =?us-ascii?Q?LMt4UO3BwgEBJW1n7r8gqpwx6u98ysNTOfDOf8oD9mIZ56u1M17t1140FKr9?=
 =?us-ascii?Q?Kp9gZ7VxKOtdFDaaQwVkzBpajjZXbHu/NXyXJT38vu4p0woliiJX+jS8l76+?=
 =?us-ascii?Q?w5cVL+ai/797rVfJdX24uPPp2Wu3Z7PRYu8eFAAlEpzS7bSQQeacNzVx/V8X?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0177cb-45c7-46aa-a581-08dd71d17a6b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:31:07.5154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gptvWRIBbxKfIJ0ZGi18VmXWhPbyqqjljiQ0gZYWwtbFdiYBle0QBTE536mOZJiqvfgzz9aXmqDxUKvFmkQ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9397
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 10:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116519

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency to honor oe-core's new VIRTUAL-RUNTIME_dbus variable.

Furthermore mark the runtime dependency as target specific, which
avoids unbuildable dependency chain issue when bitbaking native or
nativesdk variant of the recipe, when dbus-broker is preferred.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/reci=
pes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index a10f7f22dd..992a414009 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -10,7 +10,7 @@ SRCREV =3D "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
=20
 DEPENDS =3D "libsigc++-3"
=20
-RDEPENDS:${PN} =3D "dbus"
+RDEPENDS:${PN}:class-target =3D "${VIRTUAL-RUNTIME_dbus}"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.5


