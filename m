Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.54])
 by mx.groups.io with SMTP id smtpd.web11.15228.1593523458266864967
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 06:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hj3nqbtM;
 spf=pass (domain: windriver.com, ip: 40.107.244.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNMfj0KXbBhVn6vxM7NyG5IqsryWQBlAGn31knFzIoGB+uq9xy0l9WHtE5gsAVgm3z275Z5L7k0tQu01Ah1GAPanAGjBqtXgpM3v/JBQkXuocJv1OkdzpkFfyoGUcbDOLElF1hhDNxLfkkv+YU81Uzp1aD7mEm0jsBhybr/kRoVfkAA+X8L06rY8Srgw+nVzTzltfw7qZ9FTZ1QsB+ievO0tBOLAQsNXFDU3FXlclSUrpM5XhRbd97WQxZYLj9kryxGwNtbT6pjNa5/4adTrWAsGTOGZbZPv2L4uKpCwvPt2cA+Z0QetMin5Q/sXHM3LdXR1rMCyVeEI205V9WXHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7uAsrbj19DaxeiJhx5TWdvfYfNAvJkw/EZPQx2HsDU=;
 b=Q43dpmaeJasXDmrHM+bnCJ0va3SkkfYvTFuaep2c6uOHA6HfyksUH/H6jC+YDM86bn0dcmPN+O2VkeVqkT1RyGXHbtAg/WeLuPnJFq6JzaE+B8CJmsqLH9UAoUcvM45Tr10dlBWxiFXJzVRoo1QOKdQh9+OMGaiX6uVurxACRBOFT1HJBLJBQgCqNEbR1angQ7BRowol32QSBwzIeiu7pVKZrOepGO1KHzkARiO2V6jAdeTbr6iaL7mhs8+XakzsIsznOSJloOK3hEiev/uOb3yqu8vq+wFqYJ2wK0JP+O9ciVUkFz5YVMykcHMR7UU+x1X7BS2Z6lIkSZbL67m57w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7uAsrbj19DaxeiJhx5TWdvfYfNAvJkw/EZPQx2HsDU=;
 b=hj3nqbtM5GKLwnrcdYHLq8mItIfNe/ViQqUFU8cWaNIJ48GPnVsNq3vLDSI2uquiMYcxmnqXU1OnLlb8Gu58PtEliFFtqLl9lBCovF2coxIwFyJf9wP7vzH54PRzbzaXMd9+kUA1eSCIN2ctJzycPdHQxxlXF4umBNiqhT0nxhM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1686.namprd11.prod.outlook.com (2603:10b6:903:30::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 13:24:17 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 13:24:17 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-pywbem: Upgrade 0.15.0 -> 0.17.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
 <20200629121233.27026-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <94c5fdd3-5c99-d9d7-5c2e-b5a0c8f3627f@windriver.com>
Date: Tue, 30 Jun 2020 09:24:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629121233.27026-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 13:24:16 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd19b9e9-3e9f-45da-8aca-08d81cf8e3b6
X-MS-TrafficTypeDiagnostic: CY4PR11MB1686:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB168632A8396F79B571B9153F9F6F0@CY4PR11MB1686.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7l3pc0+AurF6yoAzqi7pxuzWSNrtQYHUd7Gjuaefji4q86JmHvsz62jfVoYvJm4LKBLpKYgPXwXp9RqXm/L5f1AKo/zBdIK1eoSONI7+YZQIufN879/seWXE7vGmtvz/BtAM21KHAmgUkFEqNuzxFUIicFAbkXj+NhP80VPV2H4TIvAsKlHtTSZCMcCxH0iYf7LmZqJz2/XZtY9OHCJCKQWEmRnm2q+v/OzTIe24wumjcSB97uLjBMa/WuggxZMzq5jff0DOtH4XI7O9eRsbAbCg22avgd3aqnZrVHappDER/m3FNFxfQsSvNTQ3Pf6CtxRiS9EwqHJ0zAk14LGn4Bo9Fd5ox43oeFkBMeZHr7m82B6oZuNawanynx2FHvsT7IB5bG71tEfd2OJoYhUv3z0J+OrPV4YKtlirxOz7A4M2cbvJfnwtYgZt7MFL0rxrBLc5eTwhJdb5SuFE64BWFQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39850400004)(346002)(136003)(376002)(83080400001)(53546011)(31686004)(8936002)(2906002)(8676002)(966005)(44832011)(16526019)(36756003)(83380400001)(2616005)(956004)(86362001)(26005)(31696002)(33964004)(186003)(478600001)(316002)(5660300002)(52116002)(6486002)(66946007)(16576012)(66556008)(66476007)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Wsoia0TL7PUhqC4xtMnMMzEA3/pjbhIqO9FwvrNB4sSmvI9LWPYZqbhrtpLabB59Bo2yHFucVmx6ol+RKKNvW32LDTjzpfkcP1YHEJmisDR8xINFzXAWJrneWtJI5jbmlCTKB+YRuyZ8pKFwF3XrmatW85nAjNWHcZLG2C3joLJP7ipoI31JDELd4UFyyTwkJSfeb380JeO3MGoCtRqIfK01EClBiWYKx8c8O1cvJcjbWmM8TOMDIDAhz0v9/xZVm2D1SPcjxIXq+YSfahQ1ls+WmrctuR8BscYF2vV0/Z1oXiBuB9LmVPaIzgvi5oL2F7+Klexe7l2Ww0Vf3hBZGznwRjoWLweUhZlmzEvA5NXwkEf3dcrL8wm/FsvGs3AKg13NRJvfYH7Nc4Bq67beel50F1AxnzFZUDRXkRy2hF107HcjD/Za32/UmBWTQAm91xUTRMOOKOo8vudnyDctt1oO0yH/xHETn766oNvNAqnT46h1Foypssld5y64QdOp
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd19b9e9-3e9f-45da-8aca-08d81cf8e3b6
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 13:24:17.2482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zBddRoTpvaPFosxgtLRlU5SbRaNItkPZEVyaORpQpLvjjKr9Pms9lDunAcm1xMgP6JMVMQ/O9/rslB69w1BozggtcJW/XKPqjtAu2kA0Hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1686
Content-Type: multipart/alternative;
 boundary="------------3E1570DF4968FB3A54086FE0"
Content-Language: en-US

--------------3E1570DF4968FB3A54086FE0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/29/20 8:12 AM, Leon Anavi wrote:
> Upgrade to release 0.17.2:
>
> - Test: Fixed virtualenv related failures during install test.
> - Dev: Increased the versions of the base packages ‘pip’,
>    ‘setuptools’ and ‘wheel’ to the content of Ubuntu 18.04 as
>    a minimum, and to the lowest versions that support a particular
>    Python versions beyond that. This only affects development of
>    pywbem.
> - Setup: Added the scripts for installing OS-level dependencies
>    (pywbem_os_setup.sh/.bat) to the source distribution archive.
>    Note that starting with the upcoming pywbem 1.0.0, these scripts
>    are no longer needed, so this change will not be rolled forward
>    into 1.0.0.
> - Increased the version of ‘PyYAML’ from 5.1 to 5.3 on Python 2.7,
>    to pick up a fix for dealing with Unicode characters above U+FFFF
>    in narrow Python builds. This could not be fixed for Python 2.6
>    since PyYAML 3.12 dropped support for Python 2.6
> - Fixed raise error for invalid reference_direction in
>    WBEMServer.get_central_instances().
> - Fixed raise error for missing ports in WBEMListener.__init__().
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pywbem_0.15.0.bb => python3-pywbem_0.17.2.bb} | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>   rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.15.0.bb => python3-pywbem_0.17.2.bb} (91%)
>
> diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
> similarity index 91%
> rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
> rename to meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
> index cbb55b8f7..ce63822b4 100644
> --- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
> +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
> @@ -16,12 +16,10 @@ HOMEPAGE = "http://pywbem.github.io"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
>   
> -inherit pypi setuptools3 update-alternatives
> -
> -SRCREV = "b3386b3bee8876d15f0745147c0b08937d8ab18e"
> -PYPI_SRC_URI = "git://github.com/pywbem/pywbem;protocol=https;branch=stable_0.15"
> +SRC_URI[md5sum] = "6100157c720ba272895b3f79a05c8dc3"
> +SRC_URI[sha256sum] = "84dac33f77d5ff2c3d8eb42fc7de2ffb6d33f5e4954ef89db0dbf3fe646a2809"
>   
> -S = "${WORKDIR}/git"
> +inherit pypi setuptools3 update-alternatives
>   
>   DEPENDS += " \
>       ${PYTHON_PN}-ply-native \
>
> 

