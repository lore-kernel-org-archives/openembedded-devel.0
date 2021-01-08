Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.40])
 by mx.groups.io with SMTP id smtpd.web08.1967.1610121889909451967
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fBOe2T/Y;
 spf=pass (domain: windriver.com, ip: 40.107.243.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WH1zti4nagPgsWR9JprnTp0/n3i7D+++n8EprPA9Hh2tAYnGamtaLzP/UaVyXOdmZ65AjQ3KtqehlvezyIjo8xZkjgRo1rfvmR+ikJmVmU0XOgJmSkTx46hEvHDrxPtlF6zaYRgIHkD5T1CVnIHoi2HEnFwFO9obQHDEiVlq3fd39NpsJu8dfOq0uBUckXKVbTpqPjMvIcWHl6bLD+XEq7UwHjUMGm4CdgjI4SIV7I+bJ24G7YMBp/ukIfCtlMzQGb9x2LtkvWsuH5W0Sg4ORIHK6i37agWb8QC8QANd23SSLTrTyPHKyoUxsViMTLNTmWVuTATA8XK+Qp/FRkDKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8S6jMe2cE2Gg7hLTQv2VVfI4kmu5s5XNa+J2mZDQtM=;
 b=WuYbYP/8l5yTr+hSp+7nSFpiHha6VP/ScmncWQ42uOFOlnxr97fKR0tdPtVFsLYPhtfgNnnha6KNfOZSAodcTk1B7SFfWkKXAm8Z1NF690NXWWNlyXHdECuqPfGNfA0ijGtaZ+syIvZLPrsOQvDdFzJipJkqaiAoQQ1yTHcZt0f4ccv6jPCmsEgp3RknTRqyen85Iz4SqzCQHXjf7ZnZkRLi/THfN41Lop7Ex9S+NF27AsYk8HFj37t71ayLcBNl3enfBvAdTXhOfhJAEiU3N0hygMlJ6B5Lau3ar+onoNnOUlXvIDSpit//gVh2996GdVGI8f8Msj6xn+TaJqQPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8S6jMe2cE2Gg7hLTQv2VVfI4kmu5s5XNa+J2mZDQtM=;
 b=fBOe2T/YA8H78N3plGXSGlzm/Pnszh0cTEbPJr5upNAXDME06sRxCRpJ4JL7Wop+9YpBRp9nWlcdzdvZUKNJOdWkQpSu9tp/C1GPX+r2xlRfWyRB77TzVKsFf2izc59/1+B2NrR4CC+zmLC3CFQi33wWKo8LbVmf+ylAu5bfa3k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:04:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:04:48 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-croniter: Upgrade 0.3.36 -> 0.3.37
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
 <20210105151638.15700-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fbb63028-9528-5b40-ffd4-22ef7bdae3ff@windriver.com>
Date: Fri, 8 Jan 2021 11:04:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210105151638.15700-9-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0011.prod.exchangelabs.com
 (2603:10b6:207:18::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0011.prod.exchangelabs.com (2603:10b6:207:18::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:04:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a4f77b0-c6b1-4b83-024b-08d8b3ef200d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896BDA5EFCD28D7BFE650419FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qb/TKyayvtUE4DfDQUD5nMaVr9UvRHU1zs+4CKoWN01jG59mvkTvsZUJbiU21Ydiw/ZPtMEkiQcamwJyjbeAY1edhIzalOrKqg2CBvvrHqIGOJgHntcGdpkjx1bVD3m/ke0TOcvC8qCOQ5c4rbX89nGTm2YupJJ4yjsiXz5DxkM/nfiWsBXkEmnR4lfgwNyRW/Ez5itYY6fFZiudn5f4MbxR6wmZernxIuJa5ftWzH0eL++A3KiwgNmz/ciVKzptA/Lw+53hZ0ytr6nks4WPa7a46sAzPw2Bsb+DeUspktbWzUU3NsbGMJmvFVeNt54kUIJLHzgWEfoVW8AnFkI/CPaS/tu8Hx3yl8pscXdkLzikKTNT9d8jioUuUddGKNmXe7GdsDPuUFQEI6Ykf8H+6mNTmNYLcvTvmQS1xojUehR+zRN4IapOzGWt73Vv6mx/YSF5cKAP5OuNBIYrvjKx8EF0r5TwO3XDaDgKlFRVct1ksS9+E/5KNYOf3ynlBk1R5KCdBEj4CKTo97HVzfDjUQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(6666004)(166002)(66476007)(44832011)(66946007)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?alJTTGh6eEFQSU5pbXFrWUJSWXJSeXlMNUZ3d1JRZUQ4MlVKK2h6RHJMMTgv?=
 =?utf-8?B?SW93bTkycHlncUZyQnRaT0pjNkdleStKdCtJOWhwME5UM3RWNmQ2OXlYdmds?=
 =?utf-8?B?OWVveWEvRUhPb1VyNGsxcFd5aTRYZlU3aXlPMmt2OUl2TW45cEVtbitQQ3FN?=
 =?utf-8?B?R0VqVlNsUDI1SHBtYjFxZ0c4QTZnS2RXWmtUMnhkL2tPbWx6aEszYStaakE3?=
 =?utf-8?B?M3RsNTh2R2M2aTdmQkNFZmI5RXlNNTNEMXJweEZ3UmdTOUY3KzVERTdjdzND?=
 =?utf-8?B?NjlpMjlVWE5qd2MrN0RHdlNDUW54RXRxK0Y3c0QwbjVTQVM2T2lPbEJWZjRP?=
 =?utf-8?B?aFFEcGFXQWpVdWtCaWpUVG5DL1FMYitmcE5vUUFrTzBKQWt2cFJrUUVsL3Az?=
 =?utf-8?B?OUd3VHFRNDhPakFRTkErSno1dXZnNVh0WUJXMzhKWlU5dUl3Tys0MG5BUDZX?=
 =?utf-8?B?NjRUNU9sdTd5Ym1USFc5enBQNXpGOWh0YWd6RW1HR1doT01ZbE9iWjZQOTBv?=
 =?utf-8?B?WHZnQ2ZhSVIyU0dwZFV2Q0o3emMxWEM0b3U4ZDF4dWVnelBuQVJsUFlReUlD?=
 =?utf-8?B?ejlpN0JIeXN0N05OdTJGcUdqRFc0RUJ4bHk0YnFidks3clBkOVBDbVgwcGJC?=
 =?utf-8?B?WjhWVHZHRGJJaDROVFN1SjBzV254SkdXMGJVM1JMVkNnbGFudzdxSHJlT04x?=
 =?utf-8?B?dy9tZEhPYkhoVVFsbXk3UWZSZ1orMkhyUWNSNDFjeHR2NWFDRnJDRDBYU01P?=
 =?utf-8?B?U29Xd1RISE5JZE9adkYxMStHMWpodVdQMzMzdmV5bnpRVTRDZ2xBTjhRSnlq?=
 =?utf-8?B?QjQxVnV4QzNKWTZpOWZEMGFOc1ovUUJGYUZaTzljN0ZtNGIrREFIazJyeEdU?=
 =?utf-8?B?aUxLbmtqaGNLTXVqb3JTUVJIbTRXTHZ1aVRTNWpCajVoMjV2bzBET296UENB?=
 =?utf-8?B?SHl6dVAzNWxkb2V3ZXl3d1VQcUJ0dmlZRVFvR0Z3cldrMXZOSThiRDVxNHhO?=
 =?utf-8?B?UVQ2ZGtLTi9ERHdueVNQUU9WUGVWcnVkcGY4cTlPZTNVVGJZMjlJUnRwZW5B?=
 =?utf-8?B?TUJ5dGZ6aUlXaXdlRDFweGlLQ1FIaTRZVlJMaTdCWTNhd3ExLzcrajJtOUhQ?=
 =?utf-8?B?cE1VeEFrY0JsQlJDcWJZSU9jRGRLeGMvWGxYbHV4cXQzdXphTE4rdDBsM3Ew?=
 =?utf-8?B?aElObm1mckUwdDY4enh3Yldvb2JObmVKUVc2Uk5mdmJLRmNuRnN3QmJhLzJN?=
 =?utf-8?B?cURQSG9PWE91RkYrZ0pzN2RoQ3k1eldZTnI2MlVoTEJoUVBjQnZFT2NCTDVU?=
 =?utf-8?Q?k3luMUBu6J42x3J8f97Agd8g7619RXeuKP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:04:48.7965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4f77b0-c6b1-4b83-024b-08d8b3ef200d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmwpqorT6PhNeerGwPgtS+BkfOnfXh4hfkia4JEX+3MxPxtNVFyIUIdDtdn7Y/kmvzwRNYqzNiPZoAyO7FTLYfvequngeapvX7cLEIBgNdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------0B3C3E833554F38380D55C3E"
Content-Language: en-US

--------------0B3C3E833554F38380D55C3E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-05 10:16 a.m., Leon Anavi wrote:
> - Added Python 3.8 and 3.9 support
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-croniter_0.3.36.bb => python3-croniter_0.3.37.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-croniter_0.3.36.bb => python3-croniter_0.3.37.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
> rename to meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
> index b2571491b6..28c4057cd8 100644
> --- a/meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
> +++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
>   
>   PYPI_PACKAGE = "croniter"
> -SRC_URI[md5sum] = "1be5dd43ca26a66b5f981e41c74fd346"
> -SRC_URI[sha256sum] = "9d3098e50f7edc7480470455d42f09c501fa1bb7e2fc113526ec6e90b068f32c"
> +
> +SRC_URI[sha256sum] = "12ced475dfc107bf7c6c1440af031f34be14cd97bbbfaf0f62221a9c11e86404"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------0B3C3E833554F38380D55C3E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-05 10:16 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210105151638.15700-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Added Python 3.8 and 3.9 support

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210105151638.15700-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-croniter_0.3.36.bb =&gt; python3-croniter_0.3.37.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_0.3.36.bb =&gt; python3-croniter_0.3.37.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
rename to meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
index b2571491b6..28c4057cd8 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2">&quot;file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2&quot;</a>
 
 PYPI_PACKAGE = &quot;croniter&quot;
-SRC_URI[md5sum] = &quot;1be5dd43ca26a66b5f981e41c74fd346&quot;
-SRC_URI[sha256sum] = &quot;9d3098e50f7edc7480470455d42f09c501fa1bb7e2fc113526ec6e90b068f32c&quot;
+
+SRC_URI[sha256sum] = &quot;12ced475dfc107bf7c6c1440af031f34be14cd97bbbfaf0f62221a9c11e86404&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0B3C3E833554F38380D55C3E--
