Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.69])
 by mx.groups.io with SMTP id smtpd.web11.7891.1614178025171875250
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kpkcWQNI;
 spf=pass (domain: windriver.com, ip: 40.107.92.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U67vFv4YO7VXTh7qXWWHPm16OLSsTSVd+6Ws+BHevZ/02+nZ8NydFPOT53Pe5jdOd2WAc5flGktin4R+oefdY6yvAAjeEr3y7gcj+5dZozGjhjzCU7bv3SYg7bwsdR2QBO01W5tMXnyVzm2XHnv27ScL/FhIczxMeg3viRMRWe+rrPO/uisSzi1bvUKVZXt/CD2OFbS0kRhsCls1ByhCcz/PzPQir3IUDw562TbN0tEHItQVA5mANAh6Adsi9T692w2mtn8hbMR+OVqwJsm5/bRyti1vTJhbC2Ph72KGWhxt7+5EN5N1EF8AL95/HWG4ZNSKnkllFFXRwwWUJreIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=polHiztlCgScYHRxi9rl0WhT1Z5Uyd4h8vq3jtMxfbw=;
 b=NHR+Wu1rBTD7ljOzv6ynioKBKAubaatJ0G1vNN1NX4M+cG31OpzVd95hHpN1QESA+Y5bejOYBxFibB8AtOmmTKvOG+dm3w5ArVaMDvNZ5zgfkrg4XEroObAmeYdcKoX5cQSM9CNa2TkzICMMtS9Bl43Z3w9ysovWRcA8BgCk6A7b7u5unLM/+QX8hIV7Eh/2fx6yE72KbyD5WLagHet/LX+AOP2G2Yd7YiEMmiQclzgpm5l7OOTfs1FSX7FpvyY0dKcR3LKjdSVWYiY/Xpy/lM+PWicBxP2jcwK3TIgXZnDYJjlRJIfs0IWNAXScSbVlOToftTUX0yB+TLjQZ9tJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=polHiztlCgScYHRxi9rl0WhT1Z5Uyd4h8vq3jtMxfbw=;
 b=kpkcWQNI69OnK58KyNy1TU8v0Y3/6wYTq/Rw8+SPxT423+qYkAmoWSXIuxdE7TQIqosDqkwiAXdU8To9xHA9xK3gfJRm4C5oe0ZkYuXPIOyBJswfYjjnhidcb32DGnuvvGhEup2ujf459G8GIp3MV9Vk/n+LuYtPYwRmxpDhsiQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Wed, 24 Feb
 2021 14:47:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:47:03 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-iso8601: Upgrade 0.1.13 -> 0.1.14
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
 <20210223152219.32129-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2418c81e-3e40-9df2-6086-318f8a1b9b71@windriver.com>
Date: Wed, 24 Feb 2021 09:47:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210223152219.32129-7-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0285.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0285.namprd13.prod.outlook.com (2603:10b6:208:2bc::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.11 via Frontend Transport; Wed, 24 Feb 2021 14:47:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d9e0db3-554a-44fc-e9ac-08d8d8d30c7c
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB426068C687F2C14E45EC4B209F9F9@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sn9NLGqpIhqaM5WeNZqw/vISA+EvkgXXjZ8U+/uQ0SBfyRv+D5qhHe0g7fxyUdir3gcRP860dVSH0TwaAmGBoC+b/1mMbUKWZ5rOGHIqfUv6P/WKZmcuT6iAtoxxxQLmYK2waY8en4hPtvS3OT8SmvCM+HEO+FG9Qv6EWjg+79YwBULw4qpCgR1Bdd72O+fAP2p6TKAo22MSyAOTi0aG723nlN3WCy925HRO3nDBS31B05XiBOLoOpzpgVwr77gNzix9bUQXFNcszNGhxHY1bp8x0L2NEWrS4yTyztln8ePUUsN+1W8G+Cf+7ys9dmfjyo7kznAwSQel4A28VdK5DRd3d8IX04H5JDd/61jLW2bKa5nSIyy/X8DBD2nU8tFIfnOoAcz+OgdeLm7hDOrfLJfzYvBjbp4BXn7TzZyB6H4aWWM/lIZG9ksMjuAEhjy5Bb+yKjfnnsOKV8Az05mraICIo2rWP/y7lN//JDjjmMPB3b4SEkeo/ntV5RIES1H0miWQDkWHeUVtM3VZHHOadjOwHVlhrCtbSq3BYHuduCUMpvuM9kFAo3gcncLmwxloRxodYi9bjmGRrt/OW1W4CA7uK8LfT7M3SODeM+/4IkP+whxDURLfgPqka2EzTc/6V2BC3PAaT8i0+5JILxg3k6fOZn6eEChhxKLeA1ZCGjji7duRvupTPSO4RXg7rQMF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(376002)(346002)(136003)(8676002)(6486002)(33964004)(8936002)(44832011)(2906002)(66476007)(966005)(36756003)(66946007)(31696002)(66556008)(31686004)(956004)(5660300002)(166002)(2616005)(53546011)(83380400001)(16576012)(316002)(16526019)(186003)(478600001)(26005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dzJFT1RCWHREaG5mOWxNcWRYTTlML3pyUnZaaUFPeEo4djdMaGJ1cGUrR3Jy?=
 =?utf-8?B?ckQ5V0w0SHpTbi9JTFBmNmd1d2g5a09MMXRhRml4N2RDV3pCbGlZTXJzTVBU?=
 =?utf-8?B?RlJJOGlRTENmZkNEVUJPOXJWcjhnZVpFRVhzQUhWK3cwQzNLNExIS2dkWW1v?=
 =?utf-8?B?ejQ2a1B3WEs4MUhGY0ZIcnZ0aWo4ejQzRWFXL0ZaMHZqS2RTZ3diL3k5c0lh?=
 =?utf-8?B?VThhRUpjRTQwQ1lKRGkvUnVUWUZtVXgrK1dDNDZaV0hXcXVrSVZGL2ZWT1Bo?=
 =?utf-8?B?SGFESlhNZUNkVWcyY1cxMUczQWtyK2Fjb29DOUxvRHMyc2daOE5aTnp5blFu?=
 =?utf-8?B?M293MkV5ZWE5d2o0RlVVS3FRV1QzcDIzZG9PeTIyUTNtczQ4b3dZTTcvdldy?=
 =?utf-8?B?Skh4Ujd3M3hpUWlJZVBsTWN0VEdhTXRNVStwelVuMVdpbGtHL0RqQUdGQzRL?=
 =?utf-8?B?a2doWkdvTTJ4aDRIZFc3ak01SXpmL2N3bkE0d21ub1VXVEVtNmJCYnpONitY?=
 =?utf-8?B?cUplWEc3cVVxME9Fc1hxTzBXd1BGMDhkelIxenRZQktiSFB4UGF2MlNjRkhr?=
 =?utf-8?B?SWwvczZ5N2NmaWRzbEdad2NNa2lnQXFWMzFocHdyWFhzL1o5ZWFnVnl5Y0sx?=
 =?utf-8?B?NG0xYmQ4Rm4zekVQb1gwZUVPTzhlOWFnVGM1UVlXekRnTFFzckwvUDJLaDh4?=
 =?utf-8?B?eEU5V3RxTVk4U1Jzd1YrOVpKUGdTL2hFckNpQmc4M3V3MHl2clNzdG5Rd3M4?=
 =?utf-8?B?dWVKMysrYVIzSFI5L1JWcUdRMTgxZkxQUVNkUHNoWm00WEVaMEQxUnJtTWxD?=
 =?utf-8?B?ZHNHQmpTdlVaNEpXUXRkY3pQOWxFbmMzY0xDWUdVSDg4WTZWZGhyRWtWYmd4?=
 =?utf-8?B?aERUWTdKNWlKODMyUHZWZC9CRVZ6OXhEM2RZZFFobWlkTHUwUmNDME1wRFZw?=
 =?utf-8?B?ckltVDNFT1BIaWxTTEg3eFlnN3JlbGZ5YnJXZUc1QlV3eFYxaFY1U3BzYUp5?=
 =?utf-8?B?TVkxdTVacUxSU1pYY08xZm5HWUc1Y1hVOWZ1Z21kYTMzeDdnZzNqQnNOS1Yy?=
 =?utf-8?B?akJyRmZhYS9HMEJ0VlZ4M1FSNTBBLzlYSVNaaGVvM1BuNTlWRTIyMStpblpX?=
 =?utf-8?B?Tmk4OWpGdk44UDEybGxjWFZuRnlvbVAyc2JRKzkzTnlVK0pLTjRvS0tXUW1n?=
 =?utf-8?B?MXUzejJPc2dzY1JBVVFFY3NPeXNlNkh1YTRJSGQzbURSMWYvdUtyTDBXMG1S?=
 =?utf-8?B?N2pWbTZsa1JnYVQ1WmRTaUZTOTNpRWZNRFdUam5PY3cyMkRnQStydDI3YmFL?=
 =?utf-8?B?Y1pmeTV5YndQV0JydXFYazlEVkV1NGRlSlIwZXhqei91VlY5YmFWbDZDb1U2?=
 =?utf-8?B?enVWTnVFZmJ3WmlWL3hwYTVhN0pzY1ROY3oxMW9QRjlZWmlFZkNoUjUvdGdB?=
 =?utf-8?B?QURIQlRXczZCZGJEY2Zhcnd5eFd1bmF2dFlJcE8rSm1Dd3ZSMmJTSG9IR1lq?=
 =?utf-8?B?SWtpNG53dWtYc1RkNWlqT01tZVF0V3l5U3ozeFJERWpnSUIyOGNHNGxEVW9I?=
 =?utf-8?B?cTlJelJoRTgzVXlmR0s5b3JPdkpHZ05FZjF5WE1NeG9mL25veGFEVVUybkpS?=
 =?utf-8?B?MHpEWEFYaE5WSk1Fdjc2L0dHcHlwYmtaRkZpTHFabW5nUU1sRDczS3p6T0pW?=
 =?utf-8?B?cXJPb1ZtNHZlTHpWL0FyWHdwTHRKWk9Wd1dJQjlYa0xiMFZ3bXNtNjFaRzdD?=
 =?utf-8?Q?Vk3Zt5DsHB23nWTIUTMkrccWRm2H82f0rTuymgb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9e0db3-554a-44fc-e9ac-08d8d8d30c7c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:47:03.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsc64XFOASJuYTRmyFCXPGnwVumJ9ciR5iPu+CIc5L0amt3KKffBiKvL80jHniudmdkGj/yWBlqfNR5wWEeTjPZHa+cSabMh7eD8Yj9psu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------D5C583EA915C48821C0CDF17"
Content-Language: en-US

--------------D5C583EA915C48821C0CDF17
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-23 10:22 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.1.14:
>
> - Add GitHub build actions for project
> - Add project URLs in setup.py
> - Update and fix README links
> - Fix handling of README in setup.py (encoding fun in 3.5, 3.6
>    and pypy3)
> - Add Python 3.9 to test matrix
> - Add type hints
> - Derive ParseError from ValueError
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-iso8601_0.1.13.bb => python3-iso8601_0.1.14.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-iso8601_0.1.13.bb => python3-iso8601_0.1.14.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
> rename to meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb
> index 9e7494b3e0..c531fcc6d8 100644
> --- a/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
> +++ b/meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "http://pyiso8601.readthedocs.org/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
>
> -SRC_URI[md5sum] = "df6e924305fd799d90be63336b2ab8b3"
> -SRC_URI[sha256sum] = "f7dec22af52025d4526be94cc1303c7d8f5379b746a3f54a8c8446384392eeb1"
> +SRC_URI[sha256sum] = "8aafd56fa0290496c5edbb13c311f78fa3a241f0853540da09d9363eae3ebd79"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------D5C583EA915C48821C0CDF17
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-23 10:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210223152219.32129-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.1.14:

- Add GitHub build actions for project
- Add project URLs in setup.py
- Update and fix README links
- Fix handling of README in setup.py (encoding fun in 3.5, 3.6
  and pypy3)
- Add Python 3.9 to test matrix
- Add type hints
- Derive ParseError from ValueError

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210223152219.32129-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-iso8601_0.1.13.bb =&gt; python3-iso8601_0.1.14.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-iso8601_0.1.13.bb =&gt; python3-iso8601_0.1.14.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
rename to meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb
index 9e7494b3e0..c531fcc6d8 100644
--- a/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
+++ b/meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pyiso8601.readthedocs.org/">&quot;http://pyiso8601.readthedocs.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844">&quot;file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844&quot;</a>

-SRC_URI[md5sum] = &quot;df6e924305fd799d90be63336b2ab8b3&quot;
-SRC_URI[sha256sum] = &quot;f7dec22af52025d4526be94cc1303c7d8f5379b746a3f54a8c8446384392eeb1&quot;
+SRC_URI[sha256sum] = &quot;8aafd56fa0290496c5edbb13c311f78fa3a241f0853540da09d9363eae3ebd79&quot;

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

--------------D5C583EA915C48821C0CDF17--
