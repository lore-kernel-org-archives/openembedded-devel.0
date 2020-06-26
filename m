Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.50])
 by mx.groups.io with SMTP id smtpd.web12.9843.1593183745344709931
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PrLPQNsb;
 spf=pass (domain: windriver.com, ip: 40.107.93.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7qZkCsu8tzHaEA5UI8iUBhY3UZkJ4IZJ8wg86WbtQUGGTNlbm5GqLS0v1wphpQZ/H2xYzUsEaz9dD5xgpaoo4xmxAGdFLI4bZixlZpMDgFKLtvg6aGzHEY4GDfC8zP6maJZ5dl5ESCOYP1R/QCRWLjA9LSfEN1+NiSsSEpMtK1HA3mKzOMzNPK4+0XVogZWlJmLZT73Z2nDRSCTQ/x/5Pn90hckOeHTs2pfqks+ay7nWrcrRIkE4drHCQq9/MhhywYBvi3XA76DXFJHoBcLoo7oEN7KzZNh4LaOK96TKjeIq+KZulOztDh0lxT141TPgz2Wi0sITkgNvNqGmmC8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7WdZ9qaPrjH6OuVEPPh8dso+YsMhRbotthU7Ixl+t8=;
 b=m1AXuA4HYAdv+G0I6nY2w3By/dv/sd12FB607gMjH/gnM27yke5Dw14FSirfQ+0Snh0YhE+RCANlPJtHajni6jLk9BSmQnxhn3nSmG5s0nY9rh2pONuEU8OltjP7nhkKkvvLCsFTvbwbfXMRWch/wSuvie61QhxVA8UvqRR6YDCJ2gPmglIh8DxDIhK6VewP7sGlFk+zbhAYZhprMV/dve6e87pDTr5xqr0GMQCZnwCjuSJ0p6aS2nDi/Cv9IAilfzmMugIxNYaiRnjnPtHNI9YAtsS1Lug7U59mMJUlwMIXjPVXT0VSVeRunlfZUfZiDhlNNU+EAk2Q75FgjSjY/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7WdZ9qaPrjH6OuVEPPh8dso+YsMhRbotthU7Ixl+t8=;
 b=PrLPQNsbEXxV3ZxRALgM7kiSyhVxtVGKm6SpcIWj0wNn49vPYdGpIYFGJIxrcQcH4SAsuzp8E1Fi1pPITtDBuL6zrnNTbWgVK4+yfADKH/JZ9UDkaryfSpPcQoTWCNYQj7wqYJouxFTwlYz3pFvaz5pKgktQaSNxfYE6kUo+H9o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1604.namprd11.prod.outlook.com (2603:10b6:405:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 15:02:24 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:02:24 +0000
Subject: Re: [oe] [meta-python][PATCH 11/12] python3-coloredlogs: Upgrade 10.0 -> 14.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
 <20200625090719.16068-11-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <faff0845-3ace-9235-8089-685feb2f2324@windriver.com>
Date: Fri, 26 Jun 2020 11:02:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-11-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::14) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Fri, 26 Jun 2020 15:02:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42fc65c4-f782-476e-e1ba-08d819e1eec7
X-MS-TrafficTypeDiagnostic: BN6PR11MB1604:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB160494CD9748CE966183C46A9F930@BN6PR11MB1604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jhmpz6vB0+rCf/e+z3rR+GP5rQR+C+e55WTXau1mZXUadX4JI93u61aepiJqlCofqtFpTBDsRXrvpvi+F6pnbUCLf0SKzoClL91kXJR+5wwBl/tjoX2ihI4mdXlBbhVMaf4IxMMTFvEMyYbSu9ZIIBIp+3rl4znCF5qz7owty/yy5PKlc1gjQr7ibUYf3bMEE6ibOJl4qjy3DPUItpiaxkTqJaDqGsvS02zOcAeeeynUJ9pApBsoMU63juBHw3erisVUwSKV8RHr9njtVzF2ezuiPap2ZHafxQ/vatRimMdRQXqybyc683ArcvcyWIHY4hA50VlBW741NWcn66BC19R+DmAYQQU/WUemnKt+K1wN+LNPCMbW2BvzT5osWtFD8GLPC7pIpwRhL7wLaKt2+14Vnjxj/IdbD6+00j/ZXuJ8POUysdy2NmQR4ao7GqfZ8EZd7UcJuna8FeFL5xrTtA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(396003)(376002)(39850400004)(2616005)(956004)(31686004)(66556008)(66946007)(44832011)(83380400001)(6486002)(86362001)(16576012)(31696002)(166002)(316002)(966005)(66476007)(53546011)(8936002)(8676002)(36756003)(2906002)(186003)(478600001)(5660300002)(33964004)(16526019)(26005)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AYYrDh5BMVZN+Y6Haq3d+jK+2lw1F9XpsSdSEhHpuZJ3xdkwf20blIYS9ECwaa7gZlUWwzhZYtGJd0xdf99dE6RTdO5xlxgQiekQoovpKEyRt8pi/g/PoIqa4LtjqglpQnBbVesAMsPGwJ14bT12IaoDwx7pxHHgnHlNyVMRz4+Srbe8se77LJQCjXNqNig09JPGdqaHfnzq5kjakvPHkkDPlSOgne4/3v5ShqKd/ThDV5aHgJC5HFdl/xvjqHOZaUyp+ufBcZMV55Gfwz3+i2TJjiydFZ+fVoAB7caC/KTPa8G8iaa7jav63YghZg5gJjfeiSYZi7LnfphAxF7d5hPYdxF32oDowsYPfJxejTGdootEbU/H26formZ/VzTibII7ckc0dBMH79J+pb4aJOii5dmNLUdFDN5JPykr49eOQATCwmPZpWTE3ZlDeTq3JJwF3BE0RtX88GEANH5tBALwlviNLvHkvqqRbkQf/uBfIzyk9leJkI7Cti9GPkxw
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fc65c4-f782-476e-e1ba-08d819e1eec7
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:02:24.2585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xU1e+Y6UflunQOIKwURMvpVyHwtA+g3zGX6tsyjz+X98wZUyG3+rWsyDIk0jagYYG3PkRfcsZ6zwAS/40W+60YBPl0TVSggPRkDn45wsd14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1604
Content-Type: multipart/alternative;
 boundary="------------2F99BAF7F2D6227BE7C9C89E"
Content-Language: en-US

--------------2F99BAF7F2D6227BE7C9C89E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Upgrade to release 14.0:
>
> - Integrate native Windows 10 support for ANSI escape sequences
> - Native support for ANSI escape sequences was added to Windows
>    10 after its initial release
> - Merged pull request #80 that drops support for Python 3.4
>    which has gone end-of-life and now represents less than 1% of
>    PyPI downloads.
> - Improved compatibility with the Python standard library by
>    changing the order of positional arguments received by the
>    initializer of the ColoredFormatter class
> - Add support for the %(username)s field and properly document
>    supported custom fields.
> - Consistently use console highlighting in documentation.
> - Fix a broken link in the readme.
>
> The year in LICENSE.txt has been updated.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-coloredlogs_10.0.bb => python3-coloredlogs_14.0.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-coloredlogs_10.0.bb => python3-coloredlogs_14.0.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
> rename to meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
> index 88fac87c7..64f3008ee 100644
> --- a/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "Colored terminal output for Python's logging module"
>   HOMEPAGE = "https://coloredlogs.readthedocs.io"
>   SECTION = "devel/python"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b"
>   
> -SRC_URI[md5sum] = "0a186966a1955fff8cf9489373e691d9"
> -SRC_URI[sha256sum] = "b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e377c36"
> +SRC_URI[md5sum] = "34cd8ef3f758b10c6f1482b2614a81f2"
> +SRC_URI[sha256sum] = "a1fab193d2053aa6c0a97608c4342d031f1f93a3d1218432c59322441d31a505"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------2F99BAF7F2D6227BE7C9C89E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/20 5:07 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200625090719.16068-11-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 14.0:

- Integrate native Windows 10 support for ANSI escape sequences
- Native support for ANSI escape sequences was added to Windows
  10 after its initial release
- Merged pull request #80 that drops support for Python 3.4
  which has gone end-of-life and now represents less than 1% of
  PyPI downloads.
- Improved compatibility with the Python standard library by
  changing the order of positional arguments received by the
  initializer of the ColoredFormatter class
- Add support for the %(username)s field and properly document
  supported custom fields.
- Consistently use console highlighting in documentation.
- Fix a broken link in the readme.

The year in LICENSE.txt has been updated.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200625090719.16068-11-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-coloredlogs_10.0.bb =&gt; python3-coloredlogs_14.0.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coloredlogs_10.0.bb =&gt; python3-coloredlogs_14.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
rename to meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
index 88fac87c7..64f3008ee 100644
--- a/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
@@ -2,10 &#43;2,10 @@ DESCRIPTION = &quot;Colored terminal output for Python's logging module&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://coloredlogs.readthedocs.io">&quot;https://coloredlogs.readthedocs.io&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6">&quot;file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b">&quot;file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b&quot;</a>
 
-SRC_URI[md5sum] = &quot;0a186966a1955fff8cf9489373e691d9&quot;
-SRC_URI[sha256sum] = &quot;b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e377c36&quot;
&#43;SRC_URI[md5sum] = &quot;34cd8ef3f758b10c6f1482b2614a81f2&quot;
&#43;SRC_URI[sha256sum] = &quot;a1fab193d2053aa6c0a97608c4342d031f1f93a3d1218432c59322441d31a505&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2F99BAF7F2D6227BE7C9C89E--
