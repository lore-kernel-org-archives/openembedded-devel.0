Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.46])
 by mx.groups.io with SMTP id smtpd.web12.9833.1593089990239913269
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 05:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lqrYAzSZ;
 spf=pass (domain: windriver.com, ip: 40.107.223.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNMDDcD055j5UW2Qn/j+Sp5UZcFzgM/pLEEw2S/o9ampxCKIOu2PQzmElQcHsj1FC+rxkc1HX8ipV7BjoVEwJHJsMxxo/i7V9VnYDUOVTDHG+KnkFs1Z9DSnCZOjHvS8FcvT/aOgqjZ2VEuG8Hy2Ze32QvNczTBCi5OL72xrk5qL0mYFGtm8NJeGvbLGWO6bMvhDzSarql4jTJntxGqpx97IbMaXmQNFvJ1nJzjVBr+9x7H+ymJ4+lEjqQvQQvAJQumG81FcUxgIt2hq+l/wIRJGXInwV8aUXSGxitm/+oDtaBRXy95oHYZXowCBdKbgB4NnxGEztElWZFmhoyMztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07MDoGZNNSNqZnqWf8zIf+DosCHOntczB/P2DDdxRks=;
 b=CQNcgJz9vgw6CfX5UOt+n196Gq3dddW3gZS60aE4JZ7GrZ2czla2meXS6mgDh5pNzW9SfB527QN4ZVGDKoSqKfMUBSilTpVwAFsEf9jkLVyNZxjXJ2kGTNZYLxPqizSW/E3Li2ab7o07qL4tRNIxGanqbkBmuAuJxqZn/TTI9JmlXPpUH7qPTlC+9UDZgTFz7Oezqxi1KIuZggGMmch22aedaX7yPrZljW2VvD3/9d4uLD/i/HkQHElwBlE7CLboEVKG3nWAmvDONbuB5PcvjvVZm4mrtyz6dPP3MIpgH0nS8+7q/3RcbC7Q9OejnN5JHw+PCnUW9nrkonFmxDjWqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07MDoGZNNSNqZnqWf8zIf+DosCHOntczB/P2DDdxRks=;
 b=lqrYAzSZnXphG6GrCbUydmlpH5aMycc7pkNu2xax6y6LmfzMuhgHZgL04XRQI4a5d285B3QH5bRcVdJ+wodf5rUpmUXNSXqMlxjOY+BJjkgfHvamg1F0D0PpzUNTBoLkafg72xE43MpZzRGLO2pQ+ydlstwyXyQh3RW4sGmbztw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3746.namprd11.prod.outlook.com (2603:10b6:408:8c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 12:59:48 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 12:59:48 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-netaddr: Upgrade 0.7.19 -> 0.7.20
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624151628.547-1-leon.anavi@konsulko.com>
 <20200624151628.547-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c8b24267-1116-942a-4d95-1967f70b2522@windriver.com>
Date: Thu, 25 Jun 2020 08:59:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624151628.547-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::33) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 12:59:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd1171e1-89eb-4e94-d6f4-08d81907a3ce
X-MS-TrafficTypeDiagnostic: BN8PR11MB3746:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3746EEAB6A39F3513CE19A079F920@BN8PR11MB3746.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vyckpU5M5eYn+ZawjbKvb/H1q2kvKLBAnGfCM07GFGsKrmkndXdI0YFNVQwT1t64SVM6KU+X84j43R+ChkAmLpmihVBuOFhDVwP7tDw6rESr3HG7es2hE7z+dNvVa1ir7qcL2bHd/A6Pp1NQWoCyHQhvI0Ik0fSRT4f1N8Z2PTzE4ZGtZpgMv+ag9QpmKwpCDg2o3JNtfukqaah76YDxsGwWWD0/QCoHrMjb6XzLpgU5w5lrPbWnMg0FFFyLF/tqCe+PJLCKuYUEnMoVELKdoQ/Ug7QkXRlchCwuKvo0dexAM4yevJeCHhowFP7C93hRhf2HlfZkaD7K+NICzfloccvU7d5LPBTdW+PkXQ2lro/H5T14bjUp8LwMNUn/UXuXrhzQXyJW6fZ0CPBsJ9qy+QmRmNG7WW8FvLh2H7o2LOBANe0tIZeqObSVki7bOaXZzhUrhlUJ1RO4+jFTK2c6Qw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(396003)(346002)(376002)(136003)(31696002)(53546011)(26005)(316002)(31686004)(478600001)(186003)(83380400001)(166002)(16526019)(2906002)(6486002)(966005)(52116002)(33964004)(36756003)(86362001)(8936002)(66476007)(66556008)(16576012)(5660300002)(44832011)(2616005)(956004)(66946007)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	W6tpRGXm+kh+z1Q1WcyJIA2oGvGXx6nJM75eL1s9fHGO482XZoRAcW4DZ4z+SAWpBPoR4BzjK5ArkIbP7J1JwpydVxFptgNLfgN5KIOCouoMqG7LgFMuZEM34MTQVTLtnwcWfOuM/jAFkmBqFec6ORnRynVYEvBYI9ibS85yYFoFe7+P8Fekj5ELUJ08a9l+1KRQJ2q2TnvO04eKizFvZaxt3YygEngcmtvPPls5+U47Sf+h+ccP2btLhoS+oKw7X6NTf2EBnJrdfKBQGRQxUGobmGkP2J58o0YYADcaPeNFQBPFcno1YHzjBDgPtisW22kTxUFtkEpZmHF6putD4Ni4syQ0Um5Asc1F5qNRbxxUStCxGvDmL0dOg4OxinLrJUVvZTjTPmaKcOHXzdb039Bh+BLL+jIlLMOxTMIbbYxoOWpEWMBq4pDjOx9GgF4KjdUgk15OA1p6EwdRsebKMtp/ccQFfuc8bZrXfV37HUw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1171e1-89eb-4e94-d6f4-08d81907a3ce
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 12:59:47.9152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ti7eJZUnJsPykVSwoiE84JyA/3eiwuEZv5xSZOyTk/Ad6rdE40mNOSrmLeMsV9iRjynIA8hKq+1VGdccFPcO/fGskCV9XnmypcUUt6HXebE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3746
Content-Type: multipart/alternative;
 boundary="------------957CB4A57E73ED9C48B128FD"
Content-Language: en-US

--------------957CB4A57E73ED9C48B128FD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/20 11:16 AM, Leon Anavi wrote:
> Upgrade to release 0.7.20:
>
> - Fixed returning from an iterator on Python 3.7+, by Sergey
>    Kozlov.
> - Fixed Python 3.8 SyntaxWarning on using `is not` with a string
>    literal, by Stefan Nordhausen.
> - Fixed DeprecationWarnings by using raw strings for escape
>    characters used in regexes, by Sean McGinnis.
> - Improved IPGlob documentation, by obkmeta.
> - Fixed exception creation in corner cases by explicitly passin
>    error message params as tuples, by Matthias Urlichs.
> - Stopped manually replacing shebang of an included script.
> - Stopped using __file__ in all code that's expected to run in
>    environments that don't support it (like PyOxidizer-produced
>    binaries).
> - Updated all databases included in the package.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-netaddr_0.7.19.bb => python3-netaddr_0.7.20.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-netaddr_0.7.19.bb => python3-netaddr_0.7.20.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
> rename to meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
> index 75460caa7..bc7598c46 100644
> --- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
> +++ b/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
> @@ -2,8 +2,8 @@ SUMMARY = "A network address manipulation library for Python."
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
>   
> -SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
> -SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
> +SRC_URI[md5sum] = "f254d6b61e07123f9e2643b1dcbd03df"
> +SRC_URI[sha256sum] = "d09252e5aec3913815d77eb8e8ea8fa6eb33521253e52f977f6abaa964776f3e"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------957CB4A57E73ED9C48B128FD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 11:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624151628.547-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.7.20:

