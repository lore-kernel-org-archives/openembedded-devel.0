Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AD2D149C0
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:18:59 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.86])
 by mx.groups.io with SMTP id smtpd.web11.15955.1729873130730851725
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Oct 2024 09:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=WDKuVGxw;
 spf=pass (domain: os.amperecomputing.com, ip: 52.101.56.86, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqeMUBdPAdmT+283czq63h5cAqijeHB3VG6eNOgAfXdPL9XasEAw8aYBlp3Te2dWBe4kHPdeUx7YR+/wt/+clnZYVjF/xcCdWEQdIuneYjdtRft0ITExDHUp5avvfDabBvxqC4bln0VElHRj7dMECJbdUkAOBUdo353ipWmA4w0oM0R2jVsYV7H7XYeQl18TqreenGQ5yFBwRKQ9t0GB3ZGn36RrqTM1dy26mVJFY9VPT7XWuOZmnS+czSY5PhWDsM62rkUF5Nf2Kpy0/ObsB6Vn2zG14Wo1DBn6aQcs+ihMPLcl3ThfhIikdINlN4T2xUFgwreDcejqrUOknGviIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IE3Dw5R6IYI+yaIQljsDuzeULVLj/Dr/vLvkOpY9H4=;
 b=bTz9FJunj2x/byrfk2lgiM3jnV6vvZdwYl5qP2ZPA/MjwBtuN+w4dR79Ot4Kv3UiLRdSJlCXTlxAYUlK7hZRwLG3H7NbOGwOGJh+gRwybfPdxn459Uh9Czj8k/7EaVBEvXQ+yhO2B9f3E6V3gg0RkqAAbu8/fPPdl1TgD0FPLhGIhtXoChPHD8YcswA6tUMl4pKL5YbZ3Tz3o4thhgvh4OMPMuBj1uVvC40tpJ+SDr7fdEOj/aaedgQdmKDRfPAl7fPfnuHOxLLjijDIKu78VtXpGVM5DGI2nz9FC0qmpmrXoLmL/gGgR5jXU6m44Li6ymHMkCwfkW4BJ/8isQj6yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IE3Dw5R6IYI+yaIQljsDuzeULVLj/Dr/vLvkOpY9H4=;
 b=WDKuVGxwLZFDydnGGN92YVl4xpkfFtle2vlYglk9WOP4wcjKxOsm4tc8zXNkT8wpxIuLnThcFUeR4ImhzHk0tyyVs8xfF0hbaW34zU7MLK7qeQCqtexxO/l0PFCF5y/aoZROVuM6FFiYP28H16Gs3uIRpEh9b2Vyt4PqLIb1q4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 BY3PR01MB6676.prod.exchangelabs.com (2603:10b6:a03:36c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.11; Fri, 25 Oct 2024 16:18:46 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 16:18:46 +0000
Message-ID: <6b853552-4bf9-4caf-b541-310eb043f94e@amperemail.onmicrosoft.com>
Date: Fri, 25 Oct 2024 23:18:40 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][PATCH] mctp: Fix CI build error with musl+clang
To: Khem Raj <raj.khem@gmail.com>
CC: Chanh Nguyen <chanh@os.amperecomputing.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
References: <20241024065109.74010-1-chanh@os.amperecomputing.com>
 <38e5da48-fc0e-4685-b615-992a1f78dd45@amperemail.onmicrosoft.com>
 <CAMKF1sprL34koHC73Y9ji5ZTP2J+2W+TLDmoKjRzUR9vcudDjg@mail.gmail.com>
 <4f094abd-bd57-41b3-b4a4-e42180b45dc5@amperemail.onmicrosoft.com>
 <2b431a79-3d7f-4b55-8238-21072edbaf20@amperemail.onmicrosoft.com>
 <CAMKF1soGa9mqLAxC2+4s+L8iEdgdpp57asn7Y5ULusrucR9sSA@mail.gmail.com>
 <b1b309ce-2417-47b0-86e1-7d2761fbb68b@amperemail.onmicrosoft.com>
 <CAMKF1soHqez_xfoWwmvqtwRKh9_4wBaMzbvuXY+MmXMbNEZZsA@mail.gmail.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <CAMKF1soHqez_xfoWwmvqtwRKh9_4wBaMzbvuXY+MmXMbNEZZsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|BY3PR01MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 4312ff80-dfb8-4451-4402-08dcf510b367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?geRIPWBy0V9RuxToM5QjQiLDWuVOPO09bD+RM2A+yGzXdb40IW7buedQNJ3p?=
 =?us-ascii?Q?/V6ULjt+sEIj51//yxCshnULiGuH7IJ9G0nMLpMaR7DO48L3rBOSkuW+X6Mp?=
 =?us-ascii?Q?RX9RxYlh1EMcyR2t6EZcc967/+ddOiqza4czCb7Ir+b15xaP8fxrRwmqaMSF?=
 =?us-ascii?Q?+QmCt7Dnx+71DwnzT+GIjjG0bGIqtqRKD8zES7a67TVs4w2NoZIJfOrhYKjo?=
 =?us-ascii?Q?edRsVOW7cIqs2uaK4S3jqXvW8UI808Ni1WuFclSwkuGVfykkhjz2kYMGvUbd?=
 =?us-ascii?Q?HQHl53Gd1uM4WalIDLO95tsu/iTGC9bf28Hlta4KK6qj2MbHooYyUWGThVb1?=
 =?us-ascii?Q?kPJ/wG4VjnsoCqHsgjVo6tuO10KXgouJHTX89/BVtnoHzGv6ECDN7OuMk9eY?=
 =?us-ascii?Q?ZxsWoKslRfddohhaHX4UwF/dXEZGiUdRx/j1F/SurYLoYk1lEgjQ97arobb6?=
 =?us-ascii?Q?9Z7GOmrBX3ppZ15Py7qTb6FWMLEK+bpvxQlzgTtxdI+CvTQOD0RNRAl7Ubjs?=
 =?us-ascii?Q?QQfoFUgpwEMYyz/Bi59y5rcXT0k0EFICpWIpau9bboVkMgp8d5+wGtre9Teu?=
 =?us-ascii?Q?zeUvSfmMMPKWQMdsGnUsS/GRDhhFa7pONDAsb1Ish02nIGCiQw8Io9VDpNdL?=
 =?us-ascii?Q?QDAZALN+NWkEUaLmitXnXV6L/8oXFWy+8CU39zQDXZTag+sadJNF4qj+0XkP?=
 =?us-ascii?Q?Yt9aH8cC2GOmY1YiRhmUuSV4VHoxj2SNrq0LCU9QXjER2o8C0Pk82IemLip/?=
 =?us-ascii?Q?WtOpoxxiKvOCoGOxYHWwcdgjRMiAHqi82mTBt1BC0CGnjdpihTdKYxhuNnZ8?=
 =?us-ascii?Q?Vash8bXqSFb0Z83qlVcNyOLDgG8ocThxOuOiLOae9dhGNti5LK0j8Ul4GCOc?=
 =?us-ascii?Q?hMYLXwX9SWSO/qEgdqPThR5MyyUqRsnL9x6Uc1KZ28hfzWV+8NsBVKO9Jr2/?=
 =?us-ascii?Q?ckdOMl2SNyLDcvKbpz4NrNYHbXfI3pAgnh+m3XKzk0gZvZWmkTxY2UN3XYNR?=
 =?us-ascii?Q?c28YGj/afWpqrUG2dct7yvAdDv6m1f/b1P0IyjmptByJnn5ul/D7jbU5Iue+?=
 =?us-ascii?Q?4Kc48YoGQnhkAn+clrLDD/8UQdFnQHPjTeKSYvxhDlaB+xuKdlZkcaWdDycJ?=
 =?us-ascii?Q?Hxpx/7ELguGEeadbuDg12FKZy0QLaIvAdR/Oxn3/2N9AWiw6KSsXuu+aDJOf?=
 =?us-ascii?Q?RmVL/WJFrdjcUzcJqWOEK5k2LEcQOb7w0zcwGtGuW+53x5YPBzY/QZZa80Tq?=
 =?us-ascii?Q?Dm0prdUeR55Y83ZQlzG6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6Q0wZb8Cw5KhCWzyN5zH9F8TWgn6MDVNYg475PawwhRSIC9TCnaVM7UFBST5?=
 =?us-ascii?Q?oXOrkXpRO3azAexq1wzVPhZYcEB1gShG+TUM4sZWDZ3kwyMd+SwXSfrGa2Gm?=
 =?us-ascii?Q?fhDEOz8XOn3ZuimhncCm54cXu+c9StdiL+GbOpcmVhLD8h6CzmoEIFPjbDgs?=
 =?us-ascii?Q?TqiQrfX46J9mnlVaSnaj6u6YQ5raDQSAiNl66E0LWXc+5V17vOS48ZVTY+iV?=
 =?us-ascii?Q?FgcD0UzLelte4QBnelwv8O0+xrQRQyALx7argVD5swgkZJeBIatdGgs2Vvo5?=
 =?us-ascii?Q?j8UX8Z95qqS6YaYPAe7v9w+VM3QA6epgFLMGe786DLF976wyTzrCfoz125bI?=
 =?us-ascii?Q?Msvs5flz0GW8TQi/M3zAsAnAAFh619/eEE3gzXR5NYxBWqXkUzVwIyPGuMrj?=
 =?us-ascii?Q?Wu7EH7V6RxGP9WtFtF76COLqowEatgSUn/+9rFbE5HhkUoO5u4yqjI/wXwbn?=
 =?us-ascii?Q?onVrxF0NT/hj7wAWpKVAcohKAu7WWLxdbehoY5dPb10d7mol9a7fwDqdC15f?=
 =?us-ascii?Q?zCEPuV8cfTLOZsXzm0s7syNscf8I9bFYmQGPNg7abOqAjn42ml6T0Mfle/U3?=
 =?us-ascii?Q?0uoAQRtLGk8kiF53yrLoKi472KFxeAopczKXn1utC3syupsDySttU8W69HGz?=
 =?us-ascii?Q?5Mm2PA/VaX6DNiFqf3SFVCnCmkDP40ZhOUMpIywEQiwyr4yFqNafbeAWpjAU?=
 =?us-ascii?Q?jD11WM5Hy7vscfyl3CtwksiqB4VZ4kvXL+hHzTR+jJT4MV4yCwFMlgyiUKYF?=
 =?us-ascii?Q?Wt39u2dEFkudPIWpUglyh3ZtDw+G6xVIAA13odfg0os0weHaEZXmohd0vxEo?=
 =?us-ascii?Q?lgarF7ZHDvw469hDD8ndN3969iSfOyXbYFNMV+tqdc7PKPy2OFKiR2wUP7SD?=
 =?us-ascii?Q?h4c4MlKRZ76NNJuMaTrqTZkKQJvI7mmi4J6kOQmF7HHhzH7K8qA6GakLkPhm?=
 =?us-ascii?Q?Mf9CL2W2XVnXY2LCiYG6DL3or0kqhunf1kH1yNof0hAp6WLDysOBz9qx6gZp?=
 =?us-ascii?Q?L/oS2+jGGiwcixWpRy1eqWl8t2+UIIWtrSISgROlFNQAn6W8hneGEnT8chXO?=
 =?us-ascii?Q?7K3UG9/1hjDFUVFuaRUnywEqfGdnWY7ykw8eRIbgtQYiaE2YF2cSQDJQcJ5v?=
 =?us-ascii?Q?ZulQrjN3PE+RmN/gzvFi+u7Y7itbGdo9NNXPWy/OmUyVYzircgN0C34wokZ2?=
 =?us-ascii?Q?bge8BCo61n8edi6pv1EsnGG6evJ7123CItqNhZpxiLXQ0aeBJyjIeEyr5dYH?=
 =?us-ascii?Q?I9W7oRvK3KKknm5S6MPxILxsNL1z+jyk9MLtCL6RFFv60y8JHZmdFy7QTpVq?=
 =?us-ascii?Q?ZrEMj+kqLSoaYcrqI/ArRgPmsunpzx8DUP/LGGj8S64m9QHqFe8X2fzFWjXJ?=
 =?us-ascii?Q?6ECHprRc8ORjg4YcUjmhOmGqfkqM4W6ZC3oeLeneoOnC6VLWTKW54YC+aRfL?=
 =?us-ascii?Q?q2FG+T2GbeNMN8nDc8hAtIarRvLj54B3oPlWEJqMgCR1mWlhrZRdEI+pnmS4?=
 =?us-ascii?Q?Mpcak+mVKN3oQYuRH2NF23p7RyMwEWW7GtFR86GXejY665GJEARU7mNjey/Q?=
 =?us-ascii?Q?52OGdtCtwcKv3tEU3yavac6af7pxvnAPn6JVejqGj+s4qxUjWA5irMk0Ye9e?=
 =?us-ascii?Q?b0BSQ6f4MRXr6GqeG7Pva98=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4312ff80-dfb8-4451-4402-08dcf510b367
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 16:18:46.1044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26QjINJWbZ7HqIChQwgsL5Uqcik4qosBSW2zk6698+QU9IixhdVKM9v2T5/v8dueOnLHe4HyPacLwhPgJK8muggMvZ0FkLv9lwN7i9VKmMNlsZscismOzSyz6CxsaEgr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6676
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 16:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113229



On 25/10/2024 22:59, Khem Raj wrote:
> On Fri, Oct 25, 2024 at 8:49=E2=80=AFAM Chanh Nguyen
> <chanh@amperemail.onmicrosoft.com> wrote:
>>
>>
>>
>> On 24/10/2024 22:22, Khem Raj wrote:
>>> On Thu, Oct 24, 2024 at 7:57=E2=80=AFAM Chanh Nguyen
>>> <chanh@amperemail.onmicrosoft.com> wrote:
>>>>
>>>>
>>>>
>>>> On 24/10/2024 21:46, Chanh Nguyen wrote:
>>>>>
>>>>>
>>>>> On 24/10/2024 19:18, Khem Raj wrote:
>>>>>> Please test it and wait it to merge before sending pull request here=
,
>>>>>> feature branches are temporary and usually not something we use in O=
E
>>>>>>
>>>>>
>>>>> Yes Khem, it is only temporary for CI build checking.
>>>>>
>>>>> Can you please help run CI build? If any other errors, we'll fix.
>>>>>
>>>>> Thanks,
>>>>> Chanh
>>>>>
>>>> I and Jeremy used the musl compiler (https://musl.cc/), and it compile=
d
>>>> the MCTP successfully. It seems the error just happens with your CI ru=
n,
>>>> and we haven't known to run the CI to check.
>>>>
>>>
>>> As I mentioned before, the combination is clang19 + musl, musl.cc is
>>> gcc+musl only so
>>> you won't see clang specific issues with it.
>>> That's fine if you can say [RFT] in the subject line to convey the inte=
ntion.
>>>
>>
>> Thank Khem for your instruction about subject patch!
>>
>> Should I resend this patch with new subject ? It will be
>> [RFT][meta-networking][PATCH] mctp: Fix CI build error with musl+clang
>=20
> Not this time, since I have staged it for testing and it seems to work
> for musl+clang case
> AFAICT so please send the final patch with version bump to include the
> fixes that
> Jeremy is pushing into component repo
>=20

Thank Khem, If there is any other error CI build, please notice in=20
there. I'll report to Jeremy.

If all looks good, I'll send the final patch in next Monday.

>>
>>>>>> On Wed, Oct 23, 2024 at 11:52=E2=80=AFPM Chanh Nguyen
>>>>>> <chanh@amperemail.onmicrosoft.com> wrote:
>>>>>>>
>>>>>>> Hi Khem,
>>>>>>>
>>>>>>> This is only a temporary patch. It helps check CI build errors on t=
he
>>>>>>> MCTP repo. Please help run the CI build; if any error you can show =
here,
>>>>>>> then Jeremy will update the mctp repo to fix errors.
>>>>>>>
>>>>>>> Please don't merge this patch. When the CI builds completely withou=
t any
>>>>>>> errors, I will push a new patch with the latest version on the MCTP
>>>>>>> repo.
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> Chanh
>>>>>>>
>>>>>>> On 24/10/2024 13:51, Chanh Nguyen wrote:
>>>>>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>>>>>> ---
>>>>>>>>      meta-networking/recipes-support/mctp/mctp_2.0.bb | 4 ++--
>>>>>>>>      1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/
>>>>>>>> meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>>>>>> index c6aa7c104..793afe755 100644
>>>>>>>> --- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>>>>>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
>>>>>>>> @@ -5,9 +5,9 @@ LICENSE =3D "GPL-2.0-only"
>>>>>>>>
>>>>>>>>      LIC_FILES_CHKSUM =3D "file://
>>>>>>>> LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
>>>>>>>>
>>>>>>>> -SRCREV =3D "f110926b082731b25720b444378ad55d7a9d451d"
>>>>>>>> +SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
>>>>>>>>
>>>>>>>> -SRC_URI =3D "git://github.com/CodeConstruct/
>>>>>>>> mctp;branch=3Dmain;protocol=3Dhttps"
>>>>>>>> +SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Ddev/cro=
ss-
>>>>>>>> fixes;protocol=3Dhttps"
>>>>>>>>
>>>>>>>>      S =3D "${WORKDIR}/git"
>>>>>>>>
>>>>>>>
>>>>>
>>>>
>>


