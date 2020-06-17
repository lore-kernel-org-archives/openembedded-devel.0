Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.74])
 by mx.groups.io with SMTP id smtpd.web12.9267.1592405100365724917
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 07:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WLvijx63;
 spf=pass (domain: windriver.com, ip: 40.107.76.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTKAFROogw1PuXFXvANt870w4p3frkxgaoS995gIJnZXDn5ut9kq6Dq32JZl2NMLcOV3fE+TOheHmP8O5iiBxN8BrHuKrL1vJKFHPgTRKH81zKeOXxz3/AI8McMHR/bbnQMx1QK9o4pH7+TC5qzdUut7geKlhjzJSEbF3qaynNsI4aIZyLZZ4Gk6BmL7/QIxxuJH5JQO4AYPq/2equlOFYLS+IKDe+mIkqk5qS97WTPi+vrgJhCfLVPliMI9y8596GbFAcj5atTxEit1MV/2M5bj97ttZGTMsCDAp+PaMoMXRa7o4ulBVgRkKFP8TWwlH2NE9CRSZV2lwPQk7VGrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIbagVo54mALsglU5aAng1pbnGRlvyUbP8lWeTL0/Jc=;
 b=gZFsETHgD1Sv0OrZS9WAUrr9a36WwEFu+cE5Tvx5WZuX9aYu3wNz60ojEEetwZQo3RuOxJv7FJDMzyMi8imvmAmRwrgxYsW3NOi+u6X3yHYQsnhphiz8/MvE31LoxJlr4pNVOC/oHBW2KUJaWMHLJqviywbHI351q+mBMIpz6WqPG38ux+24AWc+TROqMskz4/ymlufCrOh31N4IylK7DmJ/Wgy5fTRwkf+4kNV2tjvo+58SEVNz3c7aOJV7y5HJJvBx8+uBYJBcvDdl0aME319NFNIPQ4mTREO+60Sw2MDhulzOGtd2KuMohPcFdZKLgM/96NjMGbMlRqijiDKwwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIbagVo54mALsglU5aAng1pbnGRlvyUbP8lWeTL0/Jc=;
 b=WLvijx63j9zFhpMw5ehT1QfBFJIrx/vDWNKy22TmOYUwhKZihArcDKaJsQj6E1Tj/sx1UHCv0ywYrPUE5q2ADDfpDFvsMQQwIkltHrSUxT4R0MAzUwiFvuVj/ab7OPYnXIYZ5OCs3TG1HFW06LPdWgqbITO/i95rVK5E+v2NlfU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1875.namprd11.prod.outlook.com (2603:10b6:404:104::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 14:44:59 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 14:44:59 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-iso3166: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1592231949-4111-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <90858845-64d2-e981-3de9-4296c732965d@windriver.com>
Date: Wed, 17 Jun 2020 10:44:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1592231949-4111-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::29) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 14:44:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f62a7286-c37a-429e-9664-08d812cd023b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1875:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1875B07AC483C4D5F3A33DE09F9A0@BN6PR11MB1875.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B1VFwuKxtBDjvvIHPWMKYBduwxu+Ztw1Ps7ib1ib5Bw3Ickmr60p4G8GMCGttet4r+6EgJoD632RZUmTy03Fl21XqwDmj+ev6RkpnRbOjbIoePPOWvbI7GERRV75JcnyDRpcwhNCqBAX52BkB36Z+4VlEEbjaCl3QNXjNJNS3Y0EnfdYIhwVxL1f3REtW77Kw700vTZeuUhns2CsF0A0HO31qGQ4drbE6ci14pJIbbuT7Jcw6OOCC4ssvy10feljEUNhVTZ4wPheNACgFyWXnfG/a4kMXfIN8G5pBAmoEfGtqxhgfdJ2KTSfILoL0w+4EW+iyTMtHZgiiPyTEHS6zh0AUse9eLKAUP6qBvHefx185TbHgPIh9zaVLi58+12irRD8hmv+lmemxva+Gk/E8LM2VpZQIlikl0aD1+Ni6LZ8o8vJVzUEqXR8Orr1WnUshiMYjYX96pBDqw/rHA0i6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(396003)(136003)(346002)(39850400004)(2906002)(26005)(966005)(16526019)(66476007)(66556008)(186003)(52116002)(66946007)(5660300002)(316002)(16576012)(53546011)(478600001)(44832011)(6486002)(33964004)(956004)(2616005)(166002)(8936002)(31686004)(86362001)(31696002)(8676002)(83380400001)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Zz99JWEPO0hztQOAGLpRMzkBJFvcnU3ZZqvUNW3ZD7hp3nJHwI5P6Dhxar77f6KiRWwDaZGZ4XxgKW8vRHt45qC242pERVC+RTwGFaAk6WBGClpedhyv1SV/DSo6BLNBv8UCbF212QG0M/DvJ40uTdx6Isbhs9EQ3/CwpW2eNzuXU4LRnHGF9iAfvNKm0sYxMtxhTpHN4U5eZ7cGApHTgLDWLYgN7d07DHyvzyGnIR9Kb3Qr3lU8ocJR0bYDLOzr6KTUZCgW3VxYFLGoNv6g5EODR/pd4ayn+PILep13PXaSh2h6Q3S4oPYqnUh76fcKTn+XaVNi0XA4ao5uIlgEEJl2NopwHn66pwbV3WwrCS1k/P7Pi1A4DVKpLBaTviM+v49TF4DrfuHt36wnZ3OORqwO5DEiEGnKOuBO/bIsy1oDDQajCGimevoRUm/900EW/obDBzs4EOG6Y7tGSK5lfFdptpWTe2DoE6cMylhXxB8Yxlg0N6IOxzgAL9kApVk1
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62a7286-c37a-429e-9664-08d812cd023b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 14:44:58.9302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJEZXVeSNKVxRihED1AArLp+wXtdaTsCJcFH5/JCFoVJZdawVo0ZYdqWlRnMcB5mGkDMNB8b2QF7V2uer7X5yu0jqi/PRdI6GsyJPz+qDHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1875
Content-Type: multipart/alternative;
 boundary="------------5466F5B9B02DB77BA4122BCF"
Content-Language: en-US

--------------5466F5B9B02DB77BA4122BCF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 10:39 AM, zangrc wrote:
> -Consolidate into a single file.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-iso3166/run-ptest              |  3 +++
>   .../python/python3-iso3166_1.0.1.bb               | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-iso3166/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-iso3166/run-ptest b/meta-python/recipes-devtools/python/python3-iso3166/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-iso3166/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb b/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb
> index 23fc4eb75..36f9c911b 100644
> --- a/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb
> @@ -6,7 +6,20 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5e2f4edc7e7408a82e4a1d05f229b695"
>   SRC_URI[md5sum] = "53c313c7ae8721e40ddd5e7a01bbcb7e"
>   SRC_URI[sha256sum] = "b1e58dbcf50fbb2c9c418ec7a6057f0cdb30b8f822ac852f72e71ba769dae8c5"
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
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>   
>   RDEPENDS_${PN} += "python3-numbers"
>   
>
> 

--------------5466F5B9B02DB77BA4122BCF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 10:39 AM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1592231949-4111-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">-Consolidate into a single file.

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1592231949-4111-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-iso3166/run-ptest              |  3 &#43;&#43;&#43;
 .../python/python3-iso3166_1.0.1.bb               | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-iso3166/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-iso3166/run-ptest b/meta-python/recipes-devtools/python/python3-iso3166/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-iso3166/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb b/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb
index 23fc4eb75..36f9c911b 100644
--- a/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb
@@ -6,7 &#43;6,20 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=5e2f4edc7e7408a82e4a1d05f229b695">&quot;file://LICENSE.txt;md5=5e2f4edc7e7408a82e4a1d05f229b695&quot;</a>
 SRC_URI[md5sum] = &quot;53c313c7ae8721e40ddd5e7a01bbcb7e&quot;
 SRC_URI[sha256sum] = &quot;b1e58dbcf50fbb2c9c418ec7a6057f0cdb30b8f822ac852f72e71ba769dae8c5&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	install -d ${D}${PTEST_PATH}/tests
&#43;	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
 
 RDEPENDS_${PN} &#43;= &quot;python3-numbers&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5466F5B9B02DB77BA4122BCF--
