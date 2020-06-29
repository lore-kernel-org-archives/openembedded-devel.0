Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.85])
 by mx.groups.io with SMTP id smtpd.web11.20696.1593442549283264299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=neL4qxEO;
 spf=pass (domain: windriver.com, ip: 40.107.223.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mM3pdFs2jwvK6efjpLN20fHggRSJgfrBsmxrmpvRJyWMcxdjurOFv5pzSWpmOaplxoJlXaaKaouPdqUFifvTAUlztQ5S+m6zmlKOuYQ2HCMLB4T6aLKb63gBvV13Nlt+anegDjcWKe22XsqPOE8bpXWZbrgWipgbb3B76Y+HmsLBo75xCc5fQtJwvDW3jV89EIyBENJAUt/y4Gh92o0p8xeFZZ0PGcMTaudj6j3fFZPXnUZqPXDH3+qYX9/Ca2Dv5ZoYdK/PeD7KXKo0Xrjd8idgNGfj5dk3ZWtQH5EhhclTMJS7vceVReunxC2JInYXw9vRByIyI/BU5KfQCc3OAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uvla5VMYex+CrettlZZwYypFVO/McIpuwTU7qzyJ8+8=;
 b=FXRN0soElDDNEuGmhcZZdtGcC8AeTQ/UJ8xpTF7Twsmz6YFjyrGxVmskfsA3AjFnuVUUBCjNrI/I96udHcd+EZdo5n6ZRIkIrT7y4ymMqc23Fmey6RxWmZdgNZv5wb9368wvlVwYfEGivGUwmplyuT+QAylxoLihcTJRRsHn4a6QYH00GGwhUz3d5HK8X8+P8XSfw77BOMxJ4jQz6ceyoimVQO9Mm8O/7Nya6f79meQFAG1AOYtBfYNC2VCBpOn30MpMg7BL2WG3UcbJDjawIB2E/RVK4I+YvoNjseKX9gNZA/sJM7zrR3WGqVeylK7T2dnpTMUHBfQqvnm0L7w1zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uvla5VMYex+CrettlZZwYypFVO/McIpuwTU7qzyJ8+8=;
 b=neL4qxEOJvLczMoO3CrUtcAsYGPDGBr+DiH/ywLArpr11rBaBNhxW4AaR2spz6bFSKpon1bJ6tFvR+0RaG62q7aV7E/+tzcOrmC9jtiRjgJ6wdC4Eq8rDD8Xx1xe9R/7o0frkXq5Y7xIvFyRZFqC3eX9u/rZbn9f6fm4Bxb9qBY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN7PR11MB2577.namprd11.prod.outlook.com (2603:10b6:406:b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Mon, 29 Jun
 2020 14:55:48 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:55:48 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-atomicwrites: upgrade 1.3.0 -> 1.4.0
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1593333924-4040-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6cd6b25a-1101-734f-6dd8-8a37271a2b5c@windriver.com>
Date: Mon, 29 Jun 2020 10:55:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593333924-4040-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::33) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0094.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Mon, 29 Jun 2020 14:55:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 329db0cb-455e-4f9a-f65f-08d81c3c81f3
X-MS-TrafficTypeDiagnostic: BN7PR11MB2577:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2577EEEAE48F91314D05A0469F6E0@BN7PR11MB2577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gb/N7e85r3o6Rcw7X5i3yPNuPs6H1aE0ZMAcyITxW/OZQXJycNkYociHREJvT1rAKeQxbgQiRLVh96Rfx9l2VlJCLmuWK/qP4zXhDPrda36l1arqvyaCFna5zxY5RaWsVlqzEE1yKlVTAxypJNerZgs80MxeqTkz1x0f6xSpMAM5TFSgugX6cP5pGhWP10RePltXkQWtRab6NmkSJ3iH5cnHTCRH7wON3r/DWi9O+DzIskQWBQOmEEOMMPxj+7Xq0lIRgUdDP+mOfpwD/pzutmuZZc2mlGCJ1oXpf65nc5xwCwuTkRXLtHS1jGNrCNY3QRlAUmyd0kGdEGHAMlNM9bUrtjG8ZSpFyER6UMCN/y2w8A38yIjrb5CUaAT9e4itUymiHet0k5M023MCA4GyQpASBfv+JPBvRd6WnWL8mi/x8xZHZe4AOdg49ekhn3mtuZECuNC1K22guC7tyvd8qA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39850400004)(366004)(396003)(83380400001)(66556008)(86362001)(31696002)(66476007)(166002)(16576012)(316002)(186003)(53546011)(16526019)(52116002)(8676002)(33964004)(478600001)(956004)(5660300002)(36756003)(2616005)(31686004)(6486002)(66946007)(8936002)(44832011)(966005)(26005)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	RjUBYjop0U47aQ5jM5NfveFBL0OKn/FPF6950KTrmOVigt5vdKL+Aj3Hpc8gLsH8HQn5Hw7ptK808kBbl9XNvjxWW6EHXi7h1GdV9KHmLD6pLcE3yvQtq5dT2ZFr6OlfeI6/l1Eppy6216ZXKJIxxQuaW8//HVu/GT5jG73FNyDQIOXB/c+tVMrJm/h4YHBhb5fJYnv/2m4T/8YZUen8wd67Xa95cYMxIsZb80Ux3ES/ZXQG8ea566jXnMViU5fcJHJyIPHB90OtVntUhk5sVRBP1KnW0lkfONb8Hwq+XT5/juU9UNPbCrxk0l0hXsmuUD7qBOJg6z9gut0mmtOXb10ToZyqjUUD+99rRt3mvq4Y6vpaEe9JpOgTPEgrWo9nrG2Qr9nW6yNm89wevIdmqStr0652C4GemmnEX4hlUtZHJYMZxf/NWxc6mCCXWBwW6tJL00Fiy855FZ69kNyK45FTQQobLYfpfJQja8s8ufnqGupFY3vLluEWRrFUwO9B
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329db0cb-455e-4f9a-f65f-08d81c3c81f3
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:55:48.0067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85kTY0P3wIV/4LyQ14ndc8+oJjz4QIiO9tSoPi9pPNAsfG2gjfdPnEYy8VAphtzBX/begOdyiouYd2mWtsXL25u6olif05PyRa93YaXtnhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2577
Content-Type: multipart/alternative;
 boundary="------------873867FD1802C981554A2469"
