Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.46])
 by mx.groups.io with SMTP id smtpd.web11.26337.1600976794503171084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JqNdc5C5;
 spf=pass (domain: windriver.com, ip: 40.107.220.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcpWWoR2we7y8HutqsVbaQbzW66YsbMxkh1zJ8fw83B0Xz4FF7KD605myd1K7XT7W1+hj+tHMknFZv/KuBimfiFLeghzLgX4ygMcBezbSE9p0iyk6CGHn9gLoufjJe7UWMB0DkXb1ewMvAQ31x4qhpH0j1Yl3ErU/cibLWw0Z0vpdzMzxFp0Y+HWASSkuXaicozVo3Gc+JDv+sbuVr//h49uC5uVQQcOZ9+KQY7ezXVgsSmIiQavxC166vGw3Cm5Tp81xhlaFJiJnaq3ud4+k4XDRLmJarnR+qKqWkD77az/rfWmOyBrjplCGFY7Zg2AfVA9Azxd/PB9IAEf0UouFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufo3vPS0jqMcK41YEhOxPELH7S8EePJPLwIhPLZjf/s=;
 b=eB93SRYul+uJiBu4WG57Siv63/T6OURoabyflNfJxLALum9kLWCkp+RdS3sAmuuZg7IsEkRHFfTl0NNGcvRYquZH86mM4Ac+n2LZ10m06N+MLkgNFnUbJMTxC/yNJL2pyBZPc5b2Uk0Dh4VT/f4IGY4gwFHUACBeoYeApnMBLGuBY1Pina39jfpAe+4e/3OC5VXtN0o2rWCcj0ZSj+69KhNNBDk+hVNQuwHSiSZyLWzQp6UQn9TPwczkBGiEZ101TCNJcQpbX7vAGRzAQyuIHUxYEzBVp2neFrsekFi4FvldJkg//i9EiKbw20K1+icAbrVNfNrj0QmM9oGChJPbcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufo3vPS0jqMcK41YEhOxPELH7S8EePJPLwIhPLZjf/s=;
 b=JqNdc5C50Sj3oY7jRkp3IuKGG1s4/vOCAAyU5hNDP5Issqx+tX6AhGKODHunClZ59VcXTk6aX/Aa/q9NmqMEc9G9zZRzW+nNGnHxnoK+oSEU+sIfJbWYl3v2wRl8MFvYuKTIEh8wKhUEIxpXPzageQHANKKa//Thp5MX2hRvYGg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Thu, 24 Sep
 2020 19:46:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 19:46:33 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-xlsxwriter: Upgrade 1.3.4 -> 1.3.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
 <20200923075830.30859-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <25a7bf97-dedb-231e-497d-365c599d872f@windriver.com>
Date: Thu, 24 Sep 2020 15:46:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923075830.30859-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 19:46:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03222dcc-2098-47a9-2e0b-08d860c28a35
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB355922A4ED8D389CD308DD749F390@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KPCCBuTdcfsCMRlpi6254XkVxBM54R6ET4m1KahIxIctPwvNXkR2pFpSXlOyCyxcALA8o+puoZeK2cNQIZhJoSPeLaUnxJm6xUWAFgU1jTDwZpLtoit7e1NhS+pfILL4ayl6EtBcv3J9zJxRbVhl2S93LyuqxtNys5ZaZyVCY0463nbt/NEOKrUaLcRBUiGLnN81K4FtCRa/4MYGBiaULvnsHhwm3W1pRWXrFTgq+urUi+lpv3nwWN/+vht+qLkAAlBbIRy17NApYEWjnJJgL5kF0mf9rR9MtiMJFRf64cPXOWzpPyqn6CHBiB82RrylknygvifacpdI8xjMT89Ixdt7/3jbWWz1MabHWmF5TACYojfRtFp+OXt3lyup/ekxpJAAMZtTQLQgykbIUvdQSfeV1PEUGHB9+cdFUBiWmdjk/Iu0IxSkjHSIwAlDa1bjCJbX83dKW0Pm6pTMp0h5SbMtO6Lndvu3BkpnOqVuce1tD1Av8pnOlic2vDux7kXo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(66476007)(26005)(83380400001)(966005)(52116002)(53546011)(36756003)(8676002)(166002)(33964004)(44832011)(86362001)(316002)(2906002)(66556008)(8936002)(31696002)(31686004)(66946007)(956004)(6486002)(5660300002)(186003)(478600001)(16576012)(2616005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OfsUHk3u4Zxj9N/Ej6K6GV33lg8xO5YZi5ZFPavmPLVqJi/sH0CNBTkzwCMz1pdNoqCuxVcneqbNwUFyi9++YIM7x6WgwmPajJXwMgKNHYZ6YfLjjlecKSJhC0NA4BVCbyx7RNOSmXmey8rov8P6KnXEHAEoT8FTlnXUpBLC3HuosPdOO/NCgDFk6CNsGnwPifaXRoOKCVOXtXYYjZ46W1F+RtX3Tc2CigTyl8JakBqLLX7esQIoXJBhwd7y8tJIAqPS4eU/tLHjJX2+y1XlnD0a69EtW12Z6WHigfjALvQ2EQFXMomrR8GW6STAPwxD1QjUSP9b1sWddyHNk7I0Ot0nal/A21jookNJWQkv9eiTsuHMJpx5dp3caOYQXUe30VA4vr1LWoYAKjY9hG6zfSrhHivq/Sw7v/oTcs1WeicN3UxIFG2n9QT9sKIrjgpLHUqQe7eKv8B/rRz5mf6gKA535gToEgf19QtAcrCfNMIpNh741OPMINTwIeL8lWtIPlO7Yw/2rI8IRZMsGJMK18HmFNZpw14meNdGFHUrOFDWMGExLtv3zAnaIPMpUl/u/1Jz3EiWExZkldt5hOVJoW2u9yC1QuLqxue3R3Mz7xoSCUHYZdBnJXhTVV5SYmLJY1XunDUH5m06HGLV0Kh38w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03222dcc-2098-47a9-2e0b-08d860c28a35
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 19:46:33.2917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vu5tq8tMZXmK1t0L/mpPHMS/JpU8Z/AeTbKbhCpKl/qEumMhKa0Iip3uYuXL46PrKZnyZgApkLhbK5+q9olqlgOJSfsOhdQme0Cqw13NkZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: multipart/alternative;
 boundary="------------73BDAE29BD5FD0DC92B9F3C0"
Content-Language: en-US

--------------73BDAE29BD5FD0DC92B9F3C0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/23/20 3:58 AM, Leon Anavi wrote:
> Upgrade to release 1.3.5:
>
> - Fixed issue where relative url links in images didn't work.
> - Added ``use_zip64`` as a constructor option.
> - Added check, and warning, for worksheet tables with no data row.
>    Either with or without a header row.
> - Add a warning when the string length in
>    :func:`write_rich_string()` exceeds Excel's limit.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-xlsxwriter_1.3.4.bb => python3-xlsxwriter_1.3.5.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.4.bb => python3-xlsxwriter_1.3.5.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
> rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
> index 61a9c69b51..b4b0e2eb2e 100644
> --- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
> @@ -8,7 +8,7 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "XlsxWriter"
>   
> -SRC_URI[md5sum] = "7ea11261cbd5c763d106eea64471cf2f"
> -SRC_URI[sha256sum] = "d804881beb944c4fd73deed0ef2666b84437f30d72bdc1b3a6f0230458facbfd"
> +SRC_URI[md5sum] = "0b65976905bf3841bc6cae3f8c47295b"
> +SRC_URI[sha256sum] = "de54547f3aa1a611453e32a8ae46380edb5556e823c6803f8673b4b770e50b3b"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------73BDAE29BD5FD0DC92B9F3C0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/23/20 3:58 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200923075830.30859-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.5:

- Fixed issue where relative url links in images didn't work.
- Added ``use_zip64`` as a constructor option.
- Added check, and warning, for worksheet tables with no data row.
  Either with or without a header row.
- Add a warning when the string length in
  :func:`write_rich_string()` exceeds Excel's limit.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200923075830.30859-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-xlsxwriter_1.3.4.bb =&gt; python3-xlsxwriter_1.3.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.4.bb =&gt; python3-xlsxwriter_1.3.5.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
index 61a9c69b51..b4b0e2eb2e 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;XlsxWriter&quot;
 
-SRC_URI[md5sum] = &quot;7ea11261cbd5c763d106eea64471cf2f&quot;
-SRC_URI[sha256sum] = &quot;d804881beb944c4fd73deed0ef2666b84437f30d72bdc1b3a6f0230458facbfd&quot;
+SRC_URI[md5sum] = &quot;0b65976905bf3841bc6cae3f8c47295b&quot;
+SRC_URI[sha256sum] = &quot;de54547f3aa1a611453e32a8ae46380edb5556e823c6803f8673b4b770e50b3b&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------73BDAE29BD5FD0DC92B9F3C0--
