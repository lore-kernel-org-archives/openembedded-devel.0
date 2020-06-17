Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.82])
 by mx.groups.io with SMTP id smtpd.web11.9367.1592405192995483078
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 07:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XPatKuDY;
 spf=pass (domain: windriver.com, ip: 40.107.94.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnAYRoUj8+DYGMf4VBa+YwbuWmAPdx9C1jDSn6OE6i9MCvEQ8XApNTJfgZPsPA77uAfl3cInwzbjULG+sAeX+DYSlgwtA3ZukNjlXkmc2JgH7eZnTTDhfYdsT+J4gNzcKAoQrIhM2UC/WWW7cMxn+38CdDOhiFNl4/7tvgdB0QxiuWkr582UoGPCTwjoHDfj5l54BljllVKvkNoendXynnK2vMawRM9qEmerGnlNIoaHhV2jKO+b0KIpsUvL/a4xaD59Dn/AJsYVOuiaC2rT//VLhCotYYRwHjDoKPYqFd287/Sr302rycqeer4Xc33nbjO0ZrKX+Aca0s4z7SnDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28okenUm2f58IMtnk4r5W1qYz6VTqolzLNfXyqVwA0U=;
 b=cK1DnZUmWaaojdfUpZZmDIkPMqIqCsLY6PIWt1isfCn4VR2u6VLjD0HHnmCkjPGXTZfRLBtUCx4NKdIg6kb1xhpbhpLOjb0GweVnnp2ryi5fsfjEWD3dcnsywq4Rly479U2/i58p7VJF1XaoTtCu3XQeyeJFTcupEITFdQ9oh+v4ZrTAFZAE3zplhXzRXqDsGikrh8s0g7tt+Gs9aBUZY5x/m+T8zClhL5TNffQ6WuM0pwrQgDEU35DomOaA4oxB9vRCkehDZqijbbsv5XAGf9rl4tC0svdJDfVY5ntpa/8RJReb6KlolabjpOYIRomokDqunjzarr9NGHWGsK1Gjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28okenUm2f58IMtnk4r5W1qYz6VTqolzLNfXyqVwA0U=;
 b=XPatKuDY7qtsbAtoJwa2MvREQHAdicyTtMHIbZ07Q2m4izu9C2B1i8us/6eX/E+vAfNBo29SicFZWvHgX3pqCQ9+c+P9R1kq0SicRzL3xWuBWJB1PnbchS8VVHh9CfCAJHLhHJZDJtAEkf/ukzaX/sEtOPJmw/fPii+CWe+CE5s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1233.namprd11.prod.outlook.com (2603:10b6:404:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 14:46:31 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 14:46:31 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-dominate: Enable ptest
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1592242746-113844-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <590b7f05-d6af-cd0c-b2d5-45629cd1b465@windriver.com>
Date: Wed, 17 Jun 2020 10:46:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1592242746-113844-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::9) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 14:46:31 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ebaf2e6-0433-4a86-8319-08d812cd398a
X-MS-TrafficTypeDiagnostic: BN6PR11MB1233:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1233F581F666EBA469F0CF109F9A0@BN6PR11MB1233.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MCjefHLqclFsY17ii/0JwPkBAqZIFiT4zgIT926/f33djdSziTXrPeRWqH/vYetCB3B9aaUhYBquxPsHZ7+ugWQI5H56KgjYX7zzATCIJyhQChTSshBSxQdMoXirjeOgSdISoVJJP8wX3PgnfV7/rT7M0XjLnisPnnvN8yR+RxT7xV/d8Ay2yEArQN0kmLG+wDONzdS4XVh1YzPa5QAvXPufYS/6YfmivkDc4gcKmpxIPgfnbWO27/4oJAocuZFiLa/K409vC+Tl4hsgREg/nOgBT+TPXhy42JbQA1C8tdFNEV5WzsQ48ogDyDVuR6wEkYfkU8Sp7d/Y57qIZlWeWJ3USMlQKN12uEu84aTxPddI8xGt+nUP/yCyQqJ6zM73LX1i6FFuGCYMqSdz43MfOY+wppVFsHmL0hcBaQmxowo+TSCnhan0ljCpYNAdCtEouQ2tsIj0ja280Jf97A0cPQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(136003)(376002)(346002)(66476007)(33964004)(44832011)(66946007)(5660300002)(31696002)(31686004)(66556008)(16526019)(86362001)(956004)(52116002)(36756003)(2906002)(2616005)(8676002)(186003)(6486002)(478600001)(26005)(83380400001)(966005)(166002)(8936002)(16576012)(53546011)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YkBfHXwVwC4Zvyq97Q4gxTZ9tNdWbNF01XZG0NxTNrpZrWuNNiM6XdFdPjQdOJvSp19GglJULcXqb7+hwxL+/+jZXRNwVT/13P63IQiH7scHWvkdssMp+eTddAO9MK9c8pg/zMVqbCNZz9cBH6NB3EFid2Awj7HZoULnAuJbMU2Hi5J7Y4lPeqEKiCnr5bJWjqcThmjhtdeBTh934M0Ver1uHq9aPG+YdmmwFwq1TDmABsWLLaTk1tqNUbfS0UOYm2w5HEg/fqhVwAiirSgG0zv+5kWy69vi9sFw61GBA6tK03Lliy3Ri+E3CIWNF/300tQhY1LsMXo36CpZTXKS7QHTr6Ucba9s9SErLIObo3YkJpqceeWrnK+R+0znHhitDnongPHFjq7zj+i0XEx9KBG2wIj4GXkGTNhSfLUMORKgavgi/Y2mxkQKBPAdr0aDAIIyFBqf0d03no6olmSWWhvczAwEg2Q0C6b1kzgpBCuAjACBSGZ75xVe49pUUB8O
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebaf2e6-0433-4a86-8319-08d812cd398a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 14:46:31.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrFINcEvB7fWTjaTzocYyyjqv3wSbk7qRdqv662I9Y130riFK+dutG5bKhq32SMmq8ZSSDvkMk+fzeYYuzyoBNxvQ8Fn1siOIFur3pDpyb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1233
Content-Type: multipart/alternative;
 boundary="------------59C41AA00B5FC3E9E66377F9"
Content-Language: en-US

--------------59C41AA00B5FC3E9E66377F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 1:39 PM, zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-dominate/run-ptest             |  3 +++
>   .../python/python3-dominate_2.5.1.bb              | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-dominate/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-dominate/run-ptest b/meta-python/recipes-devtools/python/python3-dominate/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dominate/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
> index dd8c59603..75dd4ef9f 100644
> --- a/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
> @@ -5,7 +5,20 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
>   SRC_URI[md5sum] = "35eeb6b5587c8c9a51cd22c83e07ac49"
>   SRC_URI[sha256sum] = "9b05481605ea8c0afd0a98c0156a9fb78d9c406368d66b3e6fedf36920fb9d78"
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
>   RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-numbers \
>
> 

--------------59C41AA00B5FC3E9E66377F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 1:39 PM, zhengruoqin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1592242746-113844-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1592242746-113844-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-dominate/run-ptest             |  3 &#43;&#43;&#43;
 .../python/python3-dominate_2.5.1.bb              | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-dominate/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-dominate/run-ptest b/meta-python/recipes-devtools/python/python3-dominate/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-dominate/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
index dd8c59603..75dd4ef9f 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
@@ -5,7 &#43;5,20 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24">&quot;file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24&quot;</a>
 SRC_URI[md5sum] = &quot;35eeb6b5587c8c9a51cd22c83e07ac49&quot;
 SRC_URI[sha256sum] = &quot;9b05481605ea8c0afd0a98c0156a9fb78d9c406368d66b3e6fedf36920fb9d78&quot;
 
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
 
 RDEPENDS_${PN} &#43;= &quot;\
     ${PYTHON_PN}-numbers \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------59C41AA00B5FC3E9E66377F9--
