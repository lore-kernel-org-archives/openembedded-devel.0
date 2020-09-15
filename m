Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.46])
 by mx.groups.io with SMTP id smtpd.web10.14668.1600179997685907112
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Wp9yLM+U;
 spf=pass (domain: windriver.com, ip: 40.107.237.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kB9HnPgUJp1vCT/GIf8h8WiiYApuzuTpLSF2WYdWZRaMr6R2OjwhEADWaS+6baN5JnRk/wI++2TAINpXog6RpkWXrmYGE8ke9tAtUHx36YllefqDtcbUjWbkyeM6xkQQKsxLciAwykE+UG1gj1ZPCctKrHO8RMbW2eeo+JI14jpmkeaP7IUynNVNXsO+U3NokXecZNG5S3Rlb7SYZLHybcGcGHmeS5BKydNs5JUU1hNjSDhycdBKwdPnkIVl2u3VOZLOEY00kLiVDDebl6G7WDR45ORQH3CHw8gn8MKcevrKpJ2fGx+oypPgUUObUomRpozIy0RAgvCbZQiuDqjQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6G1ReJBAMbWh3gMUEnnoO8M1PjBrgBxSGmsPtxilC5o=;
 b=IvwTD6zcBP1xIbKiqpx2fHWGHdiGuz3ed6me/l9whAcxQ7rAdA5honbf9oDc1gkCcyG8tq3ao6pkI5CQZbhCWh0EvBaNb7myOPQwv2oxmtbCGGEAK+Sy/EFEblVX6HM7dWWI66lvlf9EORiu/nG55KMNms7SqOxoDBX4UeoGhe3UqFzYosGRvSAMAZFsJX6c2BAxCEmXj/sAa+OYT9Woyye7maKxWHTSl74U5zByQrlzvBWKb6HaNKEsQEw6Cg6yNL3RLRbIBABvEjhYDgMz5xO4FMoIstZE+9zZwZgNO9g3BQ0iDW4TWBl7Sd4oZ92FyxfgoxGBm6lgbe7pzTfZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6G1ReJBAMbWh3gMUEnnoO8M1PjBrgBxSGmsPtxilC5o=;
 b=Wp9yLM+UQmLrD/GEK0WQ3yxyubjlLx1gj+QFYiyuGdYO64JvY5UVYdCgvb4LFbpmG9qakTaJIPLmN8N2v9CxHeyD19HAW6VZaVon9L7sZ0y1vdIgh26FDcfQDH2XhxEuwX4xW3rL96Wago4D9IV8450iJ/lLhD5UYKc0L51THBA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3767.namprd11.prod.outlook.com (2603:10b6:a03:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 14:26:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:26:36 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-dbus-next: Upgrade 0.1.3 -> 0.1.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
 <20200914090419.19171-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <32f9b8e6-25c7-4875-0a6c-9da1c866f259@windriver.com>
Date: Tue, 15 Sep 2020 10:26:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914090419.19171-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.19 via Frontend Transport; Tue, 15 Sep 2020 14:26:35 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2065e3e-e1ac-4dc3-0c6c-08d859835a15
X-MS-TrafficTypeDiagnostic: BYAPR11MB3767:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3767A86F9E111223B6A362C09F200@BYAPR11MB3767.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ulgYW78jo4xFc9vM4uiA4Y2/yUzt6v6D42G8hao8zm2JaT3rw8cbwSStjiyqF/DR7iiZCpWQnOyu3WD9eyM/YXsYS6PWeb1+rjT3gFywPfj8rVdo4x1m6/YGWKGAeNjy6nYHPmwrx/lT0zmyhxSx3wQAc0N7OOQARCHBw8vmArY+7pdd4uv1g0PyJ3ieSA4vP38rHGr8gE21UqL9Y6hQO6ThHRquQDKimjJ/Bagb9rnbW+T4d9afSpoEETF9tzOpVYsIcOpkprv3gaaQyU2PyfZBWjVcJcSEID6hFXUHifj5Op+KTbo4HC9YqeQO4smIfKUMT+ipxxVobIZS8VO6koxHVF3hWmp9GlfaWrqSDzG+g20EairQU1lXm0V4mYWHRjFkxw5MHDuH+OZbPOl6gxW0u7jG21lsKGdeWOSjWTtuEUL4Ji/iZ+NXcnz5h1VDSVfF1It4uOej6y+UmuNanw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(2906002)(966005)(66556008)(66476007)(66946007)(478600001)(33964004)(53546011)(26005)(16526019)(186003)(52116002)(44832011)(5660300002)(2616005)(956004)(316002)(16576012)(36756003)(31686004)(83380400001)(166002)(8676002)(8936002)(6486002)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VcqeU+91R1tyfXEzqz/cLZ4ghGex93L40pGzX9y9TcCKrynCPBu4+zxQpzPqFxWgjdQ73Cp4NMh5onMjUvuagMmRHHAWnTazUKqdnhR7dDvc92ky3fbuKYhfQwWOwMCn5l/2nCs//yscMfC/LlZAN9Tw/cPBi04N1EoJAzmIfi4NamAymwdCathPM7G1u9EHO59mlW/h8JclVedPVS2DnjLiPcHfJoOERYFogKSmj7my2yu9qfToLNYgrXIk2oahsvfeuwHoUyan/M4tzy7nOqW8Nf2qB89rv4hMMupW8uAWpc3gii6BvMAwvt224kajLCZgwuImk9bbe67+u298d7xRVD12OJb+ruh25vEtAY3BEpK+WfO7W2zghV4xEKxXYhOTayX0lOEBKiw9NBBkyVIEHr8zirx1tcj3gapkfgvsf+GBfADq5wuFVWzjpS2JwyOtmDubb8vKnLKLGooQUggEJxhmQhb30oOegKj6uMvDziIDvBddePojTINMmx/7kB/wSMbhXx9eIut0Q4eIR2jiRfEBd+/RID3SUZGo3UPwewmLBl2pWh2TM77Pl8MTLDMvvCYzjNN3vGxS8umbLBsV4RmqWa66vzyvCfvTgh1uz4cIH4+/Shbf2VqXrXT5VmLMBPs5FurYEpJGMC/AMw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2065e3e-e1ac-4dc3-0c6c-08d859835a15
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:26:36.1381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jgdW60ybHDiNXlOnZLNMjrV/q/S5tWB7bCy8MTdt2V6C/W/wzfOyIpYtBZf1jgzZgxeLaZEZVstha4QEWxuN/Xq+kLQWFWn741YRREnBqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3767
Content-Type: multipart/alternative;
 boundary="------------524BC1D64E1EF759FF842E61"
Content-Language: en-US

--------------524BC1D64E1EF759FF842E61
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 5:04 AM, Leon Anavi wrote:
> Upgrade to release 0.1.4:
>
> - Support tcp transport addresses
> - Add support for the annonymous authentication protocol
> - Add flags kwarg to aio high level client method call
> - Allow subclassing of DBusError
> - Fix exception in aio message handler loop on task cancellation
> - Improve error messages
> - Fix match rule memory leak bug
> - Don't add match rules for high level client by default
> - Add empty properties interface to standard interfaces
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-dbus-next_0.1.3.bb => python3-dbus-next_0.1.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-dbus-next_0.1.3.bb => python3-dbus-next_0.1.4.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
> rename to meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
> index 4da4be81b..0a5f19974 100644
> --- a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/acrisci/python-dbus-next"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94e750c96e56788499b56c81de91431c"
>   
> -SRC_URI[md5sum] = "a823270b11c8dd7932c12adc6b2fadbb"
> -SRC_URI[sha256sum] = "4dd9097778224c69228f7f2a0f52e9b13ec2c75e87974ad312525c927835e8fb"
> +SRC_URI[md5sum] = "0d44e12e8689637a0c048ec7bb51d842"
> +SRC_URI[sha256sum] = "1b1942bffcc8c9a5bd6834257df227a55ee28e07dd413ead82ddd23115652363"
>   
>   PYPI_PACKAGE = "dbus_next"
>   
>
> 

--------------524BC1D64E1EF759FF842E61
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 5:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914090419.19171-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.1.4:

- Support tcp transport addresses
- Add support for the annonymous authentication protocol
- Add flags kwarg to aio high level client method call
- Allow subclassing of DBusError
- Fix exception in aio message handler loop on task cancellation
- Improve error messages
- Fix match rule memory leak bug
- Don't add match rules for high level client by default
- Add empty properties interface to standard interfaces

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914090419.19171-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-dbus-next_0.1.3.bb =&gt; python3-dbus-next_0.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-next_0.1.3.bb =&gt; python3-dbus-next_0.1.4.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
rename to meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
index 4da4be81b..0a5f19974 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/acrisci/python-dbus-next">&quot;https://github.com/acrisci/python-dbus-next&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94e750c96e56788499b56c81de91431c">&quot;file://LICENSE;md5=94e750c96e56788499b56c81de91431c&quot;</a>
 
-SRC_URI[md5sum] = &quot;a823270b11c8dd7932c12adc6b2fadbb&quot;
-SRC_URI[sha256sum] = &quot;4dd9097778224c69228f7f2a0f52e9b13ec2c75e87974ad312525c927835e8fb&quot;
+SRC_URI[md5sum] = &quot;0d44e12e8689637a0c048ec7bb51d842&quot;
+SRC_URI[sha256sum] = &quot;1b1942bffcc8c9a5bd6834257df227a55ee28e07dd413ead82ddd23115652363&quot;
 
 PYPI_PACKAGE = &quot;dbus_next&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------524BC1D64E1EF759FF842E61--
