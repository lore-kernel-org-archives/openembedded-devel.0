Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.74])
 by mx.groups.io with SMTP id smtpd.web12.10978.1593785184739119428
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BMyClzCL;
 spf=pass (domain: windriver.com, ip: 40.107.68.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVIWrEwDbvbvaH6eCO6txwBPuQ7juODFccPuQM3Dt1MgrsfqHReqUGRZfQsbJcqB9ZstN72MEBP+XhT6HqrhIvqsxMfv2meBCAyIbNI13ZlChusnPOiaDLschvl/c6WG3ScJaWgbEOAD5MGHTGNcuR+oWSpCYp3epsxOXlpNwwKi51Fh9dZ1OUSoW/HlR9IayV3egwWOxWIUzpTjwSDD9xixFIcU4YE3jsGVTMPY3syOChV3zEWburb9NHhZEARYEmnqoNV6NUgBZuHOjLOXBS2CrHWa+VASwpAd/QW2JlGXObKx+W3aiXuTADP/GdnhBtQ4ni16O11kK86ulRD9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/W4gL55RzCuTx8rAV1S1593sutGiztjZMlYkL06Crg=;
 b=e1j11v1VcOPLTPBuUdOnlZdZvLzGDaCtnaF32836w8AJrFF0G+VHss20AEzumUt1qMYoFvpcPVPyukPaUxyIr+LuM0sh9Wmsz3CmwxxJZKXjcxL/9YzCuYZSLjNVrtzd6YHAkX0rk/ev9ETblXM9MOto5e/CCR1q/26GgVXmRkroFSsHivTfnWkWduSmS7WQOKUlQ61mj5aD8YR1WWORo7ImfbYQX6fCd9zF8dp0PdUsKjNtyTtZEma0JLK1DF7vGiOfhZqGU5jO5fbAAAqH2KXXbQKEY5jWkLbMHUB6iPC8aUG4w32/3v9UEGG1tU7umTw6UsfpseqAU2UnyIZncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/W4gL55RzCuTx8rAV1S1593sutGiztjZMlYkL06Crg=;
 b=BMyClzCLLXnUNZSKyTlbSKFjAPF1FB91XknM5dkaC8tNuvdUgFdQLVf5oi7OMJcWfC41TsjGmG/EhRBSglT4OyDbK3Zoo9jiSuL0XFTvwcbsHMwrF9rlo9ZEtKh2XA21bj2AL+DMzABfwWqYGqRpux+B1JfgOOvhuKonGIL0Dwk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4300.namprd11.prod.outlook.com (2603:10b6:5:1dc::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.22; Fri, 3 Jul 2020 14:06:23 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:06:23 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-h2: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
 <20200630171119.25540-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e315f761-f78b-9996-4fda-e064cb958e4f@windriver.com>
Date: Fri, 3 Jul 2020 10:06:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200630171119.25540-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::13) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Fri, 3 Jul 2020 14:06:22 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c04e5db-c4e9-493e-e10d-08d81f5a449b
X-MS-TrafficTypeDiagnostic: DM6PR11MB4300:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4300F95929E83871985E326A9F6A0@DM6PR11MB4300.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PmABhzUo6P3eK+kzTY4/f8XGNpmOreWnU1MVdQ0cBxlFED9ZLyA9ROjSrVvmTmtEyjyaKlntuPqFF6kQJJJZ9g/fn9lKaYu682PsSnsyUacytKU/nBRNfedL1Flzf3VC9FKgVVm4rsR1kHI3jO+rDJVT9mEHhWP4dabZuG9tr5vYedgGnjNaszbIwIEPID+XANYDAKE6186WjjErknK1Vyilfnf5q5GckuUF00Xjyvw4OMeMzUY3ARav44R4X7aujdC/ntMlv7MBjgnYDUNZlEHWvbr1lNQp/HbSe7DZ7XBJho8OiXhHDIdtfFdvLylBxUPsomIogGpZDUTFe2JAnBkIbBo+UUz8AYrt4T4R1A/fitjxwNN11uTlbFD++XQhOJPNDYAz2zSN4lshhmhu+TeIeOSiIvJJ+1g3gmIlfTIxt1skv2CyFKkpsGlpYE6OphJn1XAanssWMVKdkF9dMg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(396003)(376002)(136003)(39850400004)(31696002)(66476007)(66556008)(66946007)(16576012)(6486002)(2616005)(478600001)(166002)(86362001)(966005)(16526019)(956004)(5660300002)(44832011)(8676002)(2906002)(186003)(26005)(31686004)(316002)(8936002)(53546011)(52116002)(36756003)(33964004)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kpfPeiBHGjLqkhUPerr017KyfyQ5FoxbiM23EDP3V3UA7eTXq6FLM94nFBWwwr2mPRtaFVdFQL2B4luejNSc/j2s/02FGyI6CcCjm+vYyQPGKQN2T/wORAE2SfW2hgB3VP1GObIK3KRMiaU0LgA9q4A67B+uFH/uf6B9tdUCh3Gkk52dDtiS4DBMth5JHijmx+fF1E1DN+zr1rgmzbq+mHUJFHAYf3hmlHIFti5t4Um5kejETBKmGJIbjAPt47OOp27ZXK5UDW2Zatkgz2HsiLthMaK190Ppo0e1F85ecsUTzyXBkuoOW4Xc73qH+A0v8ZJwatcwclD/Dd0baFcCCREK6nEfxCGjpGxVAl+bWg6/S8FNBVLBGFZY9PN6MQeGDvsDcnEpig8tbJxadvGWiyXMkEKsaBypDTNYSN4HA6MpCsL+kJsDxRB0RAhk/UEW6ZStubikjJkk4abjHa5G3BvgEw52I/oC/YiV/GjMUINN/JzAAl5Y+NGlbQ+1SKLR
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c04e5db-c4e9-493e-e10d-08d81f5a449b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:06:23.4437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D57uk38i7MY/kN3ybOgfdcq2w1EOFwVGDYkTA3L1TTXI/PMBpye4uFwuGHJO9kuqhnwceE82dXpXpoCoi8CvQ6NJGLERwtqTJTbiEojBQk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4300
Content-Type: multipart/alternative;
 boundary="------------DCB6B14999E6D5F1113983A9"
Content-Language: en-US

--------------DCB6B14999E6D5F1113983A9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/20 1:11 PM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-connectivity/python-h2/python-h2.inc    | 12 ------------
>   .../python-h2/python3-h2_3.1.1.bb                   | 13 +++++++++++--
>   2 files changed, 11 insertions(+), 14 deletions(-)
>   delete mode 100644 meta-python/recipes-connectivity/python-h2/python-h2.inc
>
> diff --git a/meta-python/recipes-connectivity/python-h2/python-h2.inc b/meta-python/recipes-connectivity/python-h2/python-h2.inc
> deleted file mode 100644
> index c457836b7..000000000
> --- a/meta-python/recipes-connectivity/python-h2/python-h2.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DESCRIPTION = "HTTP/2 State-Machine based protocol implementation"
> -HOMEPAGE = "https://github.com/python-hyper/hyper-h2"
> -LICENSE = "MIT"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
> -
> -SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
> -SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-hpack ${PYTHON_PN}-hyperframe"
> diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
> index 7230a27e8..5d9a65530 100644
> --- a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
> +++ b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
> @@ -1,3 +1,12 @@
> -require python-h2.inc
> +DESCRIPTION = "HTTP/2 State-Machine based protocol implementation"
> +HOMEPAGE = "https://github.com/python-hyper/hyper-h2"
> +LICENSE = "MIT"
>   
> -inherit setuptools3
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
> +
> +SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
> +SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-hpack ${PYTHON_PN}-hyperframe"
>
> 

--------------DCB6B14999E6D5F1113983A9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/30/20 1:11 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200630171119.25540-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200630171119.25540-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-connectivity/python-h2/python-h2.inc    | 12 ------------
 .../python-h2/python3-h2_3.1.1.bb                   | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 11 insertions(&#43;), 14 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-h2/python-h2.inc

diff --git a/meta-python/recipes-connectivity/python-h2/python-h2.inc b/meta-python/recipes-connectivity/python-h2/python-h2.inc
deleted file mode 100644
index c457836b7..000000000
--- a/meta-python/recipes-connectivity/python-h2/python-h2.inc
&#43;&#43;&#43; /dev/null
@@ -1,12 &#43;0,0 @@
-DESCRIPTION = &quot;HTTP/2 State-Machine based protocol implementation&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/hyper-h2">&quot;https://github.com/python-hyper/hyper-h2&quot;</a>
-LICENSE = &quot;MIT&quot;
-
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851">&quot;file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851&quot;</a>
-
-SRC_URI[md5sum] = &quot;950b5a62a2a608dc4547a01edf99aa8f&quot;
-SRC_URI[sha256sum] = &quot;b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-hpack ${PYTHON_PN}-hyperframe<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bbb/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bbindex7230a27e8..5d9a65530100644---a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb&#43;&#43;&#43;b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb@@-1,3&#43;1,12@@-requirepython-h2.inc&#43;DESCRIPTION=">&quot;
diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
index 7230a27e8..5d9a65530 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
&#43;&#43;&#43; b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
@@ -1,3 &#43;1,12 @@
-require python-h2.inc
&#43;DESCRIPTION = &quot;</a>HTTP/2 State-Machine based protocol implementation&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/hyper-h2">&quot;https://github.com/python-hyper/hyper-h2&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
 
-inherit setuptools3
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851">&quot;file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;950b5a62a2a608dc4547a01edf99aa8f&quot;
&#43;SRC_URI[sha256sum] = &quot;b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-hpack ${PYTHON_PN}-hyperframe&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DCB6B14999E6D5F1113983A9--
