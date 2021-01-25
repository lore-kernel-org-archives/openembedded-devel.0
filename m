Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.73])
 by mx.groups.io with SMTP id smtpd.web09.35462.1611578030060442983
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bKUyWQw8;
 spf=pass (domain: windriver.com, ip: 40.107.70.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxMtLLXJdHC8FhURXkpb7PfQDHE/pCIfN4h4In+cItxa2H4Dj9GAFMSiZdREWE6ivWm4hY9A9nA9wzG1fbnJHxwjDHIz12grZB+U5SCbE+cIaMZNwRKcqrprIuRQTRMZEgqLTnGKUZZ0st5C/l1HO8iYGGGlAbDWybyvYy21LvXrIbHK3EG+uZyLQpOs5pp6X9cFNLS/Xvv5cIvIIfS4Q8QEgeGQnDUmTbDVv2TSj9QHgiUAi/52abVmSO7fO3QrbeCOHJ2FnIkkAEii/Z6+oCo0vmd5flFVZ9jKWodEtvOv5w0QztEBTuFBVrQdBoOpGPVWAMtuh1Cubiq5mxvS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eu1m/HEo7/8h8Izz6mimU8GaRVqE+/HrLwg0Qg43yb8=;
 b=BOoU8AcfI2ePB1/9Im2KLs2NIDQx6iXsBSCpVU4XldzzwCAttnbp1FZJpm80EOHNk0dORFUNxMW4Cn3ytIDtPEWWiJsPNAmT5AsIyBcUvkGcfSb5x0jTAlSMvkdrVBqKrrULu89oLceNTYlxrrzNury1kH+mCRfqMOoG+1sz+KXV2z3UqtI18nqfjNWcAc6gZu8wT1XytMEzpWIljuSMLj2xgRzPnm7ckmD9UkN3xLIwr0u87zzhMFIMr7GcLazlgDXNORwDwsLOGg5xavwrdahwxC+ADBCLYRuliyaGnMDkNz6PiGwtC3aR9DenxAq6sYYEC+08K1FG3wjqCQegng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eu1m/HEo7/8h8Izz6mimU8GaRVqE+/HrLwg0Qg43yb8=;
 b=bKUyWQw84CA7KGHt5FyrpHk3AgQwV6ZhX9A6VoaaJYd1/6fLRIQT2GxpPQF/+u5sLVJ4il3L0DZaPNlJlqLYIHniYBcIuhNxbdePYjwg5fF9P5leyx17q8GQPTXeN9VazzVWGFe4GrKtSpMMhogpNsyFtbgLU+alrGTqxz0YNUM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB4128.namprd11.prod.outlook.com (2603:10b6:208:139::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Mon, 25 Jan
 2021 12:33:48 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:33:48 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-pyyaml: Upgrade 5.3.1 -> 5.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <59e6dd74-44bf-7a51-2857-26a79e343175@windriver.com>
Date: Mon, 25 Jan 2021 07:33:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210120111027.12947-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:408:fc::29) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0084.namprd03.prod.outlook.com (2603:10b6:408:fc::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 12:33:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61dda8c6-7594-401d-ce98-08d8c12d7697
X-MS-TrafficTypeDiagnostic: MN2PR11MB4128:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4128B9C9B76F1225AB83F0149FBD9@MN2PR11MB4128.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Ir0q+QbzYkaogJY8Pb+rtKMgQt3ijpp7deKlq68gYZNj2vyK+4BiOoBEXl0qze9uVXwL1wCxWO5G2Tp38Kn43mJrZwGI3Rpcqg5IR20FhTDtuF8EoABtvCvMWy3KgwWAFIso8LrzexVwQXeF3QEzjwGpxh60Yx7CPh9QLp0lBFYsjlM2EpH6jrO1Kv1VoHRWEi1wC4Evk8IAQKQwiuTKFp9p7AZDueWxYeOO6uXqPSxciRbwqfiuLw2ca62NZrHX8OzTKN0nau0LhgegJsZVjwQB1lZBOWVMj+WNQ2PXzNe0A7LkFNVbxCSfYQzTBaSELzyx72krHAM2efFq8GvjtDIzV+vWECNT76AbjDn25jYLYLnZCO+n3NCyeXhhBMZdsKce9zm0RIm30LRHRFbaDvDWt6OzH1dOYCRpchJp/v/4wgrfpNMSUYw+uSy+fEDW30qhYTtVClJw04ccZsHvgZnIQSqLR9GoqI+LCGDoYjD+7wpwOOztG9f4rb/AvDq6NZRddgHd/Vv6X9yvEDftm8ToDrtF9GLyN0VbUwn+LmuMmL+5qUvy02Lnc40Tdr53SgLX/HhDHH837gJQUn9dsEaJbNd3WPqlkMuMJYTo9ITtOgoTM4jv8KqWWQn4kSfgvD4iqSOui6zjyebheTdFEeRruvnpafYQFLiyltv9J/blJNy0DxM1/mXlVUnZWoh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(366004)(478600001)(6486002)(2616005)(66946007)(26005)(44832011)(5660300002)(52116002)(956004)(33964004)(83380400001)(166002)(2906002)(86362001)(8936002)(16526019)(316002)(186003)(16576012)(8676002)(31696002)(31686004)(66476007)(66556008)(36756003)(966005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TVo0QW9WeENqbEN4aXRZRDdWVFl6ODJsdCtRSnUvS3hQWW5JRzNzRjZwNWM2?=
 =?utf-8?B?eVJwV3l3aEU1Q2RMSjRJV1hBQ1JVK25SOGNwZUJUd1haZ3RQWUdFeUFnOUlJ?=
 =?utf-8?B?T0RXejVUREZUdXMvV0dNdE52YXF2dldXcW82bkllUnVaU0lpV0ZjZnBreGNt?=
 =?utf-8?B?RFFtMXNkVDRERVpEbEhsalViU0JISlpXZ3JDdWp5eEt3bEVYSDJQUXFmM1FB?=
 =?utf-8?B?aUErSmgyN0EvOHF6WSsyQUowdzJIc3pualhBNkk4MUlPVW9WK2FCV2JyVCtV?=
 =?utf-8?B?ZHY0K2NsZVI2QkNSUEMyVHFrZjZ4eitTOXk0Q3JYb1ZkTXk0Skp2RlRZZmdM?=
 =?utf-8?B?SmVkZ1lybjI5ZnVnZlpIdnI1MEgrQWI4U2ZZSU9ONVkzc1pOV05oUXk2ZzYz?=
 =?utf-8?B?UERlZHBQdHZqcVYraXoxazR1b0NkZkdoaVd3dHh4MGFqeXRSVjNhbjNvcnlW?=
 =?utf-8?B?Si8ybE5KQWZTSzZLdUl0U0UzUkV3N1haUWhhV0Z1Q1ZUSzhUdjZFT1J5SElu?=
 =?utf-8?B?S3BNejQ0ajFJUkVxR1V5Zmt4UUxRbEROa2p2R1ZYejBIcVY3Z0EvV1hKSk5C?=
 =?utf-8?B?ck5mclFOSTltdmFVRnNzc0gxMkpQZTN0ZXErM1JlcmJoY3hxZllNbFREVmMr?=
 =?utf-8?B?Yjd0NGFCVnlyOE95ZEl1cE0wdkpXdjR1YXFGb2gvSjY2c0dpM05NTnBhOFha?=
 =?utf-8?B?NEsrVWR6N0VYVzFZeXlOVUVzN3NBL0pKbWdaQjU2WG1RcjBSMDRnSVRpQTdC?=
 =?utf-8?B?SHZRdzZrV2dLSWs5Q1V3ejJKUndPZDExK0E0Mld4Yk9BUjlGYm8wN1pXV0hY?=
 =?utf-8?B?Z0ZWNmVPUC9QZ2RuL2dlSzA1a21hVGc5SmFhSGJjNHNuZ3ZNZTRRdEJ0dU9P?=
 =?utf-8?B?MGxtNUpLcUxOZG1Sa3FBWkl0VU9yYjFxSGUxRGJIUzFSamZSdnNvYitEQ25D?=
 =?utf-8?B?RG5jSnJsRzNqRmZsRTZDbDgyeUpaMWpPN0pTN2RWRWtwZXBLYzVvN3ZJelF1?=
 =?utf-8?B?R0JwTFlsL1YzdlZ1NHg5N2x5YmFuVFc5emhHdVRwaHhyRkhMUENlYVIzSklQ?=
 =?utf-8?B?b3JzdFpsVExqNUE1WTBrdWZuTDBVT3g4eTl0ZGRreUN4T2JqQTJzVzBWMFAw?=
 =?utf-8?B?V2tpWnZDNXBTUC9pQW1GMHNKVlV2dnVUVk9IOTczM05yOGtGeG9LMmpjbzBW?=
 =?utf-8?B?ejJMTC8yQU1JQVcvMkk2K3ZCU2srNGhBa3RGSlZEMTc4eEtlbitBSGZlb3Js?=
 =?utf-8?B?VzZvc2NNTm1QY05aM0dKRUU1bmt4bkw1OWJvWisyRmxTVm1IM2paWjFFZzV3?=
 =?utf-8?Q?BzXOsO9bO5f6w68PGS8vymTj1k3DA7ECoC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61dda8c6-7594-401d-ce98-08d8c12d7697
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:33:48.3202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJ/MM3ZHSKJJZ0v0FjEWpvao7yV0BmWWH1/SFB96BAJm4rpp+3ihSvbw6EFiZqWijki4Pvr/v1vAgrDGrLEypn/ydDx0A1w2EFuIRIeqQ7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4128
Content-Type: multipart/alternative;
 boundary="------------0DAB7660DEAA5EC7BD430C6B"
Content-Language: en-US

--------------0DAB7660DEAA5EC7BD430C6B
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

--------------0DAB7660DEAA5EC7BD430C6B
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

--------------0DAB7660DEAA5EC7BD430C6B--
