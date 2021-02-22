Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.57])
 by mx.groups.io with SMTP id smtpd.web09.34914.1613999909120955612
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 05:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=epBZmrCH;
 spf=pass (domain: windriver.com, ip: 40.107.237.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIvXEMZmBe84yEM9hAvsbHEJ+cSQia6I54jvCF6eC9sjJiGLB8k1H/NwraWdhBXk4cb8TNzSIlG8SM2dkcmq+vdsFAGUe8aiM2xmomS1fqVOF6MXmG3RUA6xrGYNQx5nXd4PTUg1M46srJXAqrrADvxmah6r289dxa8hFjj9H2irab3djsBrmpMKMkoPSgZnxJ7cwFnW+OynmZnsSVPYoxLMbomfl6xfz6xNOUV2ZGnOVWcVWsYTl/0bIvQLKxZ/ZQV3kS88E1nZoKaTFPUHJMBoLrUR9cTVrsiDn8XmF2/8IMwciU3hnnn8rrN7UQsf7IjD5Y/DS7aAsOrYB+cejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUlnP0liGBN9VwQkNXBPv0KMvqTh6V0WdGNPbxM/g5g=;
 b=OqBdgY+p6M6vb5rgFI5u6LdlDK+YNkTB252daaCPQ8W2GOxKkzUOmtnJN8AVpryX6JTIfjUOeu3yz2J1hhYbh31j19CsbF+nAryAPM/PG0TVn4oi7whWwJYA7JLQoBl6ZyGX1nTMkBbmcR5WZDmjBvpNuZn1DM5u73bmj8pMSJHnYTTtoYTBeUjRSMSvOkwLJ20eidwK6KD4F+WHhH0/JDJHoBNvDnYlrQUx9LFePK2dkxoPXeFCdoGMFqHRc/n5lFJkyrlwq+vItDV3VI+h0siAR4GZ/FsspXvtjHcY6x39OyPhl1YuAr2h53DPhwILC5HenORmNLbvvt+6ofMUDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUlnP0liGBN9VwQkNXBPv0KMvqTh6V0WdGNPbxM/g5g=;
 b=epBZmrCH28QOAYmpKkSPnAtnKuTZ5NjFCNwDT6HpX8DBtK898M1W4iDScbeRAw5CulpKu6OxorvGElVlupsu5wOAL0Sgi7PoxNV20Zl7p4xXxIhXB+Arn9VLl1DAqhxpdQBL3OGYcXrKqlf5J/PoqTuLgrvUFzFG63JZairWZ3o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Mon, 22 Feb
 2021 13:18:27 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:18:27 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-supervisor: update to 4.2.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210219215421.2367919-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fe4591ad-46a6-1ef3-59b5-19ac717dc90b@windriver.com>
Date: Mon, 22 Feb 2021 08:18:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210219215421.2367919-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0017.namprd16.prod.outlook.com
 (2603:10b6:208:134::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0017.namprd16.prod.outlook.com (2603:10b6:208:134::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 13:18:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93b72a5f-8967-447c-0e49-08d8d73456c8
X-MS-TrafficTypeDiagnostic: BY5PR11MB3893:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB38932704034416EB2A006B859F819@BY5PR11MB3893.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bCDXQs8J1L7UNgEKmrGJWNaqIr4D4PZCif4Bqj2kZ4b2wTdVeQCpDh95krpDy0P1Kl82Nroguk+0UOtFTZk09yFp+RtoDituYSp1J8ZzhcfyO/WsnsKee2NsTHy1ijbwDjn0cnVCnUYzPM1QwXYrrPGnveDme8CVBC9hIZhRF0Ra1eY7KBGK6jdenq9NsM9WxfdPggck18LlaEOeos2KGQkINgWppnhT9IP2V7qxbybVo7IFV0mSeEefVeWd+oHvr19p18a1HlPFJCu3emS03E0p6h69LCurxnLrcNmdiyIjEBsqD4A05FwuNm+sKP/E7esdFjPkJA1R1Xl3j3VFxBC7lior9qGCpOOFn39G1zcWl6L2nAlx5PXRLXIJ0eeTLO8eawWHXLdUQhH/jaxktj1Ji47ARyntf39mgB+IJc5DA7OhqhVDNYoJOIER58TNvGK5aNBp+B53oiEuVefhbLqISUptUa/Zsbr2Jg5vpsWoJU/8qF2b7KBs1Snvt5ZiE0dzUaDxSVQ6B6+A9qmqzT/JSonMD3HP96kb4lzTzVG4O7oyTBG//d8dxMA+JyjMae9gepgc2WB032qBNAKIfkCnCZiB4ltU/JVCczaKVlQ2ZNS/KcO1no+dpFQP2lExatD86YksoPXIhIPIl4ieOBFXRk7Cbeg1UznNSbEVu6UQUTBcAF8YaWf4vizPf/sJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(478600001)(186003)(36756003)(86362001)(31686004)(956004)(316002)(15650500001)(16526019)(6486002)(66556008)(66946007)(66476007)(16576012)(8936002)(44832011)(53546011)(2906002)(31696002)(8676002)(5660300002)(33964004)(166002)(2616005)(83380400001)(966005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SDB0UHlxemZ2Sit2NzJHb3Fia2pOQ2pHaWd6VkZrZ2FXa0ZUeTBGRWoza0JV?=
 =?utf-8?B?MEo3WFJJQVV0UDdYeVRFNnM2U1VtUUxoaGZDR0tJVlJaMUIrbUdBbHo5RXgy?=
 =?utf-8?B?elZ2a1J5QmYyazJRNjdMWFllcUNWVzViMm5iamV6WHdhV2lNK25idWMxdUtS?=
 =?utf-8?B?RENBNEJkZ0Z3SmdqWUZueUhxRnJIME9EZDlieEF4c0hpQ3AxbGFSLzloSHVo?=
 =?utf-8?B?Qkpkd3lmUE0xRFZ4cjJrUU9CRWVkajQ2U3UvZDJRSVRVOFI0dVVhRjlzTnlh?=
 =?utf-8?B?bXZwYytEc29pVnZyMmNtNmFqdTJMUzRXOWpNNkhlZ2IrV0duUEpxZ3dwZHNP?=
 =?utf-8?B?MWNZMHBjdWJJa0lzQmUvSGlTQjE5N1k1a0pOREVwRTl5QTJpVEhybW9ZemFt?=
 =?utf-8?B?M1c3TWNmdTc4UVF0SjZMNmorMy9KNDNucUdZUlBKK3IzRDJHamlQT2hVTHJ1?=
 =?utf-8?B?dnZuYnFqV05xdVRXSDUvTXpXemdkRXFtZWlMN2Ura3BYVU5BdlZXZ1FMNjNQ?=
 =?utf-8?B?a2dvWE16L20vTnZWZ1dPQWpkU1FkSjRKWVZHc2ZMdXY1RmJXeFVnVElxMm9k?=
 =?utf-8?B?UVRWZU1TY3JnUGdHWSszbzdKc3VkUm9ORXUwczlVa2VzRC9SeDAxMmZkSGR1?=
 =?utf-8?B?aWVjS083cXdLbWxTRzFZeHNwUVE1QXZ6dFpraVNUdW8rak9CUXpob0xkRmR0?=
 =?utf-8?B?N0RQRWFoUGprTFprK3A1SDFueW5XRG9UcFR1RzJVOVR2RDJ4bFMzRitDMmo5?=
 =?utf-8?B?N0FrUjhnOWxIKzR1ZmpEOUJSSDVhZ1JkR1ZDbEZOVCtVZUoxWFhRNm41ZGlI?=
 =?utf-8?B?OFp3cnI1Y1VmdjZuUGRpWXRmbFlxNWVtd3c3OFJXNE4xcjFjU0NzQTJRd0ht?=
 =?utf-8?B?Nm1naEMyVHVvYm1ydThyVVdPSjBrYnNZSCszQ3psUzdocEFlZkx3ZzlGL2pQ?=
 =?utf-8?B?cmpuVEVvWVY5KyszRlFxS3ZCTTJBSmZQbmU4bENqc2N0R25YNXRlL2U2SmFS?=
 =?utf-8?B?RnNXRnN5cStjK0d3ZEQrVkNYanpkYWVPSGNTYTJ6YjYwNzlEVFRKYjNyMjFm?=
 =?utf-8?B?TWplVnVUNHAzbTVuMmU0M1daM3FkRDZQUm4xa1RWRDYxVUQ1WEdySy91VVpt?=
 =?utf-8?B?L3d4dmxCcnF3akpJcHF0SHozcTVkcldjQVkzRUFjdXVrZHkyTlcra3ExejJj?=
 =?utf-8?B?L1RrVHgxNkhPZUNtaTM4alBGR1NqNHJFZ2tTc1pObXRmWCt6TzczQWhIbXZi?=
 =?utf-8?B?TGhhSC9wSXBmcUZsRkxPWVlUeklaZDVTRDF4dEgySmNPYTcvNkw1M2V0UXVp?=
 =?utf-8?B?bXdRUFlmSTB1T3FtZ0Rrb0Q1MWprZHh3NmFld1lLOGFJYUtzVUl5WlFFMXRP?=
 =?utf-8?B?dkpQQ3BYSE4vdnlTM0hnTHlPYnpCNisvZERrVnl3NkFIbGNFOE5xZ0h2b2o4?=
 =?utf-8?B?Q2xCaSs5cU9HaHFtWTI3RG1KT3RkT2FhUDVDL2ozM3JBM0FzWXpXNEd0UkQy?=
 =?utf-8?B?SDd1dEJZRVNDNnFabGliRTZWQkNrOWNNNjRNYjA1enFGU1hMWVF1NDg4cmNP?=
 =?utf-8?B?ZnlmTEhKM3A4dk1vMHhGUXl6N2s1WXRTMFpObVA1RStkdktkNmdwTE83UStH?=
 =?utf-8?B?TzM3UzRmb3p1OVpxTktEQlFpK0RReFVLdklmN0hQcVBrcGsyWFQ1M1U0aEw3?=
 =?utf-8?B?d0JKTFNldkxnSFZzMjRnRk9pcE5LYzdGR0U5Szc2RlVPOFA2WEU5UmNRSUp3?=
 =?utf-8?Q?+OvFOI3fYYT1M3ntvGxKV9iDmMqsNmkclfZje7i?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b72a5f-8967-447c-0e49-08d8d73456c8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:18:26.9716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pC8kw5LBAzmPm9fK19Y0tFf7eEJ+DaErLdqBuLUiaHI74Jqul4NnO3bntZvv/2Ms78wGi4ztnZso41Hlhydd/Zlfxo24j1XvEZmhcSZ0u5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3893
Content-Type: multipart/alternative;
 boundary="------------D9472731CAC600D0CCD8C39E"
Content-Language: en-US

--------------D9472731CAC600D0CCD8C39E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-19 4:54 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-supervisor_4.1.0.bb => python3-supervisor_4.2.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-supervisor_4.1.0.bb => python3-supervisor_4.2.1.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb
> index 56ab27e0f..0ff4b35d9 100644
> --- a/meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb
> @@ -7,8 +7,7 @@ HOMEPAGE = "https://github.com/Supervisor/supervisor"
>   LICENSE = "BSD-4-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
>
> -SRC_URI[md5sum] = "ecea94eedc70ba5127fdeb0665bcca0d"
> -SRC_URI[sha256sum] = "2dc86fe0476e945e61483d614ceb2cf4f93b95282eb243bdf792621994360383"
> +SRC_URI[sha256sum] = "c479c875853e9c013d1fa73e529fd2165ff1ecaecc7e82810ba57e7362ae984d"
>
>   PYPI_PACKAGE = "supervisor"
>   inherit pypi systemd setuptools3
> --
> 2.25.1
>
>
> 
>

--------------D9472731CAC600D0CCD8C39E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-19 4:54 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210219215421.2367919-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210219215421.2367919-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-supervisor_4.1.0.bb =&gt; python3-supervisor_4.2.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-supervisor_4.1.0.bb =&gt; python3-supervisor_4.2.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb
index 56ab27e0f..0ff4b35d9 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb
@@ -7,8 +7,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/Supervisor/supervisor">&quot;https://github.com/Supervisor/supervisor&quot;</a>
 LICENSE = &quot;BSD-4-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e">&quot;file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e&quot;</a>

-SRC_URI[md5sum] = &quot;ecea94eedc70ba5127fdeb0665bcca0d&quot;
-SRC_URI[sha256sum] = &quot;2dc86fe0476e945e61483d614ceb2cf4f93b95282eb243bdf792621994360383&quot;
+SRC_URI[sha256sum] = &quot;c479c875853e9c013d1fa73e529fd2165ff1ecaecc7e82810ba57e7362ae984d&quot;

 PYPI_PACKAGE = &quot;supervisor&quot;
 inherit pypi systemd setuptools3
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D9472731CAC600D0CCD8C39E--
