Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.56])
 by mx.groups.io with SMTP id smtpd.web10.1898.1610121867437164812
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B+CqEmMI;
 spf=pass (domain: windriver.com, ip: 40.107.243.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlNp8mDdvymhINHgOcLOh4b8n7YuV8abn80gQW5h3JIng61g1M74rhZQRuvqWqMs+vYd/Q3WFOi/j2N2Ls/WyKjkUpcSy50cJsns6gYcPMZO78URolQehVpEffD079v3CJDcm2D58Br7TzBlpW76rUG0j2u9fjUH8TYPKhjLp5wal9nMzMz4m+b2oIoSimVgBkgik/gu9bf/hm0iOLZof6ry4FhB6sWTDpi8Ek4vwFah4QqK5MNJs4XZzoYy9pJVaAXSMLmcmiS7GO3rqfmBgd8OzyjuQPdeTReob2PYK8H8J2WIo0xbaA9sHHLr5suWzWkCYFWxq8uV1bnomAODLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2Pp6h+zAGdOtH+tVFaeiTlrzdqantrIW6RVcPManDc=;
 b=FP4cfLoueZ5D8NyZKDhgUJ9pQ8oW1LXXcXCWNnCM7sgQtOQ7ghJYrmpScAe62vJrSGS/q/dRxnspM4lVqjedRBEUrl5Q0+WeuGH1Ijs8jnbHukk/edDsmdnWQSLkuNSuYlnXz8YOZpQxmSAY3rhkjG32k/JydnPIkiGjBEXladOSKPssYGHm4hQJr7YWbvhzeV+/DHNZAmST94O+j6N/p1GB21NVkWkt33QvjR1sHSjm4UOjJn+///sDfLSOXPSHwb4KHN7RTOAQ6ufL7TPB4Cu2ofOllqZKds2TcF5wHPh2V/CS96C2nXNF4nbgcEWxg8UUCto29vm5ZwOskpeXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2Pp6h+zAGdOtH+tVFaeiTlrzdqantrIW6RVcPManDc=;
 b=B+CqEmMIQCpUeu6FPAQJJbPJycbzArOi2Nyiz/oiYJM85BZBVtai756JDDP2ySzvD19Rm/Yem3UKKLd5NP3f+AWTDIbTwL4JmTYgiPAATXOVOrcfSEmPDH6SaG5gb1cGVRk4T3sA18DKR7JNt3l9ejSbDKofKbEmOHe2Orfzbhs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:04:22 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:04:22 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-pychromecast: Upgrade 7.6.0 -> 7.7.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
 <20210105151638.15700-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e83e9eae-aa63-1e3d-be5d-50826c93f790@windriver.com>
Date: Fri, 8 Jan 2021 11:04:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210105151638.15700-7-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0002.prod.exchangelabs.com
 (2603:10b6:207:18::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0002.prod.exchangelabs.com (2603:10b6:207:18::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:04:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54cd48f4-22c4-445b-f78c-08d8b3ef1068
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48967348CB8B96AC8433E61F9FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JFsfEz2x5hOXYBjEkFd5ox42OS3joOVcMPQNQ+i8LogiaIV0ipSKb0qmx+tzT5waHyvvPDnc7SnPOD4Gv70wNfqTOU32p1C0wyL4KEFaciK/vWFjL6glpE5gaEz28vopAMwjymskP6+MkkAyb9sNW3dX8+iAUyN3mwjx58RLoOfVDZTnmCZrTRxhw+m6N1kLtskq9Dt8zXHjIKoE6mR1DzYumAZQ2vFoL801DM5PZS/GCwS8n0Tb2/YsQoISwcffo94Ihfz/gEIjJUTZ58cVO2Wuqb25EDFxnJReCnkNrrmBtQMz1R0YLZnY5Wwe0+GeLe3T4iAtJojxL/dKKfGGrCCm7l9wTBk86SRBsHmP+syz8lrigGsHxDqF0WNGZrh6PCJ8ENakoV/EJwD68TMyVsS1i1M/Ql3/96/3Gni+dHbzL58jUba8M27MoD/aUfrHfgciGugzBjJ+py2xy151/hxMF1bpXlsLK6KXh3T2Z9khAj0PIur/meaMOQnwi/owng/5/MpXoRrADiSkten00A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?czdTcVV5L2dsRS8zWjdueXBYdUtzSGFUSUhiZXFod09jZUh1OHM2VkIzWGdx?=
 =?utf-8?B?K3ZNaHFQMVV3Q1kreFY2TnBMU1ZabUREY1c2eHc1TmxENzIxcytnOHVJeXRW?=
 =?utf-8?B?QWJFQ214V2QwdXBuQURJc2NqOVIxaWw0VGFKUWZLbmJxaGw3Z3gvMzdVQUR6?=
 =?utf-8?B?ZDRMdWJlVEZBRFoxbzUvcmVhUnI3LzEyUGhEaW1Ka1pQUG8xSGxRRHVIVXNM?=
 =?utf-8?B?MnpBeWcrZUpuN09BaHA0eDY4OTUzM2NzbEZCYUFwV0thUWFFMExvdEY5ekR4?=
 =?utf-8?B?SHJMNGRSV0lqcGNPaEZaS2Yzbng5UGxEUjBkbzhPcW96cVI4ZXMzOWY4YTVV?=
 =?utf-8?B?c2gweGkwcCtPTjhpNkJVMnpCZFNRSDdFNDJuMVNOdGFrY0pIZmQrRnFpWGpj?=
 =?utf-8?B?b1ZuaWRLZHRsbFg0N1hqdDRrQWZzWmVqZ2tXZ0dreUt2S1hZMmJseTl4RGh1?=
 =?utf-8?B?WU82aU9hYmhtaWZCVzhFQjlCdDJvb2RpNFFOUmxPN2tFNnBKa05VNTRobjFy?=
 =?utf-8?B?MWdTN244cEp4TUNMSG80ejJodkoyL1A1WmhqVGZEWlN2U3hmTGEvVEd0Mjcz?=
 =?utf-8?B?TlVYTk5rb0RrZ1N6MHd3RDRZUktPVUdyelhvR3p4Rk40cjJLVDhlTmlOUCtm?=
 =?utf-8?B?bHoraUFMR0o5d05GR1BWZ2o3d3lCcmxwZmQrdGVydmhMMUZBb1BOQVJBeDFD?=
 =?utf-8?B?ZVJhUHc3VkorUlhaY1dUUng4aDdVQTkwbStWbTlzR24yTyt2Z3hMc09SNjJ5?=
 =?utf-8?B?RWVyT0tSc3FldFhPT1krZG90VGw1ZFltOUM1T0VxempRQkNsS0Y1c0k1UFp6?=
 =?utf-8?B?bXVxT08xSStJU01aRXE4RDRWUDV1aGZkb0ZlQmJjTTZXN2xtSUVkMTcwdnIv?=
 =?utf-8?B?d0VjT2NvMG1wTHI0dE1TQzU0MU9nMkFQSDl2WlYwcDRCbXFieVdnYlRIbjYy?=
 =?utf-8?B?QWhMcjExODdXS3MyZUNiYk9UUUk1SWVDQW5HdXpMUng3b2o3WnFtV2F4ZFQv?=
 =?utf-8?B?UGl5TXUyTGltSjR6UlowRFpOZXFkN1VyQnNZL1IwMEcwcnVHUGk4bUU3SVV1?=
 =?utf-8?B?bysxbzd0Z21wdXEvczRtdXV5MndFMmlTYkM2UzNlTHFIRjVjeHUyVUhIYitr?=
 =?utf-8?B?Y3ZCem5MaVJhQ3lGSGdpdkZsdlU1YlJTWEZhY1hLaVJhNVhrMTE5ZnB6TTYr?=
 =?utf-8?B?M3hZRlcwakpUOVFmbzduaml1YXFqRzcyOWI5TnN2ZDN1ejFkYlFlZlh1cUVL?=
 =?utf-8?B?WlZqcFZaUk1NaENrMGNnWWZKbmRSbStNdllUbnBwR01RN3FSVnVnMnZOOFBQ?=
 =?utf-8?Q?Ce+U+oPUp9HF0b+yw+JLtUB+xB7g2rAUZs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:04:22.6335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 54cd48f4-22c4-445b-f78c-08d8b3ef1068
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZcSqaW4xFbeqN3AtVTb3Oaga0eqs3XD4QZKGS8LktE+NKzDs1uzI6Um+jrqDvkoRdhnKvReKj51Y38ahgC6orYDugd/6GTqbV+fUymXUXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------B003F50F028C87ABA60FFA33"
Content-Language: en-US

--------------B003F50F028C87ABA60FFA33
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-05 10:16 a.m., Leon Anavi wrote:
> - Update local http API, re-add get_multizone_status
> - Don't throw if socket is already closed when cleaning up
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pychromecast_7.6.0.bb => python3-pychromecast_7.7.1.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.6.0.bb => python3-pychromecast_7.7.1.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
> index 52803744f9..ca55740ba7 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[sha256sum] = "998851e615e41ff436780867de84adea0f1720b7a73822451bd9ff9a00c0e255"
> +SRC_URI[sha256sum] = "d6fd0382395303b3260ea7a89a850c8c9e5c83e7ce71a5fbd793bb157cf8ad26"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 
>

--------------B003F50F028C87ABA60FFA33
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-05 10:16 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210105151638.15700-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Update local http API, re-add get_multizone_status
- Don't throw if socket is already closed when cleaning up

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210105151638.15700-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pychromecast_7.6.0.bb =&gt; python3-pychromecast_7.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.6.0.bb =&gt; python3-pychromecast_7.7.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
index 52803744f9..ca55740ba7 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>
 
-SRC_URI[sha256sum] = &quot;998851e615e41ff436780867de84adea0f1720b7a73822451bd9ff9a00c0e255&quot;
+SRC_URI[sha256sum] = &quot;d6fd0382395303b3260ea7a89a850c8c9e5c83e7ce71a5fbd793bb157cf8ad26&quot;
 
 PYPI_PACKAGE = &quot;PyChromecast&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B003F50F028C87ABA60FFA33--
