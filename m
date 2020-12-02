Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.86])
 by mx.groups.io with SMTP id smtpd.web10.5225.1606918150253218717
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PIw/9ZKk;
 spf=pass (domain: windriver.com, ip: 40.107.102.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiRaF0eIEfdiponRkTYhRcnIm/B8pMjKSsIfY22+Cd7MJorJynD2eod7g6U8c693YHu2MC2172ezNq1phhsQhn5p13I1Lb5g6uC3nxsmVE0aS/st59eSLvdjwp8xONJt6+r1smSQUzd3V1b6h8LcNxBzQEmaNbL+K78s8RYj1yFYJlgzMd2RYWoqDx78Mp1ZDLFmoEHUZiVH42mQ0E1sEReFjG2trrB3YhrI5T5HA3TBJXarRz9zlq5a/5xXT2FlavwbGTdilKJdxl2SkV/sdJJkwJItZSeFwvtH8uBujcpYiMsESthIoBSualRYd4FJec5Oi2U6Adyk42KvbQHc/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y55ju3ING1l6hic0/uFjfkj4/KtX3hSPsxM/jkbQLbQ=;
 b=bZB62DKF9sw966/t/N3H0vV1RILNGVHPuFCMRity3XvWvDpROEWW9ujcupGTSDjmesZnf9ooDk42YDOo1418vzk13Gxusin6JvCsvRpmtrMUUVRGIDv5MTYLqHDRnJ8MsWnVzSu7pN5g7xRAhTqhqVKcOQAxvngVFqgl5izefnhU7Ss/hcS9xBU6frEQqV7nOCch6yD+6xkD0/kK+UQQdjg4h/RfOsD2w/9jiKpNu/eGncAURdoNef5qs6BIsIVrMilKtQb9b4dRc0qAcFbh70XwKUZ4vsPalR+rIh6gxBWCmbasGuq6JoCh6nLYuIdJesCEeSjbV4mxyexn27g3mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y55ju3ING1l6hic0/uFjfkj4/KtX3hSPsxM/jkbQLbQ=;
 b=PIw/9ZKkgvdYTd1EWEcBlm+JzVei7jrh9B42Q7A0LF5i9q243f0o62h2Qc7zFzREZlM/DXVJYDqa6srW0+fA84+r3d6J2RjBaWdcmdU8YPFpHYDCHWFJIOqflmARap0OUTMxILUjF+wQ9zNLC4u1GjB46HbtJ1prDJmsTe8tvl8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:09:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:09:08 +0000
Subject: Re: [oe] [meta-python][PATCH 01/16] python3-atomicwrites: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <2bb86ee96cc90afbf46aa36c6f31d74f93fbead2.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <29bc698a-eecc-cce7-b3cc-5935c4807299@windriver.com>
Date: Wed, 2 Dec 2020 09:09:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <2bb86ee96cc90afbf46aa36c6f31d74f93fbead2.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:09:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dc6f683-0e6f-4a82-4ed4-08d896cbd5df
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB486439F51F79287735006EA99FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wgAVK+uP3Fui8RX3c9/sMXGDwgWVz2kr9bgVUv6tsvGHB1r4HKGGpqpREKBZucGESSioufopP+VqUan7obswC7TPUUDXd9oY0E34q0xc1igKiZn7DBx2LJPMrWc47U3GwIES7X1PxnuyupH5YYKSE2ZoKn1aAwh4b0Go5Tg0ImM0rC7ubDJxHzKYguauc6u0U5D7Fe7+86sjopD6XAOqO7/lqWfX1E1NU2B0ebUyJjUcvICJ3en44/VAB7g9mQ2ZpZBRqyxvgMEdeg/Sg2QHIElY5W+GID/1XEFoDHevJQKCEDN29ZuIZmQNNCft/Derl1Z4Jxd17a23164N5HCsgz2cjZECT+HbK26SSkANsL4BnezJhO3AuYq7d8rs7uSs+rM5vSaP+NsWQQ820l0JzPid1BzYKAehgcb/HgEfoBgS7HamY28PUcRExq/dzluxgclr0zd/mW1VJQeS+ZSgY2coUpqs89F1OTruJ+SXrmQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39850400004)(2906002)(2616005)(26005)(83380400001)(31696002)(16526019)(66556008)(966005)(478600001)(66946007)(31686004)(66476007)(186003)(5660300002)(8936002)(33964004)(4001150100001)(52116002)(956004)(8676002)(53546011)(16576012)(316002)(166002)(36756003)(86362001)(6486002)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TkRiSVZYV3Iwc3htUVNMVHc1QmJwZXBSWGN6ekJVUWxQU3dFamZ5VVlybkpx?=
 =?utf-8?B?QXB6TVV3WlhTOUFEUnNOS1FpbUlHQWtKcFp1akNacmZuSmc3SkxzN0JzSXZL?=
 =?utf-8?B?aFJ1V0dYRm5UaWpLaEhYOEJlcnZNb1g1TklaeUhHRHhXY1Z6aUUwOFkrVTdP?=
 =?utf-8?B?VTMwS2hPdHpZbCtZdnVTTW5CZHdCQWpwOTdiZ2VhQnpzT2dMbGtselVubkwz?=
 =?utf-8?B?dEJONHFsSERLeFdiWU5ma0VITG9LeXVCZm9RejRGR3lWc2llV09uU2JaRElG?=
 =?utf-8?B?eVRUYzNkOUthVEozYUREdE5meEljSlJUalZOTVdJcG5SdDlXVys3bHpPZEVL?=
 =?utf-8?B?bi9JTk51WXMwdTV3QUtqQm9OQXliWnYzUnFNV0FwUDd0RWFEUy9JU3dWYlFG?=
 =?utf-8?B?Vk5yWUdvMnBTbzNrc1ZEaEt3ajBjeFdtT3JwWS9DS2djWGxEbjloc1ZnRElJ?=
 =?utf-8?B?OXBqdUNpU0VzeElZalJEc3BEMXVvNzlDeUkwdXkvUGI4aERuaE9oWW5CeDAx?=
 =?utf-8?B?RGZyQ21NZUhTMjJFVDBYYk9OcUtmZHUvUkZUUzNEUUt3OUFtUks0UFEyS0dJ?=
 =?utf-8?B?Z09WWXRFRlQ5MzdiTGJaMElTZW9VWmw0YmFMOXEvd2dPUTk0Q3M3bW9lckN2?=
 =?utf-8?B?QVBPc2JWZndmbTFoekZicDM5Slc1NWNTUEtDV3N4WmZIaTUvL0NHd3BucWtk?=
 =?utf-8?B?WWZkNTRtT2x6NFdjdjZPY3Z0SHlLbmFoMTlDQy9tY0M5aXpSQTJzY2ZzYXJN?=
 =?utf-8?B?ak80ZGVWS3ZmczZUVmFQNDVMMm5PdG5GZWV4YTB2cEplMWhFTDZNR0pXSzdE?=
 =?utf-8?B?R0VZZ1Q3M2ZSTnd3SHlOWUljMzlYWmQxbGhGZEEvalJUclJPV0JoRm1tQ0pS?=
 =?utf-8?B?NUlhQWU1VG55QWtrSVNDQTExY3FKejIrcFVoTTFEQWxKd0EwNXdUMWRFMURL?=
 =?utf-8?B?eE8vZGlaVmJmdDFqUnJUVEd1SjZBSG54T1NyZzdrN0tpbHpNRWxrc09hdEk2?=
 =?utf-8?B?V2pBTWtHSm1RWXN3MFluN29qUXR6d3RwR2tHVUI5NDA5ZmVtMTRWRWRvczJn?=
 =?utf-8?B?WkZhRFpaY2V4aitxVWFJUndNQ3A0bjdqNU1TUVRFT2pUekV5Y1lxMm1VWjZt?=
 =?utf-8?B?amhSKzZiL1dRSExuQXpEWjBVOTk2MUxocDJTWk9XMzVqb3ZiT2c1OXlVMDJv?=
 =?utf-8?B?emlmRk1QeTdHZVdKeUZiMGJ1aFk0NDJXL3JybjNWTkxmb3JQYTBUUCsxTTBy?=
 =?utf-8?B?THUrTzRLZlJZSjRmb0FxRzZjOGpJbm05bzk4Nm5WTm1tem5SK2ZJK0N6RnNV?=
 =?utf-8?Q?BisfCqFZl4rg4sXy7QU9T+D+eTuaMD1Fzz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc6f683-0e6f-4a82-4ed4-08d896cbd5df
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:09:08.6382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUyhtB9DB3A33UP4cNRBX4dLLQ0jS40zXNrXoFsDg/hohf0GbFAhLUMb4B/D6L2YZHIIt8Iqn02NlQLVyuU1sTVGIwhBRJ5PfgYe7Hyn+7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------F6ED44C17A6FD627DF79601C"
Content-Language: en-US

