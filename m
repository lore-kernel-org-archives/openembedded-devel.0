Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.76])
 by mx.groups.io with SMTP id smtpd.web10.53046.1598879433717563666
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jJksJuh4;
 spf=pass (domain: windriver.com, ip: 40.107.243.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwGfaJ/kXd4GzHIPitq9+E2Swztmi75RvaGsZT1FRfzIe8Xnaiha4mAKoAW7VdPZU7gHpMTVlCo0wFlDBxcoN7OXQjm57+EARVDqwdETk6s+l3Qfnq/xPhL5dRvkPYJoCik7SRraS2qZoCmpB9AHyLIVeBuZEgj5Z7Or25MEgjsrAJdWOixlWPBBPSQySHflvHd7l7Fum/226tp0evYwlWdGmPfWRywqy+c8qWWZl0XZVhLzsX/e+8Utu/JIuuSIYTYWkmbc9bc+qu8uIdFKPpNtmegSsCpL7/NQWyrvbMBk/TYOoHtQ06Cs9Bfme9xZRm8ZZoOEF4y53/ExgPopzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6mwx/AkW8Av6etSQPcENcRWrj6RNYYcptLRDE7CUos=;
 b=j9yPm/W0kgxYrMfYf/oazPVn4J+ENovt3u70dyrY9Rrcb6piS1miLlUuWvWv/KKXUHrIt7loaHa8mlXiZJeAL/FvfPvoz5RXwTPVqiOdESU4gOjPhoGUGRsG4AA+s7Vm9fsRYpzWNa+XNpKiKg6LJhPjETtZU5cWjCjhlRlBn0DLS454C5t3jctCJQ99Y3PSj++BBgcKhOyZVoGtsiWT3Sbuu8vA4FY65s+/+Vt4nef6hHqKBZ4glwGiTWZmo/i9NO8R3haPJIzHCDCjf1yvy07UztHp3nb4fnsOUMT1sPmqToDBNB5mdXgeNT+SE4zsdyyNokiNk49WeTPoLOGzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6mwx/AkW8Av6etSQPcENcRWrj6RNYYcptLRDE7CUos=;
 b=jJksJuh4AD4nPiWBANS6AlaO2FO7QMdKO4YFdV183iPOpgaAmIH4Bu4AYOzksm/31QI4YQmJF/rbGa15IjAxTyB2jE5fqL8nVpHvNFU6Lld8ZuDKE6KBYQlf+jpMqx+9wuUAP6Bpc5y6XsehSXTVtoDE/2oGbDgbhM5FYeaZuYE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Mon, 31 Aug
 2020 13:10:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:10:32 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-cryptography: Upgrade 3.0 -> 3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200827092951.15749-1-leon.anavi@konsulko.com>
 <20200827092951.15749-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <258f363d-d80b-b67c-bb38-4ed78a05a72d@windriver.com>
Date: Mon, 31 Aug 2020 09:10:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200827092951.15749-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 13:10:31 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bcc006c-3673-41b4-21ae-08d84daf3d8a
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2807220098765866956C85A79F510@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gn3CBDt5MhulCPclEXU/7hgLkb3cGDl8Zeiod2I5BKtLPvKpp0muE1tXyWT/iEPNE5lwjW6GLPdJIIeRD4AW2mtQ3JAC/i5KLcW+OXxXTpRMTHzYTMvB8DsFU9D88wBmTTcFbZ+4u5/rTPS12XNQWncfIDoWW67N2h1qOjGOT2D6vMfQKQM/Ssazdeth2+vDHKkI1RRGkg68aVUwuDy0xzOIfnesl87R20ptm1yG9tFG6u2F1+rB4hDQ9PR6OqEtI+vdcVRaE26itLsc030tdsfofSWLAsNu1QCtZoWZ0cQdsXx4Xn9JJP8lG+ZIEa1ga0WXgQ0W1qvNYdhAFr3DaPZcewJV3cCHuwZToPVWg7lfPkE7mCVXcFbZFbhMs+eU2NoP8iJFoWgebztrEdq2tdyurCRkpuxo1sHMLkEhB21wRR7tBdOJd9Ll4iW7XrGlHlABBa53IN2creikcrlnKw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39850400004)(376002)(346002)(316002)(2906002)(53546011)(33964004)(66556008)(166002)(478600001)(26005)(6666004)(186003)(6486002)(36756003)(956004)(83380400001)(8676002)(31696002)(8936002)(66476007)(966005)(31686004)(66946007)(86362001)(2616005)(5660300002)(52116002)(16576012)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hSHuGO98648pHUEQPgMYr5grcl560bSBki3IZk0fxDyYpUQ7Rf0xVzdYuImI2kbG9to3emswxQXCXeOtQ0ojQ2aGzWuSYlht/iylF6YkE0SjFh61X1I9MBx3EaO0Z3j5dxPRWNsT+LyYFDRLtXEMKlZMyRcL+XjU+IClWyGKOX9P91fsF3qFk7uqJG+VZ2xurEEPeNyCnZG2a9JlBnljvSPF0z6jDGHd/P5MJK9lBFQKW41aFIQsaAXCBNbkiHJMxwyGs0YVqzyMO/iUuxK3mG84pYRig7BaP9jWEj5CsYi+vFRma5JBc7TW/JtwNZtgMRQhMvkW2HYuuSTQPRIlFL3wyInNqWhXZGPv+zOkF5AiuzP+ydf8kwMSV/JOxMb2OnmybqLlOlCbkCZdDkHXWMVJgZFvZbhcHGkS/yuoQKH0Ns+KcxlzZgBT7ZpxWQXt9BgwrsMhFaYVVcSC6TB3izCDtZk/7Ch0IJAGh7s9XfXbtRKbSf6TnWtGIRFssOnQoNvl+Y/o8HOM1pA79VziCz9D0vy3IkkRYXvOm30OQQOd7c993VwHVnooWO3NqRhwSaE0gAv8NEGKoV3I7rzouJfJEY53SyBry3L1PqYmVjsuuSoqq/0t3+3o8n0jTJnbGV/qF4VxfWiVUWaPo84W5g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcc006c-3673-41b4-21ae-08d84daf3d8a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:10:32.2941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUo13QzEXmnpa/YBmiWkMV7EyAeEN7FK7woGUUk1mwtslW2JElxddL0sM7D1rOG17tPpLNZ/2/kmIVXxl+IvAw7UQbTy3ULJpBRfBsCJPTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------530186C33289E6562C597C1F"
Content-Language: en-US

