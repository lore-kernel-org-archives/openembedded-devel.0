Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.86])
 by mx.groups.io with SMTP id smtpd.web10.10388.1599060555320143463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GgE2lgcT;
 spf=pass (domain: windriver.com, ip: 40.107.236.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnbhOroPQ+iVipynPOo3LTtTVk89IX8c0/arb9tzjBmqY8FTjRPQr1IyEVZdD/nDThWnRCRy3XAVU7lIKENCSYKmkiVNKLdRJjdwy6Zx7u2RFOjhb1bBC+VTLb9LfrczqD0jAY0HzBCsjU95fdUnrx2QeeG0FCjRQTQNGwHN7aKjaOaSl/aywRsXmBkh07f0kSNhaG3JITCPjxNdvn4i9IV1TZrCartiAt53HB6PozAJUyr2LmiLJvsHSau5UcUfuA2SXqDJCjdTeUL7PCeAwoev/tUEwL1tBkygab0EXL2LJnppICBBLhKaGCgsizbWVrGq3lvOo9AuTSmJ/BuiLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yi6exkhT3y6ESfJoxuZOwyAuXgpOzD97AfuWSCTFDM=;
 b=nv71ha1Rbi3KCpgMtg6koN3tYoUIxSpbSHxAbdv4A9CPH/FAb0F8kuFrFROtmXcUMsX1/9Jx7O3hSAzmg9eyXIsMFAavASTR2CD7OVEmoGi8rGmPUYwuQCVqRPa8mz5ibR/mM5PnUKOLmrL3M8q2s7gLNf6Pwfm830G60j3rs/d8i6PqJWT+hE0ZIzTPbgURXyMpSUgq3CHwDErIiG4/T+DJ8UpMt6ofV4u477ZmWmPc+YHSMpVV2q34k1WL0qBHF+SyUiDrEvDQPrck3y0JJwgtvQK1XBTQ9bblfC/H85+t2foKL59hhpHn2w15q4Hs/tGWz9op093pp5AMMT43WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yi6exkhT3y6ESfJoxuZOwyAuXgpOzD97AfuWSCTFDM=;
 b=GgE2lgcTT869HEz5weOB2UsBgxlXi6gB5cRAC6e5GM+3YHKD6WG+J8Tgp4w37wW6+swocMdHzKz54BHkuvk1wMyGa2SgzL6uG51fNZaCs1KR61yYrPIMML5Ock5TIz9yOJoQIfUA+NmaJA0Ze84744Lwq22kDZQX2y2VpP/EGZU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:29:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:29:11 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-paramiko: Upgrade 2.7.1 - 2.7.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
 <20200831070318.6573-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5b845a52-5330-f159-517e-f05889b065e1@windriver.com>
Date: Wed, 2 Sep 2020 11:29:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831070318.6573-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:29:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed097cd0-e468-43f7-c439-08d84f54f0fc
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30306063E92DFF348FF417FC9F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+kptuOT1I11cOdvTgBxfWWAupbnGfJU9s+4BWzJ6RVA0YWhffsaWIERAojHXV/ch8HgqTL7xYVe9/dv2DVgzQsGw4PfFso+r/7QrjvSqh46BbhRFqdhRMxs614cytsOa11srjsMu5RKuxqG8+kzCquB182g8xM6XRdSG9T1D97VI1qI3umVeSC6Ybw2MUDFd7nH9mFtSMoW6WxGsc5ITbX/lp8PqCnHjnmMKS5tNVE2aAprmySuJcpdsAJnZBqTUCo+fssLeG9dbM6CTZIqTXPY5sBwszyOCWt7ycz6T0kPlr/bSoq+d4LpcTtfPvIc0jp5KfmX2Uadya4tbDZ/MZMkOUOdn+YpTJ+42tYS3oO53B1FdgeHrrpAz+MJYkYSsS0gy5Wb2x7qqlW3aX3AKf4Xb63V/b7H0tpKtKWVfj8sVQvp5wSsZaYXO8Lt0bYRTnAXusNxAEojpyulN4VhAVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/Wq36N3INw6th3yFoUpT70vKE1p6ws0TEw7Bce1vqA2+zjl43eYOpCJO0Eoq4GIQ1wpD71En9ZWCjr9hzA87od6Vdo5n0cxJEXwEOYWbi1/7x/U96inpKf2oaJ3U/7N5D+Fo9KiJSokU4ZrWKtHS6nwLlkfTQV0ZG39fUPhNMnoFbtBdFM3xUf6TZ/u0Wcyu6sTj2MobHLyoEnAIyB1UcKLHRHpH1jgz0SJNI3WgtABDB6vf1nKG5Gf5Fi6+iB/Sn4Sq50XuLV7CvBceQUUyTw3aIVI7xGyaheQXcVbKLQS4mOf37+mVoqhAnbtZIQTel9UH23LQJtpIBrPYyaNtg5Crh7eSWsieUNKugxAhmHa1XqkkD92ezllpakkmd0fzSp2YgIhEnlo2SJKQQHG1XgcaniV1OQvdQ0Dzb+rU+6d/m5xGfK7KVeY8h7RoWuDIHkaREyBer3+JkrUqwdTtObIPecZtLar0aiRnZoqN9K8eeLI1ukdZuntr4EWgPXd89pbzlAzCZV1VfiQZOIV4nfmgcXxhMFMuoM5UMwyMBLwqo2nHsRK5SQUCgkjUD7pqaAnZ30Y7s7jdtLZGL0gN6uraFeWqSzqWI9+dWVJuvnUD17VG/ivFVLB7ApY9V4RVcVVQBuoRhpD8jIWd0qy8SA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed097cd0-e468-43f7-c439-08d84f54f0fc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:29:11.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NavludLUqpiQkiRngWhdnb2i75Tzxh4rIqLj8kwYeuueulheahbO6FCO4SfRGM9wKtlNYiZImRCY2aLmUKL+Ad55kofpT9IGTDnOmXLHo08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------48CFD35839185FAAE1DFBACB"
Content-Language: en-US

--------------48CFD35839185FAAE1DFBACB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/31/20 3:03 AM, Leon Anavi wrote:
> Upgrade to release 2.7.2:
>
> - [Bug]: Fix incorrectly swapped order of p and q numbers when
>    loading OpenSSH-format RSA private keys. At minimum this should
>    address a slowdown when using such keys, and it also means
>    Paramiko works with Cryptography 3.1 and above (which complains
>    strenuously when this problem appears).
> - [Bug]: Fix incorrect string formatting causing unhelpful error
>    message annotation when using Kerberos/GSSAPI.
> - [Support]: Remove leading whitespace from OpenSSH RSA test suite
>    static key fixture, to conform better to spec.
> - [Support]: Add missing test suite fixtures directory to
>    MANIFEST.in, reinstating the ability to run Paramiko’s tests
>    from an sdist tarball.
> - [Support]: Update our CI to catch issues with sdist generation,
>    installation and testing.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-paramiko_2.7.1.bb => python3-paramiko_2.7.2.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-paramiko_2.7.1.bb => python3-paramiko_2.7.2.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
> rename to meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
> index 0ead23608..324847c31 100644
> --- a/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
>   LICENSE = "LGPL-2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
>   
> -SRC_URI[md5sum] = "bf8239dc820ca86dd3c3226f4281c35f"
> -SRC_URI[sha256sum] = "920492895db8013f6cc0179293147f830b8c7b21fdfc839b6bad760c27459d9f"
> +SRC_URI[md5sum] = "44136d79da4cd7619e368018ad022619"
> +SRC_URI[sha256sum] = "7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035"
>   
>   PYPI_PACKAGE = "paramiko"
>   
>
> 

--------------48CFD35839185FAAE1DFBACB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/31/20 3:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200831070318.6573-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.7.2:

- [Bug]: Fix incorrectly swapped order of p and q numbers when
  loading OpenSSH-format RSA private keys. At minimum this should
  address a slowdown when using such keys, and it also means
  Paramiko works with Cryptography 3.1 and above (which complains
  strenuously when this problem appears).
- [Bug]: Fix incorrect string formatting causing unhelpful error
  message annotation when using Kerberos/GSSAPI.
- [Support]: Remove leading whitespace from OpenSSH RSA test suite
  static key fixture, to conform better to spec.
- [Support]: Add missing test suite fixtures directory to
  MANIFEST.in, reinstating the ability to run Paramiko’s tests
  from an sdist tarball.
- [Support]: Update our CI to catch issues with sdist generation,
  installation and testing.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200831070318.6573-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-paramiko_2.7.1.bb =&gt; python3-paramiko_2.7.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.7.1.bb =&gt; python3-paramiko_2.7.2.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
index 0ead23608..324847c31 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/paramiko/paramiko/">&quot;https://github.com/paramiko/paramiko/&quot;</a>
 LICENSE = &quot;LGPL-2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5">&quot;file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5&quot;</a>
 
-SRC_URI[md5sum] = &quot;bf8239dc820ca86dd3c3226f4281c35f&quot;
-SRC_URI[sha256sum] = &quot;920492895db8013f6cc0179293147f830b8c7b21fdfc839b6bad760c27459d9f&quot;
+SRC_URI[md5sum] = &quot;44136d79da4cd7619e368018ad022619&quot;
+SRC_URI[sha256sum] = &quot;7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035&quot;
 
 PYPI_PACKAGE = &quot;paramiko&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------48CFD35839185FAAE1DFBACB--
