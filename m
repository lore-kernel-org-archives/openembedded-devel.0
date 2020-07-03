Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.48])
 by mx.groups.io with SMTP id smtpd.web10.10868.1593785055525401566
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hwLzCDsg;
 spf=pass (domain: windriver.com, ip: 40.107.92.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUGwrmltnbQbF0v5cOlnB9cr+JpnHzveerutwOMFrC1iZmkyAc40rTqqjsgljnoW9HgS2bziw4fJiZ6i3ZGUF+g32qem7vZEQjWyFGBNqoxf4GhkEYKVaJeiZeO21xsI1jrfIkBhlgaDpqv6rQ2SVOwZFrhz/btVy/VtJMHuYOgkQErR3ykZdfrl24jZ/x/chm92Yl9OuY33UU1kCWcigxqjfAFLBUIXvR32BMEg8nnrBMUQIqmbXOfYruLVyVnkYw7TieOhpPvv31gSLKvRmHhcMDyZJ/zvvxZan1/Pt8QxGi+UbitjGazOGk2BN/g+r4CXhBeqwfmD9frB4IAZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwM9vHyVEjWuQyiOTWw5d8qIN2WlBK8LV4390HOsHK4=;
 b=G13EUgaAzQU1SEAiXDEm1J+bdLsJgl0jzFqHTHeQiaKxste6qoQgU58Sd5G5QcX+kLblJfChp6DUEp8uw7i8iooOU3PYioqnW3VBD8dSNE2ngUUYNrNCiFAAc4tqz0ddOV5HVhMVOffJMqUdTICKkMdvagD4vMnaVOgjJ1pCmVBYgJR1OAGZZ+6vjeocWYfDngpsz91pMMNKyKFgODzAEmxNLB2HqiQnsvXVamaHYg3zEVGFPb+8K3Tp6ZpS3rKt6TzWdyS1IeSdoQQb8/MiUpoYZVS6uw1vHBknWPt0iEZIx/9NBFgMCvYDsH8EGC7u0c9mZQ0o8xn5uarA9EbKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwM9vHyVEjWuQyiOTWw5d8qIN2WlBK8LV4390HOsHK4=;
 b=hwLzCDsgFJwY/7DwxJZIAvf7y9kulSs6BxWNWNr0JuJAhObYMXdxL4F6+rCzeWmVnYBknFHnJheFTrmSOs8+7TB7SX8DaBJ84w8UVWJs7X/NyHJ4Cbhlua4aX/5AR8De8UTAo/CFlN3zJxX7gOMplKMeLtrycf06+NmjVf3BEOo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Fri, 3 Jul 2020 14:04:14 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:04:14 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-u-msgpack-python: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1593479853-4475-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9dac30ef-be73-4ad1-fa63-15d697645ed8@windriver.com>
Date: Fri, 3 Jul 2020 10:04:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593479853-4475-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 14:04:13 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fe85367-bed4-4b9b-8b50-08d81f59f7ad
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB36289D9BD32A88E0AF0E09D49F6A0@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0mL/J2/uDK//bk/oRKFzSxIjBJR3cJlhmQRf5FvhAmtgGbeXppMiL++jrxF2oIXKVE9yFeaVpi3xDIXOyvg8rFUTwDelGE9DYSjH2YfSRxVoKMbqX8Pmzfa0abuNYVeELe71PFUmsZItHH+piW5V5zSeNOsv5Vh+ohWyTDTmCxuUJcoZa0tMZLI+ZLTPcPjCw6Bsf+/7GvXAUYJMZRxuPs6DU2XI55pHM3Fg4A/8fpC6gKxlu8YIHzumk/eK590si/C804gEEfVgTu2nWXW1Qid0EalHYYUnBx6eGF8PGi99kTH+O25tb9oiEViuqcl5u9Yi0Uc+oRsdF9VNl2TGqb2WPBLXqCKxlUobWoQqJtfqaZDtPq5OWOG8gjjhvd5o/iqkySB0anxCV3a1TJpu9fMl+W+/IJFfJ/blV+CRmObCcdnwAeDJ24uKLJI7g1bLYgRWC63bCOjI0v/r8kkWbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(366004)(376002)(346002)(186003)(2906002)(966005)(52116002)(86362001)(16526019)(5660300002)(31686004)(316002)(66946007)(2616005)(66556008)(956004)(478600001)(66476007)(36756003)(26005)(8676002)(44832011)(53546011)(6486002)(16576012)(8936002)(31696002)(83380400001)(33964004)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	l9Xyrc6zvYNYkFQeYgUJ1onigRVrMaRYq7uGeZxyoYTL5gK6jnwUBUHLLaidYZDTWz8bk7KDJqDcEhbbOHwuMVI7TPSsbKvWX47L4ZMvBHzcAexbVmqNApk7w8R3bnhqd49y+4SUseaYtjY/GdGoCjuYauvqGjntRH9RsBOQ6DuMumK7MguXZTzf500tk4k0tWne6ILsApxjW+xkRr8oXWqff4jb+t53F2m93Hgr6DLVDb+peX2GJNted9acd+KNJPwRuJ3rqJqbdHWIoujPwSAE/dkY2x1/cnYj2ZPqBqWjPvVSmBWtwMJ6MTkyFLTnq/gmFPSaMHzcoHbhjMG6dg0tf8Ncw5Hn90LigGFDGkhXuMJjUOq2VNgdQ0YX2/eBazICpdoBLjzxrVCxyyK6755jjPNRXQGeol5qzLAoAFYJBYhyf99G9JFhY3MD3CymSCDSn5SH+Mg6EZB5ZxSEjUQ/cHTPl8Zb8LY8rvegma7PpWa898CPNDGOkLsRO9CB
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe85367-bed4-4b9b-8b50-08d81f59f7ad
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:04:14.2890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNht7aZP8ugXF+mRpRbwMyh7kgkzekCs2HZnzjYeIj/lefRjyaML17rrkBLQ0Y1sMDwY8mEhx8DTQ5khPtAPAxWG+nrEKmsTcVky+rq5Y70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
Content-Type: multipart/alternative;
 boundary="------------9E0312DF9E8CE15735D2D51D"
Content-Language: en-US

--------------9E0312DF9E8CE15735D2D51D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 9:17 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-u-msgpack-python/run-ptest      |  3 +++
>   .../python/python3-u-msgpack-python_2.6.0.bb       | 14 +++++++++++++-
>   2 files changed, 16 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest b/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
> new file mode 100644
> index 000000000..7110f6bc4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO test_umsgpack.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
> index 6d2e0e0c3..f3f321e18 100644
> --- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
> @@ -5,7 +5,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594"
>   
>   SRC_URI[sha256sum] = "754edb07eaee39a9686a99823892e3a1be4e0948d9cc5c717946750c27643c9c"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI += " \
> +        file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +       ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +       cp -f ${S}/test_umsgpack.py ${D}${PTEST_PATH}/
> +}
>   
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-datetime \
>
> 

--------------9E0312DF9E8CE15735D2D51D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 9:17 PM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1593479853-4475-4-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593479853-4475-4-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-u-msgpack-python/run-ptest      |  3 &#43;&#43;&#43;
 .../python/python3-u-msgpack-python_2.6.0.bb       | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 16 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest b/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
new file mode 100644
index 000000000..7110f6bc4
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO test_umsgpack.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
index 6d2e0e0c3..f3f321e18 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
@@ -5,7 &#43;5,19 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594">&quot;file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594&quot;</a>
 
 SRC_URI[sha256sum] = &quot;754edb07eaee39a9686a99823892e3a1be4e0948d9cc5c717946750c27643c9c&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;       ${PYTHON_PN}-pytest \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;       cp -f ${S}/test_umsgpack.py ${D}${PTEST_PATH}/
&#43;}
 
 RDEPENDS_${PN} &#43;= &quot; \
     ${PYTHON_PN}-datetime \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9E0312DF9E8CE15735D2D51D--
