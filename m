Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.80])
 by mx.groups.io with SMTP id smtpd.web12.4572.1630163483151244104
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 08:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=VHVGlc0E;
 spf=pass (domain: vaisala.com, ip: 40.107.8.80, mailfrom: vesa.jaaskelainen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4H7ZpbocA0AK1VYOpjPAw5a3yQLxmexqRjnelhsBqFr1CysuDwX1sIcRhOTw7hDJgHYBVGq2pPx+2gBLiCsCL5buTtPY6WbEAk7g5C9NTxCWyBjljzCSr2u0gnRT0Bw7rKPQ35NhqYBA7QWMrRzOPLCoLY9j3d89grIaTJ2FOMF+FzQe7yrCQ3RZfO4Fp9o+gGLiLE48eqYBOVQffjXaEdc7E2ZoPA7GPTjRt3KPKHw/4vm56p7xNJum8ci0WYP5OWdg8ralBJ6JyEITzpK3rHd4htBTXiq4MPHSwtEnBiRwR+/8cq4K7ScRWw6wdxwGoeMm9soESb7pw/KUJva7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmZfycY9vpaWY4vi/SuICnnHccWN8ikOsbxdeztYEHQ=;
 b=Kv4dEbbhshs4JsKnpJx9uqMfzGUTaZkJye7HD5AVIqQLXDmGpVCupIlqpwvkPrD5YI2A1pAihGj5pXFsg2/z9lIORxpJGnbkyw5vJwVfpHolLKhly3+7BVV/WBB0d1pLTloiPEBNY25Aol/Aos6XGW3YiLyJyhPusVbZtjdTbwDQEQuuQJX1aXFhUopPp21vE3EYvjtPvDs9Wqun8AdvNdnNqj6rCYqLhbOzZ9Pvh18tyrTcECuXSSZtWTwo6F+HRpuqcXoheE7XddcFhBR78hUaQHhaELYL3qd9Sk2Lg5PkPOp8pwvMg0e8b6xLgFtwJ8Y9MdAKK0Q16JRoBPNmcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmZfycY9vpaWY4vi/SuICnnHccWN8ikOsbxdeztYEHQ=;
 b=VHVGlc0Ei1SH2aRmmbyx2Ioy8ipezaAZ8bmiHnmVaycD/9DK5DqHjE2mYrRZJoyn5Duf60Kx43d7y4ebSJbCPqNJU1lBe9AM6ryS3T+OmWqGmPDZF8lYeFUveZ1FkjOUTmYGRzleN+Fpd5c6VH2SW1IyRf4rlbsK8QMvNUjfvtq5HiZQYt/rot4XySHfSh1LvzgYfA8vBdrwQ4qW5WyMil1TYC8Hl8SkS85F9+eawlESrbZy8rAIu3TzQHBITQmwXC1Ylnz367vX9GLQ+UGtv6C1prbs8FYGwWTryFs0PBtfmbfNoN44F+FaoLTFO+Wl8PYPalyV/FcPb8DzaNBXVQ==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com (2603:10a6:7:17::28)
 by HE1PR0601MB2363.eurprd06.prod.outlook.com (2603:10a6:3:93::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 15:11:21 +0000
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4]) by HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4%3]) with mapi id 15.20.4436.019; Sat, 28 Aug 2021
 15:11:21 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-cached-property: Add recipe for version 1.5.2
To: Khem Raj <raj.khem@gmail.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210828134727.277771-1-vesa.jaaskelainen@vaisala.com>
 <20210828134727.277771-2-vesa.jaaskelainen@vaisala.com>
 <b7f3d268-2b9d-c081-87e4-65967d4d2632@gmail.com>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>
Message-ID: <ee81ddfe-9753-53e3-8313-d87ce617eb8d@vaisala.com>
Date: Sat, 28 Aug 2021 18:11:20 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <b7f3d268-2b9d-c081-87e4-65967d4d2632@gmail.com>
X-ClientProxiedBy: HE1PR0501CA0025.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::35) To HE1PR0602MB3241.eurprd06.prod.outlook.com
 (2603:10a6:7:17::28)
