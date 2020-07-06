Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.59])
 by mx.groups.io with SMTP id smtpd.web11.60874.1594050490414686839
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=J5rL4DAU;
 spf=pass (domain: windriver.com, ip: 40.107.243.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLi0UVeRdvagRWOHBSCO4h+V2W8mpfTDR1sEdOvt7nZeB26dohtKsXG+Z7NWE/6owS98vvnS1ZoFlyUg5o74dJfzl0R+oLq2mei5vX7NgYYWxDrhkvpse2hJKQHCGTLaePP+VMNXF3S8d/DEuURH5TCzi6nIe4CPUsYWCE+5TotJzcs9npPJREZxcSes1PePi6uEMK+K+TVTHQfLF6xPMprHN2BPfJ6rCWSXmSLSvMZmRowi3iHViNn9OaDFWmKf5zxxNA4Z5l1IUeUWPu3vQbjNkyd/xhf5c0OcXjrvuzJPI3LwXIPJLHZ4CPNj3cALE08mYLhmInZAtY818GwfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsNflc84tZzlJKx2XfRk5kJiQ+z+OeVtONNSFYRrYos=;
 b=ENL3RpREpzekMGtiY0+COQ8Mux2MgP2NG681rXKEg5JvOn7QELFXxlPDOg4CAf+nohSIWjlATQ+LkBfNO/iGXKmwKkFGgy8qvWocvWZkNm2STLw3Ca9yCKH3MIdQvtWnLQQT/TTXn/taupCbA8fE+Zlw0pdDvm3mh9FrsasPUNW9Q4GrgqxxD6aclQ52Bc3QmWtTpTHfDrpalhg3X/KKapfutd5zKdBsCDC7Kt0D5cQ3sRUZlxiqY9Cl0/reNn4scWkT4023EaeSlJhaahFv36LPllgfwNeaFjtHTPkVXuQ0dnGdc+0XNRbfCBLrLJt2nc91s2gBOW07lfbPmL/Y8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsNflc84tZzlJKx2XfRk5kJiQ+z+OeVtONNSFYRrYos=;
 b=J5rL4DAUMwlAjReiyIDxcsdRofofY/n9ugagHC2Xypj8bOiljecJZjF1fqTY+0C+/0Dl+K52byRO+Wsa2CElpXlMMXjkTejiySAUKg081pBzY/dQSUhpfJV+6HYIBt4X1GWo1MANRj+vytFoGK8Zsm3edZ2VcDvZGgpIPkdxld0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3275.namprd11.prod.outlook.com (2603:10b6:5:5e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.23; Mon, 6 Jul 2020 15:48:09 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:48:09 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-websocket-client: Upgrade 0.56.0 -> 0.57.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
 <20200703093020.3514-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <db35f5ec-7d46-e938-aa13-373738d6560f@windriver.com>
Date: Mon, 6 Jul 2020 11:48:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200703093020.3514-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:48:09 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9b3a025-5837-4f21-efa7-08d821c3fb53
X-MS-TrafficTypeDiagnostic: DM6PR11MB3275:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3275A72BBC7D97BCB87A21BB9F690@DM6PR11MB3275.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ul4LjrJOQUggBas96ibe08Sblw7K21SeyR4NjinqnFHnOZhg5HWX5y35IQm+cOc8nrkOk91Mhsup4mBN3pSuukHh0Vmb/SCZ9AzcYrXcSi2KOPM+VRfHnjlm0NReUM2NFMWeGRqT9kQ0M8Z1B+X1k0A7kjkSo0G/9eQ1DFFa0dE4LMrTp/SSnZFoblYBusW8CspSXYVRe622aJQpp6MZsnQTLvJVeTZYmG9QFl8eQ7OEHzpkLnEmuZ8UaVhImo8zMs7KHkbsocVTFC//5vC7zaGOkKTIVhjcBkyBP7syMwSa2EHm6pxa2xcYn7u9IyCSYl3wAmn2En7U2t5aXNNOZHNzTUQsWVV1jEGY3fsCJINDYrREeUZKxV0sAD8Vg52qoFNA23udiF1MCGUFZuYSqP/AxZCj+dMpYH4Gff680aUd9k0pHCTIsmxeJWs351/8GPJYYJEAWCF3Wa3j1E7Saw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(376002)(366004)(39850400004)(396003)(33964004)(16576012)(36756003)(26005)(8936002)(8676002)(316002)(31696002)(6486002)(16526019)(86362001)(2616005)(83380400001)(44832011)(186003)(956004)(2906002)(166002)(66946007)(52116002)(31686004)(66556008)(66476007)(5660300002)(53546011)(478600001)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0ERORDixzZc1DvEA3B+O3IQw0BUe+LZIDnC42tn8VEOl6toVdPM2R/RzK5oX6KIx+LW8JcAb+MrII60vfJpXnX+Kk7BMutuFNdXUEGB0isGqGjL4Th1kLADMYFGExVLVcduAx3eTiw+uZIVwpxyCmDbuhJl4GZj9qluXr9pTNyRI+csL3SGCeysGeXli7LS4KIvHRW7FJ3ULfaJ9nJ6ebz5NrDyuC8j84IxJN/WkarfHq9yhmtjbyGYJvwMwONiCBk9cEgtjXg4WP1scf9vISbnwwZBIieuL4yBLJ8I7Q8fMJMi+BUKXPT3d+ByUpzm57UXgB5mS5G0Z3KgKgLQ1MYbedNxAaED6UZKk22vXIEVdTUXylhPbcJLfrn54uFODK7jVZ8MODoqTLXzCCX+mhhQLdYmuB+zgxTP270DOlSdtKZOjJds2lpFHxr57it26740KBgWcdFehBABDXdosGzSZstL8U76nsm0RovummKcjk9iIW1z6WGBrBh7tT2/1
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b3a025-5837-4f21-efa7-08d821c3fb53
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:48:09.3295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25AA2IfV9nPJbLQp141VUCjN9dEkQq/LUDSOmu8sCummtHSKXMliPe3OtQFzOjT7JOii/cPnQhJNPDnTlWKrluNsWcmKJMGr0ZpQ0cbqZS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3275
Content-Type: multipart/alternative;
 boundary="------------4EB042D65918BA22E67E3EAD"
Content-Language: en-US

--------------4EB042D65918BA22E67E3EAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/20 5:30 AM, Leon Anavi wrote:
> Upgrade to release 0.57.0:
>
> - wsdump: Fix --headers option
> - Fix getting 400 bad request with long proxy authorization string
> - Fix for errors that occur when closing websocket from another
>    thread
> - avoid calling repr(data) if tracing is not enabled
> - Fixed typo
> - Create dummy `ssl` object
> - Show compressed text messages in wsdump.py
> - Resolve issue opening socket to intranet on Windows 10 with no
>    proxy settings but behind proxy
> - Expose http connection header to user
> - Improve the readability of HTTP status codes.
> - fix the compatible issue with gevent+dnspython
> - v should be checked for emptry string before splitting it
> - _handshake: hasattr checks on six before accessing the values
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...et-client_0.56.0.bb => python3-websocket-client_0.57.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-websocket-client_0.56.0.bb => python3-websocket-client_0.57.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb
> rename to meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
> index a3e1bcf393..aaa92f3ccb 100644
> --- a/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
> @@ -7,8 +7,8 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
>   
> -SRC_URI[md5sum] = "89484bd5dac71123ae6a09b2f90fe62c"
> -SRC_URI[sha256sum] = "1fd5520878b68b84b5748bb30e592b10d0a91529d5383f74f4964e72b297fd3a"
> +SRC_URI[md5sum] = "8061820da5e1de26a6a1a6996d4eebd5"
> +SRC_URI[sha256sum] = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010"
>   
>   PYPI_PACKAGE = "websocket_client"
>   inherit pypi setuptools3
>
> 

--------------4EB042D65918BA22E67E3EAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/20 5:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200703093020.3514-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.57.0:

- wsdump: Fix --headers option
- Fix getting 400 bad request with long proxy authorization string
- Fix for errors that occur when closing websocket from another
  thread
- avoid calling repr(data) if tracing is not enabled
- Fixed typo
- Create dummy `ssl` object
- Show compressed text messages in wsdump.py
- Resolve issue opening socket to intranet on Windows 10 with no
  proxy settings but behind proxy
- Expose http connection header to user
- Improve the readability of HTTP status codes.
- fix the compatible issue with gevent&#43;dnspython
- v should be checked for emptry string before splitting it
- _handshake: hasattr checks on six before accessing the values

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200703093020.3514-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...et-client_0.56.0.bb =&gt; python3-websocket-client_0.57.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_0.56.0.bb =&gt; python3-websocket-client_0.57.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
index a3e1bcf393..aaa92f3ccb 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
@@ -7,8 &#43;7,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/websocket-client/websocket-client">&quot;https://github.com/websocket-client/websocket-client&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1">&quot;file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1&quot;</a>
 
-SRC_URI[md5sum] = &quot;89484bd5dac71123ae6a09b2f90fe62c&quot;
-SRC_URI[sha256sum] = &quot;1fd5520878b68b84b5748bb30e592b10d0a91529d5383f74f4964e72b297fd3a&quot;
&#43;SRC_URI[md5sum] = &quot;8061820da5e1de26a6a1a6996d4eebd5&quot;
&#43;SRC_URI[sha256sum] = &quot;d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010&quot;
 
 PYPI_PACKAGE = &quot;websocket_client&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4EB042D65918BA22E67E3EAD--
