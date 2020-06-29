Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.58])
 by mx.groups.io with SMTP id smtpd.web11.20565.1593442268010899149
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NuEh7WGJ;
 spf=pass (domain: windriver.com, ip: 40.107.92.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbFofA1Hf0tvldIMKiPfVOONEIDnQeRiZVmq3sNBrWt3OeCcz+eHrhZL+Q8FJclVxShJWbXVQAa6MOxx0/M8DajLWX+V7KKEexb1VPt1S92EJmtG9MHdHcm0QPIP2eJZweCprFMm9DM1cWhiBt0oESPvpxCIuizDVd8HbEKHscA3tYHMrtRi9MNDYbUjb3yKZxFY+SGZU04uHlvoBxzX5CTxmvMtMGzdvBHzxbQGGXiJ6V+yXs6RWRRcFZ3SyiyAPWZgHQil8porvg2sJj8n7fsw0G0doVc3+zamQMYHOA0waa6BzkF4y5Fhgqb3jbXIdb+541K6elL/zzfUtII10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LuPCRQ2btPWOMcCAb6ZgXzbqCmdgRdoGSmP1GaAgSE=;
 b=BRAZY8TbCO+U6G/ib15CERberfjqJ2nAr+haE7DbyKuHjUS0+nbbYOvcpy7JH554hl6fXlAVlR0qJ9vz/cEIbF+/nL3079ouxZYVNgBqRvhtvPM3ftLl6J5xHSwIofqCnNwn2KPBO6a/+QAUpxsJgKMTy3+zI+DHy2pdr8oJkFLTxBbRbMnj6uaypSPGj2YIxgYpsBltrQfLycVBZrUHEnrEHtRWU9FZvmIB1HH7J1c2frCNBkoq+ISyKswFWVlCGny77VyqdNGrkearpoXQXmUjudSh4CH/Np9M+DKXnlhkePUvV5N6ws9WjqI9yCEWVoqy6AB/xdn3A3VO+GDLCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LuPCRQ2btPWOMcCAb6ZgXzbqCmdgRdoGSmP1GaAgSE=;
 b=NuEh7WGJ8yRHgPSLmN5pMVEvs3T0dSMJfKYhQf/08fJ6RTgtsEWZiW52Myk8yOdhezK6QaT3bwaFiWeKCbt3T8p2U1xyS+hWzajGA8R6b1LO6S2FSVUrkvq3eXGv8HuMNceXjnqXKmP25zgK2h/1C9XsheVBM7wi8DSlkqkG3PM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:51:06 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:51:06 +0000
Subject: Re: [oe] [meta-python][PATCH 02/12] python3-rdflib: Upgrade 4.2.2 -> 5.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <be299b46-10d3-a46c-6d91-872a3f464821@windriver.com>
Date: Mon, 29 Jun 2020 10:51:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::16) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 14:51:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30ab017a-0a60-457f-26d7-08d81c3bda4c
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB19884E81E7067FE0751F01219F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:285;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xfHPr/U1cZ3tdcKVheUJTMYNCVWpM0TfVNubwPJRApU9pGMcsLpn4B4B6cBHXPQ6fx3ideHfQidV6w4Tb+ZEw9IOOgRocG8uEUPgWiT/t05bg/WDKPwcj/75yvj1Dy9a7tvDgJj2kK58eapLuEo40omtFlQTjdIsI7Lo4wJQGymOqGOFUXNOGxfpRRzgI8WUSjtBWgtm64loUYvOosxIUsJYZ0RLj2QST/JhE3/1zj0rqWze3hBPCqdmpOdbfpjdkNfGWgYeMRf8G1HlT2I0401mTMWzkWo6ae8XaCcKctR3p9EcTBQNHao5PrGA6bV1xdzSyP5cnBGfJi9PypLAtLlUMx12hnWBDU6c7bfK9zHtecjOp/KNovBZ+bgY5v7dHIytcDcX8ydvcrt432/75iOwsOaprZjLqSYjYxlCSs9UWbcgRDVo7HGrsMltFO6+7OQhPrYfHm+4HivGd7aJlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(36756003)(16526019)(966005)(5660300002)(478600001)(2906002)(83380400001)(8936002)(8676002)(86362001)(31686004)(316002)(16576012)(166002)(6486002)(26005)(52116002)(186003)(33964004)(53546011)(66556008)(66946007)(66476007)(956004)(31696002)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Gg1JMWef6uC65Ugj6vxMAOw2fZtgw+N3Mg7h7fAMy5A4D8vOEJ4LspTWy1wLOrGRT71n4jE7ijaN+YX5Q9RU3oOcJ+yd7kt6HSrY50uPB1Ts7+XZpH5GiD+8HtJ3qsIZYkIamP3oX+5vZi9mdIS3TFJFGx/6XnecZi8QalOkxNRBFpMbGyWQOPBsRaib3v3TEcCmXu49yOxpVzMqi7AeulrM13A55SDjc3TiF3vVkScI1pE9darV91WmpUPj9S/Qx7GDjF2Vneci5nArFUPO2NPRyCXL05FSswk5QGmc8cYpb6MQmiy79JGcAs+mmEI9gk6DZCCTuH8dnRSeNJ6nwgUQyF5Uqfjwlfaw+U9oJcsS72VSdx+K5UI761nKY0qUKhsqkg0izVaxbKutCzPkEcxSf2jM6ENcU1mFWejd0jdk+jH/72q+BMYiUqfn8avAWTNOA3mifmXttB0KzHjrO30lSDxZw6Mobxr4/FG5NfA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ab017a-0a60-457f-26d7-08d81c3bda4c
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:51:06.6745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HojjzKBZzWygiGCzJEjsE2zGltKjee3zxnle+N8zJN3ADbpJsmWESikQhi2woBdbjv4GMr049GC6GXK7koapHTCp9kSHv+ET4GzGUuNBbTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------2B73A5EDBC3635CDA30F284E"
Content-Language: en-US

