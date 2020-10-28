Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.83])
 by mx.groups.io with SMTP id smtpd.web11.10489.1603898462980515690
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FBexHcki;
 spf=pass (domain: windriver.com, ip: 40.107.77.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOQul9f56zx+zK7ej1nO7CHrp3F1y4TqCRRnIQvW4tQ8sQPBb8vRF6Mepn/liryWzKly6HB9mOoHNqlfWMxLRPCSqkYRBhWzQNcjOx44fiCJGoiTYlilK581fVGM9j2zFiTe5J7T2TXS3wtvLiUIjNa71ts4zfuG/ir9BCPeoWjXMttOr1TjIXrosp0YSfJ2z9oxyg5mgJ5QdEgF1BnfzqxfP49/LqmkqrauuNnbUrpBvGuJPvHMRmK48hS8CRXO8YPA2y5iR+NzrDTiU6A5UCvs0FbnC5bFjDkpZAmnaM/k+8ake8FeRplHBWBQAbjs+xd+PI3ho4VsMzwlC6LnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gt4evndHUcjcs4E8FZ+yrAEcY+7mYn386hRtZ0AZY9Y=;
 b=aYLffBdhHeiziqOTXp/ZZIll2oxBXgrvuiGvO65G6S6dc4huK3rYoSLIzNt+jUY37KWBU1d6T6wiIreC53uHP+HpwKbJOTufZrnLQyeqyuR12SHeVT56MwvsFWqdzorVZyAqrJeK0DUU9YVYTcaVzQUskpZQq3e6eUDVDkm1E7KLhIhldNBxtbMOe4JBJk5GQvgCpXyo3o3AzyPE1kvh6DDaa6cI4avLE/j45zk2l4cIX+iZX4WmMu+T/sQElAMOaoom9OuQ418Fv6nk6yvjYPrgRl4AV/3PNB/99UUYyItWvKdSdFC4dgDhLSN2vbhKwNjXNYQ4jASpZZvM96Fv6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gt4evndHUcjcs4E8FZ+yrAEcY+7mYn386hRtZ0AZY9Y=;
 b=FBexHckinpu2qOhrUt5ukM4YfoWbH+T/bZamnPSyxbc05L+hsIPnJlTRIQ1jUMrbrJSHk3h3hT7TWbIW1TaimguB9WAAmDWcrjSqsVNbjEV22nb28RPN7JfVZplj22AZK9+tGNd+rGGMlCTBoCKHMPIaf9gHeVKfOshfhQgYnGY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:20:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:20:58 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-regex: Upgrade 2020.10.15 -> 2020.10.23
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201023143233.6911-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f23169dc-d5bd-2a7e-ec61-83e1b08dd114@windriver.com>
Date: Wed, 28 Oct 2020 11:20:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201023143233.6911-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR11CA0076.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR11CA0076.namprd11.prod.outlook.com (2603:10b6:a03:f4::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 15:20:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c32275ad-2af7-467d-3e49-08d87b55127c
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5008:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50082E266A503E4A3A8579B59F170@SJ0PR11MB5008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aDJGmpBYxWnFdxOOMARJVTVw0HZ9+c6oXgOURh4gh7plKhkOvCfPbOReM12eF0r+nZwZr1pA0x/agHw87G3EfqtqihHHeWFzVuk1LNDS2P8KyqTbgcCyvrvf1RuQAtTQ8bJiXywrZhdAWman1eabUBlKfe12fB/2d41Gm7ib7FqyipvQqZED4QHo2ctvtG55t7+hkG5GcA3trDvMtnTwGuODJzB1/3oFINjhzBjLHL781lVOBj/20cEZPoZDhZFOKZH3Sz3LQr6YpvmllRloyLQc1D3O72mnp3Vd42VDKmTS8NnuSgKWelQ6slbXUsRvmFpishk827JV9xnYKVdvET505JKu9iwFc26Q+8FcjDKvyo6gVXHdX1vxyjmxUs7js/DVaFj3FuKX03Wsx0FeEvuQgfjcE0TNLG9xZFW0I7KxqAhWCJF8vT6swDxGi6U5hLC55YcokR6kntcoMyrfGw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(396003)(136003)(376002)(83380400001)(5660300002)(166002)(6486002)(478600001)(44832011)(33964004)(31686004)(86362001)(53546011)(52116002)(2906002)(16576012)(186003)(16526019)(8676002)(316002)(36756003)(66946007)(26005)(966005)(31696002)(66556008)(66476007)(8936002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ADcnpdlTEnKr6mflNKDFJWgLCFe4ZNqKqyLbGGGMN4VV/oVpOPd7ZyulwQwkihXPKUlBB8hFlQQ/kEghRntKt0WoGsXYnLD7DEDIEF8RAdaww6xzaA/aszyBfGYl0khKNgFOfhG7DgQMv0tlxc3EtmR/8xydibVGDrIgCy/2LrC74C6HobOFRgil01fbls8rBGgysK5NEFiHYNMQeCVpz8KHzLdvRCtYH/e4N7ywgrlf4E+145MqR0Uya2HHAzfhq+1haUEkUU0/ytEFua7leA/OZ4eIKmRkxUWNgsrxOxjCLad4PhyBB9ys7WGN2hciEvi6DbdTvLN7fEAt/FVQ2O0Gc3lWPGcD8J5JQv/igYg6ukYG8nUmuCmnRiJ48nCqro/YiqwhKO9qqNRJCAcKSB4uhIUy98s9VGDluHhf+fIyq6e/WbjcOVvFJw8N+G0zOJUvLRChnq+tgiag2tVI7G89LARwJM6QPXBlovExURRpID4+hG33nTiXn7xWJGft40TdtEjg254Ikh3zDRDbgzQy1IiDKVdj88cah++Rcn9Jwob2ebZagvaLg7aGrwBVzyvgoiGe5oWhIuHvf6D3ZfysNq0DcHuevPxW8GNRcwXmXvKpyG81DimtE8oUb0PF47HhOorWoMzMWjr8mwKdZw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32275ad-2af7-467d-3e49-08d87b55127c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:20:58.8782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DYGlOQYJIW/xQreVwB689et1ttX5zuqFWP4bhoSnYKB3ftCD/iHxr0zA+K67xqopy54SqJyNTeTX+PAcnU+Aja92ktHvkmFoB8cO0FFVhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
Content-Type: multipart/alternative;
 boundary="------------A4B478F4C2D002560635D350"
Content-Language: en-US

--------------A4B478F4C2D002560635D350
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/23/20 10:32 AM, Leon Anavi wrote:
> - Compilaton flag to avoid storing compiled regexp in internal
>    cache
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-regex_2020.10.15.bb => python3-regex_2020.10.23.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-regex_2020.10.15.bb => python3-regex_2020.10.23.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb b/meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
> rename to meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
> index b72aabd0f4..c8cbdd11f2 100644
> --- a/meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "ef9f43ab182949c79b2c8f869788f8aa"
> -SRC_URI[sha256sum] = "d25f5cca0f3af6d425c9496953445bf5b288bb5b71afc2b8308ad194b714c159"
> +SRC_URI[md5sum] = "13fb62a1b276623e38931f7217f080d8"
> +SRC_URI[sha256sum] = "2278453c6a76280b38855a263198961938108ea2333ee145c5168c36b8e2b376"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------A4B478F4C2D002560635D350
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/23/20 10:32 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201023143233.6911-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Compilaton flag to avoid storing compiled regexp in internal
  cache

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201023143233.6911-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-regex_2020.10.15.bb =&gt; python3-regex_2020.10.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.10.15.bb =&gt; python3-regex_2020.10.23.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb b/meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
rename to meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
index b72aabd0f4..c8cbdd11f2 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0inheritpypisetuptools3-SRC_URI[md5sum]=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;</a>ef9f43ab182949c79b2c8f869788f8aa&quot;
-SRC_URI[sha256sum] = &quot;d25f5cca0f3af6d425c9496953445bf5b288bb5b71afc2b8308ad194b714c159&quot;
+SRC_URI[md5sum] = &quot;13fb62a1b276623e38931f7217f080d8&quot;
+SRC_URI[sha256sum] = &quot;2278453c6a76280b38855a263198961938108ea2333ee145c5168c36b8e2b376&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A4B478F4C2D002560635D350--
