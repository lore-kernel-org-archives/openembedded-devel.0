Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.87])
 by mx.groups.io with SMTP id smtpd.web11.10763.1593785022559480046
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EqQ1c07c;
 spf=pass (domain: windriver.com, ip: 40.107.92.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzgO2zfWErIQ4SwkfeYcr3R/l1cCp4eshmzfTG7btOiBC6XP1iLrCC1RxI/C0YNCTHeM0aM0jOZOCruu/X+08joFR3gbjgdtHzgG2aIjPhPEPY5OYQnmj1GiI7mgS5JJ8KZmJWIJIyjm8kZQlE3UfT0Q40cjR99kiGRSTWzY4fhTAfe0o9Yz4tYh5UXAa0ffK5axdsk17RiRojNWSYD2bEzBaZtOBHJftZS/5cJx/gmC02K7PDMjT8mSjBkXpOphdBxp9fFyqZ9rAxh1Z099y3K1nr62hHTUwHM9FRil1p9N5FQXKaCZFCmnVLnBWu3fCzmY+p5TJODMR2OiL0nvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zk2WRDgXGmt/XbxL25OG4iE5AzGkMMBATnpspOVgGw=;
 b=Vh5eMly6OgzMerKCfM2Ygaoa25Hm/w+qBLGyIoT7SxNWcvUrJsEtOw2l8LHmTLAU70D7GD+wC0iMytpUK/ZUeGqNa8jUSCtve2Z1JPIGyg50sUtr7DMrMCV5AFII90HotWVOYENlU0n820dnWQS4MZ4NEmBvp8g14sYtzo56K4STqybs5r+UyEMYnHfccF3MWbezQVDjXjBuGW7a5aNMYakxe24DVlrQgeIaY30jsU2PATc6Jx2BUgz58WrI/tO26cIMYfJYzAhrL27GDVa7mTqxd+IrxDCQeBWOE9a8CUjSxZJIadrKAvHbYBGEaYfFhBsJFR7uQe5SfBWhmtq19w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zk2WRDgXGmt/XbxL25OG4iE5AzGkMMBATnpspOVgGw=;
 b=EqQ1c07c/qnmZh71UjxolW7xU7A8pgOZDO/du2DxSOmPQmjLuuV9kJt25lRC0tF4H6zwkKDeN5Cqc2iDezsVY4+LHVwbwv97/ZYTxcVi5cZCZSwFYtJX+19W93S6UnEe6oMl6MJWkDNVc9wJdM0rgstgv8EllFSzgx4XJz0xmUA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Fri, 3 Jul 2020 14:03:41 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:03:41 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-blinker: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <29b8f26a-20b5-242f-3cf8-de4e22126310@windriver.com>
Date: Fri, 3 Jul 2020 10:03:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 14:03:40 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbd0c9c2-90b8-4809-ec59-08d81f59e3e8
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3628A9BB529F41A1BC62DF819F6A0@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X2g5ywCkINu4zOenFqken4nRrSZfPE+J/T69ZppAi3ZszPMkI8hekknG6+iE9+poww1CZrXyxnbsgVIeEP/3CwvfgTFlbVlSkqM8m4bQHSk+KcZtPHQEj+UopWT46Zn9KMK32v2RpA2oS+RVyzqUXmlYhwCiHuXzoFsEqB49P3+/oJ3EPzG2Dct8j9YeT/BVkRentVVPDbhLjTlIBqw9sc96cdRrEt2mfC321UFwKu1WM9D1KlCj0vhEyzrLfRIIxqy6B+3wQbXxDzPllbemYO7mWEW/jqpH0eEFEeUw+PSkj/VvjhtDJ2B82Znc+ssXOvegNjOgg0nwt/3nL2Pfcw/D7+oWwaGt5nCR8jhyR0cUjjxpT7wpjXYbf2Pc/uifsLdk2HIR28QPldZ9QIwhLjMdKmoE/FzQR0MjSVdHLYWve+hVmIVxZJHestFzAR3MbKVnmej+r3wBgySOQTHLuw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(366004)(376002)(346002)(186003)(2906002)(966005)(52116002)(86362001)(16526019)(5660300002)(31686004)(316002)(66946007)(2616005)(66556008)(956004)(478600001)(66476007)(36756003)(26005)(8676002)(44832011)(53546011)(6486002)(16576012)(8936002)(31696002)(83380400001)(33964004)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	3RfZ0m/DJzt9MnJO67wDnYwuEhXU6N9M8JnSEOAVT2b/tHonqAZ6H1iw/r1QYB1Wkv+H7tKNk8tTg8ANF7onCjOzbxZo/toL3K5zUJk3P6nA6+wIHRPvU/Ens7hlQ0+C8qbJz6Qc1XtKcryLyzh6HakOYTSCYCTqQCmO3z59ZY/FKEERINCYu7QO1LvsSM4vux1g6NrsEPpxQk3ncGSVd9TBJRh8D5REhOKpQn3molD+G7lGuKS4QqvXumRycjcafnmYMR/db7H862QxxXN3t3t3RUgT3CNIl6lTNLf4iLRvx5OaRZyTNMfBFSBKWV37avtmAKe11jsozmZFBlsrZtl7vbpyuTrlK0AUA9MlQfPrtJYFYlKdDTuqBTg9Pf34VItUekbaADOX6kAzxAcOVAlOfGw8ezibLz2BtayVNsSbXGLqAOIEKLPXrtb67Nq8WmuTZZMzRLA/3w2xpc/6JM1igWrXGbfeogb2+LDIdHA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd0c9c2-90b8-4809-ec59-08d81f59e3e8
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:03:41.1267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCAXpDGqjTSDjZkNT1MKE2fJzxw2QSjrcy2eCDW1O5kPMVTdIt2en2a3fvG4JwcDSpWdCDfRtkTLCsblgDKe2CVyxuINPOLlU41AAZNJfz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
Content-Type: multipart/alternative;
 boundary="------------B6183F49AB99A9B9EF955F0A"
Content-Language: en-US

--------------B6183F49AB99A9B9EF955F0A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 9:17 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-blinker/run-ptest             |  3 +++
>   .../python/python3-blinker_1.4.bb                | 16 +++++++++++++++-
>   2 files changed, 18 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-blinker/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-blinker/run-ptest b/meta-python/recipes-devtools/python/python3-blinker/run-ptest
> new file mode 100644
> index 000000000..15c3f6282
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-blinker/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
> index e2f76c33d..18544b900 100644
> --- a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
> @@ -5,4 +5,18 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=946d7e89af6f7733aeaebed5635d2682"
>   SRC_URI[md5sum] = "8b3722381f83c2813c52de3016b68d33"
>   SRC_URI[sha256sum] = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI += " \
> +	file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +	${PYTHON_PN}-nose \
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>
> 

--------------B6183F49AB99A9B9EF955F0A
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
    <blockquote type="cite" cite="mid:1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-blinker/run-ptest             |  3 &#43;&#43;&#43;
 .../python/python3-blinker_1.4.bb                | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 18 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-blinker/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-blinker/run-ptest b/meta-python/recipes-devtools/python/python3-blinker/run-ptest
new file mode 100644
index 000000000..15c3f6282
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-blinker/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh 
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
index e2f76c33d..18544b900 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
@@ -5,4 &#43;5,18 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=946d7e89af6f7733aeaebed5635d2682">&quot;file://PKG-INFO;md5=946d7e89af6f7733aeaebed5635d2682&quot;</a>
 SRC_URI[md5sum] = &quot;8b3722381f83c2813c52de3016b68d33&quot;
 SRC_URI[sha256sum] = &quot;471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;	${PYTHON_PN}-nose \
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

--------------B6183F49AB99A9B9EF955F0A--