--------------2B73A5EDBC3635CDA30F284E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Upgrade to release 5.0.0:
>
> - Fix n3 parser exponent syntax of floats with leading dot.
> - FIX: Change is comparison to == for tuple
> - Added _parseBoolean function to enforce correct Lexical-to-value
>    mapping
> - SPARQL fix CONSTRUCT resolve with initBindings fixes
> - Documentation fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-rdflib_4.2.2.bb => python3-rdflib_5.0.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-rdflib_4.2.2.bb => python3-rdflib_5.0.0.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb b/meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
> index f7e7f6310..d037a74bf 100644
> --- a/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
> @@ -2,8 +2,8 @@ SUMMARY = "RDFLib is a pure Python package for working with RDF"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=68c1a3bb687bd63b8e5552f3ea249840"
>   
> -SRC_URI[md5sum] = "534fe35b13c5857d53fa1ac5a41eca67"
> -SRC_URI[sha256sum] = "da1df14552555c5c7715d8ce71c08f404c988c58a1ecd38552d0da4fc261280d"
> +SRC_URI[md5sum] = "80d7c6adc2e4040cdd8dade2e0e61403"
> +SRC_URI[sha256sum] = "78149dd49d385efec3b3adfbd61c87afaf1281c30d3fcaf1b323b34f603fb155"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------2B73A5EDBC3635CDA30F284E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200626112944.25569-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.0.0:

- Fix n3 parser exponent syntax of floats with leading dot.
- FIX: Change is comparison to == for tuple
- Added _parseBoolean function to enforce correct Lexical-to-value
  mapping
- SPARQL fix CONSTRUCT resolve with initBindings fixes
- Documentation fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200626112944.25569-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-rdflib_4.2.2.bb =&gt; python3-rdflib_5.0.0.bb}      | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_4.2.2.bb =&gt; python3-rdflib_5.0.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb b/meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
index f7e7f6310..d037a74bf 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
@@ -2,8 &#43;2,8 @@ SUMMARY = &quot;RDFLib is a pure Python package for working with RDF&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=68c1a3bb687bd63b8e5552f3ea249840">&quot;file://LICENSE;md5=68c1a3bb687bd63b8e5552f3ea249840&quot;</a>
 
-SRC_URI[md5sum] = &quot;534fe35b13c5857d53fa1ac5a41eca67&quot;
-SRC_URI[sha256sum] = &quot;da1df14552555c5c7715d8ce71c08f404c988c58a1ecd38552d0da4fc261280d&quot;
&#43;SRC_URI[md5sum] = &quot;80d7c6adc2e4040cdd8dade2e0e61403&quot;
&#43;SRC_URI[sha256sum] = &quot;78149dd49d385efec3b3adfbd61c87afaf1281c30d3fcaf1b323b34f603fb155&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2B73A5EDBC3635CDA30F284E--
