Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.89])
 by mx.groups.io with SMTP id smtpd.web12.21419.1594922647032811424
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 11:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QyRmMH6R;
 spf=pass (domain: windriver.com, ip: 40.107.75.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmreEH4+KImWUtp+f2JD/0mJ8eEyggWBVRfMTTawErP9QTCyQnwwclr+KbOZDb8tnNy4/b9y7u+8Y9kZEkWt8HKvwICjnd0E99n8QrXdFkkwcK7dC1HiQjYo5QR0bjnEEjD4VyrLnx3w0yW3w1gdZYPEYrfVstk5GcXzwEtyfXt7SZonNOk1Tn7Y9I6rK5WDr7i7JJ6OQg8ULpgRiytx075rDUcyOws19lcYBUy4FyCeVcWQ/7nLPgb7ATrp/vdXDmuby3zW+60ikk0vcGeBSlC7z3ELPXoOxz+cx8eLzS8JjfaVQ/eYAIeijCIkx1k79Ndzi70qT0D3yWBAiZAFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMhk2T/XQGVs2yqkuqM0ICmd0J+0qYC2SQORBSFGFUQ=;
 b=bYpx4IscmQcB2V5IoVcpkvFPXOYSzJ/XdT3g4n28quBOHZvVE1SfexrP1/vqoXLoTkd1IuV45NevL7r1WS4rhVgVL1C4czNubXT/Wn1C0Z0Yev4vsI3Bs0d47FFJDfa8wA+bMK8srbIzVFv/13pSMSNu83BEcwnMrsWxL6NJ4ufdxMJyewfLDZt48amZk9ZirGvpaOClbV1JM7q44C2dK9Vd2Wpler2APPlJsbJBImeLklHVlydHCudgHxr6+48hbv7AnR6qovGm9FOfm4jmNp5dgNqbKZQP89EW14m/0tfWUMCwYss+iIfccW99PyqsruZrF0ccawJTSuBc0I08Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMhk2T/XQGVs2yqkuqM0ICmd0J+0qYC2SQORBSFGFUQ=;
 b=QyRmMH6R3FdRKn7ISJAVhF/jsCZvEhOjnB5dh0L2WcLHWFhxrh/I7zGB4qlEXkvTznpRb29Oq9yDaylfa2pXl/XFdOhjOUm0molID9S0qXlT4FeN2kF+AFS+5jBlzqzFdC9QQ4D4SQxHlCbUJpOGWcbXOpgO7mKKexZICSRFxdw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0008.namprd11.prod.outlook.com (2603:10b6:910:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 16 Jul
 2020 18:04:05 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 18:04:05 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-netaddr: Upgrade 0.7.20 -> 0.8.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200715152450.29018-1-leon.anavi@konsulko.com>
 <20200715152450.29018-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f2d068f2-984f-6af1-b172-0474ffb1e904@windriver.com>
Date: Thu, 16 Jul 2020 14:04:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200715152450.29018-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::27) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 18:04:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f266cc25-dd02-46f1-ca6b-08d829b2a0c9
X-MS-TrafficTypeDiagnostic: CY4PR11MB0008:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB0008C88CA554735BF5F7B73E9F7F0@CY4PR11MB0008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MKzpcOINx24HN/rlmLvitpC3eSoI8FdKXAImb0GdV2Ths+MrcMWXX0QTGdSRUXHTjZY4cokQd/o9Dkz5zu484J4DTW+f+kbV9lVrUVmwRpGp2ikJJ4bivLa/tdFVZIubUjaBMOlZlJRL3ylWPke3CrDDonTTYxKPSEM/jUjoMvf0D1Nfa2/18+3MqzyIES9VFA/epd42RhqFiBuf4ENVhf8Qb/XhPUtgO1QLBVsmJTcs+VBFNv3lAgDn/bzXUzxSswhiqA8Qvbq9DioIhHLY75NdnoOpTiI4jfy2o59oDwSShckrqSAISXHA+41w+FnaONgp56XaVTxH/z//DmfE3sERqUlfse65qImNByXZWvqYsk2RFmhtghmlB9Yko/J0uqWg11JqZ53kEBggs8yMyKIWXLfQzcAEcLw2yqHnDzWpQceN77+xj9+rRMoeuRTbTK3qqPBjVOb/5T6/4g+9mA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39850400004)(136003)(396003)(346002)(376002)(26005)(966005)(44832011)(186003)(16526019)(8936002)(86362001)(31696002)(33964004)(5660300002)(2906002)(53546011)(52116002)(316002)(66946007)(478600001)(83380400001)(166002)(8676002)(31686004)(6486002)(956004)(66556008)(16576012)(36756003)(2616005)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vjUNHLMIeDcV2dj+rfR51NfUAbjsfPfln+NAW7kO/ZIekOdoduc4uJn2GWqWfMKileeVyialcpAsBMH1mo1DoNlf+A8JDc7g1UuY+CdGDso/Rs8MPbqEWRVW+nng68ohjHkGnMwy83oc7TadObnemW0LvZMYkWjH4c6JPac0lt759XsxBz2fVe5xhRVbkRXnPjUHuGvR6S6rGI8dciyESu0+ymyoIJaVRvIZL8iljfNeGHyHZJhALIxDm4hHNAt7RyYdyIxHIcvdI7EVby1n6E88b0LYEPbGoTS2MgaunTjLfGVnZlsO1re9HxizEysePTtJKzC3bZHFRz1/ZkH7KktefNdnTT7YgVngKITWEGdsSF+uCMsqK9S0WyO8cDuFvgcQiFn/60UDwc7EY1NcISjvHRI8cLuYifW8Rn2r6+nFxZDishrFQv7DakOYnG+/c42vgH2jQZWAxgQnkBMJ0OJabqN/dSIBqwOQMhzPQ2eZlHKMpWTvWJL6g2+Z1M+c
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f266cc25-dd02-46f1-ca6b-08d829b2a0c9
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 18:04:05.2331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4bh2SDwwNmIjXA+Rr+/TYIrKJgDKR9xDVOw642SHVEWarAb0AVpu9tc7SwgKE2NjqFzGVd7a6FEyULMlpYlBAnLotUyXxN/Oq+7oANdyfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0008
Content-Type: multipart/alternative;
 boundary="------------8FCAA924EBB56A35E98BC403"
Content-Language: en-US

--------------8FCAA924EBB56A35E98BC403
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/20 11:24 AM, Leon Anavi wrote:
> Upgrade to release 0.8.0:
>
> * Fixed weak reference support in classes with ``__slots__``
> * Added ``__bytes__`` to ``IPAddress`` for intuitive usage,
>    thanks to Michael Belousov.
> * Added ``format()`` function to EUI, thanks to Omer Anson.
> * Added ``IPNetwork.netmask`` property setter, thanks to
>    Naveen Nathan.
> * Added support for IABs in the ``40:D8:55`` OUI, thanks to
>    Brian Maissy.
> * Drastically optimized ``spanning_cidr()``, thanks to Brian
>    Maissy.
> * Fixed ``"x.x.x.x/x" in IPNetwork`` tests, thanks to xpac1985.
> * Added support for passing iterables of ``IPRange`` to ``IPSet``
>    and ``cidr_merge()``, based on a patch by Henry Stern.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-netaddr_0.7.20.bb => python3-netaddr_0.8.0.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-netaddr_0.7.20.bb => python3-netaddr_0.8.0.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
> rename to meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
> index bc7598c46..a120b24f1 100644
> --- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
> +++ b/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
> @@ -2,8 +2,8 @@ SUMMARY = "A network address manipulation library for Python."
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
>   
> -SRC_URI[md5sum] = "f254d6b61e07123f9e2643b1dcbd03df"
> -SRC_URI[sha256sum] = "d09252e5aec3913815d77eb8e8ea8fa6eb33521253e52f977f6abaa964776f3e"
> +SRC_URI[md5sum] = "34cad578473b66ad77bc3b2a7613ed4a"
> +SRC_URI[sha256sum] = "d6cc57c7a07b1d9d2e917aa8b36ae8ce61c35ba3fcd1b83ca31c5a0ee2b5a243"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------8FCAA924EBB56A35E98BC403
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/15/20 11:24 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200715152450.29018-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.8.0:

* Fixed weak reference support in classes with ``__slots__``
* Added ``__bytes__`` to ``IPAddress`` for intuitive usage,
  thanks to Michael Belousov.
* Added ``format()`` function to EUI, thanks to Omer Anson.
* Added ``IPNetwork.netmask`` property setter, thanks to
  Naveen Nathan.
* Added support for IABs in the ``40:D8:55`` OUI, thanks to
  Brian Maissy.
* Drastically optimized ``spanning_cidr()``, thanks to Brian
  Maissy.
* Fixed ``&quot;x.x.x.x/x&quot; in IPNetwork`` tests, thanks to xpac1985.
* Added support for passing iterables of ``IPRange`` to ``IPSet``
  and ``cidr_merge()``, based on a patch by Henry Stern.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200715152450.29018-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-netaddr_0.7.20.bb =&gt; python3-netaddr_0.8.0.bb}   | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-netaddr_0.7.20.bb =&gt; python3-netaddr_0.8.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
rename to meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
index bc7598c46..a120b24f1 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
@@ -2,8 &#43;2,8 @@ SUMMARY = &quot;A network address manipulation library for Python.&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44">&quot;file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44&quot;</a>
 
-SRC_URI[md5sum] = &quot;f254d6b61e07123f9e2643b1dcbd03df&quot;
-SRC_URI[sha256sum] = &quot;d09252e5aec3913815d77eb8e8ea8fa6eb33521253e52f977f6abaa964776f3e&quot;
&#43;SRC_URI[md5sum] = &quot;34cad578473b66ad77bc3b2a7613ed4a&quot;
&#43;SRC_URI[sha256sum] = &quot;d6cc57c7a07b1d9d2e917aa8b36ae8ce61c35ba3fcd1b83ca31c5a0ee2b5a243&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8FCAA924EBB56A35E98BC403--
