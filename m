Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.89])
 by mx.groups.io with SMTP id smtpd.web09.7883.1614178041316181305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:47:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Vi9mPL64;
 spf=pass (domain: windriver.com, ip: 40.107.92.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCNrDDjZDdvUSMxlZP+I7c6qOUrJNQYUzuUMeRNs28o3uqKO4zwYiUINN7lhH2HnvVsuMFvW/dMR9z/MHhdcMFAgQuvfHkalqApj++LJmltQeq4tC37wD5mdwGBqZ1EaHc5/LdeNF1ZozyRj1drzFGS+btNiliADxf8yS5S6kxNz9Ge7IpERvBfyUiO/NZM3p9NeQfNqdCAYQsbL9jUVg7u2exl4fLqEsfQaiiYNWqHAVItdr/kbuROBwZykH93sv5qWngZhAeKXbiAvCbwhE3h+jhdrF9HqbYo75luYVf/RlKfoyvJ4eAWHEyCO5z5Y2R0Bf24xllCgbyqrjpe/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/jc10s0KypGHh5Y1EAWM2ZxYQgKML1hdHJixVJJTKI=;
 b=YBj/Hw96RUtWdzFBh6wLtiRIU9zb+edRQf6Tbe1RyYIyvTGsOYzMEYjS9I9hmBByjW1Xqb7aw/mo5LrtTIh7R3itpDU57nCftwTPf6LCXjqsOQJADaeQ8sL4/4LZ4+aWDgvRuBulBijj4eZxvlrua8Sw7HHZQgcOKxB/gYqQcVDK/lGM3+vFSIuZJRT3g0fSNU481Xtrh8EuOxnHHI1pJ8p+3MGvRJ5iKI+xe6+nXSxmJz8THzFi0BS2isSZoNlZsyW+IRqbp1Cka/e8nDiLdyWlImKONuNt+Ne8BxiYr85aQeRjvlCyIt7UZXWOCNmjiFlhUc4e+vW70NK9eaeCZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/jc10s0KypGHh5Y1EAWM2ZxYQgKML1hdHJixVJJTKI=;
 b=Vi9mPL64shOryRydXAQBuVCXgvsNStlAiEwP5A9y82R7DqabJUrbtiz8asUBPsOL+fYZEo/BE7vr1lmax14yB36FipmqJjKg8jxtYWJWs3PvYNQeiNzi4Kk4S6x9DMwcQ+XJEBSvSeQMTIKHVxetvjcI5IGSi1JII/OfloV9NB0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Wed, 24 Feb
 2021 14:47:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:47:19 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-alembic: Upgrade 1.5.4 -> 1.5.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
 <20210223152219.32129-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <18f728b3-dc3c-448c-7e0c-d10167638542@windriver.com>
Date: Wed, 24 Feb 2021 09:47:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210223152219.32129-8-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0279.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0279.namprd13.prod.outlook.com (2603:10b6:208:2bc::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.10 via Frontend Transport; Wed, 24 Feb 2021 14:47:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad8abb2d-8a50-4cc1-f187-08d8d8d31646
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB42606F7916DB14AD755502819F9F9@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cweZxVV3B/JfTmolbc3Vdw6uOhTyS5qAC16sqZSEct3xTI6lw5dGltO7FblD62k71L9Mk415VtED/Wqi5qU4HqnhURtqXt/CY1ctZBgkDDKcQe7sECdGIDVV5K1ju521V/jqbHdDKn44Sa/0bP2JKixhntxcssmkdKCWsUCQB9Zqa0z5zNq3oBF+SCP3IG2DLtHb0727drfK+0KTX0nx6rb3ngpoqz+GK0c43PODULC2DUlbzG2eYw7DfZhKgndQjG4BItAIprMmjRjSGR9uJSnhyb+bLbe4Intuji9f4rlBLSmK+8Z/sW7TZT05+AkQT/O67vp4BjxZGGi0U9i47Dl1rEj1GFRCQj/fcPSrabetLVut8R0oBBxC6RR305kfSalTwJeA1OxURsZ5ylzjY0F2wbK7Y52VO7Tn/qnXu5kDkd/esdsMaA1m7j7DFE6dx+Bqtoq2E5Cdy9xrprUaYSrDiW/bgr/CruFNp/ebMU5/l5zvfr2sodWqkX07+x1Qtx+Krh03RxouRQvi4iTWgf3Wpsr9jEcJ3dGplEwVVgIu2zl6Ne+VqPpXUy/Xqa394xWyPJAULU+LXVBljwSSP/AqFHxpJY3mOukl9Kg/wmiYGpWP4/tmH+N7peHHM2mLSj4vtmuZOMX3ClzZth+6CtOJMPQD4tD00+ioe0ubaM9pRptdqnWquxaIuY4RIRWN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39830400003)(8676002)(6486002)(33964004)(8936002)(44832011)(2906002)(66476007)(966005)(36756003)(66946007)(31696002)(66556008)(31686004)(956004)(5660300002)(166002)(2616005)(53546011)(83380400001)(16576012)(316002)(16526019)(186003)(478600001)(26005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Y0UySmFRSWZ6cytRTnJTbzRWR0NvZDhvcjF4V3ZmRmFkV21RWUxydEM0Tkpt?=
 =?utf-8?B?L2N6Uk5TK1lackE1Y0lRcXpkZ2ZkVkVMYjU5WTl1TXBZajk0SUVObzlPWVc4?=
 =?utf-8?B?em1mQjh5M3ZtdkxGb3JZSTVZS0ZxNjcyUUNPd01xaFp0aFVQZm5wK3M4bTM2?=
 =?utf-8?B?REdhbUJvWWdLZFZsYkNzYnFndmpqbHRhL0pmcFR2dUoyUThxK29majYwL1lL?=
 =?utf-8?B?Y090dGdNd00zdGxkb0lEcDRpZjBVY3NZL1JRWGpKZExyeVhUanBPRmhRZ2I0?=
 =?utf-8?B?bVFNZWVhV3lFS2pIODFEbjY5MVlQeThTbU1KVHNneTNUTnVWYnNINmg3ZC9H?=
 =?utf-8?B?UHNwOFhBTWZPZzl2UTFEbWUzcExBMnZzYkhGWGordkhMUVNFclNEdE53K1Y0?=
 =?utf-8?B?MHlSa1BuZS9oMWFpVll5bTFCbE93bTdIRmtjaW9kMVhwamRYVktrV2hhUC9W?=
 =?utf-8?B?SVY1c0NmSFhZMTVjN0E1V1Fuam1ZZEgzeE1YYmFhYytscDUzVy9hbFRRZEw1?=
 =?utf-8?B?ZnN0MG9WamdnVDdVbjNLNmtOZmNIUEtjVFhPaEdVN3Rwc1lUVEk4MDdTSEQ2?=
 =?utf-8?B?TVo4bVFpb3I0MnVrR3BIMlhubFUwTjcvTmx5ZVZCTjY2WVY3OVI5Tll6aXVF?=
 =?utf-8?B?Q0ZvK3FRVXYvKzlka1lmdk9ib3N3dDZBblZGbEFWRnpGUGkrYXBPcTBOL3NQ?=
 =?utf-8?B?S2lNa2htUGkyOWxXRS9QenR5WWN5dUJzeWYxbVYvR0dsSTRkblZYdHRnTnBm?=
 =?utf-8?B?YWtXU3VaUWtEemlNem9yNXNpMXUzcGZtSVJDdnU3cXFBTlVNVEZwVUw1T1hl?=
 =?utf-8?B?eFJ2RnZpclU3UThlMVpRbEkvNmo4YTB1c1BBM0Z2NUliR3o1R25CWXpUQk9p?=
 =?utf-8?B?MGxReTZEZ3lrTjNwRlprMUhQaXRJUGxMeGFMK0E3cnZaREM1SitIRTRQKzFE?=
 =?utf-8?B?OGpyUWZaYlViUXdIS1dyN1k5S3g0QjlTUjMyeGgvcCtnQkVLcFdvWktwNk5T?=
 =?utf-8?B?ZGJ6dElNdUpzTWs2ZFhNc01YVHFyOVorM1lJdnlGNVBlYlU3RGUxWEFsZlF0?=
 =?utf-8?B?TTN0UC9kTlB3dFNieWo5eWdLTVZMaVhJSGh2aHZjcmpJcGMyRmxHT0tEREE5?=
 =?utf-8?B?TDRrZTRGTFhIdHY4bitmODdVNW83NElpclQ1U1RyMGZTYnBDVWlaMFM3Qmpi?=
 =?utf-8?B?WEZLUVRzakNDZW42dTZ4QkhnaVBxaU5weStCWmU1dmtNelJxTUVLR0lDRE82?=
 =?utf-8?B?dzZqbFphcXNrL29tMjYyOTJ0RTR3SElXVlZ5KzJhRzQ4VHFiM1lRYXFKOExE?=
 =?utf-8?B?QXdTVXhyeWVsL3p6d0xxL2VJZlp3M0VsZ3ZERkRFbllVcmRYTWVOWWFUeHVm?=
 =?utf-8?B?Ymc2b0lYd0JzWnRKdTZxMVhQSlp1MVZvZzJuNklPQUVUWU4wZ2N5K0EyQmti?=
 =?utf-8?B?d3UzcmxyaDlmdHAyWWYzMG9JbXgrSVY2Qmd0cG5oYXlsT0JtSndLZlZXb2NP?=
 =?utf-8?B?a1p3czF2cHNuQjFrRkc4blYvK0xhVUIvblVSMjdkalNPdG9nM2RPMTV4ODVw?=
 =?utf-8?B?S1lGZStvRktYbk9mb3p1TGdUQjhhL0ZORi9uRFdNNzNWanpDM1RtLzFKaXZN?=
 =?utf-8?B?dExRdndKejVxZXN6ejZRSTViRVN0MklUTmJFeTlMQUJMZGg5eEZwWVRCblJu?=
 =?utf-8?B?WVY2M1N4OXhySUpkNjlnYWRZak9MYVZNcjhSeVhiTUdKY2p2OS9BU3BzSUtS?=
 =?utf-8?Q?xLFIQ8sYrHttcW8GvjlZAGa5j0aSaJPMsRIRTpE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8abb2d-8a50-4cc1-f187-08d8d8d31646
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:47:19.7841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNaufyyxcndgUpOqnxvdT8YCMGuKtG6D/LRabuSxtAfdX8Htfi9TFE3wdgzxBdLQmHa27TNTFkYowBTvFftj/rgal4eEawfNFA3bLBgVV0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------D46DD2FD7013F8DB50DE8E82"
Content-Language: en-US

--------------D46DD2FD7013F8DB50DE8E82
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-23 10:22 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.5.5:
>
> - Adjusted the use of SQLAlchemy's .copy() internals to use
>    ._copy() for version 1.4.0, as this method is being renamed.
> - Added new config file option prepend_sys_path, which is a
>    series of paths that will be prepended to sys.path; the
>    default value in newly generated alembic.ini files is ".".
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-alembic_1.5.4.bb => python3-alembic_1.5.5.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-alembic_1.5.4.bb => python3-alembic_1.5.5.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
> rename to meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
> index 9a0991d3cc..92b691e171 100644
> --- a/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
>
>   inherit pypi setuptools3
>
> -SRC_URI[sha256sum] = "e871118b6174681f7e9a9ea67cfcae954c6d18e05b49c6b17f662d2530c76bf5"
> +SRC_URI[sha256sum] = "df0028c19275a2cff137e39617a39cdcdbd1173733b87b6bfa257b7c0860213b"
>
>   PYPI_PACKAGE = "alembic"
>
> --
> 2.17.1
>
>
> 
>

--------------D46DD2FD7013F8DB50DE8E82
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-23 10:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210223152219.32129-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.5.5:

- Adjusted the use of SQLAlchemy's .copy() internals to use
  ._copy() for version 1.4.0, as this method is being renamed.
- Added new config file option prepend_sys_path, which is a
  series of paths that will be prepended to sys.path; the
  default value in newly generated alembic.ini files is &quot;.&quot;.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210223152219.32129-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-alembic_1.5.4.bb =&gt; python3-alembic_1.5.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.5.4.bb =&gt; python3-alembic_1.5.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
index 9a0991d3cc..92b691e171 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb">&quot;file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb&quot;</a>

 inherit pypi setuptools3

-SRC_URI[sha256sum] = &quot;e871118b6174681f7e9a9ea67cfcae954c6d18e05b49c6b17f662d2530c76bf5&quot;
+SRC_URI[sha256sum] = &quot;df0028c19275a2cff137e39617a39cdcdbd1173733b87b6bfa257b7c0860213b&quot;

 PYPI_PACKAGE = &quot;alembic&quot;

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

--------------D46DD2FD7013F8DB50DE8E82--
