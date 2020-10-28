Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.73])
 by mx.groups.io with SMTP id smtpd.web12.10615.1603898517557841658
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QewCofIN;
 spf=pass (domain: windriver.com, ip: 40.107.77.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwjfqdmA8BbUgtsDl+b0y0oOMpzK7mjHrFzS8TbrbbewoQCy6BOtACEeBxFwr8zJBH3vZl0fPfdNChiCQmslTBxsof/9gpB221vb0INmPvtUVpLIee1g9HHRgc9Y8e4ejAEa/Nfubp9n4z5/0Ixu0dFYMSXInhQrLctKy2fz9+HDWXR4qHA/SghxoW1PYkf25NxqX1OkxbvXjni2tGsNP0/iP6xXxv1b4Jv/lQOE8iYSC7Pjubsq8Ga1oyRfA80gUQiSSSeXbpIN6iYwuzPPvHWey0fGDMhKAMmfg3Cfr06lVS4lLsdHWLHg355ou16H3RQlxFLDc+U62jrB/3ab5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lsy5bq/a6RWjrCBuv39mVIaPboy84WRJnhh+y+pvf2w=;
 b=TC1AsCCtriw/YX7Qq3dLw2wkHnS2saPMfRCmZwKg2Yd3SefJ2RGG5FOqR7t7fHVeQ328tMHT9k0sdOQ/l/uY9j5FtcmIGj5JyE+hjbkPWr9pXK0yJdirDYmTIaFOvoHiptHGcdVHcmwyIGyDrTc4tNiFbTt6hK3yHRVWNS/zV0oemnYeFH6ugTy8eug8RrmCPruV3oME7zLfH6oXfvce5yQqBxZX7TdO14h8RWM4I+m9EO7QNwoMNY477i/5+e9S09/OVIHdv/ZViYvFf5cdr1WKI+2+G3Mv5WG321zTCtl5hdgNktMLfjLKw2E+dK2vZkIlYhdZ1L5GqY7FE0Cj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lsy5bq/a6RWjrCBuv39mVIaPboy84WRJnhh+y+pvf2w=;
 b=QewCofINnhK63Mi8BH2HCDAceK+zyG+qE5mb6I3PyWfuqkjh+Bc2LgvsCmpes2jp6cNap3Z/iArLDlpjnpLOXMf37RsgEArKeAmCjE/X5BbCv8aNxbi7bTfNW7criTy1Psk7YFL/q4o1XoGNm7Fz71HZWAP+BqL+tABTlQy9zmE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:21:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:21:55 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-tqdm: Upgrade 4.50.2 -> 4.51.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201026090217.21174-1-leon.anavi@konsulko.com>
 <20201026090217.21174-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <570c16a9-9994-ccea-bb1d-51c3ebcd53ed@windriver.com>
Date: Wed, 28 Oct 2020 11:21:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201026090217.21174-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR06CA0054.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR06CA0054.namprd06.prod.outlook.com (2603:10b6:a03:14b::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27 via Frontend Transport; Wed, 28 Oct 2020 15:21:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38c808a2-ff3e-4c48-99c6-08d87b553433
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5008:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50087B1BACC1348718FC06359F170@SJ0PR11MB5008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1BEixiWO5WBc8DST7Wva8AVXsqZq0b7xZ3qN2dMApmLxwcnfSP54V/nX+fWdlEJMJaaap66WgZXyEgk0HdPO0BUWRsYuU/Hy5pwBySPz1wUtmmaY+O28LaQkEk9MxxOC4sFCmTi4fQ0Nke5xbGfBtG1frkikNpknVdlRcn3QKrp4meVJq6rE7mu28RVguCPV7mrQqHIU5oFflkg1Ie9ktl5/hF6GXKtAc+wGG5dPMz6CEhDH5BUf/B2o0aMV9ox485yYt0vNlegk0Z76L6a8t9c6sBztSEa0jk+ns99Ir7B3slheC67AX7r5LPT+eBSfDTL8hHYoJgnHfdOOJ7F6cJz4pRjs562tFY7249sBxaXFaph1IX9bLQRJwaIxCyEkCaRsk8Y2NiAU9R+geO8jfykh5nQtuR8GFv+iHR9o59uTQInREF+4m2DbYSS70QR9qTqsBzoXcio/UmUGBPuoAg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(396003)(136003)(376002)(83380400001)(5660300002)(166002)(6486002)(478600001)(44832011)(33964004)(31686004)(86362001)(53546011)(52116002)(2906002)(16576012)(186003)(16526019)(8676002)(316002)(36756003)(66946007)(26005)(966005)(31696002)(66556008)(66476007)(8936002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QyS38pHnabYN1IDWp4IxZ4LGO5djb63acvaVkQRJseqmMAHFLXQztc5++2yiwrZCPRLWOFIzD+qnW5fkAC0SQwwImacGbq5FOdajhHt+ot/hjSVav2iVq8FuxnnvMZmVPYkd2xNd6cV81dlR814RFXG8TFmT1lxP9+UUxkZxLyMJhlwhD46+lN1Eh9DZ9QicEqXBdWL9mzeOSPWDu0e7Ul4T5vEcAtfggXKqQhAiciVO7nawdg+9Tmhev7VFUVfxg9PmngS6mFNjputgtIwWBAdP5HEwsjkAHSiVt4sYo1a9Uj+AX9O5sigNlKYnRsNHZS3GWGBZNKi5iUGVDu3SFRYG1XZrsK0ZTdnxbLzrSKlUKKRpl3NlF5/7LX+nVdREig3859CvRQhxqoqX9MKDyGX9mQfsVgEZz/aPwM8sFwoG5IvYfv7z4QGRS3sBCISiPohvJV2HOQ0nR7YN8Ea6X9fkebnjHaKeEfOH13mtEaX+hFLCrjSKqsrb+KJmcwSYETxu5k+amYz3I8UtEY2dDPvUu9cYHWgC94qJlZ8RzHvSqgoBdPDCyR7pCo86m+A/3NGnSBHqyMuUm0ccpcY15+AWpR2mvugbD8KPvfnxh4ArHqMmR0R7eeGPNgGJ/rJmD3VhVXhGsPFl7UNeUbC7tA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c808a2-ff3e-4c48-99c6-08d87b553433
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:21:55.3177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VYtvdric8+VHVa1XDZhg3MEHZL9LTCkD1AH6uPJSR/nRIrLARSX5u7N32GDS6HxqAObwAjTgmuLyvem6wfQmBPm9EKlZinZqxpocc5pw2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
Content-Type: multipart/alternative;
 boundary="------------962AA2DEF5D364A233B80B1E"
Content-Language: en-US

--------------962AA2DEF5D364A233B80B1E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/20 5:02 AM, Leon Anavi wrote:
> - add {eta} datetime bar_format argument
> - fix py3 CLI --update & --update_to
> - replace nosetests with pytest
> - add & update tests
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-tqdm_4.50.2.bb => python3-tqdm_4.51.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tqdm_4.50.2.bb => python3-tqdm_4.51.0.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
> rename to meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
> index 9c2d06ba94..e4510ad448 100644
> --- a/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
> @@ -5,8 +5,8 @@ SECTION = "devel/python"
>   LICENSE = "MIT & MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
>   
> -SRC_URI[md5sum] = "2e56a15d28aa1fa06eeb31031c16c1f3"
> -SRC_URI[sha256sum] = "69dfa6714dee976e2425a9aab84b622675b7b1742873041e3db8a8e86132a4af"
> +SRC_URI[md5sum] = "b188c2dc7802c19b262971e566c265ce"
> +SRC_URI[sha256sum] = "ef54779f1c09f346b2b5a8e5c61f96fbcb639929e640e59f8cf810794f406432"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------962AA2DEF5D364A233B80B1E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/20 5:02 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201026090217.21174-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- add {eta} datetime bar_format argument
- fix py3 CLI --update &amp; --update_to
- replace nosetests with pytest
- add &amp; update tests

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201026090217.21174-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-tqdm_4.50.2.bb =&gt; python3-tqdm_4.51.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.50.2.bb =&gt; python3-tqdm_4.51.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
index 9c2d06ba94..e4510ad448 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
@@ -5,8 +5,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT &amp; MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25">&quot;file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25&quot;</a>
 
-SRC_URI[md5sum] = &quot;2e56a15d28aa1fa06eeb31031c16c1f3&quot;
-SRC_URI[sha256sum] = &quot;69dfa6714dee976e2425a9aab84b622675b7b1742873041e3db8a8e86132a4af&quot;
+SRC_URI[md5sum] = &quot;b188c2dc7802c19b262971e566c265ce&quot;
+SRC_URI[sha256sum] = &quot;ef54779f1c09f346b2b5a8e5c61f96fbcb639929e640e59f8cf810794f406432&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------962AA2DEF5D364A233B80B1E--
