Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.87])
 by mx.groups.io with SMTP id smtpd.web11.7130.1592399289400786552
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cAdRkaZP;
 spf=pass (domain: windriver.com, ip: 40.107.77.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka++wXmwLoNlAh0OTzejmeuttS/ddrluCiUjaAYd0FCOEQcWATK8PBym/R1uuO8QeoQ6AGyyP/g0AlH/nF9tLaY/MYjKK5JGXQ30py7RJpW9Tm3kGYYrCML8TzlFqB+WWtQdtb6oPgUWMA3n+yRCLU8hXX9Q24jkyf/dFC9FdSkFoQ8ltimtw9X8LmcDOE3rlt99i8Y0u9ZplpI4u+tsJjwj1obsydMmBMcVsFaXRyUUIFqEFpkIEZN5ygYt4iPIRPw7eH2wQ80F4GqlJXBwjT5iiiUkSaGmSclrsr8Jkj8zxOEGxIGkDvwXqZcYtQ2q1AYSPLaiscnAo+B3kzew1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr8YyRqSAwqpWDtMKnOInu4ha1EaPnFlNAF1ddjLXbg=;
 b=h2JdDLB8ich+2GvWb3Jhq9cESHxSXyjUD10aOKO9pQI/wuLlU+F70deuTzhX29awumdyS/4DJl5w2zF7+YlZM3jmbPq1fH2xlSmezWHwnTL64FGdeFlf+SXRv6ReGfIls/X9AhitZabxoW+f5ccak9IemMkK4Ihdb1Cu581A55IQyxxneJn/6vIhXGBNyzCkGI15VLemaE2p08oSMkmvVRtZt2T7MPqcgoFw0RhoIz4Sq1TnJzQtGDfwQcx+XfHXxGPg6uxQuJcuof8jdgpS3rGcUH4S3rwjcbYP8KvD3doXkZEXXDTZilJktxrTK1qdHl46imNWr1OMxnR6HahSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr8YyRqSAwqpWDtMKnOInu4ha1EaPnFlNAF1ddjLXbg=;
 b=cAdRkaZPUVxiRqwrwaBatPLlYamlsxcrHrd9UXZp91qKGRUnHaoiqYiQ0FIYXjSTzzM5c3Ozdl5F6AuIWwev4ZC3JloL7aas6XEsrnBZK0D7pmpgjmD6ttGyWpoT46D3wReEuUx4Ut5jvdLwl1wo9x3X1ftAwodYUCynf/qQ2ss=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3588.namprd11.prod.outlook.com (2603:10b6:408:83::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Wed, 17 Jun
 2020 13:08:08 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:08:08 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-itsdangerous: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615103017.2714-1-leon.anavi@konsulko.com>
 <20200615103017.2714-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f854b2b1-b4ad-2879-9bc1-203b3b7aa7cc@windriver.com>
Date: Wed, 17 Jun 2020 09:08:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615103017.2714-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::26) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 13:08:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83db5bd3-2ea0-45a8-a677-08d812bf7aad
X-MS-TrafficTypeDiagnostic: BN8PR11MB3588:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB358827D18D703225E6CA964B9F9A0@BN8PR11MB3588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CfJ30JBZG2/f94hL6y7TRqI5DCB7bPBp5KsmojmtjqH2b3V5Pzt9NBAAiBQmXHaGeVQlcezSyA2fzCllC47MxM0sxraB237ThfoOYQuwPDNNHPts8xUY5Sz7oBdgR6DhpzUKO+drmgVvxj735af1QgLEMKzrD6vqHQIRBfnUTgb0qUu3i206njdMvpvdzVLCTh9JpcCuNa+To4wS3FGA0bpkzlmDRH2X1kLcw05L8L/5RvVp1D4zp53DepbG3Hd9VvJJ5HqdbeHVAy25CW0o1fMxN+i0HiXseoA8Buh2GnQzFo5G9oAjv3DRQ81h0EDUoLSyMlAiQ8YJlinEkmfV7YnWhVMnpEC1WU5qw24zzlpuvbSJlGCFpRwiHfrQF7yuQdZqBIs90rvHS2ZPKNhx7SBtKY+j+u/tXUG41NVzXUQGJcReqiAkyO6fxq2sy72hX3ZnSwzFfKDof7Y5y/JGpg5z1TmRys5IZRYSaBEQ3Uw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(366004)(346002)(39850400004)(136003)(66556008)(26005)(53546011)(6486002)(166002)(19273905006)(31686004)(8676002)(2906002)(966005)(66946007)(316002)(8936002)(16576012)(66476007)(44832011)(186003)(86362001)(33964004)(52116002)(478600001)(16526019)(36756003)(5660300002)(83380400001)(31696002)(2616005)(956004)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	C5/LXcDRUow26Gi2aVfEiSxxqXycTE/0l9uLlFjmVww7khu9JjTK+Gkf2OLjv06JjRv5wd2aoSIezjSZygeZLr/1bGNKuVPlNc6zZ3Qukc+g1+zZk5LbuMe54d6fKY6+KwY73yHyDyxvKOEpVcmhNQjcHk9NNIXlZVE1miV0Q2Vq3PSrlF0cqy5fzNs8o5ixN5lxCAzXAeKqVm0oWb/vXD9nHLKX6Sf8kt62VhTSUQ2RxBZN9oi+X5yWbXW+tEMLFHshBvfIl3+atDMM+s4Y9mk99Nj8BqJlMVIS6If4rHmiR+BJgXmy/tvlpEBZbOg9/kZ9mKAi/n3pec9Qunh3+fgy0uGIucOPjURP6+Tonov9ZlSXtKGVmnPeXOnGViFVGeHpZ6QeAA+P4gUIoJqEsdjGS21bPCIbxGwB4d5sZKezLTfuw3ar86l+Wg+R2eB5V9cWccqi+vOouSZTmhsXD7qIM3QXL6VBtyJtDk1gn18=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83db5bd3-2ea0-45a8-a677-08d812bf7aad
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:08:08.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZKpPIrjQadIlcAcpJHj9UPDSSJTyE6s9R6ZJa4k1wy5mqlOGEHAu+IB6VGZbkvB5PTxBw95olIwv6Uju9NqxviZL8mQL4+45DatzQtZoh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3588
Content-Type: multipart/alternative;
 boundary="------------9A8FC090C504EE80193716BE"
Content-Language: en-US

--------------9A8FC090C504EE80193716BE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 6:30 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-itsdangerous.inc                 | 14 --------------
>   .../python/python3-itsdangerous_1.1.0.bb           | 13 ++++++++++++-
>   2 files changed, 12 insertions(+), 15 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-itsdangerous.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-itsdangerous.inc b/meta-python/recipes-devtools/python/python-itsdangerous.inc
> deleted file mode 100644
> index 241786a7c..000000000
> --- a/meta-python/recipes-devtools/python/python-itsdangerous.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "Various helpers to pass trusted data to untrusted environments and back."
> -HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=370799bf709a1e4a6a369fa089ac73a6"
> -
> -SRC_URI[md5sum] = "9b7f5afa7f1e3acfb7786eeca3d99307"
> -SRC_URI[sha256sum] = "321b033d07f2a4136d3ec762eac9f16a10ccd60f53c0c91af90217ace7ba1f19"
> -
> -CLEANBROKEN = "1"
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-simplejson \
> -    ${PYTHON_PN}-netclient \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
> index a71c20f0e..7f50641c8 100644
> --- a/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
> @@ -1,6 +1,17 @@
> +SUMMARY = "Various helpers to pass trusted data to untrusted environments and back."
> +HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=370799bf709a1e4a6a369fa089ac73a6"
> +
> +SRC_URI[md5sum] = "9b7f5afa7f1e3acfb7786eeca3d99307"
> +SRC_URI[sha256sum] = "321b033d07f2a4136d3ec762eac9f16a10ccd60f53c0c91af90217ace7ba1f19"
> +
>   inherit pypi setuptools3
> -require python-itsdangerous.inc
> +
> +CLEANBROKEN = "1"
>   
>   RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-simplejson \
> +    ${PYTHON_PN}-netclient \
>       ${PYTHON_PN}-compression \
>   "
>
> 

--------------9A8FC090C504EE80193716BE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 6:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200615103017.2714-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200615103017.2714-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-itsdangerous.inc                 | 14 --------------
 .../python/python3-itsdangerous_1.1.0.bb           | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 12 insertions(&#43;), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-itsdangerous.inc

diff --git a/meta-python/recipes-devtools/python/python-itsdangerous.inc b/meta-python/recipes-devtools/python/python-itsdangerous.inc
deleted file mode 100644
index 241786a7c..000000000
--- a/meta-python/recipes-devtools/python/python-itsdangerous.inc
&#43;&#43;&#43; /dev/null
@@ -1,14 &#43;0,0 @@
-SUMMARY = &quot;Various helpers to pass trusted data to untrusted environments and back.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/mitsuhiko/itsdangerous">&quot;http://github.com/mitsuhiko/itsdangerous&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=370799bf709a1e4a6a369fa089ac73a6">&quot;file://LICENSE.rst;md5=370799bf709a1e4a6a369fa089ac73a6&quot;</a>
-
-SRC_URI[md5sum] = &quot;9b7f5afa7f1e3acfb7786eeca3d99307&quot;
-SRC_URI[sha256sum] = &quot;321b033d07f2a4136d3ec762eac9f16a10ccd60f53c0c91af90217ace7ba1f19&quot;
-
-CLEANBROKEN = &quot;1&quot;
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-simplejson \
-    ${PYTHON_PN}-netclient \
-&quot;
diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
index a71c20f0e..7f50641c8 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
@@ -1,6 &#43;1,17 @@
&#43;SUMMARY = &quot;Various helpers to pass trusted data to untrusted environments and back.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/mitsuhiko/itsdangerous">&quot;http://github.com/mitsuhiko/itsdangerous&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=370799bf709a1e4a6a369fa089ac73a6">&quot;file://LICENSE.rst;md5=370799bf709a1e4a6a369fa089ac73a6&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;9b7f5afa7f1e3acfb7786eeca3d99307&quot;
&#43;SRC_URI[sha256sum] = &quot;321b033d07f2a4136d3ec762eac9f16a10ccd60f53c0c91af90217ace7ba1f19&quot;
&#43;
 inherit pypi setuptools3
-require python-itsdangerous.inc
&#43;
&#43;CLEANBROKEN = &quot;1&quot;
 
 RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-simplejson \
&#43;    ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-compression \
 &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9A8FC090C504EE80193716BE--
