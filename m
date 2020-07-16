Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.89])
 by mx.groups.io with SMTP id smtpd.web11.21573.1594922702761157650
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 11:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WBPs4qO3;
 spf=pass (domain: windriver.com, ip: 40.107.75.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdiHgXHr3AlHHWDOyt3JF/LGgtlHbtbUSJ+OjU9rqku9sGBHE7et0ZBl9tagbk2kNLxsZ3qNU9IXM7CV8lW5vMc7Kcp2VVn+owuwPGVd/0btDcyh8ttwvn1cRxKSHMAEmMxAsYb7dMjREeESgdMDy4u8c0BJUDVmX1TB9DhoRCWf3XqKmHVwpB0pllMcAlmbQiDXjB4sR2EPMq6zPI6ItE8p3DVsFISMixGsmlUyAZ15ybzxK2ReygugKYeKP9SIkA6e79Lmmc8E9Pp2QhB7nmtaW9E8QWv5lsYRhPhW0/ddlVtOF2e30jddVWJhvDigFtkB12NLoc+lfgs4MbloMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poFblaTpe16MwFmh6DFakT3i6qlwjDDagQRWMl7hnMk=;
 b=WAB94HAB2t/Mvu4+i64XqeoybWEMiVW7B90RPiRmqZ0q63m3NkOV5Dqu/0vLpyJU/lpfBqsdI7eM8bdzfkLCz/GxwM3/5TaTwPZb9VL1KvYMcJP6d4oNDI37PP1bofpwOpV9+6AK7P47VBTa9xvp7Z7zIw39jasYzlABtu/K4eB7jDteSHCTHrkfyRwYO1Bzuex444ZROx/ON5S2dX4Mr1amIMGtDiEoRs0lujsCg2K6zzhnpNAdm9d+Y64WLOSe8dWSFAjC4C2TfNp5BmEMdMonaEEZajsGNkWCVifblmqu6y9WlxRhxeB49xXsm/68WlUg49n/JFcar5lExvL7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poFblaTpe16MwFmh6DFakT3i6qlwjDDagQRWMl7hnMk=;
 b=WBPs4qO3BCRNO7uabh8ujJxnhppdUA4WOVvhuRjYOIhMWJbIV78Ck8fxIe3xbUn8ReKmbm0dZGLqUgRsq+HbRZe/WXZuB0Whr1LhYNjFfHeRrxWRm62bYj5Hd7T/5jfIQSoliuEz7Kgf0f7sA+vO/Mbz15bCWDh9yI65UYnIAC8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0008.namprd11.prod.outlook.com (2603:10b6:910:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 16 Jul
 2020 18:05:01 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 18:05:01 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-requests-file: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a6b832c1-4e11-516d-cb17-ebe6f467ea16@windriver.com>
Date: Thu, 16 Jul 2020 14:04:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::35) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 18:05:01 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 816c1684-0800-494c-ff04-08d829b2c24b
X-MS-TrafficTypeDiagnostic: CY4PR11MB0008:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB0008D04DCC37F54F46F19B5C9F7F0@CY4PR11MB0008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hi9RYoUIWPTV7Oqu1DJai+ydbPIFx7WUcMhTwrNegxgPqA5Eqxs3/u5PP7U3GxJ5jgcHDTCBJNUidS7WEcEYhcMjWcggn4xT1/gd2MlY4spy0zXhwmfFpypWAOh552ioGaz3x7QabAxhSRhfgZEYPzc26v6ATi7k2IKFhminBcQ0BEIIFqKtjzO1+KTWTcHH0oY0tIqxqYj2pqI8wN7ixmJojTvaXOjkqRs0/IN+zhhb3GVGxGuVMh/C27gjbHex7CtOuF9W2Dn7uZEMuj9fNg9GgJ3Vmuvyta5B8xc6MGKacfClpf/OOJwzZGCBs/qyxnj4wXsu9T78wgzrukiLs/WpKI6ThI0QsTugKW/lgKR0KGtm537d+P91K1wVk/FQOjJ6CuU56DRneulWvw3LE/8VRwX84D1xJpTY/cp0iOPVuC/GZJbsCN+4ZUDAx0d3IKR79GuLVlRG/FfwMXF8OQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39850400004)(136003)(396003)(346002)(376002)(26005)(966005)(44832011)(186003)(16526019)(8936002)(86362001)(31696002)(33964004)(5660300002)(2906002)(53546011)(52116002)(316002)(66946007)(478600001)(83380400001)(166002)(8676002)(31686004)(6486002)(956004)(66556008)(16576012)(36756003)(2616005)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	aDXbdkU/kZ/swffW6MBuQoL9izne3dJMI1u6wem18AsQxqOR56wIU4WX9z05szoToAf2WaMd7g1Yf+e22njykWegk6gutnvqEvOPi9nLu64mf7KXgYFwb0u44/2nBKV89okU78hgieUhp3zPOXenWhV0lWBTalV6ABv+GFbARJDK/EB7eREI81c7QMcXxtQC6SXrj048Kh/HYg7aNCsMgZvdceTQVp3DtUIRetDYu1G/UlIc2/fRl2x2DLVDMMVx6nGUyN+a/ehG8yyTSR39GRiKfTtGInTPJfNe7emhBViW2p1drK4ZKfJ3U/unMucbjYrMcsJfgYy0zNhSFGgrdrwDeK+wvu2jxcg/8RRoYrPuiGJyNl+O2XPYBpLyLnPU2B1ioDFdGAgSZB+v91SfR11uVnbc+p4qdULTQonRMHt3eptoAxOlD83Z66oAVrNQlnu12Rcq7vN/U1ZWBT7WRj2DnLYI9YxoBxsMRJ3kGdOp4upLRxuylydJ5vs58h3H
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816c1684-0800-494c-ff04-08d829b2c24b
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 18:05:01.4422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvHnZrOx0l/f4cbSXRDCdzOZnHek7fWlQIaCnYMEfuVpTbI7ae3WYsZx3OaI19One+QRfPZtdD6XFtNqJt+ZDgo6u1ZgqHzIyFBYFbKwfGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0008
Content-Type: multipart/alternative;
 boundary="------------C7DF0C50FE580856FC153260"
