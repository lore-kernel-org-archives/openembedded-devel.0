Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.51])
 by mx.groups.io with SMTP id smtpd.web11.572.1599495039503191235
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DeLZRDsL;
 spf=pass (domain: windriver.com, ip: 40.107.76.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEpF8cXWAAs9+bYNKqzhvwR3VvNOoNU2mDapqldnV1posdgIR1XSDToIUrTjFQydEIezWJ6y9D2bsT00Ej2l+1yYx+jG2e2cnzIAVwoCYeNsdPw+tG8SN67k/19Qop7qzS3vo5wkF3gmjx7S+a+GGRu4PBxEtEjAlnnm3NLP8oul8DWnVuUWIU3lvvvduwnemPBUtTRhI7fInSIqjr7Uy/auCbuUxtaDLLx3tSHj99Rj6+mqGwYz9l/9hTX97Lcwm5uWmYDeMaJEyzkvJk2iCglSEjmnZ3ob9+1+OFuzyc6AKmUGJQxhNIBG7C0+7hb9UZqRn8hQRecTT7C/M3HBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvGUC6ohzcfzNGhiHFD6TM2BjElL0pV3SrY0FGaoKjs=;
 b=jHlKiGv9wYB0xkW5Om828mO2pFS5oZ9n0n+1U+nTlyujo7VaZcQ14OMYNCklfH05FBAhjubcRM+l8VqeqldmsTt5lhudX9dOssnKsBALq7h6hguFCc3Z5W3lMqDHEsyqvWW46ImybsARStfDWAYzf9BYvrkbluYy0OQEVwVAHUlJAy0ObW4XKFAk1ce9H1wzeF9rGgO4NrS+3q+TAJzeZRxvbTxqlSto6PXBncUZ6JjNCS8/pODWIv41FgEYORVT9FT2NVrybQW8fFt7DTBp3OVRvf1V4MYbgySu9lZhY85JxaiO8vXOg8qngJ0dclmHGzG7HR2oVyScMvn8z2fGEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvGUC6ohzcfzNGhiHFD6TM2BjElL0pV3SrY0FGaoKjs=;
 b=DeLZRDsL4S23M4lLlwsUKZBWiQWv5NqxSpNFBVljSx1OwiWZxtAl9M2C6zwYdu7bYBYzmBkY+MN1GbVYk4UfkAGpGPKj0oGzH+hA8+bIgXcODtuCUggSECzFFpXAloEEpuZS4qh3tqYKuomuMYqDf2UQ5aGTst20yqd+UjNMNgU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 7 Sep
 2020 16:10:37 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 16:10:37 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-mprpc: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
 <20200904134713.13164-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3fbaa802-329b-59ad-3d4d-f09d7c962602@windriver.com>
Date: Mon, 7 Sep 2020 12:10:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200904134713.13164-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Mon, 7 Sep 2020 16:10:37 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e50b04f-d278-46f6-94dd-08d853488ef9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3671986FE00A7EC89B642F8F9F280@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7eIi66OciUc/hQ9wUsV/QTHTP9eHiV8ZjIhImK1iMMaeRwBEiMmCsHzt4ENY5CAxlJf6sAddKoz82ogToIxSqBSnTFnO8xdeqsW46Bf3bYFs06Jxy5ahyxGn/Fno5Li+uVfdRV/SRu0Q//DqkWiFpbL2qgDDLRZfhbt8I5Dg2B+PFt87MrsyKWTFLMJcaEwMjTlc6/RJbn2hiA9kXzdnDYiaQ64YS7ZMoyQ71er8VjlGzu3s/bT5kTDk9HWktUqWwliWwr30ZENFQwL5Fe+Kj/2rHZTGXcW56vwZ3UechWhPcg4vwFuhaDosWN2Vtpy8X6yM2tSU9UVdam2OW4NqLVoG9IsfIK99HuiQv12qT1BmRjdv0cP++jaEQxaLxxCq/FlwDFiQM3hGl5IybT3fcN7YGuEa4KpB1ENg/LhAuuCmT6Zc7awdGOCYzQrVV2D/l/qQjLzc1xoLLMUNwL1IcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(478600001)(66476007)(2906002)(186003)(8936002)(66946007)(44832011)(16526019)(86362001)(31686004)(66556008)(966005)(6486002)(53546011)(33964004)(31696002)(52116002)(26005)(5660300002)(16576012)(316002)(2616005)(8676002)(83380400001)(36756003)(166002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vu24bizRS9X4OBPumPbCPzJulZ1PZrwglUDDQZpsrWyUJCY+HYAWy1inDePkDYD5BGSfK+O56ae8ODRGB3L7XZ8R2eFDHfmYt339caNlAua8h0UwmHaJ4sj3hxGsrQyyeXGG78c2yK/2VlEkwzwCTEfsleR03KSqXjvGxVM9yNFs0KiD1dsLzHeIMJ+Wqx5s3lmYyr/8W3mGdfozAb3ISTGM5E+CKM+ua8R/tj8u4iV6NMLbPw+V2db6Vh8a/5VZuUqdpryiet//CXa6rrUtJTB7oHHDY5bSQlpqleEhAh0m93byEoOkc2EJh2JC8wQwcsuCBfdvSEP9THE/73043ttpdtnu1IdtCicWCoa1d9QlLqBtVenHsU052+BQXqtf5gNuz3FCNV22c/dClfy4MRBHdES8uXSZWtlrMl1PkcznUBO9lE6hHLVFd0AD/ou+Z/HKRxHhxqKhoyX0SVjkwIs/mEUVivPwIVoMilmevsuTsavkJvuj+XkBgxYziXHwOJTdgBsQV3tB4wLV1ivG32KuKXXwC1lrLM/gE1sqkWHaJv5QX79D+m8ETEnk2KBJKbiYlAaZ9EPJbDEE+7TCNTABxx1KMgeOIqPk5u/eDuS8Ko/kA3NHUL5QrkmM6+qslxl/j9WbN3mbOadhi2OoUA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e50b04f-d278-46f6-94dd-08d853488ef9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 16:10:37.6765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9kLjuEpXV4t//XI0ME+ONYJtttfNJ2Lwsjr0w5Y/NbB511c8SMceAIeTBqiOxGmxXXx2HvZFHQUbqd5Jlc9G3znVL0RCvKrP435qiMxM5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: multipart/alternative;
 boundary="------------A0A312023E1D8D6A7CE0584A"
Content-Language: en-US

--------------A0A312023E1D8D6A7CE0584A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/20 9:47 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-mprpc/python-mprpc.inc                 | 13 -------------
>   .../python-mprpc/python3-mprpc_0.1.17.bb          | 15 +++++++++++++--
>   2 files changed, 13 insertions(+), 15 deletions(-)
>   delete mode 100644 meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
>
> diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc b/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
> deleted file mode 100644
> index e9eebe84a..000000000
> --- a/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SUMMARY = "A gevent based messagpack rpc library"
> -DESCRIPTION = "mprpc is a fast implementation of the messagepack rpc protocol for python. \
> -It is based on gevent for handling connections and enabling concurrent connections."
> -HOMEPAGE = "https://github.com/studio-ousia/mprpc"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
> -DEPENDS += "${PYTHON_PN}-gevent"
> -RDEPENDS_${PN} += "${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool"
> -
> -SRC_URI[md5sum] = "8d97961051422f3de315613434982d3b"
> -SRC_URI[sha256sum] = "3589fd127482e291b1ec314d6f0e55cc13311c12932ace356d6178ea1ca28f6a"
> -
> -inherit pypi
> diff --git a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
> index 837d604ed..14eef9691 100644
> --- a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
> +++ b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
> @@ -1,2 +1,13 @@
> -require python-mprpc.inc
> -inherit setuptools3
> +SUMMARY = "A gevent based messagpack rpc library"
> +DESCRIPTION = "mprpc is a fast implementation of the messagepack rpc protocol for python. \
> +It is based on gevent for handling connections and enabling concurrent connections."
> +HOMEPAGE = "https://github.com/studio-ousia/mprpc"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
> +DEPENDS += "${PYTHON_PN}-gevent"
> +RDEPENDS_${PN} += "${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool"
> +
> +SRC_URI[md5sum] = "8d97961051422f3de315613434982d3b"
> +SRC_URI[sha256sum] = "3589fd127482e291b1ec314d6f0e55cc13311c12932ace356d6178ea1ca28f6a"
> +
> +inherit pypi setuptools3
>
> 

--------------A0A312023E1D8D6A7CE0584A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/4/20 9:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200904134713.13164-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200904134713.13164-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-mprpc/python-mprpc.inc                 | 13 -------------
 .../python-mprpc/python3-mprpc_0.1.17.bb          | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc

diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc b/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
deleted file mode 100644
index e9eebe84a..000000000
--- a/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = &quot;A gevent based messagpack rpc library&quot;
-DESCRIPTION = &quot;mprpc is a fast implementation of the messagepack rpc protocol for python. \
-It is based on gevent for handling connections and enabling concurrent connections.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/studio-ousia/mprpc">&quot;https://github.com/studio-ousia/mprpc&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4ba825394aec026b5f94edca44426859">&quot;file://LICENSE;md5=4ba825394aec026b5f94edca44426859&quot;</a>
-DEPENDS += &quot;${PYTHON_PN}-gevent&quot;
-RDEPENDS_${PN} += &quot;${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool&quot;
-
-SRC_URI[md5sum] = &quot;8d97961051422f3de315613434982d3b&quot;
-SRC_URI[sha256sum] = &quot;3589fd127482e291b1ec314d6f0e55cc13311c12932ace356d6178ea1ca28f6a&quot;
-
-inherit pypi
diff --git a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
index 837d604ed..14eef9691 100644
--- a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
+++ b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
@@ -1,2 +1,13 @@
-require python-mprpc.inc
-inherit setuptools3
+SUMMARY = &quot;A gevent based messagpack rpc library&quot;
+DESCRIPTION = &quot;mprpc is a fast implementation of the messagepack rpc protocol for python. \
+It is based on gevent for handling connections and enabling concurrent connections.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/studio-ousia/mprpc">&quot;https://github.com/studio-ousia/mprpc&quot;</a>
+LICENSE = &quot;Apache-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4ba825394aec026b5f94edca44426859">&quot;file://LICENSE;md5=4ba825394aec026b5f94edca44426859&quot;</a>
+DEPENDS += &quot;${PYTHON_PN}-gevent&quot;
+RDEPENDS_${PN} += &quot;${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool&quot;
+
+SRC_URI[md5sum] = &quot;8d97961051422f3de315613434982d3b&quot;
+SRC_URI[sha256sum] = &quot;3589fd127482e291b1ec314d6f0e55cc13311c12932ace356d6178ea1ca28f6a&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A0A312023E1D8D6A7CE0584A--