--------------3E1570DF4968FB3A54086FE0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629121233.27026-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.17.2:

- Test: Fixed virtualenv related failures during install test.
- Dev: Increased the versions of the base packages ‘pip’,
  ‘setuptools’ and ‘wheel’ to the content of Ubuntu 18.04 as
  a minimum, and to the lowest versions that support a particular
  Python versions beyond that. This only affects development of
  pywbem.
- Setup: Added the scripts for installing OS-level dependencies
  (pywbem_os_setup.sh/.bat) to the source distribution archive.
  Note that starting with the upcoming pywbem 1.0.0, these scripts
  are no longer needed, so this change will not be rolled forward
  into 1.0.0.
- Increased the version of ‘PyYAML’ from 5.1 to 5.3 on Python 2.7,
  to pick up a fix for dealing with Unicode characters above U&#43;FFFF
  in narrow Python builds. This could not be fixed for Python 2.6
  since PyYAML 3.12 dropped support for Python 2.6
- Fixed raise error for invalid reference_direction in
  WBEMServer.get_central_instances().
- Fixed raise error for missing ports in WBEMListener.__init__().

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629121233.27026-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pywbem_0.15.0.bb =&gt; python3-pywbem_0.17.2.bb} | 8 &#43;&#43;&#43;-----
 1 file changed, 3 insertions(&#43;), 5 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.15.0.bb =&gt; python3-pywbem_0.17.2.bb} (91%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
similarity index 91%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
index cbb55b8f7..ce63822b4 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
&#43;&#43;&#43; b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
@@ -16,12 &#43;16,10 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pywbem.github.io">&quot;http://pywbem.github.io&quot;</a>
 LICENSE = &quot;LGPLv2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24">&quot;file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24&quot;</a>
 
-inherit pypi setuptools3 update-alternatives
-
-SRCREV = &quot;b3386b3bee8876d15f0745147c0b08937d8ab18e&quot;
-PYPI_SRC_URI = &quot;git://github.com/pywbem/pywbem;protocol=https;branch=stable_0.15&quot;
&#43;SRC_URI[md5sum] = &quot;6100157c720ba272895b3f79a05c8dc3&quot;
&#43;SRC_URI[sha256sum] = &quot;84dac33f77d5ff2c3d8eb42fc7de2ffb6d33f5e4954ef89db0dbf3fe646a2809&quot;
 
-S = &quot;${WORKDIR}/git&quot;
&#43;inherit pypi setuptools3 update-alternatives
 
 DEPENDS &#43;= &quot; \
     ${PYTHON_PN}-ply-native \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3E1570DF4968FB3A54086FE0--
