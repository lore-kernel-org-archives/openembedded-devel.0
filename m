Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.65])
 by mx.groups.io with SMTP id smtpd.web11.20688.1593442538635125471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=E56Zho3N;
 spf=pass (domain: windriver.com, ip: 40.107.223.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLsXIh4WkyF5ci47f3yalbra57+5NhjmzY41E/33EcNOnIi4BR2/RK72nOejmvYPdd2d/IJP7jRN2U/pKcYxCq3aERvLEpl1SP5n6Vn9f7MR6pcpiPno4sgcGV70H7MoHMl8OmQpdcnpeOgqU76WigoT2jlTp4eALPC1z7UJuTyQW61bCsK1OP4TfiabdVMDnWS8tXVC3pMNYvWIZL3e2I4l2bKQzTVvpzMStjNA/DptGpzt88QHrOnqtP3obFRHb66E0lAIji0mDRYurQf6+ZXbMMPatd/uJMwRU8xJ1rTZ9mqWC1W4ceRRDfBrnaa8Ht8EAM8Q47akcZT4+7pqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzIslA/cPcthNUsfmnZnCefjz4+vd2Mp1gpoft9wjWc=;
 b=HsHb4Oir+z+Yobwblxtati3WZWTEppQuCWeC3lHRDimh6xqmtwqY3takVL/jeSx7J/8CV7l97fbDG+EcrCZgBQNZjGhqe+vCv4HBDWeLCkGRNJkE0SlGZC25ZFfL5JrmA53ItsjfK9/97rdgebxskj0b+8opG5wmSAmG3ZYKHR6DsMLeedbWd39fpvTjwz0RKQpozCLAmcL1KFP8eJd7wUuJvlg7vFbmMZ5NO5cA1H5TScK36kars50tqIoMz0YXpRNDIjx5iYHSRvuOU4G7lY0USl0Il/VoeMHSww8O5bEOUKw2iNcH2ZDuK3FPOy7AjYUbR8nrhexFLdoR1jyUMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzIslA/cPcthNUsfmnZnCefjz4+vd2Mp1gpoft9wjWc=;
 b=E56Zho3N7AZAm+rOIzwRQK6GVeyGwdvH0EsRaddKcImYRBzAZqhxHiBWSxVD2aZeypFFV6E86xSw9Ks7xDmkEanS/xH1fecEIysDoKB5aHC/vQnhuYAT0VzoZQNIrVQR0HkH+h0ebgUzloN/J2G6YZXg+dcQV2FAGDS/0gMsxto=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN7PR11MB2577.namprd11.prod.outlook.com (2603:10b6:406:b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Mon, 29 Jun
 2020 14:55:37 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:55:37 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-anyjson: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1593333924-4040-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4ee6f197-17be-1cb0-0896-512a31c41399@windriver.com>
Date: Mon, 29 Jun 2020 10:55:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593333924-4040-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::23) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0084.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Mon, 29 Jun 2020 14:55:36 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af5ac518-8ba6-44bf-0cd4-08d81c3c7baf
X-MS-TrafficTypeDiagnostic: BN7PR11MB2577:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB25772C2B81AC282A180CC9239F6E0@BN7PR11MB2577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	00kImhN2h3i0PV/ANhoIQUr+BhqxmbvEeZmxU14/UpBmPNJxdmF39M6TvpTvpZB1XoB+bBTjbU55N9MWOuf8mAuxwtkoCVhOMU9jYf1SGHg3xCGl3daMPllZYR1quO8PwunV/cPNb3e4Va0+YjDoUjWsuse2KL3f4yvBHedbqkirVrUFqcjFSPccccVHYl9oW4ciVameqGFLByn8ayk/10HpsFOzgq7Daw/FcnTda2xjBFpoXr2NDyedwZJIl0qkuUGo5iqeMft+rPipH759Ce7lxlDZ4lx/fIEtv6kyQqYfv/d+rNyI3q3SCsLM/q9JOdgvTxmx50ZxpsRfCRLKxbcWZci4tcs+CEW/J1Mvv5nK9rZCCXyNc4zSqKAAwRzsuQr8cnDvMrxxeoSf6TEX8B6fRXDbKZ4j7/635vWoNNYLsS/9blKZrMfmbs3CD0Pui6CyAU51Owrt4sdp/qor1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39850400004)(366004)(396003)(83380400001)(66556008)(86362001)(31696002)(66476007)(166002)(16576012)(316002)(186003)(53546011)(16526019)(52116002)(8676002)(33964004)(478600001)(956004)(5660300002)(36756003)(2616005)(31686004)(6486002)(66946007)(8936002)(44832011)(966005)(26005)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	thaGbkBISyV+Ds84li0VLnQe133Z32bOLjTt7hoZpwNhA2Y1HHI5EPrHtwge7HXKDQoOomAZLM4mfvn56uOyFlbqoaXHU5Dnb10LJOVx9X1ryr5AfZsWIVBfn49VlY/jBCkF0TjBg3cVmib0OsGFGGy+igMVNPggd3muhThUhEulBCHYRgNtVHu6jk43U6FxNu2PapWW/UHGpj0zHGvr+o8lDu1JJL4VIJPzRq1nNFqpEjB5c6ewf2QtNNn1Pvj/ybXCnS4S6tZs7w4yNNUl3MgqhOKEtyrRWYwvDTMJEplap2FoZfkKeMouNdTdmSPbM6VqUUNmJfJj7HJpiJcNGD53K/5pKK/bCK5tNlmQ3VpmrluoOJ9mE8uT9BtpPWWz9nwkY8/IbqUOOcoO6eleird6ANRyeVIW+LgGjyxA4MJHwcEaFSjeuyCD+Y+3ZKFHRJ8T2v4owXHwYddX8vBB7xLuXGJFnoBmqaByfH9DVHFXey2kV2DFbOa/TG7pBqMA
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5ac518-8ba6-44bf-0cd4-08d81c3c7baf
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:55:37.4648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EuCYjrov9MviM/85WT3a6EdgXvAMYlCufVWfoTtGXXmZSS4UIXpq8EA+yh0WMDzQRqCQvv2a21pS3x/IUz4+slyaatlvHs4DPevT+sSfnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2577
Content-Type: multipart/alternative;
 boundary="------------D7DCDA758466E999EA50457F"
