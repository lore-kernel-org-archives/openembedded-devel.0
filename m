Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.74])
 by mx.groups.io with SMTP id smtpd.web11.9323.1592405113943758579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 07:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y+JtxZmN;
 spf=pass (domain: windriver.com, ip: 40.107.76.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ml84S9THazi7X0hcbsI+iKE4oPpVMGPWAKwfxMJT7eX9WwH/10WyGzdBsbpxCDC0YCR9VzKEnRrIjaxOGKwabubZnalP6h9Vxp7hCbytYSE5P4WgvyCGN27IBeLKAnUnJJf6oJHNmUyaKZuCkXNLlIT28RW/HZtj6fdPZ4qMnvu8HsRuOU48Dh1SXR5H3ocgE8AclZ61TXod2Jo6FVkNlxPD9bJQOnfEXYvUQB5y4INmOo90noUnnoriyEtMmzudPZMo7sXXd3ZI3OP5GLk3P7q5xiytzBq8cr4tlclWHczGNaIaWLgi8HZEsuAG6O0uZbYBT2M8qlaSC8lpsRFbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1LmQCNc1mfrWNuyY/39lkvIM3HPFO6axmvwCtGbEUY=;
 b=cQ7iCWorAQu0V39iWVpsONDQK03CMCA3ApjBEtFKW2hog2R1CmS0sf3LbTjPk2cBq1iUlUXUAbf9rQifRcHpj9Mzh9AjMRAeGeiTa3Wj4Btj4NgLJkfpsHsNSTphvd8/EcgBAPih0eF407pEKQcWfdDWYFjychbzbMH0qjnYMrytkUqKclmE1qDxPQSkNa/dGshJKxWU+qjF6A0G+XN2sWS/pQCayt9eEsrvQcAd8ZV26kBxUH0UWCKvYOm1L8vgEjBC3CnvTvUgtgsALlAJCeJ5RSnjzgiIscnVogeZOkw1HodF65Vc1tfh8jeO+WmGp+6+LDOGiMgytGTeVZrRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1LmQCNc1mfrWNuyY/39lkvIM3HPFO6axmvwCtGbEUY=;
 b=Y+JtxZmNY612A+rwhhPB6U88A4hsKVPgCrzTIz52maiTPij6MQ4Tv+Fl3948i6JRmoEO7OXTRde4gJYfedzFtXhfS3RUeuZQK3X8WArS6wl9IIFZ3dvxpUVI9mb/Ufa7nqzmsmch9In9Soz/K8YpLNrWxeiXcKrUaXoVoliEp7I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1875.namprd11.prod.outlook.com (2603:10b6:404:104::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 14:45:12 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 14:45:12 +0000
Subject: Re: [oe] [meta-python] [PATCH] python-html2text: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1592232003-4200-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3b97f32f-0a01-8fe1-f7ad-67d1558834d4@windriver.com>
Date: Wed, 17 Jun 2020 10:45:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1592232003-4200-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::30) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 14:45:12 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1705d961-ad6c-4107-b72f-08d812cd0a6f
X-MS-TrafficTypeDiagnostic: BN6PR11MB1875:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1875EECAA73DFE82C98BB4499F9A0@BN6PR11MB1875.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A6vPbnba02BEMswRG7A7VPL3ED7VmT8ypLfcPcoFObB3Jkrmr/tqEPkbglKWj8b4jZf57Ky7Pnq0sXHktf74j9OxR2eb5JlIhmjI+v2jqHZbFepskO7Z+W9JH0HlDwo/rHYOPXhQibAwiIhagjckz930q9WAA8W+3RTXzIDFzFis3uGEWVdLFQe4QpBZwdXD8q1nYbLgNST6qcptBvqEF05siJKBU/OOocwg42YpdB4SJ23DC/Oz90OaSknYaB87Gyjqyg2wAqnZyXwR8uM/UrDjmTKUSFu/hhUc0nHHeUL+V2EXqbZywHu68Hwx8d6Lep4wnD7mQ6SVHAznFXni6nPW9UMe0QeZ6CMmTvrLRHV/49Sx6LY8JCXMnFibC58LbXsyPGAPjKsOqchfMLUM1D3f2ZT4b2Q4tO60WSLKg2TL90gqM7Pu5mRYsAbDMY5xwLmfJeXTdYskV5Q8dU+bbg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(396003)(136003)(346002)(39850400004)(2906002)(26005)(966005)(16526019)(66476007)(66556008)(186003)(52116002)(66946007)(5660300002)(316002)(16576012)(53546011)(478600001)(44832011)(6486002)(33964004)(956004)(2616005)(166002)(8936002)(31686004)(86362001)(31696002)(8676002)(83380400001)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VZFYLcLgNy4+IVH3q6k73KvYToO7ikddRkcPslBBwDLlebEt7VYTQ1onrAZg+vFXL8QQaXTBvGS6alMJ4T7T03CM5ROhcFDpOMHmQ4dpw8pdgnFV/jCf/6n4LGVryKfgmVc73VJCNK5du6Nb43lbMoi22xV8pHuOJwMYvdYQZ07lnJgL1sXVeXFDWyOaFiYMLL4QFRW0X1B7Sv9J4Z6pVlzamMSwId+oiIt5DotQSNBPkXB9pH1d4SoMCno0vJSr8SRzbWNsfDWCunU6t05Zjp0zghqlH1/MvZ2DUqckGfN4pqz2MRuT59ZkTKoWoWhA18qnLz/TUa/fYWu2/ka8eijddDnOtqNoSdJ0r83OK1OhnWNmV+yV8PrChqGa4Bqlu55duJQl5nLeG+w4SMO5ahqvGTw48nn7MfoQRuUvLAHIT6rF2RDrYR3BK4VCti5jChi6hr3rhkYbOYYFIMXkPL32MCLJtFBPkTN7gW7rtzn1oM65MKu9nFQvn8Vu645V
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1705d961-ad6c-4107-b72f-08d812cd0a6f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 14:45:12.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCKH+FmVcAESdGwp7fMjgT3BEZGuzOKtL7sebZZ6UKn7wbk+yHlBTzQV4NjLebtM5qosMooeCrWyc0LdGcpiJRVPXJ4P9EKEzcu7pe9vo68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1875
Content-Type: multipart/alternative;
 boundary="------------F5AADF2F81CCDAFF3318EF07"
Content-Language: en-US

--------------F5AADF2F81CCDAFF3318EF07
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 10:40 AM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-html2text/run-ptest            |  3 +++
>   .../python/python3-html2text_2020.1.16.bb         | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-html2text/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-html2text/run-ptest b/meta-python/recipes-devtools/python/python3-html2text/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-html2text/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
> index 565b31d97..ea17190d5 100644
> --- a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
> +++ b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
> @@ -7,6 +7,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   SRC_URI[md5sum] = "c77b580c94d1a9e0145f23cc4472993d"
>   SRC_URI[sha256sum] = "e296318e16b059ddb97f7a8a1d6a5c1d7af4544049a01e261731d2d5cc277bbb"
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
> +	install -d ${D}${PTEST_PATH}/test
> +	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
> +}
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------F5AADF2F81CCDAFF3318EF07
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 10:40 AM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1592232003-4200-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1592232003-4200-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-html2text/run-ptest            |  3 &#43;&#43;&#43;
 .../python/python3-html2text_2020.1.16.bb         | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-html2text/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-html2text/run-ptest b/meta-python/recipes-devtools/python/python3-html2text/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-html2text/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
index 565b31d97..ea17190d5 100644
--- a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
@@ -7,6 &#43;7,19 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504&quot;</a>
 SRC_URI[md5sum] = &quot;c77b580c94d1a9e0145f23cc4472993d&quot;
 SRC_URI[sha256sum] = &quot;e296318e16b059ddb97f7a8a1d6a5c1d7af4544049a01e261731d2d5cc277bbb&quot;
 
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
&#43;	install -d ${D}${PTEST_PATH}/test
&#43;	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
&#43;}
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F5AADF2F81CCDAFF3318EF07--
