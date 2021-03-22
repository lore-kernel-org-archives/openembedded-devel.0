Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.47])
 by mx.groups.io with SMTP id smtpd.web08.965.1616427912424026331
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 08:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=rELE8vee;
 spf=pass (domain: topicproducts.com, ip: 40.107.14.47, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxBw/QEQcI3IogH2Az9eqkQAJGXbQz/t0/TFsb3D+cI=;
 b=rELE8veejqw118aWqb6HbZsefdOdkafc7acKnTichO13+CU4RMk6ppZv93ZpocCmQQ2KfpMOvkdCM7DL7UhneA2mfuAgH2ewkBQpd1RW9V/S65xDsWPcgaClq/akTNgoqm4PGNn5w2O9R1vpA9SIUcKve+u5ytGvNAghn7FPBFE=
Received: from DB9PR05CA0006.eurprd05.prod.outlook.com (2603:10a6:10:1da::11)
 by PAXPR04MB8222.eurprd04.prod.outlook.com (2603:10a6:102:1bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 15:45:08 +0000
Received: from DB5EUR01FT041.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::a1) by DB9PR05CA0006.outlook.office365.com
 (2603:10a6:10:1da::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 15:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT041.mail.protection.outlook.com (10.152.5.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 15:45:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.175) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 22 Mar 2021 15:45:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/UnYVtivLNeRvFr20xERMAdIECCHSQYeaCoPAOeXGa20cK++ezF5Fb8z7VeduVeS+2yBExcKcUHD4m+xDFhPvrvygvJeZI9skuiUjfZnW0BYOmUgEOweoj1Alg9YR/jq0i768l53wK2l+6/PLVGez9V5JC8WFjRBafk4mIiSkae8M4lap02ZGRXIAbsCxQh6Xk9IiPWhdNFgywrQ9e14ylK8n3S6eqQJ1WVLHDG9QWWcwv3o9abkKDGshN6XG2Z5PTmEaQ0ixwSHghbFyQjRIAUYcautUCRK0IrhNk4GpJdmLFdM85l/yHf1GFwVCTMGnWI6NLl57TO0+gsDMnIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjR33vAbM60Lhh3R5eGbQlWi9aeGT3acE8vYpkCrqbc=;
 b=Oat+JXGvL6bV43CuQ5n9DWDPoP5ycP8XK+0ajoGCLc9Xfw/VS+6aS2UcteLS6sRfNZSCY72eVVwcUbrGms66N07f5nGxCkhcBvgps+yvxY0KBoz135ikux3p6WeUL9k73ahtb2dBDMWg0ZVjqsyX+I6tucUvQctFZwQVxRGhmtIzricdUHj25rVmOlHpoSEgAXmVHu0AQ5F4gMp2li+KjFsN/CeT+T4OaJDFxMIS+M7At+Aj69Iz4FlTfIw30/mL6XKB2OX1MR7IXShMY1chlUJdZfyJsHQN65FNSwXCbhXa2lz7XNKhmG5WcPtb3+md/m9m7MsnLiAzYHnRQ+FykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB6425.eurprd04.prod.outlook.com (2603:10a6:10:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 15:45:04 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 15:45:04 +0000
Subject: Re: [oe] [meta-java] openjre8 fails to compile on aarch64
To: Richard Leitner <richard.leitner@skidata.com>
CC: openembedded-devel@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.75f5ae13-2f0a-42dd-b164-bf1c3f2c0c91@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74969f47-fd5f-43b1-b5f3-843bc6e03141@emailsignatures365.codetwo.com>
 <d441a15b-11a2-294e-9430-c93a48283fc1@topic.nl> <YFiFTHaVZUBoq7uW@brokenbit>
 <a0a46ea3-769d-bc32-479b-160b10b882ab@topic.nl> <YFiPV45+9llagCwv@brokenbit>
 <166EB1C4D79F83DA.5508@lists.openembedded.org>
 <166EB26D9B0785E4.5508@lists.openembedded.org>
 <166EB42E11D37A69.5508@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <62cf45c8-ef8e-b9e3-eee2-36d770b62691@topic.nl>
Date: Mon, 22 Mar 2021 16:45:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <166EB42E11D37A69.5508@lists.openembedded.org>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:208:122::23) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:208:122::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 15:45:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5c86552-7462-43d1-7361-08d8ed49786a
X-MS-TrafficTypeDiagnostic: DB8PR04MB6425:|PAXPR04MB8222:
X-Microsoft-Antispam-PRVS: 
	<PAXPR04MB822246E74E2247E70698B39A96659@PAXPR04MB8222.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MWcCize9htWBqtkoQNPAhoDpcyECYMdkWAPubYbYBU4uOFGUNd/J58Y1us7FYp1qfzbID4k8U4HWBfNEjpeDocSW/otnkX9+iy5rKO75mHpHY6lZw8mtAJdc+2qBsQPUYdTpOCIPUXahRi8vexl90HP4DQ+GUmFG87AU6Lvs7cMILRZXsbPVOW4Gqb3HMPsrgIGWJLQhamhbFu+mvovDEAZW/NlN9sM5fjkWn/KHwTgCgEhzouS6nlEKBORE7pHVE/GYng50Uz0tvuhzjAKTQJAsf5wcoUQLFma1Qx7NZsnDmLOdk8BW1SL0/nMVlziB37AkiDi9MWCwmdEspeegW9y2OdF+LGzvFT1ULaJ55Q2D3C4W/stGQK7eiBpOMKJENXkVd1IPHgCfGlfAgEJEjTEG5QTsFLQ4TnvJOcFPJcm6MRsxqrahuUWrCjLZEiTGvz8Dr9iNqjeR7hpQ88Yp+LjaKqKmhdyc5FQpI1RZUngG7wmzesx448i+VTvG1c1p/lcgYx1FkS/KynOjJJiKs9E1MTk3hQAVbFjnnO5hlbTFRS8vOTaWwj3u+YE+eZZjcXc8q9dVt4kLPdgvAPKlLTL1ZeYeNc58g3DqogHdAgRsyTGSIPd8RmesfeoBec+LRizOgPKkQmpEgBOPH1H7ouR3FS95Xvj8VnMqIR9S05EqUHlDDR5lx1J2DJCLltcFlfgE5uBkdJiRsnKPTcxWb7iu5C45u/z4QAo5/7M+nHmRhN54yNmaPg74NtjkVg3MEkMIzRivtSqnKzZBo4vBYEGZqEA6ePWOwjqhWguYLXo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(136003)(39830400003)(376002)(16576012)(6916009)(8676002)(5660300002)(83380400001)(83170400001)(2616005)(42882007)(4326008)(19627235002)(956004)(316002)(186003)(66946007)(31686004)(66556008)(6486002)(478600001)(53546011)(31696002)(36756003)(52116002)(36916002)(44832011)(966005)(38100700001)(66476007)(8936002)(26005)(15974865002)(2906002)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4siJSem3f2oZPrRoOM4LwaMF+n8/rLGaNhP/747hanZ5FeGHqwIl/esYaTUL?=
 =?us-ascii?Q?M6z2XJc5gch6p8m5rkfWBk9If4K/yuxwNaVZzNosaBBOi+9/f+ezyNXz4TID?=
 =?us-ascii?Q?MQ4Woupkh/iWKatNvB1NNrqUQ2jU/3v26CXOQnZ0N5uFdBb3PauXv5P5FfgF?=
 =?us-ascii?Q?h8Rtw7poIUF5I/QeFRIMXhj4hkaqDKf227GsCZc8OlHtyu0zsJXDxj1VYmrG?=
 =?us-ascii?Q?+XuY2x2Lq5yBSwXUO7QdP8ysrKMRe8Jrl2UsrXIKT09k77JB+DuomQzthvV0?=
 =?us-ascii?Q?Y2vD+M0hLCXeFn/t3pzQKWLAQDW1SN6BJzL7pp0Va1gUw8RNoHtf2dDE20kW?=
 =?us-ascii?Q?Cld+sBbWqW/z0HVL61ttd3zFz1uYDB+xJv9qNCcFVXTy/97NAeu04tTJp+/J?=
 =?us-ascii?Q?CEyaNJJAVUichZgDXx1JAYasLkLaHEtRX64GTfANu7d3cjpYa+8H1ipjgTgZ?=
 =?us-ascii?Q?FFiiJacQLnHmCfAoFi8F5MVPIrbj/sDfbfcRsQSi3Dm8I8CLRRCiMzMROfON?=
 =?us-ascii?Q?wRqWDVuPyIpVBxGTPES5SMCxB8xWJ8xa6idB8fdy7JCazUYHNd1D7zMMJPeZ?=
 =?us-ascii?Q?xuHZpCgciYo10Ftpa7Z2iTptMT571eT0juVHyr4vN+l+s+UkAy+22/gS1Ta2?=
 =?us-ascii?Q?ei5EwNCcrr9Oa4CUX3FzQBBiEWK2XNh6560OMMaeKDp5gRR3eNvt+zJoDCzf?=
 =?us-ascii?Q?pkJxglXhlp9x4/7f5LQQme6SY9U9cIj7rc3FFOZbcfnMd37CXQwyZs1NDPYU?=
 =?us-ascii?Q?Z+eJMjDOG+4xXFqhG+HKvUDnLHemRwnCUg5YjBXIKHQDeafSeT7fYdou1Fs7?=
 =?us-ascii?Q?xktyVZA+D/Hi6ZYL6jvUfc4TE1Rsl3B59wX5aufuV+PP9h4MW7EyHk8QFshP?=
 =?us-ascii?Q?tg+IvPlgu6FMxDcnXh8VB14rw405YhyYlJShrdomd+kpzOPZn2BHqKQAVVXU?=
 =?us-ascii?Q?couFO5fHY2Jrdr+PzWd+fPH5sBDQbCxA8EfpMfGF2XhqnjXZKr+UktQ0f6sT?=
 =?us-ascii?Q?jWcYVAvnEM9DljsPuEX/FzJEbwAAqlMsyp+2kgQWhQng6rLdwgXWCd7HMh7q?=
 =?us-ascii?Q?uiqrBYFcZkfTHda1/B4YimPPG5M9pN7ZvGPBAyFGNu39jLljAsdK/yg2lQXg?=
 =?us-ascii?Q?Fq4V9HNJcepw9+ELjuLR3eupgSUXivIdvf40LNYMLc4efWsBOWJ5+xCuoFZG?=
 =?us-ascii?Q?oE37sS2zP9FkNJilcmywOmJSJYrEOaS0q9jR8ajffchyPvo1WroubaYNGR0I?=
 =?us-ascii?Q?6r52Jcj8WTQYeNq8hEKQH+HOq6sOfKhs6kM40KTNMNs9XXUSs8xOSEYzJSId?=
 =?us-ascii?Q?k1hDP6JIE0s9WlAnbcViDWjR?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6425
X-CodeTwo-MessageID: 23925ba8-cbb7-4114-b87b-b8a2632d5a3a.20210322154506@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT041.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	87f21c5f-2a4e-41be-ea47-08d8ed49760f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZStG1lyL9Y+VJ6qjAo53wFmClsSmwzcUBBfS1g/yGIT7SkFWxieH2UGHUizUBTWXvvG6+dXtSwqCv9+WP0Cvsvvj3KYYPoq0aVfj2NEPESRB2r51sy/HKWs3XPB+eC886z5pzrHjDWsIi+alFloxCBb0VE/Mg0sanBMco4ssNfraOH8aORxTyZyph9CFoaVKDH1ohJ/kqw3FqkC/jcAFTKKLlqFixq403Un3+0h5CSo8pH/k57GRnc2x5qRbNX4cqcIUq0TvoKo7yUdv4OTYXMFHUAuA/MdzDb0vf1q6qiNCqks5Torn3PZJ6csGDc0zjGsqXp7CGgXgq43DIlMlRQzgZ75uW2VgruFrgp8tKCkKIEsqyO+cyzGpZoB7C1TxaT603Tuc++2rszdKhoURyM7r6bmPevuX0eil978g1VQRk0yvIGUcJfewfVk6rfmw9dS9bfwmiEo/fEao7ZHuvIq1/FTnNT/er5imzbXB54+P5/fd9+xDl8fIpWkyU7GGVDj78b2gE+YDp6s1IddFgFq8BP6nYxBibx0YiN1oySe9Dp3YAW0CBdI4jWz0YRNWzG8ZpsEJXFu5iCoH8IAyu0D8dNK+tzRMMgXreYoriR0cHtVU6edEj3rbUsWakllcxP6Vltas2S4B2ePbnGTftRXjgP3un3CIQF5D1CEo+Fz5F93d0Y7mmwiZMLtmvQ7UiuKg/Ls5AMFB2LrmujYtNtwdyBvhmlun3CzK4hTBAiASnDiH22kIje/jV16WZ1ECX5LiXlrJGUrPiD4owGYLnw==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(346002)(376002)(136003)(396003)(39830400003)(36840700001)(46966006)(26005)(356005)(36756003)(70206006)(83170400001)(82310400003)(31696002)(5660300002)(7636003)(70586007)(53546011)(186003)(966005)(478600001)(36860700001)(7596003)(16526019)(2906002)(15974865002)(36916002)(316002)(2616005)(6916009)(44832011)(42882007)(8936002)(956004)(83380400001)(4326008)(19627235002)(6486002)(336012)(47076005)(16576012)(8676002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 15:45:08.0953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c86552-7462-43d1-7361-08d8ed49786a
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT041.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8222
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

But that yields something that doesn't work runtime:

# java -version
Error: dl failure on line 893
Error: failed /usr/lib/jvm/openjre-8/lib/aarch64/server/libjvm.so,=20
because /usr/lib/jvm/openjre-8/lib/aarch64/server/libjvm.so: undefined=20
symbol: _ZN17FloatRegisterImpl8as_VMRegEv




Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topicproducts.com
W: www.topic.nl

Please consider the environment before printing this e-mail
On 22-03-2021 16:36, Mike Looijmans via lists.openembedded.org wrote:
> If I just bluntly set the CFLAGS and CXXFLAGS like in the attached=20
> patch, then the compile succeeds.
>
>
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topic.nl
>
> Please consider the environment before printing this e-mail
> On 22-03-2021 16:04, Mike Looijmans via lists.openembedded.org wrote:
>> In Line 72 of that makefile:
>>
>> # set flags for adlc compilation
>> CXXFLAGS =3D $(SYSDEFS) $(INCLUDES)
>>
>>
>> So that kills the patch I guess
>>
>>
>>
>> Met vriendelijke groet / kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>>
>> TOPIC Embedded Products B.V.
>> Materiaalweg 4, 5681 RJ Best
>> The Netherlands
>>
>> T: +31 (0) 499 33 69 69
>> E: mike.looijmans@topicproducts.com
>> W: www.topic.nl
>>
>> Please consider the environment before printing this e-mail
>> On 22-03-2021 15:52, Mike Looijmans via lists.openembedded.org wrote:
>>> Yes, the patch does get applied, I can see the extra lines in the=20
>>> work directory.
>>>
>>> But it somehow doesn't quite work...
>>>
>>>
>>>
>>>
>>> Met vriendelijke groet / kind regards,
>>>
>>> Mike Looijmans
>>> System Expert
>>>
>>>
>>> TOPIC Embedded Products B.V.
>>> Materiaalweg 4, 5681 RJ Best
>>> The Netherlands
>>>
>>> T: +31 (0) 499 33 69 69
>>> E: mike.looijmans@topicproducts.com
>>> W: www.topic.nl
>>>
>>> Please consider the environment before printing this e-mail
>>> On 22-03-2021 13:36, Richard Leitner wrote:
>>>> If I get it right these flags should be filtered out by the adlc flag=
s
>>>> patch [1].
>>>>
>>>> Can you verify that it's getting applied?
>>>>
>>>> Unfortunately I don't have a gcc-7 host machine available right now =
=F0=9F=98=95
>>>>
>>>> regards;rl
>>>>
>>>> [1]https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-=
core/openjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch=20
>>>>
>>>>
>>>> On Mon, Mar 22, 2021 at 01:15:14PM +0100, Mike Looijmans wrote:
>>>>> Both "gatesgarth".
>>>>>
>>>>> Issue seems to be that the build host (Ubuntu 18) has gcc 7 and=20
>>>>> the one used
>>>>> for cross-compiling is much newer. Apparently there's something=20
>>>>> wrong in the
>>>>> makefile that it uses host compiler flags for the build compiler.
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> Met vriendelijke groet / kind regards,
>>>>>
>>>>> Mike Looijmans
>>>>> System Expert
>>>>>
>>>>>
>>>>> TOPIC Embedded Products B.V.
>>>>> Materiaalweg 4, 5681 RJ Best
>>>>> The Netherlands
>>>>>
>>>>> T: +31 (0) 499 33 69 69
>>>>> E: mike.looijmans@topicproducts.com
>>>>> W: www.topic.nl
>>>>>
>>>>> Please consider the environment before printing this e-mail
>>>>> On 22-03-2021 12:53, Richard Leitner wrote:
>>>>>> Hi Mike,
>>>>>>
>>>>>> which meta-java and oe-core branch are you using?
>>>>>>
>>>>>> regards;rl
>>>>>>
>>>>>> On Mon, Mar 22, 2021 at 10:43:53AM +0100, Mike Looijmans wrote:
>>>>>>> I cannot get openjre8 to compile. Any ideas what the real issue is=
?
>>>>>>>
>>>>>>> Compile for 32-bit ARM is okay, but building for aarch64 fails:
>>>>>>>
>>>>>>> ...
>>>>>>> | g++: error: unrecognized command line option=20
>>>>>>> =E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-=
oe-linux/openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
>>>>>>> | g++: error: unrecognized command line option=20
>>>>>>> =E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-=
oe-linux/openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
>>>>>>> |=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8=
u-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/a=
dlc.make:228:
>>>>>>> recipe for target '../generated/adfiles/output_c.o' failed
>>>>>>> | make[6]: *** [../generated/adfiles/output_c.o] Error 1
>>>>>>> |=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8=
u-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/a=
dlc.make:228:
>>>>>>> recipe for target '../generated/adfiles/main.o' failed
>>>>>>> | make[6]: *** [../generated/adfiles/main.o] Error 1
>>>>>>> | g++: error: unrecognized command line option=20
>>>>>>> =E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-=
oe-linux/openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
>>>>>>> |=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8=
u-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/a=
dlc.make:228:
>>>>>>> recipe for target '../generated/adfiles/output_h.o' failed
>>>>>>> | make[6]: *** [../generated/adfiles/output_h.o] Error 1
>>>>>>> | make[5]: *** [ad_stuff] Error 2
>>>>>>> |=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8=
u-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/t=
op.make:91:
>>>>>>> recipe for target 'ad_stuff' failed
>>>>>>> |=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8=
u-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/Makefile:28=
4:
>>>>>>> recipe for target 'product' failed
>>>>>>> | make[4]: *** [product] Error 2
>>>>>>> | Makefile:230: recipe for target 'generic_build2' failed
>>>>>>> | make[3]: *** [generic_build2] Error 2
>>>>>>> | make[2]: *** [product] Error 2
>>>>>>> | Makefile:177: recipe for target 'product' failed
>>>>>>> | HotspotWrapper.gmk:44: recipe for target=20
>>>>>>> '/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/bui=
ld/hotspot/_hotspot.timestamp'
>>>>>>> failed
>>>>>>> | make[1]: ***=20
>>>>>>> [/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/bui=
ld/hotspot/_hotspot.timestamp]
>>>>>>> Error 2
>>>>>>> |=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8=
u-shenandoah-aarch64-shenandoah-jdk8u272-b10//make/Main.gmk:109:
>>>>>>> recipe for target 'hotspot-only' failed
>>>>>>> | make: *** [hotspot-only] Error 2
>>>>>>> | WARNING:=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp=
/run.do_compile.9267:189
>>>>>>> exit 1 from 'exit 1'
>>>>>>> | WARNING: Backtrace (BB generated script):
>>>>>>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp=
/run.do_compile.9267,
>>>>>>> line 189
>>>>>>> | =C2=A0=C2=A0=C2=A0 #2: die,=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp=
/run.do_compile.9267,
>>>>>>> line 179
>>>>>>> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake,=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp=
/run.do_compile.9267,
>>>>>>> line 168
>>>>>>> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile,=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp=
/run.do_compile.9267,
>>>>>>> line 163
>>>>>>> | =C2=A0=C2=A0=C2=A0 #5: do_compile,=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp=
/run.do_compile.9267,
>>>>>>> line 158
>>>>>>> | =C2=A0=C2=A0=C2=A0 #6: main,=20
>>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp=
/run.do_compile.9267,
>>>>>>> line 202
>>>>>>> |
>>>>>>> | Backtrace (metadata-relative locations):
>>>>>>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
>>>>>>> /.../oe-core/meta/classes/logging.bbclass, line 72
>>>>>>> | =C2=A0=C2=A0=C2=A0 #2: die, /.../oe-core/meta/classes/base.bbcla=
ss, line 56
>>>>>>> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../oe-core/meta/classes/bas=
e.bbclass,=20
>>>>>>> line 65
>>>>>>> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile,=20
>>>>>>> /.../oe-core/meta/classes/autotools.bbclass,
>>>>>>> line 243
>>>>>>> | =C2=A0=C2=A0=C2=A0 #5: do_compile, autogenerated, line 2
>>>>>>> ERROR: Task
>>>>>>> (/.../meta-java/recipes-core/openjdk/openjre-8_272.bb:do_compile)=
=20
>>>>>>> failed
>>>>>>> with exit code '1'
>>>>>>>
>>>>>>> --=20
>>>>>>> Mike Looijmans
>>>>>>>
>>>>>>>
>>>>>>> Met vriendelijke groet / kind regards,
>>>>>>>
>>>>>>> Mike Looijmans
>>>>>>> System Expert
>>>>>>>
>>>>>>>
>>>>>>> TOPIC Embedded Products B.V.
>>>>>>> Materiaalweg 4, 5681 RJ Best
>>>>>>> The Netherlands
>>>>>>>
>>>>>>> T: +31 (0) 499 33 69 69
>>>>>>> E: mike.looijmans@topicproducts.com
>>>>>>> W: www.topic.nl
>>>>>>>
>>>>>>> Please consider the environment before printing this e-mail
>>>>>
>>>>> --=20
>>>>> Mike Looijmans
>>>>>
>>>
>>>
>>>
>>>
>>
>>
>>
>>
>
>
>=20
>

--=20
Mike Looijmans

