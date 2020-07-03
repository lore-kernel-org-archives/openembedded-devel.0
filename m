Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.66])
 by mx.groups.io with SMTP id smtpd.web12.10918.1593785046530327662
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DKt8TfpA;
 spf=pass (domain: windriver.com, ip: 40.107.92.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsP9kgzlAMVg4fes2ThgB4yx8lrc6rvPWLlmKyr7axPJnqDgIuKh1BUc4OhbgJB/GVIbVYiVATYHbqu32exQifSrWG+oOf8A+rYBCuFss3/71lOeRhTFEIJIJFRXMYk0LfGcmXIHg1MHm3B8+5GCZnokxVnh730dfNXDQU9xcNoEUKXwNzHxKzpnm0t3q11Li/L6UJEHku46krejXhDo5eNnaC8/JVeVmc9/auB162hxrc9pueFQrhEWEbMDklc2IfAuB336uKmB5TOxy5KjjCOp0FbHBu1WIHpop6l0zKoe/oz6Wk7KrshGyW05ZvN36/fSx3sysPL4ql+U5jxi0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CWoKvuexylfxeZOVO8ps2ceF7/pu5xToe5R9QU7GBs=;
 b=j/3G79I4ngSOpimZmzulP7e1WZOEVCnidqrPkQ+64WQuOkMttLf8Q8txy9/gIxLZXPK9cLIjm7gTlL7VxsuM1iAk6+CkdJWmc/i8w7jpDmO6ag/fSZqDvKskSqyyObrt73POZrp0jiOiPyfdt0KpCv7tcLFv3XqhEDvtIjYxvTkZ80VPZgRY3RS7SzIM+TnM3PgbdMpnk7tEj4jNel0B4F0v0nxBq/2k7t1PF3FHBSJOFdPVzgPzrgLQaNDmBmDVA4WNSRs6rOQMER4B7APlN7RDDCZJeIOA4lOmPIUAwq+XLr6ZyQ8WU+i9IYuHMOtpcNIypeB5f1LETAzD/RFzxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CWoKvuexylfxeZOVO8ps2ceF7/pu5xToe5R9QU7GBs=;
 b=DKt8TfpANWPhKhng3PY3Ao3ukRFf5Wv6m/v0203i7LpezQ0GZu5oosKqoOgiPn7y2Yl5TgYgGuQ/y9v61+iME2TLOn9QTwU5UXGdQwLR1IZM0xFwLjOSNKPdn7tOCTqSam9LtKmI2+g/pBrh0KA7aK+Y7I1UODdsLBodrJFDfdU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Fri, 3 Jul 2020 14:04:05 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:04:04 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-click: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1593479853-4475-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <856dc96c-deaa-8a59-cbe5-1cb785c87928@windriver.com>
Date: Fri, 3 Jul 2020 10:04:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593479853-4475-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::39) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 14:04:03 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bb62ff1-08d1-4298-19d1-08d81f59f180
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB362846C5296AF8AF2E23FC6C9F6A0@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uLuGMXEnQK4wXZZxMx0QuJ/XXvazFEFocrH7Dvqc0Y7/OidWK7rkX4tCcUXOJwYRp1oGmobQ6lmtFTsQSjG2WobrJTEsvpI7wcFBMzOfMVO6SnDd4LWBALs4AUr/N6UgD5F7P6Znklo0hBKyN27sCJn3s7ztfGaLxaCgJXUyz4LQ/68XiLuzY+PBtPSxPG8SJLa3o2SqapavNGuc1U7Hkv5BqCRjO0NEAAnOz2DCGyRAmlRsz5KJi5V2JEbDyI0glxxwNFTfEKkeUj4RiE41JJfNGzxKkEbREiKDdrX/KQKMlm8H9K+9VXpCpcnujl7wKlzvmhVRb6nzjOBcu72I2Du0bgBnERuI363TlrBmpd75UZvtweS8Vlep8zEvaGfLXFt/oOQiuAhOAmaTPo21aDwiZc58SjIuLaNi2oQ2xfeNSMcm/xksGVefk4myHa9//2FM2EpH7JcI2vV6wZFj2w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(366004)(376002)(346002)(186003)(2906002)(966005)(52116002)(86362001)(16526019)(5660300002)(31686004)(316002)(66946007)(2616005)(66556008)(956004)(478600001)(66476007)(36756003)(26005)(8676002)(44832011)(53546011)(6486002)(16576012)(8936002)(31696002)(83380400001)(33964004)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vrpXYeIxBaqIY1QfMlS0al6F0lPPSJOxZpP2F6Muoqe047N75Xa2ytbZryTmK5I/MVkz+G/ZrcircNPETd9SvPaBXqWqCfQ7Z/k44kjkgF0K7U4MnzgmP3R19j9llkFzudf4KJWo8WAZli1f7K8GoNPNh/tqm0yyLHAcR9sD7QYeotEg01ayaqoCdlWZafu8Ov8t22O2So3G+xJzMcuuwFo+eU5S1Vv9sQnPv1A+XuusNXIFDeTlENd6UteNqRRipw+6Riv8/S2mmgcLvnGC/OFaa8ghjf0QVUaAnOBLztc3Lf26SfnNqGvsxoFcD2oqlSabBBbMgjvr63NZko2wNOZwpfPOalxFjFay2BjNX2n8RGoQ92XI5a9AE1GG3udKdokjWVbtc/8+vNz1OwPtsficCBf7hxDtJ4xxqeZZV3805gY5Mso0dMwUxhU5pZlUaT6E7zbJXzI2o74Aj/VET0zV6OmbU4n07WLf3GryCDo=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb62ff1-08d1-4298-19d1-08d81f59f180
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:04:03.9288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJdQKnsp9Fr9eeDDfcOEzmrA6ciWO5mkcGZEk4UC0GyIQo08Tkk43ihDZbz0plG79JQICysog5gKwvH53e0uMnBfIh96vx2PRx1ewzlC8/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
Content-Type: multipart/alternative;
 boundary="------------97033F66C1E8BD8E96EAF9E5"