--------------530186C33289E6562C597C1F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/27/20 5:29 AM, Leon Anavi wrote:
> Upgrade to release 3.1:
>
> - BACKWARDS INCOMPATIBLE: Removed support for idna based
>    :term:`U-label` parsing in various X.509 classes. This support
>    was originally deprecated in version 2.1 and moved to an extra
>    in 2.5.
> - Deprecated OpenSSL 1.0.2 support. OpenSSL 1.0.2 is no longer
>    supported by the OpenSSL project. The next version of
>    cryptography will drop support for it.
> - Deprecated support for Python 3.5. This version sees very
>    little use and will be removed in the next release.
> - backend arguments to functions are no longer required and the
>    default backend will automatically be selected if no backend
>    is provided.
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
>   ...ython3-cryptography_3.0.bb => python3-cryptography_3.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography_3.0.bb => python3-cryptography_3.1.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
> index 05a2350e3..9ac23cda4 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
>   
>   LDSHARED += "-pthread"
>   
> -SRC_URI[md5sum] = "163608a7cb838c6b39360e1e64377d54"
> -SRC_URI[sha256sum] = "8e924dbc025206e97756e8903039662aa58aa9ba357d8e1d8fc29e3092322053"
> +SRC_URI[md5sum] = "aa91e4974981b29e99b863c54034c361"
> +SRC_URI[sha256sum] = "26409a473cc6278e4c90f782cd5968ebad04d3911ed1c402fc86908c17633e08"
>   
>   SRC_URI += " \
>       file://run-ptest \
>
> 

--------------530186C33289E6562C597C1F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/27/20 5:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200827092951.15749-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.1:

- BACKWARDS INCOMPATIBLE: Removed support for idna based
  :term:`U-label` parsing in various X.509 classes. This support
  was originally deprecated in version 2.1 and moved to an extra
  in 2.5.
- Deprecated OpenSSL 1.0.2 support. OpenSSL 1.0.2 is no longer
  supported by the OpenSSL project. The next version of
  cryptography will drop support for it.
- Deprecated support for Python 3.5. This version sees very
  little use and will be removed in the next release.
- backend arguments to functions are no longer required and the
  default backend will automatically be selected if no backend
  is provided.
- Added initial support for parsing certificates from PKCS7 files
- Calling update or update_into on
  :class:`~cryptography.hazmat.primitives.ciphers.CipherContext`
  with data longer than 231 bytes no longer raises an
  OverflowError. This also resolves the same issue in
  :doc:`/fernet`.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200827092951.15749-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-cryptography_3.0.bb =&gt; python3-cryptography_3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_3.0.bb =&gt; python3-cryptography_3.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
index 05a2350e3..9ac23cda4 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=097f805837700cfac572ac274cd38124">&quot;file://LICENSE;md5=097f805837700cfac572ac274cd38124&quot;</a>
 
 LDSHARED += &quot;-pthread&quot;
 
-SRC_URI[md5sum] = &quot;163608a7cb838c6b39360e1e64377d54&quot;
-SRC_URI[sha256sum] = &quot;8e924dbc025206e97756e8903039662aa58aa9ba357d8e1d8fc29e3092322053&quot;
+SRC_URI[md5sum] = &quot;aa91e4974981b29e99b863c54034c361&quot;
+SRC_URI[sha256sum] = &quot;26409a473cc6278e4c90f782cd5968ebad04d3911ed1c402fc86908c17633e08&quot;
 
 SRC_URI += &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------530186C33289E6562C597C1F--
