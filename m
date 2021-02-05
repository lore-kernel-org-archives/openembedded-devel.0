Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.57])
 by mx.groups.io with SMTP id smtpd.web09.8102.1612533791170957516
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kXJFIDXB;
 spf=pass (domain: windriver.com, ip: 40.107.77.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfJ6pQe8F0B/moiGddjUTGTVX3eRgcAaSc0+Sv/BQ/3EDuI/cO5Q1k0fxYOiRu9kPm7DKA4gxY78mPwD4+8GnLBtnY3l+kkus1N4HNOopzeurEm3Dc/KfO73xJFG6QGcG7J1ghydC02jXRyhoehlRXBFuzXCO55eYR+KPi1pMLFwrMxDOaqRAqOuZGIxMwxltblSCRD86pQKLqz8uXeuS6wxo+XCRfe+Sc8/1TBABTntyYzzkSTN6UBhTnyHQYH0xg84ObQ4JsBZKBaQtJeHJS5jUqhqyLnww4Dz8bjvPTmDT25jduBqyxmf46qcx7iSR/1WnV0EgQR7A0QpZ2s2tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYyPQaqO+L1ZOZA61h1nj9LKXhT3eJr3gqxC/iA9hww=;
 b=gqf7VWn0Vc59OBS14fscIVZbyBIW9gMozgRs8EUgI4vmKpsOO9VCj2yXuDmPAi10yWKTv2nQ0+ZDwlmXR/oQtxwtyLqyywZCBRoSGS4fWXEuO1C9TZa2Cb8LfwgK++sJrwL1rH8+dB0T5e4rchUBBvY5Evn+ZOhgmQBB+V+ssk0CCj1hRrEbhA4ChQDvxLMELR5FGswt+vdkHxhB0NG1yrCaVaSyzpzltRrMR4Ad5sx/4dChMVpiY88EwAk9YCKYk9I/aTv1eoz9oITjI0dcY+BaSxmRqIwqrdfU1c6z2AEkgAJfBX+/iFdfrIVznKyEcWGYZA+qk2UwtDcTxP0a+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYyPQaqO+L1ZOZA61h1nj9LKXhT3eJr3gqxC/iA9hww=;
 b=kXJFIDXBCh6X39vLCpTG4160x8VO0HzTPavhzOs45pQY47SrixsY2qg1BlL/9zaBa3lTRb1u6Cn4GpDps6bSONR5tkpCrv49lVDcmHKD96cki/6ApcbLfxL5JVm0CpEUlQdAAZDcmSKMKhdH2+EvwujTa4WGWoWLSNEcas/8Ix4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (10.255.163.77) by
 SJ0PR11MB4830.namprd11.prod.outlook.com (20.182.113.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17; Fri, 5 Feb 2021 14:03:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:03:07 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-javaobj-py3: Upgrade 0.4.1 -> 0.4.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ea4db46c-6410-2fcd-ac84-aef9950cb1f9@windriver.com>
Date: Fri, 5 Feb 2021 09:03:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203153822.25077-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:208:23a::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR03CA0014.namprd03.prod.outlook.com (2603:10b6:208:23a::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend Transport; Fri, 5 Feb 2021 14:03:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36ee220a-3c0b-4490-3310-08d8c9dec387
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4830:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB483020BC55A2DA92943169939FB29@SJ0PR11MB4830.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/wNyi++hIuylBctaW5Ecjpd8V56huT2DUB+U/dYnSI30jw7bWw6g30CQnZWf44OIluSRUzdgeAJ+4bCasG6ZqyJd7wTwnYqrAJ0nP/N2Z5do/xBzNeqSBlwZayXoRgJpKw53FzAe1uxJS/0ScQ4Wh0WHr1UNprl/DLO3LgOzV1sa94CxXOA3ML+tEQMKvH0MEiRoYqPGKr///Xcczl/5ha3/cwi4VAa+fOOHb8SysSBq/boMaopZ7YfvgpayZUjz55ZXThaJtkbO2UzOpIkF93RfrW9fSCBdoVzh+Dz7cc971eMc71aA+gxcXE2fqArIRZ8j1XCJ3pfkHc1gwYWqbXraYRCiekFhhF0HVSuY020bMt/4wDzpNARNFhNNNRmQXASHiTN+f2P1Upg5W0CHxH1zuzUfyJ6ZAX3oHq8zsV4HhplGS5q5KRTYDD7gltBZU+QZCLoeQI0DqkNiiWqzHFyJnXKNpkWD140//vG+ogQ7sJt169xIKR9aOrb1RzXbuiFUkQiWlPDS/aIcZ+06umuUoz5XCZpelb+BHqP/6VL+49OPLZGTWGOgKMzrb9/+zy9un7xpXg3W/PPvSwq8/ZhrPuHtufNnZrjGiaC1U8u7stCV6K0zpSJCC2mS1HR2xWytgna2LerhGw0E1W0vz8Na0KzeoKqtdSNXp1lGjA56c9NFn8L1Id1o53FiAjdX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(86362001)(6486002)(83380400001)(44832011)(8676002)(16576012)(316002)(36756003)(66946007)(53546011)(5660300002)(8936002)(478600001)(31696002)(2906002)(66476007)(166002)(66556008)(26005)(31686004)(186003)(52116002)(2616005)(33964004)(16526019)(966005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Z2huQ01JaE5BSVBOODBOY1p0QUtPQUlWckVZTmdKTVdzYjdFNVdnV25wYUdY?=
 =?utf-8?B?WWNSWjV0VE14K0cwdjgxa1BDY1RaTXpCcUZydjlVcWlKTWNJSjE4d1I4RG81?=
 =?utf-8?B?aEFqV0FPRjN6TU83Mkc4dEVuT2JMS3VlZEIvWjFSNTd2UFZwcmF5NWg3REwr?=
 =?utf-8?B?WWhrQ2x6akI3cjRjeDUydGFRTVdBR3dEeDhLZmVZN3VDdEl0c3FFcVBUT1Jp?=
 =?utf-8?B?cktMWS9FNXcwajRONU5nNXRhVXF2UGNtbm5CTWh5M1JGYWdSNm40RkVWdmI1?=
 =?utf-8?B?WEVDWDd4amRHNzBvUnBpVTVsWlhhdkNTdTEwdXB3MHZ5QWpPbS9zZFZjRHdT?=
 =?utf-8?B?eFhieFZBZXdoVGY2anI0Rm9vUzV3amQ2YVdGUDU4cFhHeFVWTnp0YUp1QXlN?=
 =?utf-8?B?QjZ2d0tZYkxuYlFYcUlZdittUnQrTjdaWEE4U2w3d0xmQ3ZkMUF2UE5wMkZi?=
 =?utf-8?B?aVpCZFFLSlk2d3I5RW9HdGQyU2UveEczamh6eDNIb3pPK2dXcDQrNmNib3M2?=
 =?utf-8?B?K1l6U21IYkNlSWROUWpWNjZTcTdYVTdNd0VvQmFpSXVLcFhURm5RRjRrSGJy?=
 =?utf-8?B?TjdaUENHRUpuUGt6eWVHWUZXUDhEak52TFIxQWhsMFkyNXl5VGl1NDd2V0pz?=
 =?utf-8?B?YUhpWkNzNUxTbWNZMmhrdmIwbnFqbUplZmJtaUdYT3lQNlozaHJlcllZNWFP?=
 =?utf-8?B?akxrdjhoZGFTTUFlTit0cTlrazlOMDVpclo0VHRqS0VXWC9wNi91aGtzcVFP?=
 =?utf-8?B?cVlQaG92VExZeFUyWVdpRm1mdjdUYkF0Sk13eVkzZ3R5K2pRdXA5MlY0Yngw?=
 =?utf-8?B?aFpORVgyTUpkVDNxM1kvZzBtc1NUTlhESksvM1QzYURpMGtwb2wwb29vTzVJ?=
 =?utf-8?B?ZjZFdTFXNDBQcnN2RG81R29wejNScUtHby9vcXdKNHQ4Rng1dzFBamVFcENI?=
 =?utf-8?B?VE5VbGZhOUZzOGJWVnY2OXlSdFJ4YnFaeVVZWTRSUndxY2hOTTV2dG5pM05z?=
 =?utf-8?B?dWxWZUxrVlhuSjVtemhTSm00b2w5cTcxWjMvNmZabEE0K2JzNXVocXRiN1lW?=
 =?utf-8?B?TVN6ZG5Yamd1R2hkV1ZSTi81amQ4MTVEeHZuSllXR3k4S2oxZmhVOStGTDIx?=
 =?utf-8?B?Z1pwVmFNWWJQR2FGM1FpRnNMZFJTaG53M1MvaU5pcVlNdHRTNDRaZWhLOHds?=
 =?utf-8?B?MkZVL0xaTkNKMzduK0pEem5QR1lMY01EamY3dmk0OE9tckdyRlZUeXY4eFlT?=
 =?utf-8?B?b2ZlbVI0dUJQczZHQVdCRU4zeHpKMFJ6WHZYMTRrcWI4WEd4b2g0Nm5QcXNq?=
 =?utf-8?B?OGxsMUxmVHg5YnRHS3B2Uy9MR3BidVBLYlNBdTJzYWcxcEh2U2ZHUi9ydU9p?=
 =?utf-8?B?NWEwMmYxUjEwQ2FDL28wdUwrNDJ6Wml4TExKRlNBYWx0SS9rN01POFl2V0NN?=
 =?utf-8?B?RTNUZDY4WHpXWDdpc3RrS2NQdjkzTE5YSTBVYkRuUmRkSjF4ZzJMbHJsdXJk?=
 =?utf-8?B?UzZubXlhNHIvSHpwVnhGOEFyTERMVG5RWnhtMmNZKzFyaFJXeUtDaU1weG8x?=
 =?utf-8?B?ZjRrYmVuWVZpUVM2azU3alJaUFhkNmlrUzNoY2NydjlwOGpHNXFCQ3ppU0RW?=
 =?utf-8?B?S0x2dVNZMlBjOEhvOUE4YWxGeExvSnpPZnI2SGw5cDZOaVNDM1AzaVQrZjZH?=
 =?utf-8?B?QWtoVW1sbFgwdnRJc2w5b05iazBkRXhNdGRBaVdCOCtLSStZWUxXOGlQVEVa?=
 =?utf-8?Q?6ZFH0imYwsaxFHsreHs8J26UZS2TBQ0bvlDYWN7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ee220a-3c0b-4490-3310-08d8c9dec387
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:03:07.5574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJoLqxvBb/2gl3FUIc5esM7EujBWobRF4iX2YA+hnZ3SUW5Ofo4H+/4B8bkcdDByhOlOLFZmyooiKthp09KAKmQZ+93rZYK3LaQeuRL8770=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
Content-Type: multipart/alternative;
 boundary="------------3A1FB02285A4513182B9FB4C"
Content-Language: en-US

--------------3A1FB02285A4513182B9FB4C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-03 10:38 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.4.2:
>
> - NumPy is now loaded lately, only if the use of numpy arrays is
>    expected. This allows the calling modules to load and configure
>    numpy beforehand.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-javaobj-py3_0.4.1.bb => python3-javaobj-py3_0.4.2.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.4.1.bb => python3-javaobj-py3_0.4.2.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
> index c83140a89..2f2421981 100644
> --- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
> @@ -7,8 +7,7 @@ HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
>
> -SRC_URI[md5sum] = "47632071c3c3ca14b6c42f2a4e2e1309"
> -SRC_URI[sha256sum] = "419ff99543469e68149f875abb0db5251cecd350c03d2bfb4c94a5796f1cbc14"
> +SRC_URI[sha256sum] = "ed3b1ffcfd39f165729cb53587cca02ab0bfa4c332c837a92d5ffe6aef5c8010"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------3A1FB02285A4513182B9FB4C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-03 10:38 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210203153822.25077-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.4.2:

- NumPy is now loaded lately, only if the use of numpy arrays is
  expected. This allows the calling modules to load and configure
  numpy beforehand.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210203153822.25077-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-javaobj-py3_0.4.1.bb =&gt; python3-javaobj-py3_0.4.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.4.1.bb =&gt; python3-javaobj-py3_0.4.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
index c83140a89..2f2421981 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
@@ -7,8 +7,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/tcalmant/python-javaobj">&quot;https://github.com/tcalmant/python-javaobj&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87">&quot;file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87&quot;</a>

-SRC_URI[md5sum] = &quot;47632071c3c3ca14b6c42f2a4e2e1309&quot;
-SRC_URI[sha256sum] = &quot;419ff99543469e68149f875abb0db5251cecd350c03d2bfb4c94a5796f1cbc14&quot;
+SRC_URI[sha256sum] = &quot;ed3b1ffcfd39f165729cb53587cca02ab0bfa4c332c837a92d5ffe6aef5c8010&quot;

 inherit pypi setuptools3

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3A1FB02285A4513182B9FB4C--
