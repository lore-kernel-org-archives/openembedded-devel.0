Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.79])
 by mx.groups.io with SMTP id smtpd.web10.60352.1594049703542668200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=j+aJR91/;
 spf=pass (domain: windriver.com, ip: 40.107.75.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpSYSteu+pyemO3B1O/a8e/zLRch59l+dzxMtD32b+ipTwFwXeVSA/J4J6zSngfkwWdqyz6x5thl88Nc40HP/9ftXoPE9DbCIJi3GXcRYJ8wmPF5lsh5S8CMiZuweJpLfRmkob1Z3HaiH5+XgQ4C52m37hvbua0GjUfI8wtll+Om1tY8rF/6RNpoLCkP3LBgVMEHrUmtQG1BMW1715+MiR8wUsnDlDac18FK6oqCVyUQ+wLcV5b95sUD6uCLJ4PK9gLZ9YKMpKp1KZDHPOxsgVUKdMMK6ZWKl3JsPUUjZykvnz4RTtGjNmeVBBjrwfsEtIGBafAy1EfrWk3ADzdL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UK0J/9VTjykA51vOl6yCJ/YgcVoOH69r9BHLbRzePas=;
 b=EiA0PYwY+fQXq08jrHtGdZREmMdJpO9B//kR+8BzJ0InWc9yw/Um2XHOOhtV7CMwOMqI2ldOQavx4/J3gmO8WM8XX7Bn9JPV9UvTm3yngunz1OP9B4rQs0MnnkwxLOH1F59TPV+L36H9agEdOvqel94JqTeWgoH/9ddmD/pydFsdcBNFJMB2A/VDZ8qL+NSrTaKEofKzLyavFwPsbclYKBDS1CND502X1Bqu9395V05ZFUc0PzE4M4TfS1DYx2PfhNaia9weVlsCrJqu+prlQT87eX6b7Lcy0zANQUomMVdIebDuNViTucFqJLBQFgsDTCf34oqcegxq30V4vsGE7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UK0J/9VTjykA51vOl6yCJ/YgcVoOH69r9BHLbRzePas=;
 b=j+aJR91/MLS66aUGGVwxbVua3/ynv43qONobk5OD+a2ogsqNSMxTL8wC7otMTTAejR24qPELFaQighlnjeIAFaEoBMPHpj487SUzc/Xs8udzUcIbPvpXkZp6IE/wwMNdQXgg8I9XO6KlnOK/GLR2v11OL8negLvo9iNaXG7X+Cg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2827.namprd11.prod.outlook.com (2603:10b6:5:c8::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.20; Mon, 6 Jul 2020 15:35:00 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:35:00 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-unidiff: Enable ptest
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593499134-72390-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d2ebd505-87d7-6f1e-a96c-bbd1d7fd97a3@windriver.com>
Date: Mon, 6 Jul 2020 11:34:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593499134-72390-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTOPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::46) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Mon, 6 Jul 2020 15:35:00 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b329ea6-15e4-4c6d-33c9-08d821c22568
X-MS-TrafficTypeDiagnostic: DM6PR11MB2827:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2827446E88C36248DA7AABA89F690@DM6PR11MB2827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nzysSOfSOTi6SMcQBRAm00jpqYtEU4Tj0MLB0jZxf55tKGarC7GaLVx0AxYB6sF3pFFevVyddWXOuZiNjZANLwTDlGKpwMcoX5R3tzyiHDI8pxFjcud/CzuEBpQt7tdnGzFU3KerFTRYFt8/mQZ6Tjcp99X27e0sZD9geM/mcYuHWcOuuqRYB7JOJLKaG8FRuqPT0fBRTasFgBXq7Pqak5Hd8hQ2zUKU9thgixExaZ8dMx2eboZULBXFv7t2i1ODnJ3mcoG1vCai03quPlakayxRaOafzdpXghw7wg43W/g9D1Y+LGkTrpQhwdHzMlZQH5tQJ6SgfKADr/Gi6O6By8fzVfGVDIUVSGr4DS3Q6oo66wxnoSKEwyRU8mUqIS9WowDZyyjIzmrDbunPD31IPENRVIfLWynSOYO2LfQfJ4FA/nH3k3zwKll4OcPFQoiZnar+pTQnNChWJiqBmV15kA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(33964004)(8936002)(166002)(52116002)(6486002)(36756003)(86362001)(16576012)(83380400001)(31696002)(966005)(44832011)(66556008)(8676002)(66476007)(66946007)(26005)(186003)(5660300002)(2906002)(53546011)(31686004)(956004)(498600001)(2616005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	IJsUnO5Z6FyUTRHyHthb3o+b/hyLd0q0IAvBSgr1AmyMnPfbdxXtHfYkaf6bHd7LJvGBB/J0MbTaTrMhAE8MI2jZLUvVa4lGqn4HFjxllxf2+oV8zKjibFZc30pltx8r2CuxYyoMg7bl7xElmzjXNy1kh3mWWDwKZMrOvgH77NFf+l3N2EPhf/proTrfQq/qzZaMhjDZ49eqODJfdV2wE6afSlxmotBS3w3fN+eye0/wBu1O7mhLtvZvbb0ljzggfNZYejicpKZ6C5i73Cf/XhUgC5e2UTIsvNNMwrbDurZD9oCuHlfLB76KofLkm0JkadPFSOc0JJgEw7iZUNzjpZ/jBXNTuKr+9QkKkZeHVTWYpy9SwbiqKXYHqakpJRjQQwelLo5w3OyMKYO3s2GwXj/HHCkjTGF6f5801kLEn2r+efr/9W7iyn5RQB7wh06y5oBUpZKU3n8Ka1TsT4I2XRPQ7wadXsCXQ/z5+7GcCHw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b329ea6-15e4-4c6d-33c9-08d821c22568
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:35:00.9452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBso1ttl8R2HLcJbvOdyAo4yVWvmzXynBYBuzmgTNNToAc19XC/UlfIbPEqxMp1oVDdnNWGR53JLqSJV9IpJHkS3WxEazsSYfZZYMOyur9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2827
Content-Type: multipart/alternative;
 boundary="------------4D28A0A9C081B27564B23E5F"
Content-Language: en-US

--------------4D28A0A9C081B27564B23E5F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/20 2:38 AM, zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-unidiff/run-ptest              |  3 +++
>   .../python/python3-unidiff_0.6.0.bb               | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-unidiff/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-unidiff/run-ptest b/meta-python/recipes-devtools/python/python3-unidiff/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-unidiff/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
> index 75aa1bf79..c8e3d4c07 100644
> --- a/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
> @@ -6,7 +6,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
>   SRC_URI[md5sum] = "ae9524079753df7b1239f0378ed326b7"
>   SRC_URI[sha256sum] = "90c5214e9a357ff4b2fee19d91e77706638e3e00592a732d9405ea4e93da981f"
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
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-codecs \
>
> 

--------------4D28A0A9C081B27564B23E5F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/30/20 2:38 AM, zhengruoqin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1593499134-72390-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:1593499134-72390-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-unidiff/run-ptest              |  3 &#43;&#43;&#43;
 .../python/python3-unidiff_0.6.0.bb               | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-unidiff/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-unidiff/run-ptest b/meta-python/recipes-devtools/python/python3-unidiff/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-unidiff/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
index 75aa1bf79..c8e3d4c07 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
@@ -6,7 &#43;6,20 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3">&quot;file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3&quot;</a>
 SRC_URI[md5sum] = &quot;ae9524079753df7b1239f0378ed326b7&quot;
 SRC_URI[sha256sum] = &quot;90c5214e9a357ff4b2fee19d91e77706638e3e00592a732d9405ea4e93da981f&quot;
 
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
 
 RDEPENDS_${PN} &#43;= &quot; \
     ${PYTHON_PN}-codecs \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4D28A0A9C081B27564B23E5F--
