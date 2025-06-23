Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381C9C7115D
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:48:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.25])
 by mx.groups.io with SMTP id smtpd.web11.14496.1750664887105181262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=hzX3jhE8;
 spf=pass (domain: axis.com, ip: 52.101.66.25, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvmUEDOKQSqjlv4VF4YVi09xiBACvmg0uOcprcb3e7J7++IVNqsH/ZaxfGtEFgIWTjIGR/AQiV/9pR+r9C7gOxGIk30Yse3Gs9mLRldodt0UNVxCRVOvs7cJGlRCGfSmsqBgQRWPDzXN3H6hCDYtmTTiUqEfabupUi2enghcXk6qYovOLWe3FtwBkwevQ8i+xIyNEsqhgzoad0uOFtI/eXx4PHEarQhoCMDeo/snllTA3a/HJCICi2CFuIqIGDi4JliKw2wquaaMh2PLDF83k9Lzhnt+UggpWZU7k7TdkLAYPhGz/6i0jw9Iz1/HYcsSozaIYn3zKYdFGkEL0bxEXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxWk/SZaaTlO/D1uBXvif+cPjnUV3WLjsrJCvNj1xHc=;
 b=bIuASN9Q4kAoD7jWyvGP7jxmSD61sP9SRtbD/8EYc444LAir5aOVdZybQiZhFcjXVNIMIpWostX9o1HurPr22KovOvYlfBIUwnlinkWgI7j15jTTRS0Fhn+BFiOTVPeLQi8ZRLAyrl2fr3dLu9rrcQ6rWUcKhDZx9w3/ctNAtIQ/0VhyWRx+g13EpN5ZEbj6V3akTWXrkDGbxgkOUP0KdaRP+oNxGD1q6LM68wvWW/6ThwlrYr4XYOHvHYiPtG2xjm6gp11SDoiC/jKScsAnaWzxaGTd3SC+Lp32EVOuEn8vatRyM+FRC2iRelkga8oRkVGQkRJcVyyumfU3tMzh8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxWk/SZaaTlO/D1uBXvif+cPjnUV3WLjsrJCvNj1xHc=;
 b=hzX3jhE8irDI6D3a7phKrmLhgYOQ4DWt44PyH7QowfQ+0CrVckM3zyzdH2NgUAiDff5sJRfoNRj1A0ZCBhi3XYZ++gvhfT8OIiIAO5LBWSRWINoKjRql9pjLMGXTQGIlvo+egRZY8fdJcjpgPnYXRVtS9gvAEjezhqNps+fCE6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
 by PA1PR02MB11127.eurprd02.prod.outlook.com (2603:10a6:102:48e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 07:48:03 +0000
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0]) by DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0%4]) with mapi id 15.20.8857.022; Mon, 23 Jun 2025
 07:48:03 +0000
Message-ID: <b54aa060-9664-4a79-8844-d4029843949a@axis.com>
Date: Mon, 23 Jun 2025 09:48:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] influxdb: Use go module fetcher
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel@lists.openembedded.org, skandigraun@gmail.com
References: <20250619145738.3562283-1-christli@axis.com>
 <ab6d6f50-0409-4469-be0b-2b07f5333d6c@gmail.com>
 <CAMKF1sqKnL85LrUv2ResvCS1_X5Ggf4udG9iOyQqyRyM+8JkXQ@mail.gmail.com>
