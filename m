Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.73])
 by mx.groups.io with SMTP id smtpd.web11.13257.1597334121132739530
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=qB119t0c;
 spf=pass (domain: windriver.com, ip: 40.107.93.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEGEpUdPYAzW+A1VLhFM5RFSN1J3H08tgBf44eBKkriQ8u4I9Oj9GLdbvMVQz64T3OdBsA1Bt0Nhs+G4DoqQKcJ06J+tuqkz7yCnSCjaX0OyPGK9/LRfh21U1p1DwmVAz63PlkeWzXwEOOHwu/CLyR8vT/0o/Z6mc3viZIWBUOP0AV164AE6IWb2dIhGAJDFZ9UkvAF+yy6uJ77SbYeIdKGhbh0SPgl4TWiAZp6VK7YKJvtIGUvoWpZ1avQWyy1m8fsiVEBbfBiJpl/b3svCIU92UCrRWq8GRlIkFqvMTYUYe0Q8JnAerr79XROEcypmE7K7hhngq0WarrxOrW4jpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIpSwnTncPeoDOiTINQdDSXOuD6EtZ4H5Ezl5ih7n6w=;
 b=CtxggRpts18vAtwnX+g6sIIZlomCe2shVwD2j0tm9XD/UZBfidsPIemStiediYvBL7DbAa7xqzBi4C+RAXWXa6D/TGjy+V+Nf3z43Syo4RbWHP6+FHQOOwMOlZkm3/uqj4jkvogMj1vphzK57sHsgAGLDrpMIKLyUhNLEV4OrpT+Oij0k9fIm5lcR58sA8HSHK5/+XnN3UvMbpFGq1nWQ1tUQLhJ8J5XH7mmsOEzyb8EKzL+kteZuwcpqbaGCMaZn5nIQarTzBaU6jPEDgib1rN2xb1J/fs5pfsS4hu9bps8eV2uRkIDgHu8bAgzn+3WPURIJ17S222wZKYFZiUNtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIpSwnTncPeoDOiTINQdDSXOuD6EtZ4H5Ezl5ih7n6w=;
 b=qB119t0cF/xAWg/pe5iKiym8X18AkhBXUMle/QfP3TuvbH43fVvx77LTR1WQfY4UKVoxVu/KUi0jzH3khSjnH0Zt0t+jwU/1McYeOBLdIFZesDPpYKZ5S5RFkdc6U/yxcLA6lAAl/+kvVOn4TEQj+0S96OUOK/rXiK5dUqprWeg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 13 Aug
 2020 15:55:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:55:20 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-flask-login: Upgrade 0.4.1 -> 0.5.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
 <20200811114430.27916-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cd1f4ec0-c674-5094-639d-17b090d8a58c@windriver.com>
Date: Thu, 13 Aug 2020 11:55:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200811114430.27916-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::9) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0070.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 15:55:19 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23608bb7-2f7a-4bf6-bce7-08d83fa14798
X-MS-TrafficTypeDiagnostic: BYAPR11MB3814:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3814A963C1B2F320F9BC4CF29F430@BYAPR11MB3814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:177;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UNQLst4yFmobgtkFetXWO8Sbm7om7J4kPE9ssnWg9jfjDWTK1nDt23VzsIP1YcTGGo6K/nRk7Qg6qXJ5SDWTIC7Hr+wWpRjCigQ5FiyetuEw+oS6cXeyh8NoERf8pS+5UB+PnA0wQgQgMPTzv1tFcL904P/d2ETz4fRhLHww3wmepZTcwXs2aJnYk9ZRljUsAKU5+ZoZJ6sL02Q0vxE5yyPzYQD2JSNdOS7Qk6X2QPNcstKbMaQlBGZNsF8bOWDmmUE72n4qSpfU1C2lX3VSrSVZgJLXHR9gU/duP6KAaTL5q1Gzer4av2Nw7670HLx59Uugpf6arfBSGmV3Xouh5TKMixCzQpYamTORb75A7yaN223TiRngYkHrmQRXdk4BHzRPLEslQ/RKO5Ct3/Q1keYPS8hMTk8Q5LGp4FSD9UqSwy/sB4PvrJ1qJQ+PgJpm4WRbt8XqCcjMZPGMnbyHCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(8936002)(16526019)(66946007)(66556008)(966005)(66476007)(2616005)(31686004)(31696002)(44832011)(186003)(956004)(36756003)(166002)(83380400001)(26005)(86362001)(5660300002)(16576012)(53546011)(33964004)(6486002)(52116002)(8676002)(316002)(2906002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Sxd6FodOO9PT8ghtcuZW1BiI5QB9XfZEV8VHBMWt6TJ7pgwaQijW0zTrnnBOONXip/t0+JVH4NC9r93EBKwdqYmYY8sXhWfqAxXTxfMZLrvET5dj5fnoFfeDrRyzSBGOivQB3bduf3Gv9zrmkSr/6Uhc1/lgpYvGIPtnA+V/euTvs8ueQqJLNK7j56M0IfSLgxb+RFrYY27u5im4s9lKM7gSKOT5xy4ReCSUaUd5wJtaZQZop1svFkFvJ2bOjF39SMa9sHKNRLYEvFTVXKK0bkmpJ4cHYNsbzEgxv8baSmhwxfDoi6NVAOYObg96Dt2sXB2fGZcnDAkB2K77GXq5iH8NeNIgUrry96V2WcxF3pqU5B0sLaoJGGX1nEVw9R2bNvEVkn1Qa7E1xG/nl3RdP6vzGYZu7r+w7aKaQLLI3h9Z5qPbdy77n9EiG9+bA7KpmbEAiGRdN673B0vaIvfaUygy1p9r+ZZIOemkYzGp19exzhlMrXr1QwIzVc+wezXQyyTk/xBYyACi+E04qxfsJ7P1Iw+I9DV5A5rwP1wfHnj/kKMj7gSpuVxP+m3TgVUibvjUPPx8CUHASnpKS3Khc41NY6as3kmUobh8C2sbYKK0MGrHE7R3ycWxoTzTRYFsUN74aL/S31uEsPUILAut5A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23608bb7-2f7a-4bf6-bce7-08d83fa14798
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:55:19.8560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5uJzeO04SWil6b/3TDb5XOtAucqCxPbRAj2M1rzko4dbLGCUkcwCsgDBLvKanskciMXw+Cx8ZRp/qShpGZJPnZzDhy25ACH3f5thOG8Sq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Content-Type: multipart/alternative;
 boundary="------------8962856495DC800F0DC99B98"
Content-Language: en-US

--------------8962856495DC800F0DC99B98
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/20 7:44 AM, Leon Anavi wrote:
> Upgrade to release 0.5.0:
>
> - New custom test client: `flask_login.FlaskLoginClient`.
>    You can use this to write clearer automated tests.
> - Prefix authenticated user_id, remember, and remember_seconds
>    in Flask Session with underscores to prevent accidental usage
>    in application code.
> - Simplify user loading.
> - Various documentation improvements.
> - Set session ID when setting next.
> - Clear session identifier on logout.
> - Ensure use of a safe and up-to-date version of Flask.
> - Drop support of Python versions: 2.6, 3.3, 3.4
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-flask-login_0.4.1.bb => python3-flask-login_0.5.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-flask-login_0.4.1.bb => python3-flask-login_0.5.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb
> index ba335579b..d776ce968 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = " https://github.com/maxcountryman/flask-login"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
>   
> -SRC_URI[md5sum] = "25b34c74bd509792f291c16e184225df"
> -SRC_URI[sha256sum] = "c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec"
> +SRC_URI[md5sum] = "a2d94aa6ae935345ebc68eb3cbb5fccd"
> +SRC_URI[sha256sum] = "6d33aef15b5bcead780acc339464aae8a6e28f13c90d8b1cf9de8b549d1c0b4b"
>   
>   PYPI_PACKAGE = "Flask-Login"
>   
>
> 

--------------8962856495DC800F0DC99B98
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/11/20 7:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200811114430.27916-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.5.0:

- New custom test client: `flask_login.FlaskLoginClient`.
  You can use this to write clearer automated tests.
- Prefix authenticated user_id, remember, and remember_seconds
  in Flask Session with underscores to prevent accidental usage
  in application code.
- Simplify user loading.
- Various documentation improvements.
- Set session ID when setting next.
- Clear session identifier on logout.
- Ensure use of a safe and up-to-date version of Flask.
- Drop support of Python versions: 2.6, 3.3, 3.4

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200811114430.27916-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-flask-login_0.4.1.bb =&gt; python3-flask-login_0.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-login_0.4.1.bb =&gt; python3-flask-login_0.5.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb
index ba335579b..d776ce968 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb
@@ -6,8 +6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/maxcountryman/flask-login">&quot; https://github.com/maxcountryman/flask-login&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596">&quot;file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596&quot;</a>
 
-SRC_URI[md5sum] = &quot;25b34c74bd509792f291c16e184225df&quot;
-SRC_URI[sha256sum] = &quot;c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec&quot;
+SRC_URI[md5sum] = &quot;a2d94aa6ae935345ebc68eb3cbb5fccd&quot;
+SRC_URI[sha256sum] = &quot;6d33aef15b5bcead780acc339464aae8a6e28f13c90d8b1cf9de8b549d1c0b4b&quot;
 
 PYPI_PACKAGE = &quot;Flask-Login&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8962856495DC800F0DC99B98--
