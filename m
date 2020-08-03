Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.79])
 by mx.groups.io with SMTP id smtpd.web11.6696.1596490982282297614
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OTgKAcHs;
 spf=pass (domain: windriver.com, ip: 40.107.236.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJFlEpcvVH/F7NomMhZreORbnsrbaw7HFaXyM5IZ1vfepR3QnQoRdCPZ7IPCiKZOtbevcQ+b50SAKk/2gcnTFCVY/zLD3bukiZQOa+QmbfDtK+3YBq/TpMfpNvrA4s0RZcDW3pI628rKU8OBsyZcgnv3PGfqNKxVqVQij/SQ08XaZXPrv96bSyZUcJKSZKbMHV0PcYqXGGT0nYh9BD+GosYUZZFFwwEWX5jr6+q8ieXvQ4nJHVb0q8zXElCkh9jS3DvrQHBzqPLIYGh0QBeyhxGO1fWnqoc/X5SSsY4gpN4pviclNlWgCm0zKMoqb8mN0IsBa6jMrB4TIs/0JMHCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQSNDJhLZ1PxwMcetg/qrVvr1GeDupTsU06g55qZ4Gs=;
 b=oKbtURI6IyhJ7UIamfEcLBGSKV7XpRGB8+0+4BgzFp3CBV4ux/bI1jOnT5fg8gqUQWn1ObHzZJmXlpp3ajQzZzfqTZzhsaQ1uhrFdSTogSkUNyUvTxUhk9//Sqp/DXxfwPUzj9FHWMgIppirqLzxSCVOa4WO8HGMXyMxWVDyHGA34jJ4cvBGmwxXuBn0xvrPqDmQnTmjnSgb6UvWM/wiVKqSrEUTfLWmUZso/u9z/zZf2WTKOfI9qr9ajU0Kg1zD8PBGRi0UARYfgXHXPMbNGVac4Yd7Et7TuDg13MRYOWfv8OFM2rAfsr+Y3AervztfcHVISpo9S8LASaRvDQVBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQSNDJhLZ1PxwMcetg/qrVvr1GeDupTsU06g55qZ4Gs=;
 b=OTgKAcHsPpaowFjDBwQrJB6aEBvqBN4ZnwxLJoBEUls6/BeY7/UFFy8rwSDhvB6Kwcr9wmLv0tG9cT7B5uCMRP4+xr8PnjRoM3gBs+6Nyaref7qAZu9SllGhsd0t8TcWCrPR/Lo0hjYmBmDM8pr4yVvAHq0t7v3c7MuAFK3orC8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4101.namprd11.prod.outlook.com (2603:10b6:a03:18e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 21:42:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:42:59 +0000
Subject: Re: [oe] [meta-python][PATCH 01/15] python3-pywbem: Upgrade 0.17.3 -> 0.17.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <72be8644-cd0b-959b-7b8b-07dcfa736030@windriver.com>
Date: Mon, 3 Aug 2020 17:42:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 21:42:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fba3cce-01aa-4fd7-ee9c-08d837f63098
X-MS-TrafficTypeDiagnostic: BY5PR11MB4101:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41016F8E9E3C1A5C328F82909F4D0@BY5PR11MB4101.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HJuRRxxjTSxyBXTS2aPm3ipNNBALn/C3ZrU2+GyJInn/U5HtqP58eJcClljU0ntJgPOKly8eZYNJoLbWBb5lZOsZ+kDuGTwed4CSTZJDDYCbdImIw9kH9hcgjrByuQwD/A/I4C1GbIV1NCndxZJBLCChH87r0942rGdPQFBiNfqgjM08mWrESTcUu7u2BKstj4L8iNe6rHMclBINFJ240YmCE21Fzajz2TZchO8HYWrCgfn86buq5eDiNrsqollMXQNOgA4lerl+WXZFUz6AwNLGH0etmBEzQe/FvXPeHPrBDKJH5stUZTXEGfOZegTGd4syO7ZoByMUAvKlI73c1SD0LLCY6RmLYWgHfMEN4eMzOhOMQVRTS22Eo4yH63imWm0b4EwkKfIlauxH4NDO97Oo92H9LOiv1SFUimvbTrUkr30y37ftXD4QGafDIsvEh+9KBRdEekKrengJzKNE7Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(66556008)(166002)(8676002)(478600001)(6486002)(31696002)(44832011)(2906002)(66476007)(66946007)(52116002)(31686004)(16526019)(26005)(16576012)(956004)(86362001)(83380400001)(316002)(186003)(53546011)(966005)(33964004)(2616005)(83080400001)(36756003)(5660300002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	6In1CCEQxkawGakA3AvyalAND4DndIIQwYpuxifdy8C6SKAvgwzpGk0PEkAABDCxIPm3RiAfpyRizOfF3HjyfFWjllL2/pmfhIg1D4aUWpgtk6pJfgJgFN8xNJODbuSOQ02/3GJNBkNU9yNuRm9rm2fJokgMt9hxpOuS6FJezlud1tdR+mGEZ7Ed/l7Ns15f1aVEAyaJUzMCygb5gi6Plp2+F1CpyOWaequqU/K0GrHMn+im7OcTtitZObGke6RXxgIxxacNpcR0z8Kdipjw8+geuwdtJmaiKVKhlaf0axMLSFJq6v1fePaq4dtK5DQfDfemaLDuoaa1CMBPisMRDP2ADUi+dcPs4KOPZnlUQ/HHms1m6BG58w0M7nnU/MzjILmFOCnjw3b4TrZT1IU3C5Q1jJM/VuI4avZoDsUNDIkvU/jB5cIJ9ZA4zfIZLhUC6BCB38HOGJL6C2k+KPuQu1snhbZvXYqLuwUet1mJHraahpNgTM2z5Q3wLlqm74zFUkeBQBTadcd/bqK1lLbVZVkPMJShwHcaTJGxPS19cQDStKLrFDIDqjqKsv/dbuduf1Po7Pm6F/IN/izY/mUOYiYoWOfPtthAZapovklqi7NQy3+gpzeU2dnNt1YOwPy0idsmAa9/DeNPjmwhXRgSgQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fba3cce-01aa-4fd7-ee9c-08d837f63098
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:42:59.1525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2A6l8PVXxMqZWbKq+AdBLciky1LlAQc6yrkW0D2GJjuu90wicshF8BUhZN8gL1AwQHbOfh7RCJJZ3WtwmCIKQFRAfNrFYwfzuNHrPn92FWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4101
Content-Type: multipart/alternative;
 boundary="------------64BC0C6FB402EF4AD8D1BF19"
Content-Language: en-US

--------------64BC0C6FB402EF4AD8D1BF19
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 0.17.4 with the following bug fixes:
>
> - Test: On Python 3.8, upgraded the minimum version of lxml from
>    4.4.1 to 4.4.3, in order to fix an XMLSyntaxError raised when
>    encountering UCS-4 characters.
> - Test: Fixed issue with Swig when installing M2Crypto on native
>    Windows in the Appveyor CI, reporting mssing files swig.swg and
>    python.swg. This was fixed by pinning the swig version to 4.0.1.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pywbem_0.17.3.bb => python3-pywbem_0.17.4.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.17.3.bb => python3-pywbem_0.17.4.bb} (92%)
>
> diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
> similarity index 92%
> rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
> rename to meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
> index 930f04896..a804b0cc0 100644
> --- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
> +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
> @@ -16,8 +16,8 @@ HOMEPAGE = "http://pywbem.github.io"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
>   
> -SRC_URI[md5sum] = "9fbee6b4327f035eb212017b6cd84309"
> -SRC_URI[sha256sum] = "1de9963adda97d89d191d027ddc64167699a11ac42ecc3ea35dddf7679ac2441"
> +SRC_URI[md5sum] = "b65c03026bf2174e58e3e47a5e7e4825"
> +SRC_URI[sha256sum] = "5b54b65a5434bb16432415743c0d154feee0c6d7a8a2fee208719c67d6d24c97"
>   
>   inherit pypi setuptools3 update-alternatives
>   
>
> 

--------------64BC0C6FB402EF4AD8D1BF19
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.17.4 with the following bug fixes:

- Test: On Python 3.8, upgraded the minimum version of lxml from
  4.4.1 to 4.4.3, in order to fix an XMLSyntaxError raised when
  encountering UCS-4 characters.
- Test: Fixed issue with Swig when installing M2Crypto on native
  Windows in the Appveyor CI, reporting mssing files swig.swg and
  python.swg. This was fixed by pinning the swig version to 4.0.1.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pywbem_0.17.3.bb =&gt; python3-pywbem_0.17.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.17.3.bb =&gt; python3-pywbem_0.17.4.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
index 930f04896..a804b0cc0 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
@@ -16,8 +16,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pywbem.github.io">&quot;http://pywbem.github.io&quot;</a>
 LICENSE = &quot;LGPLv2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24">&quot;file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24&quot;</a>
 
-SRC_URI[md5sum] = &quot;9fbee6b4327f035eb212017b6cd84309&quot;
-SRC_URI[sha256sum] = &quot;1de9963adda97d89d191d027ddc64167699a11ac42ecc3ea35dddf7679ac2441&quot;
+SRC_URI[md5sum] = &quot;b65c03026bf2174e58e3e47a5e7e4825&quot;
+SRC_URI[sha256sum] = &quot;5b54b65a5434bb16432415743c0d154feee0c6d7a8a2fee208719c67d6d24c97&quot;
 
 inherit pypi setuptools3 update-alternatives
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------64BC0C6FB402EF4AD8D1BF19--
