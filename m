Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.64])
 by mx.groups.io with SMTP id smtpd.web11.35852.1611578466370835986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ikzfkKtf;
 spf=pass (domain: windriver.com, ip: 40.107.93.64, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDfEFGQORYU3/1OFoOvPcfdrW9TX3+2TUPuEi9YTtAOikzm7AGEelMROrDxsufHtHQ70ke21MbEF5RiccUoeo7qutvi2fL7x4INNN3Sk2hhup/yAb0ehRrsbzct1IIcG4CjzmPj32tHskY2haaMQaGQNJ8DiKxkvri05YzrTAY0f6wGU7qLBlgC4VnAaCvzlkSQp6At2pKytt05jXbkP7RrVP5IfvoPTaQ7EyZf0Kl5s9mmISCk0UHW/fUtew7QO51VPnU8nt+Vfv6j1jHylJeULcf94LeAsVhAbpu65Mps+LrAMDsLI3XbeWjuai3HZzNpz4iVqkNKgmQMvxgQUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDm8gjADvgHGvCwy9tK965DFwNmVBcPA/0XEWh1wKrQ=;
 b=bRnhzqLKYzr/KAZ/HaPOA1OxvhdvNufTvofh6vTpAmBZAwoAInR7g7mznArua4YmnT+r5SiY21GzebyOvHuXeTNsHAJWADlvLHTZuWcLoqtypDPCX6jttaUzYNDXuhswfj2soiLpKpli7twYxWI51mvVnd5S2L0a1qkJ3O1XwMaDJm4Dsz+R4fFg1sDNQxmqnk0RgX2CvDkInHijkQf029dZYwW7idp3/CU2Z75HCGFLRMRJT3Jhf5/e1ek14uh0zSFoLlz+aEirHteB2Eedy7+3J43ivb/ZPUncXjdgj63P02i3aMdcXt2K0VrfG95FJEzsV9O/KJ4BEddrwzyPzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDm8gjADvgHGvCwy9tK965DFwNmVBcPA/0XEWh1wKrQ=;
 b=ikzfkKtfMSuqEcaxcgydGVYBnoGI6Z5PiriKRlGNhl1bxxA/IKEv+KJY138bes940BrGXD6ylk/aXrHQwW2mljQn6YvYXaPeBBYxcgx1RHUZ3IQ+sJ73iktHulY34u91bum+Ad/KbvcVphq48/2ZAPk+HHM60XeKuscW8TjABUg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:41:05 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:41:05 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-bitarray: Upgrade 1.6.1 -> 1.6.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210121131709.27097-1-leon.anavi@konsulko.com>
 <20210121131709.27097-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f310b40a-24b8-fd09-5712-c50aed655d17@windriver.com>
Date: Mon, 25 Jan 2021 07:41:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210121131709.27097-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR14CA0015.namprd14.prod.outlook.com
 (2603:10b6:208:23e::20) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR14CA0015.namprd14.prod.outlook.com (2603:10b6:208:23e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 12:41:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 010e42e5-5951-40a6-062b-08d8c12e7b1d
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3984651DA6677608DB509A9E9FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mUiEtcnqVb3LyNp1vaRK73t2IzF9TU5OQEyF1T/3/8ZH2XfvzNAQWjPbmR2ZRpuyStHPKTLCAjwT8710xZDTEKVqxteIlTgoFg0gW7ckezK0UiA2IWh7jnVxAFrVxrOrKXNZq2DaEaZ5EaQAH1mUFp0nyF0cgGONVD25m0LuwhPe+UpQ/EsWs1UXzRNz2X78/+GxY7/H5025RS2kdIDuHGLxg3P2E5YBUAQKOqYoC6uwHHRxnDgn3SlE+fEq5EgMQ4ys4V4EDJsqWiEJlUHppW3u3EIYb8VJGnzFD3iZOGFOEng8WKZ2z+M7S4LAAALhv5ZPg/w7vIDodahPqhQ0pNjjYAEL/uh7tf5krk4ya6eutl19htpLjgJyVW/HSh9rC9PzaC99yAbpX7uum1xE2s1YfYSQjkCEfinSIBzp55n7rjyVCOR4uTekxV/uo6kcnV+7rliu7MkEaGibSYIcT18ZYDQYyWPidtgAMYa1rKrGYHLeTtcdcyOqcO2RdBAsHIKRLamEIdyy6ELSjcNu+uv3JNcL03S/9kRdfzw0kJ8wFgY0QPGKbfYoKzp+GqJe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(478600001)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(36756003)(8676002)(52116002)(2906002)(316002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?clZLWkd4Ny82N1F3clBIYTRLWDhtejNNbk5XS3U1MVludGpKSzZHSE1SN2Ns?=
 =?utf-8?B?RGtEUHU5cWVxTmx4YlViVEJKNmtUcUxMZ2U4bTN5MXpwKzA5K1hsdm9IRTg2?=
 =?utf-8?B?eDRURlo5VURSaVE1L0dhbzkxMy9Zbm5Vdm1vQzVhcTIza0p2dHlxajVjU2dK?=
 =?utf-8?B?d09GRS9UVzNHZUVBTitlK2RGNHVORUpJSXZLM3ZlaExGZW1zc0lzVUxvd2I4?=
 =?utf-8?B?VEZJSzlBcDdENDdXaXUrWks5UXp4TnRUckxNV1BTVnN6UXpnamp6NDdVOXVh?=
 =?utf-8?B?NEthZVo1OWU3dW45c2dMUVhnaWY5Wk9JNXlwV3dhRFo0NEo4U2pjZzFWblJn?=
 =?utf-8?B?R3Z6M2MwSjB0SnhKNVBYbUo2emlrV1ZFZ3pXZVNvdW8zTkJVRzVZVXpFdXhy?=
 =?utf-8?B?a3gwYlhnWitXM1BFSjJiQzdNZWw5WmVZZVhpMWwxTU5IZ2JNK2U0QUYzVXBX?=
 =?utf-8?B?ZTFMRVBvSkQ4djNyQ2tsNkVXbHNyUGdqQ29NQ3lEdEZJRnNhYUJEUmx0YnJo?=
 =?utf-8?B?aEpOTllmY2ZvQzdmSEVwOHFzbkhxcE5MRzRBRVdiZDczQTJZRHE5bzd2eEtl?=
 =?utf-8?B?S0p6bmQ2TmdGQUwrandNUUJCaW4veG5BNU9VeVRuWVFYaG1JQ2YxVEt1RDRM?=
 =?utf-8?B?bEgvbE1oM04zQUx6Q0ttZU11VVNyMXdmU0I2TDJQOUhVaSs4ZG1ZOUVDb2t4?=
 =?utf-8?B?Q2JCWFRPVVhIdFk1SWd0SXBWKytwbGQySU45WkdnTEFDN09kRFhDSEdaQVVW?=
 =?utf-8?B?UlU4eXE4b1NobXVEZFNuTmpBK0t2WFhuU0tRNFJnRjFRVVhEMlBLR1ZzVTNH?=
 =?utf-8?B?eUFxVUcxazhRV0FERnBNNjU4aUM5cEJISnN2WFZnNkUxTEVCTTR1RFp0bkc0?=
 =?utf-8?B?cXByZll6QWI1a0N2ejhZNm93TXhXWVh5UkNGaVF1WndzV05LTUZ5WXlXWmxP?=
 =?utf-8?B?MGc1b2JXUDFFU2M3RkhJb2VuUzUwczRZWnlrYVFJWXMxckNTVUprdlN6OEVk?=
 =?utf-8?B?MXoreElXeUJ2ZXdITEZESXFVZ1U3RHc2cnB6OXdENGk3cmR3em5kTmM0d0ZV?=
 =?utf-8?B?L29HVWhHaWNmdDNscE1BYmVQTG51Z1V3QlltcEt4WW1EdGFlVEgxOFBISGNw?=
 =?utf-8?B?UmQ1NmtuZXl4ZXdBRmhxVWdkSDFBR211bnJFNWhCbW1yNlRjT0REQ2w5UXNN?=
 =?utf-8?B?cVhTdFZEQVhPM1NyRDBhbEZOWUwrdUloYXQ2SjJIWmRmT1FTZG1rVVppOFRt?=
 =?utf-8?B?ZnM0ODFvTDl6RmlKb29mUnVBTmpLU2JVYkI4S1kxMlBqZDNkQ0pqalcxZHpG?=
 =?utf-8?Q?hSLanHmk00Y3CjQ41yK5IvQrNhI9s7j3pi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010e42e5-5951-40a6-062b-08d8c12e7b1d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:41:05.2400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCsoe6ERp8nfko+mmfgGb4/U+mtcXB7Eg7IXYBWPmWL0aACJ7Jc6HaBKQMjKnQEmw5gYsIcd9H4AMHMme1QhAZahxxUO+E1HDASHlFlPb0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------EBC0E27913B780D779163135"
Content-Language: en-US

--------------EBC0E27913B780D779163135
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-21 8:17 a.m., Leon Anavi wrote:
> - add missing .h files to sdist tarball
> - use `Py_SET_TYPE()` and `Py_SET_SIZE()` for Python 3.10
> - add official Python 3.10 support
> - fix slice assignement to same object, e.g. a[2::] = a or
>    a[::-1] = a
> - add bitarray.h
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-bitarray_1.6.1.bb => python3-bitarray_1.6.3.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-bitarray_1.6.1.bb => python3-bitarray_1.6.3.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
> rename to meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
> index f54d54f92..16beab551 100644
> --- a/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
>   
> -SRC_URI[md5sum] = "a082075dbae478fb53c69e25cc7f9cd6"
> -SRC_URI[sha256sum] = "ab85b38365dd9956264226b30dababa02161ed49bb36c7ee82cc6545e07b1599"
> +SRC_URI[sha256sum] = "ae27ce4bef4f35b4cc2c0b0d9cf02ed49eee567c23d70cb5066ad215f9b62b3c"
>   
>   inherit setuptools3 pypi
>   
>
> 
>

--------------EBC0E27913B780D779163135
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
    <blockquote type="cite" cite="mid:20210121131709.27097-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- add missing .h files to sdist tarball
- use `Py_SET_TYPE()` and `Py_SET_SIZE()` for Python 3.10
- add official Python 3.10 support
- fix slice assignement to same object, e.g. a[2::] = a or
  a[::-1] = a
- add bitarray.h

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210121131709.27097-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-bitarray_1.6.1.bb =&gt; python3-bitarray_1.6.3.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.6.1.bb =&gt; python3-bitarray_1.6.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
index f54d54f92..16beab551 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d">&quot;file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d&quot;</a>
 
-SRC_URI[md5sum] = &quot;a082075dbae478fb53c69e25cc7f9cd6&quot;
-SRC_URI[sha256sum] = &quot;ab85b38365dd9956264226b30dababa02161ed49bb36c7ee82cc6545e07b1599&quot;
+SRC_URI[sha256sum] = &quot;ae27ce4bef4f35b4cc2c0b0d9cf02ed49eee567c23d70cb5066ad215f9b62b3c&quot;
 
 inherit setuptools3 pypi
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------EBC0E27913B780D779163135--
