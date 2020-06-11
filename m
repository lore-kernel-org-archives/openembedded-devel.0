Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.53])
 by mx.groups.io with SMTP id smtpd.web10.7179.1591881773848898996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 06:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=As0wpmhP;
 spf=pass (domain: windriver.com, ip: 40.107.76.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVKWgomZOMBCIkLxoXHS4WdYfijud0h1NhyGu9s0N5CgLJk3yYupB/qUhTM4DTfuV0gJ1YgDpMGbdLG9EsMJ3LcY5MMQhf63d21Cn7HiHazbKIzOXQuNUUF6Qehi5tp6YcJSjEVKuGSClhA20xE2Aw2rBzxkMs4JOL6fsT06jwvvS2DLwzn8c8cQkneoC9V8lPuurcdqpuTC9mVuIMLL+LLhxdaO7nMBDwIHHXWqvmYl4oDUoEcqB4VGKAr7yzy2ZuV8JWhftXPeEOFZWiSTWcaifMSjxINL8uvL4ljIU3xthVaEFNsrTu/hrUtixi+JONQcrBtdVw1WSj6mqnbFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUVlGscN3WFaLSP9w+GbjtyJl2mXEE7B0wydeBx3HGc=;
 b=fkiDgllHEIiltX+oRHP1ca9rUcJ7sHhzSRlp4KALyHb+KbtR4ReNaY1JXCsv3Nplha3qHFhFBsx0TTZl9A76uluHyHyNy9oZmyBN5PrBnJJLHYsnXZQzQAS0q43V0c1DxG+Q/eNSpMzg2enWwyz1nlPf77Tn4xVKVXtXs57YLHkcnShDPiiD63H4hWrKQvwUMG3WWTPQSWAc8IVrZ39r/RIW3FYZr7oUYRXtek+OumXSF8mDvUjQMkV/cH744QAOsLsfI4Zj0YJZxTBI/8I2gYChcXyZqVolDQGVz07Omv5WwgiCXT9zGwq8g/+7I7gLJGdxBCtffhCDcbmiwDXj+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUVlGscN3WFaLSP9w+GbjtyJl2mXEE7B0wydeBx3HGc=;
 b=As0wpmhPXbi34nxJHcHH1x4X756I9zVYqrTGuQranHDTenzACz7HO0PLcgYtNLncL66YBw1ZzaWat1Dwq4GZ+D6SV+cdOKJhxtJiqL/JBILuZ9wdL0IUnRUQZXtkxl9te/cD8nu6vv1KApw4IZnVQ/CCE6wFRBFscjioq8kTUOc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR1101MB2068.namprd11.prod.outlook.com (2603:10b6:405:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 13:22:52 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 13:22:52 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-meld3: Upgrade 1.0.2 -> 2.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
 <20200610131536.31426-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <06c688ac-3348-5be5-7d86-59e747cc83ec@windriver.com>
Date: Thu, 11 Jun 2020 09:22:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200610131536.31426-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::22) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 13:22:52 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5976be44-8c68-4a0e-807d-08d80e0a8b77
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2068:
X-Microsoft-Antispam-PRVS: 
	<BN6PR1101MB206842BE1D8DC2F5D8CCA7909F800@BN6PR1101MB2068.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	07ZNacYMl46D8L1IwBDaWUTFuNH+xtGHcgMvELGdpAilK12d3wDCsvP13acDznK9qGGspi+nduR34EW0Z8t8P4gLCIE5emiQuok6lV58JyxVQIIsAsW6doxEVVHWF0/Q3WdjUuhfFfgIQPh72WL1+cEWC2pvTAh//g8XRBYF2SqoztgzT45wbhhIq7/V23T7wkfqubX+Cn+8DuegCcM07Z/mwVzi0Hre1itevYY4xrDXrNHHydiJahrxVb4VBZKm8S5RwgGTCdKia+GrbVver0m4bouKLIPbXBVba5VPZiVY8EmoYg5umji35effnvpy7CSZPWUb29kLZJaeuDAd7KlkVvBwMKGNGcB37TVohqr3/07TxDu9kzs/QX2ns+hOWMPGk5epz9XemGFkATsh1XAu9/cA794l/EH2lRuRaHFZhSBGWM9YNNvFGwS8hBLxr1Hq7DbnaZas/reXQifOoQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(376002)(136003)(346002)(8676002)(956004)(186003)(16576012)(2906002)(16526019)(966005)(316002)(6486002)(478600001)(33964004)(8936002)(2616005)(31686004)(166002)(66556008)(26005)(52116002)(5660300002)(31696002)(44832011)(83380400001)(53546011)(36756003)(86362001)(66476007)(66946007)(6666004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pjgXRmWxDnaC0QcPOGoM1A1jYALnRMZgU3NaMXqYmY+1dbVqYd4jWCEnAFMEPdHi1y6z3C8FXLT+vwF0CldOh1oImKA42fTNpdyHYSPSDguXIb3wtdrMYeWt3z4AvnSyWkHPYEOXuSihiCM7GXXRMvrFxRb18+xambszhxx9B5vMxevGe7eP5zuUqMvyArt01yBAD6p1ls6v7kZNQCQfPH0Cn5azYWjPEtFlYCibCuCvIgYG3CKZTIJHliE4sTGNm2Q8+N2VrlqG6AnSnU39JhG06dJRSGOmKUJIFptMeEgldyqLUghGKP1BdZHOjch7TU+jNorBoJZKSMBfezg8spnjLgD4zJnkTBBeLurnn80HoXf7yAiNU3L9esCaA4pDqNdT4zCpHIIc2rpvXePTgSQpd4LrWHBMMrjS0fmWcC0klFPXWr6Ao/5t5k0MaffYlGweCYzxlOQO3lBHIICQNt10D2R/E9hoqDGOENTTfcM6Fa9tr0PZ6fbFOZDd1c1l
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5976be44-8c68-4a0e-807d-08d80e0a8b77
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 13:22:52.7100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OET82oNL320D1o5K5qDUFTi1Q4QfPCmqDQbAFYG8RD0UMJeIQK0Ccun+ZyhS50DyCkWKoB2xIeWyUwswLxby9ZsbEkFcI2IUoDGxIR3bui0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2068
Content-Type: multipart/alternative;
 boundary="------------80C60945906AD82787E9F9BF"
Content-Language: en-US

--------------80C60945906AD82787E9F9BF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 2.0.1:
>
> * No further development of the meld3 package is planned.
> * Fixed a DeprecationWarning on Python 3.8.
> * Removed support for older Python versions.
> * Added Python 3.7 classifier to setup.py.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-meld3_1.0.2.bb => python3-meld3_2.0.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-meld3_1.0.2.bb => python3-meld3_2.0.1.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
> index b3e68c1a9..1223ae953 100644
> --- a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
> @@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/supervisor/meld3"
>   LICENSE = "BSD-4-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf"
>   
> -SRC_URI[md5sum] = "3ccc78cd79cffd63a751ad7684c02c91"
> -SRC_URI[sha256sum] = "f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558"
> +SRC_URI[md5sum] = "1add16caefc9e6b82ef4f40532cb4918"
> +SRC_URI[sha256sum] = "3ea266994f1aa83507679a67b493b852c232a7905e29440a6b868558cad5e775"
>   
>   inherit pypi setuptools3
>
> 

--------------80C60945906AD82787E9F9BF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200610131536.31426-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.0.1:

* No further development of the meld3 package is planned.
* Fixed a DeprecationWarning on Python 3.8.
* Removed support for older Python versions.
* Added Python 3.7 classifier to setup.py.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200610131536.31426-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-meld3_1.0.2.bb =&gt; python3-meld3_2.0.1.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-meld3_1.0.2.bb =&gt; python3-meld3_2.0.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
index b3e68c1a9..1223ae953 100644
--- a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
@@ -8,7 &#43;8,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/supervisor/meld3">&quot;https://github.com/supervisor/meld3&quot;</a>
 LICENSE = &quot;BSD-4-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf">&quot;file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf&quot;</a>
 
-SRC_URI[md5sum] = &quot;3ccc78cd79cffd63a751ad7684c02c91&quot;
-SRC_URI[sha256sum] = &quot;f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558&quot;
&#43;SRC_URI[md5sum] = &quot;1add16caefc9e6b82ef4f40532cb4918&quot;
&#43;SRC_URI[sha256sum] = &quot;3ea266994f1aa83507679a67b493b852c232a7905e29440a6b868558cad5e775&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------80C60945906AD82787E9F9BF--
