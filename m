Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.43])
 by mx.groups.io with SMTP id smtpd.web11.21584.1594922736589674063
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 11:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PhRJEibD;
 spf=pass (domain: windriver.com, ip: 40.107.220.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhK6RzKyCEV5uobn2dc661fXGpPkijnXma+AHuWxNdW98XCIJTssy5WxocWKVK9ZGlWg/9lKVIkUedvsSDGJFUA6CFRb9fZpwshO47uxYOJ5Ox1iXJQ6HfDOQ2Ls7mxsCsPQjedG7mbF7cwxHOsWlJYn+epIxS/Bm4nsGTpJt7UwXJ3orTcZoMxVhstXZSu/DjUgc7bDaIROKHMRLDte3BN13jULJDcbuF+UbDSgJqtRNJLuN+EyosvDBnZAlfVPRKguMfTNYREOvibVkV4x+8QOK7invRrs2t0UFg5jqctaLRoPeoLwKudZR9JZ1QRFcNd8df10kgYJPDi6uZmgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0V6a844Xl/GRFADp7yGURatHUPLziB4KFUq6CUSFHjI=;
 b=fl6JmPiPU+n4Y1TVB+MZMsUMutg8psWuG2SZjcOz+A6ovUCZLBQpWb8UB1yNxphqwoc1mprAGd2/ecrfE2o0kqgFmgWwTWzZnKHD4RPgOQ0vWTpuQd2ZFQhU/OedHGT+aoUbKYEeESrHjRPDPxgsi80mdiZNtk0wpWt/8Z2ey0ueWM+kSEwUaRXGQj+hSjQbNYBEmT9Sbd8aet2BO97bcs33vCxX6xl8Enb/24y9psRrwSeCnrs8+drNVx+T44iPsREfiIOd/QGASstkVqAH6D42SZe2xzst1dS32qnbMP2lriET8HR/KCrAw8j3JCG2in4yzJy8sx0Cz+4aiCHTfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0V6a844Xl/GRFADp7yGURatHUPLziB4KFUq6CUSFHjI=;
 b=PhRJEibDRYztC/1XZeSQ/chPzaREIpJjSyxeo5CAx3G4CunFutmA3KKPsyQBr0GMlcJPLdHMrvmUas/uBaIkXCmpr+E5zFTqlZJq/6MwLR55olIzp6Q/Env9TwRaEJoLu26nM3RJj5vavO12zfNv45/+6uSd9yk4y7V9l91hNAk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1688.namprd11.prod.outlook.com (2603:10b6:903:25::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 16 Jul
 2020 18:05:34 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 18:05:34 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-semver: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594928600-4618-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <85f9bf40-5964-391b-2c43-4fc254adb16c@windriver.com>
Date: Thu, 16 Jul 2020 14:05:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1594928600-4618-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::15) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 18:05:33 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd61cd4c-36a0-4391-5a0a-08d829b2d5dd
X-MS-TrafficTypeDiagnostic: CY4PR11MB1688:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB16881DBA266F4DBD3D4ABB3A9F7F0@CY4PR11MB1688.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9ksazF2nYT0SZCBCEJkWOIIpOyWOoXmUKJccK3lDp2gZqV5lcjBH1ZABdwyP1r3ckMSBg0PoM6gOX+e5MRQuFU6ycSsrnc2IcRqd9yom6gWnnPNJZNTi9mvdImAxfBN9nMbB1x00REtZmsFHrd/Ray6TltiKlnt6NPypXU5KSOA8zjOEsES/TFqPhEQnjmfldQluPxufAwb4V4rpt7iF66CXb+AGWzSQHQ06WoH1G8DbihtT6OiY7eXV1QNuy4hyJVvqRe8mR3EExZNq7VOvRbhyYmFelUoqC+U9Is2/G1tGHCAg0YOJJSg96VQZ4TCy+4SFFmHA8rCzitxeUje69sxNRnDGiEEYr+PywoJ1kB/JmZU935V1ktT8XH7F9AGJKuCUR5GBwXq5DF9bMb4YIAGjttmhk5p+NKQgSlq7ktTRPRx19SNEjhE5WSK7k567JBcX2u+iNMYb3m1shm7ysA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(136003)(376002)(346002)(31686004)(33964004)(66476007)(8676002)(36756003)(2906002)(66556008)(956004)(6486002)(26005)(966005)(8936002)(5660300002)(478600001)(86362001)(83380400001)(66946007)(166002)(44832011)(316002)(52116002)(53546011)(2616005)(16576012)(16526019)(31696002)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	6doA6DannW0C3w4jsFUAz4lhtlaftuSjB4a+ZoFXvZ4YwY4zPdhi3msnQgWtTCDWMBS9w4t1XoOeHF2qfrz/4PGp6aZkSm54dr24WdkFKa8vr1HSHr5Gb9p0gR2xc6Rakh1UUvFr+JNp2f+f2PoDAS0BmjQdiAFXosfJOovFBWfIpGy2IUQ7BQUeGU1PMJZj7YdKJpPBBq83UDc5zgA8N60anMxKe/yy3irVqGJX1XBa2sjsoTBTE6Y8LulJ09yeH01lsnVUP1R9ayzXuWDZ2EZdp86BA3T0xPsYR8NMXMQvh0T7furKCMheJeUPUIBetzmpDlV+1xLQYhgt/fCSaToEuGaEAaJ3y0whhqgI6Pp0wa11HuNWFv+URygEC4fnUjdnmhCp4wiS/bvprcHgnzKBuzFZ06CWM61deR7S4AxnKp7TiStoYEDdqxS3edSYv5oCLVikvjYn90IoJEwG9D0NB++rayUY2FpJePV2T4dcqsmDkIAA3yO46X0OOnde
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd61cd4c-36a0-4391-5a0a-08d829b2d5dd
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 18:05:34.2735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObkF+sSZinrCmhFiWjy2xy+BiiUvLoE6AADHFABrBPr8Y0nkQhLXOAELNIJeynckalER0CYsGuWBd+2SeUt23pw72G/m5K8UPE3KKpOxJ4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1688
Content-Type: multipart/alternative;
 boundary="------------FE64C0537CD029D43E29611A"
Content-Language: en-US

--------------FE64C0537CD029D43E29611A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/16/20 3:43 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-semver/run-ptest                |  3 +++
>   .../python/python3-semver_2.10.2.bb                | 14 +++++++++++++-
>   2 files changed, 16 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-semver/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-semver/run-ptest b/meta-python/recipes-devtools/python/python3-semver/run-ptest
> new file mode 100644
> index 0000000000..43c03b594b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-semver/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO test_semver.py --disable-warnings| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
> index b41ef5ddc7..71cb1acec3 100644
> --- a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
> @@ -7,6 +7,18 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665
>   SRC_URI[md5sum] = "3e11ae9782121e8ffe9f8a8b763a8cb5"
>   SRC_URI[sha256sum] = "c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
>   
>   BBCLASSEXTEND = "native nativesdk"
> +
> +SRC_URI += " \
> +        file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +        ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +        cp -f ${S}/test_semver.py ${D}${PTEST_PATH}/
> +}
>
> 

--------------FE64C0537CD029D43E29611A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/16/20 3:43 PM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1594928600-4618-2-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1594928600-4618-2-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-semver/run-ptest                |  3 &#43;&#43;&#43;
 .../python/python3-semver_2.10.2.bb                | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 16 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-semver/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-semver/run-ptest b/meta-python/recipes-devtools/python/python3-semver/run-ptest
new file mode 100644
index 0000000000..43c03b594b
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-semver/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO test_semver.py --disable-warnings| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
index b41ef5ddc7..71cb1acec3 100644
--- a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
@@ -7,6 &#43;7,18 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665SRC_URI[md5sum]=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665
 SRC_URI[md5sum] = &quot;</a>3e11ae9782121e8ffe9f8a8b763a8cb5&quot;
 SRC_URI[sha256sum] = &quot;c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;        ${PYTHON_PN}-pytest \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;        cp -f ${S}/test_semver.py ${D}${PTEST_PATH}/
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------FE64C0537CD029D43E29611A--
