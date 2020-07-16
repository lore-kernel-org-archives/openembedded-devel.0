Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.74])
 by mx.groups.io with SMTP id smtpd.web11.21544.1594922634301071950
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 11:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dDuTi38h;
 spf=pass (domain: windriver.com, ip: 40.107.75.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L65Zspz6gZqg35vJm+Pec578zphkkydv8TsQ9AbG/AxbI1fmLwC3u/CiEl4QeD8CzFmw1u4nXLaLueC3KV+uDQMk7lsbLA5RTgVERqipY22cpGWCIHtNBtK8U9Va6ljY6Xq5bTNFQ/cFXcqRBdO+I4M8ErfrqjmdAavG1xa7YVGrsVAWn0FwTz96meBNmLHKoRhFHcFldra/YJHnRpqS7GM6G4QSaf+yWviSqyGsIPDSPyKNJoplrVzIeopHn4JeHw+l+iQfRFIVweKzDgkyv7MPkP9JfdJcdbWg5VcRH8nxeOVm5q3IhVC0t/MObcFJ3tzbiYHHMQBkSyu7HlWP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrzo7B6PJvM6UcO5AHu0b1oKTelEjKFSF9sRdQIq/A8=;
 b=GLDU8cEUL331xEBkvb8xB3uoz3DGBJg0V+MnWq2N/hJEW8h2iOFCp2s8MksX23+QG42RPJ1mJ40gYlUqHc/buS08xWKVv8SSNAcaj8xqGr1gBTEoL34uj3lOMVhmre3ovd1Ls+TOGlpE6atUGBYnRkpPUIjBgo0krmGLy6kNUGpnQkMzqJxuaKuiwTMptntpVNBstASMFdyw/eNJvRic/j00TpZuK3EXrZMgbXcqClieT+7rqPxPysNTDw+NBYWMTIYcizSI2Wv76ZVHv4xP8Zra2TexslDPCeJ4Ypkxnl7sBjObKZvh/4XzHhTV3V1c9GpbJw7bLbpxVQHskHQwsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrzo7B6PJvM6UcO5AHu0b1oKTelEjKFSF9sRdQIq/A8=;
 b=dDuTi38hv3qd8jbvpkAv6R/DQNWyqXAhOdlSnx16msRYwnXzbJKcJ+LNJHzhYnekjNyflD1Nc72cmF6elqaFIPz1PvmZ4zgFApmnYYN6SSV+UpHk4KhmYdmtrgtVfHBDFxcGntivwsJKXOxtI/v5LpMdoht493LKt4fFwpa2q4k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0008.namprd11.prod.outlook.com (2603:10b6:910:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 16 Jul
 2020 18:03:52 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 18:03:52 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-isort: Upgrade 4.3.21 -> 5.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200715152450.29018-1-leon.anavi@konsulko.com>
 <20200715152450.29018-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <19e10599-8854-da99-9556-103bd3b4d07e@windriver.com>
Date: Thu, 16 Jul 2020 14:03:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200715152450.29018-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::35) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 18:03:51 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28536433-5128-42bc-7a52-08d829b298f3
X-MS-TrafficTypeDiagnostic: CY4PR11MB0008:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB0008EC1C4BCFB4CABADAA8EF9F7F0@CY4PR11MB0008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wFIrdm+0U6DawYawxa0QlcvuUCAQLgYNobzIaC9e6jS1uJ7/jcHfUoQchPXTCO+X/8y9+xrSEH3qyhRJrrRpLjd2EZsTJY3TRBkY8bxZwX2S+usLnVPYETgbUR/bkeXqPZwa+nLL980Le8GwYTnlp4WddpocSu6ZfX/XmlxPS22DkoM4MNeTxPMk9/MwCuL5k1fY+JvPreE14+hVKyDLXj1eHdaqTVh7ORdCL8PZmIQaqv2+89zgFLnV4vhyKrUi6PwEYN5PY/8WCyQH59mS5Ad/dmYtcF86WDQZTYy9iIGFUxpnCn0PrlJl+UQRiRseuo5pqDgummDtL+A9n6IcrwIJb7QVzmlxQqDdJkc/HybS42mA8vAawrTzc4wySMU8lbDP7l/+pEcNBLoGwWyESgRbTYwXjDXEeP5Yq46Nj3Bqp1jPOyxqGMqxfmo6YnugzjYtcT8dSoCg/v9wTS03tg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39850400004)(136003)(396003)(346002)(376002)(26005)(966005)(44832011)(186003)(16526019)(8936002)(86362001)(31696002)(33964004)(5660300002)(2906002)(53546011)(52116002)(316002)(66946007)(478600001)(83380400001)(166002)(8676002)(31686004)(6486002)(956004)(66556008)(16576012)(36756003)(2616005)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5evN5sgxSUwc7M8+inAP+G4rQf4OAnPIUuxASSGNDNOIxCF+G+1HenURp55CIJ5pcxwvry8rck6XOi2+ZxmYly/0fU7x8uvO8o5gLTXWXSrcM2iAtlWE882KXAIf3rpWrrGuuDDkPtKPwh4VCMK45k2rvlXxNS3DLMMknFApXIbCUI4jnkSmwUoHFRnzV5X0H6NrRsoJwXmyxuyeBRKuzxTlxaSvvpcxSDtBNEPQAiuznkWlOhXODYZPHwtVjGIcEL5LNz2ngJQADCWRQlAclq7HW9o4Kl/vlEfejPfBceaoT6fVw+xCHZ2M5tzKn9O3staVAQQLZMSkklmCwB0ZxDidsJNmbAuI/v+/SH/+wKQz0PUuPjruV6nKAYL9PaAGw8DBbktI5dzRp9nfj+WKLwJiOW51Z1DTEzwYymns2rJgCl0eVf9pigvjtMAXUcHpghEysytjmmf480vAEUKaBtc0GF3hrHEQNkmT3wub/OkEtNWdlCYBvA0Tk5RYAVHF
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28536433-5128-42bc-7a52-08d829b298f3
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 18:03:52.0815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEzFXg7/ksB/9aJKpCELBjX223e6iOSZx1zt7YdBwAbhdpUDnvwjHw02iFGhBFjMS7CVbBT1akqqI3B7ClSpmRK/QGRI8LY9G6eIlrt/I9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0008
Content-Type: multipart/alternative;
 boundary="------------847B9398AA0E528334116AB9"
