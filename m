Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.60])
 by mx.groups.io with SMTP id smtpd.web10.35884.1601297970807829977
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 05:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=g9ouAUwO;
 spf=pass (domain: windriver.com, ip: 40.107.223.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYOjbAPz/Y1kIa+RTgvs9e1JZBWaGzxNntqFE/2YkKwnu1p2vCS5BQfh5Z5Yyd2jgJJpUfpn/2AgziKVcnVxgEXguPdnjlXzp/eHF74r4IBfJAmxbTq4SlBUtfLW8ocNjIZFKEQgaLMYsWa39/hHwqguvqUftRUPtt/miKhS8wIUD4yU/BIkzggsFr1QMyV1kRR6epfDvCihQiUdIbnCrFPtOUuaTSzDwnynrkkX9ILVSv/bNs5Tha7vxq24d/fCC7iTvKhz9GGQp1SXlwr2ZtE7dYoGYgkbHd1eNBe6HZBJWm68eQdIY3K1Dek289Sv35woa3yUO4ZwpMpELuELWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0YGjzvtO/ablQGVO5sZjj61AQCplYl7kArM1G4DwMg=;
 b=dELgRFO0ZL8DHd+UPxQ8x89BVZoz3Vqj0THpwqXZIM1ETDDm8VvbOBzMjpmgEn9ymyYoMi4jHM8uqkSAuv1bzHR1fwPHe5O6CQUI3tHFlOYVQmGdvGHYv+ryahCzFcmqOsbHgSsvIKF3gQj9T9xnNtJZLEgxUr+Ps41v1bj9+sd2olsooGZhv8qJ469Ni7Eg8K0HWVKhnXpXBHzWCZ24DwIxgdASOHcux+iW/3HKmLIhPwnWGjWQdFzmxB14NiepFTl28pxJ2pKIPHAFNVQIY1mZtxdWHPFfzoemcNpq7aH+FMU9xZrtQeM3aKrj/1qx08o4Zf5/fPBi0v9Xq5xFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0YGjzvtO/ablQGVO5sZjj61AQCplYl7kArM1G4DwMg=;
 b=g9ouAUwO8eHc5H5JGDMuNGMdzkpVESdI+3EPaBrPDDQnNDQb0DKjliDdPB9M0p+a+4PSrgIIrZAMZrJeQ9EqLnyyR4py1Baql2eLrWutl3QzoBaplmsT//gQRyCFpPpkahezDdcnBzXSkCjuXa1UTKRp+SAqLUv6XaAUqP+dIs4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Mon, 28 Sep
 2020 12:59:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3412.028; Mon, 28 Sep 2020
 12:59:29 +0000
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-sentry-sdk: Upgrade 0.17.7 -> 0.17.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200924132122.30697-1-leon.anavi@konsulko.com>
 <20200924132122.30697-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <57bd282f-2425-f9cc-019c-30480e60f725@windriver.com>
Date: Mon, 28 Sep 2020 08:59:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924132122.30697-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::45) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 28 Sep 2020 12:59:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1fcede0-09af-4293-e16f-08d863ae5628
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3256F4858E72EBE6F8001AD29F350@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	42wt5eyYVbCV8V/fJtxTnv+HTRUzy+SN2zx88z2CNfvA5j2hzaSC6b5KggVa5ZymNNh+4s+kx0A+Zc8lKoxtqUFBmGebetfmgD5mxPQtUS188t6jRI2j+6g721/P0wxQv/9/FywQeZ4Tp9flb9Ld6MTc6mDhwnyWqN39V4PWNl3gPam93lZGW4afUHfzCaTBqwZpsU36Gx1y4HSrQESE9+B6NPPAy4o2OVBT06hRmxfvcadC45kJ0yeRWuJ2jkHqAlp0nUrkqPzck+Z5jeV0cRH+82L8ZivlebLI0ltU91HXKCVBC5/BBe2Y16ZK5/GOrkV0V15xJCIy0lC3X9rzhoNETtyV9CK9EXsCgx2QLOkR+tcoP+yc4Xex3nP6bcAZSTOfdGT20zldTRzZ/QeV6m1JfciejL5DFAb8eY0+CNo9Yi4NLJL4+x8GimplwXyJYcqANX/R3EP8MNeOWEKT0STNHWCFsalHgDzYNqRXo8PG8CUNWM7KJZI55cb4yIvT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(478600001)(66946007)(186003)(53546011)(26005)(16526019)(31696002)(8936002)(966005)(52116002)(33964004)(8676002)(36756003)(16576012)(316002)(2616005)(166002)(5660300002)(83380400001)(956004)(6486002)(2906002)(44832011)(31686004)(6666004)(66476007)(66556008)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CN4nNx37z4l5eONVjcVa4/u2lL7fJHk/koMoQDy1qeiI0OXm9MkOo3EMLBMf/7IdjlZERrWMYt07SRemIIXlEm2qKPxw6/pcmoJHhFFa2hWzTCE9xBmq5XJUM0e9il4ghLFTX0tC0gOmUdjrtlPsCg75VtC7xZQVL5ZTwsyMLhbVtPIApkb7KPXPmb2QV/MV0Y3qo0846EDx4eO5CtbAaHqDQLk1w9VCFsC7N0/EyiJuumw1w4112CP08pn8E282Zf3zBKK/Mem2lgdstjz7hVUIAwH8b2oUN9NUUSQET0jf11VLMTmZhGRI1vy6MSS8VANiMcvhuPPZW+UaoBT1J5XY0V4ifvpplM+CIJ2GMosNMCaKkCo4wx8l5Xcd6aAN8lYJBu1z7gDXeSUnu2k+TN6lZ8DdL8OsILZF+TmzBlPWf7wECNuABLO6bvvLbeWKsg6dQO6f+rUs2Npfsmrytt5ix8g5bHe7aFk97gVvdTTj19Wu++RzOpjraax31ezPsfCeRhGwOKI+BOrRMyFdasY+TocVg05Ty+xv3t73j9vgS9MP0Lb3VTcXJ0nb67+gCRgETgRjOQvJyh0rO+xgRtXx8HqebhI4qScgAnaoUb3Vb0LHyJgxIsPxbSyJlkdtDdnF2j2undZrjeQEUydbEw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fcede0-09af-4293-e16f-08d863ae5628
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 12:59:29.5793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXVyELLfcAejZ33jhjo8DHk5E66dkjcwfRYhOdRxUk1LImIuyMZn732URUkCEF13GFXBfZuBkvv64GR5fiz+o2Yj3gNxESfyBoW1vwfDi4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
Content-Type: multipart/alternative;
 boundary="------------CF81A286607B697D06ECFB4E"
