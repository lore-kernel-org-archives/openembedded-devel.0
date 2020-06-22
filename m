Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.78])
 by mx.groups.io with SMTP id smtpd.web11.17877.1592833621834192536
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 06:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nN+8Njzt;
 spf=pass (domain: windriver.com, ip: 40.107.75.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOdMSHEdzBiciYk30QRxnFCRlu+pOCsB9vDyw5npiHV1fjCocVcIPDhfzIVgpkn1FufCNyEz0rR0U2tvjQiy48b8M6gOH+MD7kasF3PCCiLRG32EMdvTR0NK138bQfH3cqP/39/c0efNj4UaIgNywoXmsbyy+VgovNBB+EjLWIPiI9jP6wlQEVnZJPqfL6G4tEGMiEugSgsATbZABiE/vYQx642hsxC6ls0YKIfv9FRRzamAaW/fUX/mia5DWLYtt03Zr8ucHxeUfI4chzPPxaC/X974vyYPGagJSoHf5qTYvF0Lu5/s6YD6ocEK24DkoNv2VJsuk/24q9eYZR50Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tksF9pH4EownAaw9xm8eYv4qJE3kqyXdoBji1SpkIik=;
 b=dpsCVf0Bo2l9nEJU/zt9qAKX+YTKTJvbSXakeVNltzBGDReuuu5Ux73yLt27yvtL5JAQBRLDXdKMMFuh5hWY2MjmhpFmOIkFzA+a41xu41D1j0ts8WenUM1Y3zKjI/wOUD1wT1y8H3/suKBH4VKmsxmJptyx9m6bUzC47PUJAyLX0ZXwWhC5NRz7suEqwRRRqvCSno5zfv9TEoZBwOZJA5G9l5nX8Kcgqs/6Acy7QhMNvG+4/LnhA7X28mN53hRLIua69Ntz9AeF8hPo+BOVRxDPkX4s9tau7MBZzE/Ila+qq2Nrfi7ctAcrBIaDTFRb892uqqdt/rvq5tH8JtrPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tksF9pH4EownAaw9xm8eYv4qJE3kqyXdoBji1SpkIik=;
 b=nN+8NjztzjrrFuKQ6cbNnQHIM2RzLO2U8H6gDltyGfH2NhNIv5AORPO4zx25P8VZ0qAuBEFwCem7ZRyaOFB+gk9vrf5iyehwy4rcnmmrR7KoIOv30Tb/UFPOCKQyInzwANN8Jh0/JRTVPMU5ZMXtJurCalO3BYreLRxNxfJe+K8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1779.namprd11.prod.outlook.com (2603:10b6:404:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:47:00 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:47:00 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-booleanpy: Upgrade 3.7 to 3.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200619094638.7116-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <72852c35-acb4-0c3c-5f97-8a56087ef4de@windriver.com>
Date: Mon, 22 Jun 2020 09:46:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619094638.7116-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::27) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 13:46:59 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5d760a1-6080-4272-1faf-08d816b2bce4
X-MS-TrafficTypeDiagnostic: BN6PR11MB1779:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB177959281EB1E96EC4371D669F970@BN6PR11MB1779.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ubKJdDdtSZ9rxr1cApe6B2Wt5/3BclKJIwHGmsPLMyHqynhGsDCh80QPtDipncJ/z4tiXAOm+usH0YnFreMWl8T8pS1NWkV/b1i0eMCY6PHHCm7ZTTAARnh5yx2HyTQbWabSUiAsRpy807ujzGEY+N1NLPSqWpZgKjA0gvCTW5f/L1O6+usxUcspLQphaot0Y09bUnnsXPL8TLoMY4FIsjmfjfJTF0J+PytrGd8XCvffO6ayOAVKogFAKL1l8AHBsXoEl0AagbBMW23h+HnffFpAHa39k6BCIwex+9XC0VlnK8NvGAdLTObRsJexBri0a2S80XBcPyA0Am1JEixMq5WIw/5MRgK0JOo0lHRd0wSCpGxj5FfU7wtGFiNq7o3YgugSUH8bs8snr14P6lLV3o+r8x5x6VWXaE9RHKcpHt2F9OpXBhdniBvmvBsET4n5BQsUwo3Ds18YUij1TRpj1g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(39850400004)(136003)(396003)(53546011)(44832011)(66476007)(66556008)(2906002)(83380400001)(26005)(86362001)(166002)(33964004)(8676002)(36756003)(8936002)(31696002)(6486002)(16576012)(5660300002)(966005)(478600001)(31686004)(66946007)(2616005)(186003)(16526019)(52116002)(316002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TeYZwuQ4DsRp3acqQwH9V3vWkNKLsnbJrNT5ePQM2xi9U+2wFXkAF0IrCXYbT2eTzvSXT1IYYd3zNBSEmOYIxZoPtprsinHF/rQ0YVarDjV5CCrZTyz2UKCqyNPGkD1XDonKMKh/LCz8fscXxcX9hhRKvwcpSwGJc9Saj/niix72Lf45CZjSyxOTP6jd4pplfjc4PdoRogmySV9ZLUkYT3Q3wO+9V5h+Hwf3JTpHX98ptfZIpHikitmRbOzOTYRUMnkyroVFgieXd80HuqrYp1IknHoS84Z1OcIARE/yy3SDOr81yMR5Xx0PTZvddDTSnsfRw9mYj/CzPO7DtNpFgf6adMRYWUPPpJzcSOLwGkzYZgmfCN7clC0N85yg0r30xnrbaxzfqd542Uw6dbziXyA4hBtuvf6vWZ8PSzzjIscN70M242Pwsp6b5+XighH4qiwEmAxO0z68sS7ts2TIODoBoGrlv6DF4apkVtz7Su8=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d760a1-6080-4272-1faf-08d816b2bce4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:47:00.4796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQ/QOiPiV+gI5ZyAiATV4jm8q36smYM+SsMyZ1wWyz2wZ8PD4a/NPDMoXHiANm/iAq8/1mcVCKVaUArqQAxindjaZiOGyJqL334D0QmeKLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1779
Content-Type: multipart/alternative;
 boundary="------------71FFBCC5E0718196ED987AAD"
Content-Language: en-US

--------------71FFBCC5E0718196ED987AAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/19/20 5:46 AM, Leon Anavi wrote:
> Upgrade to release 3.8:
>
> - Add support for evaluation of boolean expression.
> - Fix parsing of tokens that have a number as the first character.
> - Restore proper Python 2 compatibility.
> - Add pointers to Linux distro packages.
>
> Change LICENSE.txt md5 checksum because the year has been updated.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-booleanpy_3.7.bb => python3-booleanpy_3.8.bb}  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-booleanpy_3.7.bb => python3-booleanpy_3.8.bb} (55%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb b/meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb
> similarity index 55%
> rename from meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
> rename to meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb
> index ebf7ba4e7..a1ce7eafc 100644
> --- a/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb
> @@ -2,10 +2,10 @@ SUMMARY = "Define boolean algebras, create and parse boolean expressions and cre
>   HOMEPAGE = "https://github.com/bastikr/boolean.py"
>   
>   LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e319747a5eb94cddf646037c01ddba47"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9b58494d4f385978ca5a7ef4f6abca53"
>   
> -SRC_URI[md5sum] = "1189d115a38f84f5df743014926a9159"
> -SRC_URI[sha256sum] = "bd19b412435611ecc712603d0fd7d0e280e24698e7a6e3d5f610473870c5dd1e"
> +SRC_URI[md5sum] = "83ccc145ba74a585637124c8bc648333"
> +SRC_URI[sha256sum] = "cc24e20f985d60cd4a3a5a1c0956dd12611159d32a75081dabd0c9ab981acaa4"
>   
>   PYPI_PACKAGE = "boolean.py"
>   
>
> 

--------------71FFBCC5E0718196ED987AAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/19/20 5:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200619094638.7116-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.8:

- Add support for evaluation of boolean expression.
- Fix parsing of tokens that have a number as the first character.
- Restore proper Python 2 compatibility.
- Add pointers to Linux distro packages.

Change LICENSE.txt md5 checksum because the year has been updated.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200619094638.7116-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-booleanpy_3.7.bb =&gt; python3-booleanpy_3.8.bb}  | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-booleanpy_3.7.bb =&gt; python3-booleanpy_3.8.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb b/meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
rename to meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb
index ebf7ba4e7..a1ce7eafc 100644
--- a/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb
@@ -2,10 &#43;2,10 @@ SUMMARY = &quot;Define boolean algebras, create and parse boolean expressions and cre
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/bastikr/boolean.py">&quot;https://github.com/bastikr/boolean.py&quot;</a>
 
 LICENSE = &quot;BSD-2-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=e319747a5eb94cddf646037c01ddba47">&quot;file://LICENSE.txt;md5=e319747a5eb94cddf646037c01ddba47&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=9b58494d4f385978ca5a7ef4f6abca53">&quot;file://LICENSE.txt;md5=9b58494d4f385978ca5a7ef4f6abca53&quot;</a>
 
-SRC_URI[md5sum] = &quot;1189d115a38f84f5df743014926a9159&quot;
-SRC_URI[sha256sum] = &quot;bd19b412435611ecc712603d0fd7d0e280e24698e7a6e3d5f610473870c5dd1e&quot;
&#43;SRC_URI[md5sum] = &quot;83ccc145ba74a585637124c8bc648333&quot;
&#43;SRC_URI[sha256sum] = &quot;cc24e20f985d60cd4a3a5a1c0956dd12611159d32a75081dabd0c9ab981acaa4&quot;
 
 PYPI_PACKAGE = &quot;boolean.py&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------71FFBCC5E0718196ED987AAD--