- Fixed returning from an iterator on Python 3.7&#43;, by Sergey
  Kozlov.
- Fixed Python 3.8 SyntaxWarning on using `is not` with a string
  literal, by Stefan Nordhausen.
- Fixed DeprecationWarnings by using raw strings for escape
  characters used in regexes, by Sean McGinnis.
- Improved IPGlob documentation, by obkmeta.
- Fixed exception creation in corner cases by explicitly passin
  error message params as tuples, by Matthias Urlichs.
- Stopped manually replacing shebang of an included script.
- Stopped using __file__ in all code that's expected to run in
  environments that don't support it (like PyOxidizer-produced
  binaries).
- Updated all databases included in the package.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200624151628.547-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-netaddr_0.7.19.bb =&gt; python3-netaddr_0.7.20.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-netaddr_0.7.19.bb =&gt; python3-netaddr_0.7.20.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
rename to meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
index 75460caa7..bc7598c46 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
@@ -2,8 &#43;2,8 @@ SUMMARY = &quot;A network address manipulation library for Python.&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44">&quot;file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44&quot;</a>
 
-SRC_URI[md5sum] = &quot;51019ef59c93f3979bcb37d3b8527e07&quot;
-SRC_URI[sha256sum] = &quot;38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd&quot;
&#43;SRC_URI[md5sum] = &quot;f254d6b61e07123f9e2643b1dcbd03df&quot;
&#43;SRC_URI[sha256sum] = &quot;d09252e5aec3913815d77eb8e8ea8fa6eb33521253e52f977f6abaa964776f3e&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------957CB4A57E73ED9C48B128FD--
