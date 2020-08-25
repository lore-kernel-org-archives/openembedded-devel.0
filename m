Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.81])
 by mx.groups.io with SMTP id smtpd.web12.12555.1598359479993939668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B3tarzcj;
 spf=pass (domain: windriver.com, ip: 40.107.237.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKDx2oOwll/eYx72hyL/+bPqqbpSP+lCblwI3vZsZbC0BB7EW4wH3mKYTBB2LPG1vk7zi8xYyHsXnap/8wLodkeywMq7bBGCO/L1hyi4zRPoyV5roCd9vR1o9PBn4D3zDv+Vpnuc52GYjY9akfRqMWHhYKQZoU+N9jloIuyFUEsHbjpZpHtS/A96CX2wlQC2r3EZPaNETcpLk3Fov7M7p55HxaRWG+b24hxRNlysl3qo60N2zSXSm1Gzw8L4Lcu8SkHVgUJ299VB32Pk8xYCYoeax9Ch3SRWmuuxZHxGGZclTBIkL9eGktUp7UaQNbrNXRjr8NnrPtxhZZsdbmgEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2TptONylgZcs9rPuL0QZL6I/TFZZifXiDFQfm3Ls5w=;
 b=eDhUMOF3rd8H/ipjjRgxSWGdWHxIj91x7pQO9aFlCx5YuGyauIMfm78PYGwVxYXTdtN44a2qJoDtnwa/h4qnp03HGVNRwWEiciBQ7N320zzjeIde0icPIqRKNXBlldxd1lIsstEBYmUUoRgSXYNWdm3VpNRmJa92J8wP0U+8GQftLG9wSjHP09/5Yy6hCsjIWQWqdTLdeU9tQNkirh9HoLa7M1BJ/u6hnabTkixmRbKWp51O1xj56TmkNU2m4FiAcHl5vjQabXBYIXraewwDtVOusbeVSyvU/mcG3IEfWbtdSDfFHED9FP0z/4wJmQp7zEoMVKP0RyBmVx5KkpygdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2TptONylgZcs9rPuL0QZL6I/TFZZifXiDFQfm3Ls5w=;
 b=B3tarzcjJXB2w0QhJjFz/buYOjYTMBQ7wnYHejQH2PcTculI/ty5F2zBn7bHqEMJ6emdvrjez+8mhAykSZfd88UoTPFlveK6XfgzNvt/ML7mhYcSEVu+eOvaZGJt7jL/+srY09HB1nr6+6PNbztH8CsXP96cso8qFnYmHUfwlLg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 12:44:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:44:38 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-networkx: Upgrade 2.4 -> 2.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824091457.3360-1-leon.anavi@konsulko.com>
 <20200824091457.3360-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <17786d0c-1129-8b98-8455-5dbd0a9c5ab2@windriver.com>
Date: Tue, 25 Aug 2020 08:44:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824091457.3360-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Tue, 25 Aug 2020 12:44:37 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ef85ba8-b2b2-4157-65c7-08d848f4a071
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB376617A3B9BF6C755409E6139F570@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RDbqPN++j/uVhYZUpZMsIXaQvaynXZOhj30Mb4EcZxjIBg5RkFHtQUTFRgWN8P4P/OckB4EiaQvenzcppELNxp+tlC1pkdbNsQRv+oF7ezr4Q2M7Qk+JvL5jhJSaGVMXBn5qprbFiIrmUyX48++2b7f7skbSEkDlttS1wKHEWXnH9EMh6IRr8xbJJNlwR/yo5ESsizjV2C2TkMMufBY3hTBAS7lLvdmzNmUZxjuxGwBHQ9KsoiQtZmcdlRCF2Z1zwO5u1uU1+SsjyDzT/glxKrKZ5HkdBgPz4pIw0YSnifXVGitWSetKbrcMW36wH0ixHvIo50HEofHpH4zmc9HKuFiT5Ef+E48o4JKqVf75c8xruTPKiu61WkMncFJC4hWqpUCSg/zL6EWrtgAATPss4GcmP6930vWtgpp1pyI+WllfX2lLvnlKQY+OYIQO7dkBfR0LChrGa8+KK04wK69t9Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(2616005)(8676002)(5660300002)(6666004)(26005)(956004)(44832011)(86362001)(53546011)(316002)(33964004)(186003)(6486002)(52116002)(16576012)(83080400001)(31686004)(478600001)(966005)(83380400001)(166002)(31696002)(36756003)(8936002)(66946007)(2906002)(66556008)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	tt6O4DWITBdRc9JLr2RtZFm8HLTd4vQnJbrC+fLhusPmek4tUg9sAoXSTlNRzafBRbYVaZkONxxoFSES/IojKbx8A3Lzqo+GVGHPJWrYZb7W+kJLgNxMFOrVElteZmtHlblX5uXsIcXBBxTJEGler1YZ9yJXCCY55SE+4qT4Gkb1wgcL8PNu6H/MPt5ppj00FHcMCP229EZRkZ3SCurmZa2DGmWE0/z6Niv0myEBef2gyEFhTYsHKEBGRHpuClc64uj6XcbvpHWglppLor9JH6ZQTMHN0T+CvwCYegrOIXmN0bakXwTCMpBg0t0AchaB3y+BYXah36C3rr9y7RX6Xk0HZUV67HuRw6POcRMEYzd+2ePtieKJsTr61bRC+ts0sCaFhwQI4u2OuKy5jHYmIvyz5hZJxyYMDQGmvdwDVzNzrW4WovZkq128nS53fJyHHYpRz1s2TcqYKTN30+0R/PWxzIUPtnJUePZreuRid/mH4TSl/vc/ytBuSIajKJDnBB7NZlU3w0iGCgunuEUmxTdEGjcoFEKTLYsShNFOYnvNMbIYVQJjkyEomflC8US5a1ZOphZzQDxOIi4KaHshXUojKhPa2GQEXhmbanCYGuiydqQVzUP8RZyK6lAZHkZAKMMBQjkVsLZmMFgOAzF6tw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef85ba8-b2b2-4157-65c7-08d848f4a071
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:44:38.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqKoltdeKhRFfdUI3HuBfvWkMla5x/5KmZ98L36fbXW1ZRD1iWo7XXFhbeXMvH9+euvBvZwZww4ulTA8r3tYbbXl9/xfSXQq4g5oezJ+vwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
Content-Type: multipart/alternative;
 boundary="------------2077901F4258B26DB2BBB8B6"
Content-Language: en-US

--------------2077901F4258B26DB2BBB8B6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 5:14 AM, Leon Anavi wrote:
> Upgrade to release 2.5:
>
> - Dropped support for Python 3.5.
> - Add Pathlib support to work with files.
> - Improve performance.
> - Updated docs and tests.
> - Removed code designed to work with Python 2.
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-networkx_2.4.bb => python3-networkx_2.5.bb}    | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-networkx_2.4.bb => python3-networkx_2.5.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb b/meta-python/recipes-devtools/python/python3-networkx_2.5.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-networkx_2.4.bb
> rename to meta-python/recipes-devtools/python/python3-networkx_2.5.bb
> index 5708e35b5..70573828b 100644
> --- a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-networkx_2.5.bb
> @@ -1,10 +1,10 @@
>   DESCRIPTION = "Python package for creating and manipulating graphs and networks"
>   HOMEPAGE = "http://networkx.github.io/"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a24ea029adac8935699bf69b2e38c728"
>   
> -SRC_URI[md5sum] = "63e3fdc9d3a46bcabc776acc5ea5fe48"
> -SRC_URI[sha256sum] = "f8f4ff0b6f96e4f9b16af6b84622597b5334bf9cae8cf9b2e42e7985d5c95c64"
> +SRC_URI[md5sum] = "21f25be1f4373e19153a9beca63346e7"
> +SRC_URI[sha256sum] = "7978955423fbc9639c10498878be59caf99b44dc304c2286162fd24b458c1602"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------2077901F4258B26DB2BBB8B6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 5:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824091457.3360-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.5:

