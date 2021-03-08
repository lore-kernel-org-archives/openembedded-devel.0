Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.56])
 by mx.groups.io with SMTP id smtpd.web10.35748.1615212249725757554
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hlqsXe3t;
 spf=pass (domain: windriver.com, ip: 40.107.237.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NW7eix/y3QX3yyQtd4zc0/ijZGdx2LdgCYd7sPxt5qqrebUVLlSdzApN+QUDRf6YNsB1ARYRKnfUA7L8W1K3hHqT9rLlwjoRHFDgaDQZOalPXCaWc3B4KhoAmxD1GLLVT951DDuFzErM2Kaj71+kXydsRgUC8s3husG+MWqhbc20CigaXI+euWNqTRiPApK2UropTjCSvnHIlBl1h3nOCluWcMf1ikq7Wke79FY44jgGFzybYWPYHDOMUNZbUWfKQQn0K/6gqYMhzVaoLGfC2KCgo4wrc/BzIClTFLoOfxCPSn1D39uES3eXoNp/Onz3b/0vuUo7nbZlqjI9MMGSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81MsLmGYwewW/iivP0Ide9IEGJfMdHHktz/P69lWQN0=;
 b=NWhy6rc0SbdAuidgZcBfwwVHG7a/sjlKARaAZ0TbcVuG4nwNa6KXcYsdqIkJ7e8CIkyWi5KcBw04jz8O/GKl0YS5o1Oz3WufLpO1o41tTC0kO6oqU7ggngh7+r/HkRWIDNRCFjgcdiG92RW7sirmEf6adoXKkqWHTF5PmYtRdb+lAMGc7su/9Zt+QPgeINCo0nDGB6AN+Hu23DiZprGZQkcqGgXBcWtaNXiBO1gJzbqHrV5ZWFbUUtVVE42nfWb7a5i7rjrY4mRt1Zj+ClvOddgy3t9zBeAsRJSCkwO7DvJgu7eKXQbJwx00QnXYomS18gi+1sE9VIUwXxwopLmVuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81MsLmGYwewW/iivP0Ide9IEGJfMdHHktz/P69lWQN0=;
 b=hlqsXe3t599s8ItgmocsuhDGHUS2seZDb8iB+7mVUYA13IhR1lmOEcDxm14fBIna1Gdg+kX8nT1pxTUHRG2kmvb+OJqrxqgK6+5DaCooOaj8G3uiY0SZ7PNUM00VmLaRWJX9e/r7DYF/x5Ae+mijFZniJqrRBOJx3jua5xjOils=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:04:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:04:06 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-portion: Upgrade 2.1.4 -> 2.1.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210304130554.32308-1-leon.anavi@konsulko.com>
 <20210304130554.32308-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <97dbee43-1a54-4f51-21d2-e734d7fd07bf@windriver.com>
Date: Mon, 8 Mar 2021 09:04:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210304130554.32308-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0722.namprd03.prod.outlook.com
 (2603:10b6:408:110::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0722.namprd03.prod.outlook.com (2603:10b6:408:110::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend Transport; Mon, 8 Mar 2021 14:04:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9bbc574-174a-40c6-d6ea-08d8e23b0995
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41034830441121C7086711019F939@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8iSojHFvbZwj3KO6FKxbhcgwBuxaRV/7HJ0KM22IKqYRV2pKZGebewuvKoziPPrEFfuqlHseVakeInyjWznC1jpWjCIEltweOILkDJNAr9vZEyy1iMH8qLOIyrqlkTScEjnm08LVH21yApHtCVuZlLr1p03Cc2TFeJr1RXgMnh99DoN+HRV1EO5Om/EQKqPGGNVyq5omXG708f7p1zcai3Ug3POztZ3pTh+BFaspSc2AWUxg7hO8P0vZG8iUasN2mlClBxQGFbpg7HXuc5MHtte9Hk6gtl1dBAeq5TG3PIp6vjO1jkzlX55kD6/7wDqY0lDvKhfvV+6cXj9VhI2mfN36LrJbU4krrOWZs2Z88XS3fUBgFcfduVyVThhGmAtDLfytG4x1XPRS4rSghva15sGZOgauzGv8kybt1oxyw1PaN8dGaSkBrjJlvltQusZPTIdgKPJ2pbNhdHlLHhegKuZiZ9/x+HE5CgWp1ZG7xbQWcaB7CGQJukI67c1h80+ZtRt1FfIOcLyqT4oyrwTKEED/VknkKc/yLS+QHRavGhFyGwVD34XWVx/7XdoBkdPipqNUBb2Ft9li777m7Sfnb20I8/bBHR783DaObhbbD8vy2cMoOA6NH+VitvxeZT4W7GshpOv7Jf+m1khAuDLdFoK2lD4i6Rx5n6wv0CCOph/YNPl/KtiEXZMdZ1pbMsOR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(44832011)(66476007)(2906002)(83380400001)(16526019)(26005)(66556008)(36756003)(31686004)(86362001)(31696002)(16576012)(8676002)(6486002)(8936002)(956004)(478600001)(53546011)(316002)(2616005)(33964004)(166002)(66946007)(186003)(966005)(6666004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QXdEWWMvVnpMUW5QZ3A0TkQ3V05zR1lsTXRMbnNheURoK1hTdDNIL0ZVTlUy?=
 =?utf-8?B?MkZzTXNlZHVtWG9leXVNWDBldGF1OXVJbFQ4WEVjNVFOS2ErdnFuOWNxMSts?=
 =?utf-8?B?SkIzZFhGZXl6RVEwNHJMRlpvTG5PcE4vNG1kVEFWbkIwK3FtRVJJRlNMRGpy?=
 =?utf-8?B?UHJjVTJTNlI3RE5xMzRNSkJiaGVXZ1VjbzZEWkV3TkN5bmpRSEd0S3p6a045?=
 =?utf-8?B?R0hJYllxdGIzSHZjZlk4RFpTN1dENmJBWklyZlFkV21CK1UvTkRIZ1lBdE1P?=
 =?utf-8?B?SWhVS0dQdERyeUVBWGF1aUVXSFIweCtOM0RGMUtGOWNjYVl3NjlEZUJKbWFJ?=
 =?utf-8?B?eVZUUUZySlJjVlU1Qnd1RmZxKzhGTkJydElxalpKMU95RGx3eGRRNkVyY3NX?=
 =?utf-8?B?eWtGZVBRZjRJbUdqR2NVb1luelBsOEU2L09rWk1BNmZ1RFc2MlZsNTdBS0JT?=
 =?utf-8?B?Z2R4RGJTNHAzZUNCNE5PRU5aTnB0aWtEZnYwN0ozb3pLbWJ1YmlnVU14eDRP?=
 =?utf-8?B?WHRESFFEaHVqUEJRVDkxVVlGSll3MS9nK0RUL0U5b0N5aFlJM053NS9LN1pS?=
 =?utf-8?B?c0xJWi9PV28rLzJ0aFdIUkhKcmlLZmFEMEE1YmN2akpSdk9FZFpyQzkzQmhB?=
 =?utf-8?B?OFBQUWFac0JEazMybEMyMXFOVWh5L1JxK01zUCtPKzNqeTFOVHZYL1MyZENL?=
 =?utf-8?B?N2UvRU80NnBXaU1XdnpUMFVJOEdlZE9iVFZmOXdMREtJR0VmNEdGaG01VWRL?=
 =?utf-8?B?Q3ZJZjhMZ0lEOG5VcTRFUlIvd2Y2Wm1zUEgvUk5Fb2R2RG9Mc2VSRW1Na0Yr?=
 =?utf-8?B?VnFWdGdSWG5YSlhCcnc5OXhhVjFVNTQ1YUUySWlwQnAvazFyZytlbTlvampU?=
 =?utf-8?B?djJsTEVqN2gxZ001RFlZWHU1Z3d5UHY0TklNUW1kcEVjdk5qL0dFOVRWam9S?=
 =?utf-8?B?UGMvSWJheFp6MThITDVzTlNGL3Z3OFh5QXhBNno2Ry9PYmdZT0xCanUxZEJh?=
 =?utf-8?B?K01ra1UzR3d2cFcrVWFYZjV1YXZVNkN4S0x5aUJuVWZnRFNQNUhXa25XWmZu?=
 =?utf-8?B?ZE5iY0Q5MHdqc2FEN3kycW0yZGFJYXJuZVFNYjhtMkhPeHRzQ21nMXEybUhG?=
 =?utf-8?B?WWZNa21GQ2lWcHBnYzEreXRLM3gxa0NML3BQc2djS2hUTHZ1SS9CRTVsc0lR?=
 =?utf-8?B?azgzMVduZVYvTTBOYmJtMTFLdmxDUWd4YVgxakV6Q3d4c3NFV0JNMnFxUGFl?=
 =?utf-8?B?OTlTUXVHWmQ1aUVMa0hpbXlJeUpzQ3NxWUU4R2RqOHd4aEQwZDQxTy9ENG1D?=
 =?utf-8?B?S0ZnRGZGWW9FdHRRR3Nyc1pZNGZmQWI1V0krNUpYbFZhZGQ4TW5PZHNKeHFX?=
 =?utf-8?B?NFZpejV5S3pyYmFWRU41Z09LVk1aaHF2cG5KTTk2SEpwRHlKODZ3bGdoT1g2?=
 =?utf-8?B?djAvaHllOVRKS2FJUlpYOU82bHp5NHN2U0MyemVuOU82NmJnVjU4Q0NsYVJr?=
 =?utf-8?B?dStEOXZCY2dqZjlKMm03ZDAyUHhVTllpUHpUS0R5OXVzNlFMbHNWQWNiN2ts?=
 =?utf-8?B?dEg1S2w0VWlESEd5WG1HK0RrSERvOFpvODlWNnNZaVl6R1J2T3dSR2lWdWs0?=
 =?utf-8?B?Y0JiSHlzbHpHNFBNNysycXpHeU4xQ3RRWTliZEdFM0daTG9YNWZzNVN0Ylgy?=
 =?utf-8?B?MDNJcnA0NXFmblBjWU50WHR4SXhORmZiT0VFcmdxdzRqTVV0MzlhWktYeXJs?=
 =?utf-8?Q?BYSMsWzScypaDyrjtY8WtNWSesTLM1CDfhrJu/0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bbc574-174a-40c6-d6ea-08d8e23b0995
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:04:06.7646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlD+/UjvPYWzrgTfqd7jRkyqvoZqwLMxussLWdw2Aa10m4DtC8MfF2PjSnSp7mXVgqpU6IdQlMgLAW6Liv6sJfcm9JMYtrBmxtIVZjLyJsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------859CD7FE625E66EB742E7D22"
Content-Language: en-US

--------------859CD7FE625E66EB742E7D22
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-04 8:05 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.1.5:
>
> - Getting items from an Interval using a slice does no longer
>    return a list but an Interval instance.
> - Intervals are properly pretty-printed by pandas.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-portion_2.1.4.bb => python3-portion_2.1.5.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-portion_2.1.4.bb => python3-portion_2.1.5.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb b/meta-python/recipes-devtools/python/python3-portion_2.1.5.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
> rename to meta-python/recipes-devtools/python/python3-portion_2.1.5.bb
> index d08d3e7255..0fa107c33e 100644
> --- a/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-portion_2.1.5.bb
> @@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
>
>   inherit pypi setuptools3
>
> -SRC_URI[sha256sum] = "58b2792e6e9837a2d55a97d459b940c90fb08b5fba774f524e9359727c80e7b4"
> +SRC_URI[sha256sum] = "ed62fd1450336026f55c7d40b92b7159efd81d1420c778dd1b592bb634b14b4c"
>
>   BBCLASSEXTEND = "native"
> --
> 2.17.1
>
>
> 
>

--------------859CD7FE625E66EB742E7D22
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-04 8:05 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210304130554.32308-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.1.5:

- Getting items from an Interval using a slice does no longer
  return a list but an Interval instance.
- Intervals are properly pretty-printed by pandas.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210304130554.32308-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-portion_2.1.4.bb =&gt; python3-portion_2.1.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.1.4.bb =&gt; python3-portion_2.1.5.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb b/meta-python/recipes-devtools/python/python3-portion_2.1.5.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.1.5.bb
index d08d3e7255..0fa107c33e 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.1.5.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab">&quot;file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab&quot;</a>

 inherit pypi setuptools3

-SRC_URI[sha256sum] = &quot;58b2792e6e9837a2d55a97d459b940c90fb08b5fba774f524e9359727c80e7b4&quot;
+SRC_URI[sha256sum] = &quot;ed62fd1450336026f55c7d40b92b7159efd81d1420c778dd1b592bb634b14b4c&quot;

 BBCLASSEXTEND = &quot;native&quot;
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

--------------859CD7FE625E66EB742E7D22--
