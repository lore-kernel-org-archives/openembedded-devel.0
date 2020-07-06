Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.71])
 by mx.groups.io with SMTP id smtpd.web10.60502.1594050078320761601
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HyZFKKGs;
 spf=pass (domain: windriver.com, ip: 40.107.75.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBC9Ui8EOXV8TWlMegkmgSmj7m952P1VWgQsm9BkybtLOSR83tfEfHMXRcRZ5v97deBDGpu8zjEQRaeA/Cj3L+oHz639vcK6Ny1CirDPmIJ6vXXGLT6ziU0nhxzjTZdg4efoXhbCo8i24FxK71J6numiGZB86/gf4KbySN4CLffE/1yP2WzPZuBiLcRu1yrMJjf1tcpW2XBpS97Tetz1Fos8/zZEa6rFYeSridUzJXZ/TnRaAKwvXeQgQ40qnybO837caYITcm2eD+tOJ/DlelvrCcTnOK1LX/UmGbFfw1ei5QjLByeRSbF+qoy1+tGcXOx+kbX//VL0EQtrcm6jtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUGBSbtPYKfv5xie9Fj+1upEensgxT1qHZ5F7kyk078=;
 b=HC/othNrh68RWDGn7ir73LTZoomxHmKGslrBs05kLh3M4nrNpaDGq3uE2a9oGlIT2IkhLjbDe8ucVzTUJDNnFh6XtOqpbAGt3YZ9td8E2a2GJ09EcH8wglMYlo9cu68uxWMQPrjtfA3okq5n5L5fzlsSR2SoTfVNYx9fLvBuXChPWzianwh59eji9JBCgOPWznZvzL5GRDf3NdsbzcyOKBlVFyNNLmkxgtWIT1JC/k9zS5wit8fOKOyYygqUBsCb4520/meVK3aDtSK6zEmwXCHXWHzoUK9i9tSDsLbNhF3yhyEls16F/qV/1EuSa5N1i2HVyQhCxjgXFlKduYrEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUGBSbtPYKfv5xie9Fj+1upEensgxT1qHZ5F7kyk078=;
 b=HyZFKKGsrL3FkVoJ5kKeJEDC5Ix2CqXsoHURK1rNvzrwG7p8p/4suTEapDLH8Yup1ldoPyyGIHiZoCbPzg6lAg9zWs3iYlgXW1fdqz3i6eOLqqxe5uTCmVBTA1vGlram1IFLOVK61VqSDGjbUoAEoWiC4UNFgX9e/ri0e9eBgNM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2827.namprd11.prod.outlook.com (2603:10b6:5:c8::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.20; Mon, 6 Jul 2020 15:41:16 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:41:16 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-pyhamcrest: Upgrade 1.9.0 -> 2.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200701142243.1686-1-leon.anavi@konsulko.com>
 <20200701142243.1686-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <31e4714c-7626-6bd1-aa7e-6eb36198be6d@windriver.com>
Date: Mon, 6 Jul 2020 11:41:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200701142243.1686-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::27) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0148.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Mon, 6 Jul 2020 15:41:16 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54777af6-de88-4e2b-e767-08d821c3053c
X-MS-TrafficTypeDiagnostic: DM6PR11MB2827:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2827D7401240B54810A9DBE39F690@DM6PR11MB2827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t34vUamLDbRJTgCFUyUMfQVlKEzlpFad5wWdYW+hLxdCbT60w1Rx4Ic+Idg9xL6f73O5HFfSGDU0mxfvLseaX95Vc5sWXp32HFp2I1mMoT1vulufLeHRj9A1iUoReDk/hFBWP0B/sK5zfgQsnyGjl5YitTZARBQbi83tvXLRsEuQeRK82zcmmhA39kEHQyB4vSLcZ7A72t12ES/2jWMg3y4oHpU1I0dEYvJNDdRYZLYSy1knDgeHKI9gjFlyp4Xe5XbsYD2u42kCp/v1Xd8ndDOJ6H7TRfmj9LoRPxiJwUcrxgWLM+sXQiIeQVDVV0eOitAc28aFPjwZQQJ0xpeFAFUQZRJ6sve2+7m7zJPMby1oT+u/46cKZ5h+2GGI+ZVo2dVNNbaA4laIV2fVIavf4kTXoSKEpA+jgySJfO6bqV4kL1+PUaToLXxXVsX7f98qc3JhRVmX8U30aRquUaZkSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(39850400004)(366004)(396003)(376002)(136003)(8676002)(66476007)(66946007)(66556008)(966005)(44832011)(478600001)(956004)(2616005)(16526019)(26005)(5660300002)(2906002)(53546011)(31686004)(186003)(52116002)(316002)(8936002)(33964004)(166002)(83380400001)(31696002)(36756003)(86362001)(6486002)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	f2idR2OcuS8ZljFzB/PKsyWNgzyRtqAT80PV2PMKBg6f2TfMQzcPclgBKHih9j8yJQc7BDrmjI0rO8BJNwmDgMi9isPIT+lDRswHhgRFvUQZafrjHQK1X9k63BXP0sItupu/7Gsj7HyIoAopmVhw3ydTdtgkhAUCJXC6NaJw3SOFul3A2ZE38IkdjYzwO8jsZuxKNCngM3NncXy/tbKeVZ9K7ILHc6IrEtortCIKFcTDu29rD5XLbXmH/SfWhgpkkaNBF4SLB3VUlPzBJHBi7zJ9dSvWCYEg65O+ATkscWCL2GS2gIQPNQmOyuG3iPJQKro1dfwaxybgIjX3Vjz2e1zK3vMLZt4tipm97ClRVZZnJqWLI6DPf7kwFE25ginXUGunMGZxYrmT33xIDXnDNbTMlkAQ1vPQPkoUyfhflTZyLSJhyqaup8NJ7yAqIh25KWnqJvp96F+yfSA6QHvR2TxWX7V1k9DKhPBYXk4313s=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54777af6-de88-4e2b-e767-08d821c3053c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:41:16.9228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TMQF0LshjuRcBUBAwv0DNRg38cruvJ01wm/CWLuST/VK7S6TwHYckpebGDSs7xeX2gtx3sKXXRWidozHN+u2Nzqz/frGWqkBokj3SouhQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2827
Content-Type: multipart/alternative;
 boundary="------------E7FB49C495C6BFB11871B4FA"
Content-Language: en-US

--------------E7FB49C495C6BFB11871B4FA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/1/20 10:22 AM, Leon Anavi wrote:
> Upgrade to release 2.0.2:
>
> - Various type hint bug fixes.
> - Make hamcrest package PEP 561 compatible, i.e. supply type hints
>    for external use.
> - Drop formal support for 2.x
> - Drop formal support for 3.x < 3.5
> - Fix raises() grows support for additional matchers on exception
>    object.
> - Made has_properties() report all mismatches, not just the first.
> - Silence warnings.
> - Type fixes.
> - Remove obsolete dependencies.
>
> The year in LICENSE.txt has been updated and the LIC_FILES_CHKSUM
> changed. The license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pyhamcrest_1.9.0.bb              | 12 ------------
>   .../python/python3-pyhamcrest_2.0.2.bb              | 13 +++++++++++++
>   2 files changed, 13 insertions(+), 12 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
> deleted file mode 100644
> index ee96a079a..000000000
> --- a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY = "Hamcrest framework for matcher objects"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6df1318c6071dd1707f5e3b6c11f24f"
> -
> -PYPI_PACKAGE = "PyHamcrest"
> -
> -SRC_URI[md5sum] = "8b833a3fa30197455df79424f30c8c3f"
> -SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-six"
> diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb
> new file mode 100644
> index 000000000..59d9b5e8b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "Hamcrest framework for matcher objects"
> +HOMEPAGE = "https://github.com/hamcrest/PyHamcrest"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=79391bf1501c898472d043f36e960612"
> +
> +PYPI_PACKAGE = "PyHamcrest"
> +
> +SRC_URI[md5sum] = "7a086f0b067f8d38958ec32f054559b4"
> +SRC_URI[sha256sum] = "412e00137858f04bde0729913874a48485665f2d36fe9ee449f26be864af9316"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-six"
>
> 

--------------E7FB49C495C6BFB11871B4FA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/1/20 10:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200701142243.1686-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.0.2:

- Various type hint bug fixes.
- Make hamcrest package PEP 561 compatible, i.e. supply type hints
  for external use.
- Drop formal support for 2.x
- Drop formal support for 3.x &lt; 3.5
- Fix raises() grows support for additional matchers on exception
  object.
- Made has_properties() report all mismatches, not just the first.
- Silence warnings.
- Type fixes.
- Remove obsolete dependencies.

The year in LICENSE.txt has been updated and the LIC_FILES_CHKSUM
changed. The license remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200701142243.1686-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pyhamcrest_1.9.0.bb              | 12 ------------
 .../python/python3-pyhamcrest_2.0.2.bb              | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 13 insertions(&#43;), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
deleted file mode 100644
index ee96a079a..000000000
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
&#43;&#43;&#43; /dev/null
@@ -1,12 &#43;0,0 @@
-SUMMARY = &quot;Hamcrest framework for matcher objects&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=f6df1318c6071dd1707f5e3b6c11f24f">&quot;file://LICENSE.txt;md5=f6df1318c6071dd1707f5e3b6c11f24f&quot;</a>
-
-PYPI_PACKAGE = &quot;PyHamcrest&quot;
-
-SRC_URI[md5sum] = &quot;8b833a3fa30197455df79424f30c8c3f&quot;
-SRC_URI[sha256sum] = &quot;8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd&quot;
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-six&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb
new file mode 100644
index 000000000..59d9b5e8b
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb
@@ -0,0 &#43;1,13 @@
&#43;SUMMARY = &quot;Hamcrest framework for matcher objects&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/hamcrest/PyHamcrest">&quot;https://github.com/hamcrest/PyHamcrest&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=79391bf1501c898472d043f36e960612">&quot;file://LICENSE.txt;md5=79391bf1501c898472d043f36e960612&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;PyHamcrest&quot;
&#43;
&#43;SRC_URI[md5sum] = &quot;7a086f0b067f8d38958ec32f054559b4&quot;
&#43;SRC_URI[sha256sum] = &quot;412e00137858f04bde0729913874a48485665f2d36fe9ee449f26be864af9316&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-six&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E7FB49C495C6BFB11871B4FA--
