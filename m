Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.66])
 by mx.groups.io with SMTP id smtpd.web09.260.1610649795914203067
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=disJvqfa;
 spf=pass (domain: windriver.com, ip: 40.107.244.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgxqifJ5gzSrDuUB3c6hnyjIUjVCfL+27s7B6s07xW+nOBuNILo8jKl571iGGxwILdIwuLM0dqDl75EVpr+OGk+5eCOSm48Brks8qr87p4gb+KVPc4UrORAJqgb0ah7HYY8yOEihRBkBHAZ5DyxyBNq6482x9wgBDMHIbPN6dBNIzbCrPq69Lfyja1/56BFa2m1TacptVqAryuhd5kyOsiJGulvgpm6jcXkFVrz2TwZ8ryiJ0hwjZQ2GxfiHXTG/Y30wS0uKgSiX3S8nU1uItlNGRGN06NCAsgf/zl88Hwg3Tzis10SEPOT8DXi/yCcwHyog7QHsIStbPv4v3I1Saw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVOw8sCeaxDGgapDlJGaDNlHe7XeJgxoki8mwboBzxI=;
 b=A/cN1MI73iUVadvC+JJ/bJc/3dY1T9lwQdSe43c23NUiR9F0C4Oo2BoYKYudpLrHN5IDzNt3gXeup17SpyInqsYah98JPCH0g8VERjEQ3eLrT7VkSXRc7AvALMTdCPsqgWqPUEFDPhYldwESLDqBx1AfBdBmtnnOCu8pfsHABzUv/mAwJiAatzs6xyABF1PFRD1KWdPB21Q6/j34rs543/b20xuHDU4yhyBoJrtkMLFg54Cjrhk/aX7QoSg+D0k8d8JFb8L67c9eysiQ4x79XBrCvjpvQzsoX4F+65/Lr9pewRBosfLV2igH3QeGkyjsXnZ5VBATCw1foT7GG7BuNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVOw8sCeaxDGgapDlJGaDNlHe7XeJgxoki8mwboBzxI=;
 b=disJvqfaNWOuWKBaW5NXMpAfA3SVmyxhYEEBL2HqPvTgEMbVO8/Yie4ye1P5c6bWz6cuSIb1/EGavaqy8+lv5UbbftCd8BXIRwqR3cOTaAP8KaERwELCVQtSysm7kiDX92+WLQHrm2K2OTBZNiyQOrI0RAVjOL4z7zd8SwKloNk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:43:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:43:15 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-rsa: Upgrade 4.6 -> 4.7
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210112182354.15359-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ffd63166-a74a-7563-8289-964e9272b2ca@windriver.com>
Date: Thu, 14 Jan 2021 13:43:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210112182354.15359-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR22CA0021.namprd22.prod.outlook.com
 (2603:10b6:208:238::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR22CA0021.namprd22.prod.outlook.com (2603:10b6:208:238::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 18:43:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58bd5fd4-3cfe-4fa4-845c-08d8b8bc40ab
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB480083CFB541EF9F75348CB79FA80@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	njwabvsA9f0Gl5rx04k5m964qKqlLXGad6llo5MwAKFTotZ9vYDNn64BAu5OgId1DUEwvCu6C9BEW9Ig4iHXFKd9Up/JAfn+jWgxIkmaGDdZH9w8v6w2o+KJ1zlVy43zFJxswcPsBIJQ1gt8UXuoN/h+HIhm9Ut8cLwbkCKH9chJIrZ1Gm00q/yyL/zXgEejvRvtpp5AKvTl+MpifMgDI3GxpTlcgozB7bBArn4/IzBccctVWCJOrOpX21/47KomKSjyuq7R5D7O6NMF8OnUfkZu/f88pMyARFnuyE0uOv7uteDeo9BTtTfeP1meU/dHar91zYUkSFoWuO7WXN0GZbEyyj2CFGPYhb18SykCGldt4hh0/WFDV0SCMUxJN5FOsy9fCCqeEbCdEpbLkMTe5amD5iu8WNHNb4vtDxmFcvby/YVCNhdpwQgPPC2+6mSSRH70ogOwFE8iII5x0Q8Bgy6o/reztLM11W7/LUiKkry2wjyZY5/dTM9s+FwH4yavzjVSvxrsLoUTkxBBpdqTDWDAFfwvtpdwl+W8kKXKgaNdSeN4Pf/ZuYiWmgKRFP5Q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(86362001)(478600001)(83380400001)(66946007)(2906002)(31696002)(31686004)(166002)(16576012)(316002)(966005)(8936002)(5660300002)(186003)(16526019)(53546011)(6486002)(52116002)(8676002)(66476007)(36756003)(33964004)(26005)(2616005)(956004)(44832011)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?N0dFcEY3S0VYMEQ1NHF1UXFTTWpQUjEzSG1SNEJFZ2NEUkRJbkI5VTluR001?=
 =?utf-8?B?Kzh4eWRRMm5heEFOcWdLT2MyMkxKZUxzbTZaU1R2YUNpZ0tDWUc4MWlxVnpp?=
 =?utf-8?B?L3JQZXR6Zmt4SFh2b1U5c2ZsQVJ2MHcrbUFuYSswUWZCQTVlanlNK1NFTHIr?=
 =?utf-8?B?TjloMkphMmhSNnY1K2FYdjdCR2lZZ2RQcDJ0RytJUUt6c2FZb0xTc2Vhbmxp?=
 =?utf-8?B?d2l3enNZWFM5QVlETVJTNzJnYTBGNy9IVTNDNVF3ZXl5SEwrWnYzTTdQMlR3?=
 =?utf-8?B?NjAxTy9JSmdFWTBSME5mbkdPdU8zL1NnN1A3Nm1DM2FDOVlqK1NwaGt5aW9h?=
 =?utf-8?B?dWVqREdSZ0tVN0l3QlhTWVFkZDNsSjNyeVRlVVB0V2swTmZRbmhtZXZWQ0k1?=
 =?utf-8?B?eWliUWhpNTUrankweStnTUxGb1cyeGx6K250UFlOYUo2N1RHdFgybVdtUk54?=
 =?utf-8?B?aWFleXlaTEdFRjFzSlRkMEQza0tUM0g2ZEtWU1cvKzRmcHNGNmdOYmFkRUZp?=
 =?utf-8?B?Tzhnd1NPQjNydmJPRm5VT2VsN2s1aGRuWVVkNjlZcStZMXY4U2dBdHF0eith?=
 =?utf-8?B?ZnlyNTAwYmlGMEc0NllXK3J6a0xHZXl5dm43ZEluRDFwZWM1cnU0OVJXQ3M4?=
 =?utf-8?B?cjhSNUduSS9iZHRQSjBjTTdKYkVycGZpb3pzYW42TDFxQnU5VEwzTjhNZnND?=
 =?utf-8?B?SG9pQmtOa0RBL1FMWTV4dHIvNXNDdFJNdjBXNVJQQmN3SlJoN1p1SXhMZjR1?=
 =?utf-8?B?Si82STFnT1RuUVd4OFYyYUcvWHU4S3A5RklPb2Z4Ky91bjMwb3I1WUxVelll?=
 =?utf-8?B?ZW9lTW5yUm1PSnZxUVQrMmwySmlzTmlBZkxIMnVhYU1JUmFoTmtkSkd0V3hE?=
 =?utf-8?B?bGxMRmRWMUlvZjBhOTF6UnFMZHpvcDBXU3FXSXFMQ0RISU84bGgyY0VYY2dI?=
 =?utf-8?B?WW9RVHlIcGQzZlJCQmdyUEJzdUc1OXVpZ1diM2VweFhEVEdpTXdjL041RXhy?=
 =?utf-8?B?cWhxeWFYUDJuRjUrSXNaSmRHZ1M1dnhJZVB6Y3IvUHViR1UzQ0NwdTA3RmJT?=
 =?utf-8?B?bnZBd29WRklYazhDMFdtU2ZVR1lmZWR4ZGZvMFNyZVBzZ1lhUVNNL0gwTDdK?=
 =?utf-8?B?MWlCUEV2Y0N2Y1ZDU1YyQjVrci93OXBIdk5hUUxJVW1qVmJVQ0RVbCtDSUhT?=
 =?utf-8?B?akVhM2tteTk3MmNwMmRwcTR6TUhrN3JDTHEwQXRGVGNGSFR6ZlRQOHA3Nmg1?=
 =?utf-8?B?WkcxcGMvNUxxbG1MSFREWXBPelV4TkZNRzRJdDdFZ0dZOFlieU94WnFLeEpz?=
 =?utf-8?Q?GH529cD+9ctsYwOK18iO+t14+Gg8jpIZyf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:43:15.0530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bd5fd4-3cfe-4fa4-845c-08d8b8bc40ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zni7zBNxKxZPEbkUO34Zt45Ea+yb+5h9J4SemoLS7dUPe1nWGhb9xwSoPWd0lMS3MVueL977JDTqYIuEYv0n1+l2sQr0etwMKnrr57UtJzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
Content-Type: multipart/alternative;
 boundary="------------361CC0DD66BF02D8C09D6BC6"
Content-Language: en-US

--------------361CC0DD66BF02D8C09D6BC6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-12 1:23 p.m., Leon Anavi wrote:
> - Fix: CVE-2020-25658 - Bleichenbacher-style timing oracle in
>    PKCS#1 v1.5 decryption code
> - Add padding length check as described by PKCS#1 v1.5
> - Reuse of blinding factors to speed up blinding operations
> - Declare & test support for Python 3.9
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-rsa_4.6.bb => python3-rsa_4.7.bb}          | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-rsa_4.6.bb => python3-rsa_4.7.bb} (88%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.6.bb b/meta-python/recipes-devtools/python/python3-rsa_4.7.bb
> similarity index 88%
> rename from meta-python/recipes-devtools/python/python3-rsa_4.6.bb
> rename to meta-python/recipes-devtools/python/python3-rsa_4.7.bb
> index d2b108635..c4c36020f 100644
> --- a/meta-python/recipes-devtools/python/python3-rsa_4.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-rsa_4.7.bb
> @@ -4,8 +4,7 @@ AUTHOR = "Sybren A. Stuvel"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
>   
> -SRC_URI[md5sum] = "bbf1c954865319bd542600ab07f92aca"
> -SRC_URI[sha256sum] = "109ea5a66744dd859bf16fe904b8d8b627adafb9408753161e766a92e7d681fa"
> +SRC_URI[sha256sum] = "69805d6b69f56eb05b62daea3a7dbd7aa44324ad1306445e05da8060232d00f4"
>   
>   inherit pypi setuptools3 update-alternatives
>   
>
> 
>

--------------361CC0DD66BF02D8C09D6BC6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-12 1:23 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210112182354.15359-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix: CVE-2020-25658 - Bleichenbacher-style timing oracle in
  PKCS#1 v1.5 decryption code
- Add padding length check as described by PKCS#1 v1.5
- Reuse of blinding factors to speed up blinding operations
- Declare &amp; test support for Python 3.9

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210112182354.15359-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-rsa_4.6.bb =&gt; python3-rsa_4.7.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rsa_4.6.bb =&gt; python3-rsa_4.7.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.6.bb b/meta-python/recipes-devtools/python/python3-rsa_4.7.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-rsa_4.6.bb
rename to meta-python/recipes-devtools/python/python3-rsa_4.7.bb
index d2b108635..c4c36020f 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.7.bb
@@ -4,8 +4,7 @@ AUTHOR = &quot;Sybren A. Stuvel&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634">&quot;file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634&quot;</a>
 
-SRC_URI[md5sum] = &quot;bbf1c954865319bd542600ab07f92aca&quot;
-SRC_URI[sha256sum] = &quot;109ea5a66744dd859bf16fe904b8d8b627adafb9408753161e766a92e7d681fa&quot;
+SRC_URI[sha256sum] = &quot;69805d6b69f56eb05b62daea3a7dbd7aa44324ad1306445e05da8060232d00f4&quot;
 
 inherit pypi setuptools3 update-alternatives
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------361CC0DD66BF02D8C09D6BC6--
