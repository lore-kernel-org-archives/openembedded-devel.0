Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.50])
 by mx.groups.io with SMTP id smtpd.web10.27691.1611149679734533700
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=J+atN8HW;
 spf=pass (domain: windriver.com, ip: 40.107.223.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsgeLJPMRU+a3NREKCTr4Zhcn06aYbAKqId3PWp6MU7AXNSsXzEKRgahu4ah45kxnXOx6S0UKu4UVvGV92u6YDxfREM0/p9gAkdcYR1kNKNDfaMOjsgpUhf0C4+tLb4RARinFH/qw9ntDpQmmNNy27deRlpsrYGuVmzFiAo3Has2PxBBFxlb/W/CVgp516RmN7GrADZ6a/8yAj1UDHV96+r5Ad+lQtCoKkNtq4xK4rnVCPs5l5IhrTuLYRUrVdPBXGEk3GRCu5M94w5Pqtp+pUy7kusEWi1Tk3swXz6GSgUucngbfEQEyXZQEf96FCavDE3Fr10RAqaastzqtS50HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liB1osTmzXC7GX4yLsPBR/OzcFjlW61srQ/cZetrKuc=;
 b=YVI3zYbO418yu/Sh2ijQhlnH3mQUJhs3+f+q3gEbKqNM3M0EUy73RPkfs+Q9fO62bWh75LNGzEBsr5kWD4zgI8k4m4NMTc3hliOW4Uu4iI8DkLYeIzZrwDGceMdrcn8RPiuZgaLUxzbvJo4C815kXX3WHfoio95/aT/dwVjRCYkROehpEKRYFBlrQWxyyAYuo5/z/0bRkJ32vHAlZzWx3YI0mQJtmfLxr6hMhDWs2QU+MQkafcZwYCieNGxErWXKVAWgyOh9a6TqRkVabaBTvQYataPbbtrCfrIYzAqSUYRMULDxb+m+uR3mkvwxDpjKG3GePExiF7RQ2fEXPRRtUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liB1osTmzXC7GX4yLsPBR/OzcFjlW61srQ/cZetrKuc=;
 b=J+atN8HWpcYz91BWJN5nDUnJg4fj8Iw3C/ULo30KmE5yVnK6Hh/E1pT6MkMfCtBE6CZPSJlL2mpD9nbzLHZuhAoxfuPx62PFenyfBrStOxsH5tQkJOGXfwzWv/eHUTNhKFyZ3e7nqH6huDVkOF5ZeejzKMfyNPslTTKGRjqyLeU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3558.namprd11.prod.outlook.com (2603:10b6:a03:b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 13:34:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:34:38 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-pyperf: Upgrade 2.0.0 -> 2.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
 <20210119173746.24694-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <341a7fa2-a838-e067-5495-d2e3793942fe@windriver.com>
Date: Wed, 20 Jan 2021 08:34:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210119173746.24694-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR14CA0017.namprd14.prod.outlook.com
 (2603:10b6:610:60::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR14CA0017.namprd14.prod.outlook.com (2603:10b6:610:60::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Wed, 20 Jan 2021 13:34:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44b40997-4055-4044-8c47-08d8bd48224f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3558:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3558AAFB7411C7700876AC279FA20@BYAPR11MB3558.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qWOVtw8M0KeBHqj4BuG/En9xfL0JTIb0aaYd/FihMx1dTtksVeIwdn5gqLUrrPMPMCXFkTeMIoKla50icaKAhv+/RJ6a5ZwD+E/bwZIp3KtoNOF6LgBL+POWZWDzd3BH/P38njtUEo8NWLwZtiHNAXoRWlh2C3ljxc8b41MoP7RfihK6dTnNe6Cdl7zJTPZRrVfnvNWRc3RNpWUwDAQa+jD56ZUl5Rimcx+sV5D1HgCjbBHwYaaV0QWwXvLAUoQ53Za8HPabL7B8AjeDZhNOzEmdnrsgJ1/d65RYNLsAha5Re6bV7W/OnKJ+C95BLvB3fYus4gR7CcbyehKflj6HIoVzXFLbu0WDeC+SjfKV60MwLeLNtnzXqQFNzxSUCwskiyxZF1dnh0siStWBwO/3990PrMkt9/5p/ir7PlA5cJBavIX+fkL0TL2p9vbqZMVoIIf3XlkAwkugGjbaFqDf7nArAHGTZnQMuecUHe1fNh/oIz06EIypXxj3vFAp6tfi2lAkn4K51d1Y+L0M+ra5L8ZnUAX6vIbgiAurkgzWniPNhUx9R0+Kdy27sGVXdoOixn8f2dl/ex1FiHmcG+UgLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(66946007)(31696002)(36756003)(2616005)(44832011)(66476007)(86362001)(6486002)(478600001)(83380400001)(31686004)(966005)(26005)(8936002)(186003)(5660300002)(66556008)(16576012)(16526019)(166002)(33964004)(2906002)(52116002)(53546011)(8676002)(956004)(316002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aUwrQ2U4RkQ4bjhqdEFMS1FrZGN1VDM1WW1hTkNRdXI0V21vK0NwWGJacWFp?=
 =?utf-8?B?RTMrRVoySWQvT2c1M0tvbUkyZ213SGwxbE5TOHpxRFRFSjFkcnA4ZUNTUWc2?=
 =?utf-8?B?b09LWnpqTERHTG42TGRUc3RmMGNqS0hQZ0ZVdFBhUTZzOGxCRTBvQVBlNlVS?=
 =?utf-8?B?YkNZOENPMU51OEhTMkRMMHcwVFJvalZyRFZKUUxna2hSL1BEaVJjT1REZC9a?=
 =?utf-8?B?ODFrS29CQ2xXTlZLcmZybllzaTNVN0VwNjFtQS92dis4bXFWV0EvU3lpZExK?=
 =?utf-8?B?alBGMUhYbFZDazFFUzUrUXd3MEVyVTBES0oycC85Q2lpbWRoYSs5cXNYa1ZU?=
 =?utf-8?B?U1JWYThOaGwrMXlhWDREbWVOdE9iRGxzV0xTaUdKWEpya2YzeUhFOU9jbXA3?=
 =?utf-8?B?NG44ODRxRGVKMXlZcnd0Z0QwcDRvWklxM3dINHVVS2ROZlZkbCsyejBFbkhW?=
 =?utf-8?B?czhqaUZ0TWV4VFJqN2pNb2tHRHFMWVc1YVY1K1RNUnNVclZieHVySnlBcUFn?=
 =?utf-8?B?SjJJUDRIMWtwTzg0MjM5VG1id1RJNmliZlAwNFBrdWxDTVVkYzVUb0FYVSts?=
 =?utf-8?B?WWpaZFZsbUVTUXhyaVdrekRrRmFNdUNMMFI5K2dNaG1CNUJKWnFCMTFHR0Fv?=
 =?utf-8?B?VGpFQ25vNmpwNXZVV3gzN0ZVcVBneWpaYU5PTXhNQmJ1Q040VDVOZnp2YXNu?=
 =?utf-8?B?ckZTUE1HUzRvR21CVFRMYnpxcUsyUnc1M01kazdrZkVnRlpUOG1nQm5yZ3l4?=
 =?utf-8?B?eWptaUpqaWkzTmdEd0haSS9sQnBVRDRMWklYdmZya01NNjY1M0ZzbjgwZnlM?=
 =?utf-8?B?VjJVYjgyMFpYYTN1bmM1UTY3bHdXczl4N3lZckdkSnR0aFA1RGQ5dzR2WWti?=
 =?utf-8?B?K1dOTE9LcWEzMEUvc1l4UWdlejZCcmRVejN5Zm5pdGpTaUdBS0I4dGJJWmRW?=
 =?utf-8?B?WEtlck5SYjIzcU41emF0Q2Jta3ptQ05PaFYxOGVsb3RqVHVNL0lrdVFpelo5?=
 =?utf-8?B?S0R5Ujh2SlQxZnpKeEFoV1NEaHVHU0ZvRXE2eXhsWTB3UlAwUDhVNGwwRTJv?=
 =?utf-8?B?VHY5a0FqMUczZTluOTFqQ0NiZE5WL2REUmhrNEliZHZaSGdYdGlmNi9TVDcy?=
 =?utf-8?B?VEVMMDhBZG5HN2VKaW5MNElIVEV3Q0lpSW80bDQ0Y2h1YXNFTXE4dmJ4NFNn?=
 =?utf-8?B?RzFYRGRGWWZXbXdFZ0RKblBTbit0S3RxNFpwb0orZEhldWx1WnJENmt5L2VQ?=
 =?utf-8?B?bU54VW1xZmZSZ1BOSzhzTGptMHpxUjhBeEFpdGs1NVdEY015aDhaY2pZb3Q1?=
 =?utf-8?Q?o1qhamOB1emzGnI8j1VFjPDMP+wknlSMnx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b40997-4055-4044-8c47-08d8bd48224f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:34:38.5877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3kSSalm2AGk+BSp/DV4kplRzynagde9D9J2XPLxRE4oTJuxgv6J0+CKszX8/kkkPdiW74lvxvM+6yXWFDWQqUfD2inAA3TNdlUPNO/76B4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3558
Content-Type: multipart/alternative;
 boundary="------------60C2DBD555839AFC0436D2DA"
Content-Language: en-US

--------------60C2DBD555839AFC0436D2DA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 12:37 p.m., Leon Anavi wrote:
> - The compare_to command now computes the geometric mean.
> - The compare_to command no longer displays percentages: display
>    less numbers to make the output easier to read. Also, percentage
>    were almost the same values than the xxx faster or xxx slower
>    values, but rounded differenly which introduced confusion.
> - Project moved to https://github.com/psf/pyperf/
> - system command now only emits a warning rather than failing with
>    a hard error if it fails to get or set the frequency of a CPU.
> - The pyperf project is now covered by the PSF Code of Conduct.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyperf_2.0.0.bb => python3-pyperf_2.1.0.bb}       | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyperf_2.0.0.bb => python3-pyperf_2.1.0.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb
> index 7ced7d017..b57ea16eb 100644
> --- a/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb
> @@ -13,8 +13,7 @@ Features: \
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
>   
> -SRC_URI[md5sum] = "7f62d3f6fc5475138791d3d883fdf4cd"
> -SRC_URI[sha256sum] = "2189fbc4af08d519f85468e70e32c902eab0f1341b2c41028b94b2832d3169a7"
> +SRC_URI[sha256sum] = "1257d673d89fdcdbaec8077afeb365e7a94739c1b263572b09403cac25708ad3"
>   
>   DEPENDS += "${PYTHON_PN}-six-native"
>   
>
> 
>

--------------60C2DBD555839AFC0436D2DA
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
    <blockquote type="cite" cite="mid:20210119173746.24694-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- The compare_to command now computes the geometric mean.
- The compare_to command no longer displays percentages: display
  less numbers to make the output easier to read. Also, percentage
  were almost the same values than the xxx faster or xxx slower
  values, but rounded differenly which introduced confusion.
- Project moved to <a class="moz-txt-link-freetext" href="https://github.com/psf/pyperf/">https://github.com/psf/pyperf/</a>
- system command now only emits a warning rather than failing with
  a hard error if it fails to get or set the frequency of a CPU.
- The pyperf project is now covered by the PSF Code of Conduct.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210119173746.24694-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyperf_2.0.0.bb =&gt; python3-pyperf_2.1.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.0.0.bb =&gt; python3-pyperf_2.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb
index 7ced7d017..b57ea16eb 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb
@@ -13,8 +13,7 @@ Features: \
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8">&quot;file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8&quot;</a>
 
-SRC_URI[md5sum] = &quot;7f62d3f6fc5475138791d3d883fdf4cd&quot;
-SRC_URI[sha256sum] = &quot;2189fbc4af08d519f85468e70e32c902eab0f1341b2c41028b94b2832d3169a7&quot;
+SRC_URI[sha256sum] = &quot;1257d673d89fdcdbaec8077afeb365e7a94739c1b263572b09403cac25708ad3&quot;
 
 DEPENDS += &quot;${PYTHON_PN}-six-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------60C2DBD555839AFC0436D2DA--
