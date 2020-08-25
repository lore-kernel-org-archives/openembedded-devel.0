Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.70])
 by mx.groups.io with SMTP id smtpd.web10.12707.1598359248423775669
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y7JzRBdn;
 spf=pass (domain: windriver.com, ip: 40.107.237.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG051LUT9ePdratC2bC27HNZ83ixtQW9zSCr0y6TqmTrIxna6w7a5Iv0IlZ/uPxEFe92ZcgyR9NYs/1oVVEwPQsdV8mHDMwzWm3AzaIKAcBv3KdkIjlZ86gNxxLHuqeLLPer54bs+xmC7XcKj4+F9BrogArU91WaoUMn7+lqG9HkRSZGS+QOBq5sEePXfO+3K8hvxQHj3uohoa8ZCLN+JUOuF73MgvWcN5rUdCO0V2XxTMcKcWZuO3TsEL6HHkyWy89UFW+gKrb9WwSRP6ksMycZ7iIblDEKEO42oir6dj5nJdw21x668wyEpPP4fy6pozdiCqllFHSjd+ElC97dqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzQ1sDDPb+m0RrJiTi4qRc23aDBXs1MCBDC0V6vjvOg=;
 b=Frx+TyXzWrcUilNp4pj5nQ3TW8gCvDkDgCLFqoTkcJc5Zfqt6NexNy4RuhovBcrJGfY+5K4ltNbU8+zkMhIQg+MoVWMhORY/zkRW+I2Yvzr7LXydt28gfDod0vKh6XXiaQrONJvwfo6/4tdod8HO9Fh6df1OCE5QrdJ2sqJqhkULQP0/3AK+/NJ/JjQXyLZlzlKvNt7rP+hDGREfnnTr4r3IK/Bk3Uoi1edes+KN8becf+eUjxsJXGGaa44x9HmLAUk/CWFyUh0AmgfT+y4f1h2a2ZGViLkoERfVULLoTxWikIucMAHN2kcoHTG4+9jtO2XO+kXoJGy8BzmIcRhjlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzQ1sDDPb+m0RrJiTi4qRc23aDBXs1MCBDC0V6vjvOg=;
 b=Y7JzRBdnCQjH5vk9QZKNfTM+5FubQ4WAooIEYno4Zm1w7XlN/lcuRwoTvrqYwKQSuXqgGoafEb1xrWfKCnSVrlztvXGNA0wuqEyFGSJ8ELciYi2TgxI9tDx0VAywQ8cy+DQYYIUdQwM1p6wDqY1YYAJ/qOTIVilCTWOXqtpDx1k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 12:40:46 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:40:46 +0000
Subject: Re: [oe] [meta-python][PATCH 02/11] python3-pydicti: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821234504.719-1-leon.anavi@konsulko.com>
 <20200821234504.719-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3a16f72d-dc0e-4ea7-83bf-16fbf9d1a25a@windriver.com>
Date: Tue, 25 Aug 2020 08:40:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200821234504.719-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:40:45 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86e05a4e-6fbc-4e99-06c9-08d848f4167f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3766D2A4F10035B9AB088D9A9F570@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:33;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eLV6go2QPt9ieDo77I8ZT7PQcLCEQsMAOUc2dqmYrd7wede1of+9oyEye7th6jBMz7TlJEeXVYTYsMz/qjlUunSBXPuJVNrGMkLUyzPW/pPKCYzZGawUDAMR/eIZVV3wY/DN2zXx9ljOWZBuqu5nc1bTNiuNT/rH+iu5DIu0T8sI09aLTCNT+TW17iiw4NBbhIvPHpf4oNfToRbMjQH4iQAwLq0Uzy9VACXVjRGHh00sBGQdyxOB4rc48AxYF2smYe8z1LscyIUIAA/8mBle3yzrEObqNtn3nGk+lEKLrIDaDjeDMyUZj9GE2lVq8PMyHW3QQZ/R/JRoYg75CI6VVg974x9LOmnFyr0HHpfE3bAvacTkmkOaY/IXvoQkQjiJj8FamK4sdVKCvx3H2XusuaC+fSbj2ktJVDOsvscBbnOfmXIDhmNYrPiN72Kud+uzmHUl7lXbhJQPpcHrPaE86uD9kWERmyXDcRMAYlEVl98=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(2616005)(8676002)(5660300002)(6666004)(26005)(956004)(44832011)(86362001)(53546011)(316002)(33964004)(186003)(6486002)(52116002)(16576012)(31686004)(478600001)(966005)(83380400001)(166002)(31696002)(36756003)(8936002)(66946007)(2906002)(66556008)(66476007)(556444002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rpnm2HFKltB9gadkmHGX3Z+wscEjZsqESy3XSsx9IXR9J5J7AkFCA3wDuStRxb26F+sDqn9NsXi+GPR4hJQH1+zhCiSvbcdd96LGjgWkIk2X+Q7NF9ft+XIdOJ1AimaH5/njiplTzNrU3EQOwzzmeTQ4MoRucl2EuB9KZ9aSkS85q33A4113yJaoYDnmJOSEg5peOHMkx/MSPLezZFPPtYk+asRH60EXC9SUE6xtCMSe91ebDYP3w0O8w8LKQexh6ZfLKTq7Jreb0R0iscl5tcGEyxVlqkKdR3hk6eo6BvJGC3jCuQ+E/qGXVRcHWcj5mWdP01/QkQ8rUE8sZ2QVbbeAlIKMS9LMr95PLpVRmRcpq8iaMTQqn6EGN89k8hfZ4/RaZtxSMNmHWZtdo4MsdC+NqiWbJ1/9Jl4gwbNNUc2DiVkZSyZ8jgMy9HT99DigkhyEz76eGbxTP4e98VHOHjjct3o2FyP6XRMqwzPtRfS49QDNZAP8bQaSmWpEbS2G+Ywmbzh2jb3u4ZQNiY9PtayB+SN1Jhp1cBRuGtJlxe0T8O0Rxlyr7eOTf6Sp4Fp6OtFya2oFMeOB4fY+QjRo5U8wHvpJ/eOPVhN0ZZK45C+s/UYuUF81g+yuSSwnN3MM2xAzeO+c8GjR7TNYirb+yg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e05a4e-6fbc-4e99-06c9-08d848f4167f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:40:46.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQyH2w07+Vpt4qfjul4R5LaWKvXeHVq7hV1vObo/68WrZDBMxNsm+Um7g+8nj4f2svnNoGulzM37sbmekDI1RsqEGc0aO+YhxxTHTzHyhaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
Content-Type: multipart/alternative;
 boundary="------------691E2D861A0AB6F0E47CA05F"
Content-Language: en-US

--------------691E2D861A0AB6F0E47CA05F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/20 7:44 PM, Leon Anavi wrote:
> Add pydicti, a case insensitive derivable dictionary. Changelog
> for release 1.1.3:
>
> - avoid key recomputation in __setitem__
>
> License-Update: Add WTFPL
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/licenses/WTFPL                         | 14 ++++++++++++++
>   .../python/python3-pydicti_1.1.3.bb                |  9 +++++++++
>   2 files changed, 23 insertions(+)
>   create mode 100644 meta-python/licenses/WTFPL
>   create mode 100644 meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
>
> diff --git a/meta-python/licenses/WTFPL b/meta-python/licenses/WTFPL
> new file mode 100644
> index 000000000..5a8e33254
> --- /dev/null
> +++ b/meta-python/licenses/WTFPL
> @@ -0,0 +1,14 @@
> +            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
> +                    Version 2, December 2004
> +
> + Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
> +
> + Everyone is permitted to copy and distribute verbatim or modified
> + copies of this license document, and changing it is allowed as long
> + as the name is changed.
> +
> +            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
> +   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
> +
> +  0. You just DO WHAT THE FUCK YOU WANT TO.
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
> new file mode 100644
> index 000000000..bca0ba737
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Case insensitive derivable dictionary"
> +HOMEPAGE = "https://github.com/coldfix/pydicti"
> +LICENSE = "WTFPL"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=389a9e29629d1f05e115f8f05c283df5"
> +
> +SRC_URI[md5sum] = "b02ed35da91e400f1f17a57ab02ba06b"
> +SRC_URI[sha256sum] = "eea50576baa751a9b6b862f09f081c47d557e0298623ca8742851da72b00eec4"
> +
> +inherit pypi setuptools3
>
> 

--------------691E2D861A0AB6F0E47CA05F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 7:44 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200821234504.719-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add pydicti, a case insensitive derivable dictionary. Changelog
for release 1.1.3:

- avoid key recomputation in __setitem__

License-Update: Add WTFPL

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200821234504.719-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/licenses/WTFPL                         | 14 ++++++++++++++
 .../python/python3-pydicti_1.1.3.bb                |  9 +++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-python/licenses/WTFPL
 create mode 100644 meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb

diff --git a/meta-python/licenses/WTFPL b/meta-python/licenses/WTFPL
new file mode 100644
index 000000000..5a8e33254
--- /dev/null
+++ b/meta-python/licenses/WTFPL
@@ -0,0 +1,14 @@
+            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
+                    Version 2, December 2004
+
+ Copyright (C) 2004 Sam Hocevar <a class="moz-txt-link-rfc2396E" href="mailto:sam@hocevar.net">&lt;sam@hocevar.net&gt;</a>
+
+ Everyone is permitted to copy and distribute verbatim or modified
+ copies of this license document, and changing it is allowed as long
+ as the name is changed.
+
+            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. You just DO WHAT THE FUCK YOU WANT TO.
+
diff --git a/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
new file mode 100644
index 000000000..bca0ba737
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
@@ -0,0 +1,9 @@
+SUMMARY = &quot;Case insensitive derivable dictionary&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/coldfix/pydicti">&quot;https://github.com/coldfix/pydicti&quot;</a>
+LICENSE = &quot;WTFPL&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=389a9e29629d1f05e115f8f05c283df5">&quot;file://COPYING;md5=389a9e29629d1f05e115f8f05c283df5&quot;</a>
+
+SRC_URI[md5sum] = &quot;b02ed35da91e400f1f17a57ab02ba06b&quot;
+SRC_URI[sha256sum] = &quot;eea50576baa751a9b6b862f09f081c47d557e0298623ca8742851da72b00eec4&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------691E2D861A0AB6F0E47CA05F--
