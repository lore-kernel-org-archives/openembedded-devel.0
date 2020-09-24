Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.48])
 by mx.groups.io with SMTP id smtpd.web11.26316.1600976744746613542
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZEZIoeL3;
 spf=pass (domain: windriver.com, ip: 40.107.243.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePNRtWpvcy+rKrTZjSeQ1ZoEwsidmEYLvDMJikMd9+3IpU/lsPF/oUKwn8oG5t9ygbEdGiuZ7jWeDg7yGKMwXRGpUmttQymS90elskmgktf6vNwyy2B5S7lVB1ssKF15tzBH8XYTLg1Z5KnAdywRSD5qZJ8UWBLVzws7zuCE58Zs8Qe1DMlMILsTZoXJlXeTP1sRlB8lN/6DU2HVassJu+YalIaZx1fhLpkXpAlNZFLJOaV66h7sane0du38d8mMijSjJ02E/U2wtRuEgu0y9MeDY27ImK8Uhjw+//RY9Po7l4I15k3VIgn79VVQjCEEE2MVVov35l/sr9W5VWSvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAR4HfqdIn4B1BcIxXZ5WF5yF4mFFkpMm+cbUMeSCYI=;
 b=m5dUFwJOhavHN+yT1inN7FoZhR0v/5kaj487l8xnPN8k3I42gyn/HKVAk9QY3GORNtQ0PW8jaC3OHOEHyRcgJZouWAZiRxaW8DfzTFx3Dfd7yRnXheqN15bjd9b8stEeJu5ws3w+ifGfnT04FCGaCAeqhxS72Qdc1WiZDgMQ6+MiiOKkGUfhVns8rRzGlFOw5wwPr9aEHgTzebhPW8ckjffPPZm8klAt9alcZAKFMYQlCdJ42TmxM53PafMNYw5x96LWkcs21D8se3Mmbomc95b/Pb/+aCT9RPtqiNBUiYs768N5EKbjr+A+YlwckH6wX2XVK5neb1bgEO6HYp+zvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAR4HfqdIn4B1BcIxXZ5WF5yF4mFFkpMm+cbUMeSCYI=;
 b=ZEZIoeL3t0IGvoTNuGv/yOOL13Fh51iTA0zHk1dvubbHDaOmKCBRbVBoD8Ns91TUxZLDfRwYSNPjaj/3gEBCzKCeSpWMvOhUws0eP65bRZFJ9gKrSuJq4nia7gsEoJgyjYeyJMk3poaf8TCNgMAwaEY4/MyM4oiN9tVstcQ23/M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2839.namprd11.prod.outlook.com (2603:10b6:a02:c8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 24 Sep
 2020 19:45:43 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 19:45:43 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-importlib-metadata: Upgrade 1.7.0 -> 2.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
 <20200923075830.30859-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <134f3b83-bdd4-ae9b-1f46-98e8c4d82ccc@windriver.com>
Date: Thu, 24 Sep 2020 15:45:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923075830.30859-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 19:45:42 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73a8443f-4c94-4fe1-74a4-08d860c26c87
X-MS-TrafficTypeDiagnostic: BYAPR11MB2839:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB28396D52424CA7A56319C9719F390@BYAPR11MB2839.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JllYWVAnFijymAzGix84/eFuFJSS5bfkhQrLLc13ouNcM+wRLVJcJgoSveFaaF+R5OKntOPEOVHxvITmdsazrQHpOXUOdYiDVzKYnAg/wswoOv9R5NmgTSO7uYrKPvpGw96Agr7p9hlPP3GO2fZoP5HrSWydpcgT9qlFAtfc+TxsOhky2/pBREddedgLfQqAuAnT9lDzISy+bgFIUzaWRg6eqZ2zNHQuoaV3cjhPvOAyXPSzUJokrDgU0GT4nK0VTM8qUwsseZQFl1DOtK2bAzF5X/XkY80VGSe0lCEe+TZJvd84W90U8JlIpB8yE7NG5SF7ebiaRxovL9HWLUB742UzG0oilt8gz6BqW1ndwmr3/Lzt7KYAJZwkTZfO1nCJL7S3n4780qtSi2/O1DV7pBYSf9D8NgtW/y7lE6vTk2q2m8dIzraoytMLxVbyZQL3l5lYsusX0+IZ1x0PBaw7DA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(16576012)(83380400001)(2616005)(52116002)(66946007)(478600001)(26005)(53546011)(6486002)(316002)(33964004)(966005)(44832011)(36756003)(16526019)(186003)(8676002)(66476007)(6666004)(956004)(166002)(66556008)(86362001)(8936002)(31696002)(2906002)(5660300002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hFTfu/hNzZONHcdj5VENOnP5Lv9V3jIEfpY4eXdJq3dJ2d+gbrkkRGR0AYfgAuz2Ktcd1QdvirxflMSN95zsWQnaQLxXaASjrcLwEKRnOIbyQ6l365IKObIjIbgGMsSUwfLiMoWxuuCo7ZkqXCUe0SKs9ub82yDbVO54O9ibGS0RndtagTdrxJzOjFadIF5UGLYgjKEbaHI6wpUN3aG7qBRwSEcRLL1Sw8XEEOpbG2zIU9Zoa9D4T+cJkZGlvqQLcI2pli2q8DTe1bBbK7dT+C1NbSrgg6kAWYHIO6V8cPM8FfxdYk9G7/gxVGuPul+ROGVzwtzzaWSa28Ibj0klXnJyvoAjMSvQU4LVi18frWD9kXGkoAYzX2NxYqd5W16pjo77+NLhJ1o+1t7wRS9sbxNHDFX6/JSZBYA8Em3wJzh+xKG60z33yKXN57BrL0qrMTl1M2oDwDMncUt8Rj5Ns1LOuQw7Zt2WfQbnhn+7ApccjM1GXKYad+fh7awte/KCRMo/Q4P5Ep4CJvKIVJQQQWivn1KhYCDxzpGom1antmQRQ3nY6dMQ3FFXoHUFUZjCVscGAmJTfCx8FdprQB0UeitbzEU4VtpDlwFs+6Gr4MNUaddP2aXzTBbC8SxGxofZ/M5LbeIGa28j87fQFL4ryw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a8443f-4c94-4fe1-74a4-08d860c26c87
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 19:45:43.5422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcFpwBBf+kLCZ7z8LM9yHLpNrYAxCzmqCHxVdfvbxjE49M+x7Byzb4p/upVJDGomEWWWO8nBCxibYH+8PYcV7yXLresoEVmB3h1toVZ9XWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2839
Content-Type: multipart/alternative;
 boundary="------------1C72041F619B6B0E49513D7B"
Content-Language: en-US

--------------1C72041F619B6B0E49513D7B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/23/20 3:58 AM, Leon Anavi wrote:
> Upgrade to release 2.0.0:
>
> - importlib_metadata no longer presents a __version__ attribute.
>    Consumers wishing to resolve the version of the package should
>    query it directly with
>    importlib_metadata.version('importlib-metadata').
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...etadata_1.7.0.bb => python3-importlib-metadata_2.0.0.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-importlib-metadata_1.7.0.bb => python3-importlib-metadata_2.0.0.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
> rename to meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
> index de0fc78368..325a41c22e 100644
> --- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
> @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI = "https://files.pythonhosted.org/packages/e2/ae/0b037584024c1557e537d25482c306cf6327b5a09b6c4b893579292c1c38/importlib_metadata-1.7.0.tar.gz"
> +SRC_URI = "https://files.pythonhosted.org/packages/56/1f/74c3e29389d34feea2d62ba3de1169efea2566eb22e9546d379756860525/importlib_metadata-2.0.0.tar.gz"
>   S = "${WORKDIR}/importlib_metadata-${PV}"
> -SRC_URI[md5sum] = "4505ea85600cca1e693a4f8f5dd27ba8"
> -SRC_URI[sha256sum] = "90bb658cdbbf6d1735b6341ce708fc7024a3e14e99ffdc5783edea9f9b077f83"
> +SRC_URI[md5sum] = "3dd91821c930a3c3633e99a7025aa9c2"
> +SRC_URI[sha256sum] = "77a540690e24b0305878c37ffd421785a6f7e53c8b5720d211b211de8d0e95da"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
>
> 
>

--------------1C72041F619B6B0E49513D7B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/23/20 3:58 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200923075830.30859-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.0.0:

- importlib_metadata no longer presents a __version__ attribute.
  Consumers wishing to resolve the version of the package should
  query it directly with
  importlib_metadata.version('importlib-metadata').

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200923075830.30859-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...etadata_1.7.0.bb =&gt; python3-importlib-metadata_2.0.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_1.7.0.bb =&gt; python3-importlib-metadata_2.0.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
index de0fc78368..325a41c22e 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e">&quot;file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/e2/ae/0b037584024c1557e537d25482c306cf6327b5a09b6c4b893579292c1c38/importlib_metadata-1.7.0.tar.gz">&quot;https://files.pythonhosted.org/packages/e2/ae/0b037584024c1557e537d25482c306cf6327b5a09b6c4b893579292c1c38/importlib_metadata-1.7.0.tar.gz&quot;</a>
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/56/1f/74c3e29389d34feea2d62ba3de1169efea2566eb22e9546d379756860525/importlib_metadata-2.0.0.tar.gz">&quot;https://files.pythonhosted.org/packages/56/1f/74c3e29389d34feea2d62ba3de1169efea2566eb22e9546d379756860525/importlib_metadata-2.0.0.tar.gz&quot;</a>
 S = &quot;${WORKDIR}/importlib_metadata-${PV}&quot;
-SRC_URI[md5sum] = &quot;4505ea85600cca1e693a4f8f5dd27ba8&quot;
-SRC_URI[sha256sum] = &quot;90bb658cdbbf6d1735b6341ce708fc7024a3e14e99ffdc5783edea9f9b077f83&quot;
+SRC_URI[md5sum] = &quot;3dd91821c930a3c3633e99a7025aa9c2&quot;
+SRC_URI[sha256sum] = &quot;77a540690e24b0305878c37ffd421785a6f7e53c8b5720d211b211de8d0e95da&quot;
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 RDEPENDS_${PN} += &quot;${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1C72041F619B6B0E49513D7B--
