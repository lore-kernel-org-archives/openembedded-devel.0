Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.68])
 by mx.groups.io with SMTP id smtpd.web10.9223.1602632529155428010
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YsHHFVFb;
 spf=pass (domain: windriver.com, ip: 40.107.236.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv/CLAtoKxOgCsaeOGVg8nOxYXYyzidGVesH9k3V6rNN/5l/cE1xhP6sDRdwU1lOJopjRameykpSO8GInRsiaGC3nkK1ZI5asYzCC/30X6NIMcQhwz4awvimKEbca7tu6nHdOr90o70Y1Ip3L93eLIucsMVgouugDIZQeCoX24ZzwaIbqG7AbepECKP/7UF+UE6x7ToDh0eNOt2YcqYD5/9vYTuy8GpX9QOKceNZbBRQJAzMjDesN80M/WS92pREBqbFmlYF/kDZGTuOtPM075666gNbPWSFm/qyyGxVOuBVehFswfBLlMu49TjAvbfuMRPDI3iXOZV6mIezZ88tkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbfYbz/KfZ7nHfF3zm4R2h9bFuncU0WmZmF6cQ8X+A8=;
 b=FLpV5VLMNKSy7lSESXSY3weK4DuNYWJwaBS6LSOjo6sYXm79MzJa4lVt1e3ogYlYiVOUyI5efK0LZZwHce1Zq1lp9mIM91uoi4QWvBDQTkLNxSddlcGmTUV4nvq8aFRQMdNE5owH8wBbiQYdHxMdMiDeTCjcaerbueLDGyNZJHaaqi3Zh4m3tKoKNn2KYjsyv2woZpoqUK9bNk9Uus240F2HvVdf+hPxaHWf6yiL1iLuYIZQCFuHtJs/Wfi5Y/W8EIpg93msbwtcifkXCYElnLsiir0e+XLEkDJXjp0PPR/HdbYAHozmJvMIul7pmP0VITYACkt63qZqLl4wfTmxag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbfYbz/KfZ7nHfF3zm4R2h9bFuncU0WmZmF6cQ8X+A8=;
 b=YsHHFVFbeM2pgNRxT/qV+i6ehk5GNhcWwW23FKnXwZ3urpehHqbPBay2RRcDLblEDoFbo2ud6qjv+h9ZF5YGkAP0rCBQ2Jyg6g2gUdxUTZJWGsUg29xwf4k+lEhLWsknjMl7AMZ0IgZL3AGb2krzmyiiE9LvW1vCaXBIrNw1YPk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3445.namprd11.prod.outlook.com (2603:10b6:a03:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27; Tue, 13 Oct
 2020 23:42:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 23:42:06 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-pywbem: Upgrade 1.0.2 -> 1.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201012140022.15761-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2e214045-7b99-3cfd-0ef7-1f74520b9713@windriver.com>
Date: Tue, 13 Oct 2020 19:41:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201012140022.15761-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:1d0::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Tue, 13 Oct 2020 23:42:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c31161c2-db45-4449-d612-08d86fd197e1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3445:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3445817D9EDD0DFEF2B0B22F9F040@BYAPR11MB3445.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HzL0yHQ7VDZztW1KmPaPugLMBk2TEc5sF7Ez24MaOQF6U6bVineDOBgVwngSJm62bAaYnAJKA4C6K+TQ3pRV1eqW6Ye5eKDd6bLVWmVd06EElLHu/UxL997U1xtF1Wg1VqzEHVKkUr/9K0L6WHZa8FtrKq0Qv5R3r4QRQD5XpFahmKrHqNnea2Bq0vJnOCR9S8Qs+cC+YPAoRbuRBHYBOjGeIdjYychx0SXY5EO825Aks/NNUukcVGSb5WPxN9CWayQdHFxSfyJP583fXIKWO/wumcBwH5c+ceTgeOZJfMVZqmWmPy04FSzDt9PJpLDQ3ZU3y2tdNo/tOUDu6U1mAeGRf8WTtiHoItOg7EIZ+F84S9j9U0M6BAZgd8vwlJG1iSm+52XyxmjUG+0iezhLf2zkVQU7gBHJ3ZSNXENg8uxLKP6D6GBoB1urRNDWUMCXJoe8oYbi7M4jONDuz4AuzA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39840400004)(6666004)(166002)(26005)(53546011)(31686004)(478600001)(2906002)(83080400001)(33964004)(86362001)(52116002)(6486002)(5660300002)(83380400001)(8936002)(316002)(66476007)(186003)(31696002)(44832011)(16526019)(8676002)(36756003)(956004)(966005)(16576012)(66556008)(2616005)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SRBhB9yYeIQpApTrUogTAW7npNSkajG1ptjWxCS6a4gJsZuO1Vg0ApoJvYqJ2RsDbVfiENwWzse7r7eO2YrbLGSFdM6Wehcwca1t3IeinuECmmxQkjTy+1xYpcL4SGhkOSom3PPHTwN0B7P2Za6HLvWWWqlzPGz0b9rTimfvUe4HYnYtR0W37w0OJKYe/NGMyNOIiOZ6lfv+bAE8yHE1SFwQ80yKriYJLiYrhekJJy2CBjONDJbyivJiTllcmvT4/AN4Xr+8lZfXim8ift9OHZc6DcEpK453jEQKQVHl2yQrlp7l3/ScpM/ddGOGZJNlP4VuSU5C/fByHiRLAkHLTlkyq35E/sNTFdlTd/sQxipZLz/6vLjo3ZF95GMh7pQEF8ZmPP/i/5Kv4FXDRHux0v70La1LOOEgoWMl80ZyDOSVW3BCAPNXwPPX2bj4+fOmRvqQL/6Myd9mO29gXa05UgQH+rMdUDYoIcgpYG4t86IKPOwxMjuFaJLF5DY+m9c3R+aH3c0u46yxMOMF4nNuUhXKQslTS29a5e19pNkWuDtDMTVwbdRXO9bOuktjH7IhkdzitDsaKmKiej4opCViiI4aPGKSfMFyR+4eFXzdLViQBkNaPNArrOZjeRwVKVMJ4vafYSKDuId9WFLPOWGmyw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31161c2-db45-4449-d612-08d86fd197e1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 23:42:06.3251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+/kg3PGJ3WOITUcc39azo5cNbnsL3vdhoWNib8o5r6zw0fhVffp4YAR9+wBPpZcdm7mPChiPaUdXxfHL12bi1vSa/icatWqXVyaT1CCskc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3445
Content-Type: multipart/alternative;
 boundary="------------7EBD911EDFE95A7FEFEE3754"
Content-Language: en-US

--------------7EBD911EDFE95A7FEFEE3754
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/12/20 10:00 AM, Leon Anavi wrote:
> Upgrade to release 1.1.0:
>
> - Test: Fixed dependency issues with ‘pyrsistent’ package on
>    Python 2.7 and Python 3.4.
> - Increased minimum versions of nocasedict to 1.0.0 and nocaselist
>    to 1.0.2 to pick up fixes needed for pywbem.
> - Windows install: Upgraded WinOpenSSL to 1.1.1h.
> - Test: Changed collection of .yaml files in function tests to
>    address DeprecationWarning issued by pytest.
> - Upgraded the minimum versions of nocasedict to 1.0.3 and of
>    nocaselist to 1.0.1, to pick up fixes in these packages.
> - Removed dependency on package custom-inherit and removed package
>    from pywbem.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pywbem_1.0.2.bb => python3-pywbem_1.1.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.0.2.bb => python3-pywbem_1.1.0.bb} (91%)
>
> diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
> similarity index 91%
> rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
> rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
> index da731989da..d68ae9abf0 100644
> --- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
> +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
> @@ -16,8 +16,8 @@ HOMEPAGE = "http://pywbem.github.io"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
>   
> -SRC_URI[md5sum] = "0f171e365e294554f8e7624ccf511067"
> -SRC_URI[sha256sum] = "66d8ec82d30f2b95d8b4bd51659429066c2879d3f46292561f5fdbc7fed10f3d"
> +SRC_URI[md5sum] = "6ade0cda6a997542d61f15713c2dd971"
> +SRC_URI[sha256sum] = "4e2baa4b4b88943cca32c7eb588fffff22ce86c748ba7544e01149f9638014fe"
>   
>   inherit pypi setuptools3 update-alternatives
>   
>
> 
>

