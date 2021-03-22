Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.68])
 by mx.groups.io with SMTP id smtpd.web08.96.1616424773039837715
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=wJy1kZhB;
 spf=pass (domain: topicproducts.com, ip: 40.107.0.68, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y07X0JkUWcqagrD1k4YSHFu0OJzmiy03qXIzPzmj7kw=;
 b=wJy1kZhBjW3EI7cj/dQhCGN73nztSrF3405/PH6zy5Z1eS28EhjH4fUUJRMPHqT4WtOlzYLuCfa4JpcU3EbrhYZNbVMjyW2mc+rwlI0Yb42WRllAgqFt4APDeDCOTM2FWdwyDqvmmc7iInxDrLAvhWxJUh91pqdyqZoMosQIm9g=
Received: from AM6PR0502CA0044.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::21) by AM6PR04MB4024.eurprd04.prod.outlook.com
 (2603:10a6:209:50::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 14:52:46 +0000
Received: from HE1EUR01FT006.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::83) by AM6PR0502CA0044.outlook.office365.com
 (2603:10a6:20b:56::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 14:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 HE1EUR01FT006.mail.protection.outlook.com (10.152.1.228) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 14:52:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.52) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 22 Mar 2021 14:52:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STUO1wQF9JEG7R6BZGfEUYuSkO8aMk0M0S8hUCu0JycJD7+oE4+PD2fauPWmYF8G+XmzjDftgIfHY6pDUtDBmCPNwEbhs16pxuVa3Whfkjefn4TfNmUblSV/avq3TKPB4fLYcqYQsiPVbCc2nA26DeMSEp4YIVvMVsOAoWFJoMXvUIHrHxhPt9eWk9If2nwZUqiObRO6ZZX52Gq3l0bDvCHyd/4FJyc+GFW+VhmcbF7BLrWBCsHIKmnSXiIMXOs5GMaHe8DIw20e+7Cz/r3BDitZXGYt88X1d2jwdXjwT1GUDZoWDK8CQ8cRhAqshEBaDvA6Z8fOHOZzcbK7GLZCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cwHHiqN02/k/CEdYIkuNvpOlWh/067K2xzZZeQt43g=;
 b=ltnsyObFrYeD5tNsUyf5Qspb+eos/g3YA8bil+Wqq2TnMp4pX5svPkh+Ias/rBOzUDzG/i3ugU3SRACH0mKwZXGBitD9JD3M6Np/2sRUo7WHN4QkapjBoIHHJ5bnUOb+IZbBcs2x6pr2Pp9u7tyxECfn8dIzIIU2OI6zhkjbOWt18ynXJ1pzdIy0XblkI2ZnbYHkknJ7YmtmuUgtiIfqkFrhV2NC9oX9IzAgMX+fRTCF839Agc8SiyeD6ZoMdonbij99f3LsiWqEWMhSGDCtteXiZQxyIPEoa/2b1Upu5J+IcarFqKfxnkpYdF+Dh7EsBCPHFlON7uMkxVCfxO2kWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB7PR04MB4715.eurprd04.prod.outlook.com (2603:10a6:10:1c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 14:52:42 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 14:52:42 +0000
Subject: Re: [oe] [meta-java] openjre8 fails to compile on aarch64
To: Richard Leitner <richard.leitner@skidata.com>
CC: openembedded-devel@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.75f5ae13-2f0a-42dd-b164-bf1c3f2c0c91@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74969f47-fd5f-43b1-b5f3-843bc6e03141@emailsignatures365.codetwo.com>
 <d441a15b-11a2-294e-9430-c93a48283fc1@topic.nl> <YFiFTHaVZUBoq7uW@brokenbit>
 <a0a46ea3-769d-bc32-479b-160b10b882ab@topic.nl> <YFiPV45+9llagCwv@brokenbit>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <d0c78c6c-efcc-7baa-b81c-36a2dd1c3a76@topic.nl>
Date: Mon, 22 Mar 2021 15:52:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YFiPV45+9llagCwv@brokenbit>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR08CA0004.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::17) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR08CA0004.eurprd08.prod.outlook.com (2603:10a6:208:d2::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 14:52:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9efc7659-0e6e-4ba1-93da-08d8ed4227a0
X-MS-TrafficTypeDiagnostic: DB7PR04MB4715:|AM6PR04MB4024:
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB40244D33FECA7EF8D4C37C6196659@AM6PR04MB4024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FcEGTW1RMJ7dcdBGoL/1qKocPK86PnR1+Zj26oWRL1yZ8iRADKiHVXcL3dv6umpj/sr5pFo3mOFay9h87QJobu8xS6AIx07e+iNewXNkSHtSUWNAvToKBYtKEpIdoi59/GCjDDLvUbXl2PUiBd/5Z9XISdF0/egez4IcDlCmC50i0xTOeIUEh06jVBU4xpZBLzOcKcfhx9NTpJ6+Ae89Mefk+xBXE56DidN+HTH48PyTHKzG74NnG2UAnnc5NnJwnnxpUmAMYyFxCdMWej3P6EDuR//7HAiLENsv7kBRZJ2jBWw6xDdNUyv8dOgNfLZjsJgL2aLq4PJ4ZcYDJ9xZDp+B3aODYIheNhac/OOPDJpJPS5dRxgk6Upkok5jBc3dtRUkfewrznw97D9Q4lomj6VTIB/fYbkt3aMDUdAYFFyU2tgWYcSkF/0FscF8RDDfdxiY+ai4bxqtZ/clVJPcshKMBjbQRHSi7o64jvP9cAyAClvS6lPfzGruSX9Qh7274RqnOvHDcfaWKF+5cCUD4l3icmDrSUq92XX/GKd/JuNhO/FAlbUu9G6kkKa1yXalNC1oXDBJ3X1FT6eV+Wmi8HyXs9fgSMnZnM6HhXx4ygn9TAcjiaqtvCPVHe+dsdbPZGVchyEIgK+H1wKDjTLxQRTg2Irprq4Q/D/h6C9CIwNiR/KksF2Hz+/3RhZf58+6+4fHGjMozvc6qBZoSOMcwMo/UJ0Yp3FS0GifbFYJIiSf0SNApH9PiVJXJ8vdn4jyuSDC9CX4iINZTPnb2HH7UG4oIiSyreXe2weNup67IS0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39840400004)(396003)(346002)(376002)(31696002)(5660300002)(83380400001)(31686004)(478600001)(36756003)(8936002)(44832011)(15974865002)(2616005)(52116002)(316002)(42882007)(36916002)(956004)(16576012)(6486002)(53546011)(186003)(38100700001)(16526019)(6916009)(66946007)(2906002)(26005)(8676002)(4326008)(66476007)(66556008)(83170400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TFyHfeg0HC3bUeLEZEGqV3KCMLFFvDp1mmo1+2LQoplXgTqRp1nu+vK9gH6J?=
 =?us-ascii?Q?xvf23h3lOCO6NUxM+PudyG9AJdPCtqZU4y3xsGLEaZpstOY3W97i/S5xk7Da?=
 =?us-ascii?Q?QyPAXAHSA46UkblfLJtCfhzW7lMYfkaAOoBQ1dbkGpj2TqSdT/FQNforkzbY?=
 =?us-ascii?Q?p92bwkpH41B62Z6oHQRN59x3RLN9EcM9hkePnR46T+ejPFjTuZ/HquUpwO2L?=
 =?us-ascii?Q?6GPQM3VyMbjXcW8uRScCUC+1f6vpaJFzUSfM38usvqoT/OoftdnTTlc0qQU7?=
 =?us-ascii?Q?9n6QZy3w+exjm9iiNXqk4z7+NuP7Cv1TtSjqwuiGHW8i8ARJkXi5gvhVo1R6?=
 =?us-ascii?Q?XEG5Ze6L8YkgjWM9z8t6bG+l9JVMXHL83s9Xr2V8uekHLrVoSA3tUSma1fD7?=
 =?us-ascii?Q?dP+o3L0K1aG76P/c/MN4m5NQi6WD2jl6Q4lqlPEM2IdwRjhYZXLBi3PNceGw?=
 =?us-ascii?Q?vvZzqYCN0uGk/5K9RBZPExKrHBoxbz0orbAQ/AZ427G2ZedyTqY6b20shnl+?=
 =?us-ascii?Q?XWBweEeoLX8nqjAbbBqkMjtZofCQtGSvwB8lICLR037vyFITulsZcL4VzaWr?=
 =?us-ascii?Q?jwGQlYsoHAOPS1sDgyAjGChRXc28UgzOOSCs6ZQGrLhJ0LUZdAhKPLcF069t?=
 =?us-ascii?Q?I6pniQAeu9ravhY3Y/sH/gPiWpZLbjWnmahFoyiS3GNZqXdkqdOgzeDORuPi?=
 =?us-ascii?Q?KjoqyKGVQaFPETMMQlBemZkg3rBH/BO2f0RoC2AlIiSP7+6v/rjDMzjz4QNq?=
 =?us-ascii?Q?4RtuduClGjRzVZsVXlMPwAYgDtfEzCo74xG+O459pbbh/s+qCqSKTC4G1q82?=
 =?us-ascii?Q?NTZsfxz1CJyOwz4u7bLxbmcEo6Y8hLea03AAbGti/9h1qbr8BvGVNwogBHXx?=
 =?us-ascii?Q?3TBjfMy9K+8tfMcqF1DNbr68VDd03xUq8G2kvODurelSKFeNliFseLW+KLNR?=
 =?us-ascii?Q?e03I9zEcFMKKCwoKZ8kKoVIPvEyEiinXaHTFYVopxEEgB4MkcWoUu31RC6YH?=
 =?us-ascii?Q?IgM0U3ygo1kDxWnJF4j2xPp/7Migc0D5xsW2WxKKRu5o9dFXIUcJlwth/l+E?=
 =?us-ascii?Q?FcGJUcFUUxG1LUtmtCVhz5UVy//tscRyPHj9vAf+7EHBgzSgdHVXBHmjxZPn?=
 =?us-ascii?Q?qT/YfKTBuyX+s6gqZ3l91mVgesdN82zncOJkLNErEWx8UeUb1kS07hL8BJgG?=
 =?us-ascii?Q?/k5Fr7UdRhsTrES90efkF3sNgi4Jcg31VvvlOAgjh7FC/hkfeTQJq/n1tELV?=
 =?us-ascii?Q?pIuFBadUdzTNU0GcT6pqwvwgwZavGoYlK892CwY+MDxDqOuLp88MTNERlQVH?=
 =?us-ascii?Q?yfcuGAjkCD9xKcd8fL8H/Ize?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4715
X-CodeTwo-MessageID: e8b3491a-5dd0-42d1-a16d-4730b6309d0f.20210322145244@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT006.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a6754610-0db2-4326-78f5-08d8ed42250b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MW/6RyOrCPQGpUkzDa3/LhNtz8ffCLeEDe7W9mK7uJe52CAtshJlTpq7FXS6sZ9A32rk63xUN5sPcRziYkc8Y9dGzY7MfakewiFfqprDlp75/1UHoH7kiAv32UZsz5rmNwZwDzcqwdeiuzUGtXOd0q01U80fK3YmrTldMGOBNSxp6jZU/pbPx4z6gXWt7fnmEJXfSDLxw12nV7Iq18PP2ERKVj1xeH0Ms+vv9QYkqlVYYP67BnNZrT6cUkrGVNdU0WyNJcw7yBZ7V9P72Yv8EXE/yM+Tp7E0Bt20loqPWPin2UWpBLIhJIBBeM6STO0ATPD/3gaY4nkMMWSRsE3A6JD1FK1dQZiBpI6DtsgNtlv57b0lRaAATHdaSn34T+f7bLnM90TZ5vLCqcTlnxsVocCJQUK2Lo20pHp23bH3vTGGoIk8jrgYiu62nfKOSMRXkv1xjJzVqsT4NPXa2HFHpJfjfo9CywHoX0akMrio4/d1ldirNj44iTe1wjprjxWBb+0I7hQaSboFwV3gfyUnbNpRSzAgIQDqu5NDDJYDg3wHvHc1XSXXoKxPflvWpB2vFt4zt/C0CsETesEPe1Nixd3OaFoU4jcgrKGsRy4rCdPPdHWvT3hMGodtOXNA1XfnaRaB/GN5QZ2c3Qc1Prv3u8pEBGU3tQToCnr5b3iyLB8tGwpbgf/g4GheXqtqnpGU5ICW3BGPyeg0OySQLn7XYAdXI2sZIh/WY0W1dxI3C/OCdCihoS9/TWxK7p93jE7M46VWq7EHO5NIeO/DgQeG/w==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(39840400004)(136003)(346002)(396003)(376002)(36840700001)(46966006)(2906002)(6486002)(31686004)(83380400001)(83170400001)(53546011)(70206006)(31696002)(36916002)(36756003)(82310400003)(70586007)(356005)(36860700001)(42882007)(336012)(316002)(26005)(7596003)(44832011)(8676002)(478600001)(16526019)(4326008)(15974865002)(7636003)(8936002)(16576012)(2616005)(5660300002)(956004)(47076005)(6916009)(186003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 14:52:46.0635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efc7659-0e6e-4ba1-93da-08d8ed4227a0
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT006.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4024
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Yes, the patch does get applied, I can see the extra lines in the work=20
directory.

But it somehow doesn't quite work...




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
On 22-03-2021 13:36, Richard Leitner wrote:
> If I get it right these flags should be filtered out by the adlc flags
> patch [1].
>
> Can you verify that it's getting applied?
>
> Unfortunately I don't have a gcc-7 host machine available right now =F0=
=9F=98=95
>
> regards;rl
>
> [1]https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core=
/openjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch
>
> On Mon, Mar 22, 2021 at 01:15:14PM +0100, Mike Looijmans wrote:
>> Both "gatesgarth".
>>
>> Issue seems to be that the build host (Ubuntu 18) has gcc 7 and the one =
used
>> for cross-compiling is much newer. Apparently there's something wrong in=
 the
>> makefile that it uses host compiler flags for the build compiler.
>>
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
>> On 22-03-2021 12:53, Richard Leitner wrote:
>>> Hi Mike,
>>>
>>> which meta-java and oe-core branch are you using?
>>>
>>> regards;rl
>>>
>>> On Mon, Mar 22, 2021 at 10:43:53AM +0100, Mike Looijmans wrote:
>>>> I cannot get openjre8 to compile. Any ideas what the real issue is?
>>>>
>>>> Compile for 32-bit ARM is okay, but building for aarch64 fails:
>>>>
>>>> ...
>>>> | g++: error: unrecognized command line option =E2=80=98-fmacro-prefix=
-map=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/usr=
/src/debug/openjre-8/272-r0=E2=80=99
>>>> | g++: error: unrecognized command line option =E2=80=98-fmacro-prefix=
-map=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/usr=
/src/debug/openjre-8/272-r0=E2=80=99
>>>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adl=
c.make:228:
>>>> recipe for target '../generated/adfiles/output_c.o' failed
>>>> | make[6]: *** [../generated/adfiles/output_c.o] Error 1
>>>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adl=
c.make:228:
>>>> recipe for target '../generated/adfiles/main.o' failed
>>>> | make[6]: *** [../generated/adfiles/main.o] Error 1
>>>> | g++: error: unrecognized command line option =E2=80=98-fmacro-prefix=
-map=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/usr=
/src/debug/openjre-8/272-r0=E2=80=99
>>>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adl=
c.make:228:
>>>> recipe for target '../generated/adfiles/output_h.o' failed
>>>> | make[6]: *** [../generated/adfiles/output_h.o] Error 1
>>>> | make[5]: *** [ad_stuff] Error 2
>>>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/top=
.make:91:
>>>> recipe for target 'ad_stuff' failed
>>>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/Makefile:284:
>>>> recipe for target 'product' failed
>>>> | make[4]: *** [product] Error 2
>>>> | Makefile:230: recipe for target 'generic_build2' failed
>>>> | make[3]: *** [generic_build2] Error 2
>>>> | make[2]: *** [product] Error 2
>>>> | Makefile:177: recipe for target 'product' failed
>>>> | HotspotWrapper.gmk:44: recipe for target '/.../build/tmp-glibc/work/=
cortexa72-oe-linux/openjre-8/272-r0/build/hotspot/_hotspot.timestamp'
>>>> failed
>>>> | make[1]: *** [/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8=
/272-r0/build/hotspot/_hotspot.timestamp]
>>>> Error 2
>>>> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-=
shenandoah-aarch64-shenandoah-jdk8u272-b10//make/Main.gmk:109:
>>>> recipe for target 'hotspot-only' failed
>>>> | make: *** [hotspot-only] Error 2
>>>> | WARNING: /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-=
r0/temp/run.do_compile.9267:189
>>>> exit 1 from 'exit 1'
>>>> | WARNING: Backtrace (BB generated script):
>>>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /.../build/tmp-glibc/work/cortex=
a72-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
>>>> line 189
>>>> | =C2=A0=C2=A0=C2=A0 #2: die, /.../build/tmp-glibc/work/cortexa72-oe-l=
inux/openjre-8/272-r0/temp/run.do_compile.9267,
>>>> line 179
>>>> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../build/tmp-glibc/work/cortexa=
72-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
>>>> line 168
>>>> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile, /.../build/tmp-glibc/wo=
rk/cortexa72-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
>>>> line 163
>>>> | =C2=A0=C2=A0=C2=A0 #5: do_compile, /.../build/tmp-glibc/work/cortexa=
72-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
>>>> line 158
>>>> | =C2=A0=C2=A0=C2=A0 #6: main, /.../build/tmp-glibc/work/cortexa72-oe-=
linux/openjre-8/272-r0/temp/run.do_compile.9267,
>>>> line 202
>>>> |
>>>> | Backtrace (metadata-relative locations):
>>>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /.../oe-core/meta/classes/loggin=
g.bbclass, line 72
>>>> | =C2=A0=C2=A0=C2=A0 #2: die, /.../oe-core/meta/classes/base.bbclass, =
line 56
>>>> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../oe-core/meta/classes/base.bb=
class, line 65
>>>> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile, /.../oe-core/meta/class=
es/autotools.bbclass,
>>>> line 243
>>>> | =C2=A0=C2=A0=C2=A0 #5: do_compile, autogenerated, line 2
>>>> ERROR: Task
>>>> (/.../meta-java/recipes-core/openjdk/openjre-8_272.bb:do_compile) fail=
ed
>>>> with exit code '1'
>>>>
>>>> --=20
>>>> Mike Looijmans
>>>>
>>>>
>>>> Met vriendelijke groet / kind regards,
>>>>
>>>> Mike Looijmans
>>>> System Expert
>>>>
>>>>
>>>> TOPIC Embedded Products B.V.
>>>> Materiaalweg 4, 5681 RJ Best
>>>> The Netherlands
>>>>
>>>> T: +31 (0) 499 33 69 69
>>>> E: mike.looijmans@topicproducts.com
>>>> W: www.topic.nl
>>>>
>>>> Please consider the environment before printing this e-mail
>>
>> --=20
>> Mike Looijmans
>>

--=20
Mike Looijmans

