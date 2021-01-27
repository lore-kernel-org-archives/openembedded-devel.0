Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.41])
 by mx.groups.io with SMTP id smtpd.web12.8793.1611760139296402347
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 07:08:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KBEoEpR4;
 spf=pass (domain: windriver.com, ip: 40.107.100.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+LNRJZc5rYOLFjiBPlKsIsWgyU9mqJP9eZqM25hO5oKmxThyIFDRvU9WvCUUDNCGtbyzjSJTbU1LNk29123nuXpNsfmVAPFZ25cVCrEAxfgc1uC2N7ohmaIlfCoVOB2J1pUNR8hXQkONGwrTyc7uojcoNtcWhLqLV4uWJ5+gGy77wRkFG/1dnvGDOFmep6emAIiaGkndgI8qHLn4j7JBjhurgd6gqddgXhqkMI++xJfNA6YZPjmatm8QCiVEx/H7xYgtPl/QKnoiub71HLImOxM5Z0Kx/tl0Tny5/qcxr3ZFtj/RDRKEDC0fm8tf5HQRlytrDSt4LMPvw8YRQAWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vlvz8XEKRaARhSVM9uORrQLCBxt4zzR4dF+48vASbw=;
 b=MXMW08vaGXudKybeJ9nUfG1R4e0gE4VYDt6p4fbUFmRZz3BhrIVRLkoUEIJaTmiUDXbr1hV73/tNQei6+Q0b8gzd8gdJ8As+K8103SzhlhvaT0l6CEGTl/Z267Cp/eo2gT0N2o1bTlWRYTFleOVdmauQpWT2w/pjiJxlJzWNz6sdbJg8GgYHGgM8QI8dhWetWsVknKVvXuty0N1tAkW91aEHK1dPP8n8sTTZ1x1emlLTjozMGBzQQKNBSba7lyvnn4JXBBv4qJ3uzWM8Jt0d/ss0vu+LXzFTIw4UZrtAYAV121Uxcbt9KF9/bq64yghB8NP2j4o8bB+FhabGtz5UZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vlvz8XEKRaARhSVM9uORrQLCBxt4zzR4dF+48vASbw=;
 b=KBEoEpR4yvRJLMGHIp9vSKLy322gt6aqjR5LgIjtOBvfIH2zBoUWQqh5+odgdHCf5zQCp+A2db88itUJIpT0zN1I36aplsNCWdOVOzbVz64dU3kkfnDhB+C/AKKTKmaH+5RQQNRLT9V3Ff+qj2riDT9o0JbcqsuCR4cm5ghHRyU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3478.namprd11.prod.outlook.com (2603:10b6:a03:7b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 15:08:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Wed, 27 Jan 2021
 15:08:58 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pyjwt: Upgrade 2.0.0 -> 2.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210125093035.6177-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5cb06709-80fb-d19b-fb38-191b9b00c030@windriver.com>
Date: Wed, 27 Jan 2021 10:08:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210125093035.6177-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR02CA0109.namprd02.prod.outlook.com
 (2603:10b6:208:35::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR02CA0109.namprd02.prod.outlook.com (2603:10b6:208:35::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 15:08:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3b630cd-4280-41f6-b525-08d8c2d57867
X-MS-TrafficTypeDiagnostic: BYAPR11MB3478:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34783E7509DE10E60B2AA0BF9FBB9@BYAPR11MB3478.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dKglGm3RWmGvzmMKa0rU8dp0/6tIe15v+QYZEF2pKf3TAfione20MmiOnbQQzhyu8fFKd2j3iDaIOeq/qaEHgp5DYgdr/6GjzJFTOtuXLqVMMMNonRYX3Xg5e6VZbFvLaMhzov44UwvXFny+faTjujiJs4vTiUNpajn4Vh3MIvXQPn5Cg18yLesa+yqlDqrjStcwdb4gY3fDIokeJOcbxNJzOzjzkEzyRH+IvhgyTSSIe/mQ7cfTDSVtzUihqNgNDyYCGVqBU1M5Tulh7s/mTB0bhCo0SHx+z6qwI23hoLVlpEbNuhjf0RWV4vP9TTdP9jk47kPW4lQq9Pe0cQhKlzzACndwqbtdDIlOtzof1aBY29LIvVImLJ3bNXrlKkoPMghGWTY4cxCZJh+jqrXd2WX4y8yhgFeKrCXQp8x5JTGKgU6mBmrIckuJdKAvyUwEXYGGTLDuFJLQJNWE8SDr3HiskxiHgcVMbz4w9CfhfDFLNXaD7iui78+xD8CxDU89C/xlzecdxb8BkB/qrp11APgIvI51BuPZJH7PKU+YhTMcTnwC/eFCzbaYS+zSpugm4gV/yzMjquitFArbgsABFXXzfXIby1YAC8PpcGJ7wEZ8bWld+sA5ETJq5NF1PAC+9OII7w71JMtzkLBsgxVcYHqP3q1bcPZ5hkfohL5O8PGqo5kaEPgI00bHZRaEc6pQgyffTUnkWCxZPoUDBrYR3Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(5660300002)(31686004)(6486002)(2906002)(8676002)(66476007)(33964004)(2616005)(966005)(36756003)(166002)(86362001)(8936002)(66946007)(478600001)(83380400001)(66556008)(316002)(16576012)(31696002)(26005)(186003)(956004)(16526019)(44832011)(19273905006)(53546011)(52116002)(43740500002)(45980500001)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b0xZbUs5eUlMbS8zT0kzWm1ESllWampQWm1jd2hMS1dpZC9Ib2c0RWdmUW5w?=
 =?utf-8?B?OHpwTXkxaDdLUENKUENEeWxJcUZTQ0V6cjR4emhYR0JtaWJiZjlGKzd6VDZP?=
 =?utf-8?B?WHg3ZjRoclkveWJHcEFDcTRBeE1CWHdHTWlmUFB0dldzcGlFREZoU1pvYUNh?=
 =?utf-8?B?R3lLdGhxcTJKN2lHekdEUCtrMy92VUlhYm9JNXRkQmRXQ1FzMHBYSFBTK2lJ?=
 =?utf-8?B?c28rODZNVitUSXFiUE9WVnZoWGk4Z2tDNk1SVjBXaEVib1ZtLzdxNDRKNXU1?=
 =?utf-8?B?dHQrQmdBRE9EWXJsKzRuaDhFRFkyMS9hNkhzNTZLeE5JZnp0dVIxOWVIRUFu?=
 =?utf-8?B?SWM3eisxVHFoWHVkcHo3RXJDcnhYaHFXZXlxSWdscmpTT1QvWWozQkI1M1dJ?=
 =?utf-8?B?blJiTlIwU28vajB0UCt3azcwMGZJYzkrakoveHhwcFlIYzFIUjlVNTZpVG9t?=
 =?utf-8?B?bU05OVc5U2xIR08vV2tISW5UVW02SnZvc09yc2FVZXZwRkdVWWQ5TjFrTFJQ?=
 =?utf-8?B?Z242SEEvWHFBSm1JWnpzd2drQi9DOXdJWlVZRnkvd0NNR2wxdFV5Nk9JWmR1?=
 =?utf-8?B?bi9vWkt4QlNra3BQOGlRVGpIVUFuTUQ1dFV4eTVlZEFzd2RYL0ZaRDJsSkxa?=
 =?utf-8?B?WXUwbWhjcm9RSFFZZkIzckpWNkR3bXRVQ0VWVDVIQjJ0UzdLVHdSdEg5Vmll?=
 =?utf-8?B?cTZhaU5CalpxbjlkRkNBTTRBcGFEZEhYME9sMnA0aSt0ZDFpWmgwL2d3ekpv?=
 =?utf-8?B?ODVIYWhPRWZiQVdtRHJVNURVdEh1dmRmZHBvR0tiVjcwUmtwYzZyNzNnV1o4?=
 =?utf-8?B?anhSZVQzRWJIb05uUFVzWXhhZDNnaWkxZkJQRGhiRTNtbjllLzVPbEFKNERR?=
 =?utf-8?B?SFBPMlc0dWZZUmlKcm5GVU5YdnlWWEFZZDNIQ3dKeVk3ZFBnRlY0MlhwMU9h?=
 =?utf-8?B?b3RjWVBIbEhMVnZscFd5UzI0SkpGQzZINDhjdmd5KzJ6N3doYk5oSmZxWUs0?=
 =?utf-8?B?WTZ4ZHpFUEFHKzRqQzBTRnhza2JjcGJOZmR1NjF3RTAyUDhidjFlYTI0T2Zm?=
 =?utf-8?B?VFkxdG0zWTJTUnhiaXV4VkcyZ2hmVHNWc1g3bmszbStWK2ZUd2lFUVdMeGs1?=
 =?utf-8?B?NjdEYnU0MStqaElmeVJyV1ZIYmVHc0FFTUFidk1TQ0xHekJYZU1mbElHWDBJ?=
 =?utf-8?B?dVNYRUxULzkxcTVxUzMwN0R6UGR6S055YjlITU9YTTFKemRnaEJKbnQ0VjlX?=
 =?utf-8?B?Z3Bab29WRkFWRElKWk8yTUM3d3VwUWcwMFQ0WlpkV1JBUjhIeTFnRVN2emdy?=
 =?utf-8?B?UlErUzVQbElUR3p5cmtrdCtRSERDZmREa2hhTUlHaktFQnBtL2tIRU8yK1Fv?=
 =?utf-8?B?Zm90L0NsVFNCNVU1ZWFLNE4wMDA3VzBRMDNVZ3RvSkpnYVFEZCtQQWpxUUJU?=
 =?utf-8?Q?TtFKvt1H?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b630cd-4280-41f6-b525-08d8c2d57867
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 15:08:57.9088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPjCSElMbe8T6Ci+PlCobNz9FwBg+K1vXPpruD38s7XCJOByAdGOFkK45gxH+JB8cP5ymHpzc76M9MzDIhMoJC11mCGWUvihyMYFjPsZVRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3478
Content-Type: multipart/alternative;
 boundary="------------E19343C5B77B3A6512A3DC09"
Content-Language: en-US

--------------E19343C5B77B3A6512A3DC09
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-25 4:30 a.m., Leon Anavi wrote:
> - Rename CHANGELOG.md to CHANGELOG.rst and include in docs
> - Fix from_jwk() for all algorithms
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pyjwt_2.0.0.bb => python3-pyjwt_2.0.1.bb}   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pyjwt_2.0.0.bb => python3-pyjwt_2.0.1.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb
> index aa6531ea3..ed52da4d4 100644
> --- a/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
>   
> -SRC_URI[sha256sum] = "7a2b271c6dac2fda9e0c33d176c4253faba2c6c6b3a99c7f28a32c3c97522779"
> +SRC_URI[sha256sum] = "a5c70a06e1f33d81ef25eecd50d50bd30e34de1ca8b2b9fa3fe0daaabcf69bf7"
>   
>   PYPI_PACKAGE = "PyJWT"
>   inherit pypi setuptools3
>
> 
>

--------------E19343C5B77B3A6512A3DC09
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-25 4:30 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210125093035.6177-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Rename CHANGELOG.md to CHANGELOG.rst and include in docs
- Fix from_jwk() for all algorithms

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210125093035.6177-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pyjwt_2.0.0.bb =&gt; python3-pyjwt_2.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.0.0.bb =&gt; python3-pyjwt_2.0.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb
index aa6531ea3..ed52da4d4 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/jpadilla/pyjwt">&quot;http://github.com/jpadilla/pyjwt&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c">&quot;file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c&quot;</a>
 
-SRC_URI[sha256sum] = &quot;7a2b271c6dac2fda9e0c33d176c4253faba2c6c6b3a99c7f28a32c3c97522779&quot;
+SRC_URI[sha256sum] = &quot;a5c70a06e1f33d81ef25eecd50d50bd30e34de1ca8b2b9fa3fe0daaabcf69bf7&quot;
 
 PYPI_PACKAGE = &quot;PyJWT&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E19343C5B77B3A6512A3DC09--
