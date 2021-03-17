Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.73])
 by mx.groups.io with SMTP id smtpd.web10.90.1615992841200507274
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 07:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JXl4Y+EF;
 spf=pass (domain: windriver.com, ip: 40.107.94.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwqnNsqp+hz/rm9q9SCzYKULkrwJv//42abfMGKZLbh/25+gOA8qMmWmkEaqJpmpAuT46gHsCverHcf4jYoAF9C8tsR3PkyMeue41BTGewOu84OFTSuSsHy90+g5EnKNQIaCHASQldN2rt6MwYzA3w1W0QohCFH0eis+U9eHCw8rixoKamqDr7AnQ3qvMwkSFmvcPo6cLrTDymEtaKJ0jhI+7ysPLKYyx2TaBYXmxJqKVUH/z2jwYkoQwroSJ7xj1JhoKJ8DadRpdKFRQ/4q6qfo791WiKP3YVX1IxeRSXSC3ZEsGAFfth+gE8dnQf8uRpsu97tKcwRGkWJgpmWAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nGsXuQNXgYOmeGy+MqF0kzsd3Of5ebAMa/4cpbCBWM=;
 b=nTZKp6RqWEdKXtfS66j2GMURCPBgr+rQve/2MXq5gztQ77YYSzlV8bQrA3h8hGMcIeOWdOuWoNrYVDFJC2eYy1DxSNF2xb7wmdLJEYzHgO4pXrN2CXMHXm/1Dal4ptSkN5T7Minyosbp7+H4slyEIPK5uO7mzWOlKvIBioSlB20U5YPPmyuAfyhCAcRiig7hpqmLuI1xJe4Qp+RZF8N2hOpR89xtQLrhy120i13D71J+GfXGrEuD+m4LGmKs5UBOkJKAHBeDBcKh0tndMY3KdhTvDNK/kNIqpUCYDDNgBIPHviobM5mGBp8JkMFKpsPhW8qWs0a6/5LEMMKwRyy5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nGsXuQNXgYOmeGy+MqF0kzsd3Of5ebAMa/4cpbCBWM=;
 b=JXl4Y+EFQa5AvYdVfKZ2QgJnbVUqlBJ57nPTrDNbd1L3D2GMlpB2BupyvdrM7kkNVXvGLOu3VQ9wdpMq0DRr3xYPgSPDn76C5pVayfgG4wfMMAIKQny+2rS21BBpx+TYXjao+G3LMc1iRSq+BFWF/+7QWXbb6LLk9Iht/IMLxlQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:53:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:53:59 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-autobahn: Upgrade 21.2.2 -> 21.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
 <20210315084727.26812-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c2910f62-f591-eedd-13b9-c42315bf9ac3@windriver.com>
Date: Wed, 17 Mar 2021 10:53:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210315084727.26812-10-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0482.namprd03.prod.outlook.com
 (2603:10b6:408:130::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0482.namprd03.prod.outlook.com (2603:10b6:408:130::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:53:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaf00f58-812b-4466-7647-08d8e9547f60
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4784:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4784AC3A4E576679F8E50F1B9F6A9@SJ0PR11MB4784.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H5yHAv4QUqp2mHwRvUDuYZa857dK84QPBhbNX2TVwiAPoZIBwFfEI1vpEJe8tpRXH7kJyjKCuBup57vLZe2QG+U6hzkDHY0c7uEaZHUGqk8B3O7O/SabcbjEGqKVl2gcp4S58P/MZMkwytYF91txL3auhc1c3xQQmJhBV++y2QD2ESqxmGEwWF6VhH5B645Xy9LCVZik+4xxyjI0jnRLqRX5Qkm9LT82ZMOMVH/JqEpNv/FPydbuorEBs4dQGDdZPU6EX5VxpPpD6bGiTyvd2yZnemR4zNRgO/kQVOVBN4CyPR+MyWtKV3cQ0NG+I8Om3/HJ0rP2zFZv3aydsef6PuMA29CYRv6DaTATC4zrtqqTiAXGAQLzUFEw5wjJSKRxbHpC0u0SYzsFGHuLqgyw9UFsKZEOIozCHY0h+6MunxTrE1AbxoBlr09hXHuvNnvRknN9ALjChKNCfrFJ+FaMniFARgBjQPqSKLfessWAQNjXMIJVD3maN/4TS7IUqc1yOSzldlnkEf6ibFRCDfHVZHustzRLnN1HW+7c0nC539cMYzto+c7tTiKREOZ3eRMDvm6Sl302Qf+54Yd3PB0L0tEa9b15VdG69pCWRrucbIsx7mfKcdsVl61eyG5D8HhAnu4ddhkAZ1QgMTTzGs+54rw/4CsBStZdbJZdEXMW31bHVd1fLtrOzWX3jpCNdLICnKI3tWdDbuEoupbOcWZf8hWXJT3IHuWTBG0RYIMwZ2A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(366004)(346002)(396003)(2616005)(8936002)(956004)(8676002)(33964004)(966005)(66476007)(31696002)(66946007)(66556008)(6486002)(44832011)(53546011)(5660300002)(316002)(86362001)(2906002)(16576012)(36756003)(31686004)(16526019)(186003)(26005)(166002)(478600001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NGVReEpQU0kxMmV1QzRpOGtlQVB0M1FDbG9kYTFCbmpqRTFIWjA3VEkvWjVB?=
 =?utf-8?B?VSthdkVxSENpZXo1SGdkU0ZHTkxTRzFzcWdLR2N6cHRHcVE2bWxTcldQWXh3?=
 =?utf-8?B?Vm4yR1Q1c2dieVRSZCt3eXptSWQ1K0UrUnBPbDFjYVNSTUYwTEYzczN1QnFP?=
 =?utf-8?B?NWEvaWM3MEZzZWF2ZHJ4M0VXR2VLS1RLRWx6UzJhNUtMT3lKb0pSRENnakZG?=
 =?utf-8?B?UnVEcThqU0t6RklHSTJxOFhXTmhMMjgxSU8zVjV5c1RNN2F5T05QVjNsRmZU?=
 =?utf-8?B?cnM4czdDM2dCbkRuQkg2cnl2c0ZobTFGUWkwd1krTEdYSXl1cTdvTkFESDlX?=
 =?utf-8?B?eFJPWUxlVWpxcXcyQi9MOFlHdldtWnVPK2FxdlVESCtWNWR6MXVFcm9yMkM3?=
 =?utf-8?B?QXBOdlE4NVNqbU1XYUhOVDdzT3lFbks3d2pVTFduRFo0U1RXazU1b1Vrekx0?=
 =?utf-8?B?aklHSW9SUTd6L25hN0N6MEUwWmYyemlQTUM2c1lEOFFKbFJEOS9FN3pVTlBU?=
 =?utf-8?B?akdsTmRYOWp1K2tDdnFZTGlIaWZlQ25Ud1RyZXltZmh3anoxYUk3OXdLQjgr?=
 =?utf-8?B?dFVRWk5uNWlrQmU0T2VvRnFxaW9uU3NpalBBWnJmSlM0MDBockNDbGFJK0hn?=
 =?utf-8?B?VXVqSU9XT1BDdmtydXduYldzZXVmYVNRWHNIQitEUThPUVE4T1QrSVg1ODFx?=
 =?utf-8?B?THlYNldmWm9mVzJYVDhGT2pSa2pLZkJjdDJ4VW9xb2R3TkxNVy9JSlN2ZzNC?=
 =?utf-8?B?cFM0VTV2dE5Yb2JoNnBpYk5lR1k4Znh4RnlCdDNjN0czMEZLL1R2WHNnNCsr?=
 =?utf-8?B?OStKcTBucWNJUE1lYldES3lZOEhLd1RXcmRYVDI0cmFobFVWQ05vOWxoYy9S?=
 =?utf-8?B?QkpoM1hQeXdWT0ZibXcyUXQyTEY4SCtCbW9MNmczZTBpekJGZG9IYlgrWkRU?=
 =?utf-8?B?UjlRVlJXM252b1h3bWVPcEJHZnM1azlBTXdHUW1FZ0pBR1dwaFlFaGdtUzhM?=
 =?utf-8?B?NnkxZFBMNjkyemFZd3J4MExJVGQwcEhtNStkL1JCMVZEWU9XQkRCOGs3S2Fq?=
 =?utf-8?B?SmtYS0p2L0tBU2ZaUGpmNTN5MThjU0MySzY2VkQ5WTRRQWdsazd1M3J0RGlk?=
 =?utf-8?B?TEhWYnZqS0l1cUtrRkZaeDJqMUlnNjFWekU3cENUa0NkSWF0U2d3aXM0N0Nz?=
 =?utf-8?B?Skp1cGU0YnczVXpQSjVFeEFrNGlaT2QvSU9QM3BQK0gycW4vekJyYzRsUjFx?=
 =?utf-8?B?NER1ZHZ3Q1cyTmVMNjhKRmM3SnNCTEl4R1JFVzM2ZUtWeGRkMjVDUnJjR0RE?=
 =?utf-8?B?VzI0SkhEUXZ3K2o2NURsdXBEMnBLZk9LZi9Oc1NWTk9wN1V2WmRTblBQeHVm?=
 =?utf-8?B?TXN3eFh5N2VxNmF4K05WMlB3T3RXZWFCMWN5Q3FpNlQyNjFxckY5SXorQzNP?=
 =?utf-8?B?VWV4eW1OUHFYMnZwSmtsSUs2UHpEaXcwVjNRa0FWa29Damh3UTJZZHhaWmph?=
 =?utf-8?B?TUlLbWsxL0R5MHZmN1lSM21LZ1Z5MDUxSS9oaVBGeDJMbU0yMlpZam10dklB?=
 =?utf-8?B?czJnWkx4UGVlM0swQmlsd2NMWU1mNzJqbUpFSzUwbk0zWHFiQXlUR2ZBbSt4?=
 =?utf-8?B?NkpGdkVHLzFQT1VWQ0dESnk1TzdoTHZ2VUJKbVowZ3NqT3l3TFM1aFhxdmIv?=
 =?utf-8?B?cDZSRjI1djJlaVNIV0g2Q1VXMkN6VEFvQkJkdXNhQUlxN2FFMW1VQlVwQXlJ?=
 =?utf-8?Q?8nu/lOpP7fsybJL8CXzNFRB6x751dSxEeUDKmX8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf00f58-812b-4466-7647-08d8e9547f60
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:53:59.7627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uh1O7iKeH7QxIffOT6hQJ/kRNTCXeeLJjs+hMn7axfqAspSo4yB/R79XS5YLOQtkGcQ4E/cPZ5S3yieHDMlXRUZUCkwSJv6hE4Rn1+shBgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4784
Content-Type: multipart/alternative;
 boundary="------------1A4598D217774D1DCCC3AE12"
Content-Language: en-US

--------------1A4598D217774D1DCCC3AE12
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-15 4:47 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 21.3.1:
>
> - fix: Twisted v21.2.0 breaks Crossbar.io
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-autobahn_21.2.2.bb => python3-autobahn_21.3.1.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-autobahn_21.2.2.bb => python3-autobahn_21.3.1.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb
> index cc3773fc5..daa66ec1a 100644
> --- a/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
>
> -SRC_URI[sha256sum] = "bf7a9d302a34d0f719d43c57f65ca1f2f5c982dd6ea0c11e1e190ef6f43710fe"
> +SRC_URI[sha256sum] = "e126c1f583e872fb59e79d36977cfa1f2d0a8a79f90ae31f406faae7664b8e03"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------1A4598D217774D1DCCC3AE12
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-15 4:47 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210315084727.26812-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 21.3.1:

- fix: Twisted v21.2.0 breaks Crossbar.io

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210315084727.26812-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-autobahn_21.2.2.bb =&gt; python3-autobahn_21.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_21.2.2.bb =&gt; python3-autobahn_21.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb
index cc3773fc5..daa66ec1a 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://crossbar.io/autobahn">&quot;http://crossbar.io/autobahn&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98">&quot;file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98&quot;</a>

-SRC_URI[sha256sum] = &quot;bf7a9d302a34d0f719d43c57f65ca1f2f5c982dd6ea0c11e1e190ef6f43710fe&quot;
+SRC_URI[sha256sum] = &quot;e126c1f583e872fb59e79d36977cfa1f2d0a8a79f90ae31f406faae7664b8e03&quot;

 inherit pypi setuptools3

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1A4598D217774D1DCCC3AE12--
