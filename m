Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.64])
 by mx.groups.io with SMTP id smtpd.web10.12040.1591799370148153228
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SWFnrUZj;
 spf=pass (domain: windriver.com, ip: 40.107.243.64, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZRtDMtmoi/3Vn1swqKCm0YV0Dwn1IP/ulgogSYL3kaeuc/I0YvoF+jynt98squbXnZl2ri2W8QbygHXiD2fbfBVUGRf2tkDAIkz/zlIUcrQgor4T/iSeWIia5LJSJmUjmPN1nvxP9ugetCHMOxuzGBNklS/CIpbB0oTdqfDslkcBa92Ju7HkkheahtO5+L216PYOuo/6jc3w/ZjYulKuJjZVTORPlgyoo4Y++BsMaclWfjEKaGT8FwNWe2WL90Ysgfj4AEs/ng/KyEAwfHkXsdSa6A45T6G0qwF5rAeNIvV/zhwXtsQ+46ed6aIn5WRUFOxQko4EPoZyyHwuYFSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmCswNGsUVUe+1q4gpn4bchV5lwc7dKBHxZVGHcO4Rw=;
 b=Tb90jLYYneTlFLBcp5Ul5oKvsdjJFJYsOCbXaPt9GoKkgs9OC5oEffRKSPdHoyu9/CJMcnxXTZl4ajqQ575ZvNmsf6ehF19c0Z2Vt0bwjq5YNJri2LsCAS+/Qyuyc4/63+rXsy7Pl5xo7mAj7doXioeyFa9YMdF6cqYTm86iiajP6vC1bvFFRIKusBUv6ivRImv07j9PFDr9x+ugOgXhD1WyaQTq45wNLF9SIjYLphoWpqFR83OryzNboyjcpQkmCB5AUPCo8XzTG7wKfef/iBznj4nhiNapHr8ugHSMGc5CwXPWsMfZAHeuJyvshz4oAaYMI/KD8f/0Z38hXruE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmCswNGsUVUe+1q4gpn4bchV5lwc7dKBHxZVGHcO4Rw=;
 b=SWFnrUZj8/6UG963mOLlD2JhMf01HnxBf6uYAaDN4PND9bU+tN/4kdW7Z62V13mtZYIXV+oLiyL/H73hpzZu4/Vp9U2fNHbULyZom8be3aSAJLIcZ8FqhjIWF9OQjGEkSEqXcp2JDLWeBYndGsuDtn998MgJdwR2NAgDotZb8ws=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1393.namprd11.prod.outlook.com (2603:10b6:404:3c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 14:29:27 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 14:29:27 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-hyperlink: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
 <20200608121410.5814-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <aa94d6f4-6323-d477-34af-c92d7d9057e2@windriver.com>
Date: Wed, 10 Jun 2020 10:29:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200608121410.5814-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::6) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Wed, 10 Jun 2020 14:29:27 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1be1512b-85a4-4008-e3e1-08d80d4aae47
X-MS-TrafficTypeDiagnostic: BN6PR11MB1393:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1393DDF97843AF0333A98FFD9F830@BN6PR11MB1393.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2ioexiGsyhhtwyzjWq9rtNL99O5U2eBFWMd3OgB6Ji8FB3DS7rkA301qngM10mYcxWqyH0wavo4VEJGjVNByjHGlfs12X9OIv7azKPXMRFGAT1uo/IxURkzxH8RR+LhWYOOwWQn7+4a/+IQYZdem8fgf9+L6iEquIB/clG37fvrqHpTjeS60PtL2ep2CQesypL/uZcgX6cZGzbL1s8SeU9nEJSc1r13K1gWLNCGirfOExjpK28RzVoXkh4uSiJhG0IaKC8o1K3kw2uSFozqya0EOhmtgDckhoacE8HoS8qZ7LN6pmZsaxPomszsmxJEsZU4uLxVv/waZOAgZHMv3kSca60Jvu6xK7pudYbKlhjgU8bzSx5EKdN1d8437LKpJT16ZgO6fy+If+FJP3UNYmSBH2IerqOXbIytsHRaBKbimRgheWVhZph/jYFEuamaXa+1BO6C+ErXnAOexuhLDcw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(136003)(376002)(346002)(396003)(366004)(44832011)(2616005)(2906002)(478600001)(956004)(86362001)(31686004)(16576012)(316002)(31696002)(36756003)(8936002)(966005)(5660300002)(16526019)(66556008)(66946007)(66476007)(83380400001)(166002)(8676002)(186003)(33964004)(26005)(53546011)(6486002)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OX71uUwd+WPixqqWAuxMLel1cKmRBeDhYNjDbzxO22oxJkZf4KTFXDpdKU7fHaC2X8goyGsB66/DeMs9TbGVqAdJOOwdGp5MzMCEHvulouX21KMD4Q1nekyLIf1vmQ0C2UxHksYxvlCTtYHxDUS15+hjnHlrdepT6I941JK/ARsahJUdP5lruRQmicvgs4T0fQfTKeOGbG1cOIzHH/zvDZbKEk8mbjHqKbzzHmn6SOfPy0ASB3s0MvLwu+yBCuKrvAgY7YxuRleMzCoiB51N1Sw6raVqG7FTgFJBu8ON38ewKOFdW5kbNsu9ZzVbiOGG9016GI/g3Y5Z3L9ONRY7V74YFEllW6LB9gTemdR7v2DgnaMNh5KbbyKS8KVEujPAamMacd43d+UlTlSeBR59NidPVRFBZLWalTTS/SycrIq7gtH44WKC0bG6DWwNSu9xt94uIKqncku8UpslUWVdXryOb48KmD1neoz0Lya3aow=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be1512b-85a4-4008-e3e1-08d80d4aae47
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 14:29:27.7661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWNVYXlwlmG8doJ/u6b2UCI2MrhROgvtCV0WFcxxDjY9rlB66uzIpJt9grEiDjCCZY8B+kLHCCM5VfZrdgswVz8wyp9lThDPKq9g6uGNwU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1393
Content-Type: multipart/alternative;
 boundary="------------8906D6F30CA9C3208D610F53"
Content-Language: en-US

--------------8906D6F30CA9C3208D610F53
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/8/20 8:14 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-hyperlink.inc               | 17 -----------------
>   .../python/python3-hyperlink_19.0.0.bb        | 19 +++++++++++++++++--
>   2 files changed, 17 insertions(+), 19 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-hyperlink.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-hyperlink.inc b/meta-python/recipes-devtools/python/python-hyperlink.inc
> deleted file mode 100644
> index 653170ca6..000000000
> --- a/meta-python/recipes-devtools/python/python-hyperlink.inc
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DESCRIPTION = "A featureful, correct URL for Python"
> -HOMEPAGE = "https://github.com/python-hyper/hyperlink"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb"
> -
> -SRC_URI[sha256sum] = "4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654"
> -SRC_URI[md5sum] = "4772fb4d87c26a1ab22a6161424e3cba"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-stringold ${PYTHON_PN}-netclient ${PYTHON_PN}-idna"
> -
> -PACKAGES =. "${PN}-test "
> -
> -FILES_${PN}-test += " \
> -        ${PYTHON_SITEPACKAGES_DIR}/hyperlinkt/test \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb b/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
> index 70813bf34..3ee098ad6 100644
> --- a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
> @@ -1,2 +1,17 @@
> -inherit setuptools3
> -require python-hyperlink.inc
> +DESCRIPTION = "A featureful, correct URL for Python"
> +HOMEPAGE = "https://github.com/python-hyper/hyperlink"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb"
> +
> +SRC_URI[sha256sum] = "4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654"
> +SRC_URI[md5sum] = "4772fb4d87c26a1ab22a6161424e3cba"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-stringold ${PYTHON_PN}-netclient ${PYTHON_PN}-idna"
> +
> +PACKAGES =. "${PN}-test "
> +
> +FILES_${PN}-test += " \
> +        ${PYTHON_SITEPACKAGES_DIR}/hyperlinkt/test \
> +"
>
> 

--------------8906D6F30CA9C3208D610F53
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
    <blockquote type="cite" cite="mid:20200608121410.5814-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200608121410.5814-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-hyperlink.inc               | 17 -----------------
 .../python/python3-hyperlink_19.0.0.bb        | 19 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 17 insertions(&#43;), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-hyperlink.inc

diff --git a/meta-python/recipes-devtools/python/python-hyperlink.inc b/meta-python/recipes-devtools/python/python-hyperlink.inc
deleted file mode 100644
index 653170ca6..000000000
--- a/meta-python/recipes-devtools/python/python-hyperlink.inc
&#43;&#43;&#43; /dev/null
@@ -1,17 &#43;0,0 @@
-DESCRIPTION = &quot;A featureful, correct URL for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/hyperlink">&quot;https://github.com/python-hyper/hyperlink&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb">&quot;file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb&quot;</a>
-
-SRC_URI[sha256sum] = &quot;4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654&quot;
-SRC_URI[md5sum] = &quot;4772fb4d87c26a1ab22a6161424e3cba&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-stringold ${PYTHON_PN}-netclient ${PYTHON_PN}-idna&quot;
-
-PACKAGES =. &quot;${PN}-test &quot;
-
-FILES_${PN}-test &#43;= &quot; \
-        ${PYTHON_SITEPACKAGES_DIR}/hyperlinkt/test \
-<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bbb/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bbindex70813bf34..3ee098ad6100644---a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb@@-1,2&#43;1,17@@-inheritsetuptools3-requirepython-hyperlink.inc&#43;DESCRIPTION=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb b/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
index 70813bf34..3ee098ad6 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
@@ -1,2 &#43;1,17 @@
-inherit setuptools3
-require python-hyperlink.inc
&#43;DESCRIPTION = &quot;</a>A featureful, correct URL for Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/hyperlink">&quot;https://github.com/python-hyper/hyperlink&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb">&quot;file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb&quot;</a>
&#43;
&#43;SRC_URI[sha256sum] = &quot;4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654&quot;
&#43;SRC_URI[md5sum] = &quot;4772fb4d87c26a1ab22a6161424e3cba&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-stringold ${PYTHON_PN}-netclient ${PYTHON_PN}-idna&quot;
&#43;
&#43;PACKAGES =. &quot;${PN}-test &quot;
&#43;
&#43;FILES_${PN}-test &#43;= &quot; \
&#43;        ${PYTHON_SITEPACKAGES_DIR}/hyperlinkt/test \
&#43;&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8906D6F30CA9C3208D610F53--
