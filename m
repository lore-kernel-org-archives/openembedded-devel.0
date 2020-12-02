Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.41])
 by mx.groups.io with SMTP id smtpd.web11.5462.1606918276737434694
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:11:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UtwH4jCP;
 spf=pass (domain: windriver.com, ip: 40.107.102.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPE10mn/nun4N28UY1FXic+0gdzyKLhoSm42QH1/YcTvjRAje7VMna6+I/Is1v7aNfrzZ441GQaGj1jEAdzDQbCRGGRPiVq36hnIaLucPp5hACj6ZKSkqBe6C9j2ZWQOAjJhtW6/jRnEvdLjDozH2SgFlC94mGo9jBlP0bXsgic8pi+HBgo+dQEKWWcbUvUqVYias7y0LXofaBDIFzFYIarZXNx2IO0iU8lfxB3JZavD0+q+O+Uasr9ZEf0TlVYm5VGbZ547zY7KWmIyjijAyQO3g9RaTssznxxF9+hbhcGvV2t2zi0uqTmFUmDCSoKoXt2ki1yNhKUf5Y7SslzT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTYE006n7hBvkRNkJMNRdin8ZcCR/YS1NypxJk4o9ZA=;
 b=IWs45KN6BBEnoDPZe35HUJsUsWzx6HsZRCpn9pyhBHJzkpqlcQXEcWDE87DKtyBM7hxnnendOoKseS6Q5oEH/pkQI4Jl4HfYKExZBH+nRrJpfL/HWEv4MehSx91uU0Oy47fnZJ36vQHX9uNV6GhviM4QA1gSV/B5a710AeFANFhZLS8ExbiL23jkC+z9r1Ftsd82uh6Xkdq6L68g/lakVXldd3mBrMzWXPAhFZpd9gnzJiP6fypCW2smWbgpi+HVIkwNxrIrIhEHtKqEiuMrasaz2X20eDvkQRVAhTMH354OfLd9ytj6l1XSdg3UuviSKq7MEP01IlHGsH7GXD7xpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTYE006n7hBvkRNkJMNRdin8ZcCR/YS1NypxJk4o9ZA=;
 b=UtwH4jCP1bYTMOenWSdWvZwyl8b8/6dVgk1RfyuykILpqyYz4/r2cpidxRe1gsAMPRGbt3FXFwChrFcirF9dg8uqJf+77hNjYRoQB4u7A5zOuLlFHE7nAaZDBFURlvCCISnbYNVp9Vr3D0w6axb7iMd43U5vzkOvFYhDonexJ/4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:11:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:11:15 +0000
Subject: Re: [oe] [meta-python][PATCH 12/16] python3-importlib-metadata: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <3b6393f53bca063d62b25506af84f6645abcc6e5.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <77a5519d-1798-75e4-135f-2e18291a9810@windriver.com>
Date: Wed, 2 Dec 2020 09:11:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <3b6393f53bca063d62b25506af84f6645abcc6e5.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:11:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff205573-1037-4a97-95e0-08d896cc21a5
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48646F7B55DF01B045910CA69FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5LBnct87bcwnJ2YDWU+ZUm9dKRcgqNp8aDpzX7Z9WQ3bFyCoaONQoBXIOpzLdvkCZrfxdZG2XbIgO++nVmvOajIcJFVvuFe1L5F9QuX/Rqyc0fUfmA7vxQJrSk/2XVDiPMZgUFQBhjNnIF79hRmOMawDMJ2jRLG52kzZvFfEiOhVcYlBjA6wtyhA6MMtCFlykW9Ia2z+EKBlxqH2vanHABj6pQJmTGOlb2mbs2BJPgtT8cGBl9YSeqJP97yz8G2eFNMaNvVLbU+Co+pf7mrz12urRQX6K/o66CxKRDIRjnyM9Z90Bpo4ktg+selwGuCFjNNFLrXgA8TKSMDtQXg1oGyAyH1JWL5tjyQYUOO0u2EJG+eqFwRyqj7PCoKmRrNBka0mj+jkuUWYAp3RuVSPOTTz89SUHi3B/PSrWKFLaEBw0fYePiiNmUmVQVkjNOzCfs3/us0pb1yy/SUaVI6foKd/v95+lf63bzwUTh4Cb6Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?a0dtMUpKVjZBSFJnWXNJR1BRSC9HYjFSbmthOFVGRDJEUnBkMG1KQ3JaeWxh?=
 =?utf-8?B?a3RUN1VRNjROYlNkQ2p0ekF1VUxiM0JRVWdvdDZ3ckVZUS83NU1PNkQ1bDYw?=
 =?utf-8?B?Y1F5Z1JGZmM3WTkyUGVtZGprbXpiWTJqeG9MdmxHN0pzbjZEZWpqY0VhSGxO?=
 =?utf-8?B?aU1jOG13NFJOM29NbjNyWmlaRjdQU1FZZnkxR2xRZUFrclNqaFdKWTBGb2Vu?=
 =?utf-8?B?aWl3QlVlSEhmOXZkNXlZZU9EQmgzcGZUa2FkUm9YcXNhSHNkZldjajB0dmtO?=
 =?utf-8?B?OGZVUUZMMDlpb2VBeU5jSC82RWIxaDZTaHJCczcwNjB5MG94ZlNrU3V0WUhk?=
 =?utf-8?B?TGlzOE9GMDF3YTZydmFCWU9qaEwrYU13UjJESkJlY0hzd1UxUUFmZlJVSGxh?=
 =?utf-8?B?VUVDdUxsMy8ybXB0STZCa0pYd0lnRUNwdkVrcTBZSDhKcEhHd2tGVE5UUkNj?=
 =?utf-8?B?aHJpaXZ0Q3FNS2IyelpoRDU0aWVxaEU2RHBVSitzUTlkNXJ0VVZ0Q1JHSzlq?=
 =?utf-8?B?YlQrMFFYaXE0dmRSM0tvMHo2VGlSMGl3TG9Kb0FMRGs1VHZNaW42TU42OGt3?=
 =?utf-8?B?Rm1oRlhhd0N2Tlkzd3JKVXRTeDljN01haVpTczd0TCtXVXdTZEJuSWtIWnpy?=
 =?utf-8?B?bXdFekRySUtJeWdUenVoRXlvK1JCc2toNW1UQ0NTZ0lvdkJnSDZsclByR1Jo?=
 =?utf-8?B?RkQ5MHVTM0VvQ0NZRlYva05Pc09ERzE3TEZZU3I3b3NSbXBJNzJwT2wrTzlz?=
 =?utf-8?B?VUFEVDQ4RU1UdGZYVXROWW95RG4xYWNQY21CL3FmTGFJM28xTUdzSkRXaW9j?=
 =?utf-8?B?M3dPTFRwSTJQendFeitITkhzR3JQTGFFM2ppdlNzU1RScm95N0VhVHVsRDBI?=
 =?utf-8?B?UTd4QTg0L2Mwbkg4Ym4veXN1N0RsckJzK0Qxc1ovZHVFK2luWlRzaVU3bGNk?=
 =?utf-8?B?WktRSUFtbWtDbGIwaGsxdldTVisrekdtUXk4eUE0SUVyYnpMNmNrdk9TUDU0?=
 =?utf-8?B?NlJySkF3WG5UYUQzZFVrUFpkcUVtTFlRQ0dHSFJYNTdIcnRIc0daYjJ6STFa?=
 =?utf-8?B?UGdGVWVjVFBOWi9ZblNCcWFXNHJTSS9RdWlsV0ZmMFZTbnFOc3o3N3QzdFow?=
 =?utf-8?B?R0pXU1djVWdFL2pzc09VSVhybnRWUDFRekZCNUkvQVJZb0UrcE8rZ1pPMVRK?=
 =?utf-8?B?L3lyRklxdDN2QUR4elRvWHl1YnE3WC9rZE1LcHFhV0MzUGxCeGtVVFRvTktB?=
 =?utf-8?B?RnRXeGt6b2R1K3JnUW5NTXM1TGdQZVhBOUdSZTdnZjBUT1l1Sml1cVpvR0Nq?=
 =?utf-8?Q?lOoau22pjQez7uzCC8/ZrfGc4ThoL3Xb+J?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff205573-1037-4a97-95e0-08d896cc21a5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:11:15.6898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pm+7I2gayaM3fi3O3+OgJKwxPcXhNFGN/mfuKJhnByTJv88rUnIW1jHt30TsUXXtW6/FGFDXfKdnyCA0a0hLPfqmj5waYJwzOQbKUpzIwf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------3242C29DEC3CACBD815D44C8"
Content-Language: en-US

--------------3242C29DEC3CACBD815D44C8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-importlib-metadata_2.0.0.bb | 18 ------------------
>   1 file changed, 18 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
> deleted file mode 100644
> index 325a41c22e..0000000000
> --- a/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION = "Read metadata from Python packages"
> -HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
> -
> -inherit pypi setuptools3
> -
> -SRC_URI = "https://files.pythonhosted.org/packages/56/1f/74c3e29389d34feea2d62ba3de1169efea2566eb22e9546d379756860525/importlib_metadata-2.0.0.tar.gz"
> -S = "${WORKDIR}/importlib_metadata-${PV}"
> -SRC_URI[md5sum] = "3dd91821c930a3c3633e99a7025aa9c2"
> -SRC_URI[sha256sum] = "77a540690e24b0305878c37ffd421785a6f7e53c8b5720d211b211de8d0e95da"
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> -RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
> -RDEPENDS_${PN}_append_class-target = " python3-misc"
> -RDEPENDS_${PN}_append_class-nativesdk = " python3-misc"
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.0
>
>
> 
>

--------------3242C29DEC3CACBD815D44C8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3b6393f53bca063d62b25506af84f6645abcc6e5.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:3b6393f53bca063d62b25506af84f6645abcc6e5.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-importlib-metadata_2.0.0.bb | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
deleted file mode 100644
index 325a41c22e..0000000000
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = &quot;Read metadata from Python packages&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/importlib-metadata/">&quot;https://pypi.org/project/importlib-metadata/&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e">&quot;file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e&quot;</a>
-
-inherit pypi setuptools3
-
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/56/1f/74c3e29389d34feea2d62ba3de1169efea2566eb22e9546d379756860525/importlib_metadata-2.0.0.tar.gz">&quot;https://files.pythonhosted.org/packages/56/1f/74c3e29389d34feea2d62ba3de1169efea2566eb22e9546d379756860525/importlib_metadata-2.0.0.tar.gz&quot;</a>
-S = &quot;${WORKDIR}/importlib_metadata-${PV}&quot;
-SRC_URI[md5sum] = &quot;3dd91821c930a3c3633e99a7025aa9c2&quot;
-SRC_URI[sha256sum] = &quot;77a540690e24b0305878c37ffd421785a6f7e53c8b5720d211b211de8d0e95da&quot;
-
-DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
-RDEPENDS_${PN} += &quot;${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2&quot;
-RDEPENDS_${PN}_append_class-target = &quot; python3-misc&quot;
-RDEPENDS_${PN}_append_class-nativesdk = &quot; python3-misc&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3242C29DEC3CACBD815D44C8--
