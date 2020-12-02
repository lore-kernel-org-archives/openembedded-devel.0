Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.47])
 by mx.groups.io with SMTP id smtpd.web11.5465.1606918286998496304
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=E+EQJHjt;
 spf=pass (domain: windriver.com, ip: 40.107.102.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHfC3wICevk1XElXYnPGfN4ayp/3Q7m28t/0/17jNr+/07fl45NvwZ9y+c1SboU8oYMra4JEw5NPV0rj3YryuA6FGw6lgyIrW/8hzvZNFlJz/SThYR7yW33q+Vg1q1BS7XfZ5jSj83XLSTPdtbASuM++8G5yX9ZMBhcBs2BOYe5jjtsY+AcHsvDKX896AcxPphY+N5mTx7H+GP3kkJvzPbYpMrzNt64DyvBtNBGP7fGgDFbLl8mFnvaMY+e3waaEZAz8dBaTVlqLiRaDwlRus27UyJYUOpvJojJ7dCfH/eB7smR9sGQ20JI19JNEHNoud8sfTHrfXU9vKzibisBi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxK739qVFH0FTFYX3PyoinTVORW8/AE+4e3b6sLYOAQ=;
 b=oCqsHATlvv6jUtxZKE0foxaOqUjBo8WaZjIj3dHMQ1otQVxd95panE3yUq2QMshErdu4wpT0R58BaqoUsT6osZ4iQgoLz8uLnhU8zAbR9GlEAyBNYzcGdi6bZMI9o0JA1OsbQI/KyFUd6/1LtLry+0LlVv/mDrl7N0lkXKf8zpgw26IrWcJd20+68ZEbpt2Qjydgxpu43hOwZujoOvvQKpwi7LWNQZdGiOfgNbz6vDFjbVwpQTJJAzZ/U8GMxjyXyixSOZ1clLAgPRoQ1PKQ1HqYsdMeUdV3bYtUuKkRdTbTYHoJHkzaOcNttawxqJrnFYX0vUBjtJxoAWrF08sAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxK739qVFH0FTFYX3PyoinTVORW8/AE+4e3b6sLYOAQ=;
 b=E+EQJHjt8hA3oa6z2cCL3JDuEeMpYQk/dXsI3VTmfJGwB0jTZiOto0+M16Cc/EmG4rJC2EGtgKSkx54rRnh8Ns/EtZNYb9aXM2ophf2D5QjGSNT5GoYlnmRPB/2P66c275lkLaf3BGIdQbqr1Y449wb1qW6vMzMTW/1XQLscz2g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:11:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:11:26 +0000
Subject: Re: [oe] [meta-python][PATCH 13/16] python3-pluggy: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <a54682b5e4bbb4d9ffe39c25431804f4c526d605.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <50a85df0-af23-8ac0-ff5b-e984a001dd5d@windriver.com>
Date: Wed, 2 Dec 2020 09:11:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <a54682b5e4bbb4d9ffe39c25431804f4c526d605.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:11:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76579a35-5bdf-4e88-0cfa-08d896cc27b4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4864E65588150699E55D6BBC9FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i4zMFf8B/31ID3R9TWaCR28hg5mPlpjGvknvHEZLr5NNMs2qz213LsxwmJ3IsOThJwJfOGlMl/JKlLlNi7gBZ1A3leyG5cWZqCJ6C1EGldaDGwqf0GlIovWSbFD4BBv+r6zbLy4sn7oIdBZ3TcjZZYCoK2Iib4wG7FcfU5TmwhtfKXvaGYft6IKYpKzuRr/3uQJ4L6+hzc2RmBYrjXRoJCYdl4rrzbU+9MNkESyTHrN3Iv3Duk7HHyPqWSVcYu1Rtf7r1u0KAKKoYEZoCfpJ9Ulifa6uGZaFxXTlp4FM8k7To3RVeoNGoBTDYcOKftDstIOisH4eF2NEcbrfAZAtfFV5znr9jG0Ff14yC69Vk/EkyXB5cte5Y3KHGUcYja7B2H5vO/nYAep6eUAGs6qafIo4wya84hHwxkn2Pvi90CujZenXgwEfQOka9VMv1U5zsiIFZx3f6xEgBr97V3uSzSoOaigeELkUXMgUqm1zU68=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?K29OZW8wSm5OdzZvY21PNFdiME1ob21leHRzekpzRUJvUGUrZm1mekMzK3ha?=
 =?utf-8?B?VTFQdXhNeW5YNUVLNkhCeFhHcExOWnZDRHZGNnIxaGR1VGQwdTZtNUptZEhx?=
 =?utf-8?B?UUpoekZGcFp4VW1IS1labmdoL3B4NklJb0pMZzhKRVVwZTh6SGFZbWJkNElY?=
 =?utf-8?B?Q3JyZXh3ZDQ2dE1QbG5Sd3NGMnhHNjA4MFBXZHNJTG11SEFDcU5YMTdiZUll?=
 =?utf-8?B?NDFtdE9WeGVWbmdRTFR4bWVtZmk5bnVXdHY1SkNBaCtPWitxcGNJS2tVRTRM?=
 =?utf-8?B?R2ZDUTJVMmUxSWFJREE0dEhoa1FVUGFDbEVjc09waS83ZElvOHNTOG9wK01O?=
 =?utf-8?B?MTRDcFlGZjFTaDA0R0FjdlNQQS9kL3ZZNDBTQnJ2NkNFeHo1QUU4b0JjUk1I?=
 =?utf-8?B?MVo4WWdkOTlXRHNyeHNocFNyeVBFdWxSWGpUNElMUWJSb09kTU9Va2RkN2h2?=
 =?utf-8?B?MmFocFMrN2RCaWlyVDAvd2RkZnRIQWJ1MFNBVExwY2JjSC92MVpQR1pRWTdL?=
 =?utf-8?B?cG5OdDdFWlhiY0pNZFpUQlhXSXJ2YTl4b2tMbDFJSklaQWloR0ZaUC9jajVV?=
 =?utf-8?B?UitjU3RHQjlYV1U0K1hEYklRTmdXMXkwcEtQWk56Vk5DU3RlS0NjZmpIT3cv?=
 =?utf-8?B?anJPS25CNmFOSGNCU2t4MngrWStsaXM1ZGpKNVVUYWZoOE5hNDhDMkRLTTMv?=
 =?utf-8?B?RHVlVGpFTnpteDFzb2g2TmhsU0NTbzA0UUMwSG5VNjExK2hQV0JBZXZqdEVP?=
 =?utf-8?B?VlFJVTd3WVhSbS9YR0RoTFJsQnJrS25IWURLY1ljL2tGYTlLYzlhTzR4YndL?=
 =?utf-8?B?WlNPTVkwYmJ1M2ZjMGVscEtnblNsMHRoZWpuRVBFMElaWEsxVUkzNGlNKzFX?=
 =?utf-8?B?Y1hFRVl5M2t2R2tOcUdKYmkydGJsenFKZVpuWVFZLzJOb0pSaFowbDNGQWs5?=
 =?utf-8?B?aFhvNXY0eTZyd05sRWxFcFN0bFg1OWJ3bXRMc0RkclJIcUV0RFgyb1U1V2wz?=
 =?utf-8?B?SEVCVFBHSnJWTTFZWFBTY0s0SUE2dU1mUi9iK2p4eCtlRHJSMjArVzhZMVlC?=
 =?utf-8?B?YlJsdXlFUEJjS3BnR20va1B4S2h0UTJqaGhWdHpGZzVIditPSytmTWkyOHN0?=
 =?utf-8?B?c0xzdUljWVpEUHhjbDgxUXpsTHpxOUd4dWJlODQ4WC9NLzdoVzNGWEM2WSta?=
 =?utf-8?B?Y2lON0gvOU45dDZZQnMwTndQNHU1Ull3c0RVT0w1eUtiU2I4cVFBMElnVHBZ?=
 =?utf-8?B?RUptNTVFRTRJOGRWL0FhT1hoOFNTYWlPbWwxYXl6KzNkVjR2L0hCcmtDZUln?=
 =?utf-8?Q?gEY98bJRvZ50wnDW2PU5/hlRoOgo50Be4l?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76579a35-5bdf-4e88-0cfa-08d896cc27b4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:11:25.9479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzbg+XhCkiSUNdSvKwcM7TBbGdSsgf5TPk4h9YCRf8gDOEvgkrgQUv4haIUFJP8V1L/5dSWwZb2WznfmdNuLg4mQszwPaYSnlXvWG54s1sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------CC1963E39D9BDAD69C15E262"
Content-Language: en-US

--------------CC1963E39D9BDAD69C15E262
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pluggy/run-ptest           |  3 ---
>   .../python/python3-pluggy_0.13.1.bb           | 27 -------------------
>   2 files changed, 30 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pluggy/run-ptest b/meta-python/recipes-devtools/python/python3-pluggy/run-ptest
> deleted file mode 100644
> index b63c4de0d9..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pluggy/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb b/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
> deleted file mode 100644
> index d3e0365ca1..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY = "Plugin and hook calling mechanisms for python"
> -HOMEPAGE = "https://github.com/pytest-dev/pluggy"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
> -
> -SRC_URI[md5sum] = "7f610e28b8b34487336b585a3dfb803d"
> -SRC_URI[sha256sum] = "15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0"
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> -RDEPENDS_${PN} += "${PYTHON_PN}-importlib-metadata \
> -                   ${PYTHON_PN}-more-itertools \
> -"
> -
> -inherit pypi ptest setuptools3
> -
> -SRC_URI += " \
> -       file://run-ptest \
> -"
> -
> -RDEPENDS_${PN}-ptest += " \
> -       ${PYTHON_PN}-pytest \
> -"
> -
> -do_install_ptest() {
> -       install -d ${D}${PTEST_PATH}/testing
> -       cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
> -}
> --
> 2.25.0
>
>
> 
>

--------------CC1963E39D9BDAD69C15E262
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:a54682b5e4bbb4d9ffe39c25431804f4c526d605.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:a54682b5e4bbb4d9ffe39c25431804f4c526d605.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pluggy/run-ptest           |  3 ---
 .../python/python3-pluggy_0.13.1.bb           | 27 -------------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pluggy/run-ptest b/meta-python/recipes-devtools/python/python3-pluggy/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-pluggy/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb b/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
deleted file mode 100644
index d3e0365ca1..0000000000
--- a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = &quot;Plugin and hook calling mechanisms for python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pytest-dev/pluggy">&quot;https://github.com/pytest-dev/pluggy&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2">&quot;file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2&quot;</a>
-
-SRC_URI[md5sum] = &quot;7f610e28b8b34487336b585a3dfb803d&quot;
-SRC_URI[sha256sum] = &quot;15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0&quot;
-
-DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
-RDEPENDS_${PN} += &quot;${PYTHON_PN}-importlib-metadata \
-                   ${PYTHON_PN}-more-itertools \
-&quot;
-
-inherit pypi ptest setuptools3
-
-SRC_URI += &quot; \
-       <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
-&quot;
-
-RDEPENDS_${PN}-ptest += &quot; \
-       ${PYTHON_PN}-pytest \
-&quot;
-
-do_install_ptest() {
-       install -d ${D}${PTEST_PATH}/testing
-       cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
-}
--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CC1963E39D9BDAD69C15E262--
