Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.88])
 by mx.groups.io with SMTP id smtpd.web12.60455.1594049721701273743
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HY5CLOnN;
 spf=pass (domain: windriver.com, ip: 40.107.75.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pzar4B5UcgkLIus4xraBAQscbYP3fA5ZSTnJKnE49l5+6WS0qKeLqA+sfQgwQfr4h/L9HxyeBcMAR+G/Xk03gYWg5qZCRgjAplbj0CImuRYCyvtycmeZMk+DF8ZQTc/d/6aGScap+Y2EbrcFYfKFPEmkHlIZJNdJ+rc7VfKujxdmSy9miO0GuKcBn/9HcCJ/+4/vtsKBi0zgTHZrHu3VpaqJmIqQVfZDUS8734K6yQFdr/aRi0b8qdgLDwNU1mRNHWhxG5380aNxQozkNqdXd+L2qaVUR7UEm5Hyugfz+gfzkszZZgf8XeRhloEgCmA++qV/nvBZMVfHEeXs8OZZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/OYcdtU5L/Nk07eKy6K1+Lo5a/byDOSjRc0pitJtP8=;
 b=T8UxwbYoqrnWqtUl2vHVPHKsiqVHq3oUTqCx2bboEBE2MuxuiiOIviJDFdsQtxDp+jR6bdjkWxHg/HxrkM5V0y1/jzG74x440QqSRVY6ZWCsY7RS4MBU8VFhYzkRI3sMc7Me/P16yNTaV3uj1MC5wYCKkjqDGAFbcY7jwt6c+Mu09r2E0bGlPU754D/adWvRhj5/yoawIz9/UKTQlh81DSde3DoNgNXeoQisl8YPGzLueasgEdh0fZp6lEKW54+mmG9Yf/a1GNA1qksQRkTRHLu+Vc6tu+P90/pOie8q4cOlCinOfDr/GWzPUG6R86iHkNmTGmxHrWDpy1Y13Z7VOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/OYcdtU5L/Nk07eKy6K1+Lo5a/byDOSjRc0pitJtP8=;
 b=HY5CLOnNid0GSebSKtBCQ/uosAF2g8ymh9jm946iqQHC/mxlEGfhH54bb4PSnJ/bzQzRMOUp9PecT1zJNT8TlwvsdDsQJcCVcugPT0MVj3RdTk+a1rAu0oXiVu+UtOAPB2FweNfriunZJK+eiyqKidm5SRLPh9K6opvgIG688ic=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2827.namprd11.prod.outlook.com (2603:10b6:5:c8::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.20; Mon, 6 Jul 2020 15:35:20 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:35:20 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-uritemplate: Enable ptest
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593499145-72426-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3639186f-4a33-8e6a-8eb8-5c0a42b09927@windriver.com>
Date: Mon, 6 Jul 2020 11:35:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593499145-72426-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:35:19 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9edc5ee-82ba-4a1f-d5fd-08d821c230db
X-MS-TrafficTypeDiagnostic: DM6PR11MB2827:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2827F5DDD03397C9E4E610D09F690@DM6PR11MB2827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/JbaSV0A9W7oBg8mn2tczOSVWvaxJnZJTTAyVkkQMXYiOOAAV2wRqf2MPLaGzLoZhb85bteT20cUNPLYsDr8/cheoZc35ZQUt18lpxDPeGOoYB5xaCnWrLxnWOfv2+rxkm7Q/fjyQLuR/j9e2sKMehLArkzWeSTNCu6ks3bFcc1PVqiQI1POmmLLuNIWWgxvx56CepHThuqZ61J4O+1CWbGulJdrLfWZ7s6ubeTFz7EsIZspmqUlbO6c0nUfDTTcWhf2GOFItrLoyWX5Rs3ytIB9p9x+4KWCoj91DHLzoVq//Vy6jeS8EuzCoC9BM/ruwYEBFkXxcJ21FMYzxBS6w+Q6Pu0/N37gLE3DPL5XIL+4NHoa9niy2OJmSdM8bslRHnrTgbcKVkGuoiNGcLdie/3MiuqeJY0ITb8HT3N5AinetnlJ91ykrXERryknUt8rL9MlgZhXmbFmyLYdUCqkOA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(366004)(376002)(346002)(39850400004)(33964004)(8936002)(166002)(52116002)(316002)(6486002)(36756003)(86362001)(16576012)(83380400001)(31696002)(966005)(44832011)(66556008)(8676002)(66476007)(66946007)(26005)(186003)(5660300002)(2906002)(53546011)(31686004)(956004)(478600001)(2616005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	b0c/teX0MM4GlSLu6lVbIdAvlTESuZq3pNFgPRZhV3HvqlnEBzsRAAyfRbFQTbMXtdy7IpMpqR8hY72Q9Fl49sHIwf2eQZKn2w5CqQYrLP0J22iTNeznrBLLyhivgs1nDFs2R1Qrhbtw9RCvfxKdlyl4B4RUq8EzP+4hXrOMbrDmQjceU2IxONx7XmVmkG0ptvzx4pYICaZmyoQSBu5uK1WZqtBOwanJLkygne/tBaKy6mdRbwjfZXIndz8NBO+CDlUpODbwtRu7h8jKBYzhjmRyZKNTNPRhbqJCTOMKCddlJlvmT6/yUCZ5NMSbo9RQLRaLSeWW2nHYsxl3sXMGiMMlEcS71W1O07nHKIWspNRMnwNnBDepRAJwyytneS6jELoCLhRSWz+n8hLUpmH8I7PirHPM5NzQJBznVEeiWEWqasUEKkHCKuXBO7HHX7z8vJZOyZ2R58tPIIM3fiXr/uVL+eB2FsFRxlhHHJSEBc4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9edc5ee-82ba-4a1f-d5fd-08d821c230db
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:35:20.1170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7bR53Nyi/9PyCPPhlraVwX9z5FsH7y+FkT2uHCgcbj+Gaj7WUo9tXT/qpI4hswXjXGpUUL1HxVK9GJlZX0kw6IU0eZo4BqrBJp/4S9ZZ6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2827
Content-Type: multipart/alternative;
 boundary="------------DD38D60BA5EEAA091B57E44B"
Content-Language: en-US

--------------DD38D60BA5EEAA091B57E44B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/20 2:39 AM, zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-uritemplate/run-ptest          |  3 +++
>   .../python/python3-uritemplate_3.0.1.bb           | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-uritemplate/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest b/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb b/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb
> index 952e954c5..2a83219a9 100644
> --- a/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb
> @@ -9,6 +9,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f6d769bdcfacac3c1a1ffa568937fe0"
>   SRC_URI[md5sum] = "869fb44fbd56713490db7272eb36c8ae"
>   SRC_URI[sha256sum] = "5af8ad10cec94f215e3f48112de2022e1d5a37ed427fbd88652fa908f2ab7cae"
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

--------------DD38D60BA5EEAA091B57E44B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/30/20 2:39 AM, zhengruoqin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1593499145-72426-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593499145-72426-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-uritemplate/run-ptest          |  3 &#43;&#43;&#43;
 .../python/python3-uritemplate_3.0.1.bb           | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-uritemplate/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest b/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-uritemplate/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb b/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb
index 952e954c5..2a83219a9 100644
--- a/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb
@@ -9,6 &#43;9,19 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0f6d769bdcfacac3c1a1ffa568937fe0">&quot;file://LICENSE;md5=0f6d769bdcfacac3c1a1ffa568937fe0&quot;</a>
 SRC_URI[md5sum] = &quot;869fb44fbd56713490db7272eb36c8ae&quot;
 SRC_URI[sha256sum] = &quot;5af8ad10cec94f215e3f48112de2022e1d5a37ed427fbd88652fa908f2ab7cae&quot;
 
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

--------------DD38D60BA5EEAA091B57E44B--
