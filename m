Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.83])
 by mx.groups.io with SMTP id smtpd.web11.13459.1616422597901450550
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DivS+DNw;
 spf=pass (domain: windriver.com, ip: 40.107.93.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S70NNUnP8NUqhQSJ12zRnSSIpQkb+v1cTC3wB4glNQYqI+ExFZLW3bjGm4PRq6PGy00Awes5m+UtwuB+t4eERk50r164wgKBSsdACJn+zi9AKEPZNyVGO1KoGmD0QMZYwOkQtIEU8HeX64qU5XWB29fCBfzvvreMFTMKcU5cR1zEPupTf+ZD9elRuBIepnUVRaKdc3muTjA9ARcESUI4Qf9Z40afQKJbKzeC7paIP25LX3Ygy9TLrvsQWQx3eiN6n3oYy0d8kphyJV1GLCUC66ylo4eL0ChEDdJ82n9gRw2tkHi5HCpbaJ6VCG7J8jnCbJXyZdrLUJJobUlkejA6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0KJZb0cBaDHYVKhL+QyoIbQwRNSjjC0HpG4cujrOnc=;
 b=ETttqQSRyUzIUoUBg3G5fj1dYcXBpr0ITT6ekHsWMSEBpJj42Pv5SWMtZz9Oi1Lu/RONGFfF366ZfAymYt1eRGOQ15HK4vVr3qWQHmoruHIqNRHa/cmzMYgXE1B+/o7F0l1vHUuRz72c1o4PIDNOIieef5sHGf9Jphv34L3OahX3A2/+OSc6gxqyhR5/l0VT5QnLuJrpNpANihvxPBAwumS3ZC9wTTlsUQRyzhbOmoWaiEnUHVY56fbQmHlQVbm5WVctSGjU3pJKprDjNRnX9WHWsj0f4ogz7MFzqsL5k5/l3GMwnw/rPbFm+vxwGR9KihLtjqJ2C4MbpDWOvG5qDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0KJZb0cBaDHYVKhL+QyoIbQwRNSjjC0HpG4cujrOnc=;
 b=DivS+DNwk0JbvB0ef2Q2iUkZTgHYv4Bc/LkYtWVPxpY72Y+KyLsmTerLLQ5tOnTCZscZVR5+1Xr6/9G9qAeDaw3u+fj976lOwXi3Gt82/7riKZPefJuUGgxLVfd3MyEnkl909QYBljJhZ5PMZHF8XS8lUu9ADUmctemiuR5yqnE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 14:16:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 14:16:36 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-soupsieve: Upgrade 2.2 -> 2.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210319171304.28090-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5040a802-c6ab-b04d-80db-293d9e07335e@windriver.com>
Date: Mon, 22 Mar 2021 10:16:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210319171304.28090-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0702.namprd03.prod.outlook.com
 (2603:10b6:408:ef::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0702.namprd03.prod.outlook.com (2603:10b6:408:ef::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 14:16:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f10e1c3-cdc4-4624-e486-08d8ed3d1a2e
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB505349DC4B3A86593A2CFD149F659@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oT76HykZkyOmVBMr6AY5YjwqkOAEaOpj4SFklbuAfCXJ4eNWjA3ebz2797hIMXUZbZgurdmeIZOVvoaRdTcoRmuC/9RiwYBKw/yElJbP676keZPKHuKMzrZlqUDpxlOxDDyKiGy5c+ljs3Yu0i8F9VAzjtf3eCBokfm80stZcpbC1ACNWgneIQclNFh1/1dCt5Dkkc3JX8+tJfkQEWkaOS+tiKFAF2S9Q7siAnfPBvAt9A9VgBeAryc7NDx5D0yf2mTL42eIjHM+1ghe2Hn7J2Wr2o9C/VOnSaZs3thTBkPT6op3hT7GsKyWaJT6YLEejDVlErqeyPc/i8EqQp3qyCAPE3Wb/uispnDFdbFg6nFUWE2lyj6HlPFIDOpHKuYKw2MfC+JrfW7cVeMdRrtUBj13wasKG4LGcsOhfmWkvosdwtIDRQa4M4smcqDMmY6XmpOuLJAhcI/nuMPWGifIbzByMNlgSuRumPZ80dn2mImCgoUeXME4Vwdrh7ftHXuzk1dqIn08t/Vht72xff9PA9UFcIdaPvUHIatnfE4Yv54SoeTjqckcyxN342qFKoF9Cu6RRijEjXeWxoxOJGfeJQH+BBlRlREQDPzN8Dhju46ngAE59N3J5sRyqE4ZjGnC4N+0hfR27Kw11HwxXUHmCI7GZ/e9r8BHf696pVSSJ3WIrQepfePM0RrtUvPTUDyo5V0/8ab/TpC3XNWNdKUuVqFQqdtDwQawIT2mOadlfOV0uejTBhezILqhHUxMlGp0T3j93jkwq8O8bfkM/mHdn/z7J+brSP2XSdaW31Zy+aI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39850400004)(366004)(346002)(16576012)(8676002)(31686004)(316002)(44832011)(33964004)(38100700001)(53546011)(36756003)(6486002)(83380400001)(186003)(6666004)(8936002)(5660300002)(66946007)(166002)(26005)(31696002)(16526019)(86362001)(66556008)(2906002)(478600001)(66476007)(966005)(2616005)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?U2hUMk0yaVFENmcrSzgxSXY1Q1Q3RE9ibHZ5SkZCdzR4VS9tSUZ3blJPYXFM?=
 =?utf-8?B?NCtHUnNRSHJScDJKaUVYMkV1M0xHalVtSXh1K3pkM1dwNkk0NGdPQTdQZ2to?=
 =?utf-8?B?Q2prSEt3TlJHSEw0ZGRSSGIza200Tkw1T3ViWG9lZEJWUi9GRTVEcWRJZnlH?=
 =?utf-8?B?YktRZUFGMzJxcUtpZStyZmtnSEdNRVBDUWsrWFFvS2NIbk90cEg3eEJIQkQ2?=
 =?utf-8?B?TE0xNkYxTGkyclFOdHhNWWM3Rnd0WVdUY1dlbmt3dUh0Y21YUXpyVmVDZ1lW?=
 =?utf-8?B?Ync5S3VQUXRTZzlRSFAwa1ovNkQyMytubTJML1NVYTBwODErUUIydlA0Wk5v?=
 =?utf-8?B?V2tJUm1hbktZM0VGYnhtYnRJWlJITEo1WC9uYzFNTk9STUYza0l5ZElOYVpo?=
 =?utf-8?B?d05yQjZIa1pBc0I3N1dPZSttWWhOWnEyMW9VTEZOYTlWaXRaQW1OZGdPWnlm?=
 =?utf-8?B?dmlmUHhxTmhhV1VSYnBrVTlhdlhvVjNaVXpBaXZKOEloeGNpSDVZclErMk01?=
 =?utf-8?B?V1BBVnBxZllFTG5DZDF6MXFOOENBdTlvY2ZMQUxFNUhwWEk1cmdNMkd0dDRN?=
 =?utf-8?B?NXNIdHlpa1phZXRCWmUzT21XNlJQb2xKYXkrcStiakNIblVmdWg3MXNsOWFq?=
 =?utf-8?B?K1dVQU4vcnpyV2lZOGtkODdxdlJ4TmR1VWxYUW0rQTB1R2RFY1MzN1A5V3VJ?=
 =?utf-8?B?VDNvTEt3NE11cFlHVnpJWXozc0Z5MDJvdk5yNmdkakhoM0c5SzJrRkVjYlpF?=
 =?utf-8?B?bHkrc0FwNnEvMUZMRGVDdXFHVXZSbHIrOGNzcm0vNnpmQ0gxQkRUbjlodFNy?=
 =?utf-8?B?TTUzQ1JCa3ozSkhmQ3VGYTlKVzFMQWdvbUpsTmdOWUF3YmRJZWZCZ3BXeDFY?=
 =?utf-8?B?TDdtTzV0ZDNEZkZSZXN3b0NWV2pmc1plaWk1c3o1R2QzdUNkb0owSEhzTHU3?=
 =?utf-8?B?ZUM4amtwd1lkd2tsMm9mNGtBN3lyTEQ2Y3JUcmJncWVzVUhlL2RSZHBpR2V5?=
 =?utf-8?B?U3owWDFPQTN0WDQ3VjFYa3dpdXJIakg3R3FkQWk1dDhIRkxydTY3bVlZNjZu?=
 =?utf-8?B?ZWhpK0VUV045OUtFU1JVYndTd215cW1ZZkxYMHo5UCt3MUVRNHdiMm1YS1JM?=
 =?utf-8?B?QUI3NXU3UEk1bzlXL3U2QjMyM3duZUtycDhIbmRjWHlJYk5rSzN0TVBHd2Fp?=
 =?utf-8?B?dDdpaUNWaFhWUFQzNktNaTRZN3lWVGQySHZZM1JOb2J6YWZBOXFrWTNtL0gx?=
 =?utf-8?B?emY0cHlHMUsvUXNZT3d6WHlER3hpT0pPanoyZlBad2l5K0dZd0FRaDVWbVhH?=
 =?utf-8?B?N0krSGtwNHhqQ0pxUGxEUkxGenQ3T25IbVRsMjNvc3orRnAzVWxDMzFJNjRn?=
 =?utf-8?B?SXNOTGV1cHFnWmpMTkJybXdscDYydUVucmU2emQ3UVNDd21HQ3MvUTVWTkJj?=
 =?utf-8?B?UnpSQnpTYUlpRTBURWVyeGQ4YXdLUGFxeUMrUVZ2MkNTVlNxcThsWUdDbDVm?=
 =?utf-8?B?Zlp3cWU4QytzUWR6SHhIa2ZTT1ZPMXBuWVRQZkNOY3FKYkJ2REdPemdoSUVG?=
 =?utf-8?B?b0d1ZllBK2JlVUNrUWRrV0RDU3pjUXUvbGt6azU1N1FHNUVRTXZOSDhOSFFv?=
 =?utf-8?B?WjN1N0k1RmtRUjNxN0xaTnRSRTl5TkVIUDBPV2g5SENjQ01UcDlHMmZTb2ht?=
 =?utf-8?B?dlJoSGhRZkhUUkNWcWFSazNveUFpZWN2ZHM5QWVSRFlic3k2Z2xWdTlYMk1R?=
 =?utf-8?Q?KW4tG8b3nlYPKJ6iIXSrQuzLL5TW4T3rd5vFPL1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f10e1c3-cdc4-4624-e486-08d8ed3d1a2e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 14:16:36.6380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GuLlZ7UUQLlJPoc7zfX4199NpNSHFC4343ETa0TcMyuNpy4yLQ2uhDmSeWuyMCLMA0Q7VgDWMOCDcCxLuJ0iLr483DWuqJ3c/Mr9AR0bW6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: multipart/alternative;
 boundary="------------7F6FF57C30E9CC2443446971"
Content-Language: en-US

--------------7F6FF57C30E9CC2443446971
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-19 1:13 p.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.2.1:
>
> - Fix an issue with namespaces when one of the keys is self.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-soupsieve_2.2.bb => python3-soupsieve_2.2.1.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-soupsieve_2.2.bb => python3-soupsieve_2.2.1.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
> rename to meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb
> index 9507f60d7..93ef04f14 100644
> --- a/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=33c3a77def9b3ad83e01c65bdcc1af67"
>
> -SRC_URI[sha256sum] = "407fa1e8eb3458d1b5614df51d9651a1180ea5fedf07feb46e45d7e25e6d6cdd"
> +SRC_URI[sha256sum] = "052774848f448cf19c7e959adf5566904d525f33a3f8b6ba6f6f8f26ec7de0cc"
>
>   inherit pypi setuptools3 ptest
>
> --
> 2.17.1
>
>
> 
>

--------------7F6FF57C30E9CC2443446971
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-19 1:13 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210319171304.28090-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.2.1:

- Fix an issue with namespaces when one of the keys is self.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210319171304.28090-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-soupsieve_2.2.bb =&gt; python3-soupsieve_2.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.2.bb =&gt; python3-soupsieve_2.2.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb
index 9507f60d7..93ef04f14 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/facelessuser/soupsieve">&quot;https://github.com/facelessuser/soupsieve&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=33c3a77def9b3ad83e01c65bdcc1af67">&quot;file://LICENSE.md;md5=33c3a77def9b3ad83e01c65bdcc1af67&quot;</a>

-SRC_URI[sha256sum] = &quot;407fa1e8eb3458d1b5614df51d9651a1180ea5fedf07feb46e45d7e25e6d6cdd&quot;
+SRC_URI[sha256sum] = &quot;052774848f448cf19c7e959adf5566904d525f33a3f8b6ba6f6f8f26ec7de0cc&quot;

 inherit pypi setuptools3 ptest

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

--------------7F6FF57C30E9CC2443446971--