Content-Language: en-US

--------------C7DF0C50FE580856FC153260
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/16/20 3:43 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-requests-file/run-ptest        |  3 +++
>   .../python/python3-requests-file_1.5.1.bb         | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-requests-file/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests-file/run-ptest b/meta-python/recipes-devtools/python/python3-requests-file/run-ptest
> new file mode 100644
> index 0000000000..b63c4de0d9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-requests-file/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
> index 1c8bba40dd..88915b8fb4 100644
> --- a/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
> @@ -6,7 +6,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b"
>   SRC_URI[md5sum] = "c96daf6b0c56687556e8a52748fd896c"
>   SRC_URI[sha256sum] = "07d74208d3389d01c38ab89ef403af0cfec63957d53a0081d8eca738d0247d8e"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
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
> +        install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>   
>   RDEPENDS_${PN} += " \
>       python3-requests \
>
> 

--------------C7DF0C50FE580856FC153260
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
    <blockquote type="cite" cite="mid:1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-requests-file/run-ptest        |  3 &#43;&#43;&#43;
 .../python/python3-requests-file_1.5.1.bb         | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-file/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-requests-file/run-ptest b/meta-python/recipes-devtools/python/python3-requests-file/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-requests-file/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
index 1c8bba40dd..88915b8fb4 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
@@ -6,7 &#43;6,20 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b">&quot;file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b&quot;</a>
 SRC_URI[md5sum] = &quot;c96daf6b0c56687556e8a52748fd896c&quot;
 SRC_URI[sha256sum] = &quot;07d74208d3389d01c38ab89ef403af0cfec63957d53a0081d8eca738d0247d8e&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
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
&#43;        install -d ${D}${PTEST_PATH}/tests
&#43;        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
 
 RDEPENDS_${PN} &#43;= &quot; \
     python3-requests \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C7DF0C50FE580856FC153260--
