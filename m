Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.79])
 by mx.groups.io with SMTP id smtpd.web10.2903.1616575414391174544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 01:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=I9uevkk0;
 spf=pass (domain: topicproducts.com, ip: 40.107.21.79, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Us1iVubJ9AUkgm1IaJuCMW3vTWWsz/qMiVPKnouZX8=;
 b=I9uevkk03XtbrCeuPEyJNeGXnHb7B4XZbbi7KLWFXFT+e/VUF4G35aLBdgGpxtZ/qLzZTV2+9soK9IM+6m5kUpygRjLlXvtluRWGlWyz57DJY40SB9IuiHaPyRORyCk4NahmBwZKST/J1TSNzHkO9DlOnyHewYB8Dily5ys8xAg=
Received: from AM5PR0701CA0014.eurprd07.prod.outlook.com
 (2603:10a6:203:51::24) by AM0PR04MB6419.eurprd04.prod.outlook.com
 (2603:10a6:208:175::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 08:43:29 +0000
Received: from HE1EUR01FT052.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::cd) by AM5PR0701CA0014.outlook.office365.com
 (2603:10a6:203:51::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.14 via Frontend
 Transport; Wed, 24 Mar 2021 08:43:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; skidata.com; dkim=none (message not signed)
 header.d=none;skidata.com; dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 HE1EUR01FT052.mail.protection.outlook.com (10.152.1.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 08:43:28 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.52) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 24 Mar 2021 08:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlXxBEN4XFIXMQmx5giyP4lnVT0o9DbFjfjwvbc5+Ucf/n2xsit/oBqMhyWuzwpRvygyh8ioQKwpnxTDfTC3EI0VFZ32tfiYRVJUr/eorXTGyEU2juipNpLVNylWiPbbvV22P313ZCEBoP3zsbYPaIY1ICnw+wSC9lIOzspxJ1C3nFOjKFzCf5s+cMbGP+LolIPPZOLZjvGBf5BcauSB64hrWAN6vop1v9kk1tRzRmg5zEPDPQwcj6plofEy/DKPjiX7nqLqU+JMYFrhS3X1wAuBsV2RhqUKTKS0xY6+1lK6+jH4J6P0WFPcS6B6/dyQc9kNtkA8FWy/1h05OkcS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7B3ZxgWZYJsKKaba6DB6/HE0M2Mqn4l0HzBNH2iC5kE=;
 b=NtSyS54kBjxDR7sKLWeWIH8MW/b1uV0EoKHQvoUB3cqszK+56I+bbqrVSt+DmQEf69r8qCw1cU0egXPnM7a85PF4GtytEB9cTtzoCFyAB8gBqp/18K8QkRFD5pW0+rO2o81DC1MLgZH4DARkJbtgQzwz+1uUySHSTx68t8P35hjNe2kEZ1YHdKNCri4JCCxohRRD8ZA4/G+/UlE5h5b2XMcu5e56BZvitt0aHqJhcLoy0BdvjQCka8rZ7oHkGyhJcjxyEJnBr+s5qYabjwFEVbSvUViJHXbGajAj8HaonwjC4R2Xk2Yt4mpm96NxlNxfPvcf6IroKl3G5YQWkFD3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: skidata.com; dkim=none (message not signed)
 header.d=none;skidata.com; dmarc=none action=none header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB6PR0401MB2470.eurprd04.prod.outlook.com (2603:10a6:4:35::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 08:43:26 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3977.025; Wed, 24 Mar 2021
 08:43:26 +0000
Subject: Re: [oe] [meta-java] openjre8 fails to compile on aarch64
To: openembedded-devel@lists.openembedded.org
CC: Richard Leitner <richard.leitner@skidata.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.75f5ae13-2f0a-42dd-b164-bf1c3f2c0c91@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74969f47-fd5f-43b1-b5f3-843bc6e03141@emailsignatures365.codetwo.com>
 <166EA0EA5639ABCD.32074@lists.openembedded.org>
 <166F014747987FB1.18754@lists.openembedded.org>
 <166F36B0213D2F47.651@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <f638d77e-cc2f-4e36-edde-d64e615f4719@topic.nl>
Date: Wed, 24 Mar 2021 09:43:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <166F36B0213D2F47.651@lists.openembedded.org>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR04CA0074.eurprd04.prod.outlook.com
 (2603:10a6:208:be::15) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:208:be::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Wed, 24 Mar 2021 08:43:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ec0318d-351e-4c47-e9d2-08d8eea0e5cb
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2470:|AM0PR04MB6419:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB6419B5C95485B62558D2240696639@AM0PR04MB6419.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4XcU0ENJtNHn3wL6A6xqBEVwJAZF5STnXFJRFNw0guZsaff6wyYA/q9GEjG7mojijfbBKpn5yjTkQ3qFCx/0CNW/8W7GUsgUk84K9CI3ryM0aj+0I/TzUKc/iW+dxmmzmiclRVkOXsHfTNHjMJienUDiuXBp9sm670WOibJsUZZO5zufgL2gyvEWssVUI26gDpzilAHplquR3GpLxnMapr2kSWmhR6QiK4ed/WvAPJXm78RV2+H2kmQ9IiIc3FUPfDkgXz7sWyRrgFdgySC8nhWwFiSKQR407BtKBAWlUQRVbaZmL0ICNl0Pe1176E1p9TKwKFN39ERWoK3pIofGGqsm/ZFkIdXT/oVP8c258DE7q0ZtOqXFwGGwBXHt0as1z2NJVutTlN8JbN3/4pv4Smrayw2JK+BvX0+6ulVgqfMLVPTkYdNUPgycMMGkPhYTusdF/wLeeYl7qvj71m6ExifiQoPMdEluRx15PJjS6ue8YRK1NJvyiAEmNLdhjI2AhI8ehtCpxC2Fb+zgYX7pcXQ8knuAivD3J4tbX3XvNOfBICduiUvFJzfXDTLHe1a5hkXfjZEA56bZrot3q9W1eSKXdgn+u5tRgmkoa501K9XXfZzq90f085EsgDVw8BEJ2UVEC6XwolpdhAxE+b7//8kbqoPwKeFyL8x079Jw2supKr6kE9RT6cfELDMN+LJkTdPxlt7bngwOwWMFhbeMRPMdqnXFzxnhV0rfQIVVtazHqMYkvTCmYob9VsqpPyfxxfgeI4VsLXxZWjKhucLZVZV21klEhHnCtb/9AlwrwzEgsGHRqdBL4/WtS+VAGCRp
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39830400003)(396003)(376002)(366004)(44832011)(15974865002)(42882007)(53546011)(956004)(2616005)(66476007)(83170400001)(31696002)(16526019)(186003)(26005)(66946007)(66556008)(2906002)(52116002)(36916002)(6486002)(38100700001)(966005)(36756003)(4326008)(31686004)(30864003)(8936002)(5660300002)(6916009)(83380400001)(478600001)(16576012)(8676002)(316002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wnRg3fBpSbMqnJyaf+6/7Tgsh9AqNWyL+TFIdCojYEp0kIdjvoY+HEB6Zo1H?=
 =?us-ascii?Q?9GQeNEI0Ic4kXPBabKsRLUd5CERjZOcIIRiXR8Qa2yEkdiqqnKDfNL9TLv9V?=
 =?us-ascii?Q?+fZm1lABr+5g9qeSEWxPjGMUATKWI0+dTuV/OvBYp/9OH7bKSzOkAyXqG4kf?=
 =?us-ascii?Q?pdSFgsLDWiWcRFR+rO2leCuzAE0SfUc+blE9asfzog9HZpRUxQOMTsEYO+Bt?=
 =?us-ascii?Q?ISL9Bs/b+LkYry2q/QdHRs+R8wos+9EUGwM5awP7y3kp8p7RA3H1V/BzIVu+?=
 =?us-ascii?Q?14pfv+OLOoqsMEA8pbpj6facr2yVEOc4UNO14XF6lCZFZwahY3g4bClHANpc?=
 =?us-ascii?Q?eS2zuWLgCjKEiYE80IUCe/ZZpPYH4/TcBquqQJleld3lrU25WUZLC6wgeu72?=
 =?us-ascii?Q?A5DK4EDgWbf2ma2sf7Asa1cVa5MtK0dp9Fu0goLP8zPGuSC+BnEvXfHtSJcL?=
 =?us-ascii?Q?hiDOjmKw/LJhyOHtHN2BTqQR/6FaEOMYXnu2eXZDtLmI3VImeMFHiA2ImRoW?=
 =?us-ascii?Q?KJGXI/vQclI8RkhwB6HzNPQ3shLPYe+U3A0L86yk6rmSbTbWLatXtsECHDPM?=
 =?us-ascii?Q?nwbozZQZQp2FuA3Cscg6gJNr6dcPS+XNVgAM84X5Ckp9R7/Wdx5qtrJKWqUH?=
 =?us-ascii?Q?SfjT6XbDwIJm6LlzocT4lIDKyjQSGvKB0/feINcYrp9FgPGb2+llJDXhnRHR?=
 =?us-ascii?Q?49yFPUTexPGzhM6UROzQWgZkqyV+r+ilwYSFqVufyRddcgvkeWmwlSvj/pGM?=
 =?us-ascii?Q?ZAkFaFQHfjy3Nx9Bi1bQlD139e4Rgt2zllzcwlmxIyDWW+Y//rnAypgTwZCm?=
 =?us-ascii?Q?wLAypjz2Kkhpajux9bBHpXg+qMxiWjaGCHi/cZP56rsPlH2aZgT6MfYHUxd2?=
 =?us-ascii?Q?MFCXG9EAQhn5hlDdWS9OKwOgoxoSM0EfHkBjJwb7mVugmeRdWtd7bUo4o0IF?=
 =?us-ascii?Q?nfNh8oW53+Kg1Y9Aeg0vbZYblp5xKriFmBmVbsvEhw8QjTSboKzYGgORfS/R?=
 =?us-ascii?Q?HQPGWQL7z97XpwPdZbVbJO7ujUt+gbhQsXcKcq5mup/K3B5EuUhzHCUrdceD?=
 =?us-ascii?Q?a8Xylfw14DtpQZN4G8FA1WmBGA6WV9JxdrBtwCCS3k6lftRYUSM5DQi8nkUz?=
 =?us-ascii?Q?HhT3VqovtyPpAKY0QdJxOWwj3htpg2PkUMm3t57FWyZnp+R88hV1ui6wq1UO?=
 =?us-ascii?Q?ESYERN6hUAxefbkPE3wWv/rDbFz72/TKxV9gr+AnRGQIvU3ayuKAcJVwZ+1L?=
 =?us-ascii?Q?fkfx+fCbh+s1nx44r6yuQa39qKtffEveOfxN6Q5X3IUK+VTlUDMxcwYlGljs?=
 =?us-ascii?Q?bC9zg0O+forqjr5UaOI1+TjS?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2470
X-CodeTwo-MessageID: 8a74c9a8-e1f2-4cc8-a72a-fbfe864d80dd.20210324084327@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT052.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	db339be4-a73b-4bf6-e438-08d8eea0e3d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qNRMXd/98bCUeeOGLeHYLFLatb53AMo0yetjMo4UrbKFIIAL95gpkllePR2y3UooUGUKgl6Meq2LeIpAEozS+Se4FtP5VULH0lfMV3r09ubkBfQcxiYe60wwkxhRFHIkUzfKf5sACDSweR4nBDLsD7MXJ+0KUF6HB1UBVaRQrksL+W7h0yHHcadebwrHGNUafh60rV+05M0Vors0by6ikH2SWPJxsXUVPlvdvILc7lr7g8aTGLK5Hb0qFQ9Z7LGzMuOVOWQOMF4aTXnachbGj7dLp1gBMuFJNNfSCEQOS6Ir8zxzR7FVGC3RKs0AOsW51HlyIP6d9gMOue/DimgSOq11Q/K6zP1qIf6acvpb5BA0dBNdXHfrmTHNxIhFbDtRW78Va240+0R73rLMhdk0sbwhAkNeS8w3kP3StVg6Vp9qDGMiTv31TeWTFCV3JnfTHE/BBkJSypgxIGOk7w9n6yZIlkiEFTEcp5giGrauWcWYmZgbVdt8QFuWZUGvi34ohcy9TiYYsRFzG2SCWz2r/n1rAWJFeS2Et3ZPW18jaGh9tUrWAyXqqawBad6tH5BfT+21tf94M3lslxDcr7oymazulfel2yR1+kh/yO7/dnyXJONJqZvDYyq1+VCVX3F8CiZdUBZJjjWSqntLL7yjxExXA78kq+bQJTgAzaBW0JFsTVmFYGB4chEAzl/ygvUwAK3W+zl6eBmfxopNg1vX3aiqCJWzhUhmPWg5H94W4KNH+9EoETqnGYWLHMqYJuOX9z22VTGdwXpJzC6MlmkRptQAsKIGXTAGjdbbCPcWCR8=
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(376002)(396003)(39840400004)(136003)(346002)(36840700001)(46966006)(70586007)(7596003)(6916009)(966005)(31696002)(2616005)(4326008)(316002)(8676002)(36756003)(36916002)(83380400001)(7636003)(956004)(8936002)(31686004)(42882007)(70206006)(16576012)(478600001)(82310400003)(6486002)(26005)(336012)(356005)(53546011)(47076005)(186003)(2906002)(15974865002)(16526019)(30864003)(83170400001)(36860700001)(44832011)(5660300002)(2004002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 08:43:28.9739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec0318d-351e-4c47-e9d2-08d8eea0e5cb
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT052.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6419
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Sent a patch that works around this issue.

Then I get the exact same failure as in gatesgarth, the "unrecognized=20
command line option =E2=80=98-fmacro-prefix-map" bug.



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
On 24-03-2021 08:28, Mike Looijmans via lists.openembedded.org wrote:
> Been digging into this, something weird is going on with the TOPDIR=20
> environment.
>
> recipes-core/openjdk/openjdk-8-common.inc:
> do_configure_prepend () {
> =C2=A0=C2=A0=C2=A0 export TOPDIR=3D${S}
> }
>
> So TOPDIR should be set okay, but in the logging one can see that the=20
> autoconf tools do not expand it.
>
> Bluntly adding the following line:
> =C2=A0=C2=A0=C2=A0 mkdir $TOPDIR/common/autoconf/build-aux
>
> Errors out with an error that this path already exists.
>
> So it's something askew in the shell environment handling, but I=20
> cannot figure out what is going on here.
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
> On 23-03-2021 16:09, Mike Looijmans via lists.openembedded.org wrote:
>> In a desperate attempt to get openjre-8 to build, I just went to the=20
>> current master, and that failed to build with lots of warnings about=20
>> "inherit native". I noticed that those were fixed in master-next, so=20
>> I switched to that instead. Still fails to build after a looooong=20
>> time. (I replaced some private path details with '...')
>>
>> These are the GIT hashes are reported by OE.
>>
>> meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:69f8f3e21324223c8e68a34db156e4472=
acfba6d"
>> meta-oe
>> meta-python
>> meta-multimedia
>> meta-networking=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:589aa162cead42a=
cdd7e8dbd7c0243b95e341f19"
>> meta-java=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D "HEAD:db9a58bb71fffdb74eb9850978a643a98ff13323"
>> meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 =3D "HEAD:324843cb1a2feb5f5c7b0064ca33edaa605cb749"
>> meta-raspberrypi=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:a3cda589508a9b56ea80=
3cdd31e870481fc27132"
>> meta-swupdate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:065aa=
fa41cff44985170b9ff6170ff9f87007b7f"
>>
>>
>> Log data follows:
>> | DEBUG: Executing shell function autotools_preconfigure
>> | DEBUG: Shell function autotools_preconfigure finished
>> | DEBUG: Executing python function autotools_aclocals
>> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',=
=20
>> 'bit-64', 'x86_64-linux', 'common']
>> | DEBUG: Python function autotools_aclocals finished
>> | DEBUG: Executing python function extend_recipe_sysroot
>> | NOTE: Direct dependencies are=20
>> ['virtual:native:/home/.../oe-core/meta/recipes-support/libxslt/libxslt=
_1.1.34.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-connectivity/openssl/ope=
nssl_1.1.1j.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-core/glib-2.0/glib-2.0_2=
.66.7.bb:do_populate_sysroot',=20
>> '/home/.../oe-core/meta/recipes-devtools/libtool/libtool-native_2.4.6.b=
b:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-devtools/pkgconfig/pkgco=
nfig_git.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-graphics/fontconfig/font=
config_2.13.1.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-graphics/jpeg/libjpeg-tu=
rbo_2.0.6.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../meta-oe/meta-oe/recipes-devtools/giflib/gifli=
b_5.1.4.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-support/ca-certificates/=
ca-certificates_20210119.bb:do_populate_sysroot',=20
>> '/home/.../meta-java/recipes-core/icedtea/icedtea7-native_2.1.3.bb:do_p=
opulate_sysroot',=20
>> '/home/.../meta-java/recipes-core/ant/ant-native_1.8.1.bb:do_populate_s=
ysroot',=20
>> '/home/.../oe-core/meta/recipes-core/gettext/gettext-minimal-native_0.2=
1.bb:do_populate_sysroot',=20
>> '/home/.../oe-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_=
populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-multimedia/libpng/libpng=
_1.6.37.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-devtools/make/make_4.3.b=
b:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-core/zlib/zlib_1.2.11.bb=
:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-devtools/automake/automa=
ke_1.16.2.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-devtools/autoconf/autoco=
nf_2.71.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-graphics/freetype/freety=
pe_2.10.4.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-extended/unzip/unzip_6.0=
.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-extended/zip/zip_3.0.bb:=
do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-core/coreutils/coreutils=
_8.32.bb:do_populate_sysroot',=20
>> 'virtual:native:/home/.../oe-core/meta/recipes-support/attr/attr_2.4.48=
.bb:do_populate_sysroot']=20
>>
>> | NOTE: Installed into sysroot: []
>> | NOTE: Skipping as already exists in sysroot: ['libxslt-native',=20
>> 'openssl-native', 'glib-2.0-native', 'libtool-native',=20
>> 'pkgconfig-native', 'fontconfig-native', 'libjpeg-turbo-native',=20
>> 'giflib-native', 'ca-certificates-native', 'icedtea7-native',=20
>> 'ant-native', 'gettext-minimal-native', 'quilt-native',=20
>> 'libpng-native', 'make-native', 'zlib-native', 'automake-native',=20
>> 'autoconf-native', 'freetype-native', 'unzip-native', 'zip-native',=20
>> 'coreutils-native', 'attr-native', 'libxml2-native', 'ninja-native',=20
>> 'xz-native', 'gettext-native', 'util-linux-native', 'gtk-doc-native',=
=20
>> 'libpcre-native', 'libffi-native', 'meson-native', 'python3-native',=20
>> 'texinfo-dummy-native', 'expat-native', 'gperf-native',=20
>> 'cmake-native', 'rhino-native', 'xorgproto-native',=20
>> 'classpath-native', 'ecj-bootstrap-native', 'jamvm-native',=20
>> 'libxt-native', 'libxrender-native', 'libxext-native',=20
>> 'libx11-native', 'bcel-native', 'xerces-j-native', 'gnujaf-native',=20
>> 'commons-logging-native', 'log4j1.2-native', 'oro-native',=20
>> 'bsf-native', 'fastjar-native', 'jdepend-native', 'regexp-native',=20
>> 'xml-commons-resolver1.1-native', 'gnumail-native', 'xalan-j-native',=
=20
>> 'commons-net-native', 'junit-native', 'antlr-native', 'jsch-native',=20
>> 'm4-native', 'gnu-config-native', 're2c-native', 'libcap-ng-native',=20
>> 'ncurses-native', 'libpcre2-native', 'python3-setuptools-native',=20
>> 'readline-native', 'sqlite3-native', 'gdbm-native',=20
>> 'libtirpc-native', 'libnsl2-native', 'bzip2-native', 'curl-native',=20
>> 'libecj-bootstrap-native', 'util-macros-native', 'libxdmcp-native',=20
>> 'libxcb-native', 'libsm-native', 'xtrans-native', 'jaxp1.3-native',=20
>> 'logkit-native', 'servlet2.3-native', 'jacl-native',=20
>> 'inetlib-native', 'cup-native', 'jlex-native', 'jzlib-native',=20
>> 'xcb-proto-native', 'libpthread-stubs-native', 'libxau-native',=20
>> 'libice-native', 'avalon-framework-api-native']
>> | DEBUG: Python function extend_recipe_sysroot finished
>> | DEBUG: Executing shell function do_configure
>> | automake (GNU automake) 1.16.2
>> | Copyright (C) 2020 Free Software Foundation, Inc.
>> | License GPLv2+: GNU GPL version 2 or later=20
>> <https://gnu.org/licenses/gpl-2.0.html>
>> | This is free software: you are free to change and redistribute it.
>> | There is NO WARRANTY, to the extent permitted by law.
>> |
>> | Written by Tom Tromey <tromey@redhat.com>
>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and Alexandre Duret-Lutz <a=
dl@gnu.org>.
>> | AUTOV is 1.16
>> | NOTE: Executing ACLOCAL=3D"aclocal=20
>> --system-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-=
native/272-r0/recipe-sysroot-native/usr/share/aclocal/=20
>> --automake-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-=
8-native/272-r0/recipe-sysroot-native/usr/share/aclocal-1.16"=20
>> autoreconf -Wcross --verbose --install --force --exclude=3Dautopoint=20
>> --exclude=3Dgtkdocize -I=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk=
8u-jdk8u272-ga/common/autoconf/=20
>> -I=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk=
8u-jdk8u272-ga/common/autoconf/build-aux/
>> | autoreconf: export WARNINGS=3Dcross,no-obsolete
>> | autoreconf: Entering directory '.'
>> | autoreconf: configure.ac: not using Gettext
>> | autoreconf: running: aclocal=20
>> --system-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-=
native/272-r0/recipe-sysroot-native/usr/share/aclocal/=20
>> --automake-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-=
8-native/272-r0/recipe-sysroot-native/usr/share/aclocal-1.16=20
>> -I=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk=
8u-jdk8u272-ga/common/autoconf/=20
>> -I=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk=
8u-jdk8u272-ga/common/autoconf/build-aux/=20
>> --force
>> | autoreconf: configure.ac: tracing
>> | autoreconf: configure.ac: creating directory=20
>> $TOPDIR/common/autoconf/build-aux
>> | autoreconf: error: cannot create $TOPDIR/common/autoconf/build-aux:=
=20
>> No such file or directory
>> | autoreconf: configure.ac: not using Libtool
>> | autoreconf: configure.ac: not using Intltool
>> | autoreconf: configure.ac: not using Gtkdoc
>> | autoreconf: running:=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/rec=
ipe-sysroot-native/usr/bin/autoconf=20
>> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-nativ=
e/272-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
>> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-nativ=
e/272-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
>> --force
>> | autoreconf: running:=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/rec=
ipe-sysroot-native/usr/bin/autoheader=20
>> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-nativ=
e/272-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
>> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-nativ=
e/272-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
>> --force
>> | autoreconf: configure.ac: not using Automake
>> | Error in tempfile() using template=20
>> $TOPDIR/common/autoconf/build-aux/XXXXXXXXXX: Parent directory=20
>> ($TOPDIR/common/autoconf/build-aux/) does not exist at=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/rec=
ipe-sysroot-native/usr/bin/autoreconf=20
>> line 411.
>> | ERROR: autoreconf execution failed.
>> | WARNING:=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646:284=20
>> exit 1 from 'exit 1'
>> | WARNING: Backtrace (BB generated script):
>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646,=20
>> line 284
>> | =C2=A0=C2=A0=C2=A0 #2: die,=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646,=20
>> line 274
>> | =C2=A0=C2=A0=C2=A0 #3: autotools_do_configure,=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646,=20
>> line 236
>> | =C2=A0=C2=A0=C2=A0 #4: do_configure,=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646,=20
>> line 160
>> | =C2=A0=C2=A0=C2=A0 #5: main,=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646,=20
>> line 298
>> | ERROR: Execution of=20
>> '/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/te=
mp/run.do_configure.16646'=20
>> failed with exit code 1:
>> | automake (GNU automake) 1.16.2
>> | Copyright (C) 2020 Free Software Foundation, Inc.
>> | License GPLv2+: GNU GPL version 2 or later=20
>> <https://gnu.org/licenses/gpl-2.0.html>
>> | This is free software: you are free to change and redistribute it.
>> | There is NO WARRANTY, to the extent permitted by law.
>> |
>> | Written by Tom Tromey <tromey@redhat.com>
>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and Alexandre Duret-Lutz <a=
dl@gnu.org>.
>> | AUTOV is 1.16
>> | autoreconf: export WARNINGS=3Dcross,no-obsolete
>> | autoreconf: Entering directory '.'
>> | autoreconf: configure.ac: not using Gettext
>> | autoreconf: running: aclocal=20
>> --system-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-=
native/272-r0/recipe-sysroot-native/usr/share/aclocal/=20
>> --automake-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-=
8-native/272-r0/recipe-sysroot-native/usr/share/aclocal-1.16=20
>> -I=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk=
8u-jdk8u272-ga/common/autoconf/=20
>> -I=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk=
8u-jdk8u272-ga/common/autoconf/build-aux/=20
>> --force
>> | autoreconf: configure.ac: tracing
>> | autoreconf: configure.ac: creating directory=20
>> $TOPDIR/common/autoconf/build-aux
>> | autoreconf: error: cannot create $TOPDIR/common/autoconf/build-aux:=
=20
>> No such file or directory
>> | autoreconf: configure.ac: not using Libtool
>> | autoreconf: configure.ac: not using Intltool
>> | autoreconf: configure.ac: not using Gtkdoc
>> | autoreconf: running:=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/rec=
ipe-sysroot-native/usr/bin/autoconf=20
>> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-nativ=
e/272-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
>> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-nativ=
e/272-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
>> --force
>> | autoreconf: running:=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/rec=
ipe-sysroot-native/usr/bin/autoheader=20
>> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-nativ=
e/272-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
>> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-nativ=
e/272-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
>> --force
>> | autoreconf: configure.ac: not using Automake
>> | Error in tempfile() using template=20
>> $TOPDIR/common/autoconf/build-aux/XXXXXXXXXX: Parent directory=20
>> ($TOPDIR/common/autoconf/build-aux/) does not exist at=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/rec=
ipe-sysroot-native/usr/bin/autoreconf=20
>> line 411.
>> | WARNING:=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646:284=20
>> exit 1 from 'exit 1'
>> | WARNING: Backtrace (BB generated script):
>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646,=20
>> line 284
>> | =C2=A0=C2=A0=C2=A0 #2: die,=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646,=20
>> line 274
>> | =C2=A0=C2=A0=C2=A0 #3: autotools_do_configure,=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646,=20
>> line 236
>> | =C2=A0=C2=A0=C2=A0 #4: do_configure,=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646,=20
>> line 160
>> | =C2=A0=C2=A0=C2=A0 #5: main,=20
>> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646,=20
>> line 298
>> |
>> | Backtrace (metadata-relative locations):
>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
>> /home/.../oe-core/meta/classes/logging.bbclass, line 72
>> | =C2=A0=C2=A0=C2=A0 #2: die, /home/.../oe-core/meta/classes/base.bbcla=
ss, line 56
>> | =C2=A0=C2=A0=C2=A0 #3: autotools_do_configure,=20
>> /home/.../oe-core/meta/classes/autotools.bbclass, line 224
>> | =C2=A0=C2=A0=C2=A0 #4: do_configure, autogenerated, line 6
>> ERROR: Task=20
>> (/home/.../meta-java/recipes-core/openjdk/openjdk-8-native_272.bb:do_co=
nfigure)=20
>> failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 4517 tasks of which 4312 didn't need=20
>> to be rerun and 1 failed.
>>
>> Summary: 1 task failed:
>> /home/.../meta-java/recipes-core/openjdk/openjdk-8-native_272.bb:do_con=
figure=20
>>
>>
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
>>
>>
>>
>
>
>=20
>

--=20
Mike Looijmans

