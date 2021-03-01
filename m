Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.75])
 by mx.groups.io with SMTP id smtpd.web11.1038.1614620935536562992
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nVM48fMh;
 spf=pass (domain: windriver.com, ip: 40.107.243.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9sEjiC7YyTYo7+CHqUPazrHceuyz+ApOGWW2FLG/a5k9V06+HULR0bR1s12EeEuH/MyD1toFw0TPWL8nlm3yxBtD2ehNztu8yUqKgd8IGXmYYrBm0jab39WX6w629WgQZ5T17Dh6pVWMkEdQoirTGibFOYaPJ0iwarEIsN2T4l++9XDSzon41TvZq8uy5/184r/9BpD89E6GfeP0NwLXDVP/LuV1gKHTiZSAHrQFg6zRXiW8eGVV/x71UGD1arwkgUJ5fC60tjArG0mSP50QJlCzlPDJJaxDkb6dXfiauDM0wfzhjbOpDx2WEkpNFHdwquJPaUeEQMU9fEQcpH4Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rp8kWkgnkmXI8LxO+HV1Ox4m17OFlJeFNuvyC7zMFU=;
 b=ZbbHIk4uMA6wwIMXrfOCRzfxEYgm8eV4mNDNc1PlCNfEYwBfXg2HQ7bMiR/DA3nkGazaUS9pPFC/U6PG8J9XoW/ASctG3X9/CKPkzAcarERF76CK1yEPMWJNKcBS6ZpfjR8FQK3YTH80KYXm9z9P72efIc3kCp5wyU4MITgzfQKRCSSiGE1J8FgGuW3rkGTmJ4wlK5XD3vcP/JD7aknnPYX+RIl0rB/7jN17p/DVgn8XpsOIWZoyMS6ve9XFtrpUsz5UyQb2n9OMwjWIw5WtqBFaf2F1X/WuH7MU72PjOjH8CTR+He1Bk2t/wvcnlQ+xrvhC0d3zonEspgdURbliLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rp8kWkgnkmXI8LxO+HV1Ox4m17OFlJeFNuvyC7zMFU=;
 b=nVM48fMhDDS0ckz6+xC//5baz+n3nOf1XmRjeHUdlAvz+8LBu6ysVAmGp3qnQp5ovXwCZUnqvD7YmUounGH3Vszhk2L6aCpCw5orkFzqgkAeETaB8gptC5Kz4Z2yUeXya3DXV+wmh7RlHcTXTMW6m3FWy96OyBGmc1KHMkn4InA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3670.namprd11.prod.outlook.com (2603:10b6:a03:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 1 Mar
 2021 17:48:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:48:54 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-cffi: Upgrade 1.14.4 -> 1.14.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210224112512.31406-1-leon.anavi@konsulko.com>
 <20210224112512.31406-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <df503502-bc63-cdda-2427-9302711f3565@windriver.com>
Date: Mon, 1 Mar 2021 12:48:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210224112512.31406-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR15CA0054.namprd15.prod.outlook.com
 (2603:10b6:208:237::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR15CA0054.namprd15.prod.outlook.com (2603:10b6:208:237::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 17:48:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32a25b83-be1a-4d13-dedb-08d8dcda47ba
X-MS-TrafficTypeDiagnostic: BYAPR11MB3670:
X-MS-Exchange-MinimumUrlDomainAge: openembedded.org#6614
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3670D3E167FD00056B7E4E4B9F9A9@BYAPR11MB3670.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oe90e++ukY6JKqWeNWnjF1Ttj7ZVeABGfM4GlSMZojV6g3XW8AYfP8JHwzhWZDCgrOgQf0LeM+gkqPUrKPkzBJ7hbOZ9MhKehnf035EWMDiTbD8QWRqB23hl4z6ob3l43N8ww+ZV5JRxd6v1L9TTUpaQPKoEoCoL4uOPX694FvrAJT1aqBP7AbFHedAFvpDKxh7G4BEFjfwgOK1ztzwdZnoHQU6CrWKafVdA9kfzmDPNc3qBbYu8aXfeanoCCkg5zbOqo1mefdfqfrSIG4tMLJBBaeafCwlg5S1GogMBpiRxYDMp7Ndf9X0pZ7tykqEcpGDbQs/7WWLph1mqsBuVaeyxRv2S5WGBZyw200dt/Na6O7HNNLZh2/dw9ZmJ3AcvKz0/AXb0h0noh1FfqhwkRji407yMEDhghgrMjD7/BFF2AWgO1CPi7/TDSH/ojrHLWAoiclcX4ZDmMqKSRI3eGYKKz8MMDFKx39a0ioF9jNs5MiR7iqxUTHNtZHP7/fTcNw349PgjM0WRhrMrmc+btpeer+65333EszElqhNxlg4nJLH9Eg3b4QtpowFkGzdQ7kmTGb2yoJEd6QlxwbHIJCZKIY2mnw0PCePFR9eZnTnsuGn3ZxbQ2GDV1oy5OW5DTglrH7hudBF94H8AZm7c+IZmvbKjX76gTdy+MOmwxWN7C5a3mNIwoORztSSWRquo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(366004)(966005)(2906002)(8936002)(16576012)(166002)(31696002)(478600001)(86362001)(8676002)(31686004)(44832011)(5660300002)(316002)(36756003)(26005)(66556008)(66946007)(66476007)(33964004)(2616005)(186003)(956004)(16526019)(83380400001)(6486002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RGtLenQvczU2d3ZheHlNZDZnYUNKeitMVTJxQkwvOEZNNHdUbzhycG5qRnQx?=
 =?utf-8?B?VXZxZkdQYVlOSWFESGQ3cjV2MjRjaTRhU1Yxa0NaZGxkYkFIcnFkQlM3b0ky?=
 =?utf-8?B?eStsbTdxQnF6ZUgyNmlNWVJ5TjJoMldKV0g2Q1JPalV2eGd4dE0wbnY1eURw?=
 =?utf-8?B?bVZJWnRQRWU1YzZSU1dWUkpQWDVoSzRhYnV6NmZHaTdFWkY1eWkwSktPdDBM?=
 =?utf-8?B?SDY3NjlsaUh0cm9kSFh1YUFGMFQwYlJxZUFmN29INUY4cEx1T0lUVTdXZGxy?=
 =?utf-8?B?b0w5bEFpSk1IbDYzd3FJcGRNcTFGMVBKNWNoTk01c1lVY2lxTS93Q256UWx4?=
 =?utf-8?B?Ylk0dU9teEJoYWlXTi9tYmZFVWxOdWVJNnk5ZE5rb2dYTTRxK01RcHJNVzVR?=
 =?utf-8?B?NC9rTm8yZ1lNUEtlOVB2YzVyRkZ0bGdwOU5FRDhvTnB5NElidzZzMmNQZmVY?=
 =?utf-8?B?cjFtUks0Mjg0WDFwcHZLWnEwRG8zdVcvNGsyVVpoaE15V0tNd0s4MUgyaGRq?=
 =?utf-8?B?aWhuc0xlSnoySUo3WVl5WlFPbndsRXRPZmlVK3F3emtzYWZmcnlkTVBpazk5?=
 =?utf-8?B?U21LY2kxdzJidXUrVkV3UDZ1SVoxTWVLRHZOc0pSeVhMbFZyUXBlVWhmalB3?=
 =?utf-8?B?YzM1L2M2TStYN2RqbVRzUmhtaXhMblBnb1BhRFFhdlVNbWF4bTV3TzQzcC9j?=
 =?utf-8?B?YkovNEpsQ1c3bmc3SzlKRGdlbTRmaTJJZFU3RHllcExERzBWczlwUk5wWUY0?=
 =?utf-8?B?RDZiMzFYdFRGRUIyczdGQkk0SXhRUDBjbDNjYXducGUvdHFaYjlieEw1aFgw?=
 =?utf-8?B?Ri8xUk9WZUpBMHR2YldaTmlMNDQwSjgzUzF0dXpEc3l0c0hELzZqYWVWcDlK?=
 =?utf-8?B?eDlpLzUrNGk4QngyYzFpUlhZTjNrc0RyNzhoKzQwNmRjR2tnaTg5Z0l5MEsw?=
 =?utf-8?B?K1BYclRjSlRSTTRJNzF0REx1QnVYN2V3UVZOc2NPak9GMzlqZnJmc3E5eWNu?=
 =?utf-8?B?Vi94bVhXVkd6WmdNYkROY3MxKzRmakN6OFlOT3F2LzZkY1o5aTVyUVF1QXhU?=
 =?utf-8?B?VUVFZDJUdUJsbE56U05lNTAwUjYxOENoQjc0MWV5dTlkdGJjZzFRbzV5OXd3?=
 =?utf-8?B?TUk4ZEh6b294b01vL1Eyc2x5MjZobE9wOXlpZCt3bktVSlI5THJheDdYV21N?=
 =?utf-8?B?Uk9nVDBubElmaDVFVVRtSjZUKzBWOGt6QWV5elJwcWNvUWNybmdwM0YrUVBw?=
 =?utf-8?B?bFVrcnNiNHlsUnFUeC9oSmpKanlkRUVlYmxjWjZDY3M1b1diWnJkNmZ5dmRL?=
 =?utf-8?B?N0ZnZklYZlFGdlJxZXdoWFRqb2ovaGRaREZMZDZFMFBKQ1BqbTlZSkhRREhV?=
 =?utf-8?B?WUtmZmM4Q1FxSDhmMzVoejFMQk9BUGdnOTVVeDMyVDFNN3hpMlVBeDMvWVdC?=
 =?utf-8?B?RlF2VnI5M1F5eC9FL1ArOW4vZ1NiTEtPT3NZTjBUcytORXNublpXWG1EKzE4?=
 =?utf-8?B?MXE0Skx0L3RNWkN4M3F3ZnhxSWFuTGI4RWRuU0d5aG9tMG03ZHdzRGphQ25I?=
 =?utf-8?B?aWN0NEtPOHI4aFdoQzczVVJMREZHVHdRNTQ2MzMwQngzbXN0L1RlYXRFbHZK?=
 =?utf-8?B?SFp1ekVqaWZJR0JoSGxMK1hmSFN5V1JkbGduUDdReHhpelJvanpOWXpNN2sy?=
 =?utf-8?B?WjZWMENnbmNnekp0Z2IzcExObllmR2xzRDF2cEVseGk4dUkrNDQzNTRyU1RH?=
 =?utf-8?Q?TFz7yYuZfRNAUVTpuiTiq5zLqyeguA6+Ym/Q1wv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a25b83-be1a-4d13-dedb-08d8dcda47ba
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:48:54.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YYUMC74MYnFvC7PA9M68sOYOEaqIPX7oERe6Ymfja7n4ctqhDXEGZeJ0oshCjeKd8zeftnNpuxUSs8f5f/PzLvhsbydDfm3k+iBlvlezxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3670
Content-Type: multipart/alternative;
 boundary="------------152A62AD5804CFEEA1783C86"
Content-Language: en-US

--------------152A62AD5804CFEEA1783C86
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-24 6:25 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.14.5:
>
> - Source fix for old gcc version
> - This and future releases should include wheels on more platforms
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cffi_1.14.4.bb => python3-cffi_1.14.5.bb}   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-cffi_1.14.4.bb => python3-cffi_1.14.5.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
> rename to meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb
> index 45962c6ce8..16928f0dbc 100644
> --- a/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
>   DEPENDS += "libffi ${PYTHON_PN}-pycparser"
>
> -SRC_URI[sha256sum] = "1a465cbe98a7fd391d47dce4b8f7e5b921e6cd805ef421d04f5f66ba8f06086c"
> +SRC_URI[sha256sum] = "fd78e5fee591709f32ef6edb9a015b4aa1a5022598e36227500c8f4e02328d9c"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------152A62AD5804CFEEA1783C86
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-24 6:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210224112512.31406-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.14.5:

- Source fix for old gcc version
- This and future releases should include wheels on more platforms

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210224112512.31406-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cffi_1.14.4.bb =&gt; python3-cffi_1.14.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.4.bb =&gt; python3-cffi_1.14.5.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb
index 45962c6ce8..16928f0dbc 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb
@@ -4,7 +4,7 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf">&quot;file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf&quot;</a>
 DEPENDS += &quot;libffi ${PYTHON_PN}-pycparser&quot;

-SRC_URI[sha256sum] = &quot;1a465cbe98a7fd391d47dce4b8f7e5b921e6cd805ef421d04f5f66ba8f06086c&quot;
+SRC_URI[sha256sum] = &quot;fd78e5fee591709f32ef6edb9a015b4aa1a5022598e36227500c8f4e02328d9c&quot;

 inherit pypi setuptools3

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------152A62AD5804CFEEA1783C86--
