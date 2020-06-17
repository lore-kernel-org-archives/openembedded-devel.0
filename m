Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.56])
 by mx.groups.io with SMTP id smtpd.web11.9330.1592405128243909587
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 07:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MYTPXeg2;
 spf=pass (domain: windriver.com, ip: 40.107.94.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGMk+/4UDi/U7Ru1dwyIWk8o1y5udKoWwmk4/LvX81M1yJMExJguGhBarn7tCUlG8HGROqp8oVIkoRlU8lXvcVBY+di56dQGaJVfysDzU3SsFnjG4eKx9Q7BS0xVMnVcyNn7Z6iK5GBn3Zm0b//NFdTrYxO8r9f0r6T6l4ML2Co3GFzXgTWpy9QGbKvFAhL6AnCsIvNr9ES8Fnv5PQ8defBDAvp9CtFTjQsYr1jeDqfiIepBorruopvWgQx33tYvjXD4Ian9X9ti79Q2aQt7SthDPdH/AnxEcziS25tbZQ4zaij3+8JwaubN2B96EkKLjciEdS7dBMP2DM1+VnN+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZjMhHeVmBim7A0jZY1aGst+3L//NhJg58NUr+EhVak=;
 b=HaHaUF/DqxJW9I/iqY5gDq5Xx5GQqH9/7suhWMxDnUqbZJvwCs9GGMggdLKNnpWL+2VkfEbDsTNyz8B/pjY2fiUFPfEVyvS7mfpHF5y6DCYgpdHev1eJHaFxz99RbwizQU8j/UiVTZl7TbEW3nbumrrjt2boO/WnUwW505BmgQLhwpXcidd5UoOWyxV0wui7FWZIk66AM8FGmU17fRqzTb6ZxaEuRZjUMKV4IqzJCfQ9BQTuBVha1+8ZFJC3OKbs2Z/xnsYg5+eSGiGVX1LuUzQwSndOBtH2Fk0D5MEbhC03W3I+m5ePQ0itpuqJs0yB6NR6gi6MRR2CcowosEo6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZjMhHeVmBim7A0jZY1aGst+3L//NhJg58NUr+EhVak=;
 b=MYTPXeg2C7p8NHAb9ikfYQMIUGwdPyYGPtqTWYAITh7aj//nLzfI1l6jP2IuetEDNnUXiyuraSh6XkcPhNbHfh2A9c4z8bQJDUB/B1vlqyIgYDgvYYlA8/dEOABuby9pTTwGWx/vPaeSaqk1ipfjnBVINGwQVvE+MRIyHtea0pA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1233.namprd11.prod.outlook.com (2603:10b6:404:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 14:45:27 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 14:45:26 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-gunicorn: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1592232372-4547-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5ad499a7-a236-e0a7-71cc-facff27fdf7e@windriver.com>
Date: Wed, 17 Jun 2020 10:45:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1592232372-4547-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::15) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 14:45:26 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da892d3c-4538-441d-2d31-08d812cd12de
X-MS-TrafficTypeDiagnostic: BN6PR11MB1233:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB12332BA0C7E3D5BA4D9C53689F9A0@BN6PR11MB1233.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3FuitFZvKb9eb9HAcV97/R5/hli2EXBPH5h7gzehMN2xORpWXoMfwX0lu07uVzNW+Nnm5oiIWOhwkdpa7iZlokVfI0D9kOnVDEATH+hgXFxay2aHW6QyTW+FaGFe67uOTQ5w5KZdIU7kgV46VBrcyZHBaKWuoGnKwv/7wFaL3xaCzJAAecProdvwfvcG3iHulFDiinegXgkaJGcrM/nlfnPPEOc7qvUyyiymLk33lq0YX+LaItMr6UsbD/t185ZKiVzzWzJI8jEDwA6F3kgmyd4gQvzqPQkokLbfSg5Lave6iBILcrUXzMnrRpMAGoUOLxWp6Lc8N/2Y2Rl78K0H9AxU4yhFKUQztxH0jIC2hTr5IscN8sgpzKRD5V1y2q4uVeDjJhywEPuK8yCmo2vz3Xuu2Klho7bJKFnYx0yQ1/YJGVBx0Z/Pa23ldypoVjvAbZJ2dfpX+0WPjhwrmHtnvg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(136003)(376002)(346002)(66476007)(33964004)(44832011)(66946007)(6666004)(5660300002)(31696002)(31686004)(66556008)(16526019)(86362001)(956004)(52116002)(36756003)(2906002)(2616005)(8676002)(186003)(6486002)(478600001)(26005)(83380400001)(966005)(166002)(8936002)(16576012)(53546011)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Bxs/sJL9OyCaNdpKpnVhdTUJxpJwu7WrA0DmW0e40v0Zxxuqz2Oc4EyBjsiPhPXt/VUIMvRddVTjmHGjydmay3Rlkf+czIvF07TwKvP9YLbKLQAhiwuGvQhqfoZoxK0+XeoJnAQdIWNpx+tcZ36aXCuth8tsoZfLYN4EQardDtaeIIPpZzH+S0yUf/VvMsAnwFnlUlN9+GlmVJ+ha9X6Vb8XOSaqA53ZrNtBkfNPlCpo9Kv44FkYi00t6I0+QX0fjzO46r5YU5ULpHfTHq+ZIA33nx+NOpQ9uZsXY309zjnGs9l6ay9jgZ/eLdl1TRZYNN3oL5t8oS7Kh2gABlxeVyAzlIHSxEtynHerZZWtjD4YFBbO4FYQrbWSXaB1cEtpSme9ZZpr45O5e4uGAx84K3wvvImXkNzUo/6LLXDWzFW7mUugMzp1h0GIix3z8MFdSGaqPR35CR/XS3o5QYumV/T4biM4tYrRCj7VG8C03qj0UIzvgpFHStGpZ0dQCJOf
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da892d3c-4538-441d-2d31-08d812cd12de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 14:45:26.8852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeO8GMdlINSe9Eq4wo02KksVy/etbUTgrqkIsPMeupX7XP39gsjIf/Mb2OexMzA0MThgtRK/NdOwFlce/zm/w5RqCj8KzpPx2QhpKvmV0nU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1233
Content-Type: multipart/alternative;
 boundary="------------12C9695EB33E81E0FA003AFF"
