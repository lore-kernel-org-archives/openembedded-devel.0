Return-Path: <jhofstee@victronenergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0208BC369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 16:36:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.103])
 by mx.groups.io with SMTP id smtpd.web10.317.1744994208409074916
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 09:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@victronenergy.com header.s=selector2 header.b=m9CZ3DQX;
 spf=pass (domain: victronenergy.com, ip: 40.107.130.103, mailfrom: jhofstee@victronenergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7wPdKzbI9afVQtsC9PmgMuQbpoHLsXa21djmMXSRw6BppjGDApS07BZQQKJ27CH1PDgMqhTGy5ECVME2wRBPQPbHJDkpspziCRKojWuEDhzi+1O2j8+jiRXHdjtnJNmY9eKZn3s1EzbJwVIDeJrFHukA+kKDuH+ACUhYE7u/tiiQKw6bcG4tFNc9feH9eWNJdGuHPOIyMeqxRJjE9IQdC8sIvB1aBShrO/g5aCUYKQG/F1s+2z9knZGi9cIPxEqJFUJ/AP5x95Y/eYjaS05j9FIIjojrvLsARn1tnNzBJsug1gPWysopuitYt6HmMbhYEEed8KQqIbHOPbalAow7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TROrP25Jm4bQ8Y9EBOs4wJvUjMMpPVyEu4UMvtmpTB0=;
 b=JijBpqhzvat6DEzYoq3emDY5I1vLKu6t4H6HD9DYOP0ePEDg6Vh29OneeTP+OnGab8btC95YGp63rF4i3DXos3GKQrg9aMUPbMSOCMP1kDLXzucCPE8VplwwEygMexQzl/yoxOelajfKnzIzL5S2qdNuHVCkCCRKACd27GqbnVv9UjlG8jyL28E9GFUxSNRdhdoPrNTUMyDyck5J6Rsv0fWoQsXfYxo6zkEpf/0vE/ZAFpZZdvKO3u+1/rc67No6UCE3oylNzMPeMt9V/c857XyGz3dZvN3K4DZV29M6pY/ulry3t3vOXw592eKJQVuIUgR1pyKr7yap5/z3R23QHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TROrP25Jm4bQ8Y9EBOs4wJvUjMMpPVyEu4UMvtmpTB0=;
 b=m9CZ3DQXfTUEId/VgneNhXS6W0eM9OqAGlZRXejrVNqcqnPEbdkxrI96/gqdSqrncAMS3djlf67mSF92wYAaf7Moi7ACkqRhn19bkO9JDB9IoPYZ282dIy3zjCq7IEUJj85QvipOrwGNR+AnlslYGAfZLJLMGQxBtFM7Exejvjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=victronenergy.com;
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com (2603:10a6:10:30e::14)
 by DB9PR07MB9390.eurprd07.prod.outlook.com (2603:10a6:10:454::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Fri, 18 Apr
 2025 16:36:44 +0000
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6]) by DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6%5]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 16:36:44 +0000
Message-ID: <c8d6fe0b-cf8c-45d7-8f0c-e603e6b89ad0@victronenergy.com>
Date: Fri, 18 Apr 2025 18:36:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap] can-utils: Upgrade 2023.03 -> 2025.01
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
CC: akuster808@gmail.com, openembedded-devel@lists.openembedded.org
References: <aAISd7n7umT8UHQ9@alb3rt0-ThinkPad-P15-Gen-1>
 <4e0908d4-2ace-4f30-b1c0-4af5393b55d5@victronenergy.com>
 <aAJMgtMTzrAcKl1q@alb3rt0-ThinkPad-P15-Gen-1>
