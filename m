Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.89])
 by mx.groups.io with SMTP id smtpd.web11.23999.1611839199335183691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QXKN2NI1;
 spf=pass (domain: windriver.com, ip: 40.107.223.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhVj4oNz5LH7PgCImJReY+RW2Jd8rjSA5ACocBftsCIdBT0ejYoMuc38XY3hst2n3SSNOJzA8ZKALgJRkMtw7iDGcMw7jRd2irw6j0mif2BcZfblRkQfQGSwUY2Rjedcz40doB9L3BHEO0oam7qRtIHhIvmDuFGwkqjm3OUABJjbv4Q7zvtOFF1xRtvEy7ijK9GulF8bOb0pmUANnTs5SE64GHg9Tam5d2KRIyuF8F5U04pKCQw34RqZW1em3aP7jLgIpVrd6y6dDG9t8QsVvYCTnVulKco9qww83tHWSimLYL5azWGj8KFyXIC3zy88dPvQcuQLgf8ULzstpWfKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz7sPhnsT8DWcOpBZ8wRkRh2Gq8oLEjWYrYbZFUGohM=;
 b=K6urNL2aDvQ2iSsMEuhXQrlY8rOG30ev9U+dGe6mqp8fKGAaRfXWmB0eXws6+EHC/Jsh/Gm+1jp2gdAMhzNw/V/4NJvBNB5kvuK0fvjxLtLpCRQWbFMo3dY1GiLgYUR7x0Eb5gOaK3pj29Mp4o9WQXanUncX5yqCRiBKjVx2nQItsu8unURi9Kp+jkwN/ECN9IF/XGBZPvSEFJzkiAaQGBsIr0b5nxJmFVHZs57as+5AjBO35gH9nvtPg0fP1fVl/n1uNG/VPX3WQgllKwTJWOKCvnQlYHP6Uh629XBjk7aBKGXJpVorLtKi/L6H0sJGCEmonZ55h0NPBXYaxS/Rcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz7sPhnsT8DWcOpBZ8wRkRh2Gq8oLEjWYrYbZFUGohM=;
 b=QXKN2NI1vXa1lgGat9TEGRpmsznHnrJwKhmnbaPtkmDePNAHOFwot+m5rVToUnqW6bxMYEHbKEFLrThdIU3uvyvXvCUkN7Pw6MbJhGrH+FI9QSJvylgamNDLO0z6hTFU4pWcHVZjo1I34kEvucMXRD2kARH0trxR2lvFpA9q7zI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:06:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:06:38 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-custom-inherit: Upgrade 2.3.0 -> 2.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210125152337.20937-1-leon.anavi@konsulko.com>
 <20210125152337.20937-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b738a681-ead4-2cfa-c235-d9138d2e3ef8@windriver.com>
Date: Thu, 28 Jan 2021 08:06:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210125152337.20937-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0051.prod.exchangelabs.com
 (2603:10b6:208:25::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0051.prod.exchangelabs.com (2603:10b6:208:25::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 13:06:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30585454-bdf1-49a7-0ce7-08d8c38d8bca
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951E4968EB60ABE370672FB9FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HyqO5XKn4Ydb/CRfkf9fJpk2v53CRzaAeC6J4iZHlIUdUJe3VktwfuNmByY5jhyIjh/Ff0letdm8uFFKh+7t0LL7kq1GJO0aa4h/NN/+glomoV2pTwyMfMbKxq03OHqrDg8a6q+KdC+ynSP2HlCxGnQfLXVVdHkSix3/dXOzyXm+Nd+5pnwHjL6b7TLjQTbYFXhyri25ixAdt7nFDdsq5S9j1ZCx+Dbbl7qARIeBJwJsh0uqOelKigvASaF5dpL1Xl4jpqZGVz6tGSIJKxh5/YtMG3ryLU5bXV3SAmpSey4HuJ2MbkprHmfSazetJ7wawPyBiMgx1kWgwEcLAz+s65Et7gwz4Caq5ul0t9VHAiypekRv1sBrAtXsoEdeXmrhhRSjJofz+HDUxmAp2RUojWgQfYuy1p/gQ9dCBnKXvdJJxIi429nOGHZ2iY3ydVFLbvuSuoaCgS0jy0M1ayOfdBXFnJMADgqjDHWkKvGJ3PktHGgs8QdpWDR3IvlpAAMB2xEiP12+JtlTHBXImbOUkmyp6AQ90O7fXqXzeKs/ffScwE05TkX7t0S4XLt8cpqBmBb5ZqIhOaC3ORShS7p223iapbagx91OzP1UOUNDvADDdM/d7oPeIy+0hJowG4lo5GsMAtKFw6Y407TPWGXp8g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(6666004)(86362001)(186003)(16526019)(26005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TFdod05uSm5HL2tNRVpKOGxGcTV6NWRieFc5VEVyaTh5TElPWTdtQUE1ZU5W?=
 =?utf-8?B?VmFyRHZINnVUQ1R4ek0yOWRjOXJXbHFTK2loNSt2REUrLzVzUkRMcGoySGJW?=
 =?utf-8?B?Um9aZ3RDR3Y3a1Brc2pLVEs1WndGU1NaVUJNSW9jK3NNTkw0U3MrMmxWUStq?=
 =?utf-8?B?NCs0Ym9KcWVQVEc5K01LTks5ZnJPdWFWQk44V0Y5bWtTN2tVOFVqaURTSThH?=
 =?utf-8?B?eHB3R0lybUdsODZ3Tm9qK2VXbUhYN09xZGk3UWxabk5kOUhTTlorbFNNYWpx?=
 =?utf-8?B?N0xEZkpZQlhEakJzQkYvMFhqbVhidU9uZ1lTaDhVbUVEZG54SGVJaEc4OTV3?=
 =?utf-8?B?RmZ1Zkl6MnpxODNrK1JyMGhDUzFoK0RJNjJLZTZ2VmZiYmg3VCtSMkFrK3Mr?=
 =?utf-8?B?V3RFVmZXLzJ2Nmw5cTkvQnJqVU9mTVFZMy9FdDM1dUR0azErVW8rTTh5TUN3?=
 =?utf-8?B?WWR4YmdaNlU0eUc5T1lXOXNQd0tPNFYrSHhwajlzVG5LVURDcnFjUlRJUnlq?=
 =?utf-8?B?KzJRZ1pBVzRybnhGUVJKNjJKaVVQcEJERjUzYy9tZUdOVklxRVk4d3pEZjdr?=
 =?utf-8?B?WkVVVDI5TGVUYW9FM3VZazNLR0pwZnRSc2FSZjByUS8vZ1pwQnhVRi9IWnFW?=
 =?utf-8?B?UUZaeU9YN2MzbGp3V0g4V25YSVJzYTdzY0Zab3d5bnAzdFBaeXVOaURUNnUz?=
 =?utf-8?B?UlI4cHRxck5IeUJNUFhUMVRnRm5XQlZtVVJzNlVmM0lYb2t3a1owc0c1VXE4?=
 =?utf-8?B?VUdJVnNZamdWbGkvTUdCNXlBak02ZlNaUlAwVXpCTzV1ekhSVzg2bTc3ZkpR?=
 =?utf-8?B?RWZqd2ZwdnFtUXAvd0twT2VFY2k5NXd0NjRkWmFCUHBGYkFra0FxTjIwaEhM?=
 =?utf-8?B?TU1LQzRwV3ZIR1BkWUpESzZkcXhwTXJCb3dsNnNSM3oyU0hqZXJXZkw0L2NU?=
 =?utf-8?B?ci9rT1Q2N0R0azhEN3c1RWY0UnEyRTFDSVhsZWNTS1pSTEY0emFFOVdzcnVh?=
 =?utf-8?B?UFBpdnkrVFpyUWFlQnNHOWt1N01xNVNuVmw4eVJzRUlNcE94OUtMVGVlZC9H?=
 =?utf-8?B?UUpmZUNHOG9wKzVTUmtRdjg4UVhvSlZKWmNRazQvRmRZamN5TGYwa0tIT3Qr?=
 =?utf-8?B?cXFLNkp4VDlnUkFvdmlNdzhudlNQMTB3eUdMSEN2WExoNjgzYU1SaWsrdlRW?=
 =?utf-8?B?NTNWeHBiWk5nYkpsVVpVRDJObElhODVOQXN5dkJSWlFteFlobnNvdjlJYkM3?=
 =?utf-8?B?Z211QWpNalZRdVRWcnBmVW9HU2ppWDhwc2dXYXQ0MzV1Q2dhSWF5aytwSkRT?=
 =?utf-8?B?L1lhcTRkYm4wV1BmcVQwVW03Y2R0OWxITE9jNmNjWkZkcXlhQXJtRWEvNmQ1?=
 =?utf-8?B?eDBqb2hWd0tHZnZvWlhDQ3ptZGNVKzd5Z0V1N2s5ZzhEeTFDV0F6WWtYRDlC?=
 =?utf-8?Q?FxUYSOKV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30585454-bdf1-49a7-0ce7-08d8c38d8bca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:06:37.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4FWwfKZ/Tbwvuyxy/Go6IYnjsHrDyOvdpk98kd/o6utN0ZgntGyQRTHRxL9fMF4MLdFkCHdbV8xmKpTEjnzKGovYnmtOKI/w5egcJmRRSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------365223C3A6EE54A58016FC47"
Content-Language: en-US

--------------365223C3A6EE54A58016FC47
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-25 10:23 a.m., Leon Anavi wrote:
> - Methods section is now recognized in NumPy-style docstrings
>
> License-Update: Use file LICENSE.md
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-custom-inherit_2.3.0.bb           | 12 ------------
>   .../python/python3-custom-inherit_2.3.1.bb           | 10 ++++++++++
>   2 files changed, 10 insertions(+), 12 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
> deleted file mode 100644
> index 489e71984..000000000
> --- a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY = "A Python package that provides customized docstring inheritance schemes between derived classes and their parents."
> -HOMEPAGE = "https://github.com/rsokl/custom_inherit"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=adc1f231c76ee2f1f36025d56926ba2c"
> -
> -PYPI_PACKAGE = "custom_inherit"
> -PYPI_SRC_URI = "https://files.pythonhosted.org/packages/0e/82/c5bb7ec49a7892a2c583e1017597e3921c59171f10602086ca93c8a83baa/custom_inherit-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "adf2850dc0e488df959821a5d4c16cbd"
> -SRC_URI[sha256sum] = "1609d283c2cffce3a58baf7c0c22b655c55f85e1ec39c4717a4423d34610723a"
> -
> -inherit pypi setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
> new file mode 100644
> index 000000000..c0e10448e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "A Python package that provides customized docstring inheritance schemes between derived classes and their parents."
> +HOMEPAGE = "https://github.com/rsokl/custom_inherit"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f910a85a4c3da51edf780f17a7608434"
> +
> +PYPI_PACKAGE = "custom_inherit"
> +
> +SRC_URI[sha256sum] = "a0d104847b4cc1ae24e00061fc2e11da8766b019bf4c8c753822347366c8c49f"
> +
> +inherit pypi setuptools3
>
> 
>

--------------365223C3A6EE54A58016FC47
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-25 10:23 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210125152337.20937-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Methods section is now recognized in NumPy-style docstrings

License-Update: Use file LICENSE.md

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210125152337.20937-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-custom-inherit_2.3.0.bb           | 12 ------------
 .../python/python3-custom-inherit_2.3.1.bb           | 10 ++++++++++
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
deleted file mode 100644
index 489e71984..000000000
--- a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = &quot;A Python package that provides customized docstring inheritance schemes between derived classes and their parents.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/rsokl/custom_inherit">&quot;https://github.com/rsokl/custom_inherit&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=adc1f231c76ee2f1f36025d56926ba2c">&quot;file://PKG-INFO;beginline=8;endline=8;md5=adc1f231c76ee2f1f36025d56926ba2c&quot;</a>
-
-PYPI_PACKAGE = &quot;custom_inherit&quot;
-PYPI_SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/0e/82/c5bb7ec49a7892a2c583e1017597e3921c59171f10602086ca93c8a83baa/custom_inherit-${PV}.tar.gz">&quot;https://files.pythonhosted.org/packages/0e/82/c5bb7ec49a7892a2c583e1017597e3921c59171f10602086ca93c8a83baa/custom_inherit-${PV}.tar.gz&quot;</a>
-
-SRC_URI[md5sum] = &quot;adf2850dc0e488df959821a5d4c16cbd&quot;
-SRC_URI[sha256sum] = &quot;1609d283c2cffce3a58baf7c0c22b655c55f85e1ec39c4717a4423d34610723a&quot;
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
new file mode 100644
index 000000000..c0e10448e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = &quot;A Python package that provides customized docstring inheritance schemes between derived classes and their parents.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/rsokl/custom_inherit">&quot;https://github.com/rsokl/custom_inherit&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=f910a85a4c3da51edf780f17a7608434">&quot;file://LICENSE.md;md5=f910a85a4c3da51edf780f17a7608434&quot;</a>
+
+PYPI_PACKAGE = &quot;custom_inherit&quot;
+
+SRC_URI[sha256sum] = &quot;a0d104847b4cc1ae24e00061fc2e11da8766b019bf4c8c753822347366c8c49f&quot;
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

--------------365223C3A6EE54A58016FC47--
