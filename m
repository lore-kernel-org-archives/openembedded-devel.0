Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.52])
 by mx.groups.io with SMTP id smtpd.web11.10171.1599060460463182487
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N6TwzXAK;
 spf=pass (domain: windriver.com, ip: 40.107.92.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKfbz4WynOEpI8DEqQrXY39zdyagaIWwISItL0bCuLBP0HqAJ2vqAFN7jProoGkRAJ6FLVbAYkmBzpkGqSoR+i9nf7CpomaFPa7/8csLjGjWBgyswF7uD3D8PD5+VKIeyfCo3etBmquTejsXfsh3C/QGJRlRbpCeAIJPmUv2AsBX+6Knl6T7ZLqpbqV6TBOcb6x7PEUaclQ6LuVKlZQDUrCJcnfBNygT4Cl35/tBN4FKc6f7qBM5Vwow2NGnNu0CY2rwAtra1U90hANVXd5IKt5NDFjOMr8DrBMWevPRAz8lgAYYraeWUkV2MsnMpTL4+nX5Kj+oA2VsndKX6xb33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxnQeP0U09FyV0EfRVpSdE+kv8IGgzTLlpClGFocFJs=;
 b=RRocN6GzaV1E1UUB28Onw9F4ZLAR4E8oFHUox8b1SfYhKTcGLXOzwrMQLin2seGc7nLywHKAyknEo4zlpGblut+/n8TV9fwQtEaWLzAdE20jvgUwqifCrb/hGXShh5GzjfSgZQd0DzxYAFIRP3iUpobzsSHOJ7m2Ot+szL6zjmCL4hH2HGwp93SZrojQ5VDtSCZpdp3swd2y5fVDx1CoRj7N3KpYrXmv1KvupDIuw2nmGmuCymsoxDDxdVCE1IOv247sEUYlchJiXmZbxXX4pGsnGo2wwvy2+37TB6oOSwKjBzE4c0wqQKMLpSdKs703CTuqXIWrBC1z8JiviVAarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxnQeP0U09FyV0EfRVpSdE+kv8IGgzTLlpClGFocFJs=;
 b=N6TwzXAKDs4yqQif/5D8LdaG1cAAv3+MZBv+0e7Bpe4WVo9Q3pyH2szkZeg5PO5ovpwi3xJJ4iToXF0lFr4f+wzQujZ88tTP3DK705K+CreY7VzAuCMbtmYKtDSjyv+1WopVzOsVaTNA7CPpvL3Lqjkrgs6OipqIQ22oFPK5Mlk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 2 Sep
 2020 15:27:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:27:38 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-cryptography-vectors: Upgrade 3.0 -> 3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200828135131.26321-1-leon.anavi@konsulko.com>
 <20200828135131.26321-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b96c0e35-8fe3-db8d-9db3-f35b68ee1597@windriver.com>
Date: Wed, 2 Sep 2020 11:27:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200828135131.26321-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:27:38 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56d40b91-9ab3-47fa-fdc5-08d84f54b9c9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB335271FA175E8C12EEEF2A149F2F0@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fd9kWTfA4+faFG54OQgHb9Ti0FUqwOtJPDTooYhDCPc1eNWPhqEiXKXC4wjZNYMhq/HZdIu1x+uCrc2jwHvDk/vEtaO6LcTFsHar9hxhOAr7IlkoCHQrRhzGw3HYsdPpyfSYaV/Mjh6WtAlo0PF9hZ3elwBb6acr2P16Q73Tzw50+fZn+OUlqabwh2lJiQbH8vF8Ftem4mdEeF3k4AQSy+gAyxLpwMciTW5AGnK1kkboLnd3GgEurwJmCXwJo6PaR/ODNksVZ/60b6WWHG5MzHO/Xuach8XKbUFHToKBxF6GpF11hEMLkZi16awTU4dK1PqGerIXkD1mDv4sy/fmcVsREo1IIL3rY8LIxhj7GIsc/h1QpzBZ0yL2cvBpxRD2GegErBYsVuqWZAPYlOnP8lpPWl6XFxKBL7b7grKO2GjA7vgeZeYDtN6mzd+IoGd6NXQMAsfzOxvJdAbDWiQafA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(396003)(376002)(136003)(66556008)(53546011)(966005)(52116002)(31696002)(83380400001)(26005)(8936002)(2906002)(16576012)(36756003)(5660300002)(31686004)(33964004)(2616005)(66476007)(44832011)(66946007)(956004)(316002)(478600001)(6486002)(166002)(8676002)(86362001)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	a7sz3eXlvm4ZazdB+uzIe90vzgJEkaCQpe4tzdkLWrI3wuuS8c7gy4Rmp6E38Vf4tyCoOoXxP3Db8PjnAaqCHEXtMeKTtnaKRzuKyVEqE0BnaMzA5M06MLH49q9+IvkEDJT6AXGy5Af3vQc7n0rwe8/3F5u3RMvsfqg11xoApTl8OoKwyU93KRytPgX0OccK94x3C54kl7ZrYq600W2V57IJQc3z74TQ4RXm6jhqDwb6alaySd51RgeGbAaP29Wv9NxSxXUwsAE9b/CHPiw4d9ZGVykNhUaymhXQNHujmMubGPmNQJNjTBj6KkLC6O0kclBdUpXzMi7KFguPByb030XSlfkKxlqbDSKL3PhonbyZn8u9j6gMhNS3J6uoSVs5yyQ5bkzGbj7cr/e0coTC+86KSR2ZFdi1HWo8NQnqILWg7WOnkVvFMSPNEEMG0fLvja0/QlWhePijV+NnXlH07I4q3+z21dyP4YRm7DSDU0EZ2jtTmWcGj4HyDCQKctqC7GiYjksBLbq7dAVUqFqcpMMx4gfwanJY/o4eVZUqbFH4RbjxFm9+XF2EoQsukShpqgz7jcPnpOEG1ljKqgNUN73h0JSS+z602tslJGBddwlDL1F0sI64ZmKPAoSrn/umowbbfWFonowLJqlHNraHSw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d40b91-9ab3-47fa-fdc5-08d84f54b9c9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:27:38.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgc5RKr1TZ+9J/I0iYkF+8z9kF4wq8H2OEjPfomzmqOAsBniDrBpgprf+mD+GRzMcOFwSaLR9fu9o9PKSLIsO+mefmOmIjnU5ghJhppu8jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------BDEF3BE40FCE85DC39AD1E51"
Content-Language: en-US

--------------BDEF3BE40FCE85DC39AD1E51
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/28/20 9:51 AM, Leon Anavi wrote:
> Upgrade to release 3.1:
>
> - BACKWARDS INCOMPATIBLE: Removed support for idna based
>    :term:`U-label` parsing in various X.509 classes. This support
>    was originally deprecated in version 2.1 and moved to an extra
>    in 2.5.
> - Deprecated OpenSSL 1.0.2 support. OpenSSL 1.0.2 is no longer
>    supported by the OpenSSL project. The next version of
>    cryptography will drop support for it.
> - Deprecated support for Python 3.5. This version sees very little
>    use and will be removed in the next release.
> - backend arguments to functions are no longer required and the
>    default backend will automatically be selected if no backend is
>    provided.
> - Added initial support for parsing certificates from PKCS7 files
> - Calling update or update_into on
>    :class:`~cryptography.hazmat.primitives.ciphers.CipherContext`
>    with data longer than 231 bytes no longer raises an
>    OverflowError. This also resolves the same issue in
>    :doc:`/fernet`.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...phy-vectors_3.0.bb => python3-cryptography-vectors_3.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.0.bb => python3-cryptography-vectors_3.1.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
> index 26f1a2389..59347c94e 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0 | BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
>   
> -SRC_URI[md5sum] = "689e44b945870a2ed197c0c35e4a0330"
> -SRC_URI[sha256sum] = "52eff0457b3148ebbdc16dc7ad569bb88ccb2578414936c8b2137a3ddf334239"
> +SRC_URI[md5sum] = "1ba5b0743e2876e909f7cfc28b744f27"
> +SRC_URI[sha256sum] = "2660bc3a720d3955341803195ae5352a236c5f26e01a178c44fc5ee1f0ef1182"
>   
>   PYPI_PACKAGE = "cryptography_vectors"
>   
>
> 

--------------BDEF3BE40FCE85DC39AD1E51
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/28/20 9:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200828135131.26321-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.1:

- BACKWARDS INCOMPATIBLE: Removed support for idna based
  :term:`U-label` parsing in various X.509 classes. This support
  was originally deprecated in version 2.1 and moved to an extra
  in 2.5.
- Deprecated OpenSSL 1.0.2 support. OpenSSL 1.0.2 is no longer
  supported by the OpenSSL project. The next version of
  cryptography will drop support for it.
- Deprecated support for Python 3.5. This version sees very little
  use and will be removed in the next release.
- backend arguments to functions are no longer required and the
  default backend will automatically be selected if no backend is
  provided.
- Added initial support for parsing certificates from PKCS7 files
- Calling update or update_into on
  :class:`~cryptography.hazmat.primitives.ciphers.CipherContext`
  with data longer than 231 bytes no longer raises an
  OverflowError. This also resolves the same issue in
  :doc:`/fernet`.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200828135131.26321-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...phy-vectors_3.0.bb =&gt; python3-cryptography-vectors_3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.0.bb =&gt; python3-cryptography-vectors_3.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
index 26f1a2389..59347c94e 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
@@ -4,8 +4,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0 | BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4">&quot;file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4&quot;</a>
 
-SRC_URI[md5sum] = &quot;689e44b945870a2ed197c0c35e4a0330&quot;
-SRC_URI[sha256sum] = &quot;52eff0457b3148ebbdc16dc7ad569bb88ccb2578414936c8b2137a3ddf334239&quot;
+SRC_URI[md5sum] = &quot;1ba5b0743e2876e909f7cfc28b744f27&quot;
+SRC_URI[sha256sum] = &quot;2660bc3a720d3955341803195ae5352a236c5f26e01a178c44fc5ee1f0ef1182&quot;
 
 PYPI_PACKAGE = &quot;cryptography_vectors&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------BDEF3BE40FCE85DC39AD1E51--