Content-Language: en-US

--------------847B9398AA0E528334116AB9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/20 11:24 AM, Leon Anavi wrote:
> Upgrade to release 5.1.0:
>
> - isort now throws an exception if an invalid settings path is
>    given (issue #1174).
> - Implemented support for automatic redundant alias removal
>    (issue #1281).
> - Implemented experimental support for floating all imports to
>    the top of a file (issue #1228)
> - Fixed #1178: support for semicolons in decorators.
> - Fixed #1315: Extra newline before comment with -n + --fss.
> - Fixed #1192: -k or --keep-direct-and-as-imports option has been
>    deprecated as it is now always on.
>
> For more details and breaking changes with release 5:
> https://github.com/timothycrosley/isort/blob/master/CHANGELOG.md
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-isort_4.3.21.bb => python3-isort_5.1.0.bb}     | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-isort_4.3.21.bb => python3-isort_5.1.0.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb b/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
> index e0b21ab55..a57b22361 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
> @@ -2,10 +2,10 @@ SUMMARY = "A Python utility / library to sort Python imports."
>   HOMEPAGE = "https://pypi.python.org/pypi/isort"
>   LICENSE = "MIT"
>   SECTION = "devel/python"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "05d66f2eb7ce2c2d702e86bac24bf9e4"
> -SRC_URI[sha256sum] = "54da7e92468955c4fceacd0c86bd0ec997b0e1ee80d97f67c35a78b719dccab1"
> +SRC_URI[md5sum] = "9e47f58de573c3fab674a70f0512e9f7"
> +SRC_URI[sha256sum] = "b19b7ebce5e292507afa8fab30dd666011dd5ae8f4ef2a2d431751dc84c22140"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------847B9398AA0E528334116AB9
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
    <blockquote type="cite" cite="mid:20200715152450.29018-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.1.0:

- isort now throws an exception if an invalid settings path is
  given (issue #1174).
- Implemented support for automatic redundant alias removal
  (issue #1281).
- Implemented experimental support for floating all imports to
  the top of a file (issue #1228)
- Fixed #1178: support for semicolons in decorators.
- Fixed #1315: Extra newline before comment with -n &#43; --fss.
- Fixed #1192: -k or --keep-direct-and-as-imports option has been
  deprecated as it is now always on.

For more details and breaking changes with release 5:
<a class="moz-txt-link-freetext" href="https://github.com/timothycrosley/isort/blob/master/CHANGELOG.md">https://github.com/timothycrosley/isort/blob/master/CHANGELOG.md</a>

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200715152450.29018-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-isort_4.3.21.bb =&gt; python3-isort_5.1.0.bb}     | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_4.3.21.bb =&gt; python3-isort_5.1.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb b/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
index e0b21ab55..a57b22361 100644
--- a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
@@ -2,10 &#43;2,10 @@ SUMMARY = &quot;A Python utility / library to sort Python imports.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/isort">&quot;https://pypi.python.org/pypi/isort&quot;</a>
 LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;05d66f2eb7ce2c2d702e86bac24bf9e4&quot;
-SRC_URI[sha256sum] = &quot;54da7e92468955c4fceacd0c86bd0ec997b0e1ee80d97f67c35a78b719dccab1&quot;
&#43;SRC_URI[md5sum] = &quot;9e47f58de573c3fab674a70f0512e9f7&quot;
&#43;SRC_URI[sha256sum] = &quot;b19b7ebce5e292507afa8fab30dd666011dd5ae8f4ef2a2d431751dc84c22140&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------847B9398AA0E528334116AB9--