--------------F6ED44C17A6FD627DF79601C
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
>   .../python/python3-atomicwrites/run-ptest     |  3 ---
>   .../python/python3-atomicwrites_1.4.0.bb      | 25 -------------------
>   2 files changed, 28 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest b/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
> deleted file mode 100644
> index b63c4de0d9..0000000000
> --- a/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
> deleted file mode 100644
> index 7edd41030f..0000000000
> --- a/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION = "Powerful Python library for atomic file writes"
> -HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
> -
> -SRC_URI[md5sum] = "b5cc15c8f9f180a48665f9aacf91d817"
> -SRC_URI[sha256sum] = "ae70396ad1a434f9c7046fd2dd196fc04b12f9e91ffb859164193be8b6168a7a"
> -
> -inherit pypi setuptools3 ptest
> -
> -SRC_URI += " \
> -       file://run-ptest \
> -"
> -
> -RDEPENDS_${PN}-ptest += " \
> -       ${PYTHON_PN}-pytest \
> -       ${PYTHON_PN}-unixadmin \
> -"
> -
> -do_install_ptest() {
> -       install -d ${D}${PTEST_PATH}/tests
> -       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> -
> -RDEPENDS_${PN} = "${PYTHON_PN}-misc"
> --
> 2.25.0
>
>
> 
>

--------------F6ED44C17A6FD627DF79601C
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
    <blockquote type="cite" cite="mid:2bb86ee96cc90afbf46aa36c6f31d74f93fbead2.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:2bb86ee96cc90afbf46aa36c6f31d74f93fbead2.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-atomicwrites/run-ptest     |  3 ---
 .../python/python3-atomicwrites_1.4.0.bb      | 25 -------------------
 2 files changed, 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest b/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
deleted file mode 100644
index 7edd41030f..0000000000
--- a/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = &quot;Powerful Python library for atomic file writes&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/untitaker/python-atomicwrites">&quot;https://github.com/untitaker/python-atomicwrites&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4">&quot;file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4&quot;</a>
-
-SRC_URI[md5sum] = &quot;b5cc15c8f9f180a48665f9aacf91d817&quot;
-SRC_URI[sha256sum] = &quot;ae70396ad1a434f9c7046fd2dd196fc04b12f9e91ffb859164193be8b6168a7a&quot;
-
-inherit pypi setuptools3 ptest
-
-SRC_URI += &quot; \
-       <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
-&quot;
-
-RDEPENDS_${PN}-ptest += &quot; \
-       ${PYTHON_PN}-pytest \
-       ${PYTHON_PN}-unixadmin \
-&quot;
-
-do_install_ptest() {
-       install -d ${D}${PTEST_PATH}/tests
-       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS_${PN} = &quot;${PYTHON_PN}-misc&quot;
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

--------------F6ED44C17A6FD627DF79601C--
