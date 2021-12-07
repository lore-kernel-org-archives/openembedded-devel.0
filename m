Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B533C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:42:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.64])
 by mx.groups.io with SMTP id smtpd.web11.67037.1638884566474474260
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:42:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=tGiqrbbQ;
 spf=pass (domain: outlook.com, ip: 40.92.89.64,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iePugBBC0PSxLUzecpw/ebC8hpqdqjZGmEpMCXPEL04bh6cmerU7h2u5lkFsCw2WBEC21rQYUk2sdKHMdsq0BHoyeTcwCzQBJVfPne3ofrnJemq490zcwCeWjOAP9kzkRZQh4rL5dUI2g4Nl7kDc+kL+gzsN+AW4wTs9fM88GZZPZ770kYACOt+QTgUPEG8/bz9JivT11SZiBFcOpZpluffi4ehXPw/AhPSWdBEQevSiwEpr7SSj57HvypizdO7Nri2EvUTYh4/Ctb5IXRRfJSbYT2tbS+IT/p5BlnELv9BvlFDF2Hv1oTmehP5O9A19Q5Z3U6mcFUXgxVzygy22uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5garoy5YHEtOEo4iplw4/LFE/Nxm24mbONANds2L58w=;
 b=BR8jMQuJT/nKUVE8jt3VtwktGhCnSLl70DnTJ19zWKM17KUfPFZDnYRYEB9n2sTNKKwxYmSjBqHBhwz/DLuI3oWt41A3YHCUrgq4oprxqjNhVnPwdTSbku1HZclRuFtwDLWIGNm+bM58UUTE6skb64a+CEnh+tZwuWV3kKT199Ylm8kL3VkD8H7NymybVbTxgmDz+I980vhmUBMqi/nzTBSXyDwtsbBhp/C0WJn4oSSP7yy/okxN9cJzXcrfovb+wTitfIgQyrsMJ2/4ZbWt08eQwsv/u2sIE37PWn1u/sg8LfFKV42kITdwp+Dqs2ZC+I0xGWHVLWdimGfqRfrfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5garoy5YHEtOEo4iplw4/LFE/Nxm24mbONANds2L58w=;
 b=tGiqrbbQfDYq8JkbGnjFuQGymhYR+DncrKenh9+st0eOTZJklSudvZb87PyUymgOLTFpkPNoLxeLsnJ0hPvs4ZhOSFyeVmu6JTwhW/GiYvnZg915FSIfcpZFdEev9ct4RaTIS67+ufzzk21T5FdxR2SohezMzWqtN6c0aK4cghtWPBK49lSesOKGakvDOrTzhoho0lzkdc+hP13AkhgkdK31Eg/j+fS9rOFtTuVchWEcEfM7ovKE3Zy5jwQPvPAOlYgUrAm3gGPr7yMsqi8AANBJq0KSDwZdXEfuYRYXd8BOd/Cvhf285RSrS144mFWel5RFgUXy/VTsbJhGX+mj+w==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3780.eurprd09.prod.outlook.com (2603:10a6:208:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 7 Dec
 2021 13:42:44 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4778.011; Tue, 7 Dec 2021
 13:42:44 +0000
Subject: Re: [oe] [meta-oe][PATCH] freerdp: Use DEPENDS:append
To: Marek Vasut <marex@denx.de>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
References: <20211207113954.8959-1-marex@denx.de>
 <CA+chaQdiPbPXXOdw7PBfivuvw-fXZYeBAvDQM2NGL7h_Gr0ULQ@mail.gmail.com>
 <4a4bd8ca-9fae-c03a-acf1-d25fc44a84dd@denx.de>
 <CANNYZj-w7xB2r-FvXKbj88CNO5ibxnF1MfmN2z+p-j+_-HNLvg@mail.gmail.com>
 <d2604e80-3f82-d955-f0d0-620bea1ecbb0@denx.de>
 <CANNYZj95pzj8Q85BfbFim=h+rvPW86-Wm=Bqh=+j+JKBmWnf3g@mail.gmail.com>
 <c7ee5abb-cdd5-4286-3c2a-a0533a003af6@denx.de>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642AA58DD24D6FF1AE8E7B2A86E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 7 Dec 2021 14:42:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c7ee5abb-cdd5-4286-3c2a-a0533a003af6@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [H89ih/FAesLU3tEQxSznj+r92SqJim4L8AvvNlWksahKmaor7R1Quw5qgRvQpAfg]
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <760e1533-b153-c454-bdd1-d082832419fd@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 738cfb28-34a2-470c-2cca-08d9b9877235
X-MS-TrafficTypeDiagnostic: AM0PR09MB3780:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1N9iIkuR6MIxCIcNzPK4UbYDPOovW1unmnaVhWopqgJ4qIxLvweDYdDQju3ZkF67O5+PRhNkQtKjPM1BbNxco1jvUKAvno6nWWRZdF2GmHXacVNitSGCAOo0Tz+jumrFFdmD5jq7nirRSf3WhxAG2HFN9oKQ0b7Njth0D17rtP2wszNee4xNfmjOu2naVCbEO47JhnFb9robI+IWEJVBCpfgkp04JoSsQpPNYKAMngeOOMQBjbqsRzVPsXYuiMo6eSUL8rXUXADRdh/kk2AkBB7M5K2rRxmE8HFIa+U7R41GY9GJqZrbed/weSFx8NupCP51wexD/aZc23sJxVJSbzrQC0/f5UeQL3odQoaNapwtvttpuA9arWZtYHNhyTER+AzEYc7+7Ty2W0/ucnjKOcIcJJaUwrJuyi+CZTG6kcD7JaYcVJciAyvWymEuRzMYiCrfhWUp15lxAMvR23c1MkwxBy/nZ1WrYQDr29fthkcBikrAcJqpLzNTTMlWNEF4QgnFio21jkyAGOHUdvibOxiBiPisSDcOo9s0wSzmY+Fz48b+yERpPvldWo3GldspopuduNxW3+SqM5/1iVtmHA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2pXTzFzajAxekprMjl3QklKWURsUWwrWkpUSDQvNitoc2JJRWprVHJTOGpD?=
 =?utf-8?B?dWRPOS9pOVdIL1RuRlNxZUJpSHozZmhOWklvcjRUaHNuNWc2V3lLT3grSjd5?=
 =?utf-8?B?dTF2MHlSQzJqeDNkaGxZeHZRcVh1R1ZUQ25ZSUpTbll3UFZqa0lHQkRXcW93?=
 =?utf-8?B?b1VCNFJVeXYvMExDUUtMZ2hJRC91NElsdDdMa3JhOWllVld2ZFljZXpTZ3RL?=
 =?utf-8?B?ajBQTnNROE5NQmN0RkxSSUxORUk3MjdycmZWRzIwK2NhNXJMR1BiVXlnZUtp?=
 =?utf-8?B?OHl5SWtJUDZOMmxGMjFidDVVUWJKclpaZmZlWFN5dnB6b2ZRYlBoSFBtMEoy?=
 =?utf-8?B?L2ZaSnFRRG1Mc3JlR0hvWVFQd1F4eEk0a0JTRnhRSzE3T3pOMXoweEVLTXdR?=
 =?utf-8?B?SUpIdVd3TzAydFJKWm4xREdsMi9Qb3dhRDlhajIrM0l3NGh2Wms3TXM2amdS?=
 =?utf-8?B?QTFKcFhFSEVNR0hSZm0vbG5YdW9uZW9wQ24zUWhnRWhOVTRBR1lMeXc2bEh4?=
 =?utf-8?B?YkFxNWNDTHVKRWROQnBUbDdUWWF1cUI2dXZOQjJBWDVOYUt0MlRPWElMZEd4?=
 =?utf-8?B?UGRnWVdFL0NzOVlNYTRyUjFtUVVFaWMxOG5ibUdOUzMySFVVRVZQUSthKzNY?=
 =?utf-8?B?V2RzT1JZcXVTWHpBaWl4UjZ5anNVL2NSbUxSUEUxaWZobks2OFpoUjk2WU1n?=
 =?utf-8?B?N1VMLy95UkE1K1VzZG52OGhMaWhLZ2JRdzc3Y3BCNTlyQmlHZ0JabWpCTS9p?=
 =?utf-8?B?eFY2cTB6TlZ6dE1yK3p2NTVCcHhxNVlIdmQyWS9mc3NjQkNYS1E4QkpWRTk2?=
 =?utf-8?B?OEh0OXFqK1U3Q01WVFdHT3lLZFFpYnE4WEN4bkpIVHkrK2R1ZGRpbDJGc1Fm?=
 =?utf-8?B?bnAzeVg2dlg3aGlDOWx6clpSUXllWGs5V0tFTXcyNm5lb2tldzRLYnJJN0t1?=
 =?utf-8?B?Z0dsc3VOQ0I4cjJJOTNhQThYclphZmx2S3d1OEFtS0FMamNqSzRjeHhKblY5?=
 =?utf-8?B?WG5iT0hBYmppL2FGZlpoUEd1dmFWcWpNblpWZDI5VkxnaEMwd0N6YlpqTEJz?=
 =?utf-8?B?YnRxYTZkR3d0dGkvbUtUeUt5bEdkdkxSSmxqVTExdUtZL1U2blRKbmNHZTUx?=
 =?utf-8?B?QXpoZkZsNzRkbmNNSnh0RG0xVXkwRVNQR2orbmhWWnpHcjZFMkpqbjhkR2p1?=
 =?utf-8?B?TUV6UUtCbzc0TmhmdGxraE1GUUJKTUo1LzVmMzJ2SWQ5KzN2V3IrQ1ZrMk5x?=
 =?utf-8?B?cmQzL3VWenlyMGVKdDFVN0NKb1lQcUJxYUVaZXczbnAwODRoME41QllXSXNI?=
 =?utf-8?B?MW9XQ3NUbWlVeElxQlpnNUlqRjdPdzJRUk91ei9nZlR3cGdEYUFWM1R5Mzgx?=
 =?utf-8?B?ZjB5L1hNYVFOR3c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 738cfb28-34a2-470c-2cca-08d9b9877235
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 13:42:44.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3780
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 13:42:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94236

In this case I have to support Alex's viewpoint partially...
On way how a DEPENDS operation before that can be injected is via 
INHERIT += "some-class" in local/distro/etc .conf... and if this class 
adds their own DEPENDS, it would get overwritten here, that's why I 
would say (esp as the described use case is very rare) it should be fine 
for now to use it as it is - *but* I would actually take that discussion 
to the oe-arch list - guess it's worth discussing that in a broader 
scope (as we already did in the past for those corner cases of variable 
modifications)

BTW thx for the praise of the linter for being overly pedantic sometimes :-)

On 07.12.21 14:35, Marek Vasut wrote:
> On 12/7/21 14:33, Alexander Kanavin wrote:
>> On Tue, 7 Dec 2021 at 14:27, Marek Vasut <marex@denx.de> wrote:
>>
>>>>> And as far as I can tell, bitbake can stick something into DEPENDS
>>>>> before it parses this recipe, so the :append is valid.
>>>>>
>>>>> Furthermore, git grep through oe-core already indicates a few recipes
>>>>> which use DEPENDS:append.
>>>
>>> I believe the warning is valid, see above ?
>>>
>>
>> The linter is an obsessive pedant, and is not actually always right, 
>> that's
>> why I want its author to comment :)
>> 'DEPENDS = ... ' is used throughout all layers, and doesn't seem to cause
>> much grief, so why fix it here specifically, is there an actual issue?
> 
> I believe it would be a good idea to start fixing it all over the place. 
> So yes, let's wait for Konrad.