Content-Language: en-US

--------------12C9695EB33E81E0FA003AFF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 10:46 AM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-gunicorn/run-ptest             |  3 +++
>   .../python/python3-gunicorn_20.0.4.bb             | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-gunicorn/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest b/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb b/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb
> index 5bd8d51c0..23aafd67d 100644
> --- a/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb
> @@ -6,6 +6,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f75f3fb94cdeab1d607e2adaa6077752"
>   SRC_URI[md5sum] = "543669fcbb5739ee2af77184c5e571a1"
>   SRC_URI[sha256sum] = "1904bb2b8a43658807108d59c3f3d56c2b6121a701161de0ddf9ad140073c626"
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
>   RDEPENDS_${PN} += "${PYTHON_PN}-setuptools ${PYTHON_PN}-fcntl"
>
> 

--------------12C9695EB33E81E0FA003AFF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 10:46 AM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1592232372-4547-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1592232372-4547-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-gunicorn/run-ptest             |  3 &#43;&#43;&#43;
 .../python/python3-gunicorn_20.0.4.bb             | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-gunicorn/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest b/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb b/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb
index 5bd8d51c0..23aafd67d 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb
@@ -6,6 &#43;6,19 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f75f3fb94cdeab1d607e2adaa6077752">&quot;file://LICENSE;md5=f75f3fb94cdeab1d607e2adaa6077752&quot;</a>
 SRC_URI[md5sum] = &quot;543669fcbb5739ee2af77184c5e571a1&quot;
 SRC_URI[sha256sum] = &quot;1904bb2b8a43658807108d59c3f3d56c2b6121a701161de0ddf9ad140073c626&quot;
 
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
 
 RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-setuptools ${PYTHON_PN}-fcntl&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------12C9695EB33E81E0FA003AFF--