Content-Language: en-US

--------------97033F66C1E8BD8E96EAF9E5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 9:17 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-click/run-ptest              |  3 +++
>   .../python/python3-click_7.1.2.bb               | 17 ++++++++++++++++-
>   2 files changed, 19 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-click/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-click/run-ptest b/meta-python/recipes-devtools/python/python3-click/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-click/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-click_7.1.2.bb b/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
> index fa29d11ab..0b513e7cb 100644
> --- a/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
> @@ -11,7 +11,22 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
>   SRC_URI[md5sum] = "53692f62cb99a1a10c59248f1776d9c0"
>   SRC_URI[sha256sum] = "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
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
> +	${PYTHON_PN}-terminal \
> +	${PYTHON_PN}-unixadmin \
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>   
>   UPSTREAM_CHECK_REGEX = "click/(?P<pver>\d+(\.\d+)+)/"
>   
>
> 

--------------97033F66C1E8BD8E96EAF9E5
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
    <blockquote type="cite" cite="mid:1593479853-4475-3-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593479853-4475-3-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-click/run-ptest              |  3 &#43;&#43;&#43;
 .../python/python3-click_7.1.2.bb               | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 19 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-click/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-click/run-ptest b/meta-python/recipes-devtools/python/python3-click/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-click/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-click_7.1.2.bb b/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
index fa29d11ab..0b513e7cb 100644
--- a/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
@@ -11,7 &#43;11,22 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8">&quot;file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8&quot;</a>
 SRC_URI[md5sum] = &quot;53692f62cb99a1a10c59248f1776d9c0&quot;
 SRC_URI[sha256sum] = &quot;d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;	${PYTHON_PN}-terminal \
&#43;	${PYTHON_PN}-unixadmin \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	install -d ${D}${PTEST_PATH}/tests
&#43;	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
 
 UPSTREAM_CHECK_REGEX = &quot;click/(?P&lt;pver&gt;\d&#43;(\.\d&#43;)&#43;)/&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------97033F66C1E8BD8E96EAF9E5--