Content-Language: en-US

--------------CF81A286607B697D06ECFB4E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/20 9:21 AM, Leon Anavi wrote:
> Upgrade to release 0.17.8:
>
> - Fix yet another bug with disjoint traces in Celery.
> - Added support for Chalice 1.20. Thanks again to the folks at
>    Cuenca MX!
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.17.7.bb => python3-sentry-sdk_0.17.8.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.7.bb => python3-sentry-sdk_0.17.8.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
> index 27f68fcb21..99ddbe64d9 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "eda3a8d9aae8459ef6efe540293a9ca8"
> -SRC_URI[sha256sum] = "a698993f3abbe06e88e8a3c8b61c8a79c12f62e503f1a23eda30c3921f0525a9"
> +SRC_URI[md5sum] = "17ad6e414d77026e264152bd4cc11400"
> +SRC_URI[sha256sum] = "e159f7c919d19ae86e5a4ff370fccc45149fab461fbeb93fb5a735a0b33a9cb1"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 
>

--------------CF81A286607B697D06ECFB4E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/24/20 9:21 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200924132122.30697-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.17.8:

- Fix yet another bug with disjoint traces in Celery.
- Added support for Chalice 1.20. Thanks again to the folks at
  Cuenca MX!

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200924132122.30697-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.17.7.bb =&gt; python3-sentry-sdk_0.17.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.7.bb =&gt; python3-sentry-sdk_0.17.8.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
index 27f68fcb21..99ddbe64d9 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;eda3a8d9aae8459ef6efe540293a9ca8&quot;
-SRC_URI[sha256sum] = &quot;a698993f3abbe06e88e8a3c8b61c8a79c12f62e503f1a23eda30c3921f0525a9&quot;
+SRC_URI[md5sum] = &quot;17ad6e414d77026e264152bd4cc11400&quot;
+SRC_URI[sha256sum] = &quot;e159f7c919d19ae86e5a4ff370fccc45149fab461fbeb93fb5a735a0b33a9cb1&quot;
 
 PYPI_PACKAGE = &quot;sentry-sdk&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CF81A286607B697D06ECFB4E--
