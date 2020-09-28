Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.59])
 by mx.groups.io with SMTP id smtpd.web10.35816.1601297798436849821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 05:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KtE73BIK;
 spf=pass (domain: windriver.com, ip: 40.107.92.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF95GjgifA8hBBFngZQkUvtMsXjHo3SmPpE8GWolXCjsQJ57s1SRSq16yPCkFoYO6huAWkkMWWJQsIh95Llfytz07FN/As+2hnnQcXnThUdW8UF4DSUC4BunjnWFnKm2OnUFLfziSuuzHH+d9K9AHanFR3gdI1+bnlDAeMg7Qp5D0teSAkjVgnj2Oi3VDg72TgT04yMYtRWSAtW1XW5tgGTfqPYY0PndgMv30FAvjn/vfvghbi2Ah37XljzFoeG+I4LqilGlAjfmfKZObN8ZGzgtvMaM8aZd79nvzLykBDQMO6ZMmBz/YAZvdMLm/dPJ8JDUZyTyzg8ZefHf38HFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQXojB7PjRkG4BOe82dDTxFjiBQ3JrWN1/8Gcm65Kww=;
 b=CXD7SsUlmtO8njYh6U+ttPFxUBqqALgKvLC7FfMqkfe0UagfGq5qpf7aA2lde8KXw3h7dQ95+vXpax85DxSb/nawLMlFPMmw7/eG4/BP4pFK5NOYmMWs634lTsUcEnbJ9xO7TibpkJvkoe9o74hDyQEnadEYjY+/894RL4Z2YNkppgZC2vYePLPCMBA9mAec/CuyQI5uUoPqIcSvgXSJCLnm8Enej4rTYc5ZCZe0xlhHmN3zoMZnNwagtu5RvBrSaSW7E/rr7dGQzChKxLqjmgmlLr0jwWebCV5sVba28K53IskbPWDqtID+PzlOk3P/H+ELS5bdk1UUtHZT4Z6lhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQXojB7PjRkG4BOe82dDTxFjiBQ3JrWN1/8Gcm65Kww=;
 b=KtE73BIK4FgldUf25tQ4jzxIlBEnTeW8BR+lp45LJZI4T+6PNF2XL+8NJHSFn1drFUZbmKEkjRY2rYwU9GN82D833QRomCGKTu0FmTnkQCYJsojtSwr71NGQdmTYiD9HBWr/RzK8YhoUPQzKYMOiAHuCN2+np/yrHJnvYlvrG7c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4435.namprd11.prod.outlook.com (2603:10b6:a03:1ce::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Mon, 28 Sep
 2020 12:56:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3412.028; Mon, 28 Sep 2020
 12:56:35 +0000
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-cryptography: Upgrade 3.1 -> 3.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200925112321.3195-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <411d0532-883e-4b7a-c987-bf1194fa7cf2@windriver.com>
Date: Mon, 28 Sep 2020 08:56:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200925112321.3195-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Mon, 28 Sep 2020 12:56:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e22816f7-279c-4e51-394b-08d863adee82
X-MS-TrafficTypeDiagnostic: BY5PR11MB4435:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4435730C38BAF0728A28FE569F350@BY5PR11MB4435.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WWZoBo6AurYx08tXS704wPELyVw7ZWEptAoRkK2b4STph4wljzXZTmGe3In8dzGcAXP9ygj8wIDIgJ4zRLxVmUwBrJYIZj+Ytg8UmgRiARkArL8m/0XwzAwojeDjqhizYuXWPr8j+4us5dfVvNqB40gNqjkxLrkM8ka5Vsp5YeOT35TuSr1DDyXOGv2ZgebUi3kj9N8q/Z/3CANSorVG1DXGGPYoV3QJuJJAxijfZy4VR1XjMk1WBd/NmEtLDiLWQUpBrhyjEA1Xpf5H92uD2J5DWvzkXqIpjJp+WnkbPR9W9kBeanFJ5/sHMvAdWXy9DOuKKil877bziTS3PHJ+pCM0KEHR/EUtnXkZWfOeYsRkivHCYOGYvEefmnnuNxtuFIcmEWH/TWIrzBJglGTetL3bYAdADUQmCWWZO+nShatmjzb5BeCfh3ZL74V4IZPFlQ0zmfJoVQuwrIw4xB6noJ2aiSXjgnE2hqXkvC5uWABY+G1kHB4S9SPljLt9jcYB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(6666004)(166002)(86362001)(36756003)(31686004)(956004)(83380400001)(2616005)(16526019)(186003)(6486002)(8936002)(33964004)(8676002)(66476007)(66556008)(66946007)(316002)(16576012)(31696002)(53546011)(26005)(44832011)(2906002)(478600001)(966005)(52116002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nd+bAccHFy0WyUKD44GgasRj+fOnsYjZK5WhM5VGuvzbG8qO6jbkv3k4YgauuqgV3p4QFdYIMHIh2mboaNt+y3B9w7TDlrOYn7bm5uP+8ZbyFqzzh5mwz5LG1TnK5CBtlE3Gs4xqZf+lsPUnM9C1KHsHq+OUMY365iNw37yxuYYytItIAirnG0p7n6Qc+Eczx+KhtajP4cL21zwKt5bWGYgiCZn5tqEHXTUH46CaYJhShk9L+SABNJIVXUiuFyRz9Fj8jAr4KuWx2pmj4uHrNhg2tXyS07uzg+2pguuqRwMXZVW6lbfOjDFoE1WRS34mNl15mZr45DKDfoWVMTXJkhG6WtE6+0cRmbvOYFbPJE/yDwP/psXOHmOudvRoZImas7BG184r5KReAbpoYPKyjt6fCG3JTJURBi6zGrvaZvKTUhjmGbdWANU/QmGuBBW5Iqc4gqavwc2zG2r/DfRKzDS4p1ZI0ZBlXpsMAB7UPpeyFDMIa7HZQ3QeO8hQxOMTDUc2yGapuO0vgptnjmBzox7yrPegT4hm8f6wR7MyOfbRlI8VdEU4wCwdooUp2rtmDQxQJLNMq6OAImDvQ7eLsP5Qo+8pUL6HRGxB/nAvrBXUQmoZ5iHFhub8t7Qjke2pa4ikLwfrjfoGdIYkc4algg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22816f7-279c-4e51-394b-08d863adee82
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 12:56:35.7107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caX2r4DXExC1MUTIGaE34MA1CNmvpq4Kfk5yj8rVIvnjFmrkXQK6MJdh34DHeOfBc+CahSikLwqHr9nOCJ4/bBDIAVsqoH2Aczfq1eGcnEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4435
Content-Type: multipart/alternative;
 boundary="------------BA2438F9B23DE9191BB8D300"
Content-Language: en-US

--------------BA2438F9B23DE9191BB8D300
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/25/20 7:23 AM, Leon Anavi wrote:
> Upgrade to release 3.1.1:
>
> - Updated Windows, macOS, and manylinux wheels to be compiled with
>    OpenSSL 1.1.1h.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-cryptography_3.1.bb => python3-cryptography_3.1.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography_3.1.bb => python3-cryptography_3.1.1.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb
> index 9ac23cda4f..1d6a9b32e0 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
>   
>   LDSHARED += "-pthread"
>   
> -SRC_URI[md5sum] = "aa91e4974981b29e99b863c54034c361"
> -SRC_URI[sha256sum] = "26409a473cc6278e4c90f782cd5968ebad04d3911ed1c402fc86908c17633e08"
> +SRC_URI[md5sum] = "c3807891d36aa9de8187e9db8b2bb457"
> +SRC_URI[sha256sum] = "9d9fc6a16357965d282dd4ab6531013935425d0dc4950df2e0cf2a1b1ac1017d"
>   
>   SRC_URI += " \
>       file://run-ptest \
>
> 
>

--------------BA2438F9B23DE9191BB8D300
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/25/20 7:23 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200925112321.3195-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.1.1:

- Updated Windows, macOS, and manylinux wheels to be compiled with
  OpenSSL 1.1.1h.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200925112321.3195-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-cryptography_3.1.bb =&gt; python3-cryptography_3.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_3.1.bb =&gt; python3-cryptography_3.1.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb
index 9ac23cda4f..1d6a9b32e0 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=097f805837700cfac572ac274cd38124">&quot;file://LICENSE;md5=097f805837700cfac572ac274cd38124&quot;</a>
 
 LDSHARED += &quot;-pthread&quot;
 
-SRC_URI[md5sum] = &quot;aa91e4974981b29e99b863c54034c361&quot;
-SRC_URI[sha256sum] = &quot;26409a473cc6278e4c90f782cd5968ebad04d3911ed1c402fc86908c17633e08&quot;
+SRC_URI[md5sum] = &quot;c3807891d36aa9de8187e9db8b2bb457&quot;
+SRC_URI[sha256sum] = &quot;9d9fc6a16357965d282dd4ab6531013935425d0dc4950df2e0cf2a1b1ac1017d&quot;
 
 SRC_URI += &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------BA2438F9B23DE9191BB8D300--
