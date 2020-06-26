Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.88])
 by mx.groups.io with SMTP id smtpd.web11.10039.1593184964611072178
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=i+hRkepd;
 spf=pass (domain: windriver.com, ip: 40.107.93.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moMM0Xe6W9uOja0jLBE3Dti0CaKdTSkA4QgXBCePRXT2boL+7nCg1G25OH9U2D57QjEwNbbP/vHNIu/6aWvAYYkHmexfnVfFg5YiHfY3Q8eGQanHvPKbkEiy5noxeT/vAJkIdlk9DLHX/cjRvZB6dvas+Zw/ssWdzZfcIypEHh54Q6Q++94lzMhOOnb9qNoOSGJc4Z5gVVyqywqr57XP0slRtftjQSIP1mKX2tyzYB/jlpS0kERWL0x5nfyHoVW7EoEgABUtJEkFt6t9z8TlQ1B/4c/CMX+VpnTBR1/cHBZg1Sw0zMH6PBTta98T5JP+xLqa3q3/7V/pSr7zuUA2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s76ApDEDZny2gj9ba/bablZc21H4WdobyF5xTGbBlXU=;
 b=lGxieaR7cOzDmsPYaWzYRgTBhUUb5C/VllJ2wOmKkJkU5d4VtGUv59vNN6YpchYy0WZiPoKmUcUC+5VvimE+VoUigAZ7TDrwsi+TcO93AwEQZCScvZNglLyYGluBjlvwlfc2leD5JTrfaFJ1SdiPTOzrWjqj6Xx6ERJbGL4xKndg3csTSRmiUVSwSWCfyIqv+pqzTXYpBw/hgR9Pr6Xm+xYtWOs7tP6qqBbGR4pGKxjhFAaxju6sJqCSb96GMrBcZoEIA9yNMeFrxSL+VwWMFXiHvoJZwtabsxxxe54HuQD7l5imIanz5RwzsWiW6PsszewndzhGpmkiZASAzqI7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s76ApDEDZny2gj9ba/bablZc21H4WdobyF5xTGbBlXU=;
 b=i+hRkepdF1JrpRIgHgtUmVvGla0wAgcZbCP+8ZZmRJOfJFKlQb7Td+mWH8zQV66m1ImhInIbvoIjQ06x3ueXPsBaGvNltleP1BOjTthHQIMwXqSaHP8Y3FbjFbCNBt+uG7rqr7ULyLiUrzBa9J/zhDJw320xlUzsxoTSc1r0HGk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3682.namprd11.prod.outlook.com (2603:10b6:408:88::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Fri, 26 Jun
 2020 15:22:43 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:22:43 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-lrparsing: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
 <20200622103542.27830-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9dbec4e0-05a1-307c-a195-ac2cfc085372@windriver.com>
Date: Fri, 26 Jun 2020 11:22:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622103542.27830-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Fri, 26 Jun 2020 15:22:42 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dee031f-0e90-42ef-73d7-08d819e4c58d
X-MS-TrafficTypeDiagnostic: BN8PR11MB3682:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3682995A237556AAF5417F389F930@BN8PR11MB3682.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ll/xbg5qbCOdlWLZFJL0M0qDeO+NkFKMXgoFbp8einDLxEOyTD3gCzwY5Be5cY5rtMTW5aRei5dSRLuVglaabF7DU0Zoy9TnN+/IzUnmzfyN7uNFxBDwBeavWZr1L+ZjlJSQXIjBQv+CYcbmHFK/+F4NpKGXrJpuKB32Yy2kO+bpDe2EuR0H0Ds1+XUYqyRjwghE/2cpfxKCGXR2s5bYa3r8rfN/0CMl58IXK4p6IwJyIiop83IMaIMRaLKxBg+5OYRu2RIehWJ4abe5C+5Vk2YKhqcZDus7GXgogLTsYx4C1hAZmDKt2ac8jkCB0Sej+6C+KbVFRQAixFC1mKtbVMljtQkmUcjl1T92hTb72eMsx1YqX6qvs2yZkZ10TX/cGw0Yt8Sn1YgY2B2jnD9hWUiQJhl6GEywTYr7axRuABdufw+2YM8e09z9ymYjafhs1GMyEKxltIwCVHsETpycAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(366004)(39850400004)(376002)(346002)(956004)(16576012)(2616005)(166002)(316002)(36756003)(31686004)(86362001)(5660300002)(66946007)(966005)(8676002)(66476007)(66556008)(44832011)(31696002)(53546011)(33964004)(2906002)(478600001)(16526019)(186003)(6486002)(52116002)(26005)(83380400001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	yuC14dlLBzBKRkMSlsyNBhpCvTvoQTwYsDbk/2IVkNQSUfNyrVl0QA3Gsr7wcVzKSaOXfbcZB2DnR/e15Wvq4UK38LQCzYYztVH27zvJWgnSu+qleTgyFrwTPvj/QRoAsDLphVKK7vaRQ+iHaEp9IDbXGuaN66lNMYr44cafJzW+TAf1G0fr9RnisPFbTmOieWcT1KtgMPekF6pwOccXc9zScBqCgXXLCxTWX+/SBZ0eG9RZrFYyo2n1RKcvPlMWNoOgYmh2E3USx4SuvteQAlPco2G68COsllTuKWq0icMxyhyeZDbb0Do6p/uHvM5LvsDPAuXlTSK8TieXvXcqm2WWTnnCLCY0so8wZIM9O4vT39L4gsa4y9m4O3kiYQDUenwXEMGHUjxJ98kbLgSR9C6OmC/oXU9hmW4p713UgulWtFgLPfAC70HGQ+pkLCFKHzB2cfnhxm1loICYGEqheQn0USQpyq1bzgJZrZ5ogcyIbvQEMENvuA0uP7/1AYP3
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dee031f-0e90-42ef-73d7-08d819e4c58d
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:22:43.3003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pv1mZ0dPQrlAfx7byFPOSrXS2yn7F879phqA/yzZeTZZ7cG9lbKKWzE+SWtvqTKblwi8jLKzsvNSgFE8AiYaFXZK5YPNBdN/qpxrXxrOfcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3682
Content-Type: multipart/alternative;
 boundary="------------5FF8824033A5060DC441E74D"
Content-Language: en-US

--------------5FF8824033A5060DC441E74D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/22/20 6:35 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-lrparsing.inc                | 16 ----------------
>   .../python/python3-lrparsing_1.0.16.bb         | 18 +++++++++++++++++-
>   2 files changed, 17 insertions(+), 17 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-lrparsing.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-lrparsing.inc b/meta-python/recipes-devtools/python/python-lrparsing.inc
> deleted file mode 100644
> index d125151cd..000000000
> --- a/meta-python/recipes-devtools/python/python-lrparsing.inc
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY = "Python LR parsing library"
> -SECTION = "devel/python"
> -LICENSE = "AGPL-3.0"
> -LIC_FILES_CHKSUM = "file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788"
> -
> -HOMEPAGE = "http://lrparsing.sourceforge.net/"
> -BUGTRACKER = "https://sourceforge.net/p/lrparsing/tickets/"
> -UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lrparsing/files/"
> -UPSTREAM_CHECK_REGEX = "lrparsing-(?P<pver>\d+(\.\d+)+)"
> -SRC_URI = "${SOURCEFORGE_MIRROR}/lrparsing/lrparsing-${PV}.tar.gz"
> -SRC_URI[md5sum] = "34357d69bce87654d792cd8f02d148b2"
> -SRC_URI[sha256sum] = "b45afda44001dc5ba632934f74c043d40cce653f1a7526cfbcb68f6be055b8d7"
> -
> -S = "${WORKDIR}/lrparsing-${PV}"
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
> index 21a80cde1..85a54af30 100644
> --- a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
> +++ b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
> @@ -1,2 +1,18 @@
> +SUMMARY = "Python LR parsing library"
> +SECTION = "devel/python"
> +LICENSE = "AGPL-3.0"
> +LIC_FILES_CHKSUM = "file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788"
> +
> +HOMEPAGE = "http://lrparsing.sourceforge.net/"
> +BUGTRACKER = "https://sourceforge.net/p/lrparsing/tickets/"
> +UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lrparsing/files/"
> +UPSTREAM_CHECK_REGEX = "lrparsing-(?P<pver>\d+(\.\d+)+)"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/lrparsing/lrparsing-${PV}.tar.gz"
> +SRC_URI[md5sum] = "34357d69bce87654d792cd8f02d148b2"
> +SRC_URI[sha256sum] = "b45afda44001dc5ba632934f74c043d40cce653f1a7526cfbcb68f6be055b8d7"
> +
>   inherit setuptools3
> -require python-lrparsing.inc
> +
> +S = "${WORKDIR}/lrparsing-${PV}"
> +
> +BBCLASSEXTEND = "native"
>
> 

--------------5FF8824033A5060DC441E74D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/22/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200622103542.27830-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200622103542.27830-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-lrparsing.inc                | 16 ----------------
 .../python/python3-lrparsing_1.0.16.bb         | 18 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-lrparsing.inc

diff --git a/meta-python/recipes-devtools/python/python-lrparsing.inc b/meta-python/recipes-devtools/python/python-lrparsing.inc
deleted file mode 100644
index d125151cd..000000000
--- a/meta-python/recipes-devtools/python/python-lrparsing.inc
&#43;&#43;&#43; /dev/null
@@ -1,16 &#43;0,0 @@
-SUMMARY = &quot;Python LR parsing library&quot;
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;AGPL-3.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788">&quot;file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788&quot;</a>
-
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://lrparsing.sourceforge.net/">&quot;http://lrparsing.sourceforge.net/&quot;</a>
-BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="https://sourceforge.net/p/lrparsing/tickets/">&quot;https://sourceforge.net/p/lrparsing/tickets/&quot;</a>
-UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://sourceforge.net/projects/lrparsing/files/">&quot;https://sourceforge.net/projects/lrparsing/files/&quot;</a>
-UPSTREAM_CHECK_REGEX = &quot;lrparsing-(?P&lt;pver&gt;\d&#43;(\.\d&#43;)&#43;)&quot;
-SRC_URI = &quot;${SOURCEFORGE_MIRROR}/lrparsing/lrparsing-${PV}.tar.gz&quot;
-SRC_URI[md5sum] = &quot;34357d69bce87654d792cd8f02d148b2&quot;
-SRC_URI[sha256sum] = &quot;b45afda44001dc5ba632934f74c043d40cce653f1a7526cfbcb68f6be055b8d7&quot;
-
-S = &quot;${WORKDIR}/lrparsing-${PV}&quot;
-
-BBCLASSEXTEND = &quot;native&quot;
diff --git a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
index 21a80cde1..85a54af30 100644
--- a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
@@ -1,2 &#43;1,18 @@
&#43;SUMMARY = &quot;Python LR parsing library&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;AGPL-3.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788">&quot;file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788&quot;</a>
&#43;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://lrparsing.sourceforge.net/">&quot;http://lrparsing.sourceforge.net/&quot;</a>
&#43;BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="https://sourceforge.net/p/lrparsing/tickets/">&quot;https://sourceforge.net/p/lrparsing/tickets/&quot;</a>
&#43;UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://sourceforge.net/projects/lrparsing/files/">&quot;https://sourceforge.net/projects/lrparsing/files/&quot;</a>
&#43;UPSTREAM_CHECK_REGEX = &quot;lrparsing-(?P&lt;pver&gt;\d&#43;(\.\d&#43;)&#43;)&quot;
&#43;SRC_URI = &quot;${SOURCEFORGE_MIRROR}/lrparsing/lrparsing-${PV}.tar.gz&quot;
&#43;SRC_URI[md5sum] = &quot;34357d69bce87654d792cd8f02d148b2&quot;
&#43;SRC_URI[sha256sum] = &quot;b45afda44001dc5ba632934f74c043d40cce653f1a7526cfbcb68f6be055b8d7&quot;
&#43;
 inherit setuptools3
-require python-lrparsing.inc
&#43;
&#43;S = &quot;${WORKDIR}/lrparsing-${PV}&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5FF8824033A5060DC441E74D--
