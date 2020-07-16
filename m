Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.57])
 by mx.groups.io with SMTP id smtpd.web12.21475.1594922768531308732
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 11:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XsAHECJj;
 spf=pass (domain: windriver.com, ip: 40.107.75.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvRyWo4U2U8YNYo8oaZ6Hx+0RhE1jSEIG9VDwuFG+943+lvZA4i5ZEntx/Fnja3XaLJhBDDW+JVnkZXkbOHmIGLqmu0gg72QYqW5vDD5CYCO1Oz+bHDRr6hMeQ7D/5UPlwaIDnMYSz6C29DnkzPpql3vljoiXNGFymRSoewIKP+BEjLfqp19U+Pw92dRu9oXKCyt2++agyiex1ceYBcV5CME9P6GV8BqvyGs8cnYJQxhweR9sfgGgm9Satn3J1wWw56l0asT2l/tv0DVU9K3Pq9/7yT5k1vUTdTAbyV5QCJlfV5Htg4ABNCCM08v0iC1ByXyiRu++/isQ/Yowqs9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBleLZrfJXMD97AXZdAs3y7lxpaN+fmFtc0lda9gOoE=;
 b=Q+zVb4rmGUV+M1h//Oxre8QHplQvfyX/sDXE0okoImLq+Qo8E/jQZ2wEBYSSaZh1vQfH5VMjOinY8pLzsdYWelCMMw/p4QI8u/jaowaAFov6Pqa25HR2eyqjFd5flJbmLv2UBpVwoaYH6rGwumeVUo5FCVNzbPpbDMxKEN8ZGoW6sLSxHvi0G3ZLEKUSXVAZOpIMob2sUQ8vU0b8RmM1lQ6Y2JqS/my+ZrjezLb70E2gW7GC1nBkK2syJNxekTFg0oJt32RYfNY6o2HJU3kCboB3J0SK9Pc/sGHVnwhB0X0JiG8CXuV1X+i1ZBD49lr8vq1NAiEMojK0YpJKCR1Y1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBleLZrfJXMD97AXZdAs3y7lxpaN+fmFtc0lda9gOoE=;
 b=XsAHECJjzMb5NQ0P81TjgLx11eqMW/efL3Hz2SEw0cJ1w3ETMMS0g42vAPCEw7v8MJWygsb3aCC/1r6DJqLo4NM9WQBlMtITVlYW5y2kMH3DatU1KdH+6AIJ3w4P+8lpzwib5oTL7QQite/bvn4dTpEBQrTdN3fTy5afpuJ/Gd0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0008.namprd11.prod.outlook.com (2603:10b6:910:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 16 Jul
 2020 18:06:07 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 18:06:07 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-typeguard: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594928600-4618-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2508266a-a97f-d67d-4aea-2e2adcb6c853@windriver.com>
Date: Thu, 16 Jul 2020 14:06:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1594928600-4618-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::24) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 18:06:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 052caf6a-c7fb-47dc-7e20-08d829b2e97d
X-MS-TrafficTypeDiagnostic: CY4PR11MB0008:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB0008456D0C62E48D53D592BB9F7F0@CY4PR11MB0008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hkgkz3iU3RESnOCt6PuQeDIcVTbdBVbFNxzl/UPNkqCExnmRr/eJoSqM3dsNFoveAKrHBFrV2DijphLbFkwtgeKcdiFkQaQ5mMQwkakINlDCT2X/bzQjLcECf4ASo/l5UKHR013UQ2qdGD3rpCnjH9T1vdvtB4Hw7xzsEi2iU9qRdEJ72WC8zSFLAqHYewZcr9ydMkyli53mTIyVRhYAIsZJe7+9iIFFv5OlW1d+1+AP56lQsoXQGgXRgofzxJw7hmO9W+sm3cEtCBHaRWhuCHhV33YIW16MQ8ZsbYCS5omAmLO269/vmJ2HhunJdPAIzXiPoe/MSctSKu/HyGxjQ7D6Q7HHM5fbIsdpBRNbicm8+7Z2MRzYr/uMvK1A01W0+r/g8+M0c6A1G1qf5+JqIKcUPcwZSET2VnquoQYi01/5m4m0d5rkuHcOSORPDv5SGUqRILM4iclHINqkTbmnoQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39850400004)(136003)(396003)(346002)(376002)(26005)(966005)(44832011)(186003)(16526019)(8936002)(86362001)(31696002)(33964004)(5660300002)(2906002)(53546011)(52116002)(316002)(66946007)(478600001)(83380400001)(166002)(8676002)(31686004)(6486002)(956004)(66556008)(16576012)(36756003)(2616005)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jnFAv+1YeasLfWY9SPbhX0AwgmBCsNmmd9Dh1VV3sCDOo/dCysBFb3KS9uJWDCmYHiThLho8di3jUaTboo6XUXt+gU4Cg2ymrsKPb80bKnfYRVHF+QymzrKndBYdXH9XVRjQUBPXom2VLN6gS9wZeQFT10N2Br8C/DZxTmS9uBE73y1EJneDbhsf/r95NoLsYaGLr8iSBMrM6TUbgzUfLmbH4Cpd5Rwc2bZa8gcCka2wUeRwYUzvGTyOjUyyXcKaM0lxk+PjNrh1wIbTzgYeo242MAYxWu+XIv+oigD8GVXz4GsYSZN59YtENyM7K0rYqDaowwINlA/dH7JGuWJfpcI+uKwmzzQ8adQolovQFSrukbn37mQR0F9CKzSEjF4f0m9Cvewf5jwOJkgxHapaSKcXwBVumg6LodWdYgEpkOtR1Y5BneEmacT8Qgbtl7CfQ9JUXq+BuFfhKnN044BA66HZt8vfWaYxmDH/yMzeM26RMDrhUm0mJp/inWwghsol
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 052caf6a-c7fb-47dc-7e20-08d829b2e97d
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 18:06:07.2037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luuxXmXVYAF+IrjORm3Gfvkbqhs9f/WsJMqXc0JSQDPpZ6Rni1EX7H0SjekVlvYvThy8B0pIJI9/hdKCloemUoYILvKG/+xpEzQBA8nHXnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0008
Content-Type: multipart/alternative;
 boundary="------------25EDFFF289F812D0C9F6324F"
