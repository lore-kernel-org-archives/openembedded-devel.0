Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.44])
 by mx.groups.io with SMTP id smtpd.web08.11657.1616415325011171669
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 05:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=cirUPIhx;
 spf=pass (domain: topicproducts.com, ip: 40.107.20.44, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rAu1H9v4IGvSR7TAaI5w2hNzdxVSonUXq+TVa9VAtY=;
 b=cirUPIhxbIos3ty7HZwua2IFJqS6KEKdsCYLcCBq6jR9kv71ajdl5sEL+DPyKc0VjNdGUFUFtSvcCQLF5o1HHOE1TcC12eTtqZX9wjsqkSdocQX6uTsbQHeG/0F0Jyz+0a3vY9WG3ceIUWO+bIxLXcrDXBbWqTSC078eQOfaRls=
Received: from DB6PR1001CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::31)
 by AM0PR04MB4451.eurprd04.prod.outlook.com (2603:10a6:208:74::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 12:15:21 +0000
Received: from DB5EUR01FT030.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::3a) by DB6PR1001CA0021.outlook.office365.com
 (2603:10a6:4:b7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 12:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 40.68.112.65) smtp.mailfrom=topicproducts.com; lists.openembedded.org;
 dkim=none (message not signed) header.d=none;lists.openembedded.org;
 dmarc=none action=none header.from=topic.nl;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of topicproducts.com: DNS Timeout)
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT030.mail.protection.outlook.com (10.152.4.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 12:15:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.168) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 22 Mar 2021 12:15:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUNzXCgHFaeM+PZvJ28Kd3uTHmmlHyHyTxksSnsPlUCjbEzLnzuskA3VvT1qU4ZTFYxld972ZMNsVuJZcNIZZnLZYxTgZqQKUcval0/HaiKjYAmop7nuXyEeTEyWrd+dgHc971ChpulpYMz+o1hqF4XQqWphxCaCCJW3Mty4XNQKB0/BpPvV8LRfOmO2NJci+PBFfRb0f/F3vVHZIl2MCzQh5gL5cbV3pX5hs8lScJEM9vAVNOca5NgMmS9kdiJYHCNqotSOomO8MKY+EkWHLNcf2qL7jTLgZ2jHJ8GIYorDOu0/0LbtRbroSazpMXkOdbASndJw5KuGm1K0ZXj2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZdOroWXTpRoowdtTGlZVkKcaDP25hZ0QNp1R55tB5U=;
 b=WccsyaR7uldiNCh73PG7HbNanT2uA8d6HCBiauxCpp6mfb9JgnT0xbAgFJSjHHcUlCllnnZdPg2dN/SwnMrk18XESms6jCAO/K3Cf31GGEU2j9JGyxovUmqksnZ6vOKe7WHcAEvy4eL8qaIJeb2H1dWuNusCDgaIuqP5bNCDqxa2M8cnLwb1dmjmFdkSAGUnVU+OX+LGIJGq8ih1jv+KhRMf04zkcsWQgBAcnveCJvgvAvyH+zoMnqYaFbQqHG2WNkhv+BaLHeAJ75+EMxNnEUAyg025BS8eOOECPS0s/L5hov3Rwo3y/f8nf891ZMLca7divqfKVARShLtAcABQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 12:15:15 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 12:15:15 +0000
Subject: Re: [oe] [meta-java] openjre8 fails to compile on aarch64
To: Richard Leitner <richard.leitner@skidata.com>
CC: openembedded-devel@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.75f5ae13-2f0a-42dd-b164-bf1c3f2c0c91@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74969f47-fd5f-43b1-b5f3-843bc6e03141@emailsignatures365.codetwo.com>
 <d441a15b-11a2-294e-9430-c93a48283fc1@topic.nl> <YFiFTHaVZUBoq7uW@brokenbit>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <a0a46ea3-769d-bc32-479b-160b10b882ab@topic.nl>
