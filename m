Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.61])
 by mx.groups.io with SMTP id smtpd.web11.13297.1597334215459790568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=T3+1I6MY;
 spf=pass (domain: windriver.com, ip: 40.107.237.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZiBdqHE8UjnjCe1ctCZCOPegloo3c/pSqBi4vak0Vr3BaLBlFECnOkrO1JMrPdLrE14CbcMSDK7YgqdanKHetsZKk8ZrpuOzMWSt3pQDlI0o0SbSczSsGF/yJfAUK2AuW6DLXmgml84xg/kgVG0pyMCeWitWoZhXtA+L1m8kweHOpWZywEfCBkQko8Ja4se06c0WADpGwG9Hol97rd9K9g8nQOfSJqNAQXA3D0O6/0pO3rvMc1l1R+RZK0K3RU7E5ADLIWwqgsRpKjWM8KObv+fXMmvlV91HBQpbl1H9bgFnYdZo2giZ80j2mLaouBFZMUiHlO5SbGKDOZRwUpLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ez/B3RkPmnvl3dmUt3IV0YAL2iEB5t3Z72gMq7p7g/c=;
 b=NlWVDITHG5wWVMsrG4x4ypvep1algSSeoUOmvE6RMpBvx9fJhSbvDwqdO6Krs2lqNImoIplaVzNWgS9OGmUeNsdbWPJxc1FvI+nMsgu1GwZdqHISejZUE6ReGbK4QjahwRSiBLlYk3J2v5JGxa/K+aNtxOMcc4mALhL5xgG9cNl+yKebqoRLa6lk+cvgYRIIqqy5EP0wtcsGe3teddUaia/ViOrg1EUQI6S70TFxwZWWaA1hyUvqTWVi0cVnCKi44ZIsGEwwgSgcUb1eFG56Jm8npsXxxpVuhB3PVX0f3sJasOMQ0I1xzsolzxo8ctTRxtrEGNilS8q3UEvf5FMZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ez/B3RkPmnvl3dmUt3IV0YAL2iEB5t3Z72gMq7p7g/c=;
 b=T3+1I6MYyP5j/lad+esKaS7K2MvwVRLjzoNaZsNOc+OrFIzcmT3RoQh8XO7Ua4YX5G9IhxS2gIHkbcurqZxsDXgq1NjGd8MbyPemT58tpksSOJRbiN6WkKy7DNb1L6/umRLR1jFSQm2dqiFvrSrdyuxf9P3gLhJH7gskKpld+3A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 13 Aug
 2020 15:56:53 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:56:53 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-pytest-timeout: Upgrade 1.4.1 -> 1.4.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200812164335.24599-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5299c759-2d71-2017-034e-5db7c0779e41@windriver.com>
Date: Thu, 13 Aug 2020 11:56:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812164335.24599-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:56:53 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c2d7507-ab02-4dc0-8693-08d83fa17f76
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB360694E6FB7227D35730B8B99F430@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zFkDoMB8JdvO+2OtVKmd2bcwMEfmIuWVKJjbd49g3LgqxOsi9hqmAzSENN8cmPZ8WQsOfmtqwO6wC0a5DUAIBqVpiWfpo/BaClQ0YK0RRQmG56W2TPrw+DF9Oiuv2HXtH/NdSUU/6pnN16sekgqegm7KjHGAceJL2CXBpn3wVkAPjCEEIYSQhXBxp8srwN4P2UjZe7NcXnU9qpJP+Tvt//gCuQXF9UkkI6zzyndwZvMVpiLs3rKXURGlSTG3r+Q2z0oVAJrY9c5DtP46f0E8HvTYVHyxAjUvYJjXuMCX35BHafmi3z61s9nHnfpQDYI5uJzqYFpBHy7oIGl4FZfNCCvyitWNXSdLMjwcCpp4A/MmVvQwI2dSyI/2COnilGYFThsBTk/eFU5rHtdNyJ53Dy2m3oVgav1UP+RzyFZgvCnRsA5h8lE4FoLahHSMrXP96/B8VtBxbRNRzkGLWNcbOQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(8676002)(31686004)(186003)(8936002)(16526019)(5660300002)(36756003)(26005)(6486002)(478600001)(2906002)(31696002)(44832011)(66946007)(956004)(166002)(66476007)(966005)(83380400001)(86362001)(66556008)(52116002)(53546011)(316002)(33964004)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2r4Q8TQLNir18jd0X0OdxXUv2QkypJQa851UaBcvIwX8akiS1Vy1eoUFoEpqcYvxu0J3qL7xAtjG2leSW+b3hV/yKiHcDnsaAqnKql0YgjmQDhmCFe5rG3wsykgYvFf/3Sf0fU5JSmWV8STjjFjvvzEagxrJqxUh2Tsdf75TtTJgOmQgHZI1dgp4eY6QQD0bI8s6RUbPJ0VtB/KrrXqjnAhYCvKJmJuPPkVjZxCgyIHVym85nizQxlZSjJP1RkbzWBD99WE2HZ06ptjkt+bCPeLnuAIYERh3kx80HPEdkMX0DpgOMBUZddc7A9lvzG7QPh5aH2mXYO8yzhnNLDTd7FzTzVFiq8xyHGK5n9D1jLFHEwbJIBMR0ipLTpqVkjmDTdVsUfidT8K37LhaPPwRYSVHvxLBPKO3DbElQyFvcSiyYfDx2JFyNZPhPX/VvdudTuP6hVyS6N49JjfnC6Gv5d0xXpUg5S47ykVMZ60sf43xC38JZj0QSe1aQvPmkJUD4Y16CKAAJJHT8doIBCxs9Xo5KovrP4l7aO5Qgr3t/eSZB2nMNkam8jKLQa+wxkx7M3+jsNaGLYxnojk6nKZ8coyzRkzBBNuVcb+hRWiM8S/MQX8T7Mn/M5/zK58PeUfpMnutSddBTmyXtHq9Byg/cg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2d7507-ab02-4dc0-8693-08d83fa17f76
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:56:53.6142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5p0DoWGaW+XCsmk6PAgssJNEBvvCHBsXT2juNjQVNy8CGYMsEypTRNcdX3rr+9DJGMHZ9/+tPxnpEOKhwVDlaZ1+mORms3NsfiUnnyDrq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------6B32E8FBC5D3D1B795EAE921"
Content-Language: en-US

--------------6B32E8FBC5D3D1B795EAE921
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 12:43 PM, Leon Anavi wrote:
> Upgrade to release 1.4.2:
>
> - Fix compatibility when run with pytest pre-releases
> - Fix detection of third-party debuggers
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ytest-timeout_1.4.1.bb => python3-pytest-timeout_1.4.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest-timeout_1.4.1.bb => python3-pytest-timeout_1.4.2.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb
> index 506f4c065..906d67064 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
>   
>   PYPI_PACKAGE = "pytest-timeout"
>   
> -SRC_URI[md5sum] = "c458dd7d417a5f2dbae0f1f6073845f7"
> -SRC_URI[sha256sum] = "6d0fb4ce74cebb81be252e4e0d9c2a91f30270b33208cfa0f1da6eed9abf18ac"
> +SRC_URI[md5sum] = "552cc293447b00f7a294ce7a1fb3839f"
> +SRC_URI[sha256sum] = "20b3113cf6e4e80ce2d403b6fb56e9e1b871b510259206d40ff8d609f48bda76"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------6B32E8FBC5D3D1B795EAE921
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 12:43 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812164335.24599-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.4.2:

- Fix compatibility when run with pytest pre-releases
- Fix detection of third-party debuggers

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812164335.24599-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ytest-timeout_1.4.1.bb =&gt; python3-pytest-timeout_1.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-timeout_1.4.1.bb =&gt; python3-pytest-timeout_1.4.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb
index 506f4c065..906d67064 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff">&quot;file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff&quot;</a>
 
 PYPI_PACKAGE = &quot;pytest-timeout&quot;
 
-SRC_URI[md5sum] = &quot;c458dd7d417a5f2dbae0f1f6073845f7&quot;
-SRC_URI[sha256sum] = &quot;6d0fb4ce74cebb81be252e4e0d9c2a91f30270b33208cfa0f1da6eed9abf18ac&quot;
+SRC_URI[md5sum] = &quot;552cc293447b00f7a294ce7a1fb3839f&quot;
+SRC_URI[sha256sum] = &quot;20b3113cf6e4e80ce2d403b6fb56e9e1b871b510259206d40ff8d609f48bda76&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6B32E8FBC5D3D1B795EAE921--