Content-Language: en-US

--------------25EDFFF289F812D0C9F6324F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/16/20 3:43 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-typeguard/run-ptest          |  3 +++
>   .../python/python3-typeguard_2.9.1.bb           | 17 ++++++++++++++++-
>   2 files changed, 19 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-typeguard/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-typeguard/run-ptest b/meta-python/recipes-devtools/python/python3-typeguard/run-ptest
> new file mode 100644
> index 0000000000..b63c4de0d9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-typeguard/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
> index a0167cf03b..3786ccb855 100644
> --- a/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
> @@ -6,7 +6,22 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
>   SRC_URI[md5sum] = "411df8eefd76ffa014328a46342bdf38"
>   SRC_URI[sha256sum] = "529ef3d88189cc457f4340388028412f71be8091c2c943465146d4170fb67288"
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
> +        ${PYTHON_PN}-typing-extensions \
> +        ${PYTHON_PN}-unixadmin \
> +"
> +
> +do_install_ptest() {
> +        install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>   
>   DEPENDS += "\
>       python3-distutils-extra-native \
>
> 

--------------25EDFFF289F812D0C9F6324F
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
    <blockquote type="cite" cite="mid:1594928600-4618-5-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1594928600-4618-5-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-typeguard/run-ptest          |  3 &#43;&#43;&#43;
 .../python/python3-typeguard_2.9.1.bb           | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 19 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-typeguard/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-typeguard/run-ptest b/meta-python/recipes-devtools/python/python3-typeguard/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-typeguard/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
index a0167cf03b..3786ccb855 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
@@ -6,7 &#43;6,22 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53">&quot;file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53&quot;</a>
 SRC_URI[md5sum] = &quot;411df8eefd76ffa014328a46342bdf38&quot;
 SRC_URI[sha256sum] = &quot;529ef3d88189cc457f4340388028412f71be8091c2c943465146d4170fb67288&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;        ${PYTHON_PN}-pytest \
&#43;        ${PYTHON_PN}-typing-extensions \
&#43;        ${PYTHON_PN}-unixadmin \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;        install -d ${D}${PTEST_PATH}/tests
&#43;        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
 
 DEPENDS &#43;= &quot;\
     python3-distutils-extra-native \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------25EDFFF289F812D0C9F6324F--
