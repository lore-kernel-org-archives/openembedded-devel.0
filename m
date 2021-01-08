Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.76])
 by mx.groups.io with SMTP id smtpd.web09.1926.1610121874928194575
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VbNtldOJ;
 spf=pass (domain: windriver.com, ip: 40.107.243.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTFWEeh/cLeQYimVZ0Iiiy/Q32al3ZnuyWU9OD+YVqvjI3sgCI7CDABtC2vRdE2hKU/2nfmnzGn+bz2YTudn2nKWv6Fs2yof+6tcd1jk2GIcxr8zEE1T1QlGuWSgvW0MpxepMa1PrsxwYkqfxFuqnuwlrpBDX/FIJ2GP+mvvgibwbDomlCnBErWagXy2gpEGg+1nBHUX3hDVkL+CwIfUCunJcEh3Lf+dje2P0NkRL5ltJ7oJ1+UmmiNc7txV0yYlxtxjRNMCeGvqmMxkqmViiHADqNVYxcKxGYziCQ3qg0uNVYD7dm3+cOf7aTEbS5b9QBNt9Ip06Dq2yOY1iUH45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gXFlrY1gLPnSJ0GgJmPQJJfK4CU7jREIflapOGdfJs=;
 b=X/Bjaez9qR+twg0xYydy5BSXH2lc35wzI/gC0EFjt3ngx+91KHdC4L/P5aJFaN84ZQskJAcUtU580ssJQPZAOIuojGji47UVb2uHsZOWG4QRMWD0tYjWKldRojxljGVkYokcEGaMg5oN/GeCuDphTdtdeFMMnBm9SSPKjlvqWkbCDSBpm/8+ltBJTPdlnMFdOoU7hOIT+4eOVIev7DlEsdMlcUASj/z7T6RXFtFmm1+Pm+aoTgfEOL5S+u9eq1GYxjFvayF2S/74mjX9AlsfbqbRvUJVp8j3JPjK9ydFLlq0BCsK8v0XGphtwRf612X4kI9BDaq2nItmSRM5Zl5aWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gXFlrY1gLPnSJ0GgJmPQJJfK4CU7jREIflapOGdfJs=;
 b=VbNtldOJ1u9Ujtaw7dWtiN01CIbbzJDJUPDDN2f99WSDOP3+MLBAdyYims2f43eoAsifr0rbjDnMLU0N3ofgnV6ZwbDXiXwm8Gv5Hm34YzXwQSbbrl91mQVNJkuYFQQLFaX+OxDsSqm7tl5ofiHT/uTusLTWXjevs3Yav62SH4U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:04:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:04:33 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-txaio: Upgrade 20.4.1 -> 20.12.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
 <20210105151638.15700-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0beb2bd6-c80a-c8a9-3a42-0e9c64596e62@windriver.com>
Date: Fri, 8 Jan 2021 11:04:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210105151638.15700-8-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0024.prod.exchangelabs.com
 (2603:10b6:207:18::37) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0024.prod.exchangelabs.com (2603:10b6:207:18::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:04:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e61635e2-7777-4e72-eec8-08d8b3ef1718
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48966FF7432E47AD7FCE67739FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RgjrlbDeMJZlUrD2H6hhcwlFUc/1Jpt/GpRBJdmC0yvoeqhXSoICbAL8MMcg+a+aD1gSyWGi1tghKVBvB2mxEBBGBxkgzgmsEoQw+oZKfI1Wdu1nQo6C7SP3XCLxztNzh6gIK9Y2Zqw3CNt1E6C2ADz4CKFDpXEH+z799c30fQAVF7SMT3lSRAEfq7kU3kngzknz7a6M1oS83X6x99NmUofszKu8YzOIosOPgYaRvzaXSEoYEaVBKAvXh+/xyzPhtIEGTi2IASmBk+3tI+iqRHtNKFDs53eUD5+gGEqreazWveRtoa2471QsmeR52V3KWrYEK9h/W4Wf+HtBGnV5kiln40Q55aLIN8sP6ppy4MuflPnZh9lbGmH6SkBXOn9QGlUaBGQt7ldjiCQXlEVMm9Bq53UTOLIYd4jrev00znjTvWHRJ2P8vGySzSrZh6Z5g7M7qhEgy7a186XejQGtW4l3DFgk0modW9VLjiFOCgi6RreJsNqwKzfN0QK5/LmFyqlGHLz5GURhCJx5cKEu5Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Y1lrSzdiUkxkTDE1bjVGL01JMUdTWDRkUHBSNG5OL0xjSGZFYjlNbWExcGRz?=
 =?utf-8?B?K01hMlU4bTVlTWxPR3BVcWZ2UExSUnJNckV0N0g0dERkSmRPbzJDNGs0U1py?=
 =?utf-8?B?cGNkWXBlSU1NdVN6K3ZrUVhncWcvdTRYQitrSFkzVFRML0hkb3h1QzVGc2FO?=
 =?utf-8?B?S0NObC9wK3dXejdZTzBaU0xGMll6ZlA2Y3hMZlFYVHIwcXc5bllkUEk1NlIz?=
 =?utf-8?B?djhCTUV1OE9HTFR3UGtOcDdrQmRGNmluVmhNOTRicWNGV1RiWVd5VHhrTVBD?=
 =?utf-8?B?MnNXWllETmVuSTdMSmU3eHJ2eWIvOFVKYk5wbGx5eXBnRHI3dHJsRnU2b005?=
 =?utf-8?B?Sk5USUpiUG1BWFdsamllQ0JkZW42Tzg5NmduQ2VXMXlVQ2k5M3B6QWZXNWNx?=
 =?utf-8?B?M2phUllzS3FHTjVVUys2amY4Snl1cXVQSitSYVBIUVJ3SzQ2TWthSWJzRnFz?=
 =?utf-8?B?QUF0TnlQMERwUFFHUE84T2hqQmk1Z2dhRmV0TnZXaFlBSHJJSFl5UHM4RTNm?=
 =?utf-8?B?cUR3dkZrcFdLUmNTeUJWZ09GQUcwU2RuS2tNUHRYTXFRbytLdlg4ckFyOEo3?=
 =?utf-8?B?VGs5UFJuUDB6dXdJTlVNN29yb1FsU29GVGhkcWlHRWwxSVZCdVhYTUlLN1VP?=
 =?utf-8?B?eGdJdVhIeUxxUHRXR2ZVeFpqK0hIR3h2RnVFSWhGWmxhZ215Zk13ZHVoMm10?=
 =?utf-8?B?VnFBUENuNSs5UHI0NkR6YmpienhERDl4ZTJrV1FlWGZyc2Z6aTZVOXk2aFVs?=
 =?utf-8?B?WkV0U3RhdmlzVzZqS3g3bUkrOWNIRW9wWjgwYml6dGhqSGtsZUg5Y3VJN3RM?=
 =?utf-8?B?VGkwWjRpeDNpd2RyK1dBU2lnbXluejBQMHprcVhIV0pMbER5RnczNWtCQ0M5?=
 =?utf-8?B?dWdqaUc3Z1BOeWhXZDBqakVjQnVWQXVROUJ6MStuSkRIczJwTG83RW56NkQ5?=
 =?utf-8?B?cHEyTEVYcGdKc2tkaHNWdVJic2IwUTBpWjM0QVdWMm1YY0dldEFrbjY0Vjg0?=
 =?utf-8?B?Y1BKNnFTcHNxMEUvMjFhUjBJWml4d2tqcjFjOWFOOHlxUG9JQVMwTjNib1ll?=
 =?utf-8?B?R0w5eWRib3RBcVorODc0MXlVK0duNVZ1U0xlcFRzcUFhbk1pSHZlK1I5UVRI?=
 =?utf-8?B?WVFFUTdFQ1pEVVJWWTJUc1V4NDdVR01RT2xJMTFuUmpOdXFhcEF3S0JQMU1x?=
 =?utf-8?B?aGsxR1VMU3ZMbHRXV3V3SXY2TCt4N0Z3V2NPOEx1YnVRZjVBZ3E3WXNBN09O?=
 =?utf-8?B?TXFKeEhwMGhWNkhsKytFenFnZEdlZHBYTEZuaGJqbS9GSCt5YnIwMlR0ZGZ6?=
 =?utf-8?Q?IgOMqi/he6D1a8uJ1MJ5di8GCQRiKUmMWM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:04:33.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e61635e2-7777-4e72-eec8-08d8b3ef1718
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MA/jqR9ZXdmfA4JABsk9acBmGv2c1EKGrfRKVV2TxnXH8sMqEgcJQRNr2EuYf+pPeSCVpEM27HCfooyQ/vVLUBIgSnQUUWQegfKe8gt5OE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------484BEEEB42181045852F7D66"
Content-Language: en-US

--------------484BEEEB42181045852F7D66
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-05 10:16 a.m., Leon Anavi wrote:
> - CI/CD migrated to GitHub Actions
> - support Python 3.9 (CI / testing added)
> - minimum Python version is now 3.6
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-txaio_20.4.1.bb => python3-txaio_20.12.1.bb}       | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-txaio_20.4.1.bb => python3-txaio_20.12.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb b/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
> index 75a9395a25..f4baeb10fe 100644
> --- a/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
>   
> -SRC_URI[sha256sum] = "17938f2bca4a9cabce61346758e482ca4e600160cbc28e861493eac74a19539d"
> +SRC_URI[sha256sum] = "1488d31d564a116538cc1265ac3f7979fb6223bb5a9e9f1479436ee2c17d8549"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------484BEEEB42181045852F7D66
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
    <blockquote type="cite" cite="mid:20210105151638.15700-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- CI/CD migrated to GitHub Actions
- support Python 3.9 (CI / testing added)
- minimum Python version is now 3.6

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210105151638.15700-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-txaio_20.4.1.bb =&gt; python3-txaio_20.12.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-txaio_20.4.1.bb =&gt; python3-txaio_20.12.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb b/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb
rename to meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
index 75a9395a25..f4baeb10fe 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = &quot;Compatibility API between asyncio/Twisted/Trollius&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98">&quot;file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98&quot;</a>
 
-SRC_URI[sha256sum] = &quot;17938f2bca4a9cabce61346758e482ca4e600160cbc28e861493eac74a19539d&quot;
+SRC_URI[sha256sum] = &quot;1488d31d564a116538cc1265ac3f7979fb6223bb5a9e9f1479436ee2c17d8549&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------484BEEEB42181045852F7D66--