Date: Mon, 22 Mar 2021 13:15:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YFiFTHaVZUBoq7uW@brokenbit>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::36) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:208:3e::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.22 via Frontend Transport; Mon, 22 Mar 2021 12:15:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1991ab30-2fba-4db1-b56a-08d8ed2c2909
X-MS-TrafficTypeDiagnostic: DB8PR04MB6922:|AM0PR04MB4451:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB44516B444906BCA0DFF40A3196659@AM0PR04MB4451.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 72VMpV6QH4bfaGTIczWA6i4mLfkKG0gi0+7wNrPkyqZzbNk+9m2JD6vHE39SXdIT/VXAN2b8oJRd7PmgnCjHKR1/mK6MOSzEZia6cSRlG8FBafcqqtHpIL0oK31IijwXQNnwW6MaEa8Y0z9GQh1Y7LHVjBeUXcHH3jeRfw8ajX98hq3rvQR4rweE9Zi6A4tGM1QJ9CUfeZxoTwsknLPWDBEwNbp0Oy3Q7+cv5uqANMlvozgF9YY91uZz6iBtsApOZoEBApVw5i7ly+CukU1HpA/1cu33A+osgIqSmbA+CxAoTeKrei0SceJW21y1uHON9qj/UzCaxdgSd1zbNptn0cqRar7Kwslzy/MkOeAIDJz4M+oJDcZfbL+xhgvNMElRBpRjvSe/VtgSbfgMEGMwavoBjJlQgTzRye9LgfwydspfZR1/s2PyPpHYTEl+oTRnbTzoR7HoRx7/9deQ/kvFeBbXHNLHrNeucnAk3Za+0DjSeZul6aKXTnlbufo8fnUT6W7m6EjEqtIjbwSG4awqCahEzW173C06wtiCJqIYxKc80JAQSuc3TvfxT7ASegQzakIJ2l5b29jOkulgmkqCRqykgQ9DdN6zHGyZt1/tRkuD4GxtLcGTcSTrN7rIzaTeFmikbfHwSLDinngLiUurMjS0/S7B3NAhyrxUF+HksIa/nCHEVA24MaJlgoTJIPNMv23vmDtM+8gZ4vTSZ36UyiOFWsgVKm6TjNSS4N8QquSJkPL3wBoyPTWmB/MYqEsuENqFPXQwtqMq0kq8mtfpTZnhdPrHIY4gyx4BTpPIR+k=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(136003)(396003)(39840400004)(956004)(66556008)(316002)(44832011)(66476007)(83170400001)(66946007)(8676002)(31686004)(83380400001)(8936002)(2906002)(16576012)(2616005)(15974865002)(31696002)(4326008)(52116002)(36756003)(26005)(53546011)(16526019)(6916009)(478600001)(6486002)(5660300002)(38100700001)(42882007)(36916002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rKU4wEVTnvVES4KusZ6ZZAPZQJJ+oYldQCqi48Ad88YEh9+2Hz40EaVMitpf?=
 =?us-ascii?Q?RSHUyqvzwSC6NB2gmAcc2mGzX5I/v2VgHr6aKvK4f/u8k1Ax9BgtkCUl4m5d?=
 =?us-ascii?Q?Ifa57doKW6u1QngUwTmaieVS3172YSHXNwefaIvtXfrC2WS5RBkn1QWzx9Wu?=
 =?us-ascii?Q?llgey9tK7QKtezoGfBfs6m1TgETsnI/Kk5xr7iLW2LNKGxi21Zjla4Mf1kKy?=
 =?us-ascii?Q?5npacBUFZ/acm4RDqtLMk71aPnljyNQ4dP3vJpmlfB+zV7q3WewwCF+ySblE?=
 =?us-ascii?Q?gGJPzYmuUd1v9KgwkUkNfKdDRyucyw6WZyL8MJo/XGcHDXa0y0grDvp/i45d?=
 =?us-ascii?Q?YKe1+a151p8k84pNO3+dkOe/lkOwBLJi9Sletriv/eTBln4Q78PcX09wEnqZ?=
 =?us-ascii?Q?Jw94DQgi6ecPmUT4FRhUkXMzwpoSGTTGANGY/F4Ib80skVucJa9HmP5qdxn/?=
 =?us-ascii?Q?l20xo70ZyEdN/cqWCcSLNZzqRSzP3VxrmC0vwK4w0LjfCuYPXxRwVqesm7ak?=
 =?us-ascii?Q?j+TqZid9W8M1yWqnVvDio5wP2POF6+OSh06LFGNkS8jMM2yQRfAUWrgxYaO7?=
 =?us-ascii?Q?a/B5UALPqhK+BgDRPEFUwyJjb/K/Ve0xYYY6XXVTXFYqXRKvbxWgiErEUOU9?=
 =?us-ascii?Q?tDELBs3HqZuytzOEQjTRKhL0F2vY5gQCdc6CWnR+AJtktNZ+bVU7/P4H+H/a?=
 =?us-ascii?Q?CPd5i1c043lq1auPZZ+/+7I6RA0o5IVU1FEbjplbM5E2V9kmQC1frB5+Gy2O?=
 =?us-ascii?Q?CHfjBm5XacFzF9laaJx+uyCzV31ASLyUSkTW6W8RjRKhX+gOIOx/9I/eZ8j6?=
 =?us-ascii?Q?Y4OE3ruNOowNhko9KlEelAmCS84laN8VKDxjWwtPBOVxgB9+kW6RKztHIjy7?=
 =?us-ascii?Q?suOMBlZl42H+JwVVnVDF0j1QP6oLYTAUTbt9KLSxNhMzzUKfOndQZU4YnSZc?=
 =?us-ascii?Q?fbDH48DKN8K6grEAhYwvtSVU/TF3iw3JEOSm4BeVQW0fAXE5GSjBzhds9e9O?=
 =?us-ascii?Q?AMM1GBgJSMBWclzBYq/lOFIoNWsx5RsyF5VwR29IC+xThnhVTuTbNL7EYcc8?=
 =?us-ascii?Q?hyDnuk7pUkPnuQVlYx6WrvOrZvzKdH2x2JbtIt+BF1O04ifBDNk0ggDk+ZwF?=
 =?us-ascii?Q?UvjPPTxe3FIQNlyBEiSWKYQY6LsafWX3DuEcCvu6wyAwFjSg6HOuCKutgvo2?=
 =?us-ascii?Q?o0U8E24Mu7zVFMzeHanlbWLatpvFuRO/MqMqoFSEVj4aUIZPhXjZCokl8k9p?=
 =?us-ascii?Q?nl+kIEf6l/enMu6zOaPxMhPQfmIhCGoSCS+qo9ktp73TrGS0KUhOBfN74NQO?=
 =?us-ascii?Q?MJsnxJhY8Qp2p7x4PN+RvQ4t?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922
X-CodeTwo-MessageID: 9840a3d3-5838-47c7-89cb-85eb061a6044.20210322121518@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT030.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	65408def-7c20-4635-b48e-08d8ed2c264d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AeerWXydJdMF1P+iW6nyYw9TIGVHwxwr1IckcMdo5MGtKh5qs6QNiQmsmmebSbZfcXykmt++QKLDoybxlGh1BCR/O9nu78SHBG81+Xa69mLo9TiQN+eRROOBvLd0IUXAGmhkYssD1OutNJDp+Nwo99C5ybdTZWnBSA462cEHURIQ4YFY9tOJxelpEHUHiNY3YHr6dKDc9jyWjOh3dXokYyxagwYZKojh9hSZpZ1G42M16zlPRl5AQNS0LzTr4cN9gj9Zg0urmE7fnWkRpTU4KzNvDgrwGY07irVMplOznYdHKegWHTW8uiABpn46qA5u2coDd8zKD8dLfEjQEMnvOkSSN/VqmTI8xd+XorjYPvkB70IwJciB6EmCrESFgV8s3C4AW3+j1o2OIvJKOHn0jlJuJr3PZQKF12NBg3D4jGbpu6UMfHF6iJWr2tR9pUQ39pYjyPlDlBdsb4D7txWObLK+aCfr/e57qxJ9M3/vB8d93TMr84mcPIb6/DpFtf13aBr1o5NENcDh++QkeDWgMrsPX2tlTPY89mj96jHdhJZJrAzPW5djrauKvNkM47Jz/+bstxHzwrhnwLPLMXYV7tZYRVDoWmMGwoJ1SzNaSTCarYF8H4N5mNAe0YEu4zLsamG4wRPtF79i/jwgOlJwqjnu2TFHjZ00BulEl4FN1gmHU6MmCA90P307EjYbm4DaXoZkfjmvEDCaBXM1AWLTFyT2Wbax4Kt+mFyIs7SInj6GRr5hxeK2HcRPyKs/EvH4vfI0yuAtTxQ7KhAwI6DZ1Doz/9Ebtn2CfeE8f6GvwYQ=
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(136003)(396003)(346002)(39840400004)(376002)(36840700001)(46966006)(47076005)(63350400001)(2906002)(356005)(6916009)(956004)(16576012)(316002)(2616005)(31686004)(42882007)(478600001)(83170400001)(8676002)(336012)(7596003)(36756003)(36860700001)(7636003)(8936002)(4326008)(15974865002)(53546011)(186003)(16526019)(70586007)(31696002)(83380400001)(44832011)(70206006)(5660300002)(82310400003)(6486002)(26005)(36916002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 12:15:19.5167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1991ab30-2fba-4db1-b56a-08d8ed2c2909
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT030.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4451
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Both "gatesgarth".

Issue seems to be that the build host (Ubuntu 18) has gcc 7 and the one=20
used for cross-compiling is much newer. Apparently there's something=20
wrong in the makefile that it uses host compiler flags for the build=20
compiler.




Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 22-03-2021 12:53, Richard Leitner wrote:
> Hi Mike,
>
> which meta-java and oe-core branch are you using?
>
> regards;rl
>
> On Mon, Mar 22, 2021 at 10:43:53AM +0100, Mike Looijmans wrote:
>> I cannot get openjre8 to compile. Any ideas what the real issue is?
>>
>> Compile for 32-bit ARM is okay, but building for aarch64 fails:
>>
>> ...
>> | g++: error: unrecognized command line option =E2=80=98-fmacro-prefix-m=
ap=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/usr/s=
rc/debug/openjre-8/272-r0=E2=80=99
>> | g++: error: unrecognized command line option =E2=80=98-fmacro-prefix-m=
ap=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/usr/s=
rc/debug/openjre-8/272-r0=E2=80=99
>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-sh=
enandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adlc.=
make:228:
>> recipe for target '../generated/adfiles/output_c.o' failed
>> | make[6]: *** [../generated/adfiles/output_c.o] Error 1
>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-sh=
enandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adlc.=
make:228:
>> recipe for target '../generated/adfiles/main.o' failed
>> | make[6]: *** [../generated/adfiles/main.o] Error 1
>> | g++: error: unrecognized command line option =E2=80=98-fmacro-prefix-m=
ap=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/usr/s=
rc/debug/openjre-8/272-r0=E2=80=99
>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-sh=
enandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adlc.=
make:228:
>> recipe for target '../generated/adfiles/output_h.o' failed
>> | make[6]: *** [../generated/adfiles/output_h.o] Error 1
>> | make[5]: *** [ad_stuff] Error 2
>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-sh=
enandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/top.m=
ake:91:
>> recipe for target 'ad_stuff' failed
>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-sh=
enandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/Makefile:284:
>> recipe for target 'product' failed
>> | make[4]: *** [product] Error 2
>> | Makefile:230: recipe for target 'generic_build2' failed
>> | make[3]: *** [generic_build2] Error 2
>> | make[2]: *** [product] Error 2
>> | Makefile:177: recipe for target 'product' failed
>> | HotspotWrapper.gmk:44: recipe for target '/.../build/tmp-glibc/work/co=
rtexa72-oe-linux/openjre-8/272-r0/build/hotspot/_hotspot.timestamp'
>> failed
>> | make[1]: *** [/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/2=
72-r0/build/hotspot/_hotspot.timestamp]
>> Error 2
>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-sh=
enandoah-aarch64-shenandoah-jdk8u272-b10//make/Main.gmk:109:
>> recipe for target 'hotspot-only' failed
>> | make: *** [hotspot-only] Error 2
>> | WARNING: /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=
/temp/run.do_compile.9267:189
>> exit 1 from 'exit 1'
>> | WARNING: Backtrace (BB generated script):
>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /.../build/tmp-glibc/work/cortexa7=
2-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
>> line 189
>> | =C2=A0=C2=A0=C2=A0 #2: die, /.../build/tmp-glibc/work/cortexa72-oe-lin=
ux/openjre-8/272-r0/temp/run.do_compile.9267,
>> line 179
>> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../build/tmp-glibc/work/cortexa72=
-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
>> line 168
>> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile, /.../build/tmp-glibc/work=
/cortexa72-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
>> line 163
>> | =C2=A0=C2=A0=C2=A0 #5: do_compile, /.../build/tmp-glibc/work/cortexa72=
-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
>> line 158
>> | =C2=A0=C2=A0=C2=A0 #6: main, /.../build/tmp-glibc/work/cortexa72-oe-li=
nux/openjre-8/272-r0/temp/run.do_compile.9267,
>> line 202
>> |
>> | Backtrace (metadata-relative locations):
>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /.../oe-core/meta/classes/logging.=
bbclass, line 72
>> | =C2=A0=C2=A0=C2=A0 #2: die, /.../oe-core/meta/classes/base.bbclass, li=
ne 56
>> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../oe-core/meta/classes/base.bbcl=
ass, line 65
>> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile, /.../oe-core/meta/classes=
/autotools.bbclass,
>> line 243
>> | =C2=A0=C2=A0=C2=A0 #5: do_compile, autogenerated, line 2
>> ERROR: Task
>> (/.../meta-java/recipes-core/openjdk/openjre-8_272.bb:do_compile) failed
>> with exit code '1'
>>
>> --=20
>> Mike Looijmans
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


--=20
Mike Looijmans

