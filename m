Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.88])
 by mx.groups.io with SMTP id smtpd.web11.2225.1594578216854732023
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 11:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Fkd9EBNh;
 spf=pass (domain: windriver.com, ip: 40.107.94.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTBtZuSwn6C8u11FkUhaYMUQw1kFWnyyWaorC9lgG4NIYbdjCjxu61cdirZVVGB+L8oC5UF08BaZow8UKG9CyMTgmTB0eYYCDxIOOQ371gGD4cuF6gRr4QPb2n5Cs/FhkT2NZh9JF9+ERzKr0HiFGrawohYAj8QUg1DGGnlPtjayCZBKZ8pFimE4p1EWd6FPUi2Lx8GGVpYRjteKaWHCh+/DxLgC0qVwsELTuQhck2gM6MpEmNc3vVqilyfGDt7gnUc8+hPByeFyK+Atj4wqHc5ku5H5/aYeKfkFaynmHPD+JxvjflOpjNFLi0vpj2Dv9v1J9BCt2PuTZ30t6mpGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUt5KkEqgpRWSfAVk83HMKlksPrw5UNfyXZOyEsiny0=;
 b=fdT2byPd93V55gfYuA2seHoTyeSuQX//xsKN76l6wLh7MzTbYNFBjnWyfNrlMVSIeXEjvyZOX5sD+idYVCtE0vMyoULMtDbXOUKiqC1fe9SrShcwKe3sSn83bs8fAdwdIigiR5JK+WCQzbp43eT3jWowKX/X1yQy2D27gvWMqoR755ujepvgosW8KPS2wygZ9onpm1fX+VqrwY02CocbL80spFnKsfiRAcn6IcVcBqyAhqevjavhHaioxZLt0zGbH3sZxYG4eMKMi52iagm3jwuxW2Op5wRVDnjNfunOSzOyL14XXjRnia1QS8TxPXZ0FIKmzMOTgiJboYVMy6InBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUt5KkEqgpRWSfAVk83HMKlksPrw5UNfyXZOyEsiny0=;
 b=Fkd9EBNhKJrq2ru4X/4Qo3Lthx96CnAhey2qEumETCzrNquSq/Ai67fmsJonCOUbbIbVURrkMrnPxgrN2e0WnZ1uOvCIEUzs7ZsUZ1I+2k8oR7ZtjhGL9+yySGZl2TemmE9bHWZrRzQ2489wqSU3yEo4BJPWcEr1OhT3R987oA4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2844.namprd11.prod.outlook.com (2603:10b6:5:c0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Sun, 12 Jul 2020 18:23:35 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 18:23:35 +0000
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-requests-toolbelt: add ptest
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200710181555.29809-1-sakib.sajal@windriver.com>
 <20200710181555.29809-5-sakib.sajal@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ca597a2b-f483-e423-9513-fb102ad891e0@windriver.com>
Date: Sun, 12 Jul 2020 14:23:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200710181555.29809-5-sakib.sajal@windriver.com>
X-ClientProxiedBy: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Sun, 12 Jul 2020 18:23:34 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 276cc737-adef-4c24-0979-08d82690b06a
X-MS-TrafficTypeDiagnostic: DM6PR11MB2844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2844146E27AA486666B4238D9F630@DM6PR11MB2844.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i3CmTa134YoJ0hs9vm+cLO1RRHaeYFHcT2rSD/eIXZA52YU0t3v/V/UUR1qA0qCBsqf4T2TH0VPyfSwl+b8xblnel7HtGnk6KkTAE64FATC/FYWnVp35SUjlIaLrZQ2npTabWDIIDQHsAnb6/kigrNQNDs5yIWgKxuzaT/8ymWmh3vBQQFlR3uAZbNUvw8q9yXt1JD+IXyTj9Cw5cd2+iCo7Ja6IrzDPPHp3mlaNjHRGQrsuxlFF9JRMIJaU22K5IRnW1q6uoWxA+eveafouwbudwMgPbBkUlp1C9iU8CnE2j+efGo7xL2xHqAUub0EikrDKSNIOoNl5vE558rnmPlqZlL/SRa2Oj3hA/wgQf1LdrNiYdaZX3Tm1fojooFTKFD5S4ZYBH09e1WR2OuzUvgZ7+gSdJnzELWDucHz3yBXW2bRbmL7c+17vhWaEppGlxPxS9ekmVztr7Viq4mZjCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(39830400003)(376002)(346002)(396003)(86362001)(31696002)(31686004)(66946007)(52116002)(66476007)(5660300002)(16576012)(316002)(66556008)(26005)(966005)(478600001)(33964004)(53546011)(8676002)(8936002)(6486002)(36756003)(2616005)(44832011)(956004)(83380400001)(16526019)(186003)(2906002)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QZ4lSHY1T/e43oQTCatOI+k+w0FZs26lMTBPRzUSD3EOxLw2w9nJ7s0LIfwezOK6C960+3m7tqRwPs8g4GPe+CEQCMSve+kcE8eF7vCcFf+8NExbOZ94qocyYDPQlV+PRrYwazl72Mm+u0Gz1gIU9axBu5CFcsQjBSqtUHAoYuLULkDh3VtK8EKUf3Qa3vQb38By2y/M9gc7us0F0Y8AnB+yCV/dAE7IEQyZLEOc3Z2LWDG8ZvTFi1aU0lEfMdJ6/pK5lOED2f2mpNbws79DbDwXrDPAO8dpVQVULYZSSubqSBnSzdah42cTRyPtf0Jg8cX5uqX0x0/3lJNHF7dFm8XWj2bLacMpD/iHq6NfJSXHwqjqwt+yZTelMiGXGXg7H35qFPgRX8lewapavKVTHYCRraDIK+IMdtNiV8oVx2Cc6JqjpYmIwAoh5VB90ptkUyCzT4f/KjmvKZw4ZFtQ+q/T927QR+TWmw08XtHAosw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276cc737-adef-4c24-0979-08d82690b06a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2020 18:23:35.3568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXItDaWtDntB5GTcQeXndqSot445Zs4ewC6AfWOfV4hjLOSo0ZWwn0G2A9yoVA38tCxJVEZ7WAGWuDjLVgkcg/tuqtAdgmf6/dxbj2/8tus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2844
Content-Type: multipart/alternative;
 boundary="------------AF289207A42009FFDCCD2DC1"
Content-Language: en-US

--------------AF289207A42009FFDCCD2DC1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 2:15 PM, Sakib Sajal wrote:
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python3-requests-toolbelt/run-ptest       |  3 +++
>   .../python/python3-requests-toolbelt_0.9.1.bb | 22 +++++++++++++++++--
>   2 files changed, 23 insertions(+), 2 deletions(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> index 3beb39718..cb1bc607b 100644
> --- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> @@ -5,12 +5,30 @@ AUTHOR = "Ian Cordasco, Cory Benfield"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
>   
> +SRC_URI = "file://run-ptest \
> +          "
> +
>   SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
>   SRC_URI[sha256sum] = "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
>   
> -inherit setuptools3
> -inherit pypi
> +inherit pypi setuptools3 ptest
>   
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-requests (>=2.0.1) \
>   "
> +
> +RDEPENDS_${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +	${PYTHON_PN}-betamax \
> +	${PYTHON_PN}-mock \
> +	${PYTHON_PN}-multiprocessing \
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +	cp -rf ${S}/setup.py ${D}${PTEST_PATH}
> +	# remove test test_multipart_encoder.py as it fails,
> +	# downloaded file is not supported
> +	rm -f ${D}${PTEST_PATH}/tests/test_multipart_encoder.py
> +}
>
> 

--------------AF289207A42009FFDCCD2DC1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 2:15 PM, Sakib Sajal wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200710181555.29809-5-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200710181555.29809-5-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python3-requests-toolbelt/run-ptest       |  3 &#43;&#43;&#43;
 .../python/python3-requests-toolbelt_0.9.1.bb | 22 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 23 insertions(&#43;), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
index 3beb39718..cb1bc607b 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
@@ -5,12 &#43;5,30 @@ AUTHOR = &quot;Ian Cordasco, Cory Benfield&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571">&quot;file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571&quot;</a>
 
&#43;SRC_URI = <a class="moz-txt-link-rfc2396E" href="file://run-ptest\&#43;">&quot;file://run-ptest \
&#43;          &quot;</a>
&#43;
 SRC_URI[md5sum] = &quot;b1509735c4b4cf95df2619facbc3672e&quot;
 SRC_URI[sha256sum] = &quot;968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0&quot;
 
-inherit setuptools3
-inherit pypi
&#43;inherit pypi setuptools3 ptest
 
 RDEPENDS_${PN} &#43;= &quot; \
     ${PYTHON_PN}-requests (&gt;=2.0.1) \
 &quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;	${PYTHON_PN}-betamax \
&#43;	${PYTHON_PN}-mock \
&#43;	${PYTHON_PN}-multiprocessing \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	install -d ${D}${PTEST_PATH}/tests
&#43;	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;	cp -rf ${S}/setup.py ${D}${PTEST_PATH}
&#43;	# remove test test_multipart_encoder.py as it fails,
&#43;	# downloaded file is not supported
&#43;	rm -f ${D}${PTEST_PATH}/tests/test_multipart_encoder.py
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AF289207A42009FFDCCD2DC1--
