Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.52])
 by mx.groups.io with SMTP id smtpd.web10.7118.1592399265249658380
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IiUr1tbi;
 spf=pass (domain: windriver.com, ip: 40.107.77.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jj7YbEqYq7RwJ0iCdwLNnXgC5vXEHXt3QTl5sd6j28TDsFsWVnUaLp5+IqRksYmci7Zr4MuLGp5tQrN7CApJCZqzWmRRARouQf5S0A4xj2UVQv4qolah1U/R8xUsg2le0CY4vpfN2TAwQMR3OTorrBnlsp7ucByTPqNvloQkPISaYcSL7hEQ6Wdmv7x6js2JsMACEAcqtOC+MzGmYxHUGIepgPys/hgcNbbpBXxaKVgWDBYVcNPGC/Gb4rh9INb6v9bruLEys0qGm0q/D8euAOQaopkVRfuty0nlzJUqfT64co3CQoDbCHOuT5NYPPgG8HKPXWo4urVWteQLAZ9/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTm5U9JUJ/cReiPoPpYoU4zqjPkvz+ZXX20kbu1tgYQ=;
 b=UWkpVltd4FGmugrLUvSHvRH5tpNoZo0IQUlvXtxbU6FKwTLUTwfD1IaZHPCEse9nIpPxfvQccqCdlpMhu4cPEJeOowUixa8Y9CVw3bjm76KogyBnL8JlMI+QPbtvWOyp/+L3QOYXW2Mg8dUkB2sluZ7Xwl/Z3EcKG+U27tmvIbp6/OOJ2n2UI70RizzBEz989JVyNBNZaJRgZZRHDFUIhZuJpKs4YZd+o7O/hoB9/lKAv7I8BW/+jmGcU9bP5UfXRGyQ3B69YLxm7BAdeqOMajxhouuBxqCySk8ovwihNbZjiaGgP43PUo1Ox0AXq572HCPoHIYq6VMrmBio5UHOtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTm5U9JUJ/cReiPoPpYoU4zqjPkvz+ZXX20kbu1tgYQ=;
 b=IiUr1tbi8h12G/XqZ5VJINUTNAkST5ljRhOn2zOWRZZzdTR4+rrXUnWsDBdKU/MV9fmXNHyDtab1OSwK9oFCirn8oFrmB1SAScEkBvKRocdcJedePZmem43/YJCi8YUaIvL5CJ4Z7QSie3sfbQ8IvEYYlPbdAvoQqm64SKOyka8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3875.namprd11.prod.outlook.com (2603:10b6:405:80::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Wed, 17 Jun
 2020 13:07:43 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:07:43 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-isodate: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615103017.2714-1-leon.anavi@konsulko.com>
 <20200615103017.2714-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <29fd21a4-f4a7-b425-6e3c-b4b7b49f9024@windriver.com>
Date: Wed, 17 Jun 2020 09:07:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615103017.2714-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::22) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 13:07:43 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09525339-b51e-44d7-b819-08d812bf6c0a
X-MS-TrafficTypeDiagnostic: BN6PR11MB3875:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3875DB950546CFAB757A65F49F9A0@BN6PR11MB3875.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VUu+xeZadpzSRyS7e19Q0KYieyNrmUITObg3l6y9hBIYlH5mioohyHXbEz4lyQrEWKJHadvOdLwSHyXOYOnWUdNo1ZdJjxFcdo9H17AUILnPlBI50iCPwvB1PlUosmAfWtv82mununxo+7hjUCEd7y6Vqek3pfrAD0EHsQDSHka8M7vHB54PxqeM1ivVG9de5AIid+41xWYi9dKMcggfbPMieP5vllJod/r6MAPFWyK7tRDosZwcTnM5xCykf4ciRaim0VNmlXaVec4ZgHnAKmRD7rysZCRck1RvBLyd21qrakcUQH1BzWE41LaLvLHcVmNuLotYTKj7v2Zz0hjq6jsMhT+0/PyVVS/z3gRQ7+43+n/lC0IGZDiuA9DADoXJZ3wxZRkYAzbyOUvmzRXLEPiX45ZY3tIKN2IigVgWgS8rX4kzXt+mQFLKLX6Gy6YXKe48Vp75Ogx4P3v0gfO/sQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39840400004)(136003)(396003)(366004)(376002)(346002)(83380400001)(2906002)(966005)(36756003)(44832011)(31686004)(2616005)(956004)(5660300002)(52116002)(66946007)(31696002)(16526019)(186003)(316002)(53546011)(66476007)(166002)(6486002)(478600001)(8676002)(16576012)(26005)(8936002)(66556008)(33964004)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	q2LBQxVRae0ika7Pst8b81ZC/wLtkqsvsTJTQMZ9Y1cWc0O7Wm4uYrTUUMN1CcSJF6nMgTvvMElZHQ4VOPbieu1DnL2k1ftGwzZLv9IwUznByVPT6fGrysjFzGy2h64Sbhl3ifJ5y7/JjhePLHtiRiqMwmyPSHhP2tRS2svgBBO10L0dssJPkzAqjcYudNpRLGe5gsElyUJanTkhqkiQQR+pN3sXhxyrfjBU0c7o9pfEFxQ8/l57/glgZLKNSipXl4KmkGg8jzvbX7nbkQVvxne0cZwdOlmKnJEeNShzK8MhY21Vxi6nY7jCLZiHM5LCBSxE0S9VOnDAWJMNj0rquioF5M4Zleo5QA7zXuZEBI9HfqLtTzxasNYEFV2wPd+OPR02qi3YWiD629hrOkEoGtiNb2LdaT/91w5PmE7Zv4u7wG8Sl2/8DqAywzH1PtFQr9uOCQrsw1XqUDCV/vG4suZX6Weyb/kEnpb0zqBul9M=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09525339-b51e-44d7-b819-08d812bf6c0a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:07:43.6060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEfMx+/02hDm1LtXEskaVbg3tNuXpenUUN8QOwaVQttsTLQa3Uvbz5xL2qWRzvlbdUXXIUpPJ26rHNtcdGoldiV6DM8ub8/OTMlV5fl3ekg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3875
Content-Type: multipart/alternative;
 boundary="------------481D1CAB5902306180DA4388"
