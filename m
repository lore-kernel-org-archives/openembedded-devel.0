Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.42])
 by mx.groups.io with SMTP id smtpd.web10.10319.1599060420881682300
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZMEjWpbv;
 spf=pass (domain: windriver.com, ip: 40.107.220.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khkmgzLo+vXtunjFkA2JJgYzi1PsGrM6R14KgSasE3V5/+U/TCQtQT3UioA9L4AyYPOaAM8S550f7OZcEPIsNqwEIB2NJIgkx27YG5Q4enxilnv1kBAWJIcvi7pJhBWFQ1bkPhBZ1NM8WfqdPdXDBoa3VC4ZdLrlc5etlBFRZjsvyheHF1uqwe/M7gx/7lQe4MfmYdrmD5eGMMPpbUcF68l3Lr1paKjgbbAISYGhIFE9EP1He6ixcOf603onFo6eSCNInxefeeifAjT+nGMYyzeYQFi9ZTBhb9JDhuhzOGtd5h4JYNuNSDJ+I+u2c/5MVvqGCG6bIZVX4cQOdVxDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ngd2vBem8/to6HFYT7qT5GHES4e+oriPvQiL7rv6mpw=;
 b=LHhO+qZrW4wimXCxAjH6xl1p9xIFNXZJWZeMaVS5bjwdsKQfmVK3d/2WZcCBhFsbRjZfW7MvR8uj1SIbRWgMLc3Ep9w+FPuyVe2WYIbphhFLRIIKymiBlmtmNcnBupp0IADb82nIqIxVu+50GxPxDdzn8WNolpc6M5fILhbbzsEpiCZOOcPo5wfxlFZokE6UTYsaDelLXOxAjpDY+lFwLAzDkDXU5IW9njydp/wqozGzoi0W3pLK6JkhalFuuEX09bIvORdYwvjHFdaj0FA3DhhFediijLVXQn2VV+SqcKG76Ai3ZcgC30X0C/YFTuMHgF1VtJ+eEYyfCjYp/wLitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ngd2vBem8/to6HFYT7qT5GHES4e+oriPvQiL7rv6mpw=;
 b=ZMEjWpbvuLK9C9WMBDQqqRxhU/u05IzfO0y5XSoUG+hX4/N8I7D+snRnmTGznWjadv2o93VmBD/HxXgl3LFiNefGAtB9X4AWm1S0qRLt+OLCnWQ7xdzsTEybpgarY5PO/oHaRRYjDBN5aecgt3wmJbfLMnXG5vUIJMXJHbTbVTw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:26:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:26:58 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-ecdsa: Upgrade 0.15 -> 0.16.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200828135131.26321-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1e82cf4d-7725-0df1-10f8-0b52c981ae3d@windriver.com>
Date: Wed, 2 Sep 2020 11:26:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200828135131.26321-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::36) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:26:57 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3dd60d8-2a05-44c8-b55d-08d84f54a17f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3030ED2B1D067A7D075D15EA9F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	issQ4KAGS5jVuRqF6SqBfTePNJ0m7zrRu9QZ0oNfTix9G5+uGoy81KjUtzAF0o+sImiJJapjPsSy5seFVvna2ZF6Mjg2bwAaErO9lHz/6FxnuDagcxnT5SqyvdII3K6Vs8N6HMuGhAe4haqiVs5RypIYHu+0WZknJO9Q2falyvnjsKnMyD/N3nWs/VXBiYIXB7/CgUOsw/RFgPGm77Aa6LlN9SNXgveCt3frNNPbvEFn9gnyQZEEPCc4LQc/En1QeVWH2cW8TvFC6vIxd5H/pycZh1O3bAvuyKiaMzjtW2umLywU1V9iQ5NgSRK27f10IJtDWjNs2V4oivOQ4vDV6WgG4IodLbYkRRSBM8r51f8+G8x0mWDvcwccHb8E6A2GUNk6rSC7soi9hTNey1htwh+zmc3drHIMB+LsO8VBKb4nxz6WRls1rBwNsNDIFEHbilFIjZYMTulGjKqAcqXvVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gdYQ81ztZmJ3pxOESBNQwH5UU1rMU6DrwQZs9WI9NuMaWpoU0Y47JN7DLBhIiKwgRutw2ydGUWNA3ZKnV0ZRL1ur0pY40simWTD1H91rSJmppuSOWXXGNJEvwvgQbzoOzClc7ZNbO1t981qZ30RwysPUYyqk1tF85eehekEMLTpiotmOovSwCGU8b0L+Xh8HP1+Y2jRkLyb9ejPk6A/HmElapsA0hlQgKlD3Mw7YXReEtO6kLBti9rj6X2SOm1R8wdTzvI8nQYX5UvBmYGRz8y5pY/zyEF7EoNWp9Ql78loCnd3cLP8hiZHrECYO1gWAgVn4fZbEVi9XVr4RwNKVfAfy2M/CDTE5hGjHoAKvLjARJVQyWqOyVoYqL8chtWWako86COt+N+jLwuvWeghzNrF2zg2bpH1tOs/YJTwlNsgSVhTG4QgIotGaO80vWVHBNU/JbK/GikCghw9IcTBiB+AK8lBOhO90otAI9ax118Qp4hSQA8E4gGLJiXYH4IxO227dW2wrn2wbnk1EOBrzoflTKcn2IGYrpsF1555WhMVRrDhHJvlQLfXC7JxszFSY9yjP7cWc0U24O4B5UrfC9ypXbuAm5+am+k6PRJt+SMALu5y1NdDadSKugQDNvoVDKGDWRE1DY9T23CQ9UR4fhQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dd60d8-2a05-44c8-b55d-08d84f54a17f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:26:58.1321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbwBrzJ3d8lgLz+LJQNwErW5aodNROTP2BFyoCYn2G5TbHDF/iR75yrJqOd7gvWLuqKkyCHrKJDGlkzp1s7RS1Iba66sv2oEUDynHp84wc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------563FAA8AA26B8A861CDC6DAF"
Content-Language: en-US

