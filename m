Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.67])
 by mx.groups.io with SMTP id smtpd.web11.1848.1592508697823146435
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 12:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hW4uU32s;
 spf=pass (domain: windriver.com, ip: 40.107.236.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5tlWxcsUq2zspsHUCrOHdutrvTO0CXJrsR7XHu9H7bPzkpYBYf7YE39tGdP2N6JUuS0mFKFDjEdlu8kFNZ5Ejf1k2opqOM5+ebh5SPAjHClz+5/7VrJ4hAt0lsXRhM3Iv2lP59ffcOWnA+7dN4JeYE3mG4Jc/0ijkivt14KS9bV9WhhBLtcl6VN7Ple8TdBcYIe++1XDR+htArJ8rfenV2jYQtuFU40ffdzqSBjFVgXz9kXzGJk3QPzq8qbsgVSRY+SE4UWqt2hpcXS2g/rxsV8oisb4ITuLXBwx8PNvYfDZfwVO0/dWU20vFnB4sfi6r+dyitjBtjOIitF9dgqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD8+a28sayT8DXU6bO15RbERF3Tu4L5VEdVrtOzF6NE=;
 b=lqz4yFWzum0FDcmQKKllvAc6SBzaK8rOdIiGiBuaJC6ezHC/3CwSt7HFQRoyW1UdsQLmLODjWkky0Hu5AEV0BaLJsRm2wpRcJZQpOAP1DNaOo5C6Bp2uSQqbb65ecUJawzoeDJ72nUBQhXHXG7pVxVWluQIxAh4Zg4hVSyrttttCp4F661HqG/aUDc12NM1MXYZBu6oyyBMxiSf68usRxqsTTSpp5OEj+kt1h3kqXIoLRU+1VOthT0EDxioVmzlPOf5jcGn8Nh7Hm3cJEz2I0ZUNpMk6aNP0qctR5Cbl5EltWsbMvY7exXk+oGBsjtw70EZcJdJFXogrY5CCaFM6Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD8+a28sayT8DXU6bO15RbERF3Tu4L5VEdVrtOzF6NE=;
 b=hW4uU32sZnzAjHXqFvw3TfVsxRXKgpTcbCN6ULbedQ8b4Py5iHqFhohODVVr1rCHS8vz04fikhAH68r4nFwvydTVPhJ2+fQtI7eNn2Ztws9lt7qXnkzbhRoOJYvnKnPWEZ9u7lILp2C4HbCbIUXKmxbpoFsWIG1G6QyaKYr5Lu4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB2050.namprd11.prod.outlook.com (2603:10b6:404:3c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 19:31:36 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 19:31:36 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-pexpect: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200618090358.31927-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1a3c3c05-a663-084e-faa7-8beba60dadbb@windriver.com>
Date: Thu, 18 Jun 2020 15:31:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200618090358.31927-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::19) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Thu, 18 Jun 2020 19:31:36 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f536826-78f4-44e3-05b7-08d813be373e
X-MS-TrafficTypeDiagnostic: BN6PR11MB2050:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB20509B42F52502C194E35DFB9F9B0@BN6PR11MB2050.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:234;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fslLGh2+nMmtn53N/kCE0K5aN1WDtJaWBRp2unQmpipJixgcnhQpIUTbM6t2G2IO1WEZ+BgTZUnTGJthghBWJpih7/w1g9VJSggHnSl5tz66R/VF5h/DLW9NHWQTiXZP+kFd6uPhZMZaeDtsPXSPjUF+htPgOkTlVHWYe2meL9qYYR1Gzs9r02zdCY3+2Gx8gxcnjcbN8TWpinb8xhQsJJOGGfzOvwWkkVZ/cbHslqG+ZiJOk22RR9fbvK1SqWJO6/vi2EuXVZ0oeXj72tHa1eWea4mpZ4zMg1hJ/ljf3N5vFjrz/iWBMVFCrOSwoGnLgSgqxfb0f3otqhYee+WWcsVvDpV9NpStdVEyBMou1bxIOB2+/04s0DLeXOyVp7dZzd/+UMGYyzzhA/H1UeU2laMvnu1Z5OIA4ADpKFZ5wbad1HPlmUDiqR8PTKpXsmRXhNMzNjg9xFH1IonyKcIAcg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(39850400004)(376002)(366004)(44832011)(6486002)(33964004)(956004)(166002)(83380400001)(2616005)(36756003)(478600001)(86362001)(31696002)(53546011)(31686004)(8676002)(8936002)(16526019)(26005)(966005)(2906002)(316002)(66476007)(66556008)(5660300002)(16576012)(52116002)(186003)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	60+qVaoQhS4elcw7sdqGN9YYMZRNPvF+Ekx4fOfbgX48SNt58B9YodHbPRft7gq1WooIzHGbXhE56ZWzsw9pcE3gupNDq4TH5dzN0DVcQ0y9mZy3yaDPtKkL5ClG5tkiTxPOlhZMRHWkgx0+kz4Daxyn0KCYpNzo6bnwKowSxC+jPEBvzn443rLTMz++xtQY+2Z6BNyfDPPXlv5ZzwcDb9ByvMvYen5PCi/nI3nljQMDZt2pjnKpvXNzxT1Z86LNAqIBHaNPj/6HP8BKefWDXINK7B8pcg7C6r8cgTTqhG/S5kPAV+y4Mq21LDGTS42t6pF+rBM/kwzo0E3d1DlB54qfC/IKLRtRAwQoFSdvljpDkUNw6dWcAowMG5kSKjhrDGziNXQWHbZeVcymelVC9iAX+O3gTL2i43z4pCv9NrqCgGodnKm380lEGC9xcyP1jUg9drQfHKvnXtTirPog1LQRD6S3lbT/RQOujUj1ER7/pERLyLNn4XKH4FxYzZZU
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f536826-78f4-44e3-05b7-08d813be373e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 19:31:36.6656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wuyxkKSwoF7WnONEYC87eotFMKeBTVR//uCaYR4KaCSIrBtb3EcBFz6S3UPRN5G+h0CgUsPi/xhIDSTrg0uzYoYyR5ReiBzdNWdnI7sohY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2050
Content-Type: multipart/alternative;
 boundary="------------11431C111B9D4F29E1ECDB40"
Content-Language: en-US

--------------11431C111B9D4F29E1ECDB40
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/20 5:03 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-pexpect.inc                 | 23 -----------------
>   .../python/python3-pexpect_4.8.0.bb           | 25 ++++++++++++++++++-
>   2 files changed, 24 insertions(+), 24 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pexpect.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
> deleted file mode 100644
> index c6230b2b5..000000000
> --- a/meta-python/recipes-devtools/python/python-pexpect.inc
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY = "A Pure Python Expect like Module for Python"
> -HOMEPAGE = "http://pexpect.readthedocs.org/"
> -SECTION = "devel/python"
> -LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
> -
> -SRC_URI += "file://0001-FSM.py-change-shebang-from-python-to-python3.patch"
> -
> -SRC_URI[md5sum] = "153eb25184249d6a85fde9acf4804085"
> -SRC_URI[sha256sum] = "fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c"
> -
> -UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
> -
> -RDEPENDS_${PN} = "\
> -    ${PYTHON_PN}-core \
> -    ${PYTHON_PN}-io \
> -    ${PYTHON_PN}-terminal \
> -    ${PYTHON_PN}-resource \
> -    ${PYTHON_PN}-fcntl \
> -    ${PYTHON_PN}-ptyprocess \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
> index cf39233a3..99e1f199f 100644
> --- a/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
> @@ -1,2 +1,25 @@
> -require python-pexpect.inc
> +SUMMARY = "A Pure Python Expect like Module for Python"
> +HOMEPAGE = "http://pexpect.readthedocs.org/"
> +SECTION = "devel/python"
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
> +
> +SRC_URI += "file://0001-FSM.py-change-shebang-from-python-to-python3.patch"
> +
> +SRC_URI[md5sum] = "153eb25184249d6a85fde9acf4804085"
> +SRC_URI[sha256sum] = "fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c"
> +
>   inherit pypi setuptools3
> +
> +UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-core \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-terminal \
> +    ${PYTHON_PN}-resource \
> +    ${PYTHON_PN}-fcntl \
> +    ${PYTHON_PN}-ptyprocess \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------11431C111B9D4F29E1ECDB40
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/20 5:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200618090358.31927-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200618090358.31927-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-pexpect.inc                 | 23 -----------------
 .../python/python3-pexpect_4.8.0.bb           | 25 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 24 insertions(&#43;), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pexpect.inc

diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
deleted file mode 100644
index c6230b2b5..000000000
--- a/meta-python/recipes-devtools/python/python-pexpect.inc
&#43;&#43;&#43; /dev/null
@@ -1,23 &#43;0,0 @@
-SUMMARY = &quot;A Pure Python Expect like Module for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pexpect.readthedocs.org/">&quot;http://pexpect.readthedocs.org/&quot;</a>
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;ISC&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1c7a725251880af8c6a148181665385b">&quot;file://LICENSE;md5=1c7a725251880af8c6a148181665385b&quot;</a>
-
-SRC_URI &#43;= <a class="moz-txt-link-rfc2396E" href="file://0001-FSM.py-change-shebang-from-python-to-python3.patch">&quot;file://0001-FSM.py-change-shebang-from-python-to-python3.patch&quot;</a>
-
-SRC_URI[md5sum] = &quot;153eb25184249d6a85fde9acf4804085&quot;
-SRC_URI[sha256sum] = &quot;fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c&quot;
-
-UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/pexpect">&quot;https://pypi.python.org/pypi/pexpect&quot;</a>
-
-RDEPENDS_${PN} = &quot;\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-resource \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-ptyprocess \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bbb/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bbindexcf39233a3..99e1f199f100644---a/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb@@-1,2&#43;1,25@@-requirepython-pexpect.inc&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
index cf39233a3..99e1f199f 100644
--- a/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
@@ -1,2 &#43;1,25 @@
-require python-pexpect.inc
&#43;SUMMARY = &quot;</a>A Pure Python Expect like Module for Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pexpect.readthedocs.org/">&quot;http://pexpect.readthedocs.org/&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;ISC&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1c7a725251880af8c6a148181665385b">&quot;file://LICENSE;md5=1c7a725251880af8c6a148181665385b&quot;</a>
&#43;
&#43;SRC_URI &#43;= <a class="moz-txt-link-rfc2396E" href="file://0001-FSM.py-change-shebang-from-python-to-python3.patch">&quot;file://0001-FSM.py-change-shebang-from-python-to-python3.patch&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;153eb25184249d6a85fde9acf4804085&quot;
&#43;SRC_URI[sha256sum] = &quot;fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c&quot;
&#43;
 inherit pypi setuptools3
&#43;
&#43;UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/pexpect">&quot;https://pypi.python.org/pypi/pexpect&quot;</a>
&#43;
&#43;RDEPENDS_${PN} = &quot;\
&#43;    ${PYTHON_PN}-core \
&#43;    ${PYTHON_PN}-io \
&#43;    ${PYTHON_PN}-terminal \
&#43;    ${PYTHON_PN}-resource \
&#43;    ${PYTHON_PN}-fcntl \
&#43;    ${PYTHON_PN}-ptyprocess \
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

--------------11431C111B9D4F29E1ECDB40--
