Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.56])
 by mx.groups.io with SMTP id smtpd.web12.2166.1591114383747235914
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 09:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UYyzftlS;
 spf=pass (domain: windriver.com, ip: 40.107.93.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIpW8HQoMdvs83RoY+GZe4hoPQ2Crs74pS/l/Ap6Xtr09kzL5plfreAcFqrnyxJ9rbkj5odRk56byL2A85yw2kLtGMYysCS9e1SIyq5YZ7GXC9hNyyRemiv/nbDvu1BVL6b7A3RqqakjQhVDH3mcjtWZxgYUMpJ0rA/1P1nArDgimxWLHMLukmS81WKCZTWBFOvmB3yMciQ+VtxOzYNI5XyUtKD81rVhpVvifAS0wKJG9/So7W35TtWAcSBgeKN00QXxuHtJxkE4Vfv4kFFjIhGrLzu88y034yhDBbi6FPac768Pypoqz6hajOhUyLWitmAX+zD6h1dvxKfLSH6m/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvF74QcKSGm8I+EG6y9l/j6u2VBBhITi4lQMCEqGhEo=;
 b=XmSPLhpgpj2xY0373Q2CerTpjCD9i02NVRll93WNFeiz77/E/7aVw7adGI1FiCtxFz+ZOib1YlIirAxwD9ACC0TWR2KGTjAB/B38KsnM5Ru0flPvtF52GQRy6qlU1phj7YXb4Lig+vWGLai0cClb+bNna75iVFgiIIicmUuiGS5K6LwRKHafGiHJxX6s/lt97gLQGK154FSLObS488Z7hAZIBAamkqRNCxI4g2rXxT4QK1D/SNkVj6ZgvT6AUkaBN7+DEpMruWVegB9eIJXm29iiYRcQOrF81otP/KVMNF3q7njk/LWWLjyGPTmTItnJBdw4Dga/5nRbzeIh5j99/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvF74QcKSGm8I+EG6y9l/j6u2VBBhITi4lQMCEqGhEo=;
 b=UYyzftlSnnN5xNcgUxR11pYWgTff76aNuh0EAgrhYShDXGlYmJft+YLdiKzZcVvqQzi61y+r0GEFVKmL8pZU0qQ9xMIpKiLifVAvhY3VyjSs/obtT2O9KL0e7OObJOxomMKgDcycJFTmtlDNsJk16IkM63YZdbDesD0LtaIPIWg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1491.namprd11.prod.outlook.com (2603:10b6:405:8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 2 Jun
 2020 16:13:02 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 16:13:02 +0000
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-serpent: Upgrade 1.28 -> 1.30.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200601120419.13396-1-leon.anavi@konsulko.com>
 <20200601120419.13396-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c9d6ea7a-1f46-8919-f5ed-16bffa13de52@windriver.com>
Date: Tue, 2 Jun 2020 12:12:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200601120419.13396-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::35) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 16:13:01 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77d1dac7-c4d2-4e2a-09bf-08d8070fd2fa
X-MS-TrafficTypeDiagnostic: BN6PR11MB1491:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1491F08907F01F1117CDF4409F8B0@BN6PR11MB1491.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0x0yQTScjsTssc6HTot7raeNxrCNbx+g5UuraYNbQB1ed/o6OX4wFH9kFpOpRknpZex1Yud646l5hU8ZRLLYkd2O6Lgt8xonldHGGIBgJrpumY9O/smJqHNiFY+EbgMuW6QKwN6lPP0wP7+/nPkU64l30x0fI4UH5N8PwKdtBSlefuIvXDUMmlZfL+U8yISUHAz5DRa5HC0NRDdAmPTCMJgezBHf2KcR8i8lioaDdSJMIWZ0X+lNniK8O6gRiw9Xl7xJkwq9NBVNYNJ4VCbOvBAOPQ3wCzVOkHTjY94EQizDuOWZOyzCTNw7KA8X+bF1jGtKIuZJ7HuRpeIW/igoSJbFr9Wp5h2HVPJW2SlbpnUDdk+8wwz/+I+z9zWgyaPCEkozc5MqPPQ0SXORcSWPm47aToCsSITR5j8Js/Ksqeym3XH5H4k0ElxxsxZDV/59aUfoGDDsA0IUsd7cdkcHpA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(396003)(39850400004)(136003)(366004)(186003)(16526019)(53546011)(33964004)(6486002)(966005)(52116002)(36756003)(66556008)(86362001)(26005)(31696002)(66476007)(2616005)(956004)(66946007)(8936002)(44832011)(5660300002)(478600001)(316002)(31686004)(8676002)(83380400001)(2906002)(16576012)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YtM+1CZKv/nF9VJd946u6WqphIjhsXGHp4Laa1h2QJoT2WsnZx0bbCZirOMmpPp+Jq90y8OIjCjGXZKIQ5PMvD5Ws5RZPy89ppHfGgp1Ze1NjOfUDPxpEaOJap9IXq9m2neduffzbaOKVNk0tT3+l/exBQ60JqZyUSoEOqWJhuqct7YvW4OwmDN9fyhyA7kh0gxExX8km6vM1GNwL0oPLrvnGdi5ZCmtNOB31J7BObo6qvnhCN3pERA9ZxwZbvUsBYvICLwFM7a253+gjdEn5b8SGozIVokHqwLGES3E4oNUWP+z0hUwU8XSLyjrCfn07qVEnQuuPxIUiofbyo0KdTCgX+/7yv3SLK86H3R4jfTQfHuYSmUroC37C8FQ2qgdhG2gxYt2DdLPt/VIyHmOOJHwQcMCl+CpHYNPqBcvryN5Pa+0nH3UGqdlF3uXtm9bQhpnTVIBUsjoqHxRsOcasQOVoMEari15Yo08LFNuX+g=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d1dac7-c4d2-4e2a-09bf-08d8070fd2fa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 16:13:02.1485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjACGnEUbMRdNV+m1sBWlcn47+NO9MiirQHYPLF9U72nr+WBcxbYKBkTZdEYqpFBykMWdemG4VbmnAVtf1qbVG6FUeTr6DDJjM9HhJlPhu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1491
Content-Type: multipart/alternative;
 boundary="------------E91ED724CF487AA5696C6DDF"
Content-Language: en-US

--------------E91ED724CF487AA5696C6DDF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/1/20 8:04 AM, Leon Anavi wrote:
> Upgrade to release 1.30.2.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-serpent_1.28.bb => python3-serpent_1.30.2.bb}  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-serpent_1.28.bb => python3-serpent_1.30.2.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.28.bb b/meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-serpent_1.28.bb
> rename to meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb
> index af2d4aa4a..64edff76b 100644
> --- a/meta-python/recipes-devtools/python/python3-serpent_1.28.bb
> +++ b/meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb
> @@ -1,9 +1,9 @@
>   SUMMARY = "Serialization based on ast.literal_eval"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5cd70632b6cdb96df9ddaf6a4ce619e6"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5271c65b7cf83bd28055e592c2d14667"
>   
> -SRC_URI[md5sum] = "15ef8b67c76a6d19bac9c16731a1e62a"
> -SRC_URI[sha256sum] = "f306336ca09aa38e526f3b03cab58eb7e45af09981267233167bcf3bfd6436ab"
> +SRC_URI[md5sum] = "cbef4f9c88f88c38195d11a0363a095f"
> +SRC_URI[sha256sum] = "72753820246a7d8486e8b385353e3bbf769abfceec2e850fa527a288b084ff7a"
>   
>   inherit pypi ptest setuptools3
>   
>
> 

