Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.88])
 by mx.groups.io with SMTP id smtpd.web09.24340.1611839297820709938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=adNvk4WR;
 spf=pass (domain: windriver.com, ip: 40.107.70.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YE+UjMHZKOIPNSgcrEmh2C5H9Hi8W6RLKILEJ8g1SzQOpICY0fSE7vm5EbL9I3YwEW8UVroS4UpmQ+8ilqHAlsoG9QyU/DMezEWnBaNh/FXqtNMXnAS67z65gBmrMH60IsoAusMnFfW3DiPKZEpOYsiHern5lEARYBFhLvYoDt/WD46xNBtaQO1KKu4ueRqSjyfVc9gBceAK/f0WhFBpv6phpFwkQA5Baihm831tGfrIdUZI/X+nUv3JL7xYUvxZsjv6JdZxHswtekJhVD//BMJ+uGYHqEniRKIUjtFLmNFg8/1f8KuLmadXJKiDOXvsfdMzVyPWlnWcoLKjMkievA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UciQF+weq2WiFYDap8Y7OwxtWv37vJadBsrju+zQXNo=;
 b=fbYnaxmjvPEpk4hZpVGN0ru2DW6ZEnpM0jkf9MkEk/ieJBcraAdfptmmsM6UTT/XLQL6EWpjoSMZqdT6geqEyipwQ1LUWo04syj6YFZp0s92/urEoD36m2pFwTA70l1HXgsQ5QjS6f4/GOlWcTIaL8Glh4lBFVV/7b5NUNNwP3aQim2j+SiSKZ3wcFKR9/f52Hw6HwXbRzSViZeHZsSHNNT9pFaGVotwdoNLfe6SQG2HQ0QZgPAi7+Q8W/7rKu26UT80B/ZgM1EZr2L4yFzOQvahcKGP4ja2ZuDNF4L7Sg65+NMgaLxRS/7ttT6hUtH/TwxWbNJPnnwLpHIbPzUo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UciQF+weq2WiFYDap8Y7OwxtWv37vJadBsrju+zQXNo=;
 b=adNvk4WRbEEyzqQwfiut345e/QGAczKD2+J+NcL/SCA0xXFSTuY/EEXv6saOrIX1P+DxGCIXs4I6mP82kJfMaeeWqYLwV6QuNILbsowjF5sQVHURnT0cR0vcGw46iv2tNLDtxfh7ayMQ9ntiTO0JnXETWY9qTrHCSSYw5WKLfwk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 28 Jan
 2021 13:08:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:08:16 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-aenum: Upgrade 2.2.6 -> 3.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210126125003.27620-1-leon.anavi@konsulko.com>
 <20210126125003.27620-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8e5e88eb-8c23-77c3-b5e5-9cf5b8f54a36@windriver.com>
Date: Thu, 28 Jan 2021 08:08:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210126125003.27620-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR14CA0030.namprd14.prod.outlook.com
 (2603:10b6:208:23e::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR14CA0030.namprd14.prod.outlook.com (2603:10b6:208:23e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 13:08:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97992fb8-81db-4a1c-b2ad-08d8c38dc6a8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4184:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4184B1FA2E6E67A8A34E78229FBA9@BY5PR11MB4184.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jKpDGfoikbfEmX/GEBUeEtE40MzK1XTcMsWa5MuOKLQERwqv4bhtF6vCaXNVMCQg7Jr5sOZPrCq37DMfVd/DRrujYBtTVdVUcmgFqdBnkBNzUnA3Cu5N1AjhSg6ZejVPDAYcybb5aLExuSH/0e0T6MkniagrAQLBQLTJ/NdwLXfUT5ppTgA+PdLahf/+x8B9b7VBA5j8yNSpTkz9RfpHbzIRFEDpI/k/nIP8wE826UdG9cgO60QXKUJMsRXJgnzVw2Zj+HWfBx1/NDoZjORH1S3cQsGPUHIxMSEjI0cg3h8sqVJvo4XMyHYM66w3oWSs5XcMoicZFxnJparNp3u0Ry+bx2yrXfiXi4aiB3hPPQUyOrbcXGdtRj4PaaJI7ta9blvRoxNN6To3fkYmDXUgPcUgUsC+m99opXNGKsLK5mJF3P5ZfpLfSDbpf3aIBnMH+n5hXfSJruWe6yluCxkvSfr5rcr+W9BGwwXcsgdvlGNz/WQH8dkSNT4nnAcpJPjcbsz+Ytb338Lq218qe0mmCGRoimbZk/B6FmE1Mx6iJAWsKv9vyGyARJ+yAvRUMfmHOFo6f2q9TFDZIwpPZm0fTLz/9w7b2L045p+ZuOan4CAD9pAjBpBFTSF72rw52pTGZpvQe+NRIJpC0wJ9Sh4ztbfLa07pmYkvvEwoEk2mlTLPJ1mFUTCraxuJ4KO59V+v
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(2616005)(66946007)(966005)(53546011)(6486002)(2906002)(66476007)(33964004)(8936002)(166002)(478600001)(52116002)(5660300002)(44832011)(83380400001)(26005)(31696002)(16526019)(86362001)(8676002)(186003)(31686004)(36756003)(16576012)(316002)(956004)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eXdRL09GbndJR2hnTTBhS2gvaVpNZEI1M01QUlV3cHV1YXBOL1JkT1NQQ0Rt?=
 =?utf-8?B?Z2xyN0toL2E4VkVGV29nWnBuY2F5eFdwcVhXR2VmU1N0R1dTMWlObnhFNUJY?=
 =?utf-8?B?NDNQVzZSQ0JVRVQ5MTJ1MWc4dStldmdxUVhia1NERTRmOFNnTmhERGtDYzNa?=
 =?utf-8?B?Ly9IMURWalYvdW45REVtSHNoWUtlMGpHcFBwUU1vVFpNZnh2N2E5TVBmci9R?=
 =?utf-8?B?RTM1UDh1dEQzYk9KQlpCN3pCN203UW9CMFl0dXJELzBwU0pMZWJ4bElYOHY4?=
 =?utf-8?B?aTBrUldxeGw0eEdEeFNXcG1nWlR4TkJBbUk1Vnpnb1pvQmVqREFCWUJaeEFk?=
 =?utf-8?B?UXFKU3dmSGs0WUhOM3dKa1FNbjNyN2IxVUpWTUdvekx6REF6UWQ5YjdTMWlz?=
 =?utf-8?B?SzkvcmRGZzBocFM5a2tweXY5VnBqZFNBRkVXVVhhZHFLMnJ5dWtlMnNDZExx?=
 =?utf-8?B?MmsxekdBTWkyUVJheEJQRmpGSUliRmQxWmNITGFBdW9IbHEyaFYzU1hNWmhu?=
 =?utf-8?B?NjdDbytheC9XRXJlRCt1c1R5OUZKdXFjaVpmRGJab2hxc0FRdTltdmFuOUlZ?=
 =?utf-8?B?RDBKajRGdGtISWJhSlUrSGRWSDhIS09xaTBJcmNFRStTQ1pOS2F2QXRINmpR?=
 =?utf-8?B?KzFWenZ1ajBZR04vcGdvdmdtbVIwUUxJUmVndm5hNUxja3o4OHprYnBuUDRB?=
 =?utf-8?B?MWpobm1rb1E0dzVBODV1NndzOWVTbTUrNFJGdGdmN093YzdpVUxFTEwyWE5z?=
 =?utf-8?B?eVVxVHpROWZGd3oyM2Y5MGlIeTA1REhTV0dUdHF2RVVlaTBXeHNIeFlHWXhC?=
 =?utf-8?B?bWtEdWxUZ0VLbGFEd0xaUUcyREZmQWsxZEplSkRkRzIwdzhBSU1NRlJPYmJB?=
 =?utf-8?B?U0pYaXBxaGJ5N2I5eXgvZUNKUDVQdFRGQVJpV3c0QTNrOWxiRUxsWVVVSG1W?=
 =?utf-8?B?UjZ4aU9xOEtrZjQxZFg5Z2o5WkIxb3Jyd21naCtpZXJqbFdKcnhOZ2Uyai9L?=
 =?utf-8?B?MkVhekVHbWU3L3RSczhhbHA5dWp1THA2cFRxamt3UmdRY000RGZMQ28zR29C?=
 =?utf-8?B?bjhJb25MTHgvWVJDY3VnNmxYNTBjaDFtVFp4ZVRXUUhjTkVDUXYxOVhPYS8y?=
 =?utf-8?B?NXhGNi91d2E1QXVIbVAvT1VjUnZlZXhZWk1JTjdXQTh0SVBwRDAyVDRNaWpS?=
 =?utf-8?B?WlM2aGs4cEpqUDd5eE5NVURVTDBpS3hqamhodmprMWYvUk1JWnR0SHEvek9F?=
 =?utf-8?B?Nk1QZEpKQjlvQ0JvVmZManZsb01Fby9SRnlYYUVQcmZuTUQweEo5WE9rNzln?=
 =?utf-8?B?VFovVW9SQW8wc3VTT0JsbjhyaXBacE55REUrRjU1OE9idWVmQ1QyQU5YRDJ3?=
 =?utf-8?B?aUowcGs4aWhpTzFZeWhWY05vazJpdFMrUDc4Z3VKNTRkQ3A3QitSVFM0b2pB?=
 =?utf-8?Q?w/7kmOhC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97992fb8-81db-4a1c-b2ad-08d8c38dc6a8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:08:16.5453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6fYqsJR3AgJFhKNyvjrN4+w4u56Lbmwj7lGxHiijZSJl7YBaoTews1511NYs/bNC3/6DyngqdFRTmq/0oxGd6f19ounW5dVMtBZmCuvqeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
Content-Type: multipart/alternative;
 boundary="------------EDA07B74511569123A570DCE"
Content-Language: en-US

--------------EDA07B74511569123A570DCE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-26 7:50 a.m., Leon Anavi wrote:
> - Flags only list single bit names, multi-bit are aliases
> - error checking to go with that
> - getattr magic is off for AutoValue
> - Member creation has been redone to match Python 3.10's methods.
>    This also allows all supported Pythons (2.7, 3.3+) to use the
>    __set_name__ and __init_subclass__ protocols (more robustly
>    than in aenum 2.2.5)
> - enum_property() has been renamed to property() (old name still
>    available, but deprecated)
> - bin() replacement shows negative integers in twos-complement
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-aenum_2.2.6.bb => python3-aenum_3.0.0.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-aenum_2.2.6.bb => python3-aenum_3.0.0.bb} (63%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb b/meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
> rename to meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb
> index 061770a93..cb8462d24 100644
> --- a/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
>   
> -SRC_URI[md5sum] = "52ec17f5efdfa13952657fe954cd6d99"
> -SRC_URI[sha256sum] = "260225470b49429f5893a195a8b99c73a8d182be42bf90c37c93e7b20e44eaae"
> +SRC_URI[sha256sum] = "17cd8cfed1ee4b617198c9fabbabd70ebd8f01e54ac29cd6c3a92df14bd86656"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------EDA07B74511569123A570DCE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-26 7:50 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210126125003.27620-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Flags only list single bit names, multi-bit are aliases
- error checking to go with that
- getattr magic is off for AutoValue
- Member creation has been redone to match Python 3.10's methods.
  This also allows all supported Pythons (2.7, 3.3+) to use the
  __set_name__ and __init_subclass__ protocols (more robustly
  than in aenum 2.2.5)
- enum_property() has been renamed to property() (old name still
  available, but deprecated)
- bin() replacement shows negative integers in twos-complement

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210126125003.27620-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-aenum_2.2.6.bb =&gt; python3-aenum_3.0.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_2.2.6.bb =&gt; python3-aenum_3.0.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb b/meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb
index 061770a93..cb8462d24 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/aenum/">&quot;https://pypi.org/project/aenum/&quot;</a>
 LICENSE = &quot;BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9">&quot;file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9&quot;</a>
 
-SRC_URI[md5sum] = &quot;52ec17f5efdfa13952657fe954cd6d99&quot;
-SRC_URI[sha256sum] = &quot;260225470b49429f5893a195a8b99c73a8d182be42bf90c37c93e7b20e44eaae&quot;
+SRC_URI[sha256sum] = &quot;17cd8cfed1ee4b617198c9fabbabd70ebd8f01e54ac29cd6c3a92df14bd86656&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------EDA07B74511569123A570DCE--
