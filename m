Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.42])
 by mx.groups.io with SMTP id smtpd.web12.7101.1592399321490520016
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jFKTI5Az;
 spf=pass (domain: windriver.com, ip: 40.107.220.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m70Pal/SiFD0kfgu6OCxo3klWRKius9CM2MH0Zk2AM0yPd2lT1nJYkC51yweGbz3IVJff67UABBz8EUA8bogpWwSeb7YcUYUDbNyyeeWMvwK+YTmwIZKloIPK7gOw7mj5I0fnQJYK4fTAbe/kUWJ0JNPzkeIDsJefUFCcU1WWc22c4W49dkOOMef9/Tv627rElhLqjeiCRqtinCeoFKSPGXJvbg0B0scbLlSKlQPNbjCKlyH3UXgGcTUBV7QHoRv7QFdbFO2QGmx+6h0Ly7dXabZIxGoP8ltOMFoDBCStpQSfuMA6tgCOr8iLQLy8dlpZ9IhiZL3ThzzAILkgCf6MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SnxgxVpkjwdT9w+2dgdJlxHrmGSSy6mLgCoq4D7yHU=;
 b=f8YjiVYJgjEXEwyQxctERVBksqrYC9bwe8G+RU/d1W2Ob+M/oQC8nO75j6ug9cmHc6UEIj9Jq86Iy7x4L43MF0zmL2kpohgSUs9m5DKYZUxee77zR2nO2NrGK8/Zv1GEeGDO+2HghXzNMuBjq3Czj3tJcyyRzq1f/tkLZv2VLZPz0modkioBzxa9CuLiQabqdbureHVmYuZ0m1ni5/DnMaPxrKSZNFaTx5KN0/2FiXOmbc4Kpnqk0pizIHZYJPQcM8Y9sxLTxOLmgO2uRzeCJ33mHs4w+Q2enXqDQ62hYOJVMgVXQfGTLIHmlIh4xOi70A3y/Tct0lQ9q11Ey6VtjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SnxgxVpkjwdT9w+2dgdJlxHrmGSSy6mLgCoq4D7yHU=;
 b=jFKTI5AzlwDBxiNhqcIRHh2JeyIqyw3J5EXv7Kp+Pm9ES9Sm6EzI8a56LomZsor+rTF+mEBMHuUlKkQjpJB2cd5P3p6oa3FBQcz9IVJ9Ocm13wMExMS//gdH+ssZXI+uN5tLsGWBRbn8tXHHwYsYNRIVgHqI2URd+uZNQFl6+W0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3588.namprd11.prod.outlook.com (2603:10b6:408:83::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Wed, 17 Jun
 2020 13:08:39 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:08:39 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-importlib-metadata: Upgrade 1.5.2 -> 1.6.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615103017.2714-1-leon.anavi@konsulko.com>
 <20200615103017.2714-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f2f5de99-6314-771e-5fc7-169c19d893f5@windriver.com>
Date: Wed, 17 Jun 2020 09:08:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615103017.2714-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::41) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 13:08:39 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 111b3f7a-af76-4758-b22f-08d812bf8d7c
X-MS-TrafficTypeDiagnostic: BN8PR11MB3588:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3588C093F5F15CAB2DA066DC9F9A0@BN8PR11MB3588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OYc7UerFFEnUzUveLfgkGXeQ+WDfdwZekmdZWiadlOpDIsgKbpb2dMIMnZoigJbB7MBgJxsnjlItyiRRbzd4LgFq7JVksEbadhQfXDSOk8mXKMxLSe5u0EvvE6vhvtcj+T95Si8smy4iEd50k1damcPDMDe/8LYNcQykyOVrN1/bVBLnCanoNEb/suHwAdwyCV4uALLi4jJjTPe7y23iTWjfhIy9qHFe6YVROSN9XNMNe5ZRulbGVaAse1oAk26wJL3nxe+C0NT80jG/S9j+LebzNyJ/shyA6aGdMgJFV4eam2Lw3Ctv9y/6ZuWGs9HKJKEY1B+EWIs0TBz2sXag2LiftvDcUFLzLyom1mX3UeYV8HJIN9KP35nlWwW+OkjhxLihMPIQJA0nWQARNMZhgGvZtFQ3OeY3tef5EktNljp/z/rDnaZVk5BEXwFOS5mF25K2IIW/BROlEK56MeN+Kg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(366004)(346002)(39840400004)(136003)(66556008)(26005)(53546011)(6486002)(166002)(31686004)(8676002)(2906002)(966005)(66946007)(316002)(8936002)(16576012)(66476007)(44832011)(186003)(86362001)(33964004)(52116002)(478600001)(16526019)(36756003)(5660300002)(83380400001)(31696002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0Qkmx+3p0JStLHhqfIRUcLvxm76Y5Hg3spNI4DcPmC76BN5ArXrhYJt9qNXosv40CciPMqOKKBjPX4Y6+CZswM8x2w30pHqkpg0nNA5xbrGYMlp8iw8s0l1F9dtp3EhtEbl67LvSH/bjFwNgOnbgRAClIF67Whz3tLk4gHLxAg2fsvmkABakyYxgkKRfx895cYptrUvKkfVBivTI3Wu+6yHEWrsm7OJYsXG9l5y69c3zTW6+rWkcivNb1fTdrOBfJHr5F9fHfS4u7Fed/cgxXT/X72dpgmngm+ADiImMcM74yINNNkTpg04PdJpO8yvyXOCjui6piK0uuEyL4XMVKlUnS/dzTEQpc0H8snXgvsA9OhUq0+z/pj30Vmsy2swj3oCc/KY9L6Oj1UprspfBOWxCHgRB3s0pqlRrpLaQTAMbg1/85phnWBuh42Jp/TtqH4Y5qQMJO/pLEQlrkcaSQfAcDPhSiB5S6ysnKSCXc3M=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111b3f7a-af76-4758-b22f-08d812bf8d7c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:08:39.7433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLvu+JPBsnw99cZwi4prZeT7nAoJWbfmBsgxQRqhVhj+bN4+KXBfS8aj/Aqdx0KptF4mFDlFbZDk9x64t7s3SOaU+reUgmC5R9KgMgo7a64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3588
Content-Type: multipart/alternative;
 boundary="------------C9BA4CFA700E3B2F45BA5751"
Content-Language: en-US

--------------C9BA4CFA700E3B2F45BA5751
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 6:30 AM, Leon Anavi wrote:
> Upgrade to release 1.6.1:
>
> - Added Distribution._local() as a provisional demonstration of
>    how to load metadata for a local package. Implicitly requires
>    that pep517 is installed
> - Ensure inputs to FastPath are Unicode
> - Tests now rely on importlib.resources.files (and backport)
>    instead of the older path function.
> - Support any iterable from find_distributions
> - Added module and attr attributes to EntryPoint
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...etadata_1.5.2.bb => python3-importlib-metadata_1.6.1.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-importlib-metadata_1.5.2.bb => python3-importlib-metadata_1.6.1.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
> rename to meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
> index 5170855c2..c46df8fcd 100644
> --- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
> @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI = "https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz"
> +SRC_URI = "https://files.pythonhosted.org/packages/aa/9a/8483b77e2decd95963d7e34bc9bc91a26e71fd89b57d8cf978ca24747c7f/importlib_metadata-1.6.1.tar.gz"
>   S = "${WORKDIR}/importlib_metadata-${PV}"
> -SRC_URI[md5sum] = "35a85a81c7d86605f4f49397f4e7e39c"
> -SRC_URI[sha256sum] = "dfc83688553a91a786c6c91eeb5f3b1d31f24d71877bbd94ecbf5484e57690a2"
> +SRC_URI[md5sum] = "38f795ac13abc923acfd3da06263eb8f"
> +SRC_URI[sha256sum] = "0505dd08068cfec00f53a74a0ad927676d7757da81b7436a6eefe4c7cf75c545"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
>
> 

--------------C9BA4CFA700E3B2F45BA5751
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
    <blockquote type="cite" cite="mid:20200615103017.2714-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.6.1:

- Added Distribution._local() as a provisional demonstration of
  how to load metadata for a local package. Implicitly requires
  that pep517 is installed
- Ensure inputs to FastPath are Unicode
- Tests now rely on importlib.resources.files (and backport)
  instead of the older path function.
- Support any iterable from find_distributions
- Added module and attr attributes to EntryPoint

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200615103017.2714-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...etadata_1.5.2.bb =&gt; python3-importlib-metadata_1.6.1.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_1.5.2.bb =&gt; python3-importlib-metadata_1.6.1.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
index 5170855c2..c46df8fcd 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
@@ -5,10 &#43;5,10 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e">&quot;file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz">&quot;https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz&quot;</a>
&#43;SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/aa/9a/8483b77e2decd95963d7e34bc9bc91a26e71fd89b57d8cf978ca24747c7f/importlib_metadata-1.6.1.tar.gz">&quot;https://files.pythonhosted.org/packages/aa/9a/8483b77e2decd95963d7e34bc9bc91a26e71fd89b57d8cf978ca24747c7f/importlib_metadata-1.6.1.tar.gz&quot;</a>
 S = &quot;${WORKDIR}/importlib_metadata-${PV}&quot;
-SRC_URI[md5sum] = &quot;35a85a81c7d86605f4f49397f4e7e39c&quot;
-SRC_URI[sha256sum] = &quot;dfc83688553a91a786c6c91eeb5f3b1d31f24d71877bbd94ecbf5484e57690a2&quot;
&#43;SRC_URI[md5sum] = &quot;38f795ac13abc923acfd3da06263eb8f&quot;
&#43;SRC_URI[sha256sum] = &quot;0505dd08068cfec00f53a74a0ad927676d7757da81b7436a6eefe4c7cf75c545&quot;
 
 DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C9BA4CFA700E3B2F45BA5751--
