Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.73])
 by mx.groups.io with SMTP id smtpd.web12.3272.1599675934030698287
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 11:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O4iZB5iQ;
 spf=pass (domain: windriver.com, ip: 40.107.68.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJmvqQi8r3gI9vWvv7Ws48rkTIGRPmkHlweQOWpKmAWUyf+dHl4f+mJOjr0NpxFkh3sUvQE9T5iv8FO4O8DyJFgYMhp+iIIXdei+5aRTShwjygjwGVHcICeK5HVH6AEUPB1q5GQvwMeCiqD/6CoI5uibaekFQ0nkfRiZMNSAydTaxShJywOvVmPw6opmFbEWqciFko8nE7pivYP2Oc9+jBKPg1YZ8Lcr0TbEFdg2TloyR40E4bbYxeJ8Rr3QeRf3RfZQU6SuoF/DVMFm3AHZU+kHV5dZr8WsZqPS1IknPS8K5ysk6WcVitcbu3DuDj5VQHcTNVi0hDA5JoF5wTaJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltcLQUBC7nwLS97wVbdZnQ68zXyZWIJWVdnglsgwwsM=;
 b=U5WofwEJkMv8ula1GSE8Gm8ekKh0BIzN6AyJzcGLM1RC4CKyhYjpBaXoJLTJ4vEkwy5zZcrHh/u9CHZYJneukxxpEH4EwwljGLFC78oEvV/6vZt4eQMUTad1CbagMej54vveUq/zYxAPqYG6iNii5TSrso5NDsOu5Xt27joNEd5IrNW4WlFBg7FW+dCXwqvQY6RsW315OfYf1vorv40GC1gjExJbb8QehUFEUAtvGBmwVKfdTQfs5J0XqjWUl4MlRU10Lm69smjI6qLtwneaMFDNrKPHpQ9Z0p9LzkxZGsdc763LEiHticiAOy2xV2OXoe3gdPmgZa0t3mGS9g3BbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltcLQUBC7nwLS97wVbdZnQ68zXyZWIJWVdnglsgwwsM=;
 b=O4iZB5iQ+XGvNFHZj/8aKwlWBkAPJ58FCIp/pJ/3mn13JcpJxEmYXVDR/m8daKnTeAeKiEGyiUevuvy+Yc5iA0NZQK1glQTWP155hP65BlqiaxvgkGpAIvvU1z65sGhcaaT+9fnUO7q30MiwSU1C38jFcorN/Wus8c1SJt9Tqaw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3912.namprd11.prod.outlook.com (2603:10b6:a03:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 18:25:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 18:25:31 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] meta-python-image,meta-python-ptest-image: Use python3 packagegroups
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200902191231.1224543-1-raj.khem@gmail.com>
 <20200902191231.1224543-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5c1c332c-feac-1ea4-0a74-77b1deedfe6e@windriver.com>
Date: Wed, 9 Sep 2020 14:25:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902191231.1224543-2-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 18:25:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b23c09b-53a8-4aca-38b2-08d854edbbe6
X-MS-TrafficTypeDiagnostic: BY5PR11MB3912:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB39129BF0D8F5D00B2DB9D2559F260@BY5PR11MB3912.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iBzdOhwKOeoNP3g1M1WtWYQ3ukxuSp4YJZ7reULymD/VgbErnG7LU4DRb6alxTgaVKg7CLEjfmTOL8HgUQ5pEP+B8WUkcFbuPa+swCek3yxuAsMbJ0X6sRpkBzIufCq1PE0wDBMiSyrFsjYcmn2+zhE3Uwx+AWUcrQaV/TakHlVVldfKcoy3OPcVDRninfLAfUGIhT3ES8nO0TH7WlOhXlxNfPUl/PaTJj6U6QaF5dOKX5KFvUHo9lTuOKkta24eKeulUOHSE6nGHdNErJ4mjoQMUdWv39PoJGasJPYPOpoviX6otsAaE+xgx2hSqGJKQZzHryWw9NlaIOYCDMdqr/w249A+hZvkI7XNRr+kalRIwnm8ECyYC+szec8OmLp6G2rVQEvyWAfRB0fSmf7jGHrfcYxopy58lFxu6zumxC9ce4+wRczUAbuGr22dnW4MsQTalSUAErruWW5c/DyY62bqGdJsLA0Bmd557J9mx/s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(39850400004)(396003)(83380400001)(956004)(2616005)(16576012)(8936002)(36756003)(478600001)(44832011)(6486002)(316002)(8676002)(31686004)(53546011)(966005)(2906002)(186003)(16526019)(66556008)(66946007)(31696002)(26005)(5660300002)(52116002)(166002)(66476007)(33964004)(86362001)(142933001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	iDqEUPXfjcWw276XeRocuIMnhVbBun9V9Rdee00UAZBCItrRWCUbjOpw1a2MkCHCsIJowLOH96FkSlMpWtLipCascuRZ83uCmQRj6wZAhnXf0Wh7N7N1pAtShyZjqK/y+jvt1vu5slMdBA+kB9QNBUBiPwa0EnVGqlUf3QvG8N42tiTfNqYFqTxWMBjjdBMM/uwQpbO1vW7ntO6X6KWLZVIBvphnEBHLKE/7O71+2ZfK4tzB2ZwN3+euFjT2QdO5cfdW4ow6KjD3zFLDtye4JdOctRGYsDUkYXPYK5IAixhLEkrohQSKd2xtMbL29pPTmPj0lQbCS0adntfs4X6Z9sjtJtDyeGNQG4nHrusuDzIKR6Bm0D8hLze6FQ8RR9wI0z+raHokjQp5EAFE5p+Xiq0ytdYLZp78b4rGYzRBkjvX99Re+Qx4iZ8dzAAKiwXWgj4qKU9Khtlzem/1L2ATPHFNaozQRbO2swDWfw63u651DsSgCNkzWDc5qqoL5EWzPDz8WV2B6I3GhzqES3+pM2cywfIiZV4Mq1BhN+Ai8jQ8mShqN9zvbEhb5ch9Kde1Fw8Bx6OPOOQhaBtVSkWMtxTwm3GrAPfMm4f4Zy0NVuA5GrlBDcc4tHj2FKzUwBq2lMoDjltj1jHcyBf2oo2fzQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b23c09b-53a8-4aca-38b2-08d854edbbe6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 18:25:31.2912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiw9L6AowXdvP/JfN7EFR+90fDOAF0WRM6yCqLkEd2yUGWFs1nuk7gfqw0GuaRQP1aYUI3GffwYfO0/atIqaz9AJpV4hEfF/F6gNQC71ZXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3912
Content-Type: multipart/alternative;
 boundary="------------6AF33F0080CDE80FFB2E9A9C"
Content-Language: en-US

--------------6AF33F0080CDE80FFB2E9A9C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 3:12 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-core/images/meta-python-image.bb       | 3 +--
>   meta-python/recipes-core/images/meta-python-ptest-image.bb | 2 +-
>   2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-python/recipes-core/images/meta-python-image.bb b/meta-python/recipes-core/images/meta-python-image.bb
> index cc75fe6e4b..6353d389b5 100644
> --- a/meta-python/recipes-core/images/meta-python-image.bb
> +++ b/meta-python/recipes-core/images/meta-python-image.bb
> @@ -2,5 +2,4 @@ require  meta-python-image-base.bb
>   
>   SUMMARY = "meta-python build test image"
>   
> -IMAGE_INSTALL += "packagegroup-meta-python \
> -                  packagegroup-meta-python3"
> +IMAGE_INSTALL += "packagegroup-meta-python3"
> diff --git a/meta-python/recipes-core/images/meta-python-ptest-image.bb b/meta-python/recipes-core/images/meta-python-ptest-image.bb
> index 7ee15354a2..d497016d41 100644
> --- a/meta-python/recipes-core/images/meta-python-ptest-image.bb
> +++ b/meta-python/recipes-core/images/meta-python-ptest-image.bb
> @@ -2,4 +2,4 @@ require  meta-python-image-base.bb
>   
>   SUMMARY = "meta-python ptest test image"
>   
> -IMAGE_INSTALL += "packagegroup-meta-python-ptest"
> +IMAGE_INSTALL += "packagegroup-meta-python3-ptest"
>
> 

--------------6AF33F0080CDE80FFB2E9A9C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 3:12 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902191231.1224543-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902191231.1224543-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-core/images/meta-python-image.bb       | 3 +--
 meta-python/recipes-core/images/meta-python-ptest-image.bb | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-core/images/meta-python-image.bb b/meta-python/recipes-core/images/meta-python-image.bb
index cc75fe6e4b..6353d389b5 100644
--- a/meta-python/recipes-core/images/meta-python-image.bb
+++ b/meta-python/recipes-core/images/meta-python-image.bb
@@ -2,5 +2,4 @@ require  meta-python-image-base.bb
 
 SUMMARY = &quot;meta-python build test image&quot;
 
-IMAGE_INSTALL += &quot;packagegroup-meta-python \
-                  packagegroup-meta-python3&quot;
+IMAGE_INSTALL += &quot;packagegroup-meta-python3&quot;
diff --git a/meta-python/recipes-core/images/meta-python-ptest-image.bb b/meta-python/recipes-core/images/meta-python-ptest-image.bb
index 7ee15354a2..d497016d41 100644
--- a/meta-python/recipes-core/images/meta-python-ptest-image.bb
+++ b/meta-python/recipes-core/images/meta-python-ptest-image.bb
@@ -2,4 +2,4 @@ require  meta-python-image-base.bb
 
 SUMMARY = &quot;meta-python ptest test image&quot;
 
-IMAGE_INSTALL += &quot;packagegroup-meta-python-ptest&quot;
+IMAGE_INSTALL += &quot;packagegroup-meta-python3-ptest&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6AF33F0080CDE80FFB2E9A9C--
