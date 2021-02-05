Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.88])
 by mx.groups.io with SMTP id smtpd.web09.8075.1612533700630555250
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=a96uii7y;
 spf=pass (domain: windriver.com, ip: 40.107.93.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aidqzq0kyq/0uTiYHKoB4Sh+Hi+S8zgNXV9B6fK5hP/W7u9FjkHfaRfWbYjOvDlX/a0WN4sRhvxHQaGHd8evX4cJJJip8hfRu20UpsQ8ANDRxr5aMGLhgjAjN/hMKTIN6kz8Ni4ZM5ngdMJG+Wr3Y/vR4peUj+6kCekBzogwgc+LxqsU3MIC6/KkTnuUu7wAdpDAErkU5RsPQhF7bLAXo7YJ67A9rydF4hw07meLLWE+P7s7cQqDboPM0vlcoPFi+GzJkVjq493hXJ6t2p7gS4uAc7B1Zq2h+9ZJRb8zEw6bXVAsPgBAkHZSaCWCr7tqhGgLg4olDRI+l9mQFnZFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uoi7kvlDw5DNm209/i89vGGre68X62N9g7Lspxm3oXs=;
 b=HW0KBf/TGhuLSlqBEtyg2qBcYOOWiflLx1hxpqIbrc+CTN0nFQvhfEgMpNGtZLNm4sHs0DHDadLDU4r514smAVL3I3CLtAuvDtzfWeOp24uF3exgzjuukhPuF/TE1sSt6L32C00FbFVDHlTJHFwG6GKfTSOr4JYLBEjUt6T2rjvQbcTitNAZzUIyy/1qLcrl8ZEMn+ORlfd/3DhtTy1rvq6vd9ObA8buuyfJq6aP5mncrC9OSKwWYNNiq68ap2hbAclEuRcQMqjPoG3zQZkVVdV82Q2MpkDX0EjFRr3E7yt5SNwNXjxZPeGqyQ6G3E4Ga+b23guvKz+K88gqcvZH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uoi7kvlDw5DNm209/i89vGGre68X62N9g7Lspxm3oXs=;
 b=a96uii7yw/14Ornq/dKcMEZOhf8fHJGZYsJLIWKpiwcdQjjZW5bhS0sO7jv5j9895J2f4VmGo87efPont2/MZz2RXlSl601y2aDBawiaZ6uhLDW5u79VNO3hLcnuSVrnbAqTRdwFE4S9ZIhhb5yMRjAEJn4d8K7kJsZJUtbtITQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 14:01:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:01:39 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-croniter: Upgrade 1.0.5 -> 1.0.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210202112636.30651-1-leon.anavi@konsulko.com>
 <20210202112636.30651-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fa823aef-449e-93c7-45a0-df612b5a6da3@windriver.com>
Date: Fri, 5 Feb 2021 09:01:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202112636.30651-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR11CA0039.namprd11.prod.outlook.com
 (2603:10b6:404:4b::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR11CA0039.namprd11.prod.outlook.com (2603:10b6:404:4b::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend Transport; Fri, 5 Feb 2021 14:01:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d965a7d5-38ea-4f06-1863-08d8c9de8f03
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3894EE08237DE030081721C49FB29@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Br7jvCGwkrmuksHK/gg9u5b+3vHxcAzoX0hcfvd/0SIB7rVgL1Ks47Df6bqj7Uv1jljpcoF3+6YuosYsVu/jYuoH861gBtO5CsM11ZEhxrVBU8e2EPfPS+mTTdBDCOlpRW6R1eTUWzLCEoLq2DnFFg2a7Eg+TsRxsDm2ciRuENnqeUDQTM+sC7uEngAx4pb2dGwHLJe4PXI5BLwwY5r/sZzRoOJmJgcxfxYWcan/ieoeDj5mu/JztsJDFlurqgOk8f5LDZVYvw84TBZbToly/bXeHnu5/olgUCE4SZXqooQlZo33Zeby0sX/rs/PfmiUehs+Utrggi4e/SusIES+bhdP99OURs8cGinuLoDdBqKgcPEKs6T9gPfhMwUqsM58fQrvqRQuZjclc1yEboatIDYIeVtz+RZJ0iMd2uJ8IOWzwnrf0ZkFuY2abQ73rqe5hr6Zof2MbpGNLNGyPrFqmt8w8dhouAyvG2qEU3VyNdiYB2GZDw6bfLAu3f/CzmJ7mFHjFt+ktf07qwMCLmVObVrfHmVQrajc0QtWt2IbFFu4tr0K/GaFOdh3tgzRaWL8MRoN+jQWCvHUS2ZDq+48hxjbFLyUqNaZPqpQpT/XmCU5st/ZDMc84HWcY5Jo1OVgvS5cBxPMMjEppric5SxOJ46wJZgJ6M87P2GLxgqXFO60PO7xtadKEAeg/KdBf+3T
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(166002)(31686004)(8936002)(66556008)(478600001)(66476007)(5660300002)(83380400001)(966005)(66946007)(6486002)(31696002)(26005)(186003)(316002)(16526019)(33964004)(16576012)(8676002)(44832011)(2616005)(956004)(52116002)(86362001)(36756003)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cndkeEk5R210SDVtdWV4TWJTeDFzSEZWNWtrR2VCdmNJUEUxMW50K1FobC9D?=
 =?utf-8?B?YkFXMnFjQ0s5SzVjS3dQeDMrRThha2RWQUptNTRBS1hnTGllS0lXcGk2eUIv?=
 =?utf-8?B?SyttelRjbGNWQW9kVmtUSFhyNjFxRXdDNGF5dG9oTm9CRUNaZW9BZkJrNkhs?=
 =?utf-8?B?Z052YytYam1Ga1FEMys3NG9LNm9icnY0eFMzNU1YWVVaSjhHOXNvN1pzZEZP?=
 =?utf-8?B?MmdHY3UwcnpET0ZVeThUTXVCMG15Q3Q3elJMb29WalpDREpQNUkrYThOVHUr?=
 =?utf-8?B?c0IrcC83bnRoRUYyaDlvYW5uNThiRDhXSFBreG5VQU94QjJVNFFFVFAyd3FM?=
 =?utf-8?B?YmlsRUhlejFhQXZwbHpwNEVHQ3Z1RE1POG9vY3pySXd3cllWeFJkNzYvWUZ2?=
 =?utf-8?B?UzBEZ1VNNzZ2K1o4NE42cHN5eUFkbEFmUGI3Rlg4NkdoQjdoR1JJbFZCUkNo?=
 =?utf-8?B?Y01hUVorUDFnL3lkSS85aDJuT0l5blZqK2dKaTRBdWp6OEs2S1hlVU5TK0Rp?=
 =?utf-8?B?eXdldTYwQXFkRnM1dlRqeHdXSnM3TEFnbGlSc0hqc1dIVjdmMXhuWm83V1Rw?=
 =?utf-8?B?QktFaEtQSDBNWDhiSFpMSHNUU0xhbHN1U0xMZXZQTE1La1BGZGpFOHpXVkgw?=
 =?utf-8?B?YjkyS1FtaVJ1SFNWWWVqV1k5ZUtlZk1jSXl0MEpFVXJST3hRRnpiTE0zYWI4?=
 =?utf-8?B?aG5uNjJnVjFwZ1RRQXJBeXF4enZJT3UxTjFvUi94TkRMc3BxaEdrS0ovcnpF?=
 =?utf-8?B?YVlVWHNybFFya0hqV0pRR0dwd09kUzFrbDY5SXVLTW50M3ZhaFNvVlFWei9m?=
 =?utf-8?B?M05kMEVyM2s1d3Q1WUFFN0JpNisyNW5sNGFJTlJydGl4L0dLVVpaTVBYcWN5?=
 =?utf-8?B?a2Z5WDk0amlwRWU4Nkx3NmZNYzUwd1FmOEE0bFAvQUpnM3RqQTZ3VUE1VzZS?=
 =?utf-8?B?RlRwVElDb0swSUhrVUdSQ2dTNUJjbUJkV2wxa1gvZE90ODhLYjRsQUhkK3gv?=
 =?utf-8?B?Y3orY0RWR202NEJ4VUhrNXEzcTF0SlJPVzFkODRPdEZXQWdtUkZsZFN1eEdP?=
 =?utf-8?B?enVzc1RwdjNqdmVPT1NZWERqQlpkdEhuVHhaRDh3dzZadC8xcEJ4SW00RGxG?=
 =?utf-8?B?VG8yamJqcGh2V3V6Z1kyeEpSOXR6MXlxNTNmcUFId0V4SnB1aDNmZllnOFBw?=
 =?utf-8?B?ZW9ITGY4Y1RoTVl3djFTU1A2QVZ0Zzg2djgrRWxtZkh6YVU1bmtPd0NVVWEy?=
 =?utf-8?B?MFZBSWhMUi9oUVBBdytob0drNXkzYjZ0TkY2bmpjM0I3OW92V3haaVl0Z254?=
 =?utf-8?B?TS9sUWk5UjhWRWhjUjVqQVVLOGRCTXhDamlJbzBWQVVvSFhHcG03ZnRUdnFK?=
 =?utf-8?B?eTZiNjFKMndSVVNmOVIrY2s4SVgxSFJTcyt6YitKMzZLRFBQVFVJejBSN3No?=
 =?utf-8?B?TkpMWk04MnVzTm9CcVNnUGRnbEFzbkc5dEJCN0ROQ0pwYWxiQTFWRzNsekll?=
 =?utf-8?B?K2JhWnQwMVhnOWFXNEZIWEV3SC9DYUcvVERSdUx0S0dZVWNEbTV5Ym04dVNl?=
 =?utf-8?B?SGw2UU0vbG5Ndml5UXp5dUJld3JRSUpYVHIxUjBqNlY0cWZNR2hYSFdJMkZn?=
 =?utf-8?B?SVJXaFdrUTFyMGpzbFlGNHBsdFF6blVkOVhZVXNEWFFLbWo5b1AzcDBITURy?=
 =?utf-8?B?K0lieFZzTFA3VUdybEVDR1hDVE5SWUlRUG1ZYWJ5OGtvaDlvOUNza0UrQWFy?=
 =?utf-8?Q?0va78szcEA+m0B45RcYgWNi25uTokp+ny3j1bLD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d965a7d5-38ea-4f06-1863-08d8c9de8f03
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:01:39.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Th+cgjLFKxoyF+jGDjNRPzrY/6sr/BJWhyXuSMkZzXqnHff2d05e1FnfZQeUTg7ZoHu1nMZbtbCfaxkDr0AGuk7u1qx71zi6bTIyZU2+4dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Type: multipart/alternative;
 boundary="------------336AF882C66505D7978046A0"
Content-Language: en-US

--------------336AF882C66505D7978046A0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-02 6:26 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.0.6:
>
> - Fix combination of star and invalid expression bugs
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-croniter_1.0.5.bb => python3-croniter_1.0.6.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-croniter_1.0.5.bb => python3-croniter_1.0.6.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
> rename to meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
> index c8af97d7c..d3b6fa1f4 100644
> --- a/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
>
>   PYPI_PACKAGE = "croniter"
>
> -SRC_URI[sha256sum] = "8636e7f0ce842b4192b7f097cab724fc15bf2459265f1a2bc6cf6eacfa44420e"
> +SRC_URI[sha256sum] = "e79bcc9681d2345e71360241aebe19ed6c5475fec40cc59a7998fe1a2ca568d0"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------336AF882C66505D7978046A0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-02 6:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210202112636.30651-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.0.6:

- Fix combination of star and invalid expression bugs

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210202112636.30651-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-croniter_1.0.5.bb =&gt; python3-croniter_1.0.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.5.bb =&gt; python3-croniter_1.0.6.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
index c8af97d7c..d3b6fa1f4 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2">&quot;file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2&quot;</a>

 PYPI_PACKAGE = &quot;croniter&quot;

-SRC_URI[sha256sum] = &quot;8636e7f0ce842b4192b7f097cab724fc15bf2459265f1a2bc6cf6eacfa44420e&quot;
+SRC_URI[sha256sum] = &quot;e79bcc9681d2345e71360241aebe19ed6c5475fec40cc59a7998fe1a2ca568d0&quot;

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

--------------336AF882C66505D7978046A0--
