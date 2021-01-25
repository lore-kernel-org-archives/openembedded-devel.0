Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.69])
 by mx.groups.io with SMTP id smtpd.web12.35857.1611578355426117125
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZiOQeMZe;
 spf=pass (domain: windriver.com, ip: 40.107.220.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQsIOkA+XZQw4b5aldpVKFRRPniaNQz/UgdMtvn5T9D0mlp9u8exJ5tm3SuK2Mw0uQ2zyUPIlRJuYa6R4j6TEtIJij/d1EcOci4v1WP8A9OR5rmgmXN3y/XUXCfjvG7h6qdLuQjYWoowaG12tS6v8HKDPsQhBEuXxzZ6korEPZ+WozNhCD0EBhaQsH2NJsdHtjQX8Q4vg3w2EqT1esXRE0q/HqHmuStLp5NOBP3RBRzC70V6U3nEG4RoXitnMhwlezm3sxXjTyxFFsP4SV76onG0DRIFQ2IyTjJa08HvUHOZg860/o7z5jndUuJqsPDjMXiYlLq45Srsag41/35EVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysH5Yn1uktdm2XZlzGE3k1TvqQg/wNFbpkYaoodtBTo=;
 b=jIe/jFD6wQT6H+vLIqmwMb2YFelONiExpyyyuG4UO5AZj0bWTkJHGUxFMlPdAXxEfrwisaJzvW0efa9iJlPRYdWSXcnBa6npFFAyiTSd06+ZtA5BSJw4owvs8KznIdtQfQOlHo7jchhA4xXp+ZxAXpSJKL/MQJl4JT6MbXbBXSklVnfehT3KwCuYpKfB158a92gbCoAtVHEZ550KFBcpHpEvnrD6+QlrEet0swQA7c+PyDUNJXGFaNuGDQPZg06+FxuUjLS3PTq2tKaowrA7tqSaHVOimMxX0xU5RiWtnBbQz7aM7A/pZUPxELVLJdB7XVvxfdE6PgcW2z8qmqNvew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysH5Yn1uktdm2XZlzGE3k1TvqQg/wNFbpkYaoodtBTo=;
 b=ZiOQeMZeWli/iwvFZ74Z02DRK2RURvNNPYOfqFEtwA/oMVpHakbvZH/2E7+wSH8u4EJ/YgV2fEiS8nH2lSJQ/ZAXnMz6LL79B+DLs9uWjK1puiafBjPsSun1MhUMHz7VQMW+QuXciR+VQYNz95IyHp7RL1gN9xJS2Q/jc+PSIHw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:39:14 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:39:14 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-evdev: Upgrade 1.3.0 -> 1.4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
 <20210120111027.12947-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8c3fcd6f-1cfd-ea38-a20e-29bbc8829c91@windriver.com>
Date: Mon, 25 Jan 2021 07:39:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210120111027.12947-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH0PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:610:b1::14) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH0PR13CA0009.namprd13.prod.outlook.com (2603:10b6:610:b1::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend Transport; Mon, 25 Jan 2021 12:39:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c69ca047-c245-48e0-e37b-08d8c12e3912
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3984593FEC8C6AD37FC6707F9FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p1zAC97jNc9t5mWduGYmFAdR9J5rA9NmUuamzvb9jkr/pDocRgub4muKbvzNP+7AZv1UswAAbPzsFkyZrhtDk7mwAJwJjoq9pnUWCVjn7Y6K99iNdYWaju69grAKZAJ+8KeZmbLXAmbWYuFMAgCCc89f8DQOcCcSad7YQqGK6GojFIXaVTM3SF4EBCCouGWLY8CfT6IuvBXEns0CIHYlJNYOYGQFS/RuYriGiUXqWd7UwTIisUKoYvkPv8/MssrtutvFViqTidh7+sRu5hFKFRFS1100ZGle5vFCfybe0XBm1k6OyDboVo6xOEV0zw3Xk9MFpCXNJYE7MpN2g3OG5bPt9KzVX39rewdCAeWZNSYgi6PvdZUIOzpAHVgZracMXJi5jrPbKHXI1mh8KMu/gE6rEPx3Li+2wWkCO3D7gebkx3dnOL3L+HydGe32FujEWhhqZuOqEDZQmoNp+48I1lgFwVYHmjQYC1dtyeOKBfF13KPTniBd5JP+EXoe5GvKz1mmDbRE4e7afPk/xWmUdypmOI4JMPEjzAAMZjUJWOg673wtRx8BAejM88QO54R6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(498600001)(36756003)(8676002)(52116002)(2906002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?V0NDUW4yZ3ZHZ2cvcHhBWndkV0tJUGc4NTVVNEM4YnJUeHN3KzNPcVczOW9x?=
 =?utf-8?B?bVFOTEdLQkhPYzl5aXlZdkNxSkttcEN6b3RwdmN1RXpQSk43VGcvR0pZNllE?=
 =?utf-8?B?NVR1Vzc4VjVTa1BEd0k0Y3U4YUo0Z2d1M1JnOHQ1ek1yemxBMXNVZmRpRUtk?=
 =?utf-8?B?OXVzWVJmQWhMOHpneTI4YktJMHRiNktiL0NKaTV4a0tYKzRpQ3VnQkpPVkJW?=
 =?utf-8?B?R1F4MDFlOW1sM3ZMdDE5TmFCZVNlZmpBYnBHT0xvay9RR1J5L0NRZHVpSnNo?=
 =?utf-8?B?NDFTTVA3M3RUSWlWazdLRW1kb3QwNTlWMEZtUTNLQUxMSFNlOXhWUi9ObEpH?=
 =?utf-8?B?MEt1OGFMSTJ6NFU3eUpjdzNqSU5nZUNXdDU4T3hoSG1xM3NVcm4zc01GRXFt?=
 =?utf-8?B?ek5UbStscUt1L3JoRFFMZVM3N0NqeERJc0pOY2tLSk5ITFVhL08rcG1sM2lD?=
 =?utf-8?B?UnJmemNyaW52c3psMDJPMUxhTFdkRjQyaVU1bm1TYTF3aVprK1d6Q1VRSC82?=
 =?utf-8?B?N2ZKMUxBL0dPcWhxUk12MytrNnh2MWx1LzRVWEdaTHNiNndrMk82Zm80VVJv?=
 =?utf-8?B?Y1o4eURqd3VmZ0Rmb0V4UU9wR0VVZDlyYVZORG5WSUNmN3NPVmhqWHY1c2t3?=
 =?utf-8?B?RnE5VFp5MXh6K1ltODYvTVV3a0VtZGVDSEVLVG8zZWNJSHpxbDZMMVYzYTBN?=
 =?utf-8?B?SC9xMnFyUDJMV281N2UvNVFCT1h4Mm1WVFhyRHFXcFV0dFlEd3hTNStpQUdj?=
 =?utf-8?B?c042eUk1TUJ1U3k2N29lakwrNWE3MUJGZWxUdStIWi9PbXBXb1J1NW1Lb3BF?=
 =?utf-8?B?VkJ1RUtKZ3h5RVNzam16b0pGdGg1Q1k3aUx1UmF5bkhQRDlReGlBblBxT3or?=
 =?utf-8?B?Wi9zVWpKaXV5ZlhYQXN5U3FsWWw0US9VT25QdTNFcitXZE9NM3RaM3lSb2xZ?=
 =?utf-8?B?aDE3Y1hXem5JYUFjMkRzckd1K0szb1NiRTRjQmpuNXk0K0NTVFVUcDJwM0k3?=
 =?utf-8?B?b0orU1QxQXlTSmNBeWFaS1UvbUwzd0p1MDRhbjkvZnpEelcrS1B1b3NQVTdk?=
 =?utf-8?B?RlgrRkpFZzhMWmtJTXJsNGI4OHQzdXFTUm5LZ3hGZGJMTGkrelV3SVhBWmky?=
 =?utf-8?B?VkhrV2JRSUxCWG9nWDM2bE1nMlVlNWN3cVh1TEVKeVlYV1JucTA1cFZRMmpo?=
 =?utf-8?B?ZEtjai9PdGVQZXZCN2hvb3BKcVZlZ0ZtcmF3WE4yQnphdGRJenNqVk0zQzRD?=
 =?utf-8?B?Wk5CeCtRVjNSVlpIVFREWWNPOGZjNDlKVVVKMFRRMXhUdlFNUytmMEszeC9z?=
 =?utf-8?Q?RHINKVhHYVyQiWHPRaU5dy0B4Cr3yFqzd0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69ca047-c245-48e0-e37b-08d8c12e3912
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:39:14.4549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmspmdrKjiCCZKtsaqGOxnQO7701MamzpQpoAi+rRZUqFCsIBlWnGSK5MaA6YSRrt1OS78k0y9M4QsXgm/FZQjQd2ewYARWQY3Q+c5ascO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------F879F4559B3CAD1861B52329"
Content-Language: en-US

--------------F879F4559B3CAD1861B52329
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

--------------F879F4559B3CAD1861B52329
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

--------------F879F4559B3CAD1861B52329--