Content-Language: en-US

--------------481D1CAB5902306180DA4388
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 6:30 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-isodate.inc   | 14 --------------
>   .../python/python3-isodate_0.6.0.bb              | 16 ++++++++++++++--
>   2 files changed, 14 insertions(+), 16 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-isodate.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-isodate.inc b/meta-python/recipes-devtools/python/python-isodate.inc
> deleted file mode 100644
> index 8c128919e..000000000
> --- a/meta-python/recipes-devtools/python/python-isodate.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "ISO 8601 date/time parser"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
> -
> -SRC_URI[md5sum] = "0e1203fce27ce65e2d01c5f21c4d428f"
> -SRC_URI[sha256sum] = "2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-six \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb b/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
> index 0e79ae995..2aa64d08d 100644
> --- a/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
> @@ -1,2 +1,14 @@
> -inherit setuptools3
> -require python-isodate.inc
> +SUMMARY = "ISO 8601 date/time parser"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
> +
> +SRC_URI[md5sum] = "0e1203fce27ce65e2d01c5f21c4d428f"
> +SRC_URI[sha256sum] = "2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-six \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------481D1CAB5902306180DA4388
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
    <blockquote type="cite" cite="mid:20200615103017.2714-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200615103017.2714-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-isodate.inc   | 14 --------------
 .../python/python3-isodate_0.6.0.bb              | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 14 insertions(&#43;), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-isodate.inc

diff --git a/meta-python/recipes-devtools/python/python-isodate.inc b/meta-python/recipes-devtools/python/python-isodate.inc
deleted file mode 100644
index 8c128919e..000000000
--- a/meta-python/recipes-devtools/python/python-isodate.inc
&#43;&#43;&#43; /dev/null
@@ -1,14 &#43;0,0 @@
-SUMMARY = &quot;ISO 8601 date/time parser&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709">&quot;file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709&quot;</a>
-
-SRC_URI[md5sum] = &quot;0e1203fce27ce65e2d01c5f21c4d428f&quot;
-SRC_URI[sha256sum] = &quot;2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-six \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bbb/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bbindex0e79ae995..2aa64d08d100644---a/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb@@-1,2&#43;1,14@@-inheritsetuptools3-requirepython-isodate.inc&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb b/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
index 0e79ae995..2aa64d08d 100644
--- a/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
@@ -1,2 &#43;1,14 @@
-inherit setuptools3
-require python-isodate.inc
&#43;SUMMARY = &quot;</a>ISO 8601 date/time parser&quot;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709">&quot;file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;0e1203fce27ce65e2d01c5f21c4d428f&quot;
&#43;SRC_URI[sha256sum] = &quot;2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-six \
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

--------------481D1CAB5902306180DA4388--
