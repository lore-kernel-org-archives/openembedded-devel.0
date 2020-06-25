Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.84])
 by mx.groups.io with SMTP id smtpd.web10.9933.1593089977163071768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 05:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=khuQ3lks;
 spf=pass (domain: windriver.com, ip: 40.107.223.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmHLBsJoO69im315noY5ytewYFysgru4yB+iviMNy2mhZbLaPByl3Ntix/9ksfn3cdp7hEahJuCDRd0jEUdoA64+JgWhgRjHaf04ge0kIuPemytlWKMZuuBFfwhXCTS3eSAQfPD5kYHvPwafH4m8X+nWtNokM5cJz74o3NEhSOASw2v+/PavATq54yffQ0aRsXB361cRQS36ck2nDBA9HR4zxYg3lJ6GTyVm7QzqVwntFJtcuxeypevRE4Sb30qjXq39W4QYw8UwJQg1JQDU2T9bm9790Aj6zD+QI++T6oLM/+ZB2YxR9XrhbjZfUUEPzrJe+80KOC/qSjcSuxuuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VDYZvW7i/ZY85vuAPdFOxWNfRKTyph+NMX5mdryjTc=;
 b=ZVG5dnS82txqAfMbHg2Ry0l9lxrvfyT4nlb9gQghd96LWK4t3SXF4JsUhpt3aQIedM5ZPe2GD+G6eEVMzopWp6p9OoC8leMvFsLUYyo9mJemRWhakI3AB6V01xdUWd9pIGb0cdnyE8P5Fvhv3Q/vj9bUQCVLkRxSd3RTPteU1RS0uLZKn2I5542jpCH5J31Yd+Jibztq1J50ISzld7docva4Yu95w+nP6yOImkpoAReWPTqXs5xt7A7ORCcFNuwYJ0/ZBsifZjhXV4oBolfHrhWrgJLpKCKv0SSW/qlvbz+KPBafA/MeIUL3cTWy1d/W28RICo1SWwOrQfHApPH7DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VDYZvW7i/ZY85vuAPdFOxWNfRKTyph+NMX5mdryjTc=;
 b=khuQ3lks14Vof5rRRhqfPqjHgo8rioidGqR7x0xoXIkSi9yMrmtHcAuVWmtnf5GCHEy66mpzalP5FUKNqkr3UrihGFUNI4v6bI2DHzysmr5s3dJkw5fiDeFQd6047eqMrT6lA5/PlNZWw6NeMEbBphDc0xstVPc/F/VXyxYnNa8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 12:59:36 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 12:59:36 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-ndg-httpsclient: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624151628.547-1-leon.anavi@konsulko.com>
 <20200624151628.547-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <dd216f5e-0a27-ebe1-e7e6-589814c73d56@windriver.com>
Date: Thu, 25 Jun 2020 08:59:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624151628.547-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::32) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 12:59:35 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55be8b95-9e89-4931-d142-08d819079c9a
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39549BB7E0A5617831C753699F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B0nGbRdobDBGicx6O0dlo54Dp4bBghKs9s0aWrhXG8uuCkGCezlPwcGVPPh+o8esIBuXdNcvL9MYt/HDql1gxlJMCj/PzhlzjLSwMbISfAukPaQ8krMrlWdVBq2rn+Jvszx5imqhRksuDEhGUW1Q7SqikRCATCFILyF8O68J5fihcqS6AAHLA4o7FjP9OYV6h3pm8OxHm6wLi5sHJ7DALnPqxgq/S2TfJrk8U4SIyK5k/h8XcCtjVpXLndLNCrTxO6V+Ny4cX0oPOPqDNoxNURcjlv6qsvyFyxwLzHz5a6KnlRqNxOzyuYJzSj/hNmlCbFxgKhYS1y3FaiKT20P54tnfhRUrB/nmXti6S0fQY75+AgsBhlnSkIvsFSpsxY0MW7psWTAMQ6CEPPyBhi2dgYCzrnFXtWoOBVkJhZCi2tTzQX7oCeL5q9aY2D+Hla0ZbeCIW3rpqCjd1q/V4AFzTg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(66946007)(66476007)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rw0ZABPI36MnY0s9iLBFbf8osO3G6xx57bDHu3veUdrm6ykwQZ7wavd1fw7W+/37o+9aJ5lxeumDcrYK5XX4/be7VtA50As0dVBc3dtaz+cSJwDqOCSxw1SJYd/Xkmocn9nX06VXafQSikPSQBI7X2UzdKMuV6vIo0X14XCjfaKe2b1BmQD628RiJBZiUOihwCBnjXjmx6STD6GWue2++WQBLXSyR0WwIp5glDVblJBkjBhh1wgXQUlrxQWjcm0Au/WO1pHJcN/Zenxnmf7W2GvvxOPhLyHe32v2xNID9vEWm5CwyxRNzrL2Moajyxzu98dyS63w4Fuo7hKSVuJW0tVKHGqAaUQubhjQf4+PM+u2xWg7qenERjV/Tkw0HNcKkBjX/l6I5xnDQMkth+Hog6FFcPz8p6Di/0Tn0XMC4VmrJuSTGm2r5VSnu6L1UzyYubwzrj1sJdryAFPxQKqYmVtFSdTHTEMOvbUmGXE5uqg=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55be8b95-9e89-4931-d142-08d819079c9a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 12:59:35.8432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4j2DcBob5Vrkpep3C6bB5PgbyFPHxk/FMSJahGe5rjiQNXiAGqOsSo+eGElCpLLoBiOhykHY50phE+6/pxa/78KHu6pg7hR9MPKbkWydnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------D19DCE3C719298E7332E8729"
Content-Language: en-US

