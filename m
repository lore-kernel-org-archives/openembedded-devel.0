Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.50])
 by mx.groups.io with SMTP id smtpd.web11.10458.1612879375921897261
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 06:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fE10drNw;
 spf=pass (domain: windriver.com, ip: 40.107.236.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBExm4mki9u7i/XO7Ev5t0+sZVKqdVqU/D8ARulhg17kiZc1wyFe8+8YLbA5EPCZsVCkP8iyioJjPP5SBY4qjFvj096BqM74zi8WIiKuJ83gdT1gKuK8tmMKZytecvWcqMnv9i8WMk2Kzp+MXXQVAZ6d117u8pJku0wPJ7c0FJR/5zzWVdtu7B/Jz6GQ7a8NkedOHs8Xqk3ydHsVYjOL7JdGR75tGVDLhRPsPk5eB5FWic0zZku+ngXvhNgEsNRzfdZg67axhvHm68rpZwU9euUb9C9GfXh0dGm8NOk7Wx0FlE5dwijigh3nhFOjVvBmFYMi+av0vIhuwBYlqPKoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts0cj6rLqxZBf9EO+eLRYOUa7FyoznfdaOVlazRlXbU=;
 b=dIwyQDzDSMJrApbyc9iEGzhRWGy0UQxfVxGRiIB2bGWgetVuk7LOZmr6pi0Tv6chUObwrPx3d2szKdvea9Zdvmz29BIBjxrMi5H7EEKCZz7IPt1WfUmpFTK5f6mgb/o9pBgOG2xU7wGLFgSZjHZjkSqjzXDQyEQVlKzL5Spj2yziQNH92P5scFdsk1eHcvRyMjJvapIlHTljXo48Ge/KZJa2WDJOYfh4WMzBIFMl261V9D7ePKx9O4wIny5qairLAjJYopJv6IVYGkxi0Sg6EY5PiO5vM6Ue/FigCB3cgNomzhddzZwELRhd6SKc6VZR5XoFhIB9HqtOUSPnqEp94g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts0cj6rLqxZBf9EO+eLRYOUa7FyoznfdaOVlazRlXbU=;
 b=fE10drNwYQJFJ9cjNp20GtZp74OkXBP8LR2tISwn+vHRpsIACmR7KEXVpEphc+2LKRJ4OOp3pVWrC5Nm1lVQ4tgbyEusQGCmsKdJPfKMsrtIjfXe62eoo07ngnk1Udje6X1CPS4dNrGFkuRERur8pQfmB5Tvh0wqJOxLuOaVnDw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 14:02:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 14:02:54 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-twitter: update to 3.10.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210206230417.4106536-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <80ed7bcb-3b2b-fd5d-04a4-59c1beaa1807@windriver.com>
Date: Tue, 9 Feb 2021 09:02:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210206230417.4106536-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR16CA0041.namprd16.prod.outlook.com
 (2603:10b6:405:14::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR16CA0041.namprd16.prod.outlook.com (2603:10b6:405:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Tue, 9 Feb 2021 14:02:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c0edbf0-6e39-4f2e-e493-08d8cd036555
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5165AF6E2EE448856AE1CD469F8E9@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+HW1mkGa41G3zMz6NfRPnNj6OfRSRhxNR1rHkeMMMrgY6q1gnB6n0edw21un5QRtu1f1N7lUQggBPgi+B77kKJlLiNxIrVnyEXLwEoQkb4TlJ40AngVhpCwyEFKnkE4j79gijK7fqPRaTFlXvM83X1+T8GUi0Im4pqRvT+77mcyHLWq7s3JbpzrKUA7whd3RP4AigxamNNo1HeWjUg9iCyWP0dSN4g39ta5YOQgL6ZYLMt4uvxODgjK3BZ2WOe3YWgsNoftA71KFhno7gUDufiRMZvUxA6Jt1NP5aFZZReFNzDc8Y8AujGpBOJqfkAq0vknX+u1Qgfrxvlch9n46pS0GI/l3f9tue+RzLas6uNubUrz16Ps/FxZMV7YQPFYUaILY1Y3lr2WTNT4NxhIlv/uMqydazxKP5cGRyvMIhgytOuqW50iQRKwBdjRkOWxyke8rBZDN6JU9ZUN1Kkkr1/FjrGLoawqldqotTDB7qb47dC53njOBDdAs2rmgj9kXwaasEDtnNrGEhMIrwoX4/zbiD/pNaznKYVOsZJfxad/3f92Qk3fGD2qcvsvVRU2pniwC5pBISPEV4Dl0FVRNxcXl8/q6S1YD1023uB6Ry2li5AQEri+4Mvc6EB/H/D61sbTYGZbEdZ7fGOHdrUba6FZDF/g7ybYyMdvu55muE+WmQImXKEYRWD3ModwFbh0s
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(36756003)(186003)(16526019)(31686004)(956004)(44832011)(166002)(86362001)(15650500001)(66556008)(66476007)(66946007)(2906002)(83380400001)(6486002)(316002)(5660300002)(16576012)(26005)(33964004)(966005)(2616005)(52116002)(8676002)(31696002)(478600001)(8936002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	JmGMcGnTOwSgwikVy+eUlpit0qeohyZKEvh44CDz7Z3EFFQ1eJnvVFeoSEOI8jHhGjiqj81UBGU18SiHqUBD7EkXCoWh0vsJ27eG+8QO55+rUKfLyGilI5SZDunB8Pe+7wCVMMEMx2vhGnsLyqtHiNOR/6q62FhIG2MKl/qHtyqKDAsHyJrSVk1WodZwn7XQCln3xTy4Z54qdJ4fkkeLEZg67TXVDs9SlmyexBK40uZcYle26x7Ya8ITe+CFTsd6BmP/QJ5VysV1kY0ngFZEwfQ/L9Qr4TUfsmFb87Et8jmJTPbxb5fQZWalD3PbQ5bg73zOKpAYgzXpYlvYJugczR+Q1D4uZ9dISnRMumL0/ZRlokzFgcTJH/v3YfbKzQlfjWUvO1bfW0xAEJBjy/A4EdcFioIHwhendRKKneIApvXKYWwZ/kzsRFcQZn5HOTd2wVmn+eZ8LckYpZ+ic1pxOY6266RjxvI3SQSO93NVKFEN6eF4KehphoDEGTLMG8hFqB3F1DlC31ZuzHUfFlyAnPK/Iulcp1NY3xycuqmHL3wPq9xZ7sVZx2pduRU3kgaf9sO8pjkXR5zB3O7/ZqTxU21kv5VV9Dq5EJiKvahecHXFC4NV+V1T60sVADnRocw1uBOS9d5OhNLKJHTb8DXrlJZmmB3+ksiBbQn+uk4mqwWqBl+vqVbSMqPYX3qYWchrn+rVgUNfP5zVSq9ZUd/0g/1RayRYyVpNihNecgqRpQyJcy7U1MwtuT3Sf5ZJdKDd
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0edbf0-6e39-4f2e-e493-08d8cd036555
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 14:02:54.3238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hu7Ab+5t+SvYtMRlnXnbWxYlOKxZE3Vgve+BeSkx7SAw63tKh0aSa3/OHy1+1pQwKi+Qtfe+JX8e3XehBhXfaUPyFcSgWpM4ZFUpGKCLMsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
Content-Type: multipart/alternative;
 boundary="------------0C1EE3708FB3687EE3E839A0"
Content-Language: en-US

--------------0C1EE3708FB3687EE3E839A0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-06 6:04 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

As an FYI, it would be better in the future if you could include a short 
summary (e.g. the release notes) in the patch description.

Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>

> ---
>   .../{python3-twitter_3.9.0.bb => python3-twitter_3.10.0.bb}    | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-twitter_3.9.0.bb => python3-twitter_3.10.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb b/meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
> rename to meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb
> index 01bbf831a..94fd65649 100644
> --- a/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb
> @@ -4,8 +4,7 @@ DESCRIPTION = "Python module to support twitter API"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
>
> -SRC_URI[md5sum] = "b5bc640fa9f6baff6471c127aba1fec0"
> -SRC_URI[sha256sum] = "bfd19a5c11f35f7f199c795f99d9cbf8a52eb33f0ecfb6c91ee10b601180f604"
> +SRC_URI[sha256sum] = "76e6954b806ca470dda877f57db8792fff06a0beba0ed43efc3805771e39f06a"
>
>   PYPI_PACKAGE = "tweepy"
>
> --
> 2.25.1
>
>
> 
>

--------------0C1EE3708FB3687EE3E839A0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-06 6:04 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210206230417.4106536-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    <p>As an FYI, it would be better in the future if you could include
      a short summary (e.g. the release notes) in the patch description.</p>
    <p>Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    </p>
    <blockquote type="cite" cite="mid:20210206230417.4106536-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-twitter_3.9.0.bb =&gt; python3-twitter_3.10.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_3.9.0.bb =&gt; python3-twitter_3.10.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb b/meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb
index 01bbf831a..94fd65649 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb
@@ -4,8 +4,7 @@ DESCRIPTION = &quot;Python module to support twitter API&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489&quot;</a>

-SRC_URI[md5sum] = &quot;b5bc640fa9f6baff6471c127aba1fec0&quot;
-SRC_URI[sha256sum] = &quot;bfd19a5c11f35f7f199c795f99d9cbf8a52eb33f0ecfb6c91ee10b601180f604&quot;
+SRC_URI[sha256sum] = &quot;76e6954b806ca470dda877f57db8792fff06a0beba0ed43efc3805771e39f06a&quot;

 PYPI_PACKAGE = &quot;tweepy&quot;

--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0C1EE3708FB3687EE3E839A0--
