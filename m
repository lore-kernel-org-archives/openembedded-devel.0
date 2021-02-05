Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.71])
 by mx.groups.io with SMTP id smtpd.web11.8466.1612533877602122585
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jKCzHj4A;
 spf=pass (domain: windriver.com, ip: 40.107.68.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1kDSiIbezMUb2XZV4hi0DFjoyzUrMLLKTCpt0FkHSBvMdZ+bMr5tUorZNDKFPQCt/NlwQfmmToo3eWReW2Qpf8qFCKxuiO2Rc3CVFMUCMM09hxWlReXuCEx3Y2i9uQXJfUyxGiVS5pG0bMeTAYSTRnd2wzT5yV5AW/3I4Jv2Vy2a2kwyKeNx+02BjMteTfWRXaIBNqJpY2oPbV9EAN5ueJJdOl7mJWnKF2SEe2nnz2hR+85A2dyzyQmMLcT+HZSIQT9BUOTP5ErrOShmkRLPwJNPlIdDiK/7/FV0nThQ25ecAcs37zKlCkqV6+WuldRVwHCsWgMJPTgosBxOseXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOVcLK/qZWO4BTEzFtF+obTBQ+O9jhYKkdX2x2C4RrQ=;
 b=Go31/xO3kfnkgMbADqlIgTqFXHkEKz+1dhSmI3DfKeFCF8jtMnFIBNGcvEKi4eTarwMi1s1WmAbkwDT1isqHThfDBlSa/G+aZNGzuQygwO0+7++fblm1qTBgKs9SNGGPaTq0fwqS+tihTLNqEpoWFvgCsBgZAOuCugd3Gc7YglD5BUn8oPayEVKG8uDUOMoyHw1nBYl8+P41jnfnA2MfAWlvWGt1q+9KNiBeuchZKSyzqlxjmxyTdxTK+lMoWL5PdyWmN3bSnOn6CZtnZxoVhWt5x98IKDi562RMeCq89hP3d8NrpXWEcTYewhEq3JB2b+5DbOGgskbiGNXBbbeP1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOVcLK/qZWO4BTEzFtF+obTBQ+O9jhYKkdX2x2C4RrQ=;
 b=jKCzHj4A9yBa3PQV1/LeNsyGNu90565qavZXZm5wcnb1ygCiiyIULonrKX4QtUFQzMnDBqaeBrXTuHjnZPm9RSA8K4/AFE43aCEXXBNoTLACGAspoQm3UV92n8Gql0nRNkBlrsnxrM34ipE8+mamB2djRxXrtVzRIdayLTfbckw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (10.255.163.77) by
 SJ0PR11MB4830.namprd11.prod.outlook.com (20.182.113.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17; Fri, 5 Feb 2021 14:04:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:04:36 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-pymongo: Upgrade 3.11.2 -> 3.11.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210204131940.22585-1-leon.anavi@konsulko.com>
 <20210204131940.22585-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <840d309c-bec7-528c-4e94-dfd9e355bb11@windriver.com>
Date: Fri, 5 Feb 2021 09:04:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210204131940.22585-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0469.namprd13.prod.outlook.com
 (2603:10b6:208:2c4::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0469.namprd13.prod.outlook.com (2603:10b6:208:2c4::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 14:04:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b0a2c2d-62fd-4be0-102a-08d8c9def87d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4830:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4830F1653794249F9B27B9269FB29@SJ0PR11MB4830.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cOT0pkiH28dVjEM1y1Kl7LIlAHCramr/x6C4eCk4bn4M/m72LJyAvdi1YMXzr5RCu084y94UhnQb3aG41HKhkqZK4SI1xaU1hjqDBMMhBzzuj6LSxdcwLMf4AY1uVu72itkhIqIEpokz/XefJWA5egGyyGYhgs4u4eTkG2GoFW10nFMt+jXq852bys01bm4ksv52MH968rgqAaCDkDFuRFUTgZ3WSF1AglNTegAng1kWSFeekHSP5o8dfMrhTwjHfVkI5aQWA9ub3m4Hz/tYEFlAf/88KuUnGpyUQXeXaSbhjeXFnsjt8LQaQoZINzfHihSu3o6jmFh54phPRwCF7w5bel49R9BdkxO9BYvKU4/Dkn/DX5PaEyz8oWjG9MWONcK5cp4ZS26ya3C2+WnXXNtBn0ld9TMACEaBVvGXsUwAJUtMYIts2ix2r+Nii4uT4lItDN73mBypc/0WnxnYTuIVg4LPUQ/DeLAl0EwCgo2X8MUqipgs0lh43DnQyDq8MkvWgMTN78dXTyDmd0qRsGV0hRRMP9IL3LgyAWgAVj5yqTPwh7rY2sdMJGrmyEguxEnizRvgANc2TOStnvoQBP+nDDzo+1ZNB1BNURPuIyV0RGhGHUwxMA/4IUw8sp9d1kxo0fQjkIRtLXecj0cBf/kObRQQQIL6xaWKmIN8v3GcJC99ey5JNXk5XkREjOM6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(86362001)(6486002)(83380400001)(44832011)(8676002)(16576012)(316002)(36756003)(66946007)(53546011)(5660300002)(8936002)(478600001)(31696002)(2906002)(66476007)(166002)(66556008)(26005)(31686004)(186003)(52116002)(2616005)(33964004)(16526019)(966005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eU15aWVFMWxEMVlYc25FamhpWC9rOFlGbERhTFN0TlJRY0V5T3BPbVRzaGll?=
 =?utf-8?B?ZVJKbUdJWE1PWkdhTDBUazJXVEN0cWdiYWUrMmtFMGdwUVdPcTdrbjlySDdl?=
 =?utf-8?B?bHBKVmthQVNPTmtFMkVTK2t2S3RFT001YW9pUFFUNFFoNDFZVGRzT055WmdS?=
 =?utf-8?B?bldIcG9nTVI1NkRNN0hFMHJtVW9wb3ZjbTdsbzZuS3A0Z05IK1ZSQUZPZFBi?=
 =?utf-8?B?YW9OOVVZQTdYVHEwdXp0WVdoQTBKYzR0Qk1jZG1wZUY4akhramNpSldSclVz?=
 =?utf-8?B?V1FWMUdOL3BOSWFDZXFsc0JGd1Jnc05KTEFnWWJqM3I1Z29PM3BEbVJRZ1gr?=
 =?utf-8?B?ZC9OS05mcUhjRkZxVlRtQU1HTi9saXBXeGJ3aDBNejRsMXNHSWs1WjJRZHFu?=
 =?utf-8?B?UVBxRzZvcmlwcjVobm5DWDlXMTFnd0VOTEQ1WTdFVTE2dGFJUjl0QXVXSzZ5?=
 =?utf-8?B?ZlQ2cXNDNjFaVWVSTUdxR1cxQWUyZlBUTnl1NGlqUTJqaWtPSzFJUG82VWt2?=
 =?utf-8?B?UXZnVFlmK0s1SmRzZlRRRFZrWWZadEw1TmVoZVZQOW0rM3ZSYUQ4NDJiOXky?=
 =?utf-8?B?V1NPSFAvbkFQZEFGZ0dmaWt4cEw2NmNvREVIOFhRYmZQYVczcUV4OFFiaVJn?=
 =?utf-8?B?aDIxd1Y0NmMxUnBnYW9sN0lRRCtUamp3MWprcUMyOGliYjMxNmJkbm52ZEds?=
 =?utf-8?B?K0R6ZCt5VE1oWEI2WVgwUmRaSTZCNTZZT2gvMkRidExpN2ljZEFVVDNkTUVV?=
 =?utf-8?B?VWpYTGhLZVRBbTFjNFgyNy9LZ1U3RXU5ai9kY2pBWmd4RE12dGcxOFhUQnpv?=
 =?utf-8?B?bG9YOHEvOW01eDNXL2JkZGFMekVrNnZ3RDMwR1FxTUdXM0k3aEZTb2dIMmhi?=
 =?utf-8?B?Ykt1Y1dheDZIYVhWWXk5dHBhd0lEUDhmbmdhcDhuTUJVL1hoTTdsNjlkcGNq?=
 =?utf-8?B?b1NycGhYYzZPQUJHem5vbWtjRWxRVERGZDl0THcwNVdzQ09XdU9KSFdSN0VU?=
 =?utf-8?B?MXlrbkw3RllaWFEySjRuUU1CajJDNVVnYlFNZTVHTVozYzVaTzh3ZTdsMVVk?=
 =?utf-8?B?S1ZPZnVNQllINVhDNTEzeUdxbXhhMGhGTkh5b054YXVnR29NVnVLbUVGOUpo?=
 =?utf-8?B?OE4zNDRTWHZQTlRsdDM2blJndUZ3T2tIQVJ5eE5jcUs3dVBrbU1BZXVFRUNX?=
 =?utf-8?B?MzNmK1ZtMnBUT2JZUGdQNWZuNzF2U3IxVGM4WE00aUZRYWQvMUtPemY1RnVm?=
 =?utf-8?B?ZytDcEt3c2lSYy9UTEpQd2lkQjZBRUlRbjVnRjNxbVRadjFEZHNNd3M3MWhL?=
 =?utf-8?B?enlNV3hyUE5hV0Q3d3BwTHdKNUttMXU3bEtIL3dFWXg4NTl0anJRaXFtWjRS?=
 =?utf-8?B?aGlXSmwyZVBrMXpUOHIraFpyQ2pEWm4vZ3QwS0VhRDBhUXlxTlJWaTd0ZEdZ?=
 =?utf-8?B?OFFZMVQzb0VtUGNOVG10ZHhVOE5KL0tETEtkNXVRcjZFNjdHUkhmajE3c3Rl?=
 =?utf-8?B?M2k0RG5wcCtPTHhnRjNXb3l3aFUrd2MvZm5HY2lTZmk1VjNSVzExRFJkWXg0?=
 =?utf-8?B?cHJNejVQMnFQV29jbVE2U1pzck05eHlDNHRzVHB5eXNTVGM5eVBSRmpMT0t0?=
 =?utf-8?B?aHRpVGlVMWlCbXdybCtEMDJIQzJiczZzbGdkekRDWFpsdmgrRmh5RUc0bG1Y?=
 =?utf-8?B?QXlpVkdEWnhHdVFHTjJ5M2s4cVR3R3g5K1NpVnNpMm8vRTBjRjRGMy9ZRHZN?=
 =?utf-8?Q?0YYDBS+lxjCYXUTBWR17KKi5nGfQii1b59EYvdg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0a2c2d-62fd-4be0-102a-08d8c9def87d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:04:36.2992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YI3djiW7in39cY3Lx7nXcwJxRx2x4AczGgcoYOt1lyEWDam10rf7zX/wJm1C2+HWvid3kf0vv1K+NASAohdFkBQ2Mzsv1O0GZsFtIhzjRTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
Content-Type: multipart/alternative;
 boundary="------------A93877D784A7E84C614812A1"
Content-Language: en-US

--------------A93877D784A7E84C614812A1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-04 8:19 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.11.3:
>
> - Fix benchmark when using Python 3
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymongo_3.11.2.bb => python3-pymongo_3.11.3.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.2.bb => python3-pymongo_3.11.3.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
> rename to meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
> index 5372ac0ff..3549adce7 100644
> --- a/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
> @@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>
> -SRC_URI[sha256sum] = "c2b67881392a9e85aa108e75f62cdbe372d5a3f17ea5f8d3436dcf4662052f14"
> +SRC_URI[sha256sum] = "db5098587f58fbf8582d9bda2462762b367207246d3e19623782fb449c3c5fcc"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------A93877D784A7E84C614812A1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-04 8:19 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210204131940.22585-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.11.3:

- Fix benchmark when using Python 3

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210204131940.22585-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymongo_3.11.2.bb =&gt; python3-pymongo_3.11.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.2.bb =&gt; python3-pymongo_3.11.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
index 5372ac0ff..3549adce7 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/mongodb/mongo-python-driver">&quot;http://github.com/mongodb/mongo-python-driver&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327">&quot;file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327&quot;</a>

-SRC_URI[sha256sum] = &quot;c2b67881392a9e85aa108e75f62cdbe372d5a3f17ea5f8d3436dcf4662052f14&quot;
+SRC_URI[sha256sum] = &quot;db5098587f58fbf8582d9bda2462762b367207246d3e19623782fb449c3c5fcc&quot;

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

--------------A93877D784A7E84C614812A1--
