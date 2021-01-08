Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.41])
 by mx.groups.io with SMTP id smtpd.web10.1929.1610121984651519863
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ojxo41/n;
 spf=pass (domain: windriver.com, ip: 40.107.93.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2ElKCFJOOFgHQIPYjRL4xJ2ibmhK9OtwvgeoVk1u3VH1RB9kHYDHqHNPKjkYd4eg4JgddG9w1bkUuaUUJ4U7XfKMpighQX+zQDat3E0VQnxbKM+HfNcYbXd3QRDLCLUZpHF4mU6BsYYdebsl83/HdZfHMb/Cn1q1XcsCPOIdnCfMh4sOnS1ThFh3tafOEW064f7PxZ78wDLI9DbDA0Cnok4xZeJOXle7PJgJU7Lkz0ClaonCuIhwOfey2gLLrzGdyrzubDzmvzzC3kQwmArdaFOPOfrhrzV9JBOMRfCk4AKRw12E4s2/4pFL2oKHxIKq1g0JsVXY7IwEiJ8JEkYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOBsboovgKmSSqkSlNjJa+Idi0IOht7qhwaaecM/0wM=;
 b=Uil8Gy35pXu2mIXnYfV3cXvClL0cATKPWZOQLr+Q5G5dnX55XrrPa+ZLCDrLFJnfHA8C9pqzdfqaIkcQT7JwYoi85GpRSRMt2vpKclweaOaB3qj70bp/JCFPDWUwYdT7Cw3lhQr8Iso3Rq06OJlqbE0I7AN1u2J9xnkHsqh51AYg/xFmwNpD9MXLWOXh3Ht/jxKxezxzSyzyLJW2YY4sp3zndSYa3s3Ctg/fJM430Q+E8R3ZHcvfiAN4dWU/5mUiShMuD6gLIhKfVa1L2LDEp4sDd1YO8Hwf6qT8EWEg/K/YxFKMoZ6CuUba4fupobRzDhtSl3tiqeHW8Ub/CkZKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOBsboovgKmSSqkSlNjJa+Idi0IOht7qhwaaecM/0wM=;
 b=ojxo41/n3rnMl8/VDJyZ0rOz+Gc7joguEE1/vEXxMotkeGTlWWWsZp10mr6F3J02gUv3St7pnkRz7pjV8+qP6iyLfUcoA6cmPsACUQXm2QCRTn+snkdvm+b6WTUNxleJQwRA8MvgVQXz7PsGzTLThIvNTLSnO5uEWrwKGYANfq8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:06:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:06:23 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-pytest-metadata: Upgrade 1.10.0 -> 1.11.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
 <20210106220702.10483-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c35b94c4-8582-966a-1d97-692e87b2c715@windriver.com>
Date: Fri, 8 Jan 2021 11:06:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210106220702.10483-6-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:208:160::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0021.namprd13.prod.outlook.com (2603:10b6:208:160::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.3 via Frontend Transport; Fri, 8 Jan 2021 16:06:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e86afc4-6f9e-4111-2c7d-08d8b3ef587d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB489631DA00C25B168F5106AC9FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+VFhO9rbGVp7ZopBZLoPIb2cm4NYWx4O8Guty2kR8lWpK7vp3uzs0ZpRxjcKOpJSsagM0NYff8DXWYBx7zOuQTMBGEMjFj66xdXR4fa6M1gWgGNMqWDnB2SDI9JJ9zBeVXy8g1AMdMEXBp2m6ZRfOiRJa0vcn6zKE4ZljgUr1/FgaJ67v2IuK8v1VTjkLtrxrkKYZSRhgqyRKb6zS5kryW4CUHJIJG8+BH3rA0PP7YjlfC9JQJ8yx7OQ8cdXab5de2xOYRg7+rDo9escnemwyMd4bySKqfjQnO1behEi+TsgkJuaXZJoW4DEUM+r1SXRA35IjLSD45yh5GnGSmtRYbglXRUg9dGm0KRtPUgYuuOihxlkimTLd+CB9sp3974hzvOQoC8H03rOeYrpZCPbq3XE6gnw6WdZ0gePnhgK69Y/ovxobJYM/QZNoTTYONXwhc+l8QrohWaId1M6anq+NNjZuGMleHLzOE8bNIOUoqbJiwvUoxAM1aM+LUz//U39bYLonYLQKMf2MsWBjm2GJwsQURhnvyMPfSayszNC2lTmCff4N/2iGWZ4JMOyymZL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MWFmYWk3T2d3WVAxT2JQMit4OWVlUFoydXJnUWxuRnpQSm81dTlRcE5yTGR1?=
 =?utf-8?B?MXFjSm9IbmJHVVJyMzU3cHhrM3E0aWtuM0RsNUlwVHh0TG5CdnRWOFBMb2sx?=
 =?utf-8?B?THN6RFdhbkE3NEpPd3VkK2R2cWV4R3Bnd1F1VVVtU2h3M0xMdU9KVURXTE92?=
 =?utf-8?B?Z1dJMlNaVUR1K0ZkK2ZaQXZybWpxQ0FpNnFrNmVTeWNoTXY2d0x0NzlHL1pK?=
 =?utf-8?B?dTMwOTdNMmNPM2cxTW8vU0h6TmtHYzdCTDhCK3pDT2xkU1BGSFd5M1dEeHV2?=
 =?utf-8?B?YXdUTk02RE9pMTlJRGcydnhkeUFYUEMxblZHYnV0Y2ZRdDlwb3FNOVMrOGlz?=
 =?utf-8?B?OGlCV1JEUE1tdjdkQVU3TmZyTmlqWFc5amJtT3JCUXRFUTJVUnV0M3FVQ1dv?=
 =?utf-8?B?R2hwUVNPOFNtWjZyRjZTMkw0eFA0bmFRMHBqUWJEWitBTkZzOHhQV05qd0cz?=
 =?utf-8?B?MlRLaWxrTTFDVTZQbjJzUWtmZThWWEl6aExEcmc2djRvb2t1U3ZTYlpscDBQ?=
 =?utf-8?B?b1VmYlpqUFFleFJoUkFRMjdJZkg0YWJNOVloT0UvOEU2ZUxFcVdIcWRFWDdv?=
 =?utf-8?B?SXFHRElRV0xSdGJQZGsvNnpnTUZ1UFFDQzBSYVpPKzh1SjcySnRxODczdHF0?=
 =?utf-8?B?Wk9DOC9ycnZqK3h6T2NZdjJFYlJUOTUxR0ZQdlltVFlGWjZuU1d0eVcvdXV0?=
 =?utf-8?B?TG9leVhVc0lRUWk1M25nOENZKzd6MW5nUlpSYzBUcHhFNUZFV1kveVJMZFRm?=
 =?utf-8?B?MU9OYUViMHA2TkFZKyt1Wk96MkxlamR5enlSNTVUYmdOanJaZVRrblU1empR?=
 =?utf-8?B?OHJ5U3NZRjgzUHZaR203TGYxRkFhMHluaTJoOHNmWjZ1TEhqcGkxcXVqcy9E?=
 =?utf-8?B?WFJ4aWRpazdKbkYra1JOdjZIQ3ZleUxUdW11bU9oREJ0VUFyU0hNSW5RelRD?=
 =?utf-8?B?MVlHUlFOdWlWQWN2eldJN3pPUHo1QTc2M0RjS285blgvSklPSXREUmRuNjVn?=
 =?utf-8?B?a0FWTEM2Q2wwalFuWFp0VDJxQ2xnWUdmU25POEIvSTEyc1pWUmE1UTZDV0lR?=
 =?utf-8?B?d3hocUZOZWplSGRsbCttTEhYNUMyMksvMkNnTGNGdnQyU3I5TGR5d2tZZHRr?=
 =?utf-8?B?MEgyRmswUG9QazJhZ0ZndWdwSVZQR3RHaFBaZW9jeWZxYjRUUzRQbkNuQmpa?=
 =?utf-8?B?c0ptVjM0S3VzT0p6aGR0M2FIZnZTWTVMZHJGVktpTzV1VGVqZ2dpYm9WanFh?=
 =?utf-8?B?U1FFOGx6RGZnaHZ5M1RxZHVKNFh6TXp3dVJSSjRzY3E5QlFwbENickQvQk1S?=
 =?utf-8?Q?MZNiGZuxdsWvgUactEPK+rN14azAlHqyYd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:06:23.5159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e86afc4-6f9e-4111-2c7d-08d8b3ef587d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLfcowWviIMFe8WdMi2aoULMKZ0NVtokfda8XeWxF3QN8XvJvilk9renuSETKekWGDyx1mXSQE78/sFqj2pqKjd6AGhd19P63hTwgmP0jAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------A04E9804987E661B6D711BF1"
Content-Language: en-US

--------------A04E9804987E661B6D711BF1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-06 5:06 p.m., Leon Anavi wrote:
> - Provide a session fixture to include metadata in Junit XMLs
>    as property tags
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...st-metadata_1.10.0.bb => python3-pytest-metadata_1.11.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.10.0.bb => python3-pytest-metadata_1.11.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
> rename to meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
> index 70cc98f294..a1b62d16e4 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
> @@ -4,8 +4,7 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   LICENSE = "MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
>   
> -SRC_URI[sha256sum] = "b7e6e0a45adacb17a03a97bf7a2ef60cc1f4e172bcce9732ce5e814191932315"
> -SRC_URI[md5sum] = "4fcf9764e6210c4555411fce8109e7cd"
> +SRC_URI[sha256sum] = "71b506d49d34e539cc3cfdb7ce2c5f072bea5c953320002c95968e0238f8ecf1"
>   
>   PYPI_PACKAGE = "pytest-metadata"
>   
>
> 
>

--------------A04E9804987E661B6D711BF1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-06 5:06 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210106220702.10483-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Provide a session fixture to include metadata in Junit XMLs
  as property tags

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210106220702.10483-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...st-metadata_1.10.0.bb =&gt; python3-pytest-metadata_1.11.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.10.0.bb =&gt; python3-pytest-metadata_1.11.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
index 70cc98f294..a1b62d16e4 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
@@ -4,8 +4,7 @@ DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 LICENSE = &quot;MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132">&quot;file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132&quot;</a>
 
-SRC_URI[sha256sum] = &quot;b7e6e0a45adacb17a03a97bf7a2ef60cc1f4e172bcce9732ce5e814191932315&quot;
-SRC_URI[md5sum] = &quot;4fcf9764e6210c4555411fce8109e7cd&quot;
+SRC_URI[sha256sum] = &quot;71b506d49d34e539cc3cfdb7ce2c5f072bea5c953320002c95968e0238f8ecf1&quot;
 
 PYPI_PACKAGE = &quot;pytest-metadata&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A04E9804987E661B6D711BF1--
