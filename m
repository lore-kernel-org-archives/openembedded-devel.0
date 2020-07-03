Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.88])
 by mx.groups.io with SMTP id smtpd.web10.10859.1593785033762787681
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HcLQn5pU;
 spf=pass (domain: windriver.com, ip: 40.107.92.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZctiSWz0iskbdqbAci+lsZh6iSmnTGNQPWP26EGxNAO0Fuhmbo4pBytMYfCYwZZfp0DxtpbrG+7lhD5lH2VZznHnpdXxJk0TvbaJOQZ39auXPDqQNBzU0TDL6jo7pLIBRvBRqlP1FxyIFFvVG8HYcoJgbtIfF6SBeWO/fCSAoaBwIue94SAt9cGrf/3rO85BOEBWOCaMTk9hYHLJGaoQyRxfNZOSwv5EAWbzWlmJ4MWCU20OSJZuBPHdl4wIFtR4WXFeir2uHCWyBlj2gP/jYH6OQNfi1DsQSOFrDy1o023XPI1Q9sevhMiaEMD1GSGmS9smYY8s/pB0Z6fOIaHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFA//Xtpj4tuxFmdqjpJXL1TWFxlNBkO4Io/iB4sudE=;
 b=YcjvxT8KhOe4u4bd0E/cROaC8EZmQD76nQOFZ4OyhMyzad7YxCDLqWtONhl/iBNNO4TbHtAh03WDR1g9YOc4JDhCUXLhP1z3huSaOjH7Cxg0s+lVkGnuzefBl5oDUEwKf2hsAkdZyDoLYgBKDFrwXapBnLpCMl28BcV3YRUC0wQgRlM96Yw18kPn5cNC40MZkxZz8Mn4/sZvNpmykKFFQP7EWdaF8RE2ezGu79d7WZbs70Zi3s4Y5cKD2uIH+N5pGY6bGoNVSOLWFzStmSgqWsaAN+4QoM06v6sVEOFaIfMfPS/cDK62B0q1Wichsj0GIcDrk3vPrgoM67KHCDPPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFA//Xtpj4tuxFmdqjpJXL1TWFxlNBkO4Io/iB4sudE=;
 b=HcLQn5pUblTDq/PCCJ5SfvtG3TkkPekgAyGREYLPSiGbcAWMFmzEf7neEO+jnnzZVISAlCsj3eTtAMDlrN8trdtkHN5wFF4sshkKDbJIoP4+Dqm0tvuRKu5SSf74pOeckddTbGEQkhfvs9RfF8MwpyCQSpgH9d0DZNl6AlR4Wp4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Fri, 3 Jul 2020 14:03:52 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:03:52 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-cbor2: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1593479853-4475-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1019a52f-90f4-8748-764d-b0e72e1547d5@windriver.com>
Date: Fri, 3 Jul 2020 10:03:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593479853-4475-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Fri, 3 Jul 2020 14:03:52 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4503ec9-6697-418b-6a34-08d81f59eaa5
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB36284AC7A2F5197954E794EE9F6A0@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3kVdGymc/rHySiUcx8oJKrT6xc5VsiHS1+bJEW5amdFQ4CLyJq3k+pR0uSd0Nxul02IipH8x+IuErCjGPkhhir+YmynUmqv+xiRksjaWuJAjEXrHW5CmzDvFOJRBLzyUlIzBGmDKyMtcHKwPQn5dZ1ER46AFPLDmOcm5YymhZ2g7ZQ6VeAKKSl0KUyH94L7T3B4J2sUDNSuRRT6DBidQ/1mAlw7BPjB7QV2FMq0vUYKkk9dMREB0nRH5UptMryehzH5hOYhO0wSJaYlaHi2IZBoXtSqjazEnTKxey4UWdYe1Ey80JAeuH9aDsJc6o7UJ0vgA5pktdmq8B8JgsFED3xdY7gDpaVTRV3MPbcDB12k7U9FsKkfTgbKD/c+D5Aq36+lYEB5jrKz+aHXA41bC17qIbFSRvaj0AwoH9w0t6fWm0XcaewVNYlNBCVGXPDuqaAB+Wp5mYNpGxZTqLnTESQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(366004)(376002)(346002)(186003)(2906002)(966005)(52116002)(86362001)(16526019)(5660300002)(31686004)(316002)(66946007)(2616005)(66556008)(956004)(478600001)(66476007)(36756003)(26005)(8676002)(44832011)(53546011)(6486002)(16576012)(8936002)(31696002)(83380400001)(33964004)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	wtlE2KGEUUd4EGxFtMRwcDFSqMIP0Epc2eVi8Z2muPIhh1T02a1f3Q48nw9jtMk0M+mIEY3Zfwt3Dpz3H2No3H0bLAbCO5ITnRI28Y3FT7cW+akI4wnVJfIQM4o4v4TeiQYvJLFY+NSjv4+B8nW2fM3WPtq5xyDajOlsOn6KEPhnpLWyE/X7R5HpA7y2qHoEYoryHsePBLB/kYIZENK2e5JIhzxr8AgaKMuwGQeZ/dyKvsTDoaDcsWKr/p42isK4/YKkq8l3c5QXg7A0TEne+Mci3mhbZ2jl9tijjYsP5IwXkxNc7kPnTTmS1tOB+gXZeNdjwIb143Xd7eKmA369ot5hTJCowqQ9B9JtxYgAxPdyVUtxBEjf6VOE9SWXPQUGOGkCW7VELNBqgxOKZBRErqef5g9iVDnyjq+qakOCD+HjUyxOsQxumg5T8Mav6R3PbUHDD9n2QPpI0jTn8LQPccOTfUHWmKDcxVUJ5XnQH78=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4503ec9-6697-418b-6a34-08d81f59eaa5
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:03:52.4463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVmeVy2Bt9XQSW2Os7suDv4OHRxO0DPA6bsS9+ESdk64rIr9EAdKjv1evmXlVIhyQoGIwAbZ0iJFY6CbCIHk9qeowXUXzjnm5aKXxl7lQwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
Content-Type: multipart/alternative;
 boundary="------------F4D90AC26A491D81CDAD7CF5"
Content-Language: en-US

--------------F4D90AC26A491D81CDAD7CF5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 9:17 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-cbor2/run-ptest               |  3 +++
>   .../python/python3-cbor2_5.1.0.bb                | 16 +++++++++++++++-
>   2 files changed, 18 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-cbor2/run-ptest b/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
> index b42516b7d..812539941 100644
> --- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
> @@ -6,7 +6,21 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
>   
>   SRC_URI[sha256sum] = "43ce11e8c2fe4971d386d1a60cf83bfa0a4a667b97668ba76acbf5e6398821aa"
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
> +       ${PYTHON_PN}-unixadmin \
> +"
> +
> +do_install_ptest() {
> +      install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>   
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-datetime \
>
> 

--------------F4D90AC26A491D81CDAD7CF5
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
    <blockquote type="cite" cite="mid:1593479853-4475-2-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593479853-4475-2-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-cbor2/run-ptest               |  3 &#43;&#43;&#43;
 .../python/python3-cbor2_5.1.0.bb                | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 18 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-cbor2/run-ptest b/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
index b42516b7d..812539941 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
@@ -6,7 &#43;6,21 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7caSRC_URI[sha256sum]=">&quot;file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 SRC_URI[sha256sum] = &quot;</a>43ce11e8c2fe4971d386d1a60cf83bfa0a4a667b97668ba76acbf5e6398821aa&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;       ${PYTHON_PN}-pytest \
&#43;       ${PYTHON_PN}-unixadmin \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;      install -d ${D}${PTEST_PATH}/tests
&#43;        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
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

--------------F4D90AC26A491D81CDAD7CF5--