--------------563FAA8AA26B8A861CDC6DAF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/28/20 9:51 AM, Leon Anavi wrote:
> Upgrade to release 0.16.0:
>
> - Support for reading and writing private keys in PKCS#8 format.
> - to_pem and to_der now accept new parameter, format, to specify
>    the format of the encoded files, either the dafault, legacy
>    "ssleay", or the new pkcs8 to use PKCS#8. Note that only
>    unencrypted PKCS#8 files are supported
> - Add allow_truncate to verify in VerifyingKey, it defaults to
>    True, when specified as False, use of large hashes smaller than
>    curves will be disallowed (as it was in 0.14.1 and earlier)
> - Correctly calculate signatures for private keys equal to n-1
> - Make PointJacobi and thus SigningKey and VerifyingKey pickleable
> - to_pem functions return bytes not str, document them as such
> - from_pem and from_pem in SigningKey returns SigningKey, document
>    them as such
> - Ensure that version checks will work with Python 4.
> - Format the source with black.
> - Fix uses of assert_ in test suite.
> - Use newer Ubuntu in Travis to test against OpenSSL 1.1.1 (and
>    thus test the interoperability of ECDH code in Travis).
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-ecdsa_0.15.bb => python3-ecdsa_0.16.0.bb}  | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-ecdsa_0.15.bb => python3-ecdsa_0.16.0.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
> rename to meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
> index aba62f3ef..36bb246fd 100644
> --- a/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
>   DEPENDS += "python3-pip python3-pbr"
>   
>   PYPI_PACKAGE = "ecdsa"
> -SRC_URI[sha256sum] = "8f12ac317f8a1318efa75757ef0a651abe12e51fc1af8838fb91079445227277"
> +SRC_URI[md5sum] = "d593df1ab57da611dca76f7328c47b21"
> +SRC_URI[sha256sum] = "494c6a853e9ed2e9be33d160b41d47afc50a6629b993d2b9c5ad7bb226add892"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------563FAA8AA26B8A861CDC6DAF
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
    <blockquote type="cite" cite="mid:20200828135131.26321-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.16.0:

- Support for reading and writing private keys in PKCS#8 format.
- to_pem and to_der now accept new parameter, format, to specify
  the format of the encoded files, either the dafault, legacy
  &quot;ssleay&quot;, or the new pkcs8 to use PKCS#8. Note that only
  unencrypted PKCS#8 files are supported
- Add allow_truncate to verify in VerifyingKey, it defaults to
  True, when specified as False, use of large hashes smaller than
  curves will be disallowed (as it was in 0.14.1 and earlier)
- Correctly calculate signatures for private keys equal to n-1
- Make PointJacobi and thus SigningKey and VerifyingKey pickleable
- to_pem functions return bytes not str, document them as such
- from_pem and from_pem in SigningKey returns SigningKey, document
  them as such
- Ensure that version checks will work with Python 4.
- Format the source with black.
- Fix uses of assert_ in test suite.
- Use newer Ubuntu in Travis to test against OpenSSL 1.1.1 (and
  thus test the interoperability of ECDH code in Travis).

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200828135131.26321-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-ecdsa_0.15.bb =&gt; python3-ecdsa_0.16.0.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.15.bb =&gt; python3-ecdsa_0.16.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
rename to meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
index aba62f3ef..36bb246fd 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d">&quot;file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d&quot;</a>
 DEPENDS += &quot;python3-pip python3-pbr&quot;
 
 PYPI_PACKAGE = &quot;ecdsa&quot;
-SRC_URI[sha256sum] = &quot;8f12ac317f8a1318efa75757ef0a651abe12e51fc1af8838fb91079445227277&quot;
+SRC_URI[md5sum] = &quot;d593df1ab57da611dca76f7328c47b21&quot;
+SRC_URI[sha256sum] = &quot;494c6a853e9ed2e9be33d160b41d47afc50a6629b993d2b9c5ad7bb226add892&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------563FAA8AA26B8A861CDC6DAF--
