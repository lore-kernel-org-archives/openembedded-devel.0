Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.88])
 by mx.groups.io with SMTP id smtpd.web10.60727.1594050633862671734
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FG8ABR5a;
 spf=pass (domain: windriver.com, ip: 40.107.69.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MI4fAzpQfn4V664XxoC7rv0DBkbp4nJNJ88UEzPXRQ3OkPWq0mWqFhzAIoKfizYdIOlkUvrjc45tEuQJGUWdBzXBLx8hrODWbFbqVHg3idX3eT4Z2JJZ43q1UJhWjs/KXORKPwqJkWGnMG3bY6rYbe5l/C713DRFFtH3l+7rrrbSH31ycDtSdCT6lCprtOv0DLgNlTp2GAYcPo0CBCClVxsuFBuOqm8gqI3kM0rS2Precyg9tbjqKit6siXhX1F08B6rqAmnDf0epIXMAJ89IImGgPd6MpuWuO9cGP/PKdbSyrtlrqIW1Mt67m6UQXfI5qlckHXtRQQFqZ0Cvdnl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IelRGQUHMNxe+wJBAa8Fy6xJfLsOlpglbomCuoX6Yco=;
 b=PFpsEcVdVEdUbGhzD2d7yBJGOlwSSZlkLs73cVnvUpjJeCe2ljyp9t/HBNPMw0RsdH3aKjF/Qv8hI+gBZJErW8keHiZnHkE9qIJGz1ZbeNG2Xw1ahOaxJKpvSfMFYdgpRg5zIvkAh0Q5tvfIPa2UZYT80DnGuWxiynnZbVH0OTVK5+Zr2FReXga7IZb2MnMg9QrEIOB8tyIdRd2YU69JBqCMyi5cS91sR0q62Tl5oYuEkxwE4X1AuaLQ7rmLcPsz0ANY/zFPdDQof8xTHpEx73SkeZRZ+FInU9om1O2OV+gCRc9dVHGPXJscTMmnWm6z+e/1uOLav2ioIfYEvN7pAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IelRGQUHMNxe+wJBAa8Fy6xJfLsOlpglbomCuoX6Yco=;
 b=FG8ABR5aod3G4a1AAOEtwFSXPBO3bhU480z1dG/BB4TGCAYiqw0k/f3QwnP2B96gE5Ywpf9dw3gL6fsYz7ViaPYwQCkq5j3ys1rqWc6sEtg8EibAmudFatO6DFmcmtVuheeBZ+TTKQBPaXqjJVYaJ0smpoYx5z0IoVoCCXTNIN4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.27; Mon, 6 Jul 2020 15:50:33 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:50:33 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-betamax: add recipe
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200703155451.27829-1-sakib.sajal@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <898d84c6-35d5-29fb-6ea4-db867a1447cf@windriver.com>
Date: Mon, 6 Jul 2020 11:50:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200703155451.27829-1-sakib.sajal@windriver.com>
X-ClientProxiedBy: YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::15) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:50:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb7bbfcf-708a-49dd-d306-08d821c450eb
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB18995CDAE2A7DFB9E3F340E29F690@DM5PR11MB1899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NNlNafF70XZO5zCw7MfWfIIkX0/Uek5M9+YaikdtPZ8ThiVI4SM72Iw3JOjQ1nTkZxq0tQ2aYqf67dr8zrxfis+gzfrLX1NGQNMCWCUy3kbsXS3adR1f0G/XFM0icSFQmZnmpS1F3L+miX5LgNXgLvkwT5QZ1J85ZHSJLk/Z9R7/qqwQWSi8OTr1Y7cyxyMoAyTJ4jLnIOsSyR5hWaqOijuW/vkXGD9I+VUi6LTcuf7hmJwikUKPnQ3kxr7mgWoaS293rAkinOsUEpSqveN4lRe2k6Ad1Ky5BUgTHeBxu+C8U1qJFMwfe2qOaV7ISydHsg5afoP8EtAC99ltO/fW80iLBKdnqLXunT9mDJJEBtlYNg7fdWvF4HLhbSVNA2zAwkRhypchgw75P21gPBn/5HmIsqkDFGeaawbYFEgLtcfGhwRdzvG0Vr3veWujJSjbQI2h+05bYjBQvzoEZzy2/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(366004)(39850400004)(136003)(16576012)(5660300002)(31686004)(478600001)(86362001)(83380400001)(31696002)(6486002)(966005)(36756003)(316002)(956004)(2616005)(186003)(16526019)(33964004)(44832011)(166002)(52116002)(8936002)(8676002)(66946007)(66476007)(66556008)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kbYecU4lFF5Ptr/YkvK2oXUVHETi91hLlx/gDJ+iYDtqboSEXrwLR5lSYnqxH9uA7gbgvYQhmoGyw0wpD+T7yYLeNu5Ck+K7PFCOrQCXvrkdL72aYUPrvwwZoqq/2HgK/A3Ow5ClsPv8KqeC7znAMSqeylmF1GDRgwXH42nVGbEUZ1ZGXIPyu3rYGI6KFOxrnUi4VS6C5gC0Qlg1BizD1leCxmUHHMbI1p66wmCexkrDbQDuynqJR6BRpVtojn/jhUI56P4ajo5DI7Zi2IKZNFQ5y4L568AAmcNCuZiRG+HijuMKJpe2s1H3xSPBA+Om/05gd2fxlTab5yVKlyBrrobzED6pVT4VJ9Me73H0uH3C3IC3RbU4icbAGNMqqhq9Q4mtfpyj+D7sYlLAftxZLl7kyjJ4OT+axdDqA2Nm5eMaxMar1CcBgmqCLmLfSQlNFmouxOj8cPOF1TePDR7pPHmCLmzGZOmvfRf9WbYtKx237ABPr/33ygwfOh9lmkHN
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7bbfcf-708a-49dd-d306-08d821c450eb
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:50:32.9862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7FV1zTImIDZ6bbdGoKCmckOD8V86COddnN38gBH98aWHz2aVZfEPHsY+re68AupkZQeLrOCDIxHp8sEkfpen/kza6G0DXmGKhGNcjVU0zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1899
Content-Type: multipart/alternative;
 boundary="------------7651B5C8033334BFA7CB4476"
