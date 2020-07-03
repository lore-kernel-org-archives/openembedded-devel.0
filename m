Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.80])
 by mx.groups.io with SMTP id smtpd.web10.10874.1593785066038001917
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KHv4dhew;
 spf=pass (domain: windriver.com, ip: 40.107.92.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnbBT4cWUHf40H/hE7YCcbfrcxVUgirzpieKudpEpCqWXs5bPbVrZjsQlFutyGOVO0qc4xxNs3rV+zn94ILoCxnkNry9sWAulrH0vqgXsnZiK+hZTCULcxyeY+jHmX1ajCkQ5saaLJx5yYJjDK5HH3Qy5bkTrFBCmkXKSdSIHLo+RqmjjpTp2wDV6IU3Pmt65UW///sHOhYP9qt7FVb8zkx5F521ZFB4Q2vI8X31UuU6ywDNIdtnHkNY+wUdtbJeCsXpI5y6kaYMUz40Ytg+PTHRE7ORBVffYNtHQI9+sfdOXdguN2tB/l/pkINKsyQrAY/ZBeh/73IsJxTYZSD2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9G93zm0YhEgABuKyFCixEzueguQGTuolUNhE/9yBR4=;
 b=GfElhr5uumg1t9iDgWS1ExCp03bfufrpZN3zLqG1hGn/QON75I258ALl6bHQOflyBKJQkr6QCF98IrUsAqjp7pgEK3ilxqWkt5PQs5pOnZKNa2M1BGmjw/9XKb84kQsVnhRf+k2F53YqiA8qjoyB7tQwnxNxbx0AJx43EYB4vd4cdcEtTZEBnx/E0M9iMCyY6Yqs1fvQhJlxVlCMPWo4XdUl45mkuZuf8hsYUm9mfszQm/cRMsDh6HE453nRzmySb0HfGdvoy0EsgEpgdy/64yaoNua/4+SP15zEPJHGsODx2NYzcY7b8zwqSgCsvylAE5/+mH8BtZFmL4AhB3NBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9G93zm0YhEgABuKyFCixEzueguQGTuolUNhE/9yBR4=;
 b=KHv4dhewZjnwflVsVVnbJB3g0ARICHTuZq7t1h/PVt9HltRCqZoFjBdNkCFGvPol3iNX4OwiLJantEvKs0XS9itmrZNWPMK+P+eWj6u5Ad8SqiU2aFcvNWYsFRrSPhANlxzgI5JqLewR8q4uZEfWP0k6mquWkv+p7jWjqQ2EFhw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Fri, 3 Jul 2020 14:04:24 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:04:24 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-wcwidth: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1593479853-4475-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bfcb59c2-8d3b-fb97-c24b-5bf5ed97343a@windriver.com>
Date: Fri, 3 Jul 2020 10:04:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593479853-4475-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::49) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 14:04:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99283410-2643-4a14-c829-08d81f59fde0
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3628A35C9855BAF54B8ED0E99F6A0@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bU9OlzoGv+L2fYmzS4tgkyEH5QIgp7jwiz5cRs8iyktmhnahujpVMs2Y2gTyUYuE3Zd2fwZjpfMvvtNVfunojynutCOGUsbRW+w4laTfQ2LzVf8Nvmj4SRwdnI4nfry0Z8vBxq2YFFXzPkQTA7mxKMsNPh61ju8IY5C/xmKL1PJe9hsP/j29nw/muBTVOdtmO4FhqhXW3LlBhZCgUARRU20kTvYiJ2K8fgGcfvjWcLk7+w1BabooSSZAzYicu+M2qfcwFPC/Bsb6l1LdMT9h2QAzpPkLisWEpfds0AntqxYPzxrSkqX5TbNRsS4N8OsbIXUIHpDsWTUyOKF4Qf5noprM5wyUrVPp7nXdfY03B+9c5F47A5DKDbuasf7NjAunjtBSZ+f05LolT+zGVkdLXwG7oRfbk93Q+opadBkepWGNtyu0Mtzt1Xpl9nCsn/4xqcRazD8au/UKaPkuPin6og==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(366004)(376002)(346002)(186003)(2906002)(966005)(52116002)(86362001)(16526019)(5660300002)(31686004)(316002)(66946007)(2616005)(66556008)(956004)(478600001)(66476007)(36756003)(26005)(8676002)(44832011)(53546011)(6486002)(16576012)(8936002)(31696002)(83380400001)(33964004)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	a5zNhz5B6jlEG6HLilDl6FlEpeSJL5s1ciCOA+2UJavtkXVnyu8uiBbiiAZFXCqZw/2GPbJeXWultFOra1iZttCnjvyIjW22s+acnj0+0N7k5ZHfSJzkke1uBuNee17Bup8PNT+6iMWY4VbzD9ic5Gs9Vmj4u7iIM4OFvzyKkvsJeyXVrZ52PDcVnts0hQUxG0NlL5a8dM6pskcvlenA3Pit4JRSJkOU5HxaAktVmRCv0vHCDXiMAOHEcp6iEOAe8Q+YQFMHkztso6TlGMJcbbGvFrIYFt9gz0crNpMRmWOH3X31RAPOBaVhV95R6Yvbq8SrH0aTDpUb1vC5p0iyWg7jFx/QRMTN2bQCHwed7O0yPtFod1Tx96FoeKRTczM1N9+xJNQ7AA//6DiSonANGe848ri3GqrLHgXqr6/vt8ehxZ3C5gyt/uMHyoW5F0q5qfGL4ZqdARsd5QIVmyfwQ15mAIK9QdoxjPiH98xuI2I/adG5BXcXuUR0gPC7RPlM
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99283410-2643-4a14-c829-08d81f59fde0
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:04:24.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LUliDrPNfz6b+u1FmdBttYYNZYvXy6vaKEd/2vqtJjLd9iOCZggXjPCrjLADchurQfwbHJGrqbnRw+M9gDda9lhlVElL/f6iXhzGlobOlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
Content-Type: multipart/alternative;
 boundary="------------67CED4F8C8EA52D1B5DC40E7"
Content-Language: en-US

--------------67CED4F8C8EA52D1B5DC40E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 9:17 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-wcwidth/run-ptest              |  3 +++
>   .../python/python3-wcwidth_0.2.4.bb               | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
> index 48ff37654..d10f5e69c 100644
> --- a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
> @@ -7,6 +7,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
>   SRC_URI[md5sum] = "5e6cd8cd008a7ad2c2578ac49a9d87a1"
>   SRC_URI[sha256sum] = "8c6b5b6ee1360b842645f336d9e5d68c55817c26d3050f46b235ef2bc650e48f"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI += " \
> +        file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +       ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +      install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------67CED4F8C8EA52D1B5DC40E7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 9:17 PM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1593479853-4475-5-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593479853-4475-5-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-wcwidth/run-ptest              |  3 &#43;&#43;&#43;
 .../python/python3-wcwidth_0.2.4.bb               | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-wcwidth/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
index 48ff37654..d10f5e69c 100644
--- a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
@@ -7,6 &#43;7,19 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb">&quot;file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb&quot;</a>
 SRC_URI[md5sum] = &quot;5e6cd8cd008a7ad2c2578ac49a9d87a1&quot;
 SRC_URI[sha256sum] = &quot;8c6b5b6ee1360b842645f336d9e5d68c55817c26d3050f46b235ef2bc650e48f&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;       ${PYTHON_PN}-pytest \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;      install -d ${D}${PTEST_PATH}/tests
&#43;        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
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

--------------67CED4F8C8EA52D1B5DC40E7--
