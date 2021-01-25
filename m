Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.40])
 by mx.groups.io with SMTP id smtpd.web10.35906.1611578059963639565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RTyd+/LF;
 spf=pass (domain: windriver.com, ip: 40.107.220.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5l7ffglbGXZD9EshA4hS+nB1UaSGEsdu813s0K1SLju55erpbnQx2xn42I/ofzAcBSGnSiC+s3JeqIrz5qK3o0utZfWuBStxrLmcYJiQLefQlWikXWx011mEK2dLKZePbv5YxyK2nLR+AMqLoBVHXci7bZ6eF5q6078HV2jecblrHRamVIu0yluqihCGPn5WCvLp5OsQCTGzzFV2DErT1E7woIYdc3kS7wPv5M2CzSwmBSv87aqmKRvBlckXWHKxjkYhbo3RwbldTXGPfMQ22YGxFBsnCC0nWPuRURA7vfaYtbQD4QuLXrod/UxfSt0qG7d+zJCNVDDrEOSaLRtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6vWHdxPAZKajS28AhdnsM9n6UHdfA3uQOUaaF3/9Ks=;
 b=Ox/K9rxfhPcun+F+OA2zVvspTEiljWDVnuC3/74JTmBEBEFbZaLe30oSQ7mFezaGvs4JcYHHNESXHwRuCkqK7tn++pMWDOaEol3lovI5clGinmh0l8+o5k4VUpTOtmiqBchrxuMOI8xYy9JYbQoM1/I2/aEM8hOnXIvd9J8IFA7qXctlwPju9TJZ8W3IlmxrYo+EGfhLaL0c1EQFuVv1RMcMweynCJai1niPSDemRBEvlU1PTl2G70/clp8uh3Se3r62rfW5hqn1IShwUOZQlGyLYmExGlDr/AryE22uN0FkTbUowqjrPgiByuQNVujmJw8DGLqFBvqgqLLWPG5nsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6vWHdxPAZKajS28AhdnsM9n6UHdfA3uQOUaaF3/9Ks=;
 b=RTyd+/LFmCnzI8S9ic9J1KMKfuYI20QIRWN+FtTgncxqMUsxuYNZYMpb83O+QzGvWlSwwPVIhKr7UTHA2jJlNC9P/Hcst1erGWW1RCGNO/kvUyyXU4BD7SDvyXceJsgN84g3CZZr1boaPLIThIQYS8QJt1F1SKzZ8mQJ2kkXOjA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:34:18 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:34:18 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-evdev: Upgrade 1.3.0 -> 1.4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
 <20210120111027.12947-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8bbced44-e6d8-aa84-71ea-fd62c8b66c59@windriver.com>
Date: Mon, 25 Jan 2021 07:34:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210120111027.12947-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:408:fc::6) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0061.namprd03.prod.outlook.com (2603:10b6:408:fc::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 12:34:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dd9472f-3f4f-477d-71ad-08d8c12d889b
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3984E250C725C89D93AF987C9FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jmwbZ4AOE0yl6MNaE7N4ZTrq+dBHxH+Q5Df8IRyXTibJnWHH/7/JYwznwxlA1UnPokDSNsDZGl0gFKkcu5vPZ/QaD0IBTG9xPr4SSajC2Ifqa/ks33CPzyiDfQar8oB4DGMhDtVl2cvbwUhg9Q3OzaKJDGhZjWxyb81d6gfGBtvs+xgZOQahvsD664abiK1ISA0lFHTCLiqSutSYJOpY/mViiwUTDgXS3rqKXHxy0oTqsArXfr2NxdOBCmHhWWQBZ8ToIsxUtJ2TqA/Rox5yn76qrLmXe/dnrOfY+j+HnGi6CGDqsbfMhXLEa6WLyFFUqwva7a4/sZB7QfO/HbJFj0/NbYMX2oecSNx1skLGOrvewJIkVfBjWmmIt7EmzKyxuVQ4qu1g7KQGy1o1AQFUk0HEB4XsCXvkyiM6iI6RAOlrGJo0lsSlekvL7DvUSVCH5Wp5dVFlt3rmKdxpRvVrZvvCFgXsikbI/trdVaAkNHL2IX3Yk8Kq4NuSK4PqhmOPiiJQFuI5T8ODvl3uwDYuIQwahrD92rujsHNdCoQ+UEEM2uQDxYlnJxhjF+KAkTvw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39840400004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(478600001)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(36756003)(8676002)(52116002)(2906002)(316002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bUxtZmQxYzB0Z2NDR2pzRGFnZUFZUnVIdXlFVnh3VzJla0hhN0NwZFhNT2M3?=
 =?utf-8?B?K0JtSGszTEQ0M3NWUnhicCt6elJRbG1xL2RTeFlIU0tOVUhPQnN6L3o1eWR2?=
 =?utf-8?B?QmZZVHJOWTRTTmVlSmErVHNYS2p1akdtZnZ1YmQ4UytDN3VqK0kvNW5hTGlW?=
 =?utf-8?B?cmNXeUUwelEvYUMwN3RIUGFOR0pFNGxUUzlKSFRjTmFRSUNiWU9iOVZwL2Fy?=
 =?utf-8?B?VlFRL1prQ1Y4NWY3bi9kQU00VUNWeSttQ3d0V0tra3Y0K0ZvV3JhK08zckVM?=
 =?utf-8?B?aDVvY3ZqQ0VwSDdlUm5ZQTU1clFSOGxsc0p5YmtCaGVjTkJiTGFKVnl3S21j?=
 =?utf-8?B?bzhIMzFiTjg5MHlGYkJBK1RXenFGeDFPeE1BTHArYlZlYmFzM0YzcVE0M05n?=
 =?utf-8?B?UmxEdnVzd2dxUXVUZnl5UVpNN2lXWGxoaFZweU9FZTN4aDlQRVAwYy9VWUR1?=
 =?utf-8?B?TFVsL1dyc2F4Y3huTno4YnRRa1pHQnpQb0tHMzRodzY1dWpGNkR6WGxuUDBt?=
 =?utf-8?B?aFBWeUhCTndPNWk1d2tFYW15NXFwcEFNU3lIUE1lUVpQV1F4VmZkazhXMEZD?=
 =?utf-8?B?UjJDQUo5Si93bCtOM0Ryem9wekdLSzlDa2RPRnB3YjdqYWEweFpQS3lER2lV?=
 =?utf-8?B?QlRBbThqeXFnVURFQk9Zd2oxcHdQTEI0NkJxWklUaXE4VHhHeWxaTnV3dERz?=
 =?utf-8?B?L3NOYSt5NHM0eERwN2tSeWg0WjZlT0pHUUhIYjcvTzFYckRscGVnUC9aejVV?=
 =?utf-8?B?WXAwbWdXdThheEpwdXhXbnFqa3lhbFpkZjhheU1MYnlxM1dhdjhJVU16bkpO?=
 =?utf-8?B?cGhHd0JteEJGdWptcG1JTFN6eTZwMkp6Zkk1OFFwbmpUN2FybVhrbEVpZUhM?=
 =?utf-8?B?ZjN3U29LaXR1MjNocStQaHhGMW95Y1ZCK0FXTnBQNWc1bmR4MWRWWVk4SjA4?=
 =?utf-8?B?Y283akVWVFZkdGFGNlVjSFF2ZXI3WVA5cURTT1MzbWphZTkyL3JuYjFBbktJ?=
 =?utf-8?B?NERUdlBGNjZMSVZsOVF4WUVQa3Y1TGNFSHdId1A5TUJZTzhEYU5DQjdBc21j?=
 =?utf-8?B?R3ZJdmN2bHZtQlMxUHhXZlRhTld1QWpiNzNEM1hFSHMrVTBmVUY4NmMvOVBU?=
 =?utf-8?B?c1c0aDBoMHNEVUw2V2JkbWVhZkQrZmVuNW9xOWU5NTJsL25PZk9yVENPNXFN?=
 =?utf-8?B?NnF1NElocXRvZ0dVNDV0cHJPR3hxRm9QQStXVEFyRkZVZkRTRU1MWnpYcktx?=
 =?utf-8?B?TjFJdmVLSHVtMGVhUGFseHJ5dzZFdWI4dThpbVBZWWJpa0hCdVJ5QnRmdE1I?=
 =?utf-8?Q?BaFGq0fd0/yXklbZ0EgpiUDNn2CpHBgWw1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd9472f-3f4f-477d-71ad-08d8c12d889b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:34:18.3932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MytEg4n5glMMTII511vj8iRA4+UNXtzWausvapNPRRDym9Vkh7gS1ZKezqTAxtVVqOWQaA15ShjDUfeDPe3uXGWR1g0UqE3cfvZOEz+5CKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------57D8BC5F629FA6D4C691FE5A"
Content-Language: en-US

--------------57D8BC5F629FA6D4C691FE5A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-20 6:10 a.m., Leon Anavi wrote:
> - Fix InputDevice.set_absinfo to allow setting parameters to zero.
> - Fix off-by-one in ioctl_EVIOCG_bits, which causes value at the
>    end of the list to not be reported back.
> - Fix set_absinfo to allow setting parameters to zero.
> - Fix leak when returning BlockingIOError from a read.
> - Fix "There is no current event loop in thread" error for
>    non asyncio code.
> - Prevent InputDevice destructor from blocking.
> - Add missing return codes to os.strerror() calls and fix force
>    feedback example in docs (#138).
> - Add the util.find_ecodes_by_regex() helper function.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-evdev_1.3.0.bb => python3-evdev_1.4.0.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-evdev_1.3.0.bb => python3-evdev_1.4.0.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
> index fe11049ad..e15d83b60 100644
> --- a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
>   
> -SRC_URI[md5sum] = "05f9e900d6e11e1674475d2dd2668f0d"
> -SRC_URI[sha256sum] = "b1c649b4fed7252711011da235782b2c260b32e004058d62473471e5cd30634d"
> +SRC_URI[sha256sum] = "8782740eb1a86b187334c07feb5127d3faa0b236e113206dfe3ae8f77fb1aaf1"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------57D8BC5F629FA6D4C691FE5A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-20 6:10 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210120111027.12947-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix InputDevice.set_absinfo to allow setting parameters to zero.
- Fix off-by-one in ioctl_EVIOCG_bits, which causes value at the
  end of the list to not be reported back.
- Fix set_absinfo to allow setting parameters to zero.
- Fix leak when returning BlockingIOError from a read.
- Fix &quot;There is no current event loop in thread&quot; error for
  non asyncio code.
- Prevent InputDevice destructor from blocking.
- Add missing return codes to os.strerror() calls and fix force
  feedback example in docs (#138).
- Add the util.find_ecodes_by_regex() helper function.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210120111027.12947-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-evdev_1.3.0.bb =&gt; python3-evdev_1.4.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-evdev_1.3.0.bb =&gt; python3-evdev_1.4.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
index fe11049ad..e15d83b60 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/gvalkov/python-evdev">&quot;https://github.com/gvalkov/python-evdev&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2">&quot;file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2&quot;</a>
 
-SRC_URI[md5sum] = &quot;05f9e900d6e11e1674475d2dd2668f0d&quot;
-SRC_URI[sha256sum] = &quot;b1c649b4fed7252711011da235782b2c260b32e004058d62473471e5cd30634d&quot;
+SRC_URI[sha256sum] = &quot;8782740eb1a86b187334c07feb5127d3faa0b236e113206dfe3ae8f77fb1aaf1&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------57D8BC5F629FA6D4C691FE5A--
