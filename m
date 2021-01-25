Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.57])
 by mx.groups.io with SMTP id smtpd.web11.35839.1611578339262539369
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=qFRNHQ9T;
 spf=pass (domain: windriver.com, ip: 40.107.220.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MG7lEKsIZ853uNNgAVgGjsT+eTCu3oaluYFmU9wCTyF4vihEoG9zTU8sOMdz8e+gltsa6jkCZWy/JNwT3cMs1s/+WGljPS+fUjWazd/W1enpBfd56Aq+5G9W1oVTWf2vrmDFvFhaReIJXD4VbQBKuzNu6XIZZNvMZZ2v1S7VpBgoApkvSOj9WczF6FDBfVBpTTKvgI6ZTdoTkWMhs2rZjhj/vymdn4NeCo3n8DqO1VFrJaAipUDJsolzpy/qX3Z4qgDWrxbftUNdAZ8/R4STxcLFcUZtBxQERejDR6vn6N2SuswPrBd2Jpc/kP+W+hR9PA2pzPAykX08ahBDVw8pcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DuP2k/7gdZChNrUuQFt9YYKS1qaiQ2Q+AK+6trW/rI=;
 b=TOUVIAUhOQgfzmFOv+o6GtxXolJC4XvjUzNuYNpBdEaTgxXEki5q1Dbx0DCUcOcNUmSJVrJoleyB+YjRwAC+RFq6o56FpykKtaMkNGlvnrU2rY5adP8O1fQQaXfb2/5sNm8rx7Q9mZJZJq7JjBrCFFk2LseT8IbQd9OwCnjO5XsOQ3p/EjVjM1MN4aL++hyQPUVOWwI/xuGx7W++MLX4gGu+z2fKytOgXiCwhkNfTD2zg8oySGHsEeAtptZr1Vh905KUHWqFhSLN9iYBiP1TC0Hjl6JCA6mcjszdyPztbeuW4Qq+OtJ/bbaZjKNP16X98JGDxMbnH94/rHplDce5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DuP2k/7gdZChNrUuQFt9YYKS1qaiQ2Q+AK+6trW/rI=;
 b=qFRNHQ9TYYmDC1iRv+77Hlt4STfZtFniQUgTDRY67qx8snJDZsYkUqAj2DmEH2bVlZtmbIQGq7zXrAoxwklT9wiK1T+FEvi2g33r+mQcnccG8reohEl2jczNk6vktQLcQzuFQzdJCA+Rh2crM4WP6V7P6CEPa8NBt95dtxo85Y0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:38:57 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:38:57 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-pyyaml: Upgrade 5.3.1 -> 5.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <39c07645-f777-88f1-bf8e-bd6eb8170866@windriver.com>
Date: Mon, 25 Jan 2021 07:38:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210120111027.12947-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:610:b1::23) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH0PR13CA0018.namprd13.prod.outlook.com (2603:10b6:610:b1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.11 via Frontend Transport; Mon, 25 Jan 2021 12:38:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fe47a5f-a499-4584-b701-08d8c12e2f10
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3984479DB653D8DA341D33E69FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ly/7otxqxS/8/PLDfDMs1QiAQGUyS4jHF2VFMIme0BtImdTdBnSzmALsQedIRBeYu6xQVRI1fBOKBYBIQxU11gyq7SfmenFXcj3P4gvjwz5tR2WYxVvXUmG64tYxnWKUf6mpiXB8R2LoTSWmMA/mFJZTyHLnynLprgZ4BF6qnOmKxzIOUTCozRmdZ+PXtGvFALVKgJzBCv19TD4rXggAhDhegzmZr7aQIF4e6RZnPtFDhhGi9OPsB4Nmzpnpt+zeHui5s0x4Gt8eRvKti1LoVK+NKxuW29oaPh3rddMR47/Bzjqse+0kB9u/l8Lj8bA23ThL9KaQiJNhM7s8ONXEkQkykb/fVh560erzSs95wnun82JTBhldzCb+yTEV2NaNA8KpsppkZFk02e98QaZfXV97sM0LOhU4miD3PXNxFK3idoTi+Kimf1F3JaQBd6OvsOmLZGg7XVRZK93IFFIumYA8DXtyEHuNutiuHhCvU9W6cgZUcKGCrQL2UdE9wNNvKwrIy/CUNrxI4qRnkBqWdIgXoq65fAzPiOCrcXsCvFtXmhq/LEGOzs8c+q+LI50g
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(498600001)(36756003)(8676002)(52116002)(2906002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NDJrNVgxd2xuQS9KY3BRdHFiVit3ZlQ3MmhLMldLeGxURWpTWHA1S3VsV0FN?=
 =?utf-8?B?b2Z4a1FlNDZxeVEwWGtjNktIRUpmL2RWT0ZGa2NlVCtVcUtFYWIzUHZ6U3Bm?=
 =?utf-8?B?Z3A1SXB1aGppOE95eSt2cTlpWkx5V1JncGJJWHM1MlRzUVVqUmZSUFJHZHRw?=
 =?utf-8?B?eUwwdjE4anZacHd5Um85VmhZNlJxbzllK1p4Rm9xTGxoYWkyQmZ4dHcvdG1u?=
 =?utf-8?B?cXRZRVFRamFkdVhCOVBMOWo0MGxTT0lnN3R5dklpaThDak1wSnE0MWxqdDN6?=
 =?utf-8?B?MmRtQUN0QmMzc01Gbjh2SE5wbjVaSXN3ZmJiVk9tdU56Q211RDlrZFR2Ui81?=
 =?utf-8?B?WVFMNTRiVEFvUzQ3anB6S1k1dlFzbndlb1JPZ3pqeXV0NUZYK0Q0UjRXTVdk?=
 =?utf-8?B?Y1Vmb0lsOXMzSTcySVpIZ3ljbUs2UEdMVmxEdWswS3ltc0UveW1WOTZRSUxR?=
 =?utf-8?B?ejM1UlJ0b25PM3RZZlc4TmU3ZmVCVDlLUWNMczVNN3VLVDJRMmZId0wzVEVD?=
 =?utf-8?B?YkxVc3NNUHdQeVZTUzZVbmNiWjlCVGM2VjZMYUhXQURnalNFbEh0WGdNUVhV?=
 =?utf-8?B?UzRXcUlqQ29JMkkzbkQrWllVVnc5VnFYZTZTZ3h0cU5TOVM3d3hBWnJjZDBu?=
 =?utf-8?B?Y1ZvSFk1NVRTejFReHo1bUxMNmduYUdHOWdudXhqSlQvajBrb3ZseStxWWhV?=
 =?utf-8?B?eVJDeGZudkRsRENqaGlwa0l6S1dFMWpSeWFaME11OUM5Wk5zTzhDUEZmUU4w?=
 =?utf-8?B?YzJXSDhoZUNoTEk1U3N5eEVwU3BtRU05MVVWdllrVnovR2laTzFmbGVSaU5h?=
 =?utf-8?B?TDZFYTFwQWhxak5zV1NHb004a25NbGdQOW1QcU9yRENQbTZ2SzFZQURyemhN?=
 =?utf-8?B?RStKN2x5MzdiNVhiSEp4cFZ2VmVGYXQ0amxsd0NtWkQ4UzJEcGZ6d2RTdlc5?=
 =?utf-8?B?cVpBSmhQSXZORkxORG5WRmhuWG4rTVZBZG1nMjhXUm85aC81c1FWVzh0ekFR?=
 =?utf-8?B?YzQvKytnalBVbXZwa0N6TkRlNkRjKzV2bUZ5ZzIwSnU1RWVLNzQ1a1F4bUJQ?=
 =?utf-8?B?aTRvb1BpMXhPOHJ5a016RFJpYjhnaTNjVHJXbFZsN3NvSW9VTW41bW41OGVv?=
 =?utf-8?B?RUhxVjRwY2N3NTdNYWI4RGlNOHRTQVI2MUwzTllzTWJMdzQvaENIbkU5dXBY?=
 =?utf-8?B?dWxUV1lTNjB3QWRYY1J0bWN1UnJhd1JyU2RsaE5hYlZITGFFbDJ0YVRvTjZL?=
 =?utf-8?B?YXNLUkdTV216QnFKWEpZeXlLcXgrbUJQUVhZYTl4N2poK1p6Rmkwb3dmUVIv?=
 =?utf-8?Q?GDvdyI+kvZx4ab4KXQ/WV5FwUw+FCUGEoY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe47a5f-a499-4584-b701-08d8c12e2f10
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:38:57.6745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZLfgCRcQ/WwUTZgi1s3bUvK6bgCPS8pezRh6vVPIy3hgO4StVzfRIqpaq11l02j6+pVxqmxUUEJipnqXcmlxRkx/rSYB2j3eK+Simrg6WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------8B1824746930235FC51F53EA"
Content-Language: en-US

--------------8B1824746930235FC51F53EA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-20 6:10 a.m., Leon Anavi wrote:
> - Build modernization, remove distutils, fix metadata,
>    build wheels, CI to GHA
> - Fix for CVE-2020-14343, moves arbitrary python tags to
>    UnsafeLoader
> - Fix memory leak in implicit resolver setup
> - Fix py2 copy support for timezone objects
> - Fix compatibility with Jython
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pyyaml_5.3.1.bb => python3-pyyaml_5.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyyaml_5.3.1.bb => python3-pyyaml_5.4.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
> index 8cf909304..e46b608f7 100644
> --- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
> @@ -2,13 +2,13 @@ SUMMARY = "Python support for YAML"
>   DEPENDS += "libyaml ${PYTHON_PN}-cython-native"
>   
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
>   
>   PYPI_PACKAGE = "PyYAML"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[sha256sum] = "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
> +SRC_URI[sha256sum] = "3c49e39ac034fd64fd576d63bb4db53cda89b362768a67f07749d55f128ac18a"
>   
>   RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-datetime \
>
> 
>

--------------8B1824746930235FC51F53EA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-20 6:10 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210120111027.12947-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Build modernization, remove distutils, fix metadata,
  build wheels, CI to GHA
- Fix for CVE-2020-14343, moves arbitrary python tags to
  UnsafeLoader
- Fix memory leak in implicit resolver setup
- Fix py2 copy support for timezone objects
- Fix compatibility with Jython

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210120111027.12947-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pyyaml_5.3.1.bb =&gt; python3-pyyaml_5.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyyaml_5.3.1.bb =&gt; python3-pyyaml_5.4.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
index 8cf909304..e46b608f7 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
@@ -2,13 +2,13 @@ SUMMARY = &quot;Python support for YAML&quot;
 DEPENDS += &quot;libyaml ${PYTHON_PN}-cython-native&quot;
 
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d">&quot;file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6d8242660a8371add5fe547adf083079">&quot;file://LICENSE;md5=6d8242660a8371add5fe547adf083079&quot;</a>
 
 PYPI_PACKAGE = &quot;PyYAML&quot;
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = &quot;b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d&quot;
+SRC_URI[sha256sum] = &quot;3c49e39ac034fd64fd576d63bb4db53cda89b362768a67f07749d55f128ac18a&quot;
 
 RDEPENDS_${PN} += &quot;\
     ${PYTHON_PN}-datetime \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8B1824746930235FC51F53EA--
