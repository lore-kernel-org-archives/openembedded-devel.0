Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.69])
 by mx.groups.io with SMTP id smtpd.web10.10911.1593785155586918250
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kYjF8Sg8;
 spf=pass (domain: windriver.com, ip: 40.107.68.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpriU1mUQZgwhCOAE+EJjJiHKaCtUtj+veraQ2NPI3cMXkNdZ0JXP3UMZy/HX4kc8hYIuzcroa0eZua9UY0So0PjI5q+OIZHRpX4JSUyo4QMParl0U8p0+LNP28nCassPwzwWYij7mDCXwl8Hqt9/HIFZv6LN8owsWJRUlN/CQN5j1+n7ee5m7YT2BcpY36EyMMf/e7pZGarK2dj4YtL1xwDHzKrL1GrapXoic8F1v4NBDhkJlURIa8tJcOES7ttKWSuW61mns/akAyxbAbKJr2RNKI3v6fqC6K2ZTp3lh+ukAnyrwI2adKLHUPzuw/5HS3uLvHkDKDsYAC3531eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/LR9mhPJ00tnD8P3D+ePSApRDcLsiDS5nYVVv3U98E=;
 b=QKXU4CwGNwM0Jwxbhzi9wFiLwdYLykM+5hA+NUuLPfDgm6NnVxNUJNghl1XKAjw1JiF5y7BFir9gltnlP2IfaqPPLPEo7N2qF0rKxHYbnAD+kW4fUWuwfCk3bpWqi3lTHyBwKJTKTGebJLXzhJjK9zOJC/T7z6khBi0/8PBMN1GuethfcGwyC1niDxo3rrgtz0l0hiqlnZwoW1xkx2qK/dp9zBU9zJol28EQnVieDD2+2Z1leCkzw2C/Ag/i73FnYFoySvSsAabc0otuGcQOWspQ4NaFNpRACjijBC+ST5gVZy/Owq9tIzgEf2P5E+Zzf7DTcxhzTJvG0wADB/G96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/LR9mhPJ00tnD8P3D+ePSApRDcLsiDS5nYVVv3U98E=;
 b=kYjF8Sg8OSWrxDhQWTwIW7zSY2gUBe0aZ/U4KGP/xVA65231Yyyf0nKpiDPRrUVXfimHwzmssj2f39IxOXfmMr/nc2/Ke/DNWosTZA5dR2aBZehFIbF20tvMfPVy+thCWGm/ZZhOztY2PF9ejsuqEzjm+GqQZu1didXRhYdFszs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4300.namprd11.prod.outlook.com (2603:10b6:5:1dc::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.22; Fri, 3 Jul 2020 14:05:54 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:05:54 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-cachetools: Upgrade 4.1.0 -> 4.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
 <20200630171119.25540-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a934f617-43d1-b77f-60a2-606e8a7a9a27@windriver.com>
Date: Fri, 3 Jul 2020 10:05:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200630171119.25540-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::9) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Fri, 3 Jul 2020 14:05:53 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f5344ac-331d-4b08-b00c-08d81f5a3348
X-MS-TrafficTypeDiagnostic: DM6PR11MB4300:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB430001B54D399C20DB4741C99F6A0@DM6PR11MB4300.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ukFTn9IFMFgB/be7/iA+qDrW3fjqGwQ2mNLkMmyzjvZuXR0t79lnyiiu2cW3MPkXCBuIYNnhKa7+syeztICsvXyVUJUQmFr2Whl2LnXtG2h/qX3c12DQ2ajIG+pZtx3cr5T9LTR4BWziZgggL3RrBsI4dckAT8ZTn96g8M5stixn57ObNtAoTW11PFKjv51lT0mx2SLb3h1H1u5XBICbSFaPL23OPCShvk/bI2w+otHEP+zFDmgYjnpcGAfc59ihWDTYCeQ1k6SwXfT/tVmXSOBxvr1V5dGikcUBpjELF51Koyl6hLoyM1Dh9iI4dten6PUAlHAK055lIIdidKwPLFLdOBeqKaAcreeyjUnYFqsdbgL6VTLf9mmPPzYo/EHVPPxUfav2s00YCYAgNmI0xh8gZIuHpaTAwQ/QANf6Cauf0fuTPwqV7RyQnTujIPuaXwQaho3emYBgBp87Ej2jlg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(396003)(376002)(136003)(39850400004)(31696002)(66476007)(66556008)(66946007)(16576012)(6486002)(2616005)(478600001)(166002)(86362001)(966005)(16526019)(956004)(5660300002)(44832011)(8676002)(2906002)(186003)(26005)(31686004)(316002)(8936002)(53546011)(52116002)(36756003)(33964004)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	z55kRjz8YWRJHiG76JyEoVUqLl9RqPswPXuUsxe9Shp7zw3DWyAwQvtKr0IHD4ypoEO8J3+5EhK2IJxFmHgPwKViT/z5nh1OBi1asxYVX6PTo0SnxCnmKBP0cRpV89d7kKRLnBzi9mMPpAd8MRL26uqe3jXqtW9NNLDJVp0b5sK+L3XlE1uXRD4hVsJpHf6KmEQN66td+gd+10Neudq1gI+mirn/EumOQbRBd3la9TyUbNmpN4xIkf/iLX+vYBtL7sQemX9Af2/n/iErCBAm/zIHLEB5Vf6mR/tc4MchaPE4OvoTHoOiaiUwt7S1etZQn5dZRiE0IiWcT5Z2DCNvfMnGr11x74B3fd6apq8aE8FJXAbR7I4UnzANceTWWAaxKUqbr8BGh0dpVSOHPI2W/KTjo1BriRS2IPHY4/T4tyjsd6RDXJxZJuIjT1DxXlDzl7OKYVrFig5bzg7UvJZthjabAkmOzJ5+dJ839vol02vC/H6uzdSYX7RdmUKUTa/b
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5344ac-331d-4b08-b00c-08d81f5a3348
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:05:54.3023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AJEI4zNtvYanhkcd6aKn+rqWOwRMpwZcIIGSCQxJcJUVyrcG0qOY96hqqDKx3Brj+IRhbCSLYmAqKuRa0d/VdhRdsIL5L0OXWWdNvYq6XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4300
Content-Type: multipart/alternative;
 boundary="------------4B7C37DE524F39E2A638D372"
Content-Language: en-US

--------------4B7C37DE524F39E2A638D372
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/20 1:11 PM, Leon Anavi wrote:
> Upgrde to release 4.1.1:
>
> - Improve popitem() exception context handling.
> - Replace float('inf') with math.inf.
> - Improve "envkey" documentation example.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-cachetools_4.1.0.bb => python3-cachetools_4.1.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cachetools_4.1.0.bb => python3-cachetools_4.1.1.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
> index 07d86cfc5..d334070cd 100644
> --- a/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
> @@ -23,7 +23,7 @@ do_install_ptest() {
>   	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>   }
>   
> -SRC_URI[md5sum] = "4468da43443115a00c02c126cf601ae0"
> -SRC_URI[sha256sum] = "1d057645db16ca7fe1f3bd953558897603d6f0b9c51ed9d11eb4d071ec4e2aab"
> +SRC_URI[md5sum] = "ae41b69896f49727e1621d279cb72522"
> +SRC_URI[sha256sum] = "bbaa39c3dede00175df2dc2b03d0cf18dd2d32a7de7beb68072d13043c9edb20"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------4B7C37DE524F39E2A638D372
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/30/20 1:11 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200630171119.25540-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrde to release 4.1.1:

- Improve popitem() exception context handling.
- Replace float('inf') with math.inf.
- Improve &quot;envkey&quot; documentation example.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200630171119.25540-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-cachetools_4.1.0.bb =&gt; python3-cachetools_4.1.1.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_4.1.0.bb =&gt; python3-cachetools_4.1.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
index 07d86cfc5..d334070cd 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
@@ -23,7 &#43;23,7 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[md5sum] = &quot;4468da43443115a00c02c126cf601ae0&quot;
-SRC_URI[sha256sum] = &quot;1d057645db16ca7fe1f3bd953558897603d6f0b9c51ed9d11eb4d071ec4e2aab&quot;
&#43;SRC_URI[md5sum] = &quot;ae41b69896f49727e1621d279cb72522&quot;
&#43;SRC_URI[sha256sum] = &quot;bbaa39c3dede00175df2dc2b03d0cf18dd2d32a7de7beb68072d13043c9edb20&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4B7C37DE524F39E2A638D372--
