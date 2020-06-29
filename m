Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.58])
 by mx.groups.io with SMTP id smtpd.web10.20641.1593442560291057238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YvObeuP0;
 spf=pass (domain: windriver.com, ip: 40.107.92.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gm9rFsD8gjOW3h2cjWtEX8JnJoWnyjwos8yAgPba3kRqe5l+sR9OsrNZrnFBzVsFOy+PS5IlA0tiGzW/fF+SZq6sk/DNFZP3HI4LXGhECk/9QRX6GHMd1+mRgM85AHPNcDNNpepnilQQDKBP0Aii3lQCMyQGLniNaKu/hDTywCFBxCY42vl8lI3CoNCuHNQIZ4VPHOp+nJ7ElaZP6gdM84ljwJzeNQK8TMsj6bfTgooqHUmp/qcDeaURf97mH3sHjSzqCRgqZo3kVhfZjqVC7HmlgX5/fAb1f3D3yEBdgZpPiHUpnC5A3RUKBOmS5GpXsQfmVzrSnq2N1VVIYdboig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JWsfH4Dxvhu9OEyjKUzlfzgngnLGdx0lzBMKmEQeiw=;
 b=LsXl2eli85CAVhORDRo9LSuLXnoyu3+5iRnQ4xInAZOR1LB79LWdAgntOVzmkfkAJhVqq1kDBaWqezPlXo/M9zTPpQUoCCJBYpq6QWCAkYBFPX46ZzYqQoUUJW9oCXk5aTteRR1suFIaOHONh1V2aOITVGyJeT7yWWiEKLsqi0QZEViavd40vPiaadxiKwE3HDI/Zjp51wz/4xOy5geMk8A8kWdckOiLvW10r5CWbYBiq2pCusRCwOnXaePagfZZrY9Szwacdaoo36QYVBlrEkz/SF2E1n9fSgYpGT52cknOiT1fkGP0sG0cJRMsbvsoz6BysxjeH7b6YIuEkWXmUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JWsfH4Dxvhu9OEyjKUzlfzgngnLGdx0lzBMKmEQeiw=;
 b=YvObeuP03ugjpYPjHbEuDJ8s1X3eANiFiaak049Dp4Woq8ae1JV4Bh4NDXaSy5wINQe/CoLheRdNqp277qrbg1mmIt5qfvf2JDji/wNQPYFl6cBBmvMJU9S/3hWxTmRBMSLLlwBH2h5MRvgmm/zUQjyDJ26JoK4Hf2y2mo6GUdc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:55:59 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:55:59 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-backports-functools-lru-cache: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1593333924-4040-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8eb2cea3-2890-729c-626c-e0d16fb1598b@windriver.com>
Date: Mon, 29 Jun 2020 10:55:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593333924-4040-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::13) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 14:55:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 170edfb2-a0fe-42fa-1fff-08d81c3c8885
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1988752AF185EAFF996F6EB59F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VhvsEruNOrh4e0S/4ycF0fJDk9G/sovvMSOZgtxLZ4IdDHZJwypGL1ua2soyjL/xulUc9EHnlUiA4FHJ6vFVTVAUye0sn0JbZ607o92655K601mJyHioc/W4c0nnDnh4fL6PSunCS0K65Yq1Kj625c355ztWFTRY5K9J1T+ZenYqK9tvGbptccd549edUE45r7bwM9awehDS2V4ssMyxtXek2oUislNozDAzWy+fJM1rDq01pH3a5xLRqyblG6jqGT7eP+WLpH9HezZ/oA+Xn7OQ4x7ECHEkkg3GS/sOWsMXBTDZSAVuyohnGl3dCLdyTGs35/d4a7Y4+QlKE1CPun93sX3Vm33GQN4raSdr0jvPYBOxQV5/snEdt5wsIjlmASIxBGmUPegJyrhybm8+ny2sPTyt4UwXq+Tvs7/X5dV9z95/GxOiEEUDxHr/enc5zhOu0ALaYoffD8dXietz5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(366004)(396003)(39850400004)(186003)(33964004)(53546011)(26005)(52116002)(6486002)(31696002)(2616005)(44832011)(66946007)(66476007)(66556008)(956004)(5660300002)(2906002)(478600001)(966005)(36756003)(16526019)(166002)(83380400001)(8936002)(31686004)(316002)(16576012)(8676002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TDoghz2uDjdUYl/qa3vu1zDCilJjzZfqJ7+AcIT/xf5CJ//5/PUXlETQHruUfjPUodlc5MzLfk+Et2tdG1BzaddytGMNLlN+2vI+1tpxV1UOPWz6CTzva23DdX1Ogb5Tw6y+nE4sLkOtuzGLPf2lIU7DEcfd/27rT1GGC/W+Qko3KbWD6SgQu0T31QMWWo5N5312OIaTuY7Yceg5j+5/uac58arFo7+LnVM+Ui3G86vVcAh0HDaBk7YscN1qTJACRa4jIozQHcCoHHI69597ogwO02Ht27BiG+cgEUFG5LDkA6vZX+k6EGO5oJmgQdoODMFPJuC+nplEyTtZIGdPXcXv1P0r0h/RQ2Nd/KNr68AF1ou+ueWltMVzdP5TY8kore1ujKKrPELZfZRTH1s3vRCSgo9RzBC3GdNurBFtH47zvKjfM5sJrKNP4zhrj58mDrSKEy/thh/gySuExxE5BMwXOQjnPmU92TrwpwflP8esfdD+ci43mYV4BntIN0ok
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170edfb2-a0fe-42fa-1fff-08d81c3c8885
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:55:59.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByNee85lZVk8PVgZj9vo7DdFHeERU9yIifOcHMsIR0W4zz5BtIFnv3iEqSqIp6lIbYIw5ri9UStFSbdvjh4ZAsZ7/bclsuTVd9nx8km0ENc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------5670ED67006319AEDF578E45"
Content-Language: en-US

--------------5670ED67006319AEDF578E45
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/28/20 4:45 AM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../run-ptest                                     |  3 +++
>   ...python3-backports-functools-lru-cache_1.6.1.bb | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
> index c95a759ab..e967958c0 100644
> --- a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
> @@ -11,7 +11,20 @@ SRC_URI[sha256sum] = "8fde5f188da2d593bd5bc0be98d9abc46c95bb8a9dde93429570192ee6
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
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
>       ${PYTHON_PN}-pickle \
>
> 

--------------5670ED67006319AEDF578E45
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
    <blockquote type="cite" cite="mid:1593333924-4040-4-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593333924-4040-4-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../run-ptest                                     |  3 &#43;&#43;&#43;
 ...python3-backports-functools-lru-cache_1.6.1.bb | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
index c95a759ab..e967958c0 100644
--- a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
@@ -11,7 &#43;11,20 @@ SRC_URI[sha256sum] = &quot;8fde5f188da2d593bd5bc0be98d9abc46c95bb8a9dde93429570192ee6
 
 DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
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
     ${PYTHON_PN}-pickle \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5670ED67006319AEDF578E45--
