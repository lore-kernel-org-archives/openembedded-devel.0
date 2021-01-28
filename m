Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.79])
 by mx.groups.io with SMTP id smtpd.web11.24023.1611839306822389892
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ihLUhxpf;
 spf=pass (domain: windriver.com, ip: 40.107.223.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYdBvCtpiKK8+wm2DhVhQ0dth4GPEEssKImCxnPObp4eAVm6//HF3tc5FQwx9y39HAd+02fEhI4BGAFVV41iMlgJBfg5+ppKYWgyaKY45VJN8tUr5UGkKaMUJ3y37V4pHSThGQNmk7G9POEv6yLxCS670AXznSj/okQ71nCsWvST/lEGyHUCdOkGANWcQY9vHMNrooNudYgQ+vPBHbXjyWDu5//ijlVAQWqFnuGPxYI2hqMMD2rIz620m8gjjHLqRtghzRXOcq4+miijgvG2IyQ6pOZkrrRF/8MibzLAG2M5kXcaXXUZwzbTMzS0XEBZgsBcRynUkPghl0JItH3NsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RM1Kix3IxlW6YYDOWdrU16uuqQLJILAAhexFrXvDT60=;
 b=Mn14Slt6oiBHZIPLATmf6pzXrQoj7/qwpjasAu1C3Y5Td1zxR9+BXl/mzsdCiIXTUsOeb60jkNqJbUrcs/DcnEvjlQ1L2uu7uksbAHiXyuk8HJj4KWHQ6CUZHbirCtDdUuc8PEzII6+WMwzjdTOt2URQHBfzYrz5p+Sx5czJr4HxQj6/wZARnEkZxeU2GEeHbN6XWQllyJd5atRqXpQmRxyx3bn71lb9p9cGAz+k1MDh/EAF43uwL967BB5qJp3WHzc1c+7JPX0YZGg0v0S5geb1eYi/9F1PAgbxeYD3BCYWzV1YfGeM7kUq4xH+7ahpHgcwBW6KgZo89DReIA7onA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RM1Kix3IxlW6YYDOWdrU16uuqQLJILAAhexFrXvDT60=;
 b=ihLUhxpfZaWF7K6ZU6opl73Cg2rN1U7ihiFP2IgvryodfSOAC9AvyPBmEfEIUd2VlQ0nGOK7EOiFp3/aBkM/QLvvZQfmIpOWbcevmZ/D6RoyaTUefNbUnlP0WqC6Pd4V7hpDiFIAaaXoI4ZjYQP1b2QFFlXsHvknDHTOgMpuPns=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:08:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:08:25 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-xmlschema: Upgrade 1.4.1 -> 1.4.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210126125003.27620-1-leon.anavi@konsulko.com>
 <20210126125003.27620-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a472f93e-cd63-eac0-f825-5b36bc74d80c@windriver.com>
Date: Thu, 28 Jan 2021 08:08:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210126125003.27620-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR14CA0018.namprd14.prod.outlook.com
 (2603:10b6:208:23e::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR14CA0018.namprd14.prod.outlook.com (2603:10b6:208:23e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 13:08:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8dfb550-80c1-40e4-a5a4-08d8c38dcc20
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951C0FEEDF6B6D6FA7D6A8E9FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rqW3bklWRHTVgsDUM3JpR0cdIvpllNV09ifbcxmb0L45Q8Zldii2iE2UX/kN3ssN79qRaNZLukgPO6hv+he5pucZ9zQ4M80Nux6lMCLTFnH7TtsYxHNovwwazqvFlE9jpdbA2urw/7Iy6876hdirzV905mNs2U1JTaVu8GN4RVGWEaRBpxSJgr49WgGpgTeB1T4ufRwpUd1OC9Y+stDNAVwooyjlXVvs7F7VV5wZUn+481+2qSnM+C9GEJmiqRnMwaa1oe3Aykv0gDkT20gx1BOHwrw0fxw2X8nz2IxQC6BLntVirW9s4w4SFcftWIEGiiWqDUhS9JpmB8NuJMws0pkVNKx18azRN/q6eFGHLe4CxfU5NmDDMAMFhakxr1OItaOCWH/qK48Qy/IeZphWTihu+Fzxr35+VMl6f8wTPet8RVN6W4XQuaOjPpAnIAFYhv9aEVltqwFjDExjjJTh5xPW/4TlZPy/Sznd6tz/DDhrXo5Bj/nADm7/VU8z+Gw2nIIfYiInLdfgVqPQidl4L4vugvtf4LZ4aLg4peLG8+yXg1ytItAtOiSN5RmPcbKlFY8h8zBrntJA+H91/s5Ac1hzzICVvZvcdltomhuM0d1Ix4ZsTi8ez/lNXKzzyvJXkj1Z9mJ3M9NU9TiJFrtznXSn+MklHdYQL+7KiHW17zZwVBN0J0VtCv3GhgVveVsW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SjdoR2dEa1ozSDRrZWVNd3ZKQzNJbjE4UlJMcm5vS29RN3Qzb1BieXo0Sldn?=
 =?utf-8?B?Uk1QdnNGUHp3QkxpR3NxOVg2T21kZkR2OHU5dDlpVThyTEZsVVlKRUtTazBz?=
 =?utf-8?B?VWVBVE0wL1prT3FoSi82ei9xWmtpNmwrN2IyK3FDZWVFcE83VjkzcVE1RkpH?=
 =?utf-8?B?NjZaMUx1d0dUbzAxS2NnK0REaDExQzA2Z1FuT016dDN1M0Y3SGRGZzh0MlZ5?=
 =?utf-8?B?MnNBSzBjR0NHMytIdVRENW1xQU1lOCt1VUJSZmpvUFU0VGtzOGVXTFpQZnBD?=
 =?utf-8?B?dnhMai9Sd1A1eG1TTlZIZDNJR1lReDUwNkdvbWxyRkt5bTRVZ29YbzVQMFAw?=
 =?utf-8?B?alhuSjRkVzdENmNKQnpHRDlsS0llSERYYnNrRzQremxneTgzNUZ0c1pPK0J1?=
 =?utf-8?B?SndBTFFOYjRCRDNBS3BDYW9kS1djcElzbkNrY01ycmF1VGhzRGlrNjNuY05R?=
 =?utf-8?B?aVlFNlFmVTg4dGd3a1FDUWpwMW0wRzJHSWwvTGc4SHRBZkIzWndWSVB3ZGg5?=
 =?utf-8?B?S0VTUG5XNFZ3VzIzYXdRbjlTUVAzeEVoTHZmNDRJNTVBeVdrUjhzT2dEQUZ4?=
 =?utf-8?B?N1NxMHA0TlNOSnNwZEF5cGgvbmFiVWVza2xsQ2ZSWHNLSTBabmhKYkN6c0x0?=
 =?utf-8?B?WDdhaElVaUZ2aWw4cDlaRFA2TmFBbk81M0Z1K3kwVVFSMmhKVlRlbGY1d0tM?=
 =?utf-8?B?QTkzRG9tdmRQYlNrVTcxazVrMXp2dmZua1hsZmtqNmsvSVNsZEl1N1ZkMm55?=
 =?utf-8?B?b0R5YnZoWjFtcWJrTSsvWHRjQXNocTdZTXFENExLdys1dGRaeHI1OEZjWjlB?=
 =?utf-8?B?VzVEQjYybzFDSm5IbGl2OEszdk55cm0rbzhEZks5d3QyclYxQnREbDg3RW10?=
 =?utf-8?B?WDdrakJzdmhsVW9MdnEzVUduMjRrWFM5RHRLdkpsWTdPbFAvU3F0aS85d1dT?=
 =?utf-8?B?K0Z0SHRVbXN0Sm0vYjBPblBZa2QwZnlqMThYVEVjS2VPSzdYNVVML29nSDRh?=
 =?utf-8?B?d2FwUDRpWG5GZVlEREYyY2J0M2RpMkp3VzFYQnRyMmEra1JJcHNZSlhjVTg3?=
 =?utf-8?B?MVg5SGRLRkhTTGdRLzVhVkdhVXI2c280M2t0K2JJWkJhWFE2WFBUTUllRFRo?=
 =?utf-8?B?KzBLN2NDS29WVTU3TjJYOGJwTUlscEJHV1M3RW5EdlZoRnhxYTRZYWt6TzB3?=
 =?utf-8?B?K0o0OVJ5OU9XVEJhRTlNTVRHSk12cXZnNXNvNjFFdkpSZDg0VlZoM0NET3JE?=
 =?utf-8?B?ZXpDcVhiV0MwMGxjWDkwTE1ZTUU5dERFSi8vc0RBRHM3Nnc2VmdUTmdmTy85?=
 =?utf-8?B?SjJrT1ZmYStVOHM0R1Y5SzZheHhmV0NQZzlldDVVTFplYlBxSkU1ZkRNN25k?=
 =?utf-8?B?RTNKeFlDTmVzQTlzWVNFSXlDL1lpbkErR0NSYUpwMXRKcTJOS3lDYmc1d29m?=
 =?utf-8?Q?+EvX9kkF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8dfb550-80c1-40e4-a5a4-08d8c38dcc20
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:08:25.6551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycxZIKdjFtaY3WrTWwpVIHd6rkt540SiusbQuEijENFXasIzL6lPGXpAoUIlid3hDpKqY1aRqmEulqKnjUly2vK07HfhxcRBW7QTrdsgFcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------68C7A3992549B79EFC3DE467"
Content-Language: en-US

--------------68C7A3992549B79EFC3DE467
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-26 7:50 a.m., Leon Anavi wrote:
> - Add decoding of binary datatypes (xs:hexBinary and
>    xs:base64Binary)
> - Fix encoding from string values for some builtin datatypes
>    (decimal, binary, duration and datetime)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-xmlschema_1.4.1.bb => python3-xmlschema_1.4.2.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-xmlschema_1.4.1.bb => python3-xmlschema_1.4.2.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
> index c60993105..055a82d4c 100644
> --- a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
> @@ -3,14 +3,13 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
>   
> -SRC_URI[md5sum] = "f4c46f8c4415a0ca31dc2f623b668664"
> -SRC_URI[sha256sum] = "ade693114ff2e4a9ed5a2371ce29ae888f689bc58e326e5796f8a7dc8954dd4a"
> +SRC_URI[sha256sum] = "f372005d08dfc231ce7f001c3a7a2c7f7ae138295349268bc551a9df3c700b82"
>   
>   PYPI_PACKAGE = "xmlschema"
>   inherit pypi setuptools3
>   
>   DEPENDS += "\
> -    ${PYTHON_PN}-elementpath \
> +    ${PYTHON_PN}-elementpath-native \
>   "
>   
>   RDEPENDS_${PN} += "\
>
> 
>

--------------68C7A3992549B79EFC3DE467
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-26 7:50 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210126125003.27620-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add decoding of binary datatypes (xs:hexBinary and
  xs:base64Binary)
- Fix encoding from string values for some builtin datatypes
  (decimal, binary, duration and datetime)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210126125003.27620-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-xmlschema_1.4.1.bb =&gt; python3-xmlschema_1.4.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.4.1.bb =&gt; python3-xmlschema_1.4.2.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
index c60993105..055a82d4c 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
@@ -3,14 +3,13 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/sissaschool/xmlschema">&quot;https://github.com/sissaschool/xmlschema&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f">&quot;file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f&quot;</a>
 
-SRC_URI[md5sum] = &quot;f4c46f8c4415a0ca31dc2f623b668664&quot;
-SRC_URI[sha256sum] = &quot;ade693114ff2e4a9ed5a2371ce29ae888f689bc58e326e5796f8a7dc8954dd4a&quot;
+SRC_URI[sha256sum] = &quot;f372005d08dfc231ce7f001c3a7a2c7f7ae138295349268bc551a9df3c700b82&quot;
 
 PYPI_PACKAGE = &quot;xmlschema&quot;
 inherit pypi setuptools3
 
 DEPENDS += &quot;\
-    ${PYTHON_PN}-elementpath \
+    ${PYTHON_PN}-elementpath-native \
 &quot;
 
 RDEPENDS_${PN} += &quot;\
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------68C7A3992549B79EFC3DE467--
