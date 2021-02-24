Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.43])
 by mx.groups.io with SMTP id smtpd.web12.7833.1614177648987001440
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hV0h8gJO;
 spf=pass (domain: windriver.com, ip: 40.107.77.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLI+4rCQLK5ZMFtLiG5lKK+sglxYgFu2hictz7wd3YwEvg8RsEKh7GQZFhuLNoReOP0WdrP/x04UNs+pj0n8HZQB9b+g1c+KhJo0GXmtdkT+dsWHY1ySKRs45AzPqMwK2K+Z5uhOq6dsfbZje/XATp6vM/RPbTDdPtiFKmlT/LEmtm6c1uJ2TA4kCEKdqSd8Wytd1acdvexHx3QNjwAFt24r1gFwXVjxUMWuvz5BUG1M7kOosUF6cz3sy5UJ9796hRWosACJb/a79OKyhh6wONsv/7KeRDwCQGkMnSp6V/59+A7tuJRgNsGfpg2bKJ0J+cs0id+lemmI7EE+nvjGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6NBCsv973VqfsGipBHnFMIU3yoUHDCEeLYfGfThsNw=;
 b=SJODNIrmDlYdapiaZ5IZyP5zsNLWnK/O+sBFZnKt7KdImpgNu+SJ6nEL2dlyAi154XPyYo7+AS6T8xdXfGXrje7u7XcMC/wC6TqbStuZ0SDZv4+S2FdlREH1M9oaD3hiXj2hHAFiDMBqmqhP8DUeEF7vt6lxaWhI49AvV7fqwBl/o1XrFz6yP88uImnxrZz+nmWwZ4PsuPGu+cf3pJZziXoc++3EhvWTqcUFg6AZFL96La6Npy8dNmFBAqQZa+xJj6XbPcK2uSVoOLgNik1l0q4T/B2s+wlztF0Qg3r9aIVBL1q9FdeP6EvGnS6rHTSrs7fAHhqDjocs85BXOKDGJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6NBCsv973VqfsGipBHnFMIU3yoUHDCEeLYfGfThsNw=;
 b=hV0h8gJOOxqdoEVlOIlCmsdXMdS22d11pHUQCXK+s+mfThy5Y6TJ9Q6M28Lv+NACw/ws/i1CwDeanGqzb5IrBJL1uts/zqnt4qZFhAaNnSwDdYpYQB1C1bXbZ/n6hSEStkxAc2vm7kJag3e43J0QAoZv5fY21AAa1VMGK9MNdkM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2678.namprd11.prod.outlook.com (2603:10b6:a02:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Wed, 24 Feb
 2021 14:40:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:40:47 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-elementpath: Upgrade 2.1.3 -> 2.1.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210222175043.21231-1-leon.anavi@konsulko.com>
 <20210222175043.21231-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b715c17c-c59a-a98d-ba49-eb302098fb74@windriver.com>
Date: Wed, 24 Feb 2021 09:40:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210222175043.21231-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0914.namprd03.prod.outlook.com
 (2603:10b6:408:107::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0914.namprd03.prod.outlook.com (2603:10b6:408:107::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29 via Frontend Transport; Wed, 24 Feb 2021 14:40:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dab10b39-f938-4035-e3ac-08d8d8d22c88
X-MS-TrafficTypeDiagnostic: BYAPR11MB2678:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26785DAFC45E3338A7D50C499F9F9@BYAPR11MB2678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mls0/f5Ksx/2wTRljFiCZuFsOYdyZe4bXTEs3PKb2/JNS1nk/JPKYK2Q+wufUE7Ds+GKHNBETMmv6MiDlo6BBAqc8dTwzJGNEh7l6zSk73YJE9FVvZT90yGLvEEvkPUOJcJfeEYvUZdEycYTQdvwbOMSeZyEbQnjIK3snhQMcdi2XKQfbGWVvQv8ktl31r/9GrgfNkDaYmlS27umUNlRdT7AFFVBcJAVe/AJAndA7PJzz+fzz2nCv0BtR7bzOOMpkbfC1qECdoQLyaxvKWoSqxqluUnLRkUO3Om51H+OJxCZB3AML5OkaxCvQejdciEPbvwgAa0yi8gPYONTAheTphTw4/2uem+g//s/AXsQR+evv8kPIJTc0YiSY2s8wORhyGlk9dXRvbX1uyIoYyfGz8hwV7/22pjatN5ShfEpAEWvMRAS4bIREsZbBxHnrL/yvlsKFBnmcSq0Oc8/XDRq9zTCgIsm7ZJpL2TBqZM+SR8Cm6PTLKQZqTuPtFkMF64E6W20z9B5KdUM+N7Ku+oTaexf7+z4R/lv5Vm3fAO7NXnpoYTkQLDh3Mfe9X8sPQA8t/6oLpkA3RKEfQMaJgZEZoHXEKNlT6tGyV8VAWtwChDzEVSAQcugHNlhSYJCZBF1mQ/JR6dg0T/ItR6WEfG0Ea4dlvo4Ic6RF9YMWFm/UfwmcS5PyPXX9mkFXBmv77qf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39830400003)(366004)(346002)(396003)(8676002)(31686004)(8936002)(36756003)(478600001)(86362001)(33964004)(31696002)(66556008)(16526019)(26005)(956004)(2906002)(44832011)(66946007)(66476007)(5660300002)(6486002)(83380400001)(316002)(53546011)(2616005)(166002)(186003)(966005)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OGxTU2lac0xrRnlOdE40ZDlUdzRYcU51OVJGWW5aWHZMVFJzZ0hrbVlmcjE4?=
 =?utf-8?B?c1Z6N2IrU3N1aUpjVmN0aTNDYjdGbVhPZ3ZRTUx6RkNnclRuOU1oL0hMOEJE?=
 =?utf-8?B?NmxYYlkxd2JXMlJNbTZtVjc1elFMWVg0eW1FMmdVL3lZRVROWDE2TVpFcWRI?=
 =?utf-8?B?WGc3Zzc0YnVrQzJxcjJmU21DRWp3TjZISDBkdXZsQWRnTWNrSGVxSUlOcEVB?=
 =?utf-8?B?a0Q1Tyt6KzM0ZDZDOC9RclJhL24rajI5Wit3WnlaTXNYRktLaGFnQVo4WklP?=
 =?utf-8?B?VGVQWGJ6bnEvdW1vZHVibXdDSG5KUmt6czZET3UzcTNBUWc3K2FSek5CRHJZ?=
 =?utf-8?B?c0tVZEdRelN2eHAxUC9aTS9aUzdVbnZwZWdhMFQxTXJWMHAzV1hETmJkM3I2?=
 =?utf-8?B?K0U2UlJCSGFiRld4YWtTNmNhK3RzUjBNdDVIaHFXL0k3d3BJR0dZdm9FN2w3?=
 =?utf-8?B?Y0ptRnRRa1ozMy8zNGZpUGp6cHhHVnBPSDU5eWhTL3JBU1NqalVKZnZOZkt2?=
 =?utf-8?B?dElxdk1Hek4zRFp6TS9IL3dWWTFRdjIvUytwWU5IOCtpME0vTzBMNjJtZXBn?=
 =?utf-8?B?UXF3a2hWY29pWkJYU2xoS3ZBWHU1ZXFuM1k0K2pxaVFuZHNGRjY1U2REWnNk?=
 =?utf-8?B?Y3JJYWdZZGIvb3Flb0ZKMDhiMFYyNk9rTkI0K0dnSzBnNUZHdFNmeitiSDFr?=
 =?utf-8?B?UkYwamwzWjNIU2tHNG5rcVVWVGJLM2NtWWVPWVhUZkl4VVNyYm1MRnZRZXdM?=
 =?utf-8?B?MkZnRnFGRVBwSUhQSW8rQ0p6aitKNCtiNmR2dm00QmR6MW5VTUkyUXlUalBY?=
 =?utf-8?B?eHN3UFYwQWVFUW9namJZa0c0SjF5L3l0cUpTM3d2MjNLRklScWF6UnFRMG8x?=
 =?utf-8?B?eVVwck9qR1NVd2pBQkI2eUZEYTFLU3hiVnVIYyt6WWlMZU1OazJLY2pHdGpr?=
 =?utf-8?B?WVdjb2pKMW5wdjZCKzNSV2pxZnF1THlvSUJEWmw2NzZoSVhVRGtldVFJVVRF?=
 =?utf-8?B?RnRGM1I2Z29pSVY2anZPYzhSdEJGSGxmMDZzSE1DeU5zVVBGWTVVU05iczZZ?=
 =?utf-8?B?Vnkrc1pYRnREaDNzQjdzdHc2Z3BuT3pocHVNd1IxS0l3cDRjQnhHWmJ5NDBX?=
 =?utf-8?B?QlZVb2U4TXFJelhUMkRSQWZib25vUVN4a280WHR5WmhOazVNY0dpcTMyQXEz?=
 =?utf-8?B?YWFwSmVDUVlObWRvRzF1V2xNbHlvb1pxMEVkWjVNdGZpQUI3alJsZTJiU3FS?=
 =?utf-8?B?ckU4amtPd0Y0ZThsN3cvNXMyODgwWm4wY0VtbEVoNy9ISVFreGZUZVNRWE4v?=
 =?utf-8?B?dUNmSGVXNzZXMHgwV3JSOHpCcjFYOWRhamQwVDdsR2ZOeXRHQ2U4MlF0NXU0?=
 =?utf-8?B?eW5HTURGSUpLMDJHRGxxeXExVFVCdUZNenMybGJRU1pWMXhpd2hVb0NPZUlE?=
 =?utf-8?B?SW1lYUt1QWlObGh2NDByWnd6MG9OakU5YzdqL1RHNSt3bjlKL2NTS2pSNzhj?=
 =?utf-8?B?MDZSb04xUmJPekFnYUJPZzdBYlgxK1lVREFKdzcrRWxtcldWbmRBMytZaEk1?=
 =?utf-8?B?UWFhYUJuL2sweWZNY2VpQ1o0aFp6WmRJRHhlS2xVM3ZqRGFpNjlock5VZjQ1?=
 =?utf-8?B?emJvQzRRdXBJcUhDVkozNkVnekJuOTc4dVdGZzhqZEdBQTkvMjU5aFQwcmFJ?=
 =?utf-8?B?R2xNQWMxUWYzd09LUkIza3VXYjluZ3pCelFmeFZ4a3VONXF1YkwwVlRtOXVi?=
 =?utf-8?Q?qt9T40wEvMt2vvRuujCBR1oUchurn118KTEpgb9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab10b39-f938-4035-e3ac-08d8d8d22c88
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:40:47.5855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /epS21l+8BKe9t0A7qoeyQApertrt6KqcjtT55EOdDyy7DeaSGtaVlP6al4MDm7n9pSYK+QeCEIuNTlM845121B0xKACVyrOB8HEDpYX9qE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2678
Content-Type: multipart/alternative;
 boundary="------------5BA80D6D6443B02F43865AC8"
Content-Language: en-US

--------------5BA80D6D6443B02F43865AC8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-22 12:50 p.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.1.4:
>
> - Add tests and apply small fixes to TDOP parser
> - Fix wildcard selection of attributes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-elementpath_2.1.3.bb => python3-elementpath_2.1.4.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-elementpath_2.1.3.bb => python3-elementpath_2.1.4.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
> rename to meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
> index 2cba4fb5c8..10aa17d381 100644
> --- a/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
>
> -SRC_URI[sha256sum] = "b729d9376cc0f76479c9b0cef30cc0d3c9082ccb4507caa0da1a5e4964926960"
> +SRC_URI[sha256sum] = "326643aca7beff0864d022cd591736b8550a70fccafd67a89198166baed1c2c4"
>
>   PYPI_PACKAGE = "elementpath"
>   inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>

--------------5BA80D6D6443B02F43865AC8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-22 12:50 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210222175043.21231-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.1.4:

- Add tests and apply small fixes to TDOP parser
- Fix wildcard selection of attributes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210222175043.21231-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-elementpath_2.1.3.bb =&gt; python3-elementpath_2.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.1.3.bb =&gt; python3-elementpath_2.1.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
index 2cba4fb5c8..10aa17d381 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/sissaschool/elementpath">&quot;https://github.com/sissaschool/elementpath&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf">&quot;file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf&quot;</a>

-SRC_URI[sha256sum] = &quot;b729d9376cc0f76479c9b0cef30cc0d3c9082ccb4507caa0da1a5e4964926960&quot;
+SRC_URI[sha256sum] = &quot;326643aca7beff0864d022cd591736b8550a70fccafd67a89198166baed1c2c4&quot;

 PYPI_PACKAGE = &quot;elementpath&quot;
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

--------------5BA80D6D6443B02F43865AC8--
