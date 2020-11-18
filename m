Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.67])
 by mx.groups.io with SMTP id smtpd.web10.26409.1605714768300195046
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aTdmZfmW;
 spf=pass (domain: windriver.com, ip: 40.107.236.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrJfjYMeavWFf/5cft3pnq/GbYDQCTq7hRBnUa38UCfn36ZApsFf1RkyE4BWKC44DR2S/gxLddIppdyerSpl6qGZbuolyNfFuwXzUtOZ7rnoZRvaR0jFz9KYsW+MW6xf4POPWdyT8ALd06GlcosGhJpG/pI6SMri6PHRGB4WI3erb1NxdxdIjmzcHZ3BMTr5sYf4LtupZGUMudKvmE60pEkAGH/yQPIUZn/p76NQYE5LyQmHKvQqM1/GJ53eeqbkw6CEUOylnK57JReXCS0jp5lvxVKT+NdvfNdqFBbPMYUUBjdlMwe9a4NlEipHS4ZFxGpByS5AlNtXNI8nH7FvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUYc1YIo5pI4iUzbWdF4WPYfgnLE3iIy3C+d3kJp2Ds=;
 b=Xcc3T0IX3alBVa58/u342UmDapshzDKyPcg+rzuozkTQMRVBF3lSrXGoIuMnLUWf5uT6gnswCrTGqBQ+GMG4tORDj3UEmkLM+lrTmQGJxDN2AJYwpcGIRxgV7u3D5gwpDdFegEPhrnmuZTNFSr4z3/UQSJjDCNJ7vQd9O8EaEn4ye+YQpnJ9JqgzSJ3gnFKhuDfmzatVIes1nsFIO9GvwyImYRvq6UqQoLSNrwVU0pH7uamS1Aruoph9VhjRYk+PNbsW3n9c21U8sA4mdMqzRAQH/VXnjNe2UurD6uPCrnRuWfRJd4t6nouXBiYoydvYmIwsPNucICx9BLLg4fkzTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUYc1YIo5pI4iUzbWdF4WPYfgnLE3iIy3C+d3kJp2Ds=;
 b=aTdmZfmWmlMCnxwE6uMT3hgam5Nv6hhuOdSJJZenrHkczRbTFG/qwGKxokKecRbcT8CZ813wLujmbbOOVXwiZe8AsJele7lfEwMfc4mQ9oN3OzavezjGruhhI4HsExLdulI+0sDCOsgeBr9o1C5J4wbO/j4DtvG/cruzawsltL0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3974.namprd11.prod.outlook.com (2603:10b6:a03:183::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 15:52:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.029; Wed, 18 Nov 2020
 15:52:45 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-attrs: 20.2.0 -> 20.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201112105618.23773-1-leon.anavi@konsulko.com>
 <20201112105618.23773-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <420c7358-feb9-268b-f314-09c3288edba8@windriver.com>
Date: Wed, 18 Nov 2020 10:52:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201112105618.23773-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 15:52:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a17a871d-880f-4b15-48d2-08d88bd9fdb2
X-MS-TrafficTypeDiagnostic: BY5PR11MB3974:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB397495B954601ECAF68382A19FE10@BY5PR11MB3974.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lk8XRa4C6+8FdfvNQPIJBL654njq8O2FgNu48gRJlgWEwHaXVfc7MpBs/EokZeKa4DjeI6wrWbEl/GgKU04nUFuafmRmrm/avu8ZFPQyxp9O5rzTw0jzSrQeEFELjb28v+I3HBmu90oh308koGEHVT1yN1fHj4worGc3CS/xbpWJSBTPNti8VNkOE1xD2T6izxZ0DVWFnUoqKAw5LW+xaXi1bb70LPeZh308biyvFGvpaaW3acFzHs4jLimaEoalKv/hRnNVEQcQImMlYUQletBvJ/GLVf0dci8aeesC1hEyVVlPnXJWpnygHPvDFFEyHNX2yyzQJh+VuXKz/8FSdiwCfod8twHJzmlSCWfTdu/SWyDI9gMey+H/REsXxVyjk/LwTBzz8jX4w9YNlPtZO1p3hawQs89G8/3uQ1MY77ZpXO+sjjA2NyU0IF09CHCqWuFmU0PUCSOOYW9ABCuwEQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39850400004)(376002)(346002)(36756003)(66556008)(8936002)(478600001)(52116002)(33964004)(66946007)(8676002)(166002)(31696002)(186003)(86362001)(316002)(53546011)(83380400001)(16526019)(66476007)(26005)(16576012)(4001150100001)(44832011)(2906002)(6486002)(966005)(2616005)(5660300002)(31686004)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bcPCwF1csAVNSNxU8GEmj2riqYogcMqGhyIHBZ/p+dUNA1bLcdQWzHDv/1lH5XJf94HF9dycSAhVytzVrytL2LeulKlVuR/D/iMhqfr9uvAi/x1vGFGrkSrfv5xmi2dYmVsxf+NFroBB0hmMNYhTk2MEOlBwbrIwJlJ4B4YplBvPU8KH/zW2deTsorAsyb241+qw/iiYlmSL/7F/2CYzUYLgEG1lV+KfrzLBT24hpX9tPHi2Su14dAboohkOUCKn1WSf0pytFWqnIQl3GazQYCQL1uD4oD4bUg6tUw2UR+hdV8QauP0h9GBW/Iis4/tSGGd7g26+LGtEw6OOhJsMWYsKko3IzGHJYp8EyXFVhMTzgzaGqDVngjFrKKgBOoobaJrQVEqAqH786gAP+mEOUXfPDnMf/CAa+P+m/bUNne63fhzBVY6CQTO/DOlvFaf7Icc3jiS7QfXLGT7dMwYThBZPjDuBJ5JGuQTz6QHSoEFjD6wEpkjVirXVxzAlvjR8LcPnLW251RpTR6OLPlqFozRWBbekrzaA3MlkmUUZjUVn5CcQvqtfAtNKgIbMWUhO79Q2knKszkiBldpMlG2nGXF2barsSOUhhpySAs0YI8rCDilTIeH8BmlEhKhRiy3byAK61CwVaAfcduelxwX3Ug==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a17a871d-880f-4b15-48d2-08d88bd9fdb2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 15:52:45.5447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ex+GM1C2X/Jr4ANrNHf1YYKuNUNKm//TRV+iwRjxTcPfWQhQ+ajg0HevBunAl0pl1vrHNU3QROMO7PphHMGG1OKefR/OsfbZV1M0e9J2Ok0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3974
Content-Type: multipart/alternative;
 boundary="------------862551216525F32208146F4C"
Content-Language: en-US

--------------862551216525F32208146F4C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-12 5:56 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 20.3.0:
>
> - attr.define(), attr.frozen(), attr.mutable(), and attr.field()
>    remain provisional.
> - attr.s() now has a field_transformer hook that is called for all
>    Attributes and returns a (modified or updated) list of Attribute
>    instances. attr.asdict() has a value_serializer hook that can
>    change the way values are converted. Both hooks are meant to
>    help with data (de-)serialization workflows.
> - kw_only=True now works on Python 2.
> - raise from now works on frozen classes on PyPy.
> - attr.asdict() and attr.astuple() now treat frozensets like sets
>    with regards to the retain_collection_types argument.
> - The type stubs for attr.s() and attr.make_class() are not
>    missing the collect_by_mro argument anymore.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-attrs_20.2.0.bb => python3-attrs_20.3.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-attrs_20.2.0.bb => python3-attrs_20.3.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
> index c2a5b90515..55cfda7180 100644
> --- a/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
>
> -SRC_URI[sha256sum] = "26b54ddbbb9ee1d34d5d3668dd37d6cf74990ab23c828c2888dccdceee395594"
> -SRC_URI[md5sum] = "7be95e1b35e9385d71a0017a48217efc"
> +SRC_URI[sha256sum] = "832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700"
> +SRC_URI[md5sum] = "4fe38f89297b2b446d83190fce189f29"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------862551216525F32208146F4C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-12 5:56 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201112105618.23773-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 20.3.0:

- attr.define(), attr.frozen(), attr.mutable(), and attr.field()
  remain provisional.
- attr.s() now has a field_transformer hook that is called for all
  Attributes and returns a (modified or updated) list of Attribute
  instances. attr.asdict() has a value_serializer hook that can
  change the way values are converted. Both hooks are meant to
  help with data (de-)serialization workflows.
- kw_only=True now works on Python 2.
- raise from now works on frozen classes on PyPy.
- attr.asdict() and attr.astuple() now treat frozensets like sets
  with regards to the retain_collection_types argument.
- The type stubs for attr.s() and attr.make_class() are not
  missing the collect_by_mro argument anymore.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201112105618.23773-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-attrs_20.2.0.bb =&gt; python3-attrs_20.3.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-attrs_20.2.0.bb =&gt; python3-attrs_20.3.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
rename to meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
index c2a5b90515..55cfda7180 100644
--- a/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.attrs.org/">&quot;http://www.attrs.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff">&quot;file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff&quot;</a>

-SRC_URI[sha256sum] = &quot;26b54ddbbb9ee1d34d5d3668dd37d6cf74990ab23c828c2888dccdceee395594&quot;
-SRC_URI[md5sum] = &quot;7be95e1b35e9385d71a0017a48217efc&quot;
+SRC_URI[sha256sum] = &quot;832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700&quot;
+SRC_URI[md5sum] = &quot;4fe38f89297b2b446d83190fce189f29&quot;

 inherit pypi setuptools3

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

--------------862551216525F32208146F4C--