--------------E91ED724CF487AA5696C6DDF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/1/20 8:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200601120419.13396-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.30.2.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200601120419.13396-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-serpent_1.28.bb =&gt; python3-serpent_1.30.2.bb}  | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.28.bb =&gt; python3-serpent_1.30.2.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.28.bb b/meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-serpent_1.28.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb
index af2d4aa4a..64edff76b 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.28.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-serpent_1.30.2.bb
@@ -1,9 &#43;1,9 @@
 SUMMARY = &quot;Serialization based on ast.literal_eval&quot;
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=5cd70632b6cdb96df9ddaf6a4ce619e6">&quot;file://PKG-INFO;md5=5cd70632b6cdb96df9ddaf6a4ce619e6&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=5271c65b7cf83bd28055e592c2d14667">&quot;file://PKG-INFO;md5=5271c65b7cf83bd28055e592c2d14667&quot;</a>
 
-SRC_URI[md5sum] = &quot;15ef8b67c76a6d19bac9c16731a1e62a&quot;
-SRC_URI[sha256sum] = &quot;f306336ca09aa38e526f3b03cab58eb7e45af09981267233167bcf3bfd6436ab&quot;
&#43;SRC_URI[md5sum] = &quot;cbef4f9c88f88c38195d11a0363a095f&quot;
&#43;SRC_URI[sha256sum] = &quot;72753820246a7d8486e8b385353e3bbf769abfceec2e850fa527a288b084ff7a&quot;
 
 inherit pypi ptest setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E91ED724CF487AA5696C6DDF--
