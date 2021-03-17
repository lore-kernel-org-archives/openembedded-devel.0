Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.87])
 by mx.groups.io with SMTP id smtpd.web09.71.1615992772087999900
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 07:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mEKqwTWY;
 spf=pass (domain: windriver.com, ip: 40.107.220.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBw97D/YYIkJfbLnwgo+j1juClaghEDGlbQznnQubSzZ7inn0cjggxsHOO07BSz1yWueVXjPl7n/mOlKPOj/Lp/A62S5010Jx6Ut4cIuRc1qDtJ5LUNC+fv6UyfPeHli+zzMDI9x3irVM26cAnB4KtFkV3TOaJOVlZX1JW7jAXig4+OkNl/jaEtPwQW++mEr6iRpa4I1BRurZBfbV4aPFkj7YyyEpioKreU+z0gzjOufjq3CtQD4PBZ1BYCjaw2mUK5U2Zce2H4M3Ogel8mfkpkCXtVsbPYqWxjMp5HA0NeEJc9HF1KQyyPwe9emk0j3X3HumhvtLIJpopV8nEC1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2or36lMtWL3ep0/t4TM2QRn+X50X6eadOozqmyajZes=;
 b=oeYcKL2YRludQ/Kj9bxSATeM03BQoA/KiXGpl4lioen4DW0yKUnnDlpP/TtnQi2XouO7BQ6e3b21gTRwAlvMPcFnJkVP020tNadSixhuwbbHncoAOf4Ua4ngy4dQGh1BOneXGV4mA5dw0nfIWUBT7S2TMt4GKZ7JG11508QPpDfsZfbIpukFW7F7MYuz4DFYQ9kSfXxJHdAdp/vH5GfRKmPgFLLpGRCyqwYW5/7+EEfLiOgpZFFp1aCY2naGgmm8NC2yOtxSXw6a40BcToMwvl/AgF7fYYONR5BZdJoAPjq8IZUXrbY6WXmy6P9UTFgMaLxqTO3AQyZVaP5m9zF0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2or36lMtWL3ep0/t4TM2QRn+X50X6eadOozqmyajZes=;
 b=mEKqwTWYuRvcg/0Z7ebgN5TJw0AgnMva2mfWxBsXt5UcNI55Al6/DNvq6DAmAVLh3JTjKnedw0EhXRtEi/BsdXL5NhtKtJGVEoxbNfekx8vDIFwOw821Qu8jZvVf7+q4zTdGDQLK57tFAJrm96jpgYFSW0BfofkI1S4b1FNCFjc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:52:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:52:50 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-configargparse: Upgrade 1.3 -> 1.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
 <20210315084727.26812-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9cdf7502-0a45-2571-7bc0-bc123e6d17de@windriver.com>
Date: Wed, 17 Mar 2021 10:52:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210315084727.26812-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:404:11::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR13CA0056.namprd13.prod.outlook.com (2603:10b6:404:11::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend Transport; Wed, 17 Mar 2021 14:52:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86e6f6f8-017c-4cd8-3ade-08d8e95455b7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2632:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB263287D354EDBB7D7A7D37169F6A9@BYAPR11MB2632.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oqCT336QUz9fbPGEEAi1yC5Y/sarpHBBGl65Al/voZtIZzNfDsihyPyIWikb+WEi6iyQayWszxlPMje+TVQ+YfHlAgkI71sfyr2+zuiRkBG1jDEhpRCon/1mpMgKATzPqFnJtoFUNC6McGozzOVVozNDbKKnVhQ/WrSw86I59XfkIfZIGlk/641J+XGmPFnY9UEgHsomVvtAZyJgxNKrjfUHhiH1TlGnIAQy3+fPZ77OZCTyPwa6LGW0DTRKXqgBnPRaqtVwzKDh+tM76XCkEVmNPLk7e3sENeKA2zH82DC3YcXkw3BJ24ExfgwToCxFKnRIdp3EgEr280ch4GSaHnt6dwcE2qmgIYr3BC1SuNGBTnwEV1gO4lMkdjXKiSVf0zxUy0KRZ9JhRLwiy+jAs1ozI9wrLlTi/IQzPS75Xu9Bod9Juul3yELMNoh8ACDNmqfCJDqxycn/5ceYLcLxtL3vymD1VhaGT/6K7QbxQGZWXAEU8FFu9Dt005yw69QEBVS5kgqHn8u4mkaHJ/ZGcPb7fR+WydJmIBmC21ejy04MYl6+hGteEh4gMbbuf0GIatdZq0i90V3LB503htOqmVlWp+oCzz40Rf3XeaxJI8UdAy9O7BJ8I7Q9bjxzZbr4sl1voGRIR8Buj/UrvWts+Amhwl6msBnhGuB0gStkoj9TutWU9H2hMbbbMQPXOpzmC/oKadaXHCjgKBivAyu1VNDLEmxZdPBb+c1gbrWCry4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(366004)(396003)(44832011)(86362001)(5660300002)(16526019)(83380400001)(31696002)(6486002)(36756003)(16576012)(31686004)(186003)(2616005)(2906002)(166002)(956004)(478600001)(6666004)(26005)(966005)(33964004)(53546011)(8936002)(66476007)(8676002)(316002)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cVpMYXRxMFF1M01CbHpTdlFHbDV5K1ptcUFsRjB0aHkrMllmMFdUWUtYTkNK?=
 =?utf-8?B?SENQdnU4cWdnemdUVVUxYndIYnVyajVVTFVQM3FLZVR1UkxOckZ1ZzR1Zm00?=
 =?utf-8?B?NGpOck8rSmhOM1l2SzE0aHF5eHpjT0toZXVUZ1ZzeTNQd2c4TjJWTzZNU08v?=
 =?utf-8?B?Q1RHZmFqTm8rWGZ0SmJsWUFRcCt1d2pJei9aRnFEd2o4clVuUXVRbUYySTZL?=
 =?utf-8?B?cEdKT1ZSUlR1MER0d1BPaU9ZMVQxbWMyRXRFalk3REZtZmZWYlhpQnM5VzFY?=
 =?utf-8?B?WWFUc25GcGF5Tjdxd2NzMHVSSDllbjZVWkdFRjZjSGJrQ0tDV0xRTDV5NDMw?=
 =?utf-8?B?U0JrR2NlZ0RiVzJJb0Jyb2UwQ1NTY3c4a2JYN2RiY016VjJDeFEvUlpubmhS?=
 =?utf-8?B?S3BPcVQzR21GTUIyNUkxYjhDNEpqdVIvYXRZWHpoRlY0VXU4RGx3ZjlnekMw?=
 =?utf-8?B?eFpUTXNIODhFWmNPWHlPcE5KUjdZWjZpOFhJUDdNeWpYWURKemlWdjU4cTNt?=
 =?utf-8?B?UHh1QTBrYXJvdjVsYmxTb1NLSzB0RlVvU0dnaFJ4eTF3RWxxZXZZcjU0VmRz?=
 =?utf-8?B?T1hNYzFsUmd2blpBcHZPNncyK21FdGhKM3piTTVqUXArc3M0MHcwaS9yckJQ?=
 =?utf-8?B?SEw4L2lRVDZuZXN6alpVZ0JrVU8rRzZnemc4R2NRL2FmQlpZNWpjaU9UbTJ6?=
 =?utf-8?B?WFJqOVlJUStDWDEyZFRnUTFSYy9DR2NEYXVDTjI0NVQreXd2c21GNWliY0N3?=
 =?utf-8?B?dk4xSGRNN2pKK0hDVm5VQVFNQlc2UjJKdm44Y3p6bkFwWCt4MmhWbXBBd0c4?=
 =?utf-8?B?SEZSaXZtOUhDcFhKRmQ5RTZuYWpCNFRiV1loU1pPemNHcS9pYUkxdnEzeGNN?=
 =?utf-8?B?WnlCOXgycy9GMnhNb0tRcjZMaTlyT1l4eHJUcTByUFR3RTJwY3pFSVpLeDNR?=
 =?utf-8?B?REFVOUQ2aHM2Wk1JTmRuWVNGWUwzdFVZMG5teVJDT1FueThWQm1HWjIrVnhp?=
 =?utf-8?B?eklCM2RDczNWZ29xcm1nVGJRVUZMeVJ6dWFuN1hFeWVoNmRRSndyQjQ2YkFU?=
 =?utf-8?B?V2VyWmpHRU5LdCtua1RSeE9Ib2xNMHpTMWJ3ZmN3cTRDdVJpbTVDeTN1dTF3?=
 =?utf-8?B?ampjQzdGa2MrZVpabkNsNFUwUEErVzNnZ3dmOGsrSkhiRUNNZ2hRYzlKeHI4?=
 =?utf-8?B?SFB5blZjWGJrbkdKSEZFMjVLSFc3blQ3NHR0dmVZQmVjN2RMZE94ZE1VR2VI?=
 =?utf-8?B?MlpocDdielh5WjgrNE5ZSUhqaGUycytjb1Q2ZEg2ZGFhVDgyVVFYRHBFWmh5?=
 =?utf-8?B?S3FZblBWbnlXVEJ1V3AzdXBWL25QVy8zeldiUHZiaFRMbTg2ZnBiS3ZtSUNv?=
 =?utf-8?B?ZTlPOENLOTd1NG5HaFBJUytZQU5CQmhQUXpqQTVrRFVQRm5lRzFqcXN1eUhq?=
 =?utf-8?B?UExScTRJMmN3VjFYbWsrTUtsMGFHTTl1REJTYnJBWm9lbTRneHJiemtaMXEz?=
 =?utf-8?B?MkkydnNJTDIvaWp1SWlGbHpwNWxjeGlhQW5BYmJTREcyRVRWWmo2TnJIL0xy?=
 =?utf-8?B?VU9PTjEyMTJQT2Z3c1NPaHVwY3VuQ1UydDg0Z0NrTStwUzAxSk95ZDdNS3h0?=
 =?utf-8?B?TG5QenRiOG9oYTlzS0F4WG10MjJnRFBPczRnT1hJRDJ3K1BtSzVodUk5UCsx?=
 =?utf-8?B?VmhwYTNPN3BjaXZJQzdObHBUUWFGRTAyQk5hS0ZwekVEZXdQMGJHWEdhTW5R?=
 =?utf-8?Q?ScE0cz3QKv+q5SlgiiGKnIYqfaqo5g9y+3usRGt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e6f6f8-017c-4cd8-3ade-08d8e95455b7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:52:49.9150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QEnHBMOlp87X6dlBDq1KX1wZa4nc6s+zd6LU2a9AxL69cV5JKl2oGbvwyvYGn/qN7iPd4Cf+9Fzd/TofjMnjzfSqyXl4HeJXFIUz1UtRO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2632
Content-Type: multipart/alternative;
 boundary="------------1BE076CE33F4784F316D83FE"
Content-Language: en-US

--------------1BE076CE33F4784F316D83FE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-15 4:47 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.4:
>
> - Allow nearly all characters in a keyword
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-configargparse_1.3.bb => python3-configargparse_1.4.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-configargparse_1.3.bb => python3-configargparse_1.4.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.4.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
> rename to meta-python/recipes-devtools/python/python3-configargparse_1.4.bb
> index aac58de37..393f13874 100644
> --- a/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-configargparse_1.4.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
>
> -SRC_URI[sha256sum] = "0428b975ab6c48bb101ccb732e1b5cb616296e28268e032aa806f32b647a1cc1"
> +SRC_URI[sha256sum] = "abef9ff44fb0091f0e3bb2ee7e5b26a02b5b62d45408a5272a9bd461f5b59b4b"
>
>   PYPI_PACKAGE = "ConfigArgParse"
>
> --
> 2.17.1
>
>
> 
>

--------------1BE076CE33F4784F316D83FE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-15 4:47 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210315084727.26812-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.4:

- Allow nearly all characters in a keyword

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210315084727.26812-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-configargparse_1.3.bb =&gt; python3-configargparse_1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.3.bb =&gt; python3-configargparse_1.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.4.bb
index aac58de37..393f13874 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/bw2/ConfigArgParse">&quot;https://github.com/bw2/ConfigArgParse&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=da746463714cc35999ed9a42339f2943">&quot;file://LICENSE;md5=da746463714cc35999ed9a42339f2943&quot;</a>

-SRC_URI[sha256sum] = &quot;0428b975ab6c48bb101ccb732e1b5cb616296e28268e032aa806f32b647a1cc1&quot;
+SRC_URI[sha256sum] = &quot;abef9ff44fb0091f0e3bb2ee7e5b26a02b5b62d45408a5272a9bd461f5b59b4b&quot;

 PYPI_PACKAGE = &quot;ConfigArgParse&quot;

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1BE076CE33F4784F316D83FE--
