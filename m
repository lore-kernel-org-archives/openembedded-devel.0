Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.81])
 by mx.groups.io with SMTP id smtpd.web08.7736.1611839179073922326
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QGqiXAiG;
 spf=pass (domain: windriver.com, ip: 40.107.244.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAGg8tEVeIGgHDBKEXigpTXYLGRC1GBMnJQW1uHOYk/xHWqPo5wtVDisgKDqPPaAlYghNtu2lshY8Sx0j3Ze1eGWtP9M568n6HRQ2PeyLSzlb+q/7msg326pWCYn75BGuv9q2akmcHez4mzeKL8GE6JgpFgAmrXoizTJ241JVW03iONIcG3Kpm8h1LBtwTXoWEaH6/pvAYd9PDV7yAwM/IocA0sJXwuVO5K17VjD+CTQSmBnoOq8jwl6LQekL9CUE/i3i13yDEQTZNwjYjD4WSq5vo83x7pRKhfyVaOOUbp85T3WYaAvpAy43svcKdFENQSxq/H5WWqsRNxi8+qV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJBABoCp65jVFhEWL6UkBtjg5nqHXvarPn07CGOQrAY=;
 b=Wi2E7Efx32nf1c+VsptQwlDKmfD17Um0O1DKnNh+6kwYJFj9wFn5g2VhOrFcMmfAG9OwkhxoJhKxnogO8FRthpS4YP2ijGawUpKCgL8zra/cC/TzgPbs3NbKWZbrr5BQsZtPCnvIC5eLNDMA52f6n9anbm7T3QdbtrKmGgq1hept9uKNpAMI1HJfeMvH4GRG6T5sRC4Im3CuzVAs1uiaHwgU05OFRiwiLCKlFN9xZLAVIqdkEpyDdDFvVWF/3GdeBsObWGat9nk94i2tasgAkg+7TxF04BWVmPIZWOLunw9RXRw1yAYEoJG0FEAxyzrv+hAnKs1g7eGljHi46QxV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJBABoCp65jVFhEWL6UkBtjg5nqHXvarPn07CGOQrAY=;
 b=QGqiXAiGAlaoVqDs0mZ+ZaUPpU+PgU87uoK1+j+jPQT5zq68XRPsstEFubpPzAGpOON/Hs2ClD1a3wh8G2JLsrEeRidva0a+svAagnV36er7B4jNkcG8w2jhWLglJo9ImPh4WdKz44bZFLlgS3unOpoZqRQJ1LTGzZamCPxewmc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:06:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:06:17 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-socketio: Upgrade 4.6.0 -> 5.0.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210125152337.20937-1-leon.anavi@konsulko.com>
 <20210125152337.20937-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f106af38-4ee9-5401-29ed-c3c772bf4d2e@windriver.com>
Date: Thu, 28 Jan 2021 08:06:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210125152337.20937-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0045.prod.exchangelabs.com
 (2603:10b6:208:25::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0045.prod.exchangelabs.com (2603:10b6:208:25::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 13:06:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50e0f185-3ebc-4a87-52a9-08d8c38d7fe4
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB295103E03719DF697B0265969FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1j8G4iHne0HGZQHASQKM9Q9jvXPubM1OseuFSGy81Dhch+i3gLqo9xsF2Wld/sBbANlXiRRMOO8P2T8KA7R2/jEmKYrwwezbVZqKAT9fh+z6gCpsmZ2Za0irco1YZ2R8jcSuzyjwHQKOUWIYiWLKQomf0WJQSclOvKdYFe/tbcd2wediGvbvDEaFFaXhLTOpBxIx8Vfpk6snEfbHgLy5AwgxLtincx6xxsIdy3rSNM6MvX5p+VEXjoMmL8t57u0d9coAlkWgNJmRoOUxcfmfAgEyXnFc5ted9rw5DkWiO1Do6Nn2/kLn3UQnmh/Xd85GXb1KWLjKDZHr7TEazGt78Wq7b5ss3QddhXeDzOFaANkzrf2vmcXb3EeY85Eb3WTN2wCbqaSYP73FEl75snmbDCZwh6p+wgxClmKP4wNLIraZA+PzjybWKA0vIw3SqAXxRtpZAjiWImpKUXWKQvxiXhVVU8ELxUZUceRHTZRY0adeqFu4tus5NfHYxZaY3Er/KD4bk0RgD7h6ttafBQOxQoWuP0HGknIqqsFQ1vWj52lNz9wqDrESh4lgdklUx6fAvTdhMCu/H+uJcr0WpLKZXCM4eMf6K2pUAynPIwtd5Xko+pJrJ3Z7+VcUKSIKv7NV39ktLproNL2cl0VW8otfUw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dm4rdHlKZ25CanpPbFRMakFNTUhzcEpkTllCb01RS0pFZ0kzbkRkQjZ4Mk5S?=
 =?utf-8?B?ZzMycDN4bWtVaG9iczV3SjQzZlN4ZHMwQjFWcVdQK3RDdXducWlZTWpBMnZX?=
 =?utf-8?B?d0hmZmxMckYxZ0c2MHRoUDhVbU9LNTF4N1dLemVRZnRzWmUrQXFaaDZFWmd6?=
 =?utf-8?B?QlNqekN5YnZEVkVDWlZhbWVPV3ozZVhXaWN3MlR4aWJVUUVPTU1UYzhYQVc5?=
 =?utf-8?B?NU4zRzZhU2dFYWV6NlpCM2JGS01meVVrNitPVTI4UEZ5dHNkR2FWK3NmSG5F?=
 =?utf-8?B?VG9wcmRPRFMrYUpiaytkZ0pxUmIwc0JzdldiV0hqTHlDYWpBRGZsR0oyWXBM?=
 =?utf-8?B?cEErdWY2MXVFYy92WFZkSU5ZckxmV09xWGdXYmRxNXZzcGs5Y0lnZ1ovWk9r?=
 =?utf-8?B?akpPNlluc1p3eFZHalBaL0JzNy9rV0ZzWWd1NFFKMHByQTQ2aXFmdzU3Q1pl?=
 =?utf-8?B?VG5LOTRQTUJmYm9pb1V1T0pWeTA5eHowSTFtOHRBVHlpdHNOUmRJQjRxUndj?=
 =?utf-8?B?MW41TU1mNUNFbjByRXVuSGYvNUsxUDl5MGhseFNZcXI1TTNjaG1sM0FiVmcv?=
 =?utf-8?B?UThMbTh3NWR1T1ZLWkNHaHdSSHQ5VVhCZS9FbzlXa1NibW95TGczZWpRbUhJ?=
 =?utf-8?B?QUo2TEd0SXRXNDBITldadnp5ZUYzQXdqdXBScStqVEZNMU5BM3ZjYitBQTN5?=
 =?utf-8?B?QllZWmNzc1RsTVFqNS9QWFJvcXBaZ2U3NzAxRW0rM1lwaXNOVFZhMG5TamJ3?=
 =?utf-8?B?K2poSSthVElzUW16M3JDUnphSytlZ0JoQUpNU2paZDBFdkIvS09hTkM4djNk?=
 =?utf-8?B?N3QvVXRHSFVOUDlHQlR1M2VaMS9KQndpT3Iya3RraWFRWW9YdEdNRVYwaHFY?=
 =?utf-8?B?SHgvMldPNnRIb21Zd2Z2ZXVaV0gwR21vQlZScGhkTWZxejdSRHNyRFd5ODB0?=
 =?utf-8?B?WVlkbVBNK01EM09nZ0FZYkxhYmdZZU1tcGdKNlpNZzZnK0wvR3M1UnRTZW93?=
 =?utf-8?B?bmRmWHNBYVNYam8xMGV4cUUvaitYM29aRDFPdWdOWmxoUWgzSE90cXNjV2lP?=
 =?utf-8?B?Yk03dFppb2V0LzFPdDdhRjJwZERHKzVsMGswSEx6SEtXaHZGcVJjdzVBVTNs?=
 =?utf-8?B?d0RGU25GS3lldWcvWkpSV2lTNkxVdjlQcE13amVCL05VQUFzVVF2SWtxMTBZ?=
 =?utf-8?B?MU0waFB6djhwNW5SNTVFa2hGalJTaXZmZ1ZYWWJxd1BWQkVNcUl6TkpBVnFV?=
 =?utf-8?B?c1NDaFF1MDIreXVkM1c2ei9KZmJVOEFuakh2bSswS1IrNzIxOE1Yc2RBeG9y?=
 =?utf-8?B?WjI5dEdGODBPV3hzM3l2bGdYVU1HSlhwbDR4VXVSZm93ek8wOVB3WDlSZjJP?=
 =?utf-8?B?T0U0QVdsOERaeFlodEtNTUpGWHJYbkVwcDc5SUs5NG51TndwbXhKZVN5b0Jq?=
 =?utf-8?Q?oxm7T0m2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e0f185-3ebc-4a87-52a9-08d8c38d7fe4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:06:17.8009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmoA8/C/YM8zPB3AcKG33DFohnUiE3pGzPkCQrTJH6ZYrr3QJr8NNXo26pATmJpJpw2wpGh+bGelLmhbdVNEt2oVFu6lzF16JxeOvh5refI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------4ADF776D8D13076AE70143C9"
Content-Language: en-US

--------------4ADF776D8D13076AE70143C9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-25 10:23 a.m., Leon Anavi wrote:
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-socketio_4.6.0.bb => python3-socketio_5.0.4.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-socketio_4.6.0.bb => python3-socketio_5.0.4.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
> index 7d96398e9..70db342cc 100644
> --- a/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
> @@ -9,8 +9,7 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "python-socketio"
>   
> -SRC_URI[md5sum] = "44bb7854234e144655ef9c34b0165704"
> -SRC_URI[sha256sum] = "358d8fbbc029c4538ea25bcaa283e47f375be0017fcba829de8a3a731c9df25a"
> +SRC_URI[sha256sum] = "f53fd0d5bd9f75a70492062f4ae6195ab5d34d67a29024d740f25e468392893e"
>   
>   PACKAGECONFIG ?= "asyncio_client client"
>   PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
>
> 
>

--------------4ADF776D8D13076AE70143C9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-25 10:23 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210125152337.20937-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210125152337.20937-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-socketio_4.6.0.bb =&gt; python3-socketio_5.0.4.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_4.6.0.bb =&gt; python3-socketio_5.0.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
index 7d96398e9..70db342cc 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
@@ -9,8 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;python-socketio&quot;
 
-SRC_URI[md5sum] = &quot;44bb7854234e144655ef9c34b0165704&quot;
-SRC_URI[sha256sum] = &quot;358d8fbbc029c4538ea25bcaa283e47f375be0017fcba829de8a3a731c9df25a&quot;
+SRC_URI[sha256sum] = &quot;f53fd0d5bd9f75a70492062f4ae6195ab5d34d67a29024d740f25e468392893e&quot;
 
 PACKAGECONFIG ?= &quot;asyncio_client client&quot;
 PACKAGECONFIG[asyncio_client] = &quot;,,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4ADF776D8D13076AE70143C9--