- Dropped support for Python 3.5.
- Add Pathlib support to work with files.
- Improve performance.
- Updated docs and tests.
- Removed code designed to work with Python 2.

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824091457.3360-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-networkx_2.4.bb =&gt; python3-networkx_2.5.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.4.bb =&gt; python3-networkx_2.5.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb b/meta-python/recipes-devtools/python/python3-networkx_2.5.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-networkx_2.4.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.5.bb
index 5708e35b5..70573828b 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.5.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = &quot;Python package for creating and manipulating graphs and networks&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://networkx.github.io/">&quot;http://networkx.github.io/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd">&quot;file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=a24ea029adac8935699bf69b2e38c728">&quot;file://LICENSE.txt;md5=a24ea029adac8935699bf69b2e38c728&quot;</a>
 
-SRC_URI[md5sum] = &quot;63e3fdc9d3a46bcabc776acc5ea5fe48&quot;
-SRC_URI[sha256sum] = &quot;f8f4ff0b6f96e4f9b16af6b84622597b5334bf9cae8cf9b2e42e7985d5c95c64&quot;
+SRC_URI[md5sum] = &quot;21f25be1f4373e19153a9beca63346e7&quot;
+SRC_URI[sha256sum] = &quot;7978955423fbc9639c10498878be59caf99b44dc304c2286162fd24b458c1602&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2077901F4258B26DB2BBB8B6--