--------------D19DCE3C719298E7332E8729
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/20 11:16 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
> Fix the HOMEPAGE to point to the GitHub repository.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-ndg-httpsclient.inc         | 25 -----------------
>   .../python/python3-ndg-httpsclient_0.5.1.bb   | 27 ++++++++++++++++++-
>   2 files changed, 26 insertions(+), 26 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
> deleted file mode 100644
> index bca58f764..000000000
> --- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL"
> -HOMEPAGE = "http://python-requests.org"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
> -
> -SRC_URI[md5sum] = "b0fc8ea38f87d2c1ab1ed79a95c078f9"
> -SRC_URI[sha256sum] = "d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e3d72131de2592210"
> -
> -PYPI_PACKAGE = "ndg_httpsclient"
> -
> -DEPENDS += " \
> -    ${PYTHON_PN}-pyopenssl \
> -    ${PYTHON_PN}-pyasn1 \
> -"
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-logging \
> -    ${PYTHON_PN}-pyopenssl \
> -    ${PYTHON_PN}-pyasn1 \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -UPSTREAM_CHECK_REGEX = ""
> diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
> index 65a8c816f..23e1868c2 100644
> --- a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
> @@ -1,5 +1,30 @@
> +DESCRIPTION = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL"
> +HOMEPAGE = "https://github.com/cedadev/ndg_httpsclient/"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
> +
> +SRC_URI[md5sum] = "b0fc8ea38f87d2c1ab1ed79a95c078f9"
> +SRC_URI[sha256sum] = "d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e3d72131de2592210"
> +
>   inherit pypi setuptools3 update-alternatives
> -require python-ndg-httpsclient.inc
> +
> +PYPI_PACKAGE = "ndg_httpsclient"
> +
> +DEPENDS += " \
> +    ${PYTHON_PN}-pyopenssl \
> +    ${PYTHON_PN}-pyasn1 \
> +"
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-pyopenssl \
> +    ${PYTHON_PN}-pyasn1 \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +UPSTREAM_CHECK_REGEX = ""
>   
>   ALTERNATIVE_${PN} = "ndg_httpclient"
>   ALTERNATIVE_LINK_NAME[ndg_httpclient] = "${bindir}/ndg_httpclient"
>
> 

--------------D19DCE3C719298E7332E8729
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 11:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624151628.547-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.
Fix the HOMEPAGE to point to the GitHub repository.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200624151628.547-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-ndg-httpsclient.inc         | 25 -----------------
 .../python/python3-ndg-httpsclient_0.5.1.bb   | 27 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 26 insertions(&#43;), 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
deleted file mode 100644
index bca58f764..000000000
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
&#43;&#43;&#43; /dev/null
@@ -1,25 &#43;0,0 @@
-DESCRIPTION = &quot;Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://python-requests.org">&quot;http://python-requests.org&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0">&quot;file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0&quot;</a>
-
-SRC_URI[md5sum] = &quot;b0fc8ea38f87d2c1ab1ed79a95c078f9&quot;
-SRC_URI[sha256sum] = &quot;d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e3d72131de2592210&quot;
-
-PYPI_PACKAGE = &quot;ndg_httpsclient&quot;
-
-DEPENDS &#43;= &quot; \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-pyasn1 \
-&quot;
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-pyasn1 \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
-
-UPSTREAM_CHECK_REGEX = &quot;&quot;
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
index 65a8c816f..23e1868c2 100644
--- a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
@@ -1,5 &#43;1,30 @@
&#43;DESCRIPTION = &quot;Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/cedadev/ndg_httpsclient/">&quot;https://github.com/cedadev/ndg_httpsclient/&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0">&quot;file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;b0fc8ea38f87d2c1ab1ed79a95c078f9&quot;
&#43;SRC_URI[sha256sum] = &quot;d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e3d72131de2592210&quot;
&#43;
 inherit pypi setuptools3 update-alternatives
-require python-ndg-httpsclient.inc
&#43;
&#43;PYPI_PACKAGE = &quot;ndg_httpsclient&quot;
&#43;
&#43;DEPENDS &#43;= &quot; \
&#43;    ${PYTHON_PN}-pyopenssl \
&#43;    ${PYTHON_PN}-pyasn1 \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-logging \
&#43;    ${PYTHON_PN}-pyopenssl \
&#43;    ${PYTHON_PN}-pyasn1 \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
&#43;
&#43;UPSTREAM_CHECK_REGEX = &quot;&quot;
 
 ALTERNATIVE_${PN} = &quot;ndg_httpclient&quot;
 ALTERNATIVE_LINK_NAME[ndg_httpclient] = &quot;${bindir}/ndg_httpclient&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D19DCE3C719298E7332E8729--
