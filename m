Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.89])
 by mx.groups.io with SMTP id smtpd.web09.35531.1611578443952137528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NZW1egqJ;
 spf=pass (domain: windriver.com, ip: 40.107.93.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbGbgAym13eitlI6YU46qlvk8uOEyMFupLA4psUGC8j4/n6wz3z9w2cTsoPuyDVLuJFDyNsVZOVEZHl7PFGxNwsl2987MCCA1hwJtQ935/YqD1fJPtldKH375hmLDKP1/5qwAu79xf/GBx6/RCWr/pRKfWYjBXZ93wmTEP4smAXIjCABqKyV9yXu2s0i0f6lNjG2M2fX6YrI8tHpmtbOOOS96epWCOHWCCEJQV5+pS6EkSyv0XP1vFaX+WnYwazOOojqOz23sPeru6q06zcaHsgTOMOSYKGAp9gsikV/AhtNwaeRWt+8W6DRzbCtO3Coa+ZSshKezrGghDdYe+4Vfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AY0wIo5RvlZw96+17jRi75fPL7ds10gGrfgE7Hjr9o=;
 b=Av1N9n2zCM6JGcbt+XpxrjzBKyXeuyHazYXXA6tlrTUJb+7dADRKsX++BR4GPUB60n5MbXaZna/km+hGBrfdbajr8Mzon+hbyUy0oN+zB9eX7U6IeH452SyBtWw4Zhlbg1YEb3jo3SgaoE7i+Fkr91ZlK+9W35pi2ymlMicT4aAhfhz2jwKf1OwFeMukgikOQWy67C1g7SPn0JokXk4KNjpnsL9cbyYjUy0F7OPnifFKM0m7oUmjPqS7rFoto/pI2jY3lDeCeii0La+KPVB1/Arl5I1wPgLBnUvf1BV4p35X4dOyYaC4GR8yiEkjeCbg0jyVgWz35OE/nIrzNVIImw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AY0wIo5RvlZw96+17jRi75fPL7ds10gGrfgE7Hjr9o=;
 b=NZW1egqJqZYktwyhVYIE1JrIWWjxbS1nBB1QXfeCWXNws0FSLsUDfA8qF6HGTA7RE9s02LV0R0BZhBLMPQaAX70dWU/Hk9rwFmdS2x9vr6rDDaxXAH25itc4LeGBdQ79MR2pcXHTPQqmJQumuuaZv2es8lUhji2AYFUMk79joaQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:40:42 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:40:42 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-coverage: Upgrade 5.3 -> 5.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210121131709.27097-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1f82ae3b-eed0-4b68-c93f-6b370ea13c95@windriver.com>
Date: Mon, 25 Jan 2021 07:40:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210121131709.27097-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:91::13) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:91::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend Transport; Mon, 25 Jan 2021 12:40:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe53400b-baf8-4b78-ffee-08d8c12e6dbb
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB39845AF4D9B76B1658E19B6A9FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	63ImPiimutN5YAo7+/bEYT1xMC6KKwA2vSwOXo07mOBczmN0Sd5k/e1bS8eIGIf1zeQyUhghQInOC4pGluMRG5m7nJSh5AJ3eh1K95Q7L+Q/aGpq3ggjniicV6vnajTOaYvORgdb5AFeccAsYG5jR663NKT9JBoyXuY/CJ6qad+lGtoMRTY3VGMVnAMvp9J7O02I5wQdahG3guPyNBaxw5btGcGDycLPAwhQiQY5xGuSNf3t4m/vKk/SLDAumCwsoV41/JYnSsBWwP2WEg9wbh+nbkmhfWNoXA2M6of1aSZmTKkzOlQb91o7TNxMH1rIlCT65bVgyLVUzWz1hlGRUOGCMxi6xTs4UhFNwvmaWsFiS7Jum/OM1/JvZ5b6MwgI3+Ov++ds05r68C0RAeDTAE/YYLowMqwfeesH6WxyevMt+TiqdWPWgEqFjWI9UtoI65rWzOkMz7WR/8ciJhhz3sT4H+YhRaspWppxb8wB32NBNUdG6C2GVt47SElcFJor3VeIjWPdAsUBXHgZNYCqnFdgOAjYiza0M9+c7+muVnw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(478600001)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(36756003)(8676002)(52116002)(2906002)(316002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Vlc5MWxpbitCNzFpYUhpYVJDei9GQTB2bENiY04rdWJpRXNic0R3TnhNRThM?=
 =?utf-8?B?aThrTEFDckxrdGdvK1l2VXBUYlVwaThHZjh2MFpnQUpOLzZmVDY0VUs4RXJu?=
 =?utf-8?B?K25xOW9OM0oyTWx2dmI1dXVTQkU2dENUSSswNUpZSVBWckhrMlM2ZVpsMTRO?=
 =?utf-8?B?MUFET3VrMHh3b1Q2Tk5FNkpsOEF1ZmZsTVYxYXJJbXc1YlpJYmVRdFZXV2JX?=
 =?utf-8?B?aEdYQjVzSzNGdHVXUWFaUTA5NmdiNDN0ekxWN0lMSWVVaWFObnd4VndHUExr?=
 =?utf-8?B?eDRYOHExbWk2WVdsS0V5Q3pGWmNTZU5jTkMyVzY2SjlUQWpVdjhVVGVyazRq?=
 =?utf-8?B?V3JHT3NjNnBDLzR3N1BmWEhqU3Z3cll5YW1MMGE3TG5ydGtpa0IxSjVFTVFQ?=
 =?utf-8?B?bE9EWlBJdk9WcC9DcHIyVFNpMElaMi9uY0NXRWZDWk05Rmw2czY1cXJPdEFP?=
 =?utf-8?B?aFBsWXFJcVpOTnYxVEE0WEw4cWJIc3gxN1lkWGNaWGR4d2hrbHVBUEtDcEJC?=
 =?utf-8?B?c0xtTUtwc3ZqVkZWZndEbkJHTnF6MTRzMzVFVU5ZdjREWHZ5WWxET2IzTEVu?=
 =?utf-8?B?MlpLRU5mQWdyMlZUVXMybWFOeEhjdENOMzZlenQvd29lQmowZmZTU0JjZjBP?=
 =?utf-8?B?NWdUWWh0UUxtNjVCZnpZNGl1emZNWFRtQmE1UXpoSFNzWVNDSnVzQk1USE9q?=
 =?utf-8?B?VlFKRUMyZDJwWm1GTllMN2ZkSjhFNXE1VHNrRnRFMmZzNmduclpSbnFlUVlJ?=
 =?utf-8?B?UHAwVFJLblRBMkhLRWJzOWlGM0dWYk9DMkcwSldjR2djcm9PdHdSd1VSQ0JE?=
 =?utf-8?B?VFB1a1pXKzYzemV6Y05IYWJzaHY0TUZTdmM0M1ZFZWRlTWdoaWVnclJGdTJi?=
 =?utf-8?B?aWVLajVVeUYrc3kyU0JDUmdiSkZ4b20zYnpnWE9aVHhXU2hUaGpBS3p6WDZG?=
 =?utf-8?B?djdwcVd4eHF1ZWVSbDA4ckRlWndPSkhYU0J1dXRvcUdzcVhFVTNMVW14d0pX?=
 =?utf-8?B?ZWdDdnBLdjdGRTJTL3p1b0hkSlJXNnl0SE9lNGpsNXU5VWhEV1pkTlE1L1Jt?=
 =?utf-8?B?V3poSERSRkVESVFYUm5UeWlQb205UUE4YkRmT0xWMzhRU0hvQkRpTkplbXFV?=
 =?utf-8?B?Tm5uVG00TElyZUkza2pCMGlDbXU4clAvWVBwU0RTRGNrZjBpOWlGQmI0SFI2?=
 =?utf-8?B?cGF1R0J4S0JtWitoMmJzb2t5ZWpEMXFOQlVmM3U5KzAxUmpSNC83QVpvN1JR?=
 =?utf-8?B?R2N0YnJ1Z0dnN3FxVjJRZzl3eHdzQjhlbkNvMk11UGlmd3FUbGRiR215cVNq?=
 =?utf-8?Q?XOWKi2t/q5t0RFrggj0YFSuc9M9hjNiy31?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe53400b-baf8-4b78-ffee-08d8c12e6dbb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:40:42.8048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5H8DpKEB1tTTB7JUYE9vX7oqjzipMLGobTmsmA2oPzpi2ykPeJM615uCzSpz4mKR2ztA/3CHYt26mf24zImG/1JpJNXsF+bGbjkB979NVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------52CF63EACABE5935ECD14974"
Content-Language: en-US

--------------52CF63EACABE5935ECD14974
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-21 8:17 a.m., Leon Anavi wrote:
> - When using --source on a large source tree, v5.x was slower than
>    previous versions. This performance regression is now fixed.
> - Mysterious SQLite errors can happen on PyPy. An immediate retry
>    seems to fix the problem, although it is an unsatisfying
>    solution.
> - The HTML report now saves the sort order in a more widely
>    supported way.
> - The HTML report pages now have a Sleepy Snake favicon.
> - Wheels are now provided for manylinux2010, and for PyPy3.
> - Continuous integration has moved from Travis and AppVeyor to
>    GitHub Actions.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-coverage_5.3.bb => python3-coverage_5.3.1.bb}     | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-coverage_5.3.bb => python3-coverage_5.3.1.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.3.bb b/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-coverage_5.3.bb
> rename to meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
> index 2354c5e73..14d29a247 100644
> --- a/meta-python/recipes-devtools/python/python3-coverage_5.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
>   
> -SRC_URI[md5sum] = "c2faf2ccc498ce16fd48cc9201c520d7"
> -SRC_URI[sha256sum] = "280baa8ec489c4f542f8940f9c4c2181f0306a8ee1a54eceba071a449fb870a0"
> +SRC_URI[sha256sum] = "38f16b1317b8dd82df67ed5daa5f5e7c959e46579840d77a67a4ceb9cef0a50b"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------52CF63EACABE5935ECD14974
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-21 8:17 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210121131709.27097-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- When using --source on a large source tree, v5.x was slower than
  previous versions. This performance regression is now fixed.
- Mysterious SQLite errors can happen on PyPy. An immediate retry
  seems to fix the problem, although it is an unsatisfying
  solution.
- The HTML report now saves the sort order in a more widely
  supported way.
- The HTML report pages now have a Sleepy Snake favicon.
- Wheels are now provided for manylinux2010, and for PyPy3.
- Continuous integration has moved from Travis and AppVeyor to
  GitHub Actions.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210121131709.27097-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-coverage_5.3.bb =&gt; python3-coverage_5.3.1.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.3.bb =&gt; python3-coverage_5.3.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.3.bb b/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_5.3.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
index 2354c5e73..14d29a247 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://coverage.readthedocs.io">&quot;https://coverage.readthedocs.io&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93">&quot;file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93&quot;</a>
 
-SRC_URI[md5sum] = &quot;c2faf2ccc498ce16fd48cc9201c520d7&quot;
-SRC_URI[sha256sum] = &quot;280baa8ec489c4f542f8940f9c4c2181f0306a8ee1a54eceba071a449fb870a0&quot;
+SRC_URI[sha256sum] = &quot;38f16b1317b8dd82df67ed5daa5f5e7c959e46579840d77a67a4ceb9cef0a50b&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------52CF63EACABE5935ECD14974--
