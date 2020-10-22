Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.83])
 by mx.groups.io with SMTP id smtpd.web11.1287.1603410248414940284
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=X9OMgxgm;
 spf=pass (domain: windriver.com, ip: 40.107.77.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lksA07KPdVtwvEDQ9sGGxn22cDzqgjsaq1sZ56P9eTLjPstlvDU5iY4Bzlf6lBunkLdyCk8+1gwulmWGByx4iKPKBcX03hUbkZiUOQ01j2iF3P2p6FYtbPBRuf/1YeDEuCgKrqmCZrsEH75pNO9AovHSMcZrzCdbxZbnPQfC6TmlThnTseJav/LkBcW1ZWPJptc8SEQeOY+Wn48aWd0iEWf3AflYLvpbzs03ZkdlFssALWkuugqsVaMs2aQshUlY+9JijFBT8T7ysBA6XBojaav2JCZLb0dim/Oa3VmUhdfS2WYKCVwfu8t1111N5UfcukWLMy77CjufMr3SEJ1dug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPwD3m/dNHI5qnWNOCTQAA81Q4SvpaouQ+KIUPxmp6k=;
 b=hQUZ7dsu8J+iv09ipvRe/XmdbBP9u3/QyoQb8uzGz6rV0Iir1jetCTmR84UFiLwx2zaUK9FhvkrelzRSJFSdqSmJKgZlSExFR0z7m4cfeDx/NqtsGDCJhrJ6qQ16IZwJ5FidyEfXd2hbVGkjkmv1W5yreWVFSuM0Nayy6VjLGbpegn/MEjEH6CqZKcXxhsRYc3eNvwO4yAjJKwR1m5zdDmN3PLeqev/89oISEKx34iojbl1R7+iCuE8nthWP/v4Oai5MMgnDNsc3lOwb69GNNrJ/p9e/Cu5tuqGMH8P9cRBMgN7dFJSVDVMwgoouV+aNefqmXmnle+wigvu3XYy4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPwD3m/dNHI5qnWNOCTQAA81Q4SvpaouQ+KIUPxmp6k=;
 b=X9OMgxgmLD2B3By5L+Fsj8ZJkMHNbjXRRq1B/vONMg7ECTol6TG4FzTzMZadSvTllMBWwdjpmG2AWETVI3t56xFGQBaxH0gGekCyCmrunoB9eRUpJwpK7VlXbfYQj5P0yQgyPsMHp8a01PmeubTJwk2JTMVA+gef3Er1i9lv+1E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:44:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:44:07 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-pydicti: Upgrade 1.1.3 -> 1.1.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201021082530.10132-1-leon.anavi@konsulko.com>
 <20201021082530.10132-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <339989b1-ea3c-1425-fad8-5dae8740d7c2@windriver.com>
Date: Thu, 22 Oct 2020 19:44:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201021082530.10132-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR03CA0012.namprd03.prod.outlook.com (2603:10b6:a03:1e0::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 23:44:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 330fed17-bf43-4031-6c6f-08d876e45ddf
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896C020238C3B226CA992E79F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OqQCsabzFxFIx9yk/nUjGF0i3mPGuiUlBVhw4QmwHuu0JB5RgDXmjC8jXW1F0apzH9Sv7D3EC1G5/AlWft+KLZlQKjqityc3cdJ4n1hXAzGpEa7M3v/pVnQwePjqms81tUVpVEvvNjWEx8rYZ+DLjbe3djxtKTZ4LHey63STGwR0gx7tGTSu0mluj4WVZWNXrIx2joZpTsKiWdOcGz1H+kn3K8f0hxUZUEMKjk3C0cSdYwjHpj/7usuPSKou4X213+bHP0e7xNKvgcY+zsz7n5UgkvcwWQNlWQCtFBS31PPUhil9ZFhxmPvhBfT7HjARzmxZfLzFp++4weni2su7zhe/dkuJwqFx9sTouRW3moIS3vVF3AD07aqBVl0iMDD953Z7SbHhoLlYiqEg9czpg5If6cNVsF39qXbKJNumPLngH+1hejpk0VLtd9YBeD1KSqshh2AYrfw40wWUICL63Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fnsu/Dsv0u3URmtVKjk9z8iRGIXo0Ueb8Brvt/dFXgHd42BkOPs7Rt5zAy9k32Z/9xskoqBD49SSlGtPyECkxuNZQZk2zhG1DDtXgJxuwlRIw2iYdDFKgzhgCzUi+Bab5cWsiMmoB3qa2w+Yj7UmuPkWC6JX6BwhBTPve7E5Ui177mG6tUa93+ENAmNpUBIMJkhxAT9/zJYg4zFcP0/y7OrTbGeQ58UaBG58gPiG7NNTM6L+jaWkXTdtjHhvO5IFzUI+l4rDoqiDDEplIlsOn/E5FbaIeseRjj+dY0KBHWn9hNyIk5eId+SfCtilTQvpGrBej8Z+Jf0JJtcPGZ8WB6oMfK9X7kSIWnIy7FnI4ORmLORBDLcKHArgMhWRImX79DaHEc9zQm4wT/debYw709omfJVGRKNLx4/qHCFV+LMDCn8XVssfbIaxqFt9mP/S50uLurmlocmZPprKSCCp/i/icZaJQ2Esve2q73+snZY0fVqAPBYC5E9KfWaQqAW28NNtLK6WunlsBliEU3MWzz5SiR9f3Lu4370AV1Ll09T3y1ZVsXbaDMVACWAb4irt/dztPjhmzcajhoAFt+16vjMvfaGjG1IQ/CcuLpw4rBa17zP2M3N7oe7cVcb9OAm1RKfll8RZjqSS7EyKY4qgkA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330fed17-bf43-4031-6c6f-08d876e45ddf
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:44:07.4408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5qkbAAEI1vhMOHkJCh3sOg6vj6psQ5J26Wg2K3nlXpDXlp48ZJ1WtqdhXjMsRCabeh13YrdO4iHjiFbVIPPLzm7PrurWGUpuT9JlUuUlWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------143B973B778C7134EA728DA3"
Content-Language: en-US

--------------143B973B778C7134EA728DA3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/20 4:25 AM, Leon Anavi wrote:
> - use str.casefold() on python3
> - make normalization function a parameter of build_dict, so that
>    user-defined normalization functions can be passed
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pydicti_1.1.3.bb => python3-pydicti_1.1.4.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pydicti_1.1.3.bb => python3-pydicti_1.1.4.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
> rename to meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb
> index bca0ba7378..29ad30e0f5 100644
> --- a/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/coldfix/pydicti"
>   LICENSE = "WTFPL"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=389a9e29629d1f05e115f8f05c283df5"
>   
> -SRC_URI[md5sum] = "b02ed35da91e400f1f17a57ab02ba06b"
> -SRC_URI[sha256sum] = "eea50576baa751a9b6b862f09f081c47d557e0298623ca8742851da72b00eec4"
> +SRC_URI[md5sum] = "c8925e333a78766cb469c1626880bd35"
> +SRC_URI[sha256sum] = "dcea4d1892fc68ca62aba835b1ed444a1eb48bd0cca0b4599efd45cbb6272b5c"
>   
>   inherit pypi setuptools3
>
> 
>

--------------143B973B778C7134EA728DA3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/21/20 4:25 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201021082530.10132-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- use str.casefold() on python3
- make normalization function a parameter of build_dict, so that
  user-defined normalization functions can be passed

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201021082530.10132-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pydicti_1.1.3.bb =&gt; python3-pydicti_1.1.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydicti_1.1.3.bb =&gt; python3-pydicti_1.1.4.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb
index bca0ba7378..29ad30e0f5 100644
--- a/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/coldfix/pydicti">&quot;https://github.com/coldfix/pydicti&quot;</a>
 LICENSE = &quot;WTFPL&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=389a9e29629d1f05e115f8f05c283df5">&quot;file://COPYING;md5=389a9e29629d1f05e115f8f05c283df5&quot;</a>
 
-SRC_URI[md5sum] = &quot;b02ed35da91e400f1f17a57ab02ba06b&quot;
-SRC_URI[sha256sum] = &quot;eea50576baa751a9b6b862f09f081c47d557e0298623ca8742851da72b00eec4&quot;
+SRC_URI[md5sum] = &quot;c8925e333a78766cb469c1626880bd35&quot;
+SRC_URI[sha256sum] = &quot;dcea4d1892fc68ca62aba835b1ed444a1eb48bd0cca0b4599efd45cbb6272b5c&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------143B973B778C7134EA728DA3--
