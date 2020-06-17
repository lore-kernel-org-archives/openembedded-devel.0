Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.71])
 by mx.groups.io with SMTP id smtpd.web10.9268.1592405180493767992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 07:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ezexH/uu;
 spf=pass (domain: windriver.com, ip: 40.107.237.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHzZgT+eELyjNF2m4xI9k3KbC87UiS/IlHfW9R+30YBa4m2z/N6vQeUdJ3paXHV4WbWhiY+SXIJsfkVXLldP3WseerJty13Vv3j4Yn/ql+XzuRPA9Y6U+9DQ+2yWnMHZ89OLZgqdEBVEo/bqboQi2K++VwWffa2RUEsd/Ew4W2Gwc0MeanUuRT7FTgmJjIugPavymRs675tFk9qTuJlcpm8qmg09Nl09FMz02AD7GVpwGIoxOvaKi/+U3L16TbBHds8ZQ3yuSU+9uoto8aw/1oJkeWFWhrRWXrnuXwewVEslOlFFdEMmCFdaoUvyl/q678J09upff1F+iZqA4tym+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giY1cCMMQHH2uWMNvEciR5U3kX+ICuPL2l+KdNNSiCg=;
 b=AZrJpskooDhyrWcfMHTxOTvSmVivY2JN3Rzd09w/ZMDHBXk4x3OG+Rrc8+XhqQ+/WY80l16kCKljAOaX4zdntFpyrmm3YT6unhJXF0C8bXk5jA1AdUrI6c7ZNzf/Vg2wLc5jHvHVCEbMVY76u99Ptg5dnQISrrUmBrxPzufpYsylXLrDV8Rv7Gdlwj30cfYRZq3wb8jXLvE8wKQBo3HtE/rwiUV77Y90FCMS2ilMDuVNvNbTnC/5iUokip08udu78jrsMn+kbFDYy3B/k6dcVz+3H8J2eoE8YBPMwhJEmbp1EsxW5v7Cf+OmsLj71Lx66YiUEPBZ3W0tvC80KMUpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giY1cCMMQHH2uWMNvEciR5U3kX+ICuPL2l+KdNNSiCg=;
 b=ezexH/uuDtZehBytzXKam4aiBSHk+x7Y2T9DEIfn0ZtJKNCDZQPBln5bXjAoD4Oth1GJnEdffMAHhk8Zq2Odjkirs6ljubdn22q3mBE6Av3ioCsCV7DCVQu/zf5ke4vY9QgqCcqbaV7SfoTmEuVDG933mHwbLH5pooTJYqFm4bY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4162.namprd11.prod.outlook.com (2603:10b6:405:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Wed, 17 Jun
 2020 14:46:19 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 14:46:19 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-dnspython: Enable ptest
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1592242301-113731-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b857fdc2-c890-56a0-918f-64c7eddcaa01@windriver.com>
Date: Wed, 17 Jun 2020 10:46:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1592242301-113731-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::35) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 14:46:18 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d24dc34-8dda-4698-dba5-08d812cd3203
X-MS-TrafficTypeDiagnostic: BN6PR11MB4162:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4162702044E79D0AC912B6909F9A0@BN6PR11MB4162.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8HyaBCoSbh55aj2QxoGt6o1rxXVjolCJMASENlx4k3nyGbmj/3Z5G0nYLLNwrLUgdqGj3dGkQQSFv18li5A4AYHKK5P58PGTc1GfejImrIUWwGUOQfpUpUhYnE6alZUlYfOo073XBDGXBcCaAagQ9CsqZqSRQ2K1H4kTPE4tZnzgCMRFHQtYcqbccDYG68PyGT0vOPwr+NiD4jtcX8fRxMMJe9PP/lMt/EJjNN8O1SqVIDRnYAFyBm8RoM7AtTZU7CDsKaxBup1O5T1xKZ3IYgHs8Dw6pVPBUKtADztuFQ/GjzBJZEYECFDHnxYCrVjGPHCWVOMxcQzZvILEA8s3yGrbgxo69BvYjYNWj3n1ZivFvqMVTGXEW96Nb8gb6yAZKY39YPEkZDVqZZryAVmh+w5XJoq8qDFLcs3qUwKuG/2oU7+vivcgl+6h0vQGnkS+NVKofYZZj2Mj1RfRKPRVXw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(53546011)(52116002)(31686004)(6486002)(33964004)(83380400001)(44832011)(66476007)(66946007)(966005)(26005)(16526019)(66556008)(186003)(5660300002)(16576012)(86362001)(166002)(8676002)(31696002)(36756003)(316002)(478600001)(2616005)(8936002)(2906002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Av9xJnaQoGLTIoyr2WzllLH1e9MRnmakjFyrxdIeurZf0Fc/itAUQ1jRCj3NkTHphj+GFfRO8ow6jksX+4X3j9jT9Cnj9B0XwVzcVZjZ8IJ91yhwwp/h/NQj3bWv4MJ2DLhBwdX1vl7OU7xhp7KXfqqORmTifaja7JR5ZaSoEOyyAHovKcQGTBIaZx3IvGq0+Tvo9fohenFGnfMGq6gpbcNlgndSZYkTWGGwZzyXKsLtkQBGzfhFatXn+5jXhwNpPHWYwE1xo01dDua9pLektXA0E+ODKagdUm1xkD2h2bcfJA08q1GeSj6VSQJud5ZqtjDpi5xXIqtquqzi0PSGUKwBm5nkJ8nMMuiVdqxNr5rMJ14Lc+WksKVRqv89WhbipWaBBe6N5HD4iKvd8owUb8hvzdES09FQWKdzTB03HFh6sISMhVpueYEkY8D2Jn/rTUnnf5yLe9DeGEs/BOSc96PLZoLVQ8hfH0cG8YrTVuhbmu5KlwzdNdw5Fi7sbg3K
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d24dc34-8dda-4698-dba5-08d812cd3203
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 14:46:19.0966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BV48B/NDEhEgO1ZkiLp3xiRJ+oPLgDE5Bh39LLncURxAyOltK92Lf58XcTV7T5IkPgoGtLncZ4CcOzVVt69a5kI4B0TKKdBGio06KCkoxqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4162
Content-Type: multipart/alternative;
 boundary="------------41D505C4912E9AF91CC98FB2"
Content-Language: en-US

--------------41D505C4912E9AF91CC98FB2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 1:31 PM, zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-dnspython/run-ptest            |  3 +++
>   .../python/python3-dnspython_1.16.0.bb            | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-dnspython/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-dnspython/run-ptest b/meta-python/recipes-devtools/python/python3-dnspython/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dnspython/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
> index cb255442f..66cd88363 100644
> --- a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
> @@ -8,7 +8,20 @@ SRC_URI[sha256sum] = "36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c
>   
>   PYPI_PACKAGE_EXT = "zip"
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
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-crypt \
>
> 

--------------41D505C4912E9AF91CC98FB2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 1:31 PM, zhengruoqin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1592242301-113731-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1592242301-113731-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-dnspython/run-ptest            |  3 &#43;&#43;&#43;
 .../python/python3-dnspython_1.16.0.bb            | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-dnspython/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-dnspython/run-ptest b/meta-python/recipes-devtools/python/python3-dnspython/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-dnspython/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
index cb255442f..66cd88363 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
@@ -8,7 &#43;8,20 @@ SRC_URI[sha256sum] = &quot;36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c
 
 PYPI_PACKAGE_EXT = &quot;zip&quot;
 
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
 
 RDEPENDS_${PN} &#43;= &quot; \
     ${PYTHON_PN}-crypt \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------41D505C4912E9AF91CC98FB2--
