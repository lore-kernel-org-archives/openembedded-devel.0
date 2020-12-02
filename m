Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.71])
 by mx.groups.io with SMTP id smtpd.web10.5234.1606918179976530857
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hFk80rdJ;
 spf=pass (domain: windriver.com, ip: 40.107.69.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ii4hkKbfTopRBtSmyRfuqHRuj9qQuYBpcNCbt07Cec2JZsfIZcHA78EBXvMSWkGZCrTZRFkPtwY8Ck6rZwFXDnhB+VeGuRkA9rSA5wHnpeJgb7oNiGMTRco57HIzYawKabN8JpkrSYs8zMfC180KlpRWrSnw8bovEO6mtA0ViIXscVOs6ZyudBsbHKhYY3sZEFSzMTtoNp+6pjEti7T6Lqugeq3+D+QIbFyVq4FCJAkcZoeCTPPn26ICoZzf0i6Taa9ZNMC1JNIhVtbOFmj2WQMfkvM7bR71eBc3n9SVeTZtQEhu9TDoeYy+Mr3E7JRiswyWvHA8QBFglkEJuE1u9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwcIRKIojtr9dAT94qEez+XenryV/jQAKbEeKR9D8Iw=;
 b=Lebz/Z4I0zsp7WuUPaj+S0GP28VR4myc0uOPr9IrAjKa9o8xWYPujVZKtTvDHSir7xa1B1YrQ3Fp+NHYp3IHQJsr9UeGfgHzLf1wPo6PUJNBEuC4NplHVL807EtUIpkjEzR1GQw09WsP4p0m80uF6vw1HbVX1+C2qGu2Ub/JElOSqhFBvnMGdm2kACtolNKu3LY12i9+4LAzWM8c3+4MQoKw6jqaMjjNbIFF/2LzkggIaj/sAMdXmxOtpp/yN+hO6q7bZYJMlegpmyIeHos2Ito1RaDDgqkvvjmlSGJ0w4Y9G2DI8eywQBCC0VKw7SLy8Rlx3dIbbIAsKtRDvUu7HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwcIRKIojtr9dAT94qEez+XenryV/jQAKbEeKR9D8Iw=;
 b=hFk80rdJmJenJw3p35oJI/1AIe5maAdK3jzJFzxvnEFYkFpS2h22BK0Wm/amGeEGSfqm0tJX+DkjSbCXDereRUdZLqnTzwvq/1zMsUaoVL4FAup2wntPiQLH2dNtFvu96FjA1Cf7GX4UEqoiF4Hcw9V+kasIZa03gZNzoFyhWJE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:09:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:09:39 +0000
Subject: Re: [oe] [meta-python][PATCH 04/16] python3-more-itertools: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <cadb7b01d64a9a3de0e1b781daf244bee8b41dca.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5673684e-5849-2773-5f37-cad5545e2b8e@windriver.com>
Date: Wed, 2 Dec 2020 09:09:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <cadb7b01d64a9a3de0e1b781daf244bee8b41dca.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:09:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fa9fb98-7848-4da8-938d-08d896cbe7ed
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB486456D9380F3B5D904BCCE99FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TFL8dtDjhwDsfgaZEeqTLcz6hTd65KEmtSYfAsd9/vfj1F1bt+BrjPbLe6HozdIg02SzegbBmjUYA18VJgdWMGmVzN2lYKSsa579RhcXm0//OsYOlUo5Sf1v4x0b4yhYpdygZrjymiGgE2ufYi6XCwmSnU+2kZn2uNsTr44czl7f68DAH7Ysu0jQhk3jIrNLezBLHm6b8EKT+EKQsVqyKzYCoM7Jl6DdQqvw7brgpPymllx8HkExHUeJV2DnhTxONZhitZkBYX7neYUd7aUE6wtMkNQhQ4H/ySfFxF51/cyAgelaWNbVQyeoUISj/5ye3oloa836vTdd6Pxv85YUhSzSdJ3cTWFz875xTlaQpDtSyEeXaaTW3caB1RrWow4l/bgdj5+HWIyRndSRqDxTcMscT1SyXtXNdss1lfJpLJ0FhuHTbTve1MVgfApW+lX93tb/P5PsTtNOaJ6etQrXHO6dDdqFpn6MSQOabneiCMooFWGKnJytlgA9K4WBSoo2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bHpCYjhMN0FTZDY1WDk3dE5peE1qRjgwaTdsdUZkbjJ1cGNqU2Z5NDB5M0hl?=
 =?utf-8?B?Z2pLREpRMkpPYTJhOVp0eXcrSEt6N3lwWXlTdXlMS1YxS0JzeEFtWnJkQlZ4?=
 =?utf-8?B?cWVUZG1UOVlDa2l2dXVHUE5mcDQ0WW4yWlV2VnhsR3AxSXdVZ0ZSak5odm1m?=
 =?utf-8?B?NUREaHV2Ly9EVE45bm55OWE3UWtNVUJBa3AzTXo0Mnc1WUpCV212emowRFhk?=
 =?utf-8?B?WERJcVBnR0JYYWd1cVJqaFB4RWJMeFY1YW5uUFNvMWsyYWtjbXJ3dndpdzA4?=
 =?utf-8?B?VzFjcmpNUG1NVUZwK0wxQTY2emUvL3ArTklvMy8yWHJrbU9oa0hvc09KVHE2?=
 =?utf-8?B?RnNxSjNUOWZnZjc1dUhuaEZJZE1yYUlpdlFBZWVwZDJib2Y2RFI5b1cybytK?=
 =?utf-8?B?R0lBNFY4S21OVG55aW9OYmYya2hpT0grMGR6Vm0wUUd1QVBIQlV2TnpDa2JR?=
 =?utf-8?B?VVYweHVtWFdxU095NEFuTys2OU40NDl6QlMvdGNibnRsMzlQcVlSU1c5SEFV?=
 =?utf-8?B?WENtZC9jdmE5MU84NUh2Wjl5Q0MrVnhybk4zeUJnRFFqQjM3ZFJ1Vkk4L0lM?=
 =?utf-8?B?OUc1eXhFejFzb0QzdFMrMGlGTHRzUGY2K0w0UTI1MTlaWTQ0RzFsSGVpaWJu?=
 =?utf-8?B?elZRYis5MUFXZm5FenI3Y1BibGpScTdXOUNCVEpiZkplU1BrTFlMMUYzOW9N?=
 =?utf-8?B?TEZNNFczM2p3WjhxemRuSjZzaXRuRGVRTUJQdTIwV0ZPNnZIODlXd2d6cTBo?=
 =?utf-8?B?S1BiOEFsTmJteDl3c2dwM3JyYWVEM2tsWFBkclFsZ2FiTzZxYm5Ubm55NlR4?=
 =?utf-8?B?bU1XQjdzNEltTGJCU3puNzc2YUNGTnBiV014QjdJNHNrdHBlSHBBandIWTh4?=
 =?utf-8?B?RkUreUVQL0x1MCtVbHVXMEZ6WU1iaElJRFFqeURnQVR3WU9aMHVMampkcWZm?=
 =?utf-8?B?MllTR0RlVk93MXE5UVJwcHRoQWNrY1NlamtITlAxTWtISGZHZW5IK0FVY0Ev?=
 =?utf-8?B?K3Q0WnY2UnBzaCtLT1M5Y0hQVmNKRVdDblN4SCtMYVdldFFhRDN4RFpvVWo3?=
 =?utf-8?B?YUxGQjh5b2Nrc0VhNE0vVGo5WE80RGJCdWVwQndsalpkMXlaL3Fod3FRWDlz?=
 =?utf-8?B?bjlHTkxzbnVNRFc3YUhhMEcyWnlMVzF1SHcyME16UkRaUGpTTlpmTjd4RnJJ?=
 =?utf-8?B?NWczQi9OT2s5MDVYUm04Wm1PZWtOd2RRamxkelRzaXh2UkNPRDJOQ3JvU1RU?=
 =?utf-8?B?SVJNYzdzU2RRYzJDWEFRTzFabklrakRqU2dzZVdzdjIzNENwRVkrQnZja2lL?=
 =?utf-8?Q?crlhj/7V6RE+DemFDjI0LOFUX2Oea9OVSx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa9fb98-7848-4da8-938d-08d896cbe7ed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:09:38.9357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnE8iIiANQnk3RIjemlQLtbCbmPnczIsFnbZRwVBG+XA7JTnGmRl8HnrwNsnKQ12QVeFqm2ldc+x7W5y5aH/tt1mAxDbXNRqi45WHQqYr2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------302A2FB6D291F3199F02AD61"
Content-Language: en-US

--------------302A2FB6D291F3199F02AD61
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
>   .../python/python3-more-itertools/run-ptest   |  3 ---
>   .../python/python3-more-itertools_8.5.0.bb    | 24 -------------------
>   2 files changed, 27 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest b/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
> deleted file mode 100644
> index 3385d68939..0000000000
> --- a/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
> deleted file mode 100644
> index e924b0f731..0000000000
> --- a/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION = "More routines for operating on iterables, beyond itertools"
> -HOMEPAGE = "https://github.com/erikrose/more-itertools"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
> -
> -SRC_URI[md5sum] = "2588b5a7042576b99574779582be9292"
> -SRC_URI[sha256sum] = "6f83822ae94818eae2612063a5101a7311e68ae8002005b5e05f03fd74a86a20"
> -
> -inherit pypi setuptools3 ptest
> -
> -BBCLASSEXTEND = "native nativesdk"
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
> -       install -d ${D}${PTEST_PATH}/tests
> -       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> --
> 2.25.0
>
>
> 
>

--------------302A2FB6D291F3199F02AD61
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
    <blockquote type="cite" cite="mid:cadb7b01d64a9a3de0e1b781daf244bee8b41dca.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:cadb7b01d64a9a3de0e1b781daf244bee8b41dca.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-more-itertools/run-ptest   |  3 ---
 .../python/python3-more-itertools_8.5.0.bb    | 24 -------------------
 2 files changed, 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest b/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
deleted file mode 100644
index 3385d68939..0000000000
--- a/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
deleted file mode 100644
index e924b0f731..0000000000
--- a/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = &quot;More routines for operating on iterables, beyond itertools&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/erikrose/more-itertools">&quot;https://github.com/erikrose/more-itertools&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5">&quot;file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5&quot;</a>
-
-SRC_URI[md5sum] = &quot;2588b5a7042576b99574779582be9292&quot;
-SRC_URI[sha256sum] = &quot;6f83822ae94818eae2612063a5101a7311e68ae8002005b5e05f03fd74a86a20&quot;
-
-inherit pypi setuptools3 ptest
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
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
-       install -d ${D}${PTEST_PATH}/tests
-       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
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

--------------302A2FB6D291F3199F02AD61--
