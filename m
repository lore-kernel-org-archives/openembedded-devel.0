Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.52])
 by mx.groups.io with SMTP id smtpd.web10.7697.1614177637501969524
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=P6qeMcwz;
 spf=pass (domain: windriver.com, ip: 40.107.77.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaRKUK2ZSuQHWaNeQp9qG4k/GKirmk94o5H18olK1FUjVVqe8CSG8kt8UKoTgh5n65K4SNs8gtOyledCjumeW5onnCQsSk/eRenWY+yn47uz5Zgjl9bkAjRCTGkIGCnui+pZzQKCszdSuB4ohCumYZmhvneM8ftT7T6ovd6mJTEoMwexx9sNSJaIGLyECUeT70+atSgwTo03bG6YNE43a3W38ChAaJjw3jo0ZMi7HYMrl0PqrgcDdEGavNbSqgCuJ17ceX1r3sWr3gZ6VdqIgxXSPnx4qwiv0BFC74HpPYtwNtvDB03rSSCfcVfz5xOeX8DDIpceEGPRYh3I6jjb6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mg7Pdz40ZepIjsvAcfushcl6ZR/bLGDsu8UEUW1IezQ=;
 b=RTpVj/r87BN9XJMTu7SvuaExz40h9mwG9vqKYuyDbHcT5gF/DhOiJVVHqdnXz230nui3k59v5fEUEKaiz0KIANooCLW/lwL2lMdtYQYFwg/f4KLozE3phLG+glAZcYR55dO9hY5EOXAhyhra/2wsp1JGK8e/xDBTszQKCUcH8YWqac0NDSz6DnhKoQmua1SoR+V8Cfzj0PzvUOhBp4FjSpcJr8DnaHvdD9PZqQzmz0T722gks87lRn81dDEPEVcAcxJc4vHQ6D6G9fpJ79zHzugw67dSiuN9HJ7PmBoD28io9ad1gbhwsIlvQD/u0ooyOH228IJUN7dyZngxWHIiCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mg7Pdz40ZepIjsvAcfushcl6ZR/bLGDsu8UEUW1IezQ=;
 b=P6qeMcwzTRKfwZnWZFcph60OwllOXigZbC4M97SjlbkolNyQSYSafm2sN/WZFGW2Ds+e5L+uSP+uMpd45gU564qV8shU0G6nncW9fKhp8DxkeoZnRbcxWxywVN4dgeqWVqXiZpibSDtciU9f6JlKw09AlHXeKtaMCZ9po1//c2o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2678.namprd11.prod.outlook.com (2603:10b6:a02:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Wed, 24 Feb
 2021 14:40:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:40:36 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-pyperclip: Upgrade 1.8.1 -> 1.8.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210222175043.21231-1-leon.anavi@konsulko.com>
 <20210222175043.21231-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <12a2cd70-f4fd-ab6f-bcb9-405f56f0ac84@windriver.com>
Date: Wed, 24 Feb 2021 09:40:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210222175043.21231-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0909.namprd03.prod.outlook.com
 (2603:10b6:408:107::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0909.namprd03.prod.outlook.com (2603:10b6:408:107::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 14:40:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e50bac2-8e69-4205-5d02-08d8d8d225a7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2678:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2678CB6CBBF7A42DC94F9E699F9F9@BYAPR11MB2678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tsWBe584Qb6cuNAcL5QiURCpb3GFQUGrBtBQfvy38oxZvj5uSBxtDo82Gf1mefuoeCOyDGaGUUDeIvyvazURt1VbxCW8JbsiF8jPbn9jD+yiWMV2MmVzM23bqi5yiUadxXcpicZLrloC1b4zdDffiVkbiTfEK7ZOtzt7T5NBLKlMhzXdP3zaBx4f2Am3EBAK7gnIuFaObARb+qCD8o7Fvc+2PLwmPlvKaifhsAPvSel5FNo0rDP47qR7o5lMQvSMVpfbF01IU6iFdBs6S029/tsGV8P71LafzdjIZg/t17V9hGTJNtMI0EwZCxjK4eeJNx4fqTXw1d1CIOdlmhIDgOVBWytcFeyRxlxe+6kwmjpoBsRnB0oyDVgFRD3ePxsAdeg9QgTVG1VPA97LyXgHpc7c6vlfnxuQOy5nPex2kpjY3cke8TIlr131AKOR2Od+PYoT6rdsaXyBxKJMPE+TSXzEH9yNXtvEPA3GFdMABMCg8D8G7kQDs2u8WLln9t6VPQPIy4nXCHo8ogF9taH8vp78/r1Ns4DFGtPIn+Se5MqhLTOMsXv7uMZ4ibelNjrBAbTmz0qf1HSLwNd7A1un/QLLMqUyDJAeRKUfbWNuPROi+arxGqA9ZlKfal36tJLqZzlNuCN8xP5kVKLxEI/KnlIIeWH8D9YkXivL8vxg8TkSkBkKTMxkCpVr8heimdhd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39830400003)(366004)(346002)(396003)(8676002)(31686004)(8936002)(36756003)(478600001)(86362001)(33964004)(31696002)(66556008)(16526019)(26005)(956004)(2906002)(44832011)(66946007)(66476007)(5660300002)(6486002)(83380400001)(316002)(53546011)(2616005)(166002)(186003)(966005)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TTlzUkFWWFVkNmR4SmNrb2Y4UVQ0YzdsaGpERXdCb09UbXJZb3ZqT2FuNzJO?=
 =?utf-8?B?WHo5MnkySGRsamRBWXVnTE01WHpzZm5lQVBTME5tTkkyZm96Z0U0RUw5cXB5?=
 =?utf-8?B?QzlDSGIzVXVYcDd1QWx2dSs4TU5hSDJhRUxhMXFrYlNXaTdyRHBWaG80Vmgy?=
 =?utf-8?B?YkpUTHJjSXAra1Q3N2RDREJRKzRQbEwzWVdhcWw1ZTVDd3IzQ0NKNDhVem1a?=
 =?utf-8?B?Y2ROSmpsc1hqajF2WDRWemc2VTVHY1VNN29kNGZxTVFRLzMwaXhIamtkQlc1?=
 =?utf-8?B?ZXBwdGZHblhYM1NiT2tEVEVDY1F0Q2UzMm5lSG5zTXpKQi9uQjYvaDIvVnpa?=
 =?utf-8?B?QkRhNlMrTWR5SkdLb3V1dGd5VFVCek8yVVdvVHZVWlc0VEc3T3VJTzlMcWZJ?=
 =?utf-8?B?RENFdmNrUEo4VTlQemc2cnJJZGRVb3BhWW9aZkxWVlg5T2lySjhXVk1uYXQ4?=
 =?utf-8?B?NFg5ZjlnOW01RitrUkRXWkpBN2VDdzJiNXhLWkVCMWM1bC9wdXZwbkhBSEZT?=
 =?utf-8?B?THJ6YklrYmxTWmt6Y0RRb2x1bkNyVmFPTjkzemZ1S1dJa0xNT3l1WGxlSjdj?=
 =?utf-8?B?ZG1Od0h3MkxHeFFiUXZBUDBGbUtEL3dmODFCZTNFYnUyTlZlbVJ0UXFya2FO?=
 =?utf-8?B?L2VtSnpjUTd4WHRRZHQ4TW5ibGp3TUpKeUR4OEdMcjNMWVE1akMyR3JwTUxI?=
 =?utf-8?B?NWdEL3pBKzNUWVRwc2VQb1Z0WVpRaUFBRFJxcU4yK0xvazFGZlNzaUJyZTdE?=
 =?utf-8?B?aEpnanBseXhLSkRpRUN1bHNYWWhPS1Z3dzAwUDhpQVc3K3hqSGRrelphNmVy?=
 =?utf-8?B?Syt3Z2E5WUxGd3Bid2ZsUFJMcUhxS3dqRXF6M2RENFlWUXFRcU05bFl4NzRS?=
 =?utf-8?B?Nk11Ui9wVVN6dGdTekNVenJmbTlTWnB3V1NwNU9uZGNKNTYrRDE4MFR1TGpO?=
 =?utf-8?B?eWFESGxLc244aTFKTWlBdDlIbXppS2FKbWNZM00yaUgxU1owamZ2dURxdVAy?=
 =?utf-8?B?OStzRjlkZDlCMWtpTktQZVYrTk1mTkhYbG9TYysvNjR5WXo5OXY0TVN2a09Y?=
 =?utf-8?B?aTZCTkNHU3M5OXY4d01idTBFaVJOV0FyTGNLcUQ3WkVYd1Viei9weHgvZVpS?=
 =?utf-8?B?akpCRkdXZkcycW5FY255Z3hOcDRYY1JZb05VdW9nSVNseURNcHREZi9Tdkpk?=
 =?utf-8?B?cnpkZmFtelkyYm9VWFZnWlNNb1kyWXZTYXZnQi9wSXBwNnp6Yyt0M2MxbEF5?=
 =?utf-8?B?d3hDbHF1YU5XSURvazhPV0I5eUFxay8rWE1FaVk2Wmc1eWZqMDllY3o1Rm5Z?=
 =?utf-8?B?OHdVMGFWckMzZGpmTWlQbEptcTZNR1E1dk5HN2p4eVFLR1RORUR1SlZsR09u?=
 =?utf-8?B?ZlF4Wi9UNHJFeU5yRCtLMHhFQXRwL3dEUm9ZYTFRRnNxSC9vWlp5ekNUdXUx?=
 =?utf-8?B?L2xXV3JxSllsdThINldTeWt1d3ZVK1VaTzlObDNuSTF5eTRGc1IzWitXdjJK?=
 =?utf-8?B?ZmUwOGFtS2lST0x6Uk5mUE83amplcm1uT012bEE3dFc2NFRoSXlsN01KdDBv?=
 =?utf-8?B?S0p4cG1sUG14eHhod2ZKU1M2N2dDTEFZZ1g1amZIRHpyRFFITkhGeHllOGVR?=
 =?utf-8?B?L0psSXIvSUplNkEwcUlKQjR4TVhDRzI5VDFSSjhrSDA0d0xvdjdMWlZTSDhu?=
 =?utf-8?B?ZVNncmVhaWUxZUIxOVo2YzM1VjI2bDVvSG8yZzk2emRIa0lxeUd6UFVsdkEw?=
 =?utf-8?Q?5HJtEyNCqfvd40LG3PsPtc9vZZJ7aF4pedhbW46?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e50bac2-8e69-4205-5d02-08d8d8d225a7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:40:36.0931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGLJkU+RH9PTd+sF5eAL5pQf5HkcyASqOYQ2dsNWu8YZc1sDDIHCU9zHkvJHmARhjdChHk1fPWAoot4GD85bxne9Ab3lhpoMg8FaZ4iKgC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2678
Content-Type: multipart/alternative;
 boundary="------------05A2832D5E42D318AFB971FD"
Content-Language: en-US

--------------05A2832D5E42D318AFB971FD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-22 12:50 p.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.8.2:
>
> - Better wayland session detection
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyperclip_1.8.1.bb => python3-pyperclip_1.8.2.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyperclip_1.8.1.bb => python3-pyperclip_1.8.2.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
> rename to meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
> index 211580b37c..142d075493 100644
> --- a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/asweigart/pyperclip"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632"
>
> -SRC_URI[md5sum] = "0ac879899da5c2af755a834245ca6a0f"
> -SRC_URI[sha256sum] = "9abef1e79ce635eb62309ecae02dfb5a3eb952fa7d6dce09c1aef063f81424d3"
> +SRC_URI[sha256sum] = "105254a8b04934f0bc84e9c24eb360a591aaf6535c9def5f29d92af107a9bf57"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------05A2832D5E42D318AFB971FD
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
    <blockquote type="cite" cite="mid:20210222175043.21231-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.8.2:

- Better wayland session detection

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210222175043.21231-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyperclip_1.8.1.bb =&gt; python3-pyperclip_1.8.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperclip_1.8.1.bb =&gt; python3-pyperclip_1.8.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
index 211580b37c..142d075493 100644
--- a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/asweigart/pyperclip">&quot;https://github.com/asweigart/pyperclip&quot;</a>
 LICENSE = &quot;BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632">&quot;file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632&quot;</a>

-SRC_URI[md5sum] = &quot;0ac879899da5c2af755a834245ca6a0f&quot;
-SRC_URI[sha256sum] = &quot;9abef1e79ce635eb62309ecae02dfb5a3eb952fa7d6dce09c1aef063f81424d3&quot;
+SRC_URI[sha256sum] = &quot;105254a8b04934f0bc84e9c24eb360a591aaf6535c9def5f29d92af107a9bf57&quot;

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

--------------05A2832D5E42D318AFB971FD--
