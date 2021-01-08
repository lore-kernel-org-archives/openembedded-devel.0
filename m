Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.72])
 by mx.groups.io with SMTP id smtpd.web12.1883.1610121772757114423
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:02:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TdWzsuts;
 spf=pass (domain: windriver.com, ip: 40.107.243.72, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ds+WVxjYafzBHTkN2jFf8XugbAV6phQYfIrwp26tDcy9YpUXp1xWwiNUgJFucvOI/ma9LxLWRV1bG8rbZ7aU70g4w7d3yE7KLmN3NfQv/B1z4OHzfF6guH1Pu4RuDhQhlFun6Qe+zfKfa3BidrItxlmMizVzPmjUKbGA6U0mZoOTUAwgouz52LOSDM/i27QKWDFqJU3q4u/qSQjNRs7fdgXiajWyus0RdSqugjuGF3d77liwtKxh7qfrhhG9OS2pYrwj4eFr7XaMYUmjnw9kISJE6ZiIhrNGY590c5mj/uU5gpFNM/r3icofh+J44yvyMYrSvZ+I905MNm/ChCi/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEKwsBICd2kkTc5AAe3XS0Sl70LOAoeuKdAUNEciYwo=;
 b=MIDMwTcAUjEl6sOLbFhXbGx4EihkZWez6VF3FJa8K9S/msa5VbfMeZQagM9DcDbekPpC4oXhtSKKQFLo5heEKYSI2levjpDGPxeP4/sbYiH02ShOaPrwUsDQSw3gPQL/JGIAijrbPCV4QBiY2F8VYKukSuUO+Y3FRMSEnYVHPDWKiiomNDm3hMibsZwyIbKz5OApv3fox668l4nKw0MpiPlFSygvLGkWEuF85/BYFT5zGXY22/s/PNwaBUohdt1twlWBvxzZ2D5JWiUeXMJWvMrW4nM6zFULveAITq+ry30zD8mogzKnfQwjkBkS19/TiyCfUCPdcQSTqEdlLKH8kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEKwsBICd2kkTc5AAe3XS0Sl70LOAoeuKdAUNEciYwo=;
 b=TdWzsutsqebZM+t0f/odyQy8PowC2G8eLfGTSoRsL+qRoEfUHhvA+IwlRtsCPV1uAoFQEBw9Yo18JWQgrHT/ZjaDdkThL3hoSW8e+xCkKT18iz27jo5LeOjGBrVBK0tYNhQM3utujXSfzHdlVpuUb5pPGZ+fErSCR40hu/GbQnM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:02:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:02:51 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-argcomplete: Upgrade 1.12.1 -> 1.12.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
 <20210105151638.15700-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a9d63fbd-4491-0144-dafc-b90dfb159c3d@windriver.com>
Date: Fri, 8 Jan 2021 11:02:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210105151638.15700-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR18CA0013.namprd18.prod.outlook.com
 (2603:10b6:208:23c::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR18CA0013.namprd18.prod.outlook.com (2603:10b6:208:23c::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:02:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df53b799-0bf2-452b-00ad-08d8b3eeda3c
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB489653A9FA3FB747A1A5FC1F9FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5ce2ibWfRfsset6fmEGdIIm6q3txQAD5JMsPXvjFyMqWF/xPrLTV44qoYQSA+FX+MRy2TDotFsgjOZGVZ6u4EDMmS9fbKP9KV1Tq8h3atzdGTERRh0efqwEkxrB4+80Op8NPOcamU0egUYMqp8pPwBzbag1ODnqoPGgbISPGgDRGO1iKTDx53fNOyL9gHvgedhz8O6QVdnnL7QB9rXwbrie6wUw9Ch3XoUGJt5HL7uBLcPD9SOL92PRb+Za+yYfDBPK6M32jfLMHmVGUWFqMhq4mAyhHJiXqgj+dm/9kbxAG9ZwaeYPmoZDQrkQ07X8OrSK9chqYigu0zHherWavXIMi11ML+c6x5RlsXrhlEA7zx6jCb1jQE8bKXr5UEFYXlqzcrguKmoRL/SQ06KTtInxiTd61MU9bZUlLDNrCd9FkmoBNlaLS0qG3VjfGBUyTM2QNsAGxE93cpHG1Q9mFvwPRi9zPE/0ThKkRbbUCOldBVHpPGLeYwJqAllSEkVEPDaleLnKp2RbZPlel2RC9C0i5chTEAbf1vY8OJLouebefsqxYtNquDSNTvIGKYFH+gjcou2vHqEX8f+S4wZ9/JA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(45980500001)(43740500002)(148694004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TzJjbTd1SWFKdm5hTkIrbWZTYnF3TFlvS0U0NFFxbHM4YmZCUU9pbytlSDVS?=
 =?utf-8?B?UFI1cFNMNjJiZ1plSmV3bUQ2Wm1WZ2JIS3ltNFdBY29TU3pNcGpxbVd4R1VT?=
 =?utf-8?B?VHVXbXFveklxMGE2dkFQTFNCQklOYzVCZm1QUjVOSDZMdVlmZEJwMWUrMjZp?=
 =?utf-8?B?Q3EwRWxJY0hxazZpRUdEZk5hM1R3bkt0eGZkWHRoNnNtdHBQQU5PWTMrM0J3?=
 =?utf-8?B?cDl3MzNBSHNBL3pXNnNCK0lFMDUxZDVaUHdlWnQrZTZ5R0FhQm5IdXA5Q2p0?=
 =?utf-8?B?Tlo2WnlHNUZCOUJlZjRxNVVLbTk2QlJlKy82UGcvL1ZZSnhvejVTbW9wUFIw?=
 =?utf-8?B?S3NHdWJuOHhmU2hYWE8yU3AxZ3MvT084cjMwU1ppVnNjdytseDB6T2NoSDVW?=
 =?utf-8?B?Z08ycGVkMUowdTdnNFZOek5NN0JidWhwNTJjczcvYkgweVIvcXNPbzhFOTVy?=
 =?utf-8?B?T2gyR1VkRXpJQkd2Q2poTWNvTkd5WjBFYjlKNFBZWTlkbk8rUHlObDNvbHor?=
 =?utf-8?B?K2xkOEl2TFNQVXJ4alIyZndUVE9RdjU1K0tnV0R1YzRJNUwrVFdkLzQyK1BU?=
 =?utf-8?B?eS9USkVJaDhyUHU0Zmo0akIyYnFMK1NyWWtZVzB5OHd0Uk1XbDZxVDZ6T0RP?=
 =?utf-8?B?M2NNbkY0MjJxcWJVUzhoQWFIS3dWYjY0eGFBcmxzWWxsTk9OQWJWMGtRekFv?=
 =?utf-8?B?L3E5MHFYM2dQQ1RNcmZwbDVsR1Q1OGFTQ1QrYmhMa1RBSXZLR3VlbGVRVG1n?=
 =?utf-8?B?akVrdnQya0FWQjdiMjl2T2g3dEtVYmQyOFdPY1Qra251V0FMaFU4V0h0MlF0?=
 =?utf-8?B?M01mYzlRVHlJVHUrNnFsRDJJZmY2TkxqZ2tGOUM5M1RTRmVjSE5LYUpjUTJh?=
 =?utf-8?B?V0tzbmhSL092cGQ2UzhTWWNURUJOSHNwQXhzNWNIdENkc1MrVU9ONytzdm5z?=
 =?utf-8?B?dlJNTUt2dm1ObTFaREhFTzhRUHRDbjg3Q3pZNTcreURIVXd6OUNqOVhlN2tR?=
 =?utf-8?B?NGZrTzRwZHA0dmpRKzI2M3Z5VXpXNG1QRzFPNkNoTW5SVHNYazhrK2JtVkxY?=
 =?utf-8?B?QXFKT2FiNFh1T0pkaVNCVUxkOStNWHpYSlh1R1lYdEpDRDJHeUp6UjhUOFNY?=
 =?utf-8?B?dDZoNHdhNTQyWFJpQzFxcGI0TmJnRnBPanVac1krZ3AvYkZVYTEvb1lhd0FB?=
 =?utf-8?B?cmVqWTlBd3VLN2hxM0ZLRitzanhxc0VkbTRTMGYvMkJKZG1wOWRWRS9NbUtm?=
 =?utf-8?B?RjhITWlJN3ladE9HZmx1MU1xanJ5UXMrU0JDQ0FoV0g1V2RFeTExMDZZODFX?=
 =?utf-8?Q?ay1OIIZeIGxWS7BmMZSI2rcOeWA0doBjI0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:02:51.7099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: df53b799-0bf2-452b-00ad-08d8b3eeda3c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeYsD8TavUF5FIErthAFtrYOt+zx0+4UunYfqcAwJz81dL/RkHseE/dgqd8bAs6foMqz10501WeduI2M3DhkCJGqpjynIgb2mxxm5eZRHT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------4A594B02028C514E33D68629"
Content-Language: en-US

--------------4A594B02028C514E33D68629
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-05 10:16 a.m., Leon Anavi wrote:
> - Update importlib-metadata dependency pin
> - Add change log project URL
> - Replace Travis CI with GitHub Actions
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...on3-argcomplete_1.12.1.bb => python3-argcomplete_1.12.2.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-argcomplete_1.12.1.bb => python3-argcomplete_1.12.2.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
> rename to meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb
> index c14a7eba12..a08f882ab1 100644
> --- a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
>   
> -SRC_URI[md5sum] = "2262d0466a40d42267b424bba5010a0b"
> -SRC_URI[sha256sum] = "849c2444c35bb2175aea74100ca5f644c29bf716429399c0f2203bb5d9a8e4e6"
> +SRC_URI[sha256sum] = "de0e1282330940d52ea92a80fea2e4b9e0da1932aaa570f84d268939d1897b04"
>   
>   PYPI_PACKAGE = "argcomplete"
>   
>
> 
>

--------------4A594B02028C514E33D68629
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-05 10:16 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210105151638.15700-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Update importlib-metadata dependency pin
- Add change log project URL
- Replace Travis CI with GitHub Actions

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210105151638.15700-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...on3-argcomplete_1.12.1.bb =&gt; python3-argcomplete_1.12.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_1.12.1.bb =&gt; python3-argcomplete_1.12.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb
index c14a7eba12..a08f882ab1 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/kislyuk/argcomplete">&quot;https://github.com/kislyuk/argcomplete&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93">&quot;file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93&quot;</a>
 
-SRC_URI[md5sum] = &quot;2262d0466a40d42267b424bba5010a0b&quot;
-SRC_URI[sha256sum] = &quot;849c2444c35bb2175aea74100ca5f644c29bf716429399c0f2203bb5d9a8e4e6&quot;
+SRC_URI[sha256sum] = &quot;de0e1282330940d52ea92a80fea2e4b9e0da1932aaa570f84d268939d1897b04&quot;
 
 PYPI_PACKAGE = &quot;argcomplete&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4A594B02028C514E33D68629--