Content-Language: en-US

--------------D7DCDA758466E999EA50457F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/28/20 4:45 AM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-anyjson/run-ptest             |  3 +++
>   .../python/python3-anyjson_0.3.3.bb              | 16 +++++++++++++++-
>   2 files changed, 18 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-anyjson/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-anyjson/run-ptest b/meta-python/recipes-devtools/python/python3-anyjson/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-anyjson/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
> index 91c66724f..2176f20aa 100644
> --- a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
> @@ -5,7 +5,21 @@ HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
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
> +	${PYTHON_PN}-nose \
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>   
>   SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
>   SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
>
> 

--------------D7DCDA758466E999EA50457F
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
    <blockquote type="cite" cite="mid:1593333924-4040-2-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593333924-4040-2-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-anyjson/run-ptest             |  3 &#43;&#43;&#43;
 .../python/python3-anyjson_0.3.3.bb              | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 18 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-anyjson/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-anyjson/run-ptest b/meta-python/recipes-devtools/python/python3-anyjson/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-anyjson/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
index 91c66724f..2176f20aa 100644
--- a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
@@ -5,7 &#43;5,21 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://bitbucket.org/runeh/anyjson">&quot;https://bitbucket.org/runeh/anyjson&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08">&quot;file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08&quot;</a>
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;	${PYTHON_PN}-nose \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	install -d ${D}${PTEST_PATH}/tests
&#43;	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
 
 SRC_URI[md5sum] = &quot;2ea28d6ec311aeeebaf993cb3008b27c&quot;
 SRC_URI[sha256sum] = &quot;37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D7DCDA758466E999EA50457F--
