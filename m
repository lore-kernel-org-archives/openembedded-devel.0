Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.58])
 by mx.groups.io with SMTP id smtpd.web11.7804.1614177665246930385
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=W0v24ff2;
 spf=pass (domain: windriver.com, ip: 40.107.76.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOaLWcCJp2b/u7xu9f1z90C+bbKc0Bnj4otknbhiZrJCR8YmK+r5qscPZirvEsnDH0ynNQ/Y3H0tmb07H6cKoESFIrIVYF5yCN5raK62j1kqiz6AjC7UECUgbVBSO67JWTt2zNe0myBLT+HjTok5OdIz1JumuOaZ2WLFw8pVdU9UYdw4BBN51EEAfhnaWpau3FJ8w7QEbqAt6rzDZ+zyQ45r7R5GHvFbjdLHwyLIlev/5eNr3TaqrFd9pMrPotxP3eZdnRiFfHEwqXwtJR6vYa2QFSoiBh13otpNyn71KFNj5bVLBRfFoouW/g83rh3e3uTEOsDN/lZktdm2efc/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxoivvS5zUDSp2iqMeLPkdRkmMGP+PAm63rRRq1eyAY=;
 b=d+KKOi5ESo9Oft+rys6j3CFZ03XJI4XvOr24NLvrVI2S4LihhU0uNAE04Yg0BsPOUP8Q4/b6wtPwB7C3+waAa4cVd+9Xom1FiTBPi/pzx9cQezt+3wrq5cAq11WGXBCWODbLTMSr7BB5Y3sMEvfNuR1KJGcZDMEaJGH+BnAlK8Z7cMpM/KNF6mYlHsK1wDgkh35lhA/gP5Fn+wi5ZU5of7SfWcyYPWNF+D+Yc9944a+OPwljy8OOol6fGWIGRMXGfkGZc6FxrXMsp2GNF7S+S7EXIZ31UZQTF0bxGun+3sxuG7VPC1jRVBxylBfeF4LrcjungSjwz8DYARZc5wdzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxoivvS5zUDSp2iqMeLPkdRkmMGP+PAm63rRRq1eyAY=;
 b=W0v24ff2GpOw9c8H+C1dvUIPySMdX0mFA8tolKRx0SmTEg+MpEMiJX7DbaUNmAZaZwfPyBzt1lxS56GrqT32oHLBSq8gFA5rOmZLqGLN9mUn3UKqzpTqyzw45I2gYbGJ/jTLc+KHBjDChwkhOvBvDjNydxIvab8kexEGTlfg/6g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Wed, 24 Feb
 2021 14:41:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:41:02 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-mpmath: Upgrade 1.1.0 -> 1.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210222175043.21231-1-leon.anavi@konsulko.com>
 <20210222175043.21231-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d1cba5be-804c-baa2-2db9-497bf0c485e7@windriver.com>
Date: Wed, 24 Feb 2021 09:40:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210222175043.21231-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0911.namprd03.prod.outlook.com
 (2603:10b6:408:107::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0911.namprd03.prod.outlook.com (2603:10b6:408:107::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28 via Frontend Transport; Wed, 24 Feb 2021 14:41:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08ee2aa3-7545-4f78-eb82-08d8d8d2355e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3063405ECDF5E086815FFC549F9F9@BYAPR11MB3063.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9xHuxpAslToLP4GTN039N9Gk8h9EDCLzipfwuDSDcH00jrvALSRcO/UXzx/QNkJejla/ldr1c43i0MWbN9gqB7dZqhzwP1HF9fnJM3tx+GnhdWWJvYNQMyRsafNAiElMhwLzYUFMHh+Yf+cdAvOm9H8TghU9ZanUVFOGxEa2a8Zv2MDlcmpprdUcSs6amXL+IUMYjFi5LH8cGuRUu4ykbTHyKxRdxcze/OvAVxGitHuXgP8GP+6ZSyCJoUB00QZZ0dFkckD6ZZ7U18CF0u0TUpnyjeW+1KIDnkM4vrFIc/0LC8YGI6axwejYxRNzCAFiKass0+aU762j7eoj0zFnuFV1YzdhGp6cDbGEkcvQVX2RF0BLXcaiU5aiO+77Lu//SZofHYVRQvNmBHZ2d1FmyJAeDinpQG1igYBXQ4yGJTmi/w4RTB67qnEMoCtMjlwTbCV1d0xWTu6yefZ+0ksRpjctifl3R4XhFsdogkMfUSP7tBACw40I0wgMrt8UsE38FGdF0cwG4QExs24AvzAFM8nTufytNOunnwLsP0EqxcHfDA9F+WDwZeLtJ7zlC+TUj3s1KX7hHhuprXDbIj2uc38glAbxj32Qg0b9+QATGGo5drsE4upFbmHW6pnubqFh1CxIWMp6HmifmQCPhrznhMgp/ZyUYe2qexb/Ttzdh6/cCyeSaYWf18oCUR52mPPv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39830400003)(376002)(366004)(346002)(136003)(26005)(8936002)(186003)(31686004)(166002)(36756003)(478600001)(966005)(53546011)(16526019)(83380400001)(6486002)(8676002)(2616005)(316002)(66556008)(956004)(2906002)(44832011)(66476007)(5660300002)(66946007)(86362001)(16576012)(31696002)(33964004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZXllejltVGdnZFRjeGZyYWc3RHRxcytLMEYwcTU0MWZsQWFJNW95dDhqZ3A0?=
 =?utf-8?B?YzhTeUZMYzZ6dmcwSWRWb1VZd1RwVEpCa1I5U3FSZjVOQVl4S3NwQVUvdndF?=
 =?utf-8?B?azRhZzN5Z0VOcllzcVh4WXM3MW9zblVaK2p4TndUL3VYci80Zkx3b2xzS1BQ?=
 =?utf-8?B?VzBSV3V2Z3ZqREo4cTk3S1h3K1FEbWNGOUtMeEprY04wWk5XWlJaSHpNODZL?=
 =?utf-8?B?ZzVMcUI5dmRxMFVXblNTL0Mzdkg1bXZXSm9kZlo2UGhjZXE0b2JnNVdVMU96?=
 =?utf-8?B?T3FlOHIweTVLSkZ6dWxqMXpBR1YzM1MwU1gvcHUvam5CdkVTbTVkc1BYY1I3?=
 =?utf-8?B?UnFRc1lzcFd6VFNSbHZueTBxWXZZS01PMTlyZWthUHB4QTJ0S0RUYXdVOStj?=
 =?utf-8?B?UzNLSzNtNnMxblo2RDRMYmJpRkdadHhOOURtakZCVW1DQ2ptaTVQSnh6QUFx?=
 =?utf-8?B?WUxLOFlzM2pjOHRqbHhxUTE3czlSZXhJSnFNSE84RHQvaXA3bXc1MmxNN0Vw?=
 =?utf-8?B?L3U5ak01Y2JZdlBKTU1LSGlqWi9ORFRZUzA4Z1d4RWJJVWhKV1hpN2JlVWkr?=
 =?utf-8?B?WlowVnFJZy9IUXliYnZGdS9rYWZqL2k0c1dFWDlHcnA5T1I0SWN2aGF1aXBq?=
 =?utf-8?B?Vi9lNDhySEhwNWR1UXZkYzJwdXBYSndiSnZORUI5cG5VOTZEaWRtbTVEM3hw?=
 =?utf-8?B?dW5sOXNEd0lremVLOCtZZzMyOUtEZmFQV1VHZzBZemZkL1FmY2pOQlJvTVhL?=
 =?utf-8?B?NytMNnNXZENITWdEejR4REJDcVlSUHhMd3dXZm9iRm9FcDYremZFc2RDalZp?=
 =?utf-8?B?WUxkL1drRDBVb1BIRDNQejlaWlJROC91ZVJzRmdzL29VYmJZSUtvL2xvQS9j?=
 =?utf-8?B?bzRJb0w3QlNEd0hySmtvZkhVS0ZyWk9VSXY4S3c2VVM3V3V5dzJSUlJNWUJk?=
 =?utf-8?B?OFUwMFpKcmorMGNOVUxCWUs5QVRjS3BuZnpKZzNVRFgzOXpyNm4xM3B4S0cy?=
 =?utf-8?B?UU1VZTNZbHN3L2VUaXhOMmdWUEx6UGljeUx3cEJMN0lvTGZyUmlaOGJ0bzZQ?=
 =?utf-8?B?bUJydW5ONVVucDE0eFpRTkFyNHRBVEtmOXVTVnZZRDVkYmQ3U3RmSno1c2lY?=
 =?utf-8?B?Y0gyTEZFdXdoenl3d0FvOUtFYzBLYStBUkhtTGFtT2hKMWN6YVErSUh4V3Jn?=
 =?utf-8?B?UHdwcXlHS0lhZnNLRTU0aG9SZFZlRVFkSUVWT1NQekE2U3ZyOTA4RTB5aTZY?=
 =?utf-8?B?TENrY0FoYnpwakFWeWlwOXB4WGNncytDbmZLRFg1SzhKamI1TmdqdVBUd1Rv?=
 =?utf-8?B?dDNGZ1dsUUVuck9VRXlpZXVJQmRIbWlVL3RoSlhscHdodHp4OHlYMFUvZVhr?=
 =?utf-8?B?UVgxTmY3MWQ2eVJ3eDc4eUkwNG9HeXN6c2lObHNuTVFLblBzYnNaRmpheHcz?=
 =?utf-8?B?TzVXcWIxeDNMWHBoSWVuLzNRdERHZTd3aGdFdUlpMy8vTkNHeUgybXlRVkhs?=
 =?utf-8?B?Zll2T21WOEhPOEJ0QzZnKzltNkxZa0RhOVc3OTF6b1dMWG1YZWZjYkpHZTN0?=
 =?utf-8?B?ZTJyQjZoOEZlWU1pZmYwdk9kQVJUdUF5Mms3OW1ZQlNTczNTbFZ2OEVqM2xL?=
 =?utf-8?B?RGc5cHo3L2lVa3FCN1Y3NFZGUlI4RHBKZjl0YXpSN1NOU2V5NGwydmJHOGh2?=
 =?utf-8?B?TFFlV3F6ZnErSUIwUGtONEJHUFFTN1laU05PVzNvYVl3Ym1ENlovV3hWR0ZS?=
 =?utf-8?Q?ebZ13NaTKdFFy5CTokTU4sKxRJvO+qIBUuV8PXU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ee2aa3-7545-4f78-eb82-08d8d8d2355e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:41:02.5098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CigD01WlrgFPQ4kshXTN28r8un9Se0gTpM2+lywOBOvZS9SzdtykNVAyTvMliRawiLMJzFGAfvttsYPDQscy5d2qbjuHC0bHTi9KJZurw40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3063
Content-Type: multipart/alternative;
 boundary="------------908145B1DC6FCD052D27ABF7"
Content-Language: en-US

--------------908145B1DC6FCD052D27ABF7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-22 12:50 p.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.2.1:
>
> - Support @ operator for matrix multiplication
> - Add eta() implementing the Dedekind eta function
> - Optimized the python_trailing function
> - Implement unary plus for matrices
> - Improved calculation of gram_index
> - Fix a possible division by zero in shanks()
> - Fixed indexing errors in deHoog, Knight & Stokes inverse laplace
>    transform algorithm
> - Corrected branch cuts of the elliprj() function in some cases
> - Fix initialization of iv.matrix from non-interval matrix
> - Preserve function signatures in PrecisionManager
> - Implemented float and complex conversions for ivmpf
> - Fixed issue with scalar-matrix multiplication for interval
>    matrices
> - Fix estimation of quadrature error with multiple subintervals
> - Fixed a problem with the defun decorators
> - Fix eigenvalue sorting by absolute value
>
> License-Update: Alter the last clause to ensure that Github
> recognizes the LICENSE as BSD
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-mpmath_1.1.0.bb => python3-mpmath_1.2.1.bb}    | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-mpmath_1.1.0.bb => python3-mpmath_1.2.1.bb} (63%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb b/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
> index 7879a85cdd..51a7c05847 100644
> --- a/meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
> @@ -4,13 +4,13 @@
>   SUMMARY = "Python library for arbitrary-precision floating-point arithmetic"
>   HOMEPAGE = "https://pypi.org/project/mpmath/"
>   LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=efe9feb00df0b763941f2b1bbac7c402"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=71970bd3749eebe1bfef9f1efff5b37a"
>
> -SRC_URI[md5sum] = "acb1cdddf38e16084628065b174ddbfe"
> -SRC_URI[sha256sum] = "fc17abe05fbab3382b61a123c398508183406fa132e0223874578e20946499f6"
> +SRC_URI[sha256sum] = "79ffb45cf9f4b101a807595bcb3e72e0396202e0b1d25d689134b48c4216a81a"
>
>   inherit pypi setuptools3
>
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   RDEPENDS_${PN} += "python3-image"
>
>   BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>

--------------908145B1DC6FCD052D27ABF7
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
    <blockquote type="cite" cite="mid:20210222175043.21231-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.2.1:

- Support @ operator for matrix multiplication
- Add eta() implementing the Dedekind eta function
- Optimized the python_trailing function
- Implement unary plus for matrices
- Improved calculation of gram_index
- Fix a possible division by zero in shanks()
- Fixed indexing errors in deHoog, Knight &amp; Stokes inverse laplace
  transform algorithm
- Corrected branch cuts of the elliprj() function in some cases
- Fix initialization of iv.matrix from non-interval matrix
- Preserve function signatures in PrecisionManager
- Implemented float and complex conversions for ivmpf
- Fixed issue with scalar-matrix multiplication for interval
  matrices
- Fix estimation of quadrature error with multiple subintervals
- Fixed a problem with the defun decorators
- Fix eigenvalue sorting by absolute value

License-Update: Alter the last clause to ensure that Github
recognizes the LICENSE as BSD

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210222175043.21231-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-mpmath_1.1.0.bb =&gt; python3-mpmath_1.2.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mpmath_1.1.0.bb =&gt; python3-mpmath_1.2.1.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb b/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
index 7879a85cdd..51a7c05847 100644
--- a/meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
@@ -4,13 +4,13 @@
 SUMMARY = &quot;Python library for arbitrary-precision floating-point arithmetic&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/mpmath/">&quot;https://pypi.org/project/mpmath/&quot;</a>
 LICENSE = &quot;BSD&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=efe9feb00df0b763941f2b1bbac7c402">&quot;file://LICENSE;md5=efe9feb00df0b763941f2b1bbac7c402&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=71970bd3749eebe1bfef9f1efff5b37a">&quot;file://LICENSE;md5=71970bd3749eebe1bfef9f1efff5b37a&quot;</a>

-SRC_URI[md5sum] = &quot;acb1cdddf38e16084628065b174ddbfe&quot;
-SRC_URI[sha256sum] = &quot;fc17abe05fbab3382b61a123c398508183406fa132e0223874578e20946499f6&quot;
+SRC_URI[sha256sum] = &quot;79ffb45cf9f4b101a807595bcb3e72e0396202e0b1d25d689134b48c4216a81a&quot;

 inherit pypi setuptools3

+DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 RDEPENDS_${PN} += &quot;python3-image&quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;
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

--------------908145B1DC6FCD052D27ABF7--
