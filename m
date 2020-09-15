Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.44])
 by mx.groups.io with SMTP id smtpd.web12.14854.1600180069153031641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cdolHvQv;
 spf=pass (domain: windriver.com, ip: 40.107.94.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJtjPxLXfJ/VO7tGxm+34z6etNBD24v2oHozU7JkZ78czkOg+pegNtl+fdGoQ4RRi/H77cOAISkgTAwvo5e2SYuZNpel3WWIflZLHI1rlx4qfpAo4zaX4Ngyrsu5W4Zb6vytdpHjt3EqiYgcmQXxtb+mjg8q97dkP299gUC8S8PIk3bUKbpBgggdyfabWMVqOIsfWcEllC7bkrsCPEN9TBy0I93T0uPG+nz1WtNWC7wtpGVI6ZmqgIdv2221yOECl9XvgGimiS9Ut6nxTri8zw5a/ptppD0genhR32KixWJUH6rWv6IbkClLX9z/z0cOErnssNdMvlhvz+DAvzqZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tvcncBY4LKRP/1I3mO1p/ifc5BjIDIsAos1y+3GO6E=;
 b=FLtkNOt4NPVy8/C5O9k60oWiLJRH+e5t1gezw86ZGrDligogDNRMggrQL9SNFjVBMTLUPef4cl9M61rVI7Q8HhLc4i5dOIo+fq/KmVLdeKXyDtiZmqXB8lVsrHJGC3GOSKRuayGWwQu5oalO8zljotUlGZaY/4fB7XLEAq0dVANh06+8+FAEOH1RK3tpv4JMYHztG5YmnrmiXpmnCdZlnWr98NiRZl2Drris4KnYjSjlPE9n8UiDZ+9MVTbbn6vMYSs1HSVkk6I0YTD07K6a/DZ2e+BhtVHmp8PAbZWgH6bxYqJL3W91FID5NBDfTOyvjp6aq6I0kIA8fAMa16sP4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tvcncBY4LKRP/1I3mO1p/ifc5BjIDIsAos1y+3GO6E=;
 b=cdolHvQvWaMZD/nMYMylNrjax3BaggJzGuUZbqtdP2lb48YwdfZab2RP1nYWiqVzPw/YJ/UBpVluQAzGH6+VCdeokXguOnCp1sUu4kBE+oWLumnQDROC+Txb5xXpnxW/TjmpwczptrhshxvZtWHYtpXMOlNKGx5cVw3paDKOTU4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3767.namprd11.prod.outlook.com (2603:10b6:a03:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 14:27:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:27:48 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-coverage: Upgrade 5.2.1 -> 5.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
 <20200914090419.19171-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c0ca6d99-d160-f62d-5f67-10cffee428be@windriver.com>
Date: Tue, 15 Sep 2020 10:27:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914090419.19171-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::43) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Tue, 15 Sep 2020 14:27:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcebd364-ee1b-4914-33f3-08d859838503
X-MS-TrafficTypeDiagnostic: BYAPR11MB3767:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3767034FEFDB2781F3F838759F200@BYAPR11MB3767.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	by60+S8Bb+rWz0BGKMeXz8pnIPUEu/Ara+bPz8fSQTBGXLMMmUyGYewiuCcAXzSlmiLXmMhQ4P7CPf+G0C0oEU5OrWCtoAXlTZWje4SNpI58QYxMuZDoiDcgPpg7/xOuByXLt2qIeIn7BzIYKByVBWqeHM/XEldazKzEov4kpbNE049YcM/BYUq/gM8eavLPP49KFyUurN+fxM9SJKIR8SJp+7gtWDJAmOawjpbD4gPzjPUFAtoBnVBqzYH/vKPULKvG/wIYYvq9FlVygL3yKBPH95lWfiUkzQuW6i8z/iOtcdoKYbu1Rw4tctBhF29GTsWbsJ9FpWs5adU8S0cr4wtOF3W9thrfEQ5BxBRwDTbr/lFFTxme+9AESZ8qa+KQKUZJwj6WaUIx/0kct+4fppPgkebFjBRPw4vTan5n8F36tPFR4vuZDdkNrj2VxK5VIkY2ggIXHRHUIWs9eCmBeQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(2906002)(966005)(66556008)(66476007)(66946007)(478600001)(33964004)(53546011)(26005)(16526019)(186003)(52116002)(44832011)(5660300002)(2616005)(956004)(316002)(16576012)(36756003)(31686004)(83380400001)(166002)(8676002)(8936002)(6486002)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vHoDkmHlj9i2KbN8MDqAjXw3YRI6sgRyyU98sACzul4LgLrDGZkBtrutWaFw4ARin8LqaO9AAdwASDRFkokT1NWhMFr25ZRzX0w4mlvZwQWglDy27uhC+dB6VSR39wvH85AxznpVE5asB0ksoSYoAKV0ThJP/RWYRuvn25Frs8SkXVafPXtGz7o5luruDH4XnwyrzhxGgb9QG4JvzXAxuITzr1/3gDuFXG+w12nCiCz78vTIfC9kPbtCNkp5Jc1+J5prakjl+CFKKmwkMhKc+GOHy468fuId8p+bI2oPvenvwdibsoJKPugSvs9qEsgJpYPz1AQRVAoB/k0FWPN37a42/wce9BIlyKsWnDh8QcEELfJfA1RDqV5jNhG8C75i/4dthS56dsYsXiLgnKIZdkH3UZLTkKe5k4Ei2RvPxppGk8u2NeFKK9k2j+xM4rwCvVineGCtMgVM8XXQPizuATMzE753gJztOuBAiuS4aLO1F2B4CY0oJ/yunoGm2S9YWHnYiRmMWq3Rt/otnkq4BaiU/qqmgkwMGFF8IJpScmfXiGgpcPEWE7mwefaiC5HHsp1G1lf+tPz4KKT1Xv3svIRSSl5aGiflCJ5QnXaVgHmYnddpDuaIwsAo9cCekEZDScnPaOqEarqXPgY0/ALdsA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcebd364-ee1b-4914-33f3-08d859838503
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:27:48.1891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFs2urgdRvhXWVR+l5LxT3Db7Anpzq6bxK7qKtcVIMdFWSUI2RnvnjeB+g7Il7BndwHHCFRgM6JNsI0xm6LxUZ+EfIHHR1E+XGD0wqAiYCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3767
Content-Type: multipart/alternative;
 boundary="------------B3BB5465D65251CF4D7DAFD6"
Content-Language: en-US

--------------B3BB5465D65251CF4D7DAFD6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 5:04 AM, Leon Anavi wrote:
> Upgrade to release 5.3:
>
> - The source setting has always been interpreted as either a file
>    path or a module, depending on which existed. If both
>    interpretations were valid, it was assumed to be a file path.
>    The new source_pkgs setting can be used to name a package to
>    disambiguate this case.
> - If a plugin was disabled due to an exception, we used to still
>    try to record its information, causing an exception. This is now
>    fixed.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-coverage_5.2.1.bb => python3-coverage_5.3.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-coverage_5.2.1.bb => python3-coverage_5.3.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb b/meta-python/recipes-devtools/python/python3-coverage_5.3.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-coverage_5.3.bb
> index 48e352c1d..2354c5e73 100644
> --- a/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-coverage_5.3.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://coverage.readthedocs.io"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
>   
> -SRC_URI[md5sum] = "9e6165146b9bda60a779953c79e8ca54"
> -SRC_URI[sha256sum] = "a34cb28e0747ea15e82d13e14de606747e9e484fb28d63c999483f5d5188e89b"
> +SRC_URI[md5sum] = "c2faf2ccc498ce16fd48cc9201c520d7"
> +SRC_URI[sha256sum] = "280baa8ec489c4f542f8940f9c4c2181f0306a8ee1a54eceba071a449fb870a0"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------B3BB5465D65251CF4D7DAFD6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 5:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914090419.19171-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.3:

- The source setting has always been interpreted as either a file
  path or a module, depending on which existed. If both
  interpretations were valid, it was assumed to be a file path.
  The new source_pkgs setting can be used to name a package to
  disambiguate this case.
- If a plugin was disabled due to an exception, we used to still
  try to record its information, causing an exception. This is now
  fixed.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914090419.19171-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-coverage_5.2.1.bb =&gt; python3-coverage_5.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.2.1.bb =&gt; python3-coverage_5.3.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb b/meta-python/recipes-devtools/python/python3-coverage_5.3.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.3.bb
index 48e352c1d..2354c5e73 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://coverage.readthedocs.io">&quot;https://coverage.readthedocs.io&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93">&quot;file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93&quot;</a>
 
-SRC_URI[md5sum] = &quot;9e6165146b9bda60a779953c79e8ca54&quot;
-SRC_URI[sha256sum] = &quot;a34cb28e0747ea15e82d13e14de606747e9e484fb28d63c999483f5d5188e89b&quot;
+SRC_URI[md5sum] = &quot;c2faf2ccc498ce16fd48cc9201c520d7&quot;
+SRC_URI[sha256sum] = &quot;280baa8ec489c4f542f8940f9c4c2181f0306a8ee1a54eceba071a449fb870a0&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B3BB5465D65251CF4D7DAFD6--
