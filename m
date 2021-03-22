Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.84])
 by mx.groups.io with SMTP id smtpd.web12.274.1616425498178347120
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 08:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=sQD8Um2G;
 spf=pass (domain: topicproducts.com, ip: 40.107.20.84, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lMu1Omr1CPSJlX6wAN3ytW+GVR3aWO/scMZYA2cOYQ=;
 b=sQD8Um2GoelgzcFI5XuRrUGqJT4JY1gYrktbEUxIszIkN/9HJQpgdwtowB1HN7dvCSaMVKWHwRD0VGtXQndn12fig2tKICBmH2hnwkHEVLL1OapWXFRnsjGNQzkxphwG9kmU2biq31OQ6hyVvJACRNZ8niSdFSVbVpFHbhLBoFQ=
Received: from AM5PR0402CA0006.eurprd04.prod.outlook.com
 (2603:10a6:203:90::16) by AM0PR04MB6530.eurprd04.prod.outlook.com
 (2603:10a6:208:16a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 15:04:55 +0000
Received: from HE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::99) by AM5PR0402CA0006.outlook.office365.com
 (2603:10a6:203:90::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 15:04:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 HE1EUR01FT033.mail.protection.outlook.com (10.152.0.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 15:04:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.168) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 22 Mar 2021 15:04:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vvd2SWsazzi+tUs6Q6oO11ymTcan+imZsxK5tRDvCg6ie3FkA+SE/t6EZginnm/EFS7p2zBq6zZ+T2Bt9jGlahPKEHDXNcJjOW9cTXk5sAO8q9lteCi3tUpeJvEJukoJUOO5r+OZeGZYifb6s0bQBBJdqtoq8cTpEJnuRWoKtX82qQ7hYZKxCamv5W2wqfkA9ZbJDJfDANT2ixoWOfZ+LWy4kiWGFBdOQpw06VYCxAF5VnRe9CuHIxTjvcbVUZqWUU5zhJWKZlNJdqQxJBHqewwpGG1tuX1kCpPFnGnmjpfYEbNObtkz42+ALN9i5qnmeSPtLeLkXi8PHNOqn8d0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFxu0IKd5jDbMUX5y0nbLpaWGC/L+GELplXtTA/hFtE=;
 b=kRJ95Dy07I4v1CDHYC+WAa8AGLcfmtzI+njztxoIsEmgAgQP2pSD0Vdf3CdOZCHWwWztmMni0b7h8r78/pJ0WuVZ9PcdmcWnMgqNj/8nFaDAU3GjgJF6hRI121MvHHHuqqruIl4uX1FZd0XI7QTj0kRw3VVBMibeJ2j+wsy+rIsHFmcmYIcmzP0gBm3ZW8J6D1ZCK3mlVOzOCH30SF9B9qukkQ4IrMEqJG1MVYLg/qQJnYg9EYOTxU+U8oAczDC/qJGrOGc+BvtW3IOPK1NyfWRJ1Gao5sUCvZHVGCPxnAPxz+dIbeW5UDSHgdn/iMFmc6t4jp1/v5V3iKeh7XIp8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB7PR04MB5433.eurprd04.prod.outlook.com (2603:10a6:10:81::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 15:04:51 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 15:04:51 +0000
Subject: Re: [oe] [meta-java] openjre8 fails to compile on aarch64
To: Richard Leitner <richard.leitner@skidata.com>
CC: openembedded-devel@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.75f5ae13-2f0a-42dd-b164-bf1c3f2c0c91@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74969f47-fd5f-43b1-b5f3-843bc6e03141@emailsignatures365.codetwo.com>
 <d441a15b-11a2-294e-9430-c93a48283fc1@topic.nl> <YFiFTHaVZUBoq7uW@brokenbit>
 <a0a46ea3-769d-bc32-479b-160b10b882ab@topic.nl> <YFiPV45+9llagCwv@brokenbit>
 <166EB1C4D79F83DA.5508@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <26f25fd9-7943-1d75-13ef-e80d8f45f7cf@topic.nl>
Date: Mon, 22 Mar 2021 16:04:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <166EB1C4D79F83DA.5508@lists.openembedded.org>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::34) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 15:04:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93896434-d5af-49dc-e705-08d8ed43da64
X-MS-TrafficTypeDiagnostic: DB7PR04MB5433:|AM0PR04MB6530:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB65309BD74E35C6A33B69545796659@AM0PR04MB6530.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vNPzofrA1izAen8aNiKTR57OSX2C3/TI5kCE1/bfRmpYf3kdsctLqmuiK+BOvnF8fSh6gqxN5/b/iUieMcZMLWZ/WgMEneynucMeEFDdHUhktf6xislY8KGf3Hus7HOsr68iWDyARukMMoScH3ZJFf/dRL2JY/OP3qGTvIcqMfT8gP4Vqpyftwgct7QtovtXki4AC81esRLVMbNHoFAH35GSnLSISzhjYNV7x1TxeovewSxZOM5R3UovVfPxLpsroeX4PK312S43h5vyfTqhRPImNWk66wD9X2DcXJJi5AjZ+i4IpJOze4mtNE0Xc9thJgQY73ahwEoyZ0BvwBKDeygiAOyd/+M9QuKIY1kuZX1mlfXCPv9MB8U1kKLE59g9lvAGdkHDdTNXEjgc+pa1XTLHHaxNxjKpLNI/uaqTJCbMh5i8IKRyVaUV6L070y8BB9N5YvbtBNTQN9zweryYbuILedTpKEh9eLE67X02tiHFUI1i7sLy555iHs6YkiT97VvHK+uxFAyvMEjdtCrT0tGdLzvyjNHHDPy5aoDBX4Ho0BUcbxPkammZsdGZ1spYboId4WFQCb5JHDIqfmU3HFDkZNDuFK2XYcN3+9cbx1Rq8MQOBd/4GKIWaJC17I3NAZWmdCqChSdIr8K+OyDt+reZpA6783mPxuO/JV8Ho/2kFg1pcKojwLwmhgX4sixWxspQkM5J2mGpfSqTd4St8ghZ7jjmeGh+fpRcaPZEv+vrtdNcBgaAqyEQuCq/IS/PFFq38jPDzCevuOxXUR7/k9wj99IYoUohag1tnaXwbxA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(136003)(396003)(39840400004)(366004)(8936002)(8676002)(66946007)(31696002)(6916009)(4326008)(15974865002)(26005)(83170400001)(66556008)(66476007)(16576012)(2906002)(31686004)(44832011)(52116002)(956004)(36916002)(2616005)(478600001)(966005)(16526019)(36756003)(6486002)(316002)(42882007)(5660300002)(53546011)(38100700001)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WaTKnppG1Xo6LngO67ywMKr2S/FRfbn13GQxPXbmAT794brZ3NMYfMqWS2XF?=
 =?us-ascii?Q?qRF2JxKRYoxV9RbO9WHTU/ssdOfs2CG5vClvPr4PkmLxSJZQJ1+9l8CTxgmb?=
 =?us-ascii?Q?xGpUFAI3vQN2M4s4UbsOgNG8GjXrhTR9kSpAevKa9GIvbw2LVeg9z5y7QV4D?=
 =?us-ascii?Q?4Se8QVKY0FCv2wB73a8UIV1v1aF57UlpxwQAkA6m9IhxOPgsbYjChCYllXgF?=
 =?us-ascii?Q?O2TA/kla0EAyEPOT3p27GWhov7zxUirBXmBpYVZNkBKvHkSHribXdtOQM05/?=
 =?us-ascii?Q?QW3ivRFgV9FTgQ1B8FKtqpc/6hPfz0C3LX7qbnQel7fb14zLBrYIxD/iIR5w?=
 =?us-ascii?Q?f7c59qqn1Dg1VTtqZWMKxEXFdYCCd69D4xOJAB/q9XGctm+a7VSwvZdynhxV?=
 =?us-ascii?Q?bq4AUhr9YMiu7Z3uwUnUS13CaC207l1rB4vN86fgE26UaTR/KFK/7YpctuOS?=
 =?us-ascii?Q?+ps5TTP6m0kccCsIVfHhAC4G7jChvaez4n48yTEuDWautpz0L6LXE85shfPG?=
 =?us-ascii?Q?/ejGoOPt3PEzgRehCSSQezy91FiBJuEYp6AVBtcbPGSgNrNYRBCELBdPE809?=
 =?us-ascii?Q?hFaqutqwHGxV9bPdN3UursVLtYAMjlkRqesbqbtzJnCo+MGVBNVy0U48/4tb?=
 =?us-ascii?Q?hhA4Hd/8WBr11UwQYCwU8p0TlXr/FXUWjP7M0CFoYqH3WobpSxDu8JGtI2Nx?=
 =?us-ascii?Q?tPMxVd7fcrsbv48WaQbsxK8uaxBRNqL0t+2CED3db/3sC5rKos3LHoTRfBFw?=
 =?us-ascii?Q?0RFNbTpHCdTetrBa/M8QLJNrdU75CtNK3p9effDhA+xXXmlzftZXclQF+7a9?=
 =?us-ascii?Q?JdpCpm9IzdH+UeLFAKM7bFabaXi/hU9bMJaSlb5vKdpV0q/hRpUWdrrWiMaJ?=
 =?us-ascii?Q?CKpsYo4zGKqtlPhrKzqDQpb5RXwpEpCIRIsZcHvFKyToDTMt/mldKKi/aR82?=
 =?us-ascii?Q?2alWV9nuAe24gTrfyYSRY/EGZqopFK90MUTUfML5T8CzozKlJSSAogG8qL3a?=
 =?us-ascii?Q?6yO8j86cdzDjasMC59kNV9qf05erLHItKoX1PP9viLi96MdE45bWT0UhCLqv?=
 =?us-ascii?Q?jTjIoh4tmAshuWz5DFqokSLjVCrgVvAjHqHuqyeSoc1AqhkoXkD6ZnrI+lvD?=
 =?us-ascii?Q?pDz2cEwzMGYSHP3gcrM6iMfhQVkv8gX2mJvCD/KCjt13Ju7spOIudMcP/5VW?=
 =?us-ascii?Q?gK/aML2IeURLYwXKf0o4AHvSgrtyBvhHeKs3yDdPffS6ur04o0ChZhenxcgx?=
 =?us-ascii?Q?yepLsPgmgmMPKFdU+KwGjDpFftbDfqJwaJugzADQ/+uHNtOzmCNuD1X7uOGN?=
 =?us-ascii?Q?HW0iC6anSnMaAeOrI+8qFSi+?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5433
X-CodeTwo-MessageID: ad88c7fd-4018-4402-a438-8a57d0df10c6.20210322150453@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5f9f0370-7747-4a50-4069-08d8ed43d802
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PDeK6pDvuFsJ29FCNKfzX1zt48M++TvC50HAM3zA2WZ7AAxEPSZ02oW1RA6VsWRgOtnVgGYGQPpmW35vHf9BLp0imiEv31Z0F1vUtwswq1E6QaGvJbQ0K89n5IfYM4YLMsmwb1xsZb7PwUShRfAcRwpO1jarFH5dwCN1EOEdeqEPTrwJQW5Apg7dsXyHohLYVY8rHf0N3BGClVRVC4zM4RHItJa7lBE7KKc+QmP1fMb8gFO9NZiYDlUuyiT8zr6KzOGzepVYKI22RhUpp+Yv82YgSFthXNscmgxlADH5SLnX9ffM+Kvh6hIXFz1AgstRpQeikzkqMRLYnGRRkXepxPgc/XSLjU8lsXb7abgYIYejG9mnlEqdUPKLuPoHEQpiTabJ7XDOicng+rOvZMh0liMW742sz8ZlrFYnOX8dchBATK1pWHp8scpZFr20F6TZgs8D51433mmcybGiBUzSJtHTla5Sf6uVs+q7TB1Hs3TfujQOssqeGQoWwpEtFYoE/UIPcdrV5TU/+YzogsNpk4x/XurI/c7H7GLFtS2eungSZz+jVN/Q9E+frBiGkUSVMczIkb1oiJw4glj6jpRMdNa3d4Gvn/EtgDFJEsKpclfDWWsETUBIcTgWiIffXHlhs4F8bpdZ4vuzv7+QIxpbKnNwcySVovW6eJR5MZVkIYW69X1zwycoj2mh85hntI7dQ08X+cFuN7V6THzW/k6LE82ScKNi7nhDxXazh8iCe3NEWwDCYGie1UF6OufWqpNmA7YiyQ6ZakV2MSvYWPgjHg==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(396003)(136003)(346002)(376002)(39840400004)(36840700001)(46966006)(83380400001)(186003)(36756003)(82310400003)(44832011)(26005)(47076005)(5660300002)(966005)(6916009)(31686004)(70586007)(356005)(15974865002)(7596003)(7636003)(6486002)(336012)(478600001)(8936002)(70206006)(316002)(956004)(2616005)(83170400001)(31696002)(16526019)(2906002)(36916002)(53546011)(36860700001)(42882007)(8676002)(16576012)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 15:04:55.4709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93896434-d5af-49dc-e705-08d8ed43da64
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6530
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

In Line 72 of that makefile:

# set flags for adlc compilation
CXXFLAGS =3D $(SYSDEFS) $(INCLUDES)


So that kills the patch I guess



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
On 22-03-2021 15:52, Mike Looijmans via lists.openembedded.org wrote:
> Yes, the patch does get applied, I can see the extra lines in the work=
=20
> directory.
>
> But it somehow doesn't quite work...
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
> On 22-03-2021 13:36, Richard Leitner wrote:
>> If I get it right these flags should be filtered out by the adlc flags
>> patch [1].
>>
>> Can you verify that it's getting applied?
>>
>> Unfortunately I don't have a gcc-7 host machine available right now =F0=
=
=9F=98=95
>>
>> regards;rl
>>
>> [1]https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-co=
re/openjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch=20
>>
>>
>> On Mon, Mar 22, 2021 at 01:15:14PM +0100, Mike Looijmans wrote:
>>> Both "gatesgarth".
>>>
>>> Issue seems to be that the build host (Ubuntu 18) has gcc 7 and the=20
>>> one used
>>> for cross-compiling is much newer. Apparently there's something=20
>>> wrong in the
>>> makefile that it uses host compiler flags for the build compiler.
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
>>> On 22-03-2021 12:53, Richard Leitner wrote:
>>>> Hi Mike,
>>>>
>>>> which meta-java and oe-core branch are you using?
>>>>
>>>> regards;rl
>>>>
>>>> On Mon, Mar 22, 2021 at 10:43:53AM +0100, Mike Looijmans wrote:
>>>>> I cannot get openjre8 to compile. Any ideas what the real issue is?
>>>>>
>>>>> Compile for 32-bit ARM is okay, but building for aarch64 fails:
>>>>>
>>>>> ...
>>>>> | g++: error: unrecognized command line option=20
>>>>> =E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-oe=
-linux/openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
>>>>> | g++: error: unrecognized command line option=20
>>>>> =E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-oe=
-linux/openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
>>>>> |=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adl=
c.make:228:
>>>>> recipe for target '../generated/adfiles/output_c.o' failed
>>>>> | make[6]: *** [../generated/adfiles/output_c.o] Error 1
>>>>> |=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adl=
c.make:228:
>>>>> recipe for target '../generated/adfiles/main.o' failed
>>>>> | make[6]: *** [../generated/adfiles/main.o] Error 1
>>>>> | g++: error: unrecognized command line option=20
>>>>> =E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-oe=
-linux/openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
>>>>> |=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adl=
c.make:228:
>>>>> recipe for target '../generated/adfiles/output_h.o' failed
>>>>> | make[6]: *** [../generated/adfiles/output_h.o] Error 1
>>>>> | make[5]: *** [ad_stuff] Error 2
>>>>> |=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/top=
.make:91:
>>>>> recipe for target 'ad_stuff' failed
>>>>> |=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/Makefile:284:
>>>>> recipe for target 'product' failed
>>>>> | make[4]: *** [product] Error 2
>>>>> | Makefile:230: recipe for target 'generic_build2' failed
>>>>> | make[3]: *** [generic_build2] Error 2
>>>>> | make[2]: *** [product] Error 2
>>>>> | Makefile:177: recipe for target 'product' failed
>>>>> | HotspotWrapper.gmk:44: recipe for target=20
>>>>> '/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/build=
/hotspot/_hotspot.timestamp'
>>>>> failed
>>>>> | make[1]: ***=20
>>>>> [/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/build=
/hotspot/_hotspot.timestamp]
>>>>> Error 2
>>>>> |=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10//make/Main.gmk:109:
>>>>> recipe for target 'hotspot-only' failed
>>>>> | make: *** [hotspot-only] Error 2
>>>>> | WARNING:=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/r=
un.do_compile.9267:189
>>>>> exit 1 from 'exit 1'
>>>>> | WARNING: Backtrace (BB generated script):
>>>>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/r=
un.do_compile.9267,
>>>>> line 189
>>>>> | =C2=A0=C2=A0=C2=A0 #2: die,=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/r=
un.do_compile.9267,
>>>>> line 179
>>>>> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake,=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/r=
un.do_compile.9267,
>>>>> line 168
>>>>> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile,=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/r=
un.do_compile.9267,
>>>>> line 163
>>>>> | =C2=A0=C2=A0=C2=A0 #5: do_compile,=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/r=
un.do_compile.9267,
>>>>> line 158
>>>>> | =C2=A0=C2=A0=C2=A0 #6: main,=20
>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/r=
un.do_compile.9267,
>>>>> line 202
>>>>> |
>>>>> | Backtrace (metadata-relative locations):
>>>>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /.../oe-core/meta/classes/logg=
ing.bbclass,=20
>>>>> line 72
>>>>> | =C2=A0=C2=A0=C2=A0 #2: die, /.../oe-core/meta/classes/base.bbclass=
, line 56
>>>>> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../oe-core/meta/classes/base.=
bbclass, line 65
>>>>> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile,=20
>>>>> /.../oe-core/meta/classes/autotools.bbclass,
>>>>> line 243
>>>>> | =C2=A0=C2=A0=C2=A0 #5: do_compile, autogenerated, line 2
>>>>> ERROR: Task
>>>>> (/.../meta-java/recipes-core/openjdk/openjre-8_272.bb:do_compile)=20
>>>>> failed
>>>>> with exit code '1'
>>>>>
>>>>> --=20
>>>>> Mike Looijmans
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
>>>
>>> --=20
>>> Mike Looijmans
>>>
>
>
>=20
>

--=20
Mike Looijmans