Content-Language: en-US

--------------7651B5C8033334BFA7CB4476
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/20 11:54 AM, Sakib Sajal wrote:
> betamax is required for enabling ptest
> in python3-requests-toolbelt
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-betamax/run-ptest          |  3 +++
>   .../python/python3-betamax_0.8.1.bb           | 23 +++++++++++++++++++
>   2 files changed, 26 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-betamax/run-ptest
>   create mode 100644 meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-betamax/run-ptest b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
> new file mode 100644
> index 000000000..ef654e917
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "VCR imitation for python requests"
> +HOMEPAGE = "https://github.com/betamaxpy/betamax"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=61c15f0c146c5fb1a8ce8ba2f310d73c"
> +
> +SRC_URI += " \
> +        file://run-ptest \
> +"
> +
> +SRC_URI[md5sum] = "b8182d43a200fc126a3bf7555626f964"
> +SRC_URI[sha256sum] = "5bf004ceffccae881213fb722f34517166b84a34919b92ffc14d1dbd050b71c2"
> +
> +inherit pypi setuptools3 ptest
> +
> +RDEPENDS_${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +	${PYTHON_PN}-requests \
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>
> 

--------------7651B5C8033334BFA7CB4476
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/20 11:54 AM, Sakib Sajal wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200703155451.27829-1-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">betamax is required for enabling ptest
in python3-requests-toolbelt

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200703155451.27829-1-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-betamax/run-ptest          |  3 &#43;&#43;&#43;
 .../python/python3-betamax_0.8.1.bb           | 23 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 26 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-betamax/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-betamax/run-ptest b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
new file mode 100644
index 000000000..ef654e917
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
@@ -0,0 &#43;1,23 @@
&#43;DESCRIPTION = &quot;VCR imitation for python requests&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/betamaxpy/betamax">&quot;https://github.com/betamaxpy/betamax&quot;</a>
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=61c15f0c146c5fb1a8ce8ba2f310d73c">&quot;file://LICENSE;md5=61c15f0c146c5fb1a8ce8ba2f310d73c&quot;</a>
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;SRC_URI[md5sum] = &quot;b8182d43a200fc126a3bf7555626f964&quot;
&#43;SRC_URI[sha256sum] = &quot;5bf004ceffccae881213fb722f34517166b84a34919b92ffc14d1dbd050b71c2&quot;
&#43;
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;	${PYTHON_PN}-requests \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	install -d ${D}${PTEST_PATH}/tests
&#43;	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7651B5C8033334BFA7CB4476--