Content-Language: en-US

--------------873867FD1802C981554A2469
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/28/20 4:45 AM, zangrc wrote:
> -Enable ptest.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-atomicwrites/run-ptest     |  3 +++
>   .../python/python3-atomicwrites_1.3.0.bb      | 11 --------
>   .../python/python3-atomicwrites_1.4.0.bb      | 25 +++++++++++++++++++
>   3 files changed, 28 insertions(+), 11 deletions(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest b/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
> deleted file mode 100644
> index e43bf0884..000000000
> --- a/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -DESCRIPTION = "Powerful Python library for atomic file writes"
> -HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
> -
> -SRC_URI[md5sum] = "ce11f780a4ce0fce8a55d64494a88178"
> -SRC_URI[sha256sum] = "75a9445bac02d8d058d5e1fe689654ba5a6556a1dfd8ce6ec55a0ed79866cfa6"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS_${PN} = "${PYTHON_PN}-misc"
> diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
> new file mode 100644
> index 000000000..7edd41030
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "Powerful Python library for atomic file writes"
> +HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
> +
> +SRC_URI[md5sum] = "b5cc15c8f9f180a48665f9aacf91d817"
> +SRC_URI[sha256sum] = "ae70396ad1a434f9c7046fd2dd196fc04b12f9e91ffb859164193be8b6168a7a"
> +
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI += " \
> +	file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +	${PYTHON_PN}-unixadmin \
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-misc"
>
> 

--------------873867FD1802C981554A2469
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/28/20 4:45 AM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1593333924-4040-3-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">-Enable ptest.

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593333924-4040-3-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-atomicwrites/run-ptest     |  3 &#43;&#43;&#43;
 .../python/python3-atomicwrites_1.3.0.bb      | 11 --------
 .../python/python3-atomicwrites_1.4.0.bb      | 25 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 3 files changed, 28 insertions(&#43;), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest b/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
deleted file mode 100644
index e43bf0884..000000000
--- a/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
&#43;&#43;&#43; /dev/null
@@ -1,11 &#43;0,0 @@
-DESCRIPTION = &quot;Powerful Python library for atomic file writes&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/untitaker/python-atomicwrites">&quot;https://github.com/untitaker/python-atomicwrites&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4">&quot;file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4&quot;</a>
-
-SRC_URI[md5sum] = &quot;ce11f780a4ce0fce8a55d64494a88178&quot;
-SRC_URI[sha256sum] = &quot;75a9445bac02d8d058d5e1fe689654ba5a6556a1dfd8ce6ec55a0ed79866cfa6&quot;
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} = &quot;${PYTHON_PN}-misc&quot;
diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
new file mode 100644
index 000000000..7edd41030
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
@@ -0,0 &#43;1,25 @@
&#43;DESCRIPTION = &quot;Powerful Python library for atomic file writes&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/untitaker/python-atomicwrites">&quot;https://github.com/untitaker/python-atomicwrites&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4">&quot;file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;b5cc15c8f9f180a48665f9aacf91d817&quot;
&#43;SRC_URI[sha256sum] = &quot;ae70396ad1a434f9c7046fd2dd196fc04b12f9e91ffb859164193be8b6168a7a&quot;
&#43;
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;	${PYTHON_PN}-unixadmin \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	install -d ${D}${PTEST_PATH}/tests
&#43;	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
&#43;
&#43;RDEPENDS_${PN} = &quot;${PYTHON_PN}-misc&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------873867FD1802C981554A2469--