--------------7EBD911EDFE95A7FEFEE3754
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/12/20 10:00 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201012140022.15761-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.1.0:

- Test: Fixed dependency issues with ‘pyrsistent’ package on
  Python 2.7 and Python 3.4.
- Increased minimum versions of nocasedict to 1.0.0 and nocaselist
  to 1.0.2 to pick up fixes needed for pywbem.
- Windows install: Upgraded WinOpenSSL to 1.1.1h.
- Test: Changed collection of .yaml files in function tests to
  address DeprecationWarning issued by pytest.
- Upgraded the minimum versions of nocasedict to 1.0.3 and of
  nocaselist to 1.0.1, to pick up fixes in these packages.
- Removed dependency on package custom-inherit and removed package
  from pywbem.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201012140022.15761-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pywbem_1.0.2.bb =&gt; python3-pywbem_1.1.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.0.2.bb =&gt; python3-pywbem_1.1.0.bb} (91%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
similarity index 91%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
index da731989da..d68ae9abf0 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
@@ -16,8 +16,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pywbem.github.io">&quot;http://pywbem.github.io&quot;</a>
 LICENSE = &quot;LGPLv2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24">&quot;file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24&quot;</a>
 
-SRC_URI[md5sum] = &quot;0f171e365e294554f8e7624ccf511067&quot;
-SRC_URI[sha256sum] = &quot;66d8ec82d30f2b95d8b4bd51659429066c2879d3f46292561f5fdbc7fed10f3d&quot;
+SRC_URI[md5sum] = &quot;6ade0cda6a997542d61f15713c2dd971&quot;
+SRC_URI[sha256sum] = &quot;4e2baa4b4b88943cca32c7eb588fffff22ce86c748ba7544e01149f9638014fe&quot;
 
 inherit pypi setuptools3 update-alternatives
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------7EBD911EDFE95A7FEFEE3754--
