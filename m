Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.42])
 by mx.groups.io with SMTP id smtpd.web12.22654.1600263406103974393
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=D+X1wYA/;
 spf=pass (domain: windriver.com, ip: 40.107.243.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MX0H5sQv3XtpqJ+rYwK5fl9ul52enRuhIkP4yVYpIfuAtNe/OFq0N/guQg29ocYZSYXdbfrRiEwjVw3Vpf0l8SEIzqcarxXAUiXWII2Wee3q+lx3wpbjOHZWJS/YKjapZQ5PWk4LrdeChHvjMwXa96TJwXP+PLCupiWq6XJ9m0pa4ZVuLnVF7iNByYF2vO/xPUZvqpkQTSX7ozs8uRrV82TIWteZpt8RmFBdw/u204UATevUEBPmgvophcZlNN1Dk9wsevhFxJKzPRQ5I2uEwLakCmuetsftP6EZzw8Udt7am5SouEruEsPwb5WiRum5cU3cfIDK2B+XnwBG7jVDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6b+5ZIfaXv814zqkjg6EqlyvZWqPNRJ2Tz8VOfb18V4=;
 b=l+ZaR1ke8I64LQgXHGgX7g7sp8k12tdIlXpBRltQeUyPhl477SxeoFyNVEjg1K0Xt96duvV5LzLADEBamSe1Z+U/i3+ifYBDhCLpsxBtCsZWHgV8VjcBGoTPfs/6+woxnzhg+POojkWZsolyzFZmpMW8LYsLbWj49kXfRgEuNvMtBIDBRxZWI/wG/f/kp6//BPXf0FHZHEv0Yjr3C+lbbnXs3gpHA7sUX7L7tK3BrLvxOxCBlUpqg96Mz1CnfrMDNq2TDGc2OMfgAHKFzPxnTuliAHpVwU8btYHQHE3ats7EeR6n6xIzZziapVkbR3TOMYoissobXa/St8ws8SAZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6b+5ZIfaXv814zqkjg6EqlyvZWqPNRJ2Tz8VOfb18V4=;
 b=D+X1wYA/D3vdKMwjkWxRBJ1HBPrxYf/0/ggmkg0vURSszi1Hhku87GSk5df93mfZlQUotScWJCwarrN1lMYrvkhhA3ooVDkV0CLSoFlTinE47Q02j8d6bOWX+Hognst5G82H16DX8MEJwQb7daNWtdP8fSm3PmvL1K5G3ZvYNsM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 13:36:44 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:36:44 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-attrs: Upgrade 20.1.0 -> 20.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
 <20200915090303.14367-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c67fca15-4d02-f0e9-025d-57225a25da71@windriver.com>
Date: Wed, 16 Sep 2020 09:36:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915090303.14367-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Wed, 16 Sep 2020 13:36:44 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77d200a4-eb0c-4532-fdd4-08d85a458d67
X-MS-TrafficTypeDiagnostic: BYAPR11MB3765:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB37651C5E9D6C81DC1B2DC2249F210@BYAPR11MB3765.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	focSRFGBLUzzLE4nY7cwwKtzbZJW04h/rFLFMG+fuaK2JytW2W30ZnyRgLu+CxW56j5TvI6yeqgvKkIxQp6Wm47App2olE6F1Xn4QvshiJzVcer/HW9zKM474swcfbpGN5zCrZPNZCSLUgi5nDoUh4VbGyqv9GModwvtq1rNUrhOamVxAIUNIp8egAdCC6UfXPsWDuvk638IG0vT451rlJy0jGqF37N/B48do9pnSPFxYcajX2gB9e4y6lAJl4ZN1ATkBUSVErrXhkA6jIHg40G8T1+YlB5nU1NAiHHPmRMaLM8T4CA6Rt7sqiyrDLKy3mFfQRHpfcP69y87YC5ZOqhrBZMlmG3O7kxDBp1R/EV2nA49M01+5wCHEs4EzViPQQe16b+hH153X/24G29ERo8MeizawMnuXubJNycjS5F90hIgUBq9+2vjJ81Y8s+08ObGjvV9AVIkn6aD9mW99g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39830400003)(44832011)(966005)(26005)(66946007)(478600001)(31686004)(66476007)(956004)(2616005)(53546011)(66556008)(6486002)(33964004)(166002)(8676002)(8936002)(16576012)(186003)(83380400001)(52116002)(31696002)(86362001)(6666004)(316002)(16526019)(5660300002)(2906002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zM+pjT004XWC84FdUam6Clm2wK9swefpsy4ZYLFKb4BzKAVy6mq+cOBEg5k2FZY+7nTCpQOOSIml/Th35Szl2MGTxV3wjupK5Z+FxiPAa63ZKzPU6vde3d6viWdRWRYDKwtotSW1G0DBz+iq1oKffx6uJPWIGC25GsT+TY7gkmNMFzsgVajarY7M/GL284gOT29AjLcz6RaPdOn5JfuORG1uKR92uT8UoDIKLzb9nc7AsGQOJW1KL9Oc2dozvzsOwuGiP1/0sWNDR4ef4Pzjg31UgEtxZejRP2aXpNBoIqB8PozV1rFNTyGQTEptcF9Sy9kCBzBE+ObvEifF2IXT9WtPrZu862E3ftieeMQWMUkBDTFIOGpBeCWjDQBHU5YZv/o+yBpuw001o/P1djdmTdqTHfnjHJo1F/Cv9YZlHN5sUfljWayfH+vc8N1CkmxADqEYKx0xPbtDwLvImco8bBdiZWH3P/5bCTXCM7ePsAzp7xmqpVApBxBusiDg9s8jtZhK2EN3mZi3PgV0k7Q6JpGOWbrmPvoUhZdMZdO7wPiEafDApOu5QyoKDykhb6Bpv/Fpr+tEqUacY2GTOhU3L7CqP7BbsfbClYMJ8JGj4C+Jf1pnncK5ydy6ewhafIkCHyGeCX/iJI22JSXP6aI31w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d200a4-eb0c-4532-fdd4-08d85a458d67
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:36:44.8228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04C7we0dkbIKY0e9pg7YElMn2mYVtb+nfXsA6KuAZjaUbLNJ46Sr7rVv5p067ztFkwNVtQ2ON4qsALANb2aHw55Jb8BQ//o6N6Sr8+uTbs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
Content-Type: multipart/alternative;
 boundary="------------156770555C305A414E665298"
Content-Language: en-US

--------------156770555C305A414E665298
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 5:02 AM, Leon Anavi wrote:
> Upgrade to release 20.2.0:
>
> - Backward-incompatible: attr.define(), attr.frozen(),
>    attr.mutable(), and attr.field() remain provisional.
> - attr.define() et al now correct detect __eq__ and __ne__.
> - attr.define() et al's hybrid behavior now also works correctly
>    when arguments are passed.
> - It's possible to define custom __setattr__ methods on slotted
>    classes again.
> - In 20.1.0 we introduced the inherited attribute on the
>    attr.Attribute class to differentiate attributes that have been
>    inherited and those that have been defined directly on the
>    class.It has shown to be problematic to involve that attribute
>    when comparing instances of attr.Attribute though, because when
>    sub-classing, attributes from base classes are suddenly not
>    equal to themselves in a super class.
>    Therefore the inherited attribute will now be ignored when
>    hashing and comparing instances of attr.Attribute.
> - zope.interface is now a "soft dependency" when running the test
>    suite; if zope.interface is not installed when running the test
>    suite, the interface-related tests will be automatically skipped.
> - The ergonomics of creating frozen classes using
>    @define(frozen=True) and sub-classing frozen classes has been
>    improved: you don't have to set on_setattr=None anymore. #687
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-attrs_20.1.0.bb => python3-attrs_20.2.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-attrs_20.1.0.bb => python3-attrs_20.2.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
> index 371f1f042..c2a5b9051 100644
> --- a/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
>   
> -SRC_URI[sha256sum] = "0ef97238856430dcf9228e07f316aefc17e8939fc8507e18c6501b761ef1a42a"
> -SRC_URI[md5sum] = "ab7533fc91c5db3d5b65e66be907444e"
> +SRC_URI[sha256sum] = "26b54ddbbb9ee1d34d5d3668dd37d6cf74990ab23c828c2888dccdceee395594"
> +SRC_URI[md5sum] = "7be95e1b35e9385d71a0017a48217efc"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------156770555C305A414E665298
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 5:02 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915090303.14367-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.2.0:

- Backward-incompatible: attr.define(), attr.frozen(),
  attr.mutable(), and attr.field() remain provisional.
- attr.define() et al now correct detect __eq__ and __ne__.
- attr.define() et al's hybrid behavior now also works correctly
  when arguments are passed.
- It's possible to define custom __setattr__ methods on slotted
  classes again.
- In 20.1.0 we introduced the inherited attribute on the
  attr.Attribute class to differentiate attributes that have been
  inherited and those that have been defined directly on the
  class.It has shown to be problematic to involve that attribute
  when comparing instances of attr.Attribute though, because when
  sub-classing, attributes from base classes are suddenly not
  equal to themselves in a super class.
  Therefore the inherited attribute will now be ignored when
  hashing and comparing instances of attr.Attribute.
- zope.interface is now a &quot;soft dependency&quot; when running the test
  suite; if zope.interface is not installed when running the test
  suite, the interface-related tests will be automatically skipped.
- The ergonomics of creating frozen classes using
  @define(frozen=True) and sub-classing frozen classes has been
  improved: you don't have to set on_setattr=None anymore. #687

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200915090303.14367-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-attrs_20.1.0.bb =&gt; python3-attrs_20.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-attrs_20.1.0.bb =&gt; python3-attrs_20.2.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
rename to meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
index 371f1f042..c2a5b9051 100644
--- a/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.attrs.org/">&quot;http://www.attrs.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff">&quot;file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff&quot;</a>
 
-SRC_URI[sha256sum] = &quot;0ef97238856430dcf9228e07f316aefc17e8939fc8507e18c6501b761ef1a42a&quot;
-SRC_URI[md5sum] = &quot;ab7533fc91c5db3d5b65e66be907444e&quot;
+SRC_URI[sha256sum] = &quot;26b54ddbbb9ee1d34d5d3668dd37d6cf74990ab23c828c2888dccdceee395594&quot;
+SRC_URI[md5sum] = &quot;7be95e1b35e9385d71a0017a48217efc&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------156770555C305A414E665298--