Content-Language: en-US
From: Jeroen Hofstee <jhofstee@victronenergy.com>
In-Reply-To: <aAJMgtMTzrAcKl1q@alb3rt0-ThinkPad-P15-Gen-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P195CA0016.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::18) To DB9PR07MB8679.eurprd07.prod.outlook.com
 (2603:10a6:10:30e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR07MB8679:EE_|DB9PR07MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: 759877ab-4d2b-42f8-144d-08dd7e97345b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5bvsoEqOq1S3Vt1hE0YBIsUUkPjQs7ePep/CUwNJkD5/i1mODEEas2lcaX9b?=
 =?us-ascii?Q?G3uhxZD6NmIUVT6foyrX9IuYwFt6XFdwuhyx5yWr4AJqzAGXgw1Orra3hPwa?=
 =?us-ascii?Q?xduDRjRMrkUu7oB9nOfZafTSOdK0OyDBcZsDcCDk5hdXCI+K23RtnbhKHp+Y?=
 =?us-ascii?Q?VNkPAAF+NQ73U70NXwNj8Q4Z+1qxZGbPrpN0IGSsiua/rEIIp1QJtasy9H2a?=
 =?us-ascii?Q?jupJBhNhh10fAbXVAoJ9MAImedwzLhvH4+hZJ4MwSzJ3NJxnL+umSXIPs9Q3?=
 =?us-ascii?Q?Kd/bMYqRuBe0wC6GS++nLtioJvtbuO41IqucIJDo+E4haiOnGnvafv8gnvgR?=
 =?us-ascii?Q?3uDCpQgdphA733Z/17KUJTalclAMaOnWWxMZEOvNQrKe4BCNRclYi5VUo6yw?=
 =?us-ascii?Q?eqbu41+3gME3ZsGOcS6uf+J6AyLojMmAJsXekdFtS6BrDxnBlYFDB/3DGZ2j?=
 =?us-ascii?Q?FUgN5VYSoU/VArEmknBAFaGxYNkgW8yUWwjXXMWjHnFoFRh04rVOejT6rNa9?=
 =?us-ascii?Q?ogFRxIAyRPVbFwmNIuCzoiPTY79WqButo8m8vl2gQnDhfXD6pFoygCDUY+u5?=
 =?us-ascii?Q?5ydcQowwUXUm5IIEstYStCK2r0dbfNE2BT2nB3RHjbxJ5j5o/KAYqh3aQyJu?=
 =?us-ascii?Q?4e+V11irAVjVhe2w0AoQr62gMNBl+Sk8AF7ahKPY88LMU48h+s+fDYAG/bVO?=
 =?us-ascii?Q?cyo6Y3zUAkQmYehRnv/oh+o3yEHbix/oZ5SRq8v1SpNIpPmLYOrDWp+genHj?=
 =?us-ascii?Q?eAHbScuul1/vozNJGyd4gIpwPDwLphHPDI5/XK5DnyLI6PhHMPI1zddOXnh/?=
 =?us-ascii?Q?74rwzwNh2WpcbKFBbMzOD6e8+/KqnTioXC5YGDORbPpq3HwQY6JTx1n37x6H?=
 =?us-ascii?Q?XmevF0XO6mYlC+lW+M/g/SmvjOh4sOHtUtcSe+brcqOBPMy5VGaQ3AcvILdT?=
 =?us-ascii?Q?sptB6q8KiUT3EvRW3wjoqH/pvjITvVdzQsb/6PpdrSZjhikHLve9qxf7ezhG?=
 =?us-ascii?Q?5J8gCVbjqUt253qf+y9SPc0FYzp/IAVisiEV3YiZu1zOjYX3Fdfc44DNrNz2?=
 =?us-ascii?Q?0hCkoKS3OyCEMnCcCzJuemdVrCHGnOlcNEw5pzEiWaRfYqRjPoV3/PLRjDrq?=
 =?us-ascii?Q?LBFFGyuyyNUvbZiq09OjnL/IdEel+GaVj1F2OELfngljEErf/ZGvMeZTJzul?=
 =?us-ascii?Q?fmj+jOlN2IPX9H3Qwbp3nLm2XW+EA8Vmp4hj+VNn8Wvkqcfn8/flpUYUt+O0?=
 =?us-ascii?Q?Zbm/B62bNQbOp5v47QmqAlswj+ApP6dLATPO/ct+eJP1o8MXnI77PtAPYtGk?=
 =?us-ascii?Q?ZX9yS9XDUpKLPv87BTXJw+m6v+9BKjdO/rzcSlxwLwV0hvSPseR+cK8wnfe3?=
 =?us-ascii?Q?oxTf9fc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR07MB8679.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t4yFOannmsjRJcj4pAV/nwxX9RkRwzdeqjsIwpncpYYLwEBbJn+z4WaBXCgy?=
 =?us-ascii?Q?NQfxC7RxtLSl936i2crom0e2C5iIK8SeHL89ogjl3bGQAUlKF7Q4MUUsWbLU?=
 =?us-ascii?Q?yjiJQHLk9bqqYaGs380hvHzsbQYfqBZ+nSETKZpXrGgomHGkx3CUxDfSP9fe?=
 =?us-ascii?Q?ioCqKOoAel8X6kUdwRum7ytJHwoLL262WXpS20yM6mfOmao/7m0TJq5R6xcq?=
 =?us-ascii?Q?IxQ9UumZ4inlxTPdXEguONojgzFFA7e6iMxOwEPgIGKkfpMkYUxbifjJT+Is?=
 =?us-ascii?Q?9ADHCkW9v/878Z8eBuz0yV7SdbR95HFl61xD5KIbfjfyXDTlU2gf3pMuceFk?=
 =?us-ascii?Q?iNXpIzbwQ2gZu54h5iYRtg1Cn/gigk1LeKgNA9oxPcY4ARWW1P56pGh0LdgU?=
 =?us-ascii?Q?ogxone19Lh/qdz4R3wjgiHPMNHKY0spV8fgBiXqIpk7Irfo9IcP7Ps0CLqnb?=
 =?us-ascii?Q?tDUpYZukBDeUHHaCOik+7oUgM+CTc7kyXOhy5GSi26V1FAx3ttUWJp0ltxcY?=
 =?us-ascii?Q?V44qFMtB6NQxayjxocS8xdHxSYgvSLlk261Io8yC5ldB23L4khaZmq1gBU9m?=
 =?us-ascii?Q?CM3hGXVmfvAhTdY/lxcp8BjUvQJ842NHhuiXk74A2QnL29vS58W/xZ1RqBov?=
 =?us-ascii?Q?q3x8o5qhG7FzpyfkQvOOv02S4EWEcuwcYS7ItWZ8FTMROGQzfwEfzMCrX4tv?=
 =?us-ascii?Q?OKNukIvyYwvwZ76IJDMTxjKBLCHygR2uirlHWpYd02k2bEZg7UhgOSjxxtQc?=
 =?us-ascii?Q?xMn0m6qqNvc3rr5ve3zRVZilBdIA4Lq2icV0z69Ddo44gQcMgbR53e1EQv9L?=
 =?us-ascii?Q?FlXT9XE3xfc+TdV8i4lhxKf6JQgULzBSaw6114gtHLhJpkJKCRKD60/wbgOc?=
 =?us-ascii?Q?NQMG4ObsiMigGUIxbFmtI6Z1fZoXDyrhSJ5lpJP8D0+31kEysaKO+LAiZZOj?=
 =?us-ascii?Q?bjC0G2qoAruS5+kAkhE8p2Xjf2CG9pZp9GqcXIaAUPXhJ84kGza/wpnJe0hC?=
 =?us-ascii?Q?X6xIpui/dJHdDDyAPHYN1acXeNHU22kMHfh96eH0ErcNbGHvmP6agItfWAq7?=
 =?us-ascii?Q?SzSSxAoTZcKZvSJ/7MSEjWWcDjacrDx4BKxcJDzpBy9jmQe3x5ZiRt8BXdZq?=
 =?us-ascii?Q?6/B2tTJTXyISFLmqlvwAAZY3NltNuiChGWq4lwgtIUYNLP900voWEMJCNwsF?=
 =?us-ascii?Q?+o0Yy0CH7fKSZFRdEN8sH6WzAVKRtyf+x3N7uEvIsPIlUlYvtpuW+tPKTx2a?=
 =?us-ascii?Q?gNvt5CkWvA20vWtqExvHMhniu/uAZCCl3sxhHZHRiDZ2Mv757s1zEQjj4u++?=
 =?us-ascii?Q?42AKhtQTT/soQxwzYRkA/GXq4lMb/d8FUNOtVerLMbOCdCn1LK85brk1TJri?=
 =?us-ascii?Q?u6JGj4vFduAcnk8MWswSagf6JIggqyCcEFa/PCa1wnr8jQDCXx6qcDCf+QDa?=
 =?us-ascii?Q?cnSU7sRwK7eKiZ0lV1iegtY+FMDkVn8kg3tmHgEhlAcuSxPUERbxd3lDPxu0?=
 =?us-ascii?Q?DI2yUdcW+r7qecYxBzPyDX6tysYcV/aqklufykpjtQaiF83fAvGWOe36JjCq?=
 =?us-ascii?Q?Uw9zzVf2wNR3kbRAOjWjeaH+/4kDD2p/mLglGN879xq/LjZ3gP6jpHXIS2a0?=
 =?us-ascii?Q?oOEBdKPs9w8+VFaUEVBsRIVj8exaWuwNLTXdASUTh9VANS1Q7c6aPHwVC/vu?=
 =?us-ascii?Q?5k6hHQ=3D=3D?=
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 759877ab-4d2b-42f8-144d-08dd7e97345b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR07MB8679.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:36:44.1227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3spF488CFant8Y0KxMTnvYWuCr57h4Qwes+i+E6z88qqVf1Uy7ne79it0MWRMLFlo3jwac0Yd0r7/0nZBvnOCQfmj/52of6iIMST52vyzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB9390
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 16:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116974

Hello Alberto,

On 4/18/25 14:58, Alberto Merciai wrote:
> On Fri, Apr 18, 2025 at 01:52:47PM +0200, Jeroen Hofstee wrote:
>
>> On 4/18/25 10:51, Alberto Merciai via lists.openembedded.org wrote:
>>> Hello,
>>>
>>> I notice that master already include can-utils_2025.01 however scarthga=
p
>>> is not.
>>>
>>> Is there any specific reason why we don't update to can-utils_2025.01 i=
n
>>> scarthgap branch?
>>>
>>> I found that using 2023.03 on scarthgap the following command will alwa=
ys show the
>>> same msec:
>>> candump -tA can0
>>> due to that cast:
>>> https://github.com/linux-can/can-utils/blob/cfe41963f3425e9adb01a70cfad=
dedf5e5982720/candump.c#L237
>>>
>>> Let me know, If not I can share you changes for that.
>> Below patch should fix the timestamps.
>>
>> https://github.com/victronenergy/meta-openembedded/commit/46106ae5ce38a3=
5cffa86c68a862c05dc1273397
>
> I don't know which is the approach we want to use there.
>
Well I am not a maintainer, but there must be extreme good reason
to bump a major in an released version, see Stable Release Process
of Yocto e.g.=C2=A0 [1], and meta-openembedded aligns with that as far as
I know.

> I propose 2025.01 update to scarthgap branch however seems to be safer
> to patch it keeping 2023.03, what do you think?

I think that your patches / updating to 2025.01 won't be accepted,
but as said, I am not a maintainer.

> What we notice is that for kernel 6.6.x candump has this regression that
> was not inside 5.10.

Can you check if mentioned patch fixes your issue?

Regards,
Jeroen

[1]=20
https://docs.yoctoproject.org/5.0.8/ref-manual/release-process.html#stable-=
release-process


