Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.81])
 by mx.groups.io with SMTP id smtpd.web12.19804.1590693779011473898
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2020 12:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AJknoiFS;
 spf=pass (domain: windriver.com, ip: 40.107.69.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHKkPJ/MWIbetbTMZ7+BHXtQzYzfPwY2rx/XhjSaJLrojF8hc5xMplv5+9DT9xoOZWorMTFsc3ja13XrltvKiHwlQZ6RF2t4cdbi1aiRuS3VcutpS2jqk/8erR8jrBqZoip7kxlwSGtoH4a0830S0RhCwX4i2NISWLkDZ9smcIOgYXtvdpN0HGtvboyPXNFqPIxq9l+c7hGIPDV87KgClnrQhZOvSlAvGnyvfuTgpAtAunJps8aJ60W7/bgENyP5x7q6RI756O6IIBusCTuwKiYNrnBTAF3jm3EH7iIkJ9m3cgNR6DR3DLBYVG312rzzT/pJNVoNKmO4M6nhm5GQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Gv5nU4IhiHCfnbdvvAcK/CQJTu8SFlMUU7yt7X41Pw=;
 b=bHoQpmqmIOOqd3zDmtfaivGEgbclMVbVITNPD9VHtxfvguwwHwJQ6BQwAJHFpI0O27aCcJ3WFkRLUwHECUJSKNvdFCJv4hv7DOJJJ6DoUOyKsBAyl0s+TXnDrQPVnOPVnBOBguluNUHUXkiZsWXrDn6SfHJGz5VB2kJqi+YEIZwpzj15eY0tAvRygLdASLOAv+LUd7D5DUw3YDdKj2z/bhWbiWVaaDtz12fnK0LzkrkS0g+E3QLno1eJB/dWZaNYiryQF40T+X0we9Pn9qau5+Rx/j9vJ4d7mvVd6JMdLAK/WSG01NYbzMszbYx8EsOgBvhr/COxutldKQvmVB4MWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Gv5nU4IhiHCfnbdvvAcK/CQJTu8SFlMUU7yt7X41Pw=;
 b=AJknoiFSPZlZJEMXtflFogxo8gXvpEr3dkJL+e2H5Wz5XNSiGM8ujCh4iZFfake3so/a0ziOWpJOYntbMWz9xmqzApCF5+OPVoKyixxnsvX2T3SyTLcv8pyXdRuSkB0j0ZANCnR+zrAkK+KugKOFTbkCDYLHkO/h4sJ7aKXwRlg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4161.namprd11.prod.outlook.com (2603:10b6:405:81::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 28 May
 2020 19:22:57 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 19:22:57 +0000
Subject: Re: [oe] [meta-oe][PATCH v2] python3-pyyaml: Update 5.3 -> 5.3.1
To: Domarys Correa <domarys.correa@ossystems.com.br>,
 openembedded-devel@lists.openembedded.org
References: <20200526164721.7901-1-domarys.correa@ossystems.com.br>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a6d75ad0-e3a1-cf9f-9ffd-02b577ec6ad1@windriver.com>
Date: Thu, 28 May 2020 15:22:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200526164721.7901-1-domarys.correa@ossystems.com.br>
X-ClientProxiedBy: YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::28) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Thu, 28 May 2020 19:22:56 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b838f0c-529a-49ff-986b-08d8033c86cf
X-MS-TrafficTypeDiagnostic: BN6PR11MB4161:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB416179BF4D0BD0013F1502A39F8E0@BN6PR11MB4161.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0417A3FFD2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nDRi1bcVPczfikGyQNBsMKgIlYNqEBSKXIBNCfPMJUxvCkM4ANyVW5W1hZVCXRqw/6eJrFxFwnkyliYUo7WdR6V5FHYXRGIaN+bYcaShaUxpYuYmBrGdNixHevVnIJ6dzAq739H4iStPB/v/pBuu9ib09Azd0jPqXKkP0lA+3NM/MofXTo6keSNgzukBA7+NcuRItKDNB09OvXhQEM6E8DOppRtrC1dkqBGRAkd/PoflIj93lXIhmJvMxhEyhIqNCOndVv4BeVqnsf/jioPSFhhBNIESFwUs1lBcYFgZl7RVtuanI3Nkf+nS4v66R15yZRQAgVTqaQzPeI7Yx9eQX2wjuObJG9Uatq1JWL4GDXct8PKJfzSGUphVeIkT0u5rmVu2ADpCkfnEItRgTwJwog5ttMcpt+ufr+QFcRHQw+JJECTo2kOrMPWYuiqGC8TcmdE845bgdkQRTMYeKRAG7w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(39850400004)(366004)(376002)(136003)(2906002)(966005)(6486002)(36756003)(31686004)(166002)(33964004)(86362001)(31696002)(83380400001)(52116002)(26005)(478600001)(8936002)(15650500001)(53546011)(316002)(16576012)(66476007)(8676002)(16526019)(186003)(66946007)(44832011)(956004)(2616005)(66556008)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fSrJG4TWxdE5NMD4QO0AQOfluGpF+hIcOag0lP/+nFA9D7KWw93NJL0hpiV2Swz3m128CFDJDlDXshrUZWKmc+ehu2ZDQ4jRqXlgZGqJxja9WtueYAxQ0fVcTY+FAvM4X3j6fsCKw/H1jNyejjcyZ8Q5evmHB+UANAbWbnhUGuPiZEzWVRh5apDR4FZ3TdjOPllpiqyEWfe2xIwJF7fv8JMvyF64cmTE6/cjk6SVkS5M2taxBE08kxYJF9b0/qU4fHFplRRikZPaebcn0yRJLuiC3opFSPoPftt9GODldr3GaJU6sQ8eu7PhX8Z6ph064CP/tFtxgKAkxzJQYVNFMkxGfEm3o5BdRcrePAc16ZwxLnqK/CcXPlUlL8+8jnLnsykZe+obcWu955RO847el0IZ2v9+k/XY0gT1vnMlvgNIWgUe3lGKXM3XslJQjkF8ZdJP7zzTG5nc3hcWIFB+njrfTGTw4iqmYPp7qE+9xSW2Iqh3CXNozbX/PhJwGe3K
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b838f0c-529a-49ff-986b-08d8033c86cf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2020 19:22:57.0288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSvjot2D19IZe/qBaBTng10LizbL8D2wVL8SUYdWiSRmlDNZPvYHuXIM749L5PWQy/nS11TrKL/j4MBDMKRAoGD6Vy2Yr/MoFDkq9s+Pt90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4161
Content-Type: multipart/alternative;
 boundary="------------068047750BA35C6157DE0C01"
Content-Language: en-US

--------------068047750BA35C6157DE0C01
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/26/20 12:47 PM, Domarys Correa wrote:
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
> v1 had problems to be added to the master-next due to lack
> of rebase with it. The current version is fixed on the
> master-next and successfully tested.
>
> .../python/python3-pyyaml_5.3.1.bb            | 18 ++++++++++++++++++
>   .../python/python3-pyyaml_5.3.bb              | 19 -------------------
>   2 files changed, 18 insertions(+), 19 deletions(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
> new file mode 100644
> index 000000000..8cf909304
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Python support for YAML"
> +DEPENDS += "libyaml ${PYTHON_PN}-cython-native"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d"
> +
> +PYPI_PACKAGE = "PyYAML"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-netclient \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
> deleted file mode 100644
> index 17868a25d..000000000
> --- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY = "Python support for YAML"
> -HOMEPAGE = "http://www.pyyaml.org"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
> -DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
> -
> -PYPI_PACKAGE = "PyYAML"
> -inherit pypi setuptools3
> -
> -SRC_URI[md5sum] = "adbb0d336b509d6472d3b095a0f1cf30"
> -SRC_URI[sha256sum] = "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-netclient \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
>
> 

--------------068047750BA35C6157DE0C01
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/26/20 12:47 PM, Domarys Correa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200526164721.7901-1-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Domarys Correa <a class="moz-txt-link-rfc2396E" href="mailto:domarys.correa@ossystems.com.br">&lt;domarys.correa@ossystems.com.br&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200526164721.7901-1-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">
---
v1 had problems to be added to the master-next due to lack
of rebase with it. The current version is fixed on the
master-next and successfully tested.

.../python/python3-pyyaml_5.3.1.bb            | 18 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../python/python3-pyyaml_5.3.bb              | 19 -------------------
 2 files changed, 18 insertions(&#43;), 19 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
new file mode 100644
index 000000000..8cf909304
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
@@ -0,0 &#43;1,18 @@
&#43;SUMMARY = &quot;Python support for YAML&quot;
&#43;DEPENDS &#43;= &quot;libyaml ${PYTHON_PN}-cython-native&quot;
&#43;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d">&quot;file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;PyYAML&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;SRC_URI[sha256sum] = &quot;b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-netclient \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
deleted file mode 100644
index 17868a25d..000000000
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
&#43;&#43;&#43; /dev/null
@@ -1,19 &#43;0,0 @@
-SUMMARY = &quot;Python support for YAML&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.pyyaml.org">&quot;http://www.pyyaml.org&quot;</a>
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a">&quot;file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a&quot;</a>
-DEPENDS = &quot;libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}&quot;
-
-PYPI_PACKAGE = &quot;PyYAML&quot;
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = &quot;adbb0d336b509d6472d3b095a0f1cf30&quot;
-SRC_URI[sha256sum] = &quot;e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615&quot;
-
-RDEPENDS_${PN} &#43;= &quot;\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-netclient \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------068047750BA35C6157DE0C01--
