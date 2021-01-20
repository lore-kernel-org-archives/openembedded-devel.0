Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.53])
 by mx.groups.io with SMTP id smtpd.web12.27819.1611149666440333227
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oVh3r6Sq;
 spf=pass (domain: windriver.com, ip: 40.107.223.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoMaIgAFNI2Fg6XDVRxc/lrDsYIjC89EFUU17okbW+K2xDO8PN9RpBm/vIVzyGlyFUNjJZgFbN1DW9AnPCP5iL1Sw+6TZ9PeCxWylkqUfJQJWyYAX426xKJa4sDlb6J+g9g5ej72ZCMrEBqtD/ejYIfD9gMAcTeZjmh3xoQYb8zjG1gS/a3S/v05SfQW6Uhsf2DrdMMFVTgAt2k5bAOKD1DkxJuLEt+Nes2v0eBsTu5EkKUBlv8NjaYGB9aBy3Y8JErf6ydSSeYIUikrcy5JmlS5X6xo6gJFkEtg0lu/ABWBJBuJlUHJEqmfQNx+BZPx9jDbmrcujmKg4PShgmWooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uT021ggzVr9rvGaCkCbDuGp2xtxPf++rcNwWFN6a6Bo=;
 b=JyppkD/IfOajdYL1OcftbjGTCi2HYqbij5cE1jYEqponQF9ygM1xVYaBq3N1Ffx2Mv1O7XkvCCiej+s6uR7r+gm3+UE55oWr4DRPB6fdGqsgcKQlKvQPWGYIAyYhJGiLpIqnYbR1yEd+njgr4jRe2QoL0UPy0neSnQN2dfVHunyO2FJ7rTWG4+32T5CRUnvBhyj+TCiWrw/Mt2wHX31Vfec7YZ1CcdxbL3Z+KKiSOL7AtBXf1IUher0EznWPg6hE4brlLEwnGHuc32/5ruSvS7jKvOiQhkQyvGngfumt2DLK+RxedZ8IyWzLNRh2p4bFPuKIEtGhkD257KBLO1PUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uT021ggzVr9rvGaCkCbDuGp2xtxPf++rcNwWFN6a6Bo=;
 b=oVh3r6SqFsnyLzs9GowQRLf+0fomo2CQWWo44UdhNpC7E/MTxtsgt9RV+WHxjHWXlMhle4k/1BeXU1dJsD5aRmTUG+AyPNW4XY4LSs5yv4w5e3Cq2ohpDUrjWzNfM83XIYoKnCxXeLaeZ08Z22YJ57Wq3cj7pxm/lj4JiFpwye4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3558.namprd11.prod.outlook.com (2603:10b6:a03:b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 13:34:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:34:25 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-pyephem: Upgrade 3.7.7.0 -> 3.7.7.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
 <20210119173746.24694-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6075af32-ae34-449b-f737-a42393b49cf4@windriver.com>
Date: Wed, 20 Jan 2021 08:34:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210119173746.24694-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR14CA0001.namprd14.prod.outlook.com
 (2603:10b6:610:60::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR14CA0001.namprd14.prod.outlook.com (2603:10b6:610:60::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 13:34:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ebe0461-f3b7-4770-ab38-08d8bd481a6d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3558:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3558DB7F97C60ACF8B5AC57E9FA20@BYAPR11MB3558.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HkOP6laXwH9nvmRaqjs7NUsRPfWOBi0fFyrtqnbN4i84++YotTyKRaNgdlddvQrEuM9SqKvULGNoigs5be0tuLwLvNDbg6JZC4LuhyTcibJ2UhBmO+TQ4UDIebTjLH9sY+spH3GXEoWZS83sMyZE2aulZwmPomLMBgBkU2DQYA9AsAq45MSa8tAM9WiwvSN/Tm7/cqgzJP+YXFjen8DdMvPgOulGjNBFuuVg3p/EckGzJ50Lqiu8RwJuWPUgXzjjgdIFtxTWByv+mw6LaqngGt7fMICX56s7ELi/ei855afFyBnrsic3uIxqwCBi1obHvWGE3CnPaIDZ78CnEjOCL7YL1s/Oal2sqn8/8fcl9OKp6ZKJCCgpfXVuwGR5rRPXhiwpey7xqtqtWjjNJ9R0dE8dK+ovhcCAMplBTbhV328nR8xwExYRG+NlmIcwNDYIzh3FPrSLm9lsyMk5bMlEsGJtB4OEcZweKKVkJHs/bqSJzrhX+CXwhMdaruyXbAaE7CS3Y7mllDRTCMy7QT20xCqrX4wyQTQsFaL3t2F8QUUVX/4XADKZTac9usk+zat/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(66946007)(31696002)(36756003)(2616005)(44832011)(66476007)(86362001)(6486002)(478600001)(83380400001)(31686004)(966005)(26005)(8936002)(186003)(5660300002)(66556008)(16576012)(16526019)(166002)(33964004)(2906002)(52116002)(53546011)(8676002)(956004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RUg1Z3RlOXByeThPZGQwUjR0QTh5TXVFTVh6c0h0dVE0UHUvRVBSYklscGtO?=
 =?utf-8?B?aHRDUk5BOFhrL1ppVExQNERDLzAvNWV4T1lzT3lVTERrMzV1RkVQaUZabGVp?=
 =?utf-8?B?enBCQjlabTR1eEpkTDZ5dnZXT21zSTRNTDgrZm1tOXFPaERDaGkrVmE0d0hx?=
 =?utf-8?B?d1lHWTZINXhtSVBZUFdWejd5ejFrQkZqb0xqMkJSUU96M0p6cG9XQ1FDNkpt?=
 =?utf-8?B?ZnlRRmx2TUhlazBEbmlXRnZoQVQ2dFNGOWJUT0pTNXZNaGZ3UGRIaGdseUtj?=
 =?utf-8?B?cTNsSUpCUXhYMjhMeVhrNVJTaXkyMnRVaW9ISGl0WHI1UEpZOVp0bmpiSTB0?=
 =?utf-8?B?eVBLcjNxSUNzY2dYY1FMOEVTQ255czBqOGZqUXhlNFhsWTQyTmJqNS84K0t4?=
 =?utf-8?B?cDdzTldRTEZhM3dHWDNXUy9Ba085UmZPSFNQbUhrM1JCVm9EVFBFS05SNFhL?=
 =?utf-8?B?WG9MZGZub1hMQXJUV3dFNWRZWWlnRnJjbEhiajl0eUw1TXgrcHNYbitmNnR0?=
 =?utf-8?B?T1NodHRqajdDRXVWdTRiTWdXRkRDeUpKNmd5S0tlRnkyRWVYUUtZMnFHd1p3?=
 =?utf-8?B?NHgrTWdNTi9mbmluSjV1cDdqM1A0Q0dlRDZDWkZpYU9mQmZ0Ty80R1NKL3NV?=
 =?utf-8?B?bTQzNkU0OE5qUzlyYm5HdVF6US8xMk1INUlhLzdFcjJ2d3NBNUdUTThRdlNk?=
 =?utf-8?B?Y3hGOVVYUzFneC8wNXlmRWVjSWxVMHBFZnJldk5UU3dmMkIxcVVNenVXU0d0?=
 =?utf-8?B?eUJzdmt0RTNraWZadVNRYk1yelpGMVRJZHZwZG1zZE5QTjRaRVQra2ZBamc5?=
 =?utf-8?B?WkliR0hNV280VXBrQ04vZit3RUkwdFlvcUk1OGVuSklxL0M5T1hDMFJrbTJv?=
 =?utf-8?B?VGE0RGJHajY0UGx5MjM3VmJsZjdWUzlIckZ2aG8xQVdpZk1nUUVPck5GZ2ZN?=
 =?utf-8?B?TjFoOWVLQ1VPNzJOKzAwUWJGYlpvdmZwREV1ZEVWYkx5USsvVkk0WUlHOEtt?=
 =?utf-8?B?Mm4vQWlXQUdpaFcvNlBWeHhnV0xXS0RpZmduUlZmbnRwc25ldld1V3g0UUtP?=
 =?utf-8?B?YzJMcDNUOXdZZzFtcmZRc0NZbDM2SGd5cnVUWXByVWUvYUs1T2hNMGRZNnBU?=
 =?utf-8?B?VnFsTTRIUVRBcTBqYmRBMUJHcFJnK0RGVTFWY3g1UUNwb2grVmVJWEZMeHJw?=
 =?utf-8?B?L1lUNkJZcmJwNWczVDRINUZDaHFZRkR1RmRxUXVPNEo5K0ZUSWFScXRTNlpv?=
 =?utf-8?B?OWIyelo4YzNMYnJnSzN3VktUclR2TU1GRlRKWjRZRzBpcCtzNFdhTlZnOVYr?=
 =?utf-8?Q?YgG/4ls4lGvZv0JYxs29hzFXplbCxiZ1zT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebe0461-f3b7-4770-ab38-08d8bd481a6d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:34:25.3723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OklsAvRwJB0f+1Um9oK5NZfcc7qxb0juMIelPK8ydr2J24Lqh56OZKevAh4JTCcd0FcYZIK82T0VOgKx4eo6dfKdjW3Qaxb/zdpX+lqa9Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3558
Content-Type: multipart/alternative;
 boundary="------------71EE6848D0235F7FF4ECB630"
Content-Language: en-US

--------------71EE6848D0235F7FF4ECB630
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 12:37 p.m., Leon Anavi wrote:
> - Fixed a memory leak in readdb()
> - Fixed the Body.copy() method to correctly copy object-specific
>    fields across to the new object, like Saturn ring tilt and Earth
>    satellite catalog number
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyephem_3.7.7.0.bb => python3-pyephem_3.7.7.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_3.7.7.0.bb => python3-pyephem_3.7.7.1.bb} (69%)
>
> diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
> similarity index 69%
> rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb
> rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
> index 38b3c0a4f..5949a55fa 100644
> --- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb
> +++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
> @@ -4,8 +4,7 @@ HOMEPAGE = "http://rhodesmill.org/pyephem/"
>   LICENSE = "LGPL-3.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=f288303760f6e5ceaafe3aaa32186ab1"
>   
> -SRC_URI[md5sum] = "46c035b4a903ff26e0d8ad0f1fe6cc35"
> -SRC_URI[sha256sum] = "607148429f85412915e32265779c0cf6d09f73aa97cf1ff0d101ac22c69c4436"
> +SRC_URI[sha256sum] = "36b51a8dc7cfdeb456dd6b8ab811accab8341b2d562ee3c6f4c86f6d3dbb984e"
>   
>   PYPI_PACKAGE = "ephem"
>   
>
> 
>

--------------71EE6848D0235F7FF4ECB630
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-19 12:37 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210119173746.24694-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fixed a memory leak in readdb()
- Fixed the Body.copy() method to correctly copy object-specific
  fields across to the new object, like Saturn ring tilt and Earth
  satellite catalog number

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210119173746.24694-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyephem_3.7.7.0.bb =&gt; python3-pyephem_3.7.7.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_3.7.7.0.bb =&gt; python3-pyephem_3.7.7.1.bb} (69%)

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
similarity index 69%
rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
index 38b3c0a4f..5949a55fa 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.1.bb
@@ -4,8 +4,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://rhodesmill.org/pyephem/">&quot;http://rhodesmill.org/pyephem/&quot;</a>
 LICENSE = &quot;LGPL-3.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=f288303760f6e5ceaafe3aaa32186ab1">&quot;file://COPYING;md5=f288303760f6e5ceaafe3aaa32186ab1&quot;</a>
 
-SRC_URI[md5sum] = &quot;46c035b4a903ff26e0d8ad0f1fe6cc35&quot;
-SRC_URI[sha256sum] = &quot;607148429f85412915e32265779c0cf6d09f73aa97cf1ff0d101ac22c69c4436&quot;
+SRC_URI[sha256sum] = &quot;36b51a8dc7cfdeb456dd6b8ab811accab8341b2d562ee3c6f4c86f6d3dbb984e&quot;
 
 PYPI_PACKAGE = &quot;ephem&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------71EE6848D0235F7FF4ECB630--
