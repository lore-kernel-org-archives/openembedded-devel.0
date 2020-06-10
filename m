Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.45])
 by mx.groups.io with SMTP id smtpd.web11.12104.1591799390621844772
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=k+92ZJcJ;
 spf=pass (domain: windriver.com, ip: 40.107.93.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSqDAIkUHwzN61/5eD3TqnTf6zJx9H6mNDCtCusiM0Nwa4ORnt+0Dbda0TPnkmiWNvX2kOCXhHluxP+WGMD2Y1VTxEwAIGAPafFz9WVzl9qr/8NLh7sbIsVa7QKrtRdlsC/XaXTsyNmM867NOlO3AUkjx+HGYvIHfFM8cxqr5FT5gXQspoqTBi9GipMEhmA7K+23ijSHWQ1whupguS4M18KutZzu9kvRodpz99iNduM9LQNKm9zKZglpQ0k884YC4KRcyGPyRlih9uiWvgoPj0/miUtdaQNjlrQuv51eJf4AOcUyCNnudWNS4xLu83lzdeOjACRGAUmEK/bwQjzESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KoJOHrNEnGdiJBJtta8e/u1XHIfkom6I1w/KzgVK1Y=;
 b=AqLpkrGc2lz44eM9YCHC7FFS+4IS53tpDa9gsQkzPiHmoEvCu6zwKOcNUZa0Eu6ijzwxbgwVR5YrdwRcW7VVqSqfA3//Ra5TVx8H/BdUDeGU2Vnasux4ub3mdvO33oz+UGkvfCWSt2lWQ8EToH1RcgMk6EhxNg/q66bfVqPz6qsfP/PdBCqGuUCTkNMTArxan8JPV7EGDi3H6sFluvXoL3j3oj4/PW2bpoHuAuFOqM5skMXcxLHII/9U4nVK0jEU/Fb1efhtMoAQQTxXUm+m80Fdl8dCKZ9Yu7uWpaFkc8e+HqzBRi6r3jlGQAp1ind/COC7SFdE+usZ97iV2+u8rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KoJOHrNEnGdiJBJtta8e/u1XHIfkom6I1w/KzgVK1Y=;
 b=k+92ZJcJGvGSfnHPLxtmkpBzHxrGv35r2ONmNi/UsKu6b9iIe4CSrr4Crem6LYvjLtzJHwk3Dimp57cXHs3WP0NRb2RXDFXjcoQsydUDQVA3avrAMeSbeMZD+hP5WC+dzwX05F+zyKx0a/5uUY+005/yHNnTAAKzKLxK9s6LfBM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3953.namprd11.prod.outlook.com (2603:10b6:405:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Wed, 10 Jun
 2020 14:29:49 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 14:29:49 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-html5lib: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
 <20200608121410.5814-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c7e83fd9-8cb1-e311-14dc-641bdb628dda@windriver.com>
Date: Wed, 10 Jun 2020 10:29:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200608121410.5814-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::35) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 14:29:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31a0957c-74fd-41c7-57ff-08d80d4abafd
X-MS-TrafficTypeDiagnostic: BN6PR11MB3953:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB395313BF2FA585431628F9879F830@BN6PR11MB3953.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z9rnSsDZgOwfXJUsqaqe3PkZJqK71ruqXd8Y6iNrBon6g1Fexf538x1r+iqNiDFuUvtfN0Vh6rZGteT5SIsD/2IaFN51x5WYhtuAuuRjS2JKYIB6S/TzDvK8ZfFbn8CbDa+VxjDnxeAJWWpyNZeyTPK+7STI2QsjD/S6/rTfefxuhDML2cEJHLeuSG5FB4bL5o6BeSRV9i9j1Q8QUvo8+5XF/zUJnNukm7ikg3SdclY7+eNiXsGZN4TfxQE+GvwkIg7plOD0/rQG93jB1bqhGAs5xSxVoWr3+2zU4agzfZvrr2aPZkpZisbktn8MI2DcgW3ZTdpCkXH2hbHJbgFLqoM35wAscXCEx3OO9aGslaYcC0GGe7RZmwfyvcvougZVYF/PZAedMTuPanORQFJEtKE4xfkYmrdw9Ch/tGSAmQbRm0zfaD5X7jO+lckJSQ2cAqkJnb61PPedl6C70iAFbA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(346002)(136003)(8676002)(8936002)(66556008)(66946007)(66476007)(5660300002)(31696002)(86362001)(31686004)(966005)(33964004)(36756003)(316002)(6486002)(166002)(478600001)(2906002)(2616005)(186003)(26005)(44832011)(83380400001)(53546011)(956004)(16576012)(16526019)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zVQ6/4R1UBdCyCaFfL04GKTYC8ODD+IOufP/+v9606So8nOpVTHXyHuE8XpNnVawbipZX8+TSrJ8InEHr0kXd1FHo0aReoAqFZaiNyh8WmrKMw2spOSRrmDyKcHpOyJxyZCuDP7+R74CvTGhcvDkmGXCU2ZErWgpLk0gf4a+p959R82cI5QrVrtd0x8cG+yFyjUhEeqHRnpCP2p7A49Y8/L8LHVNBOJLEW32XcJvQKnHK1n7qEj5ts0X7uHKk6VYL44fAVLijL9gUORZV30q++35IHvUhzno7jkyH528uTvU8utY4T5F5kolKaiYmAdFcJ2b/rStIgEswzhPPt5l2Bu2f31B3m3YgabwpL2AzFFGJP4iXYfcBhKBlVjglpAm0H0Ruq+A31UgMBprsoXcNRIFRk5mpERMS62g9TCkxplC+cXp/Srqern1b69XpWfcAedShaMNW6C7u/U0Inn0aLiqLwGd10tbP2tAHyYrPek=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a0957c-74fd-41c7-57ff-08d80d4abafd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 14:29:49.1140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJxyCxLJu2nqgash57yF8JtsP5c+AAbkPjO9kGd3YeB5tJQbMO9mpwZNpqGTx4crjH/Mt8mcv4mNx5bEX7GedsliJfqHWfj70Wx7kDq8wUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3953
Content-Type: multipart/alternative;
 boundary="------------D82D36B8F84632D4D248E5F3"
Content-Language: en-US

--------------D82D36B8F84632D4D248E5F3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/8/20 8:14 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-html5lib.inc                | 17 -----------------
>   .../python/python3-html5lib_1.0.1.bb          | 19 +++++++++++++++++--
>   2 files changed, 17 insertions(+), 19 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-html5lib.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-html5lib.inc b/meta-python/recipes-devtools/python/python-html5lib.inc
> deleted file mode 100644
> index a8e0fb408..000000000
> --- a/meta-python/recipes-devtools/python/python-html5lib.inc
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
> -
> -SRC_URI[md5sum] = "942a0688d6bdf20d087c9805c40182ad"
> -SRC_URI[sha256sum] = "66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-lxml \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-webencodings \
> -    ${PYTHON_PN}-xml \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
> index 6bd8b49f5..98ee56b2e 100644
> --- a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
> @@ -1,2 +1,17 @@
> -inherit setuptools3
> -require python-html5lib.inc
> +SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
> +
> +SRC_URI[md5sum] = "942a0688d6bdf20d087c9805c40182ad"
> +SRC_URI[sha256sum] = "66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-lxml \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-webencodings \
> +    ${PYTHON_PN}-xml \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------D82D36B8F84632D4D248E5F3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/8/20 8:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200608121410.5814-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200608121410.5814-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-html5lib.inc                | 17 -----------------
 .../python/python3-html5lib_1.0.1.bb          | 19 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 17 insertions(&#43;), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-html5lib.inc

diff --git a/meta-python/recipes-devtools/python/python-html5lib.inc b/meta-python/recipes-devtools/python/python-html5lib.inc
deleted file mode 100644
index a8e0fb408..000000000
--- a/meta-python/recipes-devtools/python/python-html5lib.inc
&#43;&#43;&#43; /dev/null
@@ -1,17 &#43;0,0 @@
-SUMMARY = &quot;HTML parser based on the WHATWG HTML specifcation&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c">&quot;file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c&quot;</a>
-
-SRC_URI[md5sum] = &quot;942a0688d6bdf20d087c9805c40182ad&quot;
-SRC_URI[sha256sum] = &quot;66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} &#43;= &quot;\
-    ${PYTHON_PN}-lxml \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-webencodings \
-    ${PYTHON_PN}-xml \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bbb/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bbindex6bd8b49f5..98ee56b2e100644---a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb@@-1,2&#43;1,17@@-inheritsetuptools3-requirepython-html5lib.inc&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
index 6bd8b49f5..98ee56b2e 100644
--- a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
@@ -1,2 &#43;1,17 @@
-inherit setuptools3
-require python-html5lib.inc
&#43;SUMMARY = &quot;</a>HTML parser based on the WHATWG HTML specifcation&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c">&quot;file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;942a0688d6bdf20d087c9805c40182ad&quot;
&#43;SRC_URI[sha256sum] = &quot;66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    ${PYTHON_PN}-lxml \
&#43;    ${PYTHON_PN}-six \
&#43;    ${PYTHON_PN}-webencodings \
&#43;    ${PYTHON_PN}-xml \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D82D36B8F84632D4D248E5F3--
