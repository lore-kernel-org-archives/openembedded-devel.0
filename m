Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.71])
 by mx.groups.io with SMTP id smtpd.web12.11316.1610468015673514940
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ntevFYfo;
 spf=pass (domain: windriver.com, ip: 40.107.243.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lptDZVk/a79hvPblPOSV2rlYx+VobZcXzqktx6LvfMXjDHSwdwHAL0j9hdIVL6NJajRGju2I+GaBBKn1VRx9Pv5z78NqZSGBQHkjSjRbyGyZgHzaCU1Tinv/YTt29DCu+2AELyGP34E1Wx2BhDTMcmravSFvAWZY3LB47zRzrAGBscdJNKVsEsQgzE4s2rWB9zGqMoW6r0Ve/YIuRm4ec4fEAwuxDBhtHMRieYyzNIWX8PWBYX76vKjAYqSmHrJTBGJzvpaO5RLF8CPzyjibczJ6a9FInHG+C1iliEa+RTtNKFoP4V/aW0MBHdJ4cPWBY7bE5NoIXZfZx7pOp6o4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRUhOMCmNMXlValEuoZyqBFs+J7b09tkojK++mXGXsQ=;
 b=ktFZFEDBK0SFdgcwWG81Ux1PDPbNpZUYxnpwdHemglMrsKC0aSAEZlXWQPhcMbHn0rjJolmJH6cOiLuKDz26VH9cLHA/h++s5IG2s0vFgZuEFxlmqYw4cG+yMM0QWB89dWfRzuVcd+3R89/PGAuwIbVZUyzdw6WRS1DL3p8APE5Z7udIX38SAAk4tC+C7YW8z+f6/29DgAoovGxe7FbnYOkuspODxC+IDK6WCKwqtSdJlDRFVyqbMLFww7jXtivCpGAH5dVLQ5zb/kVpmAZanD04sNx3fuPozz83I3ar426vwK8INIj0bpjiYdlACm6WVwBDQQq1oeAHVQlrcQ6Uhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRUhOMCmNMXlValEuoZyqBFs+J7b09tkojK++mXGXsQ=;
 b=ntevFYforTatuRDYpcci/rwtJj4eynjRMJk+WTCgSu4QfdGjrklNUktzOcY8cTjoPb/HwKL8CSonI469NiLe2ICbheVVLb8SO7D/vcKBpsp1luRGhuMPeQ8wY+v0bPWzfJ1V6DctMpqjjXNths6H8+T5MMjmYirHbY6xeZ4rzz4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 16:13:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:13:34 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-hyperlink: Upgrade 20.0.1 -> 21.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
 <20210111152512.23506-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <78d1ef93-2eb6-1634-2822-66d2e20d8d40@windriver.com>
Date: Tue, 12 Jan 2021 11:13:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210111152512.23506-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:208:fc::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR02CA0011.namprd02.prod.outlook.com (2603:10b6:208:fc::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 16:13:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbd2cc75-8744-42a0-610e-08d8b7150316
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2807B19D48CCE106A38F03D89FAA0@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I51BV63Xre2TejEOYZuniqxBR892FYOuf90VNvyvc/KO5rMyeWoX0KnVWEhucmkTdVekqJp6Wxs0b07LQ3I6d7EdGQIK7rHsU8ye+Cpcf+IISveMKBxFyVSsmTiMedIK5++3Op5xc6StuTJn/qcRi/rhEBF65xMxTt6r5f1sdwuur4ruRSIWVtINZ5Bpxr4EsWBv3beegJ+2dof/iO7wo7OVELMItTEufkZ8XhPT++QiSCU2Z1RXuT8BQUI0B8ZvOuI4JqNd+shHksBcz2xXb9TUUEXWYLIutEiGTGZwHFL3aYSInxaY1oHQw2rwmKXsl8flUL6W5IcW+1hSMo0297j+N40q4b3UBPALYM0W24wD5/q7I1wdlfG5fuYqaG+zey9MAntwAY7bh7yaGL6HDGY0MOXjYaBWPYQa88cQDhOU3bPBasYcvVpiqFUAHGVUFCoDgm+ZxQ0/htWM9MIUJHGWFzzYZSC8HGmhN0QdWeAV4hiZ/wBlIRs79P26ny2htfI6uKQ8VnlvRcKm0B93Tdcl/kZzKdJBHhyJeEq+KwO+Cb46pZEqDvpBFWRD28H6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(966005)(2616005)(8676002)(6486002)(66556008)(316002)(16576012)(186003)(52116002)(956004)(8936002)(2906002)(26005)(44832011)(5660300002)(31686004)(86362001)(31696002)(166002)(66946007)(83380400001)(16526019)(36756003)(53546011)(66476007)(33964004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eWNNL2s0RGhaTXkwNytSbjE4bC9oUzBrLzNRNU9XTlo2WXVIV004UmhvS3ZM?=
 =?utf-8?B?eFhFWEdTekFjUU5kc1ltZ1F5MEtSdmZuNHUyTnhOM2ZjSzJHTjZQQVlGdzlB?=
 =?utf-8?B?dEFjMG1MTnZiVWNydmJMRGlIRXA3dTR6c1pwVzduQ1krZ0llTGRrZUFBOFZM?=
 =?utf-8?B?eXFnUXZhVEZoZkJxbVB5azFZaVY3Qk0za0hza1JLUjMySzdSditCUEphUXht?=
 =?utf-8?B?SjNrSFZzYkxzNlpDUFZkY0pBL3E3Yy92a2RoQkRuK0doL2sxSVNiTFhiSlpu?=
 =?utf-8?B?Uk81Zm5jWXVKTmp5a01YSnNBNVh2ZHZIbnF5clBsZmk5M1REUlY3M0xvZHBP?=
 =?utf-8?B?eTdKUmNGSG4yenN3Q0RmRHpqK2oraGUwc3FPZHJkbUhKcjZMMVRBcjB4SzFo?=
 =?utf-8?B?MjhMVy90RjU5WHVGVlhCeFllUEtGc2d2R0NYeSsvM21lVEhWOElsVDdYaWVZ?=
 =?utf-8?B?TEVnZmR2RlJ0SkQ2bEd4UUdtamtENFJ2NjgzaFRoOXF0SHUvMzd0cktMOUFr?=
 =?utf-8?B?U1NRK3hQTmlFdXcwS2QzaEpzcEVXcFRjUXNMc3JXQ1hhRzlVM2o5MVo1TTkz?=
 =?utf-8?B?bUxmeWYzanQ1Y045WXFuVnNkbWpFcFNudUVKL2Y2a0tNb094b0tpT2NRWXRz?=
 =?utf-8?B?WXZqUm01dno2c2pIZ2x4NHRrWUdrMlo5RDkxb2hOYVJBL0xnaUFKcTdpNzZj?=
 =?utf-8?B?dkNEb1RHdW9oVlBZd1Q0eGNGWWh0VmFTUmdmWjdtM0RRcThtMTZJT2VPK1Rk?=
 =?utf-8?B?aWU1cmYyQlhnOGxHZUUzMXlJYWU2RFdkaGNROEFTMGtzZlpsUVRPTW1FWi9H?=
 =?utf-8?B?SDFtZVljVFlFY3RGRXE1SW4wK21IRXI5NnlQOG80SHZKUFl1NmxvUlZHc2FY?=
 =?utf-8?B?TSsveGh4Um53MFoyempXVTYwZTZJVytrTzMwdXZSZVo4NkQwUlM0eGRlODBZ?=
 =?utf-8?B?TThycGVqcmxHYldXZWlXVVJpNTFpRFZFdjlJZzhBaVIvVXZwaU5JR0FEa3U3?=
 =?utf-8?B?M0drYUVZTFBDbGJsTTZzZ0JtTUVIS0Q2UWwwWUM0K3pldmliVkZFUXp5N2Rz?=
 =?utf-8?B?ci9tQlNObGV4WUtjVmM2N2xWYkxiOEQ2WlBRbDR0QlhGYVQvaVFYOWhVQlpQ?=
 =?utf-8?B?S3J1VVdreEFaeTE3QTg1VkZHUlhuWkhSc0czdm55cG0wblJtQ1ZzbTdrTjZC?=
 =?utf-8?B?UWFnMTVueG5JVW01QjdiTVVRaHlXanJhekVSSUV6SEVsYWc3eXRvNmVtblF0?=
 =?utf-8?B?cjd3OHJiUkdpenJmMUFTU2tMeDdwU21GRkEwRVYrL3lWWU5xQ0Z4S011ekpL?=
 =?utf-8?Q?ycmsyodwnlIlJd2b1qyjLb9i17t9fDwIHl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:13:34.5550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd2cc75-8744-42a0-610e-08d8b7150316
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: prM8sp8wvMRlrLCApkF2b8gpA/mm21AYZjHTSPIj5plytqTjLYXXK1wt7DpYQKHLseufeo/nwDeZ0t1R2KIeeab0nblHyapOzATeSO4NicY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------B91B70BEBCBED75FD7B410A6"
Content-Language: en-US

--------------B91B70BEBCBED75FD7B410A6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-11 10:25 a.m., Leon Anavi wrote:
> - Update plus sign (+) handling to work with/like HTML form
>    encoding (POST) by default, fixes #129, and associated
>    roundtripping
> - Package IDNA tables
> - Long overdue dependency bumps
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-hyperlink_20.0.1.bb => python3-hyperlink_21.0.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-hyperlink_20.0.1.bb => python3-hyperlink_21.0.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
> index c9e281504..5a8791dfb 100644
> --- a/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/python-hyper/hyperlink"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=6dc5b4bd3d02faedf08461621aa2aeca"
>   
> -SRC_URI[sha256sum] = "47fcc7cd339c6cb2444463ec3277bdcfe142c8b1daf2160bdd52248deec815af"
> -SRC_URI[md5sum] = "d7983e3d2625e5f7dffc8d12da8803ab"
> +SRC_URI[sha256sum] = "427af957daa58bc909471c6c40f74c5450fa123dd093fc53efd2e91d2705a56b"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------B91B70BEBCBED75FD7B410A6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-11 10:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210111152512.23506-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Update plus sign (+) handling to work with/like HTML form
  encoding (POST) by default, fixes #129, and associated
  roundtripping
- Package IDNA tables
- Long overdue dependency bumps

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210111152512.23506-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-hyperlink_20.0.1.bb =&gt; python3-hyperlink_21.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-hyperlink_20.0.1.bb =&gt; python3-hyperlink_21.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
rename to meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
index c9e281504..5a8791dfb 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/hyperlink">&quot;https://github.com/python-hyper/hyperlink&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6dc5b4bd3d02faedf08461621aa2aeca">&quot;file://LICENSE;md5=6dc5b4bd3d02faedf08461621aa2aeca&quot;</a>
 
-SRC_URI[sha256sum] = &quot;47fcc7cd339c6cb2444463ec3277bdcfe142c8b1daf2160bdd52248deec815af&quot;
-SRC_URI[md5sum] = &quot;d7983e3d2625e5f7dffc8d12da8803ab&quot;
+SRC_URI[sha256sum] = &quot;427af957daa58bc909471c6c40f74c5450fa123dd093fc53efd2e91d2705a56b&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B91B70BEBCBED75FD7B410A6--
