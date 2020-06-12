Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.70])
 by mx.groups.io with SMTP id smtpd.web12.22873.1591976307049766904
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 08:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bK3ypofm;
 spf=pass (domain: windriver.com, ip: 40.107.75.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPLUQJgKWSjXdPFHTuNhUJRgWxGpc2+6eGEIP0WrILK9Uw7FuX7P7f5IGe3lV6rbyc0VY1vJqvZI5/mheFfmlPcLp705TA6al6p+IjPHuUkf0T1WdYOqGBowupRVT3nn7O4SlLppEv5AJtj0eIKm3+sqA7Ou7TO41QMacHW5do8G/q4KWzQl+njK7OC6GipIJaTptpAxiRz5rS1YEPibCGTd5iy/ubcuWudFNRei1e2YwFpXiLL3vrvWs5ID8FUQQxlWthGk6jQlhb5RgNfwe/dbHYPtqtJn/sEF3EWwO2OdHc6nqVYldVgl+gulHCP6GqZVeZhbcJxiZmi41IDi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZaRU0sFw2GdsunYwmOw6mhp6VINe/P6ceoQWxqEG/k=;
 b=PsA+I6KjOFUUC8U++TEU6ifDtQz29FUAd7zToNuXUIt+Zu8g2eFrJ7w0lxg5aYnrxSY3HEoD/VGa1mHctz54awVsvsb56GdRGET/1uujwyxW+DHRo8EEOXOcQ7mlrWCl6qFzK9yB6ZpivmwdQxFVVZ8n7STCvwVx4740eFbVZuRlHq73JYwvez5gFpfbjLP56qcS557/Si3JUe6YZ6YIgYJrIcWsbpGeygTg01b3IKbFVWHWpIHv4FB/XXjbHdv8l9/b5gbA0mbbx1t0YtIzOq7YWbeAKxJbch2jI4gRzjWsXbyHOMkAswhqNHNwlDXbe14p9ho88JD+tWkSWpEtSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZaRU0sFw2GdsunYwmOw6mhp6VINe/P6ceoQWxqEG/k=;
 b=bK3ypofmgkE2zCdq+o/yt5LsYCAlIi3HjPZJ9CkbT8+8qz1Hi5GKECqjQohQ+xHz6cMhKDFQcsjVoaNZL4zxPmiubd92oSXbk+ORZy2+EGQoY3sLWpXKYNpUdglyCmr55T0l9u26sjF3VczIQNoxU5lOJlZYvi1L7C+98F6R9YU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3746.namprd11.prod.outlook.com (2603:10b6:408:8c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 15:38:25 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 15:38:25 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-jsonpointer: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200612144201.4536-1-leon.anavi@konsulko.com>
 <20200612144201.4536-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8058fc98-0beb-3934-32ab-18b72908a9b3@windriver.com>
Date: Fri, 12 Jun 2020 11:38:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200612144201.4536-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Fri, 12 Jun 2020 15:38:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47fc15a9-e7a7-4330-b5c5-08d80ee6a50b
X-MS-TrafficTypeDiagnostic: BN8PR11MB3746:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3746C811506919F1FD5041439F810@BN8PR11MB3746.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BDwZpNnF138uKuW2gV5YCxX/orBNabeA0/szlmFtlA1h8hxkPY/C1+af9TX8sSedTe6xuXK4GiZfaIvk4FTLChL0eEqaL4qAx9PNQyPkYY/m0UNrTsLSfo6KfJVvDJb/YyrI79TaLnm9Ll2wHPIpVOKK3YnSbJVm7FADYj7Rd3N1Z73LCbycE75ni9gm5DHRfolJuZLK+EruqY/tC6TRr18hxbxHokqEJdlJOef+QqmFw93HPe5qSw+26GK6NLgJVMSsA8syFPGKmUjrkiHv9Mhh06e/s2hWkVFdKFl2Dt2Xu24kaTsC9qHYoQ/2I2bbt/zTE7/qFkigIipZnhV/u29zS+ieF4nNvIMMsoygsX/PYaw+Fr5d71fGl7266F96B3/I+bHjmGN75AE4cPzTTWjQo1QfN36ezEwhDmbxrx1c+OuOTY89nxEDJ5Q8+nQMz/CHr9ga9ZFCYNvPmCdSlg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(376002)(39850400004)(396003)(136003)(6486002)(31686004)(8936002)(966005)(478600001)(8676002)(166002)(83380400001)(316002)(66946007)(36756003)(66556008)(44832011)(2616005)(31696002)(956004)(66476007)(16526019)(33964004)(186003)(53546011)(52116002)(86362001)(26005)(2906002)(6666004)(16576012)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qC15BGu9fN7LcuWNlRePxoj9mu/Gv6CoVb8JPi7vT9BnAMtq6Qz+8ANFEfsDOj26uNrbkpoksNvKe8GG3gqkuTHbZ5PUVSTIzKJ/4kqVOi76tQBODBZ10QLdPoCoWhGlCY4evo9jy9RTm8++DSJWjyMBnnbA8eWEkq3jtDOfeWcjGmIsV8w9JqP5fgxadcztpU9A4MX9ZaDa4VH6tgeikIjCwYewXtwEjtWmjGBh6BaBMV0P9676tQK+mQH1HqsxP9oV9E5uMokSkNpEeougDabvQZZ/LtEOj9qeKy8mOwPHGJnRBVOZElKFs6+zs3bnP2wuXsOz/7tKjcsWPoTYbbpxbBTII2pOlkqlUx3/HSIB+8aSpIQwIpEIkEIMAkZrG1q/TEIfPVM/FlrtqhBwYDMefZ6x767YPbAn9P3bUvxOdpxKu+OmGq/DyRsYgTtbxejGHYwmM1/hRD81DBSKLPasYM8Y9TZRBtXGUcOx143OT/FvycHTbAO96I1MPF09
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fc15a9-e7a7-4330-b5c5-08d80ee6a50b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 15:38:24.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvuWNcD0m6G28cGkjeNNVEBUdCIQ2jRqbSiMPjs+0t9+jeXMDgdv2Bx22/B85y8i3qkvyiffqNCjoaEj2qVxzD8nOlGGJlya5gBaneYGCx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3746
Content-Type: multipart/alternative;
 boundary="------------339F9847BB23F7C0E69E886E"
Content-Language: en-US

--------------339F9847BB23F7C0E69E886E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/12/20 10:41 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-jsonpointer.inc             | 27 -----------------
>   .../python/python3-jsonpointer_2.0.bb         | 29 +++++++++++++++++--
>   2 files changed, 27 insertions(+), 29 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-jsonpointer.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-jsonpointer.inc b/meta-python/recipes-devtools/python/python-jsonpointer.inc
> deleted file mode 100644
> index 3e41b70b8..000000000
> --- a/meta-python/recipes-devtools/python/python-jsonpointer.inc
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY = "Resolve JSON Pointers in Python"
> -HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
> -
> -inherit pypi ptest
> -
> -SRC_URI[md5sum] = "741b98d0e693b08b5e44e0a9da5a7bb7"
> -SRC_URI[sha256sum] = "c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362"
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-json \
> -"
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
> -	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb b/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
> index 8d0a09b43..68bfe9716 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
> @@ -1,2 +1,27 @@
> -inherit setuptools3
> -require python-jsonpointer.inc
> +SUMMARY = "Resolve JSON Pointers in Python"
> +HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
> +
> +inherit pypi ptest setuptools3
> +
> +SRC_URI[md5sum] = "741b98d0e693b08b5e44e0a9da5a7bb7"
> +SRC_URI[sha256sum] = "c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362"
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-json \
> +"
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
> +	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
> +}
>
> 

--------------339F9847BB23F7C0E69E886E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/12/20 10:41 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200612144201.4536-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200612144201.4536-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-jsonpointer.inc             | 27 -----------------
 .../python/python3-jsonpointer_2.0.bb         | 29 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 27 insertions(&#43;), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonpointer.inc

diff --git a/meta-python/recipes-devtools/python/python-jsonpointer.inc b/meta-python/recipes-devtools/python/python-jsonpointer.inc
deleted file mode 100644
index 3e41b70b8..000000000
--- a/meta-python/recipes-devtools/python/python-jsonpointer.inc
&#43;&#43;&#43; /dev/null
@@ -1,27 &#43;0,0 @@
-SUMMARY = &quot;Resolve JSON Pointers in Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/stefankoegl/python-json-pointer">&quot;https://github.com/stefankoegl/python-json-pointer&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3">&quot;file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3&quot;</a>
-
-inherit pypi ptest
-
-SRC_URI[md5sum] = &quot;741b98d0e693b08b5e44e0a9da5a7bb7&quot;
-SRC_URI[sha256sum] = &quot;c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362&quot;
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-json \
-&quot;
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
-	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
-}
diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb b/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
index 8d0a09b43..68bfe9716 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
@@ -1,2 &#43;1,27 @@
-inherit setuptools3
-require python-jsonpointer.inc
&#43;SUMMARY = &quot;Resolve JSON Pointers in Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/stefankoegl/python-json-pointer">&quot;https://github.com/stefankoegl/python-json-pointer&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3">&quot;file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3&quot;</a>
&#43;
&#43;inherit pypi ptest setuptools3
&#43;
&#43;SRC_URI[md5sum] = &quot;741b98d0e693b08b5e44e0a9da5a7bb7&quot;
&#43;SRC_URI[sha256sum] = &quot;c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-json \
&#43;&quot;
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
&#43;	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------339F9847BB23F7C0E69E886E--