Return-Path: vesa.jaaskelainen@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (87.92.181.210) by HE1PR0501CA0025.eurprd05.prod.outlook.com (2603:10a6:3:1a::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 15:11:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c370bd2-841b-426a-b992-08d96a3617b6
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2363:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0601MB236350EA7B181CD2E65E6CC7EDC99@HE1PR0601MB2363.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+HMx6TTpReMgZnnVz5aiVlVY0/bmIkf0PB8fAM0UvwTR+hQG0Wvu2IFgMC0jZrTx+glF9TA4Y7EslF5TdUeXvNFPSelsW+9tVvca5TJ04OSs41j0rv4229BPfOfuRD1x8FGyVDLEdV8RVIh1gOkBJSXutrliuZbB0RKn1dVIWMjTA5KZ35JtWv0oQ81bneEkV0uCZZ9xU3NuYZBS9mImE21ij6Hw5jVFN47XF+cJdP4wQy5e3VyC7K4GpKJVonH1b/ogF90uYzrg3jo1wMjSknuWMmkt3mEevFXaaBk6QUIzSFZ1iDoNggQlHbNx3Vbugb2itqv5+zbTV2Xg5zm6v+Ola3CnffTILzYUiOMO5aS19H+7mvKnDtfSZQelrRa7M+1BEPkCg+IkvHg8JUZaqpmCseyKMS11BmuCOROf9eSVduC1QTRuNgsfQOAB7jmXpwIBVIUGM+CAKFfm19ZVAUQwN3PiLafQzgz9sO1oVStjpBNz8dnvXTNB5Sc2LfX+VxbaXQpQIzzvb38dfLaEqmNUR37iW5T9wo2kEGxPujJR4sxZ2FPl8obPF0jpk5hxo8dpAdt+TGgH81F5rbvVJ7bWk7zFYtLV8qYP6jnc21Gvy8J568ODTQ9IBbBOVIyBHIJpwltGW45KbJ72qBNPGJ61vm3ubdtgrBQkyeLBBANsL8H2ORqzuA8ahFfHeFMwTzzC+mVPpR95/wPY0OZAkPWp88XaEQ4zhsAIgy6l9GS6iWQk18/Sh/RReKgyGRieexgHR9A5eR4xOu2T5rr9x7SPogwZgTalw4p0ECjOh5qj9eXSf4PTvK0b+H0kPB21cCsxrD0zTX7cmGUI310xDhexVtSGgcSNyoCG/j5ce/8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3241.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(2906002)(186003)(85202003)(110136005)(31686004)(45080400002)(85182001)(508600001)(6486002)(2616005)(38100700002)(38350700002)(86362001)(53546011)(26005)(956004)(16576012)(316002)(5660300002)(8676002)(31696002)(52116002)(66556008)(36756003)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mc7AUAcL0NQktPaXxZzilko8i+5CrdqlXVcEczutbwWd2WRl/XfnLsoPZ8rH?=
 =?us-ascii?Q?+ghBdmAtZ3p50BmMCoZFow2bAtbSlCc/CLrHBmi4dDQNWDXole/gcCCXmMKD?=
 =?us-ascii?Q?aDbxl9UQDNCcK27IEhFMcBLNy+So/ptG3+enj9DjcCfZmuKW9x4qXqE7XEt9?=
 =?us-ascii?Q?gDD3vE+bvb3vm9zlkLcMWYQj3Ll+tVuKsafWpJI1zS9CdSO4+0NNGRypxOOq?=
 =?us-ascii?Q?dFQlJBk6ealeP+7X79MgEWmqaEqrLTDycdcjJyEHad0aIYdulhbLKn++ZiDI?=
 =?us-ascii?Q?PrJAWl7MMkNAuO0mahMsN8rlLgp8/hqG9H5RMElACAkzuKyco7HerfruqnHV?=
 =?us-ascii?Q?C0dlOd89TknEYlJGs5sFWl6IgwC727wDUu0ZUDiM3uv+aa9WVXw/0Y0Q8R4h?=
 =?us-ascii?Q?aEYVg76B+eJUhNXyNeef0duNWnnWQ437H1CGCl/AqCIX0+zNDLPzi0WLlG7p?=
 =?us-ascii?Q?EC4SoB97XNALt9H0nNkrKkzNznpcM2v3zlQv7OX/fHJ7D4oWbPg6bbTCtJBy?=
 =?us-ascii?Q?HzBWW0Zhn7oOYJSoxzPTGTLB1DrZXs8m3RXckv9rS+Wd/a25wgLN8lBM8ovB?=
 =?us-ascii?Q?NmsM5PMKGqg57nhMXaOkHhtwpogc7nfPMOFn0R6fg6wZgAzCS2wwEDDsIkCC?=
 =?us-ascii?Q?3mKlLs7W2gJlmZoaIkN/6wqgYL1HcLHGRR3fmI4Y+g88YzNwP9J1rSZ/hSYy?=
 =?us-ascii?Q?z5UnJJhoJXMQIUXCZzUGtOnzfCMcxqQGWytgaqB53N9Qez5/G2jdTMD+9/3B?=
 =?us-ascii?Q?HsICicv86g669yEhH0n5oDhgkK8GyJzxQaHvmonWBiqnVcOqQ2m6YroeR36i?=
 =?us-ascii?Q?4etvbN33119MraYH3Yt9OwkU1xi7a1TDfnyPz+sPmsc6tjB/nFEVq9RQ1bDK?=
 =?us-ascii?Q?kcHUm4hvdrIL27kyydrr4i3PgQ422IA4RdRAN1WggGQKGyMcazjPB4RdJFE6?=
 =?us-ascii?Q?mqvSHDDzRuMRiy7Bfwacm4pf+dr19JVmw98nlw7X9gV4upWi77WIeKGZ8RAL?=
 =?us-ascii?Q?D2Ry26H2LOjX9vjsCzDzRWZvS43uCixZE80R7+KNAm6BmaXd4FZppdUvz5gm?=
 =?us-ascii?Q?CqDkPM7r3cnkI8rTn1gCWUwUHzVt3TLJsSTQjUvvhnia9UhU9VquYl+kerDf?=
 =?us-ascii?Q?Ly11cLMLlhF5Wrzr6bOEZJhwx+C0hHU2wwYWqs23GNhUNj6Luk5jTX9At8Ay?=
 =?us-ascii?Q?94znWjvANn2XlLSwRlTahIkJf4MKgKw6Q4CH27GPshD70afLLFwbJt/A27A4?=
 =?us-ascii?Q?La67MIAzdCb1QqeNJHN665DqJzJ4mPr/81xmscLuTInuElm21XLKMQL/M6dA?=
 =?us-ascii?Q?IBk2evnakjf2LlPW20V6wwY2?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c370bd2-841b-426a-b992-08d96a3617b6
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB3241.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 15:11:20.8954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Q2Zo8v2PcGgfl8j+QNqu3daGBW+jI9vbrVPJTUG2ZTgJ8s0pANWB7omSredaF1A+s/pe7ga58sWxuLy2DeZ+dGu79LVAJ+vlMDQo39tUTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2363
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 2021-08-28 17:11, Khem Raj wrote:
> On 8/28/21 6:47 AM, Vesa J=C3=A4=C3=A4skel=C3=A4inen wrote:
>> "A decorator for caching properties in classes."
>>
>> Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisa=
la.com>
>> ---
>>    .../python/python3-cached-property_1.5.2.bb         | 13 ++++++++++++=
+
>>    1 file changed, 13 insertions(+)
>>    create mode 100644 meta-python/recipes-devtools/python/python3-cached=
-property_1.5.2.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-cached-property=
_1.5.2.bb b/meta-python/recipes-devtools/python/python3-cached-property_1.5=
.2.bb
>> new file mode 100644
>> index 000000000..6f9266325
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-cached-property_1.5.2.=
bb
>> @@ -0,0 +1,13 @@
>> +SUMMARY =3D "A decorator for caching properties in classes."
>> +DESCRIPTION =3D "Makes caching of time or computational expensive prope=
rties quick and easy."
>> +HOMEPAGE =3D "https://eur03.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fpypi.org%2Fproject%2Fcached-property%2F&amp;data=3D04%7C01%7Cves=
a.jaaskelainen%40vaisala.com%7Cfb3cbd0f67f843de757308d96a2dc857%7C6d7393e04=
1f54c2e9b124c2be5da5c57%7C0%7C0%7C637657567143517146%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3D8inso0wTtLicN0NibcNwbla6swl9LGCHPdQpWlqQcUQ%3D&amp;reserved=3D=
0"
>> +SECTION =3D "devel/python"
>> +LICENSE =3D "BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddb7ff60c4e14f58534201242803d=
8abc"
>> +
>> +SRC_URI[md5sum] =3D "3451c63f8733ea0756ca1dd2b0c04bb8"
>=20
> you can ignore md5sums now a days only sha256sum is enough

Ok. Will remove it from both patches.

Thanks,
Vesa J=C3=A4=C3=A4skel=C3=A4inen