Content-Language: en-US
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <CAMKF1sqKnL85LrUv2ResvCS1_X5Ggf4udG9iOyQqyRyM+8JkXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0051.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::35) To DU0PR02MB9894.eurprd02.prod.outlook.com
 (2603:10a6:10:44a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9894:EE_|PA1PR02MB11127:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae0f401-850e-4002-980f-08ddb22a4838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OVUTXPSp/i3L6OWIpvbBrDbSlvxcpEXHOXB5CVdAWOBvFroExAo63I/Xi77c?=
 =?us-ascii?Q?0jIDPeNnLwmwWuKnVYkHy3n0/equPP7oi+Bu9YpWCYD1rQqE1Q5KHVgckcke?=
 =?us-ascii?Q?osT+R43scsvM5NrEZSewbFUTW7QK2Amw7iAfq2WAAImnMM4D2YP2eK2Tf26y?=
 =?us-ascii?Q?EyzcowgIbTvE0jkTptJWXWSTCshm/x5bnmj7BEU3EvVCZX4GVIE5cVzxBTSu?=
 =?us-ascii?Q?fCZqsvDFjVDsjrnPE0bXqbAJvnsWQipZA35TrTjtuGFYowxz4SGLSFllMRbJ?=
 =?us-ascii?Q?1zfyjElH4rMIKQWe52De7HkcOA1m03d2q/kMs+CAXIXXOHPrDP1EPu+VLFzk?=
 =?us-ascii?Q?fPSTIAc2uoMOGN+86EhyoQD5+5/TWwm7sE9TJgTlkoPILD0cQm0MGrwbZKgn?=
 =?us-ascii?Q?d8dj9uedFjRz3tcnGPLqAMuUO+EZrm6Nf130YPpCdfQAnRimZ6qTfIBS2zk8?=
 =?us-ascii?Q?y44Be6+T1ka9MmLd04p5KUmxlNnnvF6icXm3V4Yk8xxmlWq0B3yVs4fekXiw?=
 =?us-ascii?Q?ynV1Yg0o7cuwM+6U5u40BpP/D2MC8jmVKLhAePaJ70eJOhqjyqqP6VVOkV7V?=
 =?us-ascii?Q?PagKc2MP9sUeXfv3+WxDoyY0+Cp1w4q08bl8QyyMWocP//cpSBbhOia2i4YK?=
 =?us-ascii?Q?egZAawXeeW8BsAuBtPBmAE/zSznmuXLeFrZDEPp+VcTBKg//Z3B4ey5rp/4y?=
 =?us-ascii?Q?qMMKXgn4sICo5ywMq7vln1L2qLOqDyc/WqsKbs4GFO3G1xQFYGLh1OpB9APX?=
 =?us-ascii?Q?BRPBOypSLwXAbRfP0uMndLpSQ9iy4thY/tZ5F3hEQPgop7DcA1CQWrNw6DtP?=
 =?us-ascii?Q?ZvknJWrZPat5WkMfRqcUe7D3+woqUalyvd5UuL0OLbON/cgmXZDdaaUlIIHP?=
 =?us-ascii?Q?4hUyjBq+1bUrKH9UGmiKTQEXGWqfHzmTSiKxFsx56owdytarz7MStgrBxNn+?=
 =?us-ascii?Q?JW3cCB+f0jiiId7qXOI+MKgyvycH7F0rzwsFIigU5QTL0F1dhGmLhIeRAKmr?=
 =?us-ascii?Q?VCSyjiHAo3aOflrbpRtYWXEAI3yQHh9XZJrcuEfkzF6/foZ6YBo8n/eb6w1B?=
 =?us-ascii?Q?DD2d1mITraVHs9eptXJb9PWSAA/ptObn9luSYQWV+5FgiDmdulrOm75M6rtV?=
 =?us-ascii?Q?LoZ+jAIos0vSKlAD35x1T+hIlYjDZw+OmBY2ldvgnqqs5nH/5b2ED47HWjcA?=
 =?us-ascii?Q?Pf568krn5hBDiuzlsz2KxwkXYBkoKW+WPUx7iVvYWj+7c4SHtmG2tHvP2+qJ?=
 =?us-ascii?Q?VE5f1Gu00dNoYvcmCfUahf5IRhiYDGWh0XyVJZUBO3YBdA0aM5aEfhmmMz9B?=
 =?us-ascii?Q?ddE3inFuqOBtAuOeFN9TwVnwnkmzmS6u1B9RSXvRePTQmPWjOzYj1SbPxNYB?=
 =?us-ascii?Q?M+DHPGVKBGaCcvp8ByQgyzcLCFjV5lIlvFWowdNxh666EFCd0OxaNx1Lzjlj?=
 =?us-ascii?Q?YuGHmY6uWfo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB9894.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XURkeIwccD//vAJtel44POEIwhHGKey0id7IGRKl9UQaWlN5HT870xlQlBPk?=
 =?us-ascii?Q?4bUjq8t7OBogzUS2xYwr3VlRtCf2e91qDuqTKX8Pes/2xk1+TRp7ROAzLR+z?=
 =?us-ascii?Q?/j1FoIDqJkvzYMREE5K8kNyDemarm1rAOLI+2vP3ZqBcqeyqZ0WBPBH104vZ?=
 =?us-ascii?Q?yZppZ4LxkrZDQV7NHfsUj/0Q3xCpeZE1sJoRr6mNDCmX5eQs6qOfqDheh/+A?=
 =?us-ascii?Q?k9ucFe/z1IBkCi/DNVDvfU4wBg+dkxQUIqWuM7omGdz2vpAjSHHFRb0OH/+M?=
 =?us-ascii?Q?z/RYsmXRPXreXjhV171shwu2WHqZdl87ZHgm9IJbo7fKghYKUJB+J51Y6Dbw?=
 =?us-ascii?Q?HOUCMTihQBqH/rC4fzxBGflEHPrCt4FBXHGJt+D8bjjvXaQCpM6KBY+HcP28?=
 =?us-ascii?Q?MZPZUZk6BplZSX9dN/eqWgcEjLVGGbDXO9iJArYIPvKxGI6zBsESNLMQuIy1?=
 =?us-ascii?Q?pLLKrT1t09TlQS+YFV90QT1JOP7Uhb9LdpETBoM++WKq58cDX02nHgbdPzwj?=
 =?us-ascii?Q?hYPhK0IyHbVOnx4TxjcEU+1GDPmH8K5hA0cfflb+EA/D12bpriaOjfaAnU/c?=
 =?us-ascii?Q?7/3tEHh2LDWBLZ2muBBeUC15uNxgKpdhOIkYhPcPw7GfWCt47sEdrP48OnqA?=
 =?us-ascii?Q?E43gVLU5iQEKoqxHy7G4JjoTOMaj3GNgq3YoqKllprE89HJ7oTroOePO2fVR?=
 =?us-ascii?Q?S+W39JCcIGHzvgZxkKgOH6nsbUdc45jZAiGTz8cEnLOYkUhN67/5Sg3ANpqb?=
 =?us-ascii?Q?LiN4ojk8sOHs/qqnFYxGNebiayPJT4e24TOQHH17ULRbwHHZUfp+iPDZkrdI?=
 =?us-ascii?Q?Wul/uF/C/j716UQovXwpp6zaaXzTuplMZi9T5n54E5/snN0CC5/CpL3uOt8W?=
 =?us-ascii?Q?8vjb+ZqlU7G1GbpCUIGCzfzxGa8ASLy2CqEyjPJb8ISlMM9jq+rzkb/TSeXM?=
 =?us-ascii?Q?5dw7p/p4enN1qJHcHusrYtXRAZ2oE2e2tU3/xN+ylY7QthzdU0wNPSzFJpy4?=
 =?us-ascii?Q?buMZHiIMRcHMCjLXp0gLJgDi7EzoPInAsIOsO7RMWK6t/jPdhj0rrQ8wI17N?=
 =?us-ascii?Q?MNTIaz+IzmmkvGvvmZc5Ur57MshVsFzOaTMIfBd/JhCs68bjwp+HOUaeaWY2?=
 =?us-ascii?Q?n6nDUkC7xvqOvROJHbbeTlS4yTZjX7H8DngQWrkOC2hEpnm92OineBLUyVeV?=
 =?us-ascii?Q?0uJ0ujFdTGdOH8hxAOn5D6hmUblpzPlQsBqkU7z2/IJ4Of6FKwTA2pjgQ5Su?=
 =?us-ascii?Q?2QZ9+D+PDsFvlHQTVQSzgT5/771AUAXTbgSXlnD+dJ78R7B34zgx2LUOmmQ7?=
 =?us-ascii?Q?w3+EUch1xoFmiLLKaeEJq+dlObv21ekJDC7VLjj73ULu/a9mB5expvWYXnTP?=
 =?us-ascii?Q?GOiFklDtrUZ2i4aGI5UB08u0BTJYrnXxMiR5s3Y2GETaSI+6i+iIkOUez0qB?=
 =?us-ascii?Q?22pMqFwR17Uo069sRCZa2HQwdJPU8vh40mTV0OKxX1niCAuLcTZMlIVr6TTN?=
 =?us-ascii?Q?HZdoR+FuovAPxLUtQJkrmvIFm4o0kZK4DFsgMPVP03o4djIf6rhE/D5U/6nT?=
 =?us-ascii?Q?ajTvT0qutzBZhX4ZXWmwRzzq9lAZpLPW4mKs00IX?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae0f401-850e-4002-980f-08ddb22a4838
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9894.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 07:48:03.3005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHF6m+o4/uKK6Ty2TRyHGtGyDFQah0q1HwL1p3Q2r3G7mtuzZ5y4R1ZLHwf4wqsmF5vYlr/sy+GoLwo+MXsHSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11127
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118060


On 19/06/2025 18:09, Khem Raj wrote:
> On Thu, Jun 19, 2025 at 8:34=E2=80=AFAM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> wrote:
>> On 6/19/25 16:57, Christian Lindeberg via lists.openembedded.org wrote:
>>>   CVE_STATUS[CVE-2019-10329] =3D "cpe-incorrect: Version does not match=
 and only the Jenkins plugin is affected."
>>>   SKIP_RECIPE[influxdb] ?=3D "QA Issue: task do_compile has network ena=
bled"
>>>
>> I believe your patch obsoletes this SKIP_RECIPE variable from the bottom
>> of the recipe.
>>
> Thats right, I have added a patch for removing the skip
Oops, I guess I didn't check the result of the rebase properly.

Should it be added back to packagegroup-meta-oe-dbs as well now when networ=
k
access is resolved?

Christian


