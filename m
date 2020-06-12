Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.55])
 by mx.groups.io with SMTP id smtpd.web10.21340.1591972785977689435
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 07:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gh79GKiD;
 spf=pass (domain: windriver.com, ip: 40.107.69.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGucPLZyUf7eEJH3dK6j4Z+GiPDSdJNWw5Z3/qRebz5HMHjkvDKNsQ6nqThr6DEyEUalWJH6mN0kSmLxRL1WfEq44+g+cEfUxQH8BgyMGuEWDxudN1zVkZFjC8bwwwjV5yYDByb0AYo6CHYIKsZP9P9FlywxU+ajPBYNYDjbD3XM0i9dTaAiVhvtoD314GwbVw5TJgvunRItzOSXyge5TrLp42ceWkXa3GT+7hPMawTTdapfIjxCrkfX4iyXYiPk8YT8ycrzUbny+mywaTOX1m5fKC4fOmS8tdXmTzFTQsucSA+0sa14ixLf+AiBV52eRerxScyNWLO93dOjmCkRFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guQuxT1AaegIt38mORtrNUuSKOgC+HZXiGYOd6/loi0=;
 b=GGGMGQ75jeXHNtLYc5VUf9ooebxuwqMz708aTqPJUy5uoubVsHvD8ZfZtuTSwAFASD+ihkX0piC2ZdR6BJkrqf5PqGi+AStOUWE87JbK9XQ9lxhbWHRZJIHwNKeg1fCwSD5+Y+4SPkxoPYRTAT6pTILjra08F3HImCoBSsj/nkNYdQXMVFo4wKyMiY18YQ2fiYpYulys1uM1iaa4K53RiI6SHoon5yKG7+w36esHgCKPXSVhzalqsZDdF6YysEOW92HeQu1T2NYolRD9ZMNpG5K5Isj/bkPe0wVEtBEh9XP6KiKoh5jV+O/86T8An5QNOic5K2itlRZKjVGn24NWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guQuxT1AaegIt38mORtrNUuSKOgC+HZXiGYOd6/loi0=;
 b=gh79GKiDZ4M/XEb0PlE5rQi0ttC7WFTp1EoHmTCKDmvbc8E19yU2h2Px/3EcV+j1MrybCAzgXszciarPr1RWvHzns1nCAUeWWw0+kvjuYCYB6JIFNb5YAeUVEvY8lh9reoGlgqJ2scaxAnY20rHFzJ6/mI1WLn65PmwEuCobtGA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3956.namprd11.prod.outlook.com (2603:10b6:405:77::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 14:39:44 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 14:39:44 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-pint: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
 <20200611090904.29772-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5a0d98dc-a741-2f2f-356c-2eb3d0019a8c@windriver.com>
Date: Fri, 12 Jun 2020 10:39:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200611090904.29772-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::8) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0099.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Fri, 12 Jun 2020 14:39:43 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65632d91-9115-4ece-3f05-08d80ede72c0
X-MS-TrafficTypeDiagnostic: BN6PR11MB3956:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB395652C5BC9CA0A12E81A2B09F810@BN6PR11MB3956.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pEQcP7r10moacnLv+dFA4B8+S4nxb/WHxk0oIoO+L8i1Ev+JgABNmjX9yqGuYuOMVmExHB+RmMqBBxEdXOEu2gQcuFXpH+0EWVGJpJWXsj6loPVAqicBPWLZ9lIZurjps3/cnAjJWnWuRMRSimlBhTmVYZcOo1iE3PKNtQdlUsDRH6Vux2WhLE3t+JFh2x+Zh4T0ua8YEUOo8y9ASg90TLXm/HHsw1/xfAZPSM8XLymjoChpqjaQfjfl2R5VMX5AH/GCn5a1G2BeIqZb3Q/lMBkof0Aqy44/Se6Nz1CLSLmpvL2mDZiJKLeA6HxAk+fahnKB408sBWwlSnP2K0KJdJtm4zAkvRNLvyZP9a/CbxdfIF0j7ocjEW1PnmFkd6rJenPa3/28Y465p2lerNKrZcK73jS5mqVkN2XEJAstGDt02TKUtgFnD0BgROAlRYJ+4GFhSXAQFUTvPOvhpZmc+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(366004)(136003)(39850400004)(966005)(478600001)(66476007)(36756003)(26005)(66946007)(2616005)(66556008)(31686004)(5660300002)(53546011)(2906002)(8676002)(956004)(186003)(44832011)(86362001)(16576012)(166002)(8936002)(52116002)(6486002)(316002)(16526019)(31696002)(33964004)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	G8JEuCCk/swZgxDwSjxol423jAxDK8thhgbQynisTL9Ff9eEXlGQVeQtWFhV5SB+47tBLoN99lkR6BCMj2zuGXfJHq7SDNrRjz2wb/jt0/iZXyJFkkdHFAQy39LK/ZfNSPE7ubMS8eB8sgGfenxe+3ag7knb0BuyhR0eXYw/niUXeqDe5Z0ahJ9J0Q0L/J7DtfQxdmilmesXfOJ7SVVqhfpaQmAO8D/4+xDowCaHwONCGuH3BRIuc1w88rAak1nJxbzOHFzdIapTQULTEmNuQOf/7fwO9jpel/uIm7NJ1ZphrVIV7+x4UIY44VpgNH2jE1sysCI1qgseg5eFC3omPV90zO7BwqxyzNuCoLSVoGD9WL1eIDcaFoadh8mIQbimSDRuqVA6ti4sYM97MJrGT0WbBlMvPHh2Y8NcOFkYpBvzRRcVfvleLlamWTyjXM1phjfovsuQ64oS3nMFM3LXTIkWkSrLV4biwoIPoKGiKqXaTi2K9NJANQafJlwqflgR
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65632d91-9115-4ece-3f05-08d80ede72c0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 14:39:44.5904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+hMVnWdpzHetNVZkjADU8z76cAUoUTOXEH3nEoI3L070PyeOO0GPTuLQpNOFqStkRm4FvbRFU6uQCbrV+xOWZo4loyg4NiCa7ErSb5W5nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3956
Content-Type: multipart/alternative;
 boundary="------------E3FC24A17DCCE61CDCC31D91"
Content-Language: en-US

--------------E3FC24A17DCCE61CDCC31D91
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/20 5:08 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-pint.inc   | 30 -----------------
>   .../python/python3-pint_0.11.bb               | 32 +++++++++++++++++--
>   2 files changed, 30 insertions(+), 32 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pint.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
> deleted file mode 100644
> index 5c3481008..000000000
> --- a/meta-python/recipes-devtools/python/python-pint.inc
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -DESCRIPTION = "Interval arithmetic for Python"
> -HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
> -SECTION = "devel/python"
> -
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
> -
> -PYPI_PACKAGE := "Pint"
> -
> -inherit pypi ptest
> -
> -SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
> -SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
> -
> -DEPENDS += "python3-setuptools-scm-native"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -SRC_URI += " \
> -	file://run-ptest \
> -"
> -
> -RDEPENDS_${PN}-ptest += " \
> -	${PYTHON_PN}-pytest \
> -"
> -
> -do_install_ptest() {
> -	install -d ${D}${PTEST_PATH}/testsuite
> -	cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.11.bb b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
> index f793ac4ac..d37da7c6a 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
> @@ -1,2 +1,30 @@
> -inherit setuptools3
> -require python-pint.inc
> +DESCRIPTION = "Interval arithmetic for Python"
> +HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
> +SECTION = "devel/python"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
> +
> +PYPI_PACKAGE := "Pint"
> +
> +inherit pypi ptest setuptools3
> +
> +SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
> +SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
> +
> +DEPENDS += "python3-setuptools-scm-native"
> +
> +BBCLASSEXTEND = "native nativesdk"
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
> +	install -d ${D}${PTEST_PATH}/testsuite
> +	cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
> +}
>
> 

--------------E3FC24A17DCCE61CDCC31D91
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 5:08 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200611090904.29772-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200611090904.29772-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-pint.inc   | 30 -----------------
 .../python/python3-pint_0.11.bb               | 32 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 30 insertions(&#43;), 32 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pint.inc

diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
deleted file mode 100644
index 5c3481008..000000000
--- a/meta-python/recipes-devtools/python/python-pint.inc
&#43;&#43;&#43; /dev/null
@@ -1,30 &#43;0,0 @@
-DESCRIPTION = &quot;Interval arithmetic for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/AlexandreDecan/python-intervals">&quot;https://github.com/AlexandreDecan/python-intervals&quot;</a>
-SECTION = &quot;devel/python&quot;
-
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b">&quot;file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b&quot;</a>
-
-PYPI_PACKAGE := &quot;Pint&quot;
-
-inherit pypi ptest
-
-SRC_URI[md5sum] = &quot;3a8f29c2a30efd35af4b5c5a224ef965&quot;
-SRC_URI[sha256sum] = &quot;308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d&quot;
-
-DEPENDS &#43;= &quot;python3-setuptools-scm-native&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
-
-SRC_URI &#43;= &quot; \
-	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
-&quot;
-
-RDEPENDS_${PN}-ptest &#43;= &quot; \
-	${PYTHON_PN}-pytest \
-&quot;
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/testsuite
-	cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
-}
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.11.bb b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
index f793ac4ac..d37da7c6a 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.11.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
@@ -1,2 &#43;1,30 @@
-inherit setuptools3
-require python-pint.inc
&#43;DESCRIPTION = &quot;Interval arithmetic for Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/AlexandreDecan/python-intervals">&quot;https://github.com/AlexandreDecan/python-intervals&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b">&quot;file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b&quot;</a>
&#43;
&#43;PYPI_PACKAGE := &quot;Pint&quot;
&#43;
&#43;inherit pypi ptest setuptools3
&#43;
&#43;SRC_URI[md5sum] = &quot;3a8f29c2a30efd35af4b5c5a224ef965&quot;
&#43;SRC_URI[sha256sum] = &quot;308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d&quot;
&#43;
&#43;DEPENDS &#43;= &quot;python3-setuptools-scm-native&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
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
&#43;	install -d ${D}${PTEST_PATH}/testsuite
&#43;	cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E3FC24A17DCCE61CDCC31D91--
