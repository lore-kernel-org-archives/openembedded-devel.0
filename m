Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.41])
 by mx.groups.io with SMTP id smtpd.web12.21579.1602868690459374328
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 10:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ha9QoJ16;
 spf=pass (domain: windriver.com, ip: 40.107.94.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9qtwFGxL6/kf/l0UOljHW9K6qO0ryk9e8fssyVYjuWZF/+wSm+XR9Kshs6zq1o/4s01L5NlCRqwl1JTARZhlTKj98VStxJKMr6VTs0rOgTsCLB2agg9dQZc20SeweQTsSdJ6S+boUcvWe+bxOfQXt9PN6qJlCBtPUDhqFhszpaPKo+U2Dw5WIi/5M6WmNCamliqKAttSJUikOQth63xurlcDnqw0oQT6WXKaoxGbk8U3gglcBRShZ7KrIW+/uIFJ6AFYCRIIySuYl4ZgyOlzMG34FMZPZDNjrCf5R+IcLez/FmvlY/4OwER4KBRx1RskjK7I/r8OM9GItfAxmiJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwvWwzC0/FEU7h6fLqM3da+PGa2SHU2H9Xb5+b7lOTg=;
 b=bycb2EL9UcqPIXa6XfV04kdSRKRCGkZpL9+JP0VDr9SB+gqk8bT9PY+K57yLHw1HRXtEterZAPKWxffxBNpi86US9vfRkFw6Bo0oczqJxlhc8QbvV7//KFpkXvj5TIBgSIx7Y/dcQa7J2IwuKfEz43fDItdWzwDpc2hf/NLRGwZdIyBNGRtjsh2UDN6ACH+oN4J2LMN+JZZxc9M470wPwCiKVo5GZawPmQtMM+9KvnklJAnzSDPrOXBl/YrLhMRA4ehBzMccZ6cR71F14yJMUlOUkJQf3omZ1OC2rFB9x0HakEK8r8qeo7BBkswOdJTjefB/HdQZkbMrpaD8RmBNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwvWwzC0/FEU7h6fLqM3da+PGa2SHU2H9Xb5+b7lOTg=;
 b=Ha9QoJ16qmuf6zuTgotbIKEd1w7xvREtKPOeAGGP4Dq6lMBz7TOh7/4EJfCRagomHEUdLUZAXjlMEQy9ZNFm/VRyy/sVMPF7rXYGnLq21GLhvlhBZCDUZI2KwOjDwXH6Jqof54jT/F1wF27csvzbWshZmvhGE/KMOYpMI8WGivE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 16 Oct
 2020 17:18:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 17:18:08 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-sentry-sdk: Upgrade 0.18.0 -> 0.19.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201013114654.5610-1-leon.anavi@konsulko.com>
 <20201013114654.5610-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a9ce0125-ab30-ef83-b5dc-2b8cb1f9d3a1@windriver.com>
Date: Fri, 16 Oct 2020 13:18:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201013114654.5610-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:a03:167::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR17CA0045.namprd17.prod.outlook.com (2603:10b6:a03:167::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Fri, 16 Oct 2020 17:18:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6f871b9-f33d-4827-86f4-08d871f773b0
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226021651687BC7E561AA099F030@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:184;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PaLOiePSsy/DqGvXQl/dBxFLE0GcLnJXcpSUcZsx4z9C+OzrHfHI1Rj07qad7e0nwPpqlfuPJnwqy9fNm2NxSwtNC3LzkFH8VciHqr6Jb012RWt2WfNecubRA6p3mHmqEKBM/gDIfpJzKvesIicc4yn4d5X08a1x2PBythGVel1NB+HrGUiADSaf+TSPPqtYmBd/Dby/iDlxDN7puMmpNli+PaHp0jR8CElB1nzqK+tK0CDaWBUxA4GwmPt1u4HVjO/pJIJrBg6AdNNdv3FtnJ+Ohto8ZG7yJOd4NgFTTwn/PqZZ51fBMB4FFDCqoaEjR8uzgJfIMf11KhVIWu8W+wymb1NjoMKSlw4YfOAXJiIO2ici6MlXaJLxStm7+9CQFsB9nByGrzAei/HbQ02C9AiVh9gVTHqueDl/P6usxut962cRLyK8SGcDB9/OzIoZjmW5LLy3d+jBOzi+k52oUZ7Cs1v2g1FDDYf90/inlNJ0go+O9h/8Csmwx9x6reoI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(16576012)(66946007)(86362001)(31686004)(478600001)(2906002)(44832011)(966005)(66476007)(33964004)(6486002)(316002)(31696002)(66556008)(34490700002)(83380400001)(166002)(36756003)(16526019)(2616005)(956004)(5660300002)(52116002)(8676002)(8936002)(6666004)(26005)(53546011)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fAt2Wpfailw+/mXRwlleF9g5hxg0wDE06DVvblAfT6ZttS3tvEpzHk8jaUEJjE00CDetbekaqtjfJogaSGrojXtbbAEg90xKHo+n8L60maRBl8uSyOddZKQn6SKcS9WDHrVpSS/2/QKscNh3/vdYbOr3CNA+ot4U4b+H6bhWkAmOc6r1trdgbHthZqqDj71AEkDWp+/k/yM17LPlkWUacXY+C2s7Go89/W1e+8ILq826Wv7/vI0LBAd8sJHijcH45obfx1N4hUe6Fe/6iVavAEiq4zwG7nFP7FPM+6XYo1UaitUn8AKHR9M4kDocNmaYKeYZVRHb5ZUKmDaoVtvzzlq+9kqOd+ymOFwnK6uEoHEyygYmuhXhUqnMEehI6nE5iJ0MhNlnPLBl/8KsfKTNSR6ARn37gEZtZpMKII6kXgBTextjXwspkdM0ta9va0UB4slMGsLhLnjnXNTemj53lbVC1uU/lGDaCSTNKl7F+0no3xS3QFoOSiSM0hzgJ/rRljQjg1lFM5WXdQKZ+F1+pksN7gFco5Rts9y8UOhUYokcf7UyfUxZ+/ZO1qKwf/jbIty3xRlfa4ZHybsavK6J3EMqZzoPyXwni/VGkameDDU3B5fTddvExiO02XrCrTGFf7UxMjgDppwfs3QMZWF43w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f871b9-f33d-4827-86f4-08d871f773b0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 17:18:08.6623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbDpfsqvy5D5gj8TnC3sqwLQnDYxtAaIkirt15kFbLBYZYdCAJ+IzEvnzQFaNK/giLHKVf6Spvw6GRm4a7nApQjyzLxdKBHnZNsB2xE6Nvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------C117E25BD09984CE1BAF9878"
Content-Language: en-US

--------------C117E25BD09984CE1BAF9878
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/20 7:46 AM, Leon Anavi wrote:
> - Removed _experiments.auto_enabling_integrations in favor of just
>    auto_enabling_integrations which is now enabled by default.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.18.0.bb => python3-sentry-sdk_0.19.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.18.0.bb => python3-sentry-sdk_0.19.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
> index e4ab9f33d6..b03e76b7c1 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "d6a85d958aea9277c1728c77dcf063a1"
> -SRC_URI[sha256sum] = "1d91a0059d2d8bb980bec169578035c2f2d4b93cd8a4fb5b85c81904d33e221a"
> +SRC_URI[md5sum] = "5c988086e4c124380887b0d579081f33"
> +SRC_URI[sha256sum] = "a3716e98a1285a74eeaea7418a5b8fb2d7568fa11b5fba389946f465876a4d44"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 
>

--------------C117E25BD09984CE1BAF9878
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/13/20 7:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201013114654.5610-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Removed _experiments.auto_enabling_integrations in favor of just
  auto_enabling_integrations which is now enabled by default.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201013114654.5610-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.18.0.bb =&gt; python3-sentry-sdk_0.19.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.18.0.bb =&gt; python3-sentry-sdk_0.19.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
index e4ab9f33d6..b03e76b7c1 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;d6a85d958aea9277c1728c77dcf063a1&quot;
-SRC_URI[sha256sum] = &quot;1d91a0059d2d8bb980bec169578035c2f2d4b93cd8a4fb5b85c81904d33e221a&quot;
+SRC_URI[md5sum] = &quot;5c988086e4c124380887b0d579081f33&quot;
+SRC_URI[sha256sum] = &quot;a3716e98a1285a74eeaea7418a5b8fb2d7568fa11b5fba389946f465876a4d44&quot;
 
 PYPI_PACKAGE = &quot;sentry-sdk&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C117E25BD09984CE1BAF9878--
