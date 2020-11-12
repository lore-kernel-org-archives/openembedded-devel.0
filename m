Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.79])
 by mx.groups.io with SMTP id smtpd.web09.10253.1605211355382025912
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 12:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=p3MDkl4s;
 spf=pass (domain: windriver.com, ip: 40.107.223.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADpOuRMiFECs8GAUd3yy1/9jYZ8RFhLf77E0UOYA4+xg8GXLwPQt8kdgHtzkaw81iORv2wCHayJJ4RvBNhX2VNvjDt4xaOLrrk0MvXZUrXKbXL3XPC0OXsCMaNsHRvwscJBgpHvq2BuYRPa9lv7NdWBre/NsZCrPGvy29MxI8+C8ysBSgjQBvDGh62iCJ+ygr0y2zF/RHxGC0tT7JXG3DGV7JbuQLQg5uOYURfhRxp+FfWK9HUgX/njBvLKOEpeIjcjYXAtrSz/a20wK5kkCGwPujECRETaGDoyq6z6rlInFRl9trYP57NQ62lwXnyf1zJcTHDt2D3Ly9nwJ9YckRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IP+12b88Qb8gj6SdoRIkqeu6/dzAYHSzme8xdjRA8uU=;
 b=FOcgTxd1v3+Zzm7jA1qieNE/bKmIXWeTOlkJSLQrEBrXOfF0aUs0gX7Jk8lQv9kDjU8GA7GFAhVOO7t879O7WbtVyZ84m4g8UxQ4nbryOLmgI4NjtWYpr2uc4bnTua1eZmNGFR7CaZiVk9hiBZhYSP/Afk+4nlctvtVFWg9umfMuH30L9n78G2nIVZrpRun+PtWDQrfrCidLTrHmht/ll17t6dJDRj1GZuEw9/DiGmq5ZLC0qr3aV1Brv9s38JcZf57k7XZakLpD24ZMOQrZ5Ud6MUmwOzHDb/eqhqn2pK3Abq6AdFiu6eUDjltaCWXjKAQr0FoeDucHmnGuSorK+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IP+12b88Qb8gj6SdoRIkqeu6/dzAYHSzme8xdjRA8uU=;
 b=p3MDkl4suwI/pgpx32Bl0GpDKUhaY63ZmqJq2cK6CVrsPaPZE0KnawzmZZOKCFGQinxSFZwwpZoEZa0uBoGSnu65PRJyo4vWtr72X8abgMpQK6BNAT6UNsTRAEWt8uq3RxfniJArc2IxFOO5e80R7HnZviJVo5/oUuLxoP0oles=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3112.namprd11.prod.outlook.com (2603:10b6:a03:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 20:02:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 20:02:34 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-icu: Update to 2.6
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201110191114.2682229-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <11e92206-f081-4b1b-e94e-85bcc668ddee@windriver.com>
Date: Thu, 12 Nov 2020 15:02:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201110191114.2682229-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 20:02:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26217518-2146-429e-0952-08d88745e4f9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3112:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3112FAC9702144D414B840C49FE70@BYAPR11MB3112.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PJTDFwQV/dtcQNMIr2Q+OiB9IGhAzBgqs4C/UEh0AX10pfaH6hAE9OwZEX79UUzCrxycqBEFtVVzbtCwoCjVoYSgrU/kyZ3drF7m+t4/d8wIe1CLcT3Vya9UZPQQ+MOujeZApbH50HRqRnSgQSqnNxqrUx6WSB4ov5CerJssb+y3RAUKntKbX7/Lp1X3KrZVIEcD43OiphMmvGPMU9mbKU94eQ6Z58T93uIeQz/Tr7/QFPf/jcP/cHulfcEx2kdBf8ctcMXin3AuZxDhSMkOioW8m21eTY/y9alVPFN0fOh6xn2o4uO8ItvGDgSYuwOK2tmdo277+i4RAXSGKuDfRbdxdvzkeUP+DU/JbvU4F0hKmvap/J6gACbho4pvnPejgXZ29enD3kEJrJwZGqupIDmbzDKtS5OgmlEVGuWi3T+injQg7OEo/nmd3zxCfS83eOT69g06INCHpTyfO32FCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39850400004)(966005)(2906002)(316002)(2616005)(186003)(31686004)(26005)(53546011)(15650500001)(166002)(16576012)(16526019)(956004)(36756003)(52116002)(66556008)(33964004)(86362001)(478600001)(31696002)(66946007)(8676002)(8936002)(6486002)(83380400001)(5660300002)(44832011)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xl3ihTbuCGIC4SCnT6hy7GmvxskjgfFHXDGIorfuyCzVF1gTntLBgOtrtrKj6y7W/Sl1NP3gNMugWZGbfDlDDsqVdSBUBI1Le64vGOP7Ib3qb3ARYKPiM5DGU1QKN/kQq5andTuNZz3k6JsEiIT2oBb6zRV7e3DSyHwgzmcuEzOQg1/v+KXwvgBPjxsSLveU2EksyTuDu3ClWN3Z4NZKMpjiLMhf6Ok3nZxuRs/Jmv/4XNklG0EdBLocjmJW5UOsbfsPAHxnK1TETxchSI+5I3sSDYYBoWpOsRGfmWmFnIBXKKVo5goE+t51fdT2mNVSDcqyvI9UC8XDhCN2BZ2W93FQoiDWLT+Ois1SUB/QiYyEQOhXp87rVGOiaHA7ZDjUcwIdpyTx9bYldgR5YpPo8QXKgNM3xTf8mvpE15eTy4KUIb6oO4nTLflZ0re11l5TG/1JobvdfrLkzkQt+BDjv/0RmgpwF32MdXryk7nT4DrZwDxjElg9TBAz+YFCvg/tA/PbfobaasGzPshYVq3Jt5bIQz9e1N0FB+6t9tlkWcJXCXYfLMNTJGSchurDS6wylMRbk9Q7/iO5GtRrnYwWUw/83eInPVMIL52/ZpUQB/yj620i8LiyD0WIeycuhH1UnoK8NQdyhURNmlhkBx+6LA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26217518-2146-429e-0952-08d88745e4f9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 20:02:33.9722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcZ2mbU9SfZfZN05CixufhlriCK2PPT5CZhYB5gjX37FAwy/mAwtG18klx3wAdw0S/9Q7ZMMUD+kwv2fYtLdt9kmmY3xSsKOjkbZxwRVwPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3112
Content-Type: multipart/alternative;
 boundary="------------BEBC778464D274A3807BDD13"
Content-Language: en-US

--------------BEBC778464D274A3807BDD13
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/20 2:11 PM, Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Among others, it supports latest ICU 68.x release
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-icu_2.5.bb => python3-icu_2.6.bb}           | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-icu_2.5.bb => python3-icu_2.6.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-icu_2.5.bb b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-icu_2.5.bb
> rename to meta-python/recipes-devtools/python/python3-icu_2.6.bb
> index 5e8c8a3a02..58f5e563bf 100644
> --- a/meta-python/recipes-devtools/python/python3-icu_2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59"
>   DEPENDS += "pkgconfig icu"
>
>   PYPI_PACKAGE = "PyICU"
> -SRC_URI[sha256sum] = "a120b68c53f769f37bfb70b7e84ca12c3f4ab1e4df43e87a02dff05ae472cdbc"
> +SRC_URI[sha256sum] = "a9a5bf6833360f8f69e9375b91c1a7dd6e0c9157a42aee5bb7d6891804d96371"
>
>   SRC_URI += "file://fix_host_include.patch"
>
> --
> 2.29.2
>
>
> 
>

--------------BEBC778464D274A3807BDD13
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/10/20 2:11 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201110191114.2682229-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Among others, it supports latest ICU 68.x release

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201110191114.2682229-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-icu_2.5.bb =&gt; python3-icu_2.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.5.bb =&gt; python3-icu_2.6.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.5.bb b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-icu_2.5.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.6.bb
index 5e8c8a3a02..58f5e563bf 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59">&quot;file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59&quot;</a>
 DEPENDS += &quot;pkgconfig icu&quot;

 PYPI_PACKAGE = &quot;PyICU&quot;
-SRC_URI[sha256sum] = &quot;a120b68c53f769f37bfb70b7e84ca12c3f4ab1e4df43e87a02dff05ae472cdbc&quot;
+SRC_URI[sha256sum] = &quot;a9a5bf6833360f8f69e9375b91c1a7dd6e0c9157a42aee5bb7d6891804d96371&quot;

 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://fix_host_include.patch">&quot;file://fix_host_include.patch&quot;</a>

--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------BEBC778464D274A3807BDD13--
