Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.61])
 by mx.groups.io with SMTP id smtpd.web10.21211.1602868395430905173
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 10:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WuJb3lK0;
 spf=pass (domain: windriver.com, ip: 40.107.220.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A07fV5027jCJtl+BIitAv3ON2MrcLnwWaQM0ewNB/IZhTNy4BZscjFuwdYG3oR16axZ6HZs9DWdUZ+vQs1b/eM8/SJVuEL+a1sGO1NDY6wQnT6VpI8p6xPMsxiKLCTrzIMuxm4ayDt0x/o8Pcqdhryr67tz8JjMv3yisPwYZRxvSmwEbFZutDsFWxl6Lq7DRzCTCVhvKlb6D8wE5SlTLTj8wIHw0GvbUfD9+9hNPOx1HR8ZrAPHU0+6mLR/RQDU960SnkQ1doWpmlH3bI4I9Vr7K10ITFwGEN4ep0IDpO2e5R/ZqkH673i13wPQZC2mmI9Wz0tHZDwF9itTc2DvsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjLwZG+no9sFJJ5X8lNgkkjP4jtz/JDMapQIvspxI0s=;
 b=XpELWegxuCzA6P7v3x07WcvCLtWWh9EpsN0nlRG69nXNV2NCTDjmbUQUK5L+FXgB/Iy8TxUoELbj8xySVx62q9PUikaGY7RCDaiXymqOnMuOWVeL13kz3Ptn0izz9rlU18YYdkroGzQ39IgtrJAuQOArfzi1BroCho+OsyZLuZ2SwvuqjyYuapXeBiTIxTo7QMZSGbKJ4TNnIXJczNKfx5E2AUyweFGJkOtkYAIXsoHyYxEdIpB7FqWgYxbxx+LBeQVp0cwhDv18okugChvggR7cMXqTYRJYHqtcwOshUP4xwstL3xX7H2kinki383rn+BP7RwyxFH7ouHu9DSnADg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjLwZG+no9sFJJ5X8lNgkkjP4jtz/JDMapQIvspxI0s=;
 b=WuJb3lK0vM0j9CAbxp/BnViyHr9/r3crVgUQJ3J70AfjXVrAhr7vAOHZxBmTdc3CbqZBNkMwgS/cKYwZn+iDAeLbkPFbvpCcOecaWm8iDaXSzNVplB3qI0mr90+xzsnwr9p480RAjSenixc/PGwbkRVGUqS0VGNrIwYHu/0n5Yk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 16 Oct
 2020 17:13:14 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 17:13:14 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-isort: Upgrade 5.5.4 -> 5.6.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
 <20201013085914.31580-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <09034f05-30f7-f851-1187-48dd8c400dc7@windriver.com>
Date: Fri, 16 Oct 2020 13:13:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201013085914.31580-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY3PR10CA0029.namprd10.prod.outlook.com (2603:10b6:a03:255::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23 via Frontend Transport; Fri, 16 Oct 2020 17:13:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 795fd787-38e9-4a53-0613-08d871f6c400
X-MS-TrafficTypeDiagnostic: BY5PR11MB4182:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41824C284C95929444B29AD29F030@BY5PR11MB4182.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8xZK2jv5eIOpg/Bmo0gg+u2bExb3zgnZLA3DiyW2fbbrvr7lVKgacYItBuFkh71BV3sbdjyWmtHO/TLNhZRJSEEPsQ5Mr90NihKEZOf8opApG2U/suF1aMgbNhPVGgus4l4kpkqomlP9seECsW6oryZSzw+BBTFYULOaR/nVGcc79suiVbEtsFZWezrR3RBS98OJkZZHtekuJnbqZU4Z7x6fJ/wVNmfPAK2o1klyYLnF9qDtIKcStEsPAyADkqLjIlT/cDX9E6GzRgcgn0FDF4s+e5dAaa0kZ14rIgSdS7skMEDOd1oRR4Bb6kz/VjTzRsrri0B4KEkva4IOEP1hulQtMxQlWVZr9chRnaevi4loPQylJZk6/MP5Sv1Ox8XxCZ5cz+hsGBd5t619JM4VmQO1V9Ax7QX/eeYB1/bdmjBs363a+FNUp9HOMzFucLen2h7Ja3Gkyl85l6YnbkI7wOdzeduUEQcyFKGiMaMUyG0zjqpZD/1GPFRMEiWTzMW9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(966005)(66476007)(66946007)(2906002)(2616005)(66556008)(86362001)(478600001)(53546011)(33964004)(16576012)(36756003)(52116002)(16526019)(956004)(26005)(8676002)(316002)(5660300002)(166002)(8936002)(83380400001)(186003)(34490700002)(31696002)(6486002)(44832011)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/eVK0Mcjb1MYeATo14EWuTYTMqVtSF1xYFNvnOTBqVqAgdfSPtJcKDi6lmNPeF/6N16clDf7h3NjOSj3md72BqoZFrPOyiJyCEp8S+xx6kGlaABT5EgICLGI/a4ixvWsbyMfjk6xJKcP06QDKG0QdJ6Rc2z0QXNgiUh9+1eJSCHYszp6rlRWpVDYBgBr78XHjLyuchBTew5Kefq/PRvzPKQWSkPZN+miP5EmnU1ftGXoG+pbzLfnOLc1/U9QO9phBCEWxPJPKhMh5+OOA5NDPkzXjivKvksD/g6DZL9xUjTW17kqK0Mt1mMl0rJz1okk+XPbHAWdG6Ob71PWALB+hg7Riaa1NMlocRlTE4WCduk7+HrTPqbIQzc6ET2kdezRpvVvQlkNAcHBk6XnZgFDVgfXryGCpBmNjWrf8/2MRUTyaHgYon9e9aUNbXxnA1zCvn2SsAGzqhiitq8RTZvtfuGoQX2kuYSa366Oac8MAnBCwuC0B1YXY71ZDwOWojaXjkzu5/Jw13kIJguopkOesp6U21uCR2sFNWzw4cg6laZ8N3rERmh5VrgxCEvjtAhfHhDB9xqh/rCrFfxMlng4LH8WZqseUHLrhucp/ZDoMTx1tD7s6x3h5OGz5uXS3JvXB/uxtArJC37sMhYo8JW/dQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795fd787-38e9-4a53-0613-08d871f6c400
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 17:13:13.9453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gyPF2T3NWj8oxVZNMdry0RPdG+VC8IQ4sHzwyNwAyRN7AA0SDodoRmMatVsxA9/B6XwAiB9jPRW+JX8LIvinqpE1Ql3qtp9ANFDjoWinHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4182
Content-Type: multipart/alternative;
 boundary="------------41B4A7742C5E4D7A673D9946"
Content-Language: en-US

--------------41B4A7742C5E4D7A673D9946
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/20 4:59 AM, Leon Anavi wrote:
> - Fix: Empty line added between imports that should be skipped.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-isort_5.5.4.bb => python3-isort_5.6.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-isort_5.5.4.bb => python3-isort_5.6.4.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb b/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
> index 0c5842790f..66a5332be7 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "6b90dd55851a8ccb3a19fe2cb82cb82f"
> -SRC_URI[sha256sum] = "ba040c24d20aa302f78f4747df549573ae1eaf8e1084269199154da9c483f07f"
> +SRC_URI[md5sum] = "d2dfc32943b1d64311facec6a05c2f98"
> +SRC_URI[sha256sum] = "dcaeec1b5f0eca77faea2a35ab790b4f3680ff75590bfcb7145986905aab2f58"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------41B4A7742C5E4D7A673D9946
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/13/20 4:59 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201013085914.31580-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix: Empty line added between imports that should be skipped.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201013085914.31580-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-isort_5.5.4.bb =&gt; python3-isort_5.6.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.5.4.bb =&gt; python3-isort_5.6.4.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb b/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
index 0c5842790f..66a5332be7 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;6b90dd55851a8ccb3a19fe2cb82cb82f&quot;
-SRC_URI[sha256sum] = &quot;ba040c24d20aa302f78f4747df549573ae1eaf8e1084269199154da9c483f07f&quot;
+SRC_URI[md5sum] = &quot;d2dfc32943b1d64311facec6a05c2f98&quot;
+SRC_URI[sha256sum] = &quot;dcaeec1b5f0eca77faea2a35ab790b4f3680ff75590bfcb7145986905aab2f58&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------41B4A7742C5E4D7A673D9946--
