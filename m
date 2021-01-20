Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.43])
 by mx.groups.io with SMTP id smtpd.web09.27875.1611149720052370136
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HKcljO+J;
 spf=pass (domain: windriver.com, ip: 40.107.75.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkAEyGCPf8uqkJOsQasUHfTYpWCvFQR4I0c+/MNSuRItkad9YFTNEqAmU3HLCQ6cal9tXzacKT5BjV2beIB3EJfIUZ/0jvMV9RXemZJAn1tbtfBJeLNnPc9sQXK/bBQaZhqYpj0ldnqX9ls2bxRKHKRL9XQF2ChD00GqByef5eSZQzETRHoAWYxksi6Ch4ADU9cUjynwpiLUbtsRbwJA6p5HMtt6LpCnKdfANv7PYgEmtnEZe+fGhm9KINZ6dx4US+eSCuQU859ToLmh5+Da9Ta/c0tuF0/aKI2popEV0BanKbHTfekNdXZ/pOCjbEF46iKrZhAwdmqfCDgbJQbb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pnm/s9V6aPFVIIVBSCg3iR/fA2HwTZrKc2i5mUtjyqU=;
 b=TE6VzJsGXhAePm59XfIBe1QJzg9x+/wDVsNvq651zWVfX16jFwNGuUSb7CDELwnQhkW5nOn0y+5aLxfduXKng8kFF7xM3VZUtNYUoPG1O1ZOHDyM0+sgUtDSRlC/AwWw4TQ/ueyNTCwdZLNepYM8SBz9Q39jxlH86r9RKbOhTQ/A8OAn5n5q0IhCVQ23i6yHPMjfEVv2ZlgCsPfarr0Igd8n30/e6M3Bd+Ch+O/cvd0cWqVhTH5GQZN8IUTxEukpaaMDA3gEZINoMlMB/7Lx6BbMq1h3yDkqEirUYJsPykkL1BMJIs/8+kyCI8HXhTNh1EtV1trev93nI6eMVip8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pnm/s9V6aPFVIIVBSCg3iR/fA2HwTZrKc2i5mUtjyqU=;
 b=HKcljO+JvDd/eBOcp/fr75tmufjU/P6ztJzMHnl5yUVwDR+SZVz/N5ySDDCWO6np4Oy70pX3hw5If7VSfqWxJLwNSF9MpRVNd398Gr91A9niN7QAXabNowWFxzM6vBpbLBi0zyb1nNYEf7eOvgtma5595wlrVDeBe5aIkeH1/Wk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 20 Jan
 2021 13:35:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:35:18 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-lxml: Upgrade 4.6.1 -> 4.6.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
 <20210119173746.24694-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7f0a94fa-d627-7479-e856-264f37222254@windriver.com>
Date: Wed, 20 Jan 2021 08:35:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210119173746.24694-6-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR14CA0025.namprd14.prod.outlook.com
 (2603:10b6:610:60::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR14CA0025.namprd14.prod.outlook.com (2603:10b6:610:60::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 13:35:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26552252-558b-40ac-23eb-08d8bd483a1d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3559FC7353D5097567926AF19FA20@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7YOdjhq1lw3lR6kqePMI85+fluDlvGC8yY/Jeh9vLuu371HGHeoIWydzy9rAdQZjsnMDnFAk5DI8hV9i2Hxm+WLCTQax78zEknz03odv+E+RcD7wZiXAUHJXPPZm86VRXvVz8M/nk+AF5OTWdtIqIi8P/txSNKonFV4LKPLHfIRXUJ2/7Ww9BOMoL1dTNimqRjZedOPRikKHd6LXjm4W3aJFIZ+acMKItku6MfRJtBNmfJtde+N8DrkUq9kIK6nhzgOl3xAT5QGO2adQH/JVMUwrx3P86J1m3zVWYBplXO/byqrdRXRoci6aa20Q6GKFFWWv1QzakyYrtwpDPRQzTvJItJGMrdYwOh/PjaX5QmkG/nUhdIarUMlxmlOL1w3+5oqy+IbBT53ejEiME8yM2D/LPgv6SydSqT6DhK2L9iDjz+vU5tk9HLkZi+XKi9lvlTXjfWLNADPsMOboDEOqIeWZb1dT1DhB7PKdLiwqYKDtYKXa5g78Z7cNa9WveLyO8uvdnUvmeIpvLSqqnrcQmTrxl28u4+S6XJIR+IVDiMrKQQxywZNaKiXFEOt6KKqi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(956004)(26005)(53546011)(44832011)(478600001)(33964004)(16576012)(31696002)(86362001)(966005)(66476007)(66946007)(166002)(83380400001)(66556008)(186003)(16526019)(316002)(2616005)(5660300002)(36756003)(6486002)(8676002)(52116002)(8936002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?czhPODBKemVqdGFLREkvdngreEhQazhCa0g0cTNqamt3cHBZUXp2Y1BMd0lS?=
 =?utf-8?B?aUNXYUpTNjN5aEt6Y0pacUljZk1TYXg0bkxzTTNsdWF2Z2JvWFRUdGU5SXpH?=
 =?utf-8?B?SkZ2RytkbU9RRlIvQTB1Ni9rYnU4dHlUemlJTDBCK1RrSURPUEZsbUQwTGpR?=
 =?utf-8?B?d29ObjRMcS82NGk2TVZMNlF5YkIrTTFlRFcwRTRpL3ZET2xtcy9jVDJiR0JP?=
 =?utf-8?B?NUxKbVpsRlRLbXhLdGdOTEtLWWxFOHRQS3V0UEZqcnBPamFrU0hMT3BPWUU3?=
 =?utf-8?B?NEdYamFGYWhpYml3Y2NOL2ZHZkdvc0tyeTg1ZlZVanJMZTNlblgzRzVNdVFz?=
 =?utf-8?B?ZVY4Z1ZRZ3ArajVjTjlBZEUvTklJTDN2My9pMFdhL2hFbUVzdnV3b2swWkgx?=
 =?utf-8?B?MVR1K3ZRMmlHdkpwRlJvM3V6MmY5VDluM05Ec05LQzBsaXlINkp3eGZvQkN1?=
 =?utf-8?B?cTB0Um5IZjRmU3I4U0U0TWM0KzhnNU95QzlCbG15UVdQL2N0ZG5pTU1YVmJG?=
 =?utf-8?B?cGRXYklDRlFsb3BmbHdHZm0zNWNFL25aL1dOa0tta2tTWlVLcFlUNXBLY09t?=
 =?utf-8?B?Q1F4MGtud3FTVldFTDg5S09KTHh0RFBxVHpYMC93alBjUU9xZGpqVFlRS1lQ?=
 =?utf-8?B?Q1lyZWtGYTZ2NFhDUHJMellXS1R0dUQ3eEhtYnV0ZFZBeEVaM0ZJSTVkUmZT?=
 =?utf-8?B?QjZMSGVhOWgxaDAzUXRHMlFPSmpIV1NUQ003QWp3M1ZMVDRhYnU0K0VEU0o2?=
 =?utf-8?B?ZnpVUklmdVZJRjRLZk83K0UvOUUyVi9CenBJZ3ZhTFJaM2FYYXc3TUgvOG9r?=
 =?utf-8?B?TjF0ajNXQjhUZkZDd3huT3BBeUZKcWpZNHJKV05WNTIwc3cxdmlENHI2N2o2?=
 =?utf-8?B?ZW9Ga2ZLNGkwVDVpMUtmTm1KY3BtTjJVWHR2dWtZdUUvNTdicjBaaEx6Z3hF?=
 =?utf-8?B?ZXlrZk51OUpseGo1YlBKd3l1dUI5aXZ6T0I1SzZNZlRrMVFlTlJ3ZWlHb1dx?=
 =?utf-8?B?UkhIWGxvTmRqcjYxalBHdlpFZktBcEVNeGhwL1hrWmlob3gralFVNE9SM21W?=
 =?utf-8?B?c3dPcldGUDhCY2pjbmRRWkZBWkpqNW13aGU2dVhUdFNmNHNkQ0YxS2grWW1k?=
 =?utf-8?B?YkNqdnJseXhsSXBsRWttZFNQY1lsUnFLMTZ3V09yV1ZEYmRuWEpUTytwWFFW?=
 =?utf-8?B?NHh6cVpWMklJeVVzd3R6em4xc3p0cnNFUjFxeGRsdCsxZ1c5TFliRXhJZklV?=
 =?utf-8?B?dDFIak42Q0xDeWRTYkZpQWdFTVRXb2tLekZyM1Bvem5QMlFqWC93M0Jkenly?=
 =?utf-8?Q?rUN6ffeQS7oI7dA8SZoEZkrpBwPaY3u5iK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26552252-558b-40ac-23eb-08d8bd483a1d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:35:18.5457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3vh1gGauWRS4+Nnf0UuTeeVi8Mz6gBpHVTlUZCpFXvOSrWa6bLmEwIA5H6xy2HBO78HSbf+ALpVmKp/ig0cGugKIkBCzoP8+7xuSasvOoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: multipart/alternative;
 boundary="------------CC35B11739AC00B4F87CB507"
Content-Language: en-US

--------------CC35B11739AC00B4F87CB507
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 12:37 p.m., Leon Anavi wrote:
> - A vulnerability (CVE-2020-27783) was discovered in the HTML
>    Cleaner by Yaniv Nizry, which allowed JavaScript to pass
>    through. The cleaner now removes more sneaky "style" content.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-lxml_4.6.1.bb => python3-lxml_4.6.2.bb}    | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-lxml_4.6.1.bb => python3-lxml_4.6.2.bb} (93%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
> rename to meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb
> index af012e630..f7aed6d77 100644
> --- a/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb
> @@ -18,8 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
>   
>   DEPENDS += "libxml2 libxslt"
>   
> -SRC_URI[md5sum] = "10924ab543397a06cb4cfaf9bdf0b80f"
> -SRC_URI[sha256sum] = "c152b2e93b639d1f36ec5a8ca24cde4a8eefb2b6b83668fcd8e83a67badcb367"
> +SRC_URI[sha256sum] = "cd11c7e8d21af997ee8079037fff88f16fda188a9776eb4b81c7e4c9c0a7d7fc"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------CC35B11739AC00B4F87CB507
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-19 12:37 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210119173746.24694-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- A vulnerability (CVE-2020-27783) was discovered in the HTML
  Cleaner by Yaniv Nizry, which allowed JavaScript to pass
  through. The cleaner now removes more sneaky &quot;style&quot; content.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210119173746.24694-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-lxml_4.6.1.bb =&gt; python3-lxml_4.6.2.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.6.1.bb =&gt; python3-lxml_4.6.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb
index af012e630..f7aed6d77 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb
@@ -18,8 +18,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403\DEPENDS+=">&quot;file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += &quot;</a>libxml2 libxslt&quot;
 
-SRC_URI[md5sum] = &quot;10924ab543397a06cb4cfaf9bdf0b80f&quot;
-SRC_URI[sha256sum] = &quot;c152b2e93b639d1f36ec5a8ca24cde4a8eefb2b6b83668fcd8e83a67badcb367&quot;
+SRC_URI[sha256sum] = &quot;cd11c7e8d21af997ee8079037fff88f16fda188a9776eb4b81c7e4c9c0a7d7fc&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CC35B11739AC00B4F87CB507--
