Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.46])
 by mx.groups.io with SMTP id smtpd.web10.9968.1593090064960712077
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jZKWgpEB;
 spf=pass (domain: windriver.com, ip: 40.107.223.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZ6NcLhAJYgS8XoNCr1XsSlUhkG4hu5/jQbIpY43eNhHc5A5+jz8rg3au18hnZgSaInGbUINSXNtkd5gs8R4gaeufQ46F2KDtV1qAiHyrh+aYA95q0tMKYmKu/0f1cEJLGgDXS6XMnlBswh1YSxQwzR2YKJdslkqmGoORjQfwhMtXgQmfRzEJlYFnycmBrMjTIaqoX2W717498sTAurxN2cC3gc/Ae0aqiBwqxMEbZG/Ofggtm2mRkvmGxTjVhnvN+xyJG5hCTiTb3g5NUaY4h0cCfRQIDm96X6bQcBkCU4lluGtsjc2w+S3q5hksSuT5grzABmyzAMHG2pmW1O1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpTpeFwSv4V0TJFGfpNUHytCVLtNGe5z6n8hMNBTP2o=;
 b=V9u1wW92qMyeVY3T3qYdM08P0lCGaSzir/O5LS+xLXujj/M7PHxaWQxQ7JshRjD03z/jOgFe+h7Iv0XCcN1nfffT7nZZFDwFu9W4ZtVevk/5z0rApLNvL6Ba/tKMlMDeIaKUFRWU+V/eUMiI+ukqflq4sTurfHq7p+GvLTROKa/WGf/wXTciqk1ID5f33+183ARtXUvwu4oCc6tPTDDx77+vR4qivlGu/rJQUi9hxOxxMjnB0n2P1+XgmRPRRCl/Hh54hPMpU3WMPR7PmGbiUa/ZmKN649XdClO55gzbem2icJ9DwokZ0bDeLC7yEnF1dYk0BrWZX030UHjkikFlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpTpeFwSv4V0TJFGfpNUHytCVLtNGe5z6n8hMNBTP2o=;
 b=jZKWgpEBxcSA2JIP8Qs7nO0vn14iJE6woJoXZOAMIaV9XKq9DO2LgkIeZ67zOb4QjXQqwJ2dxlRsdeXhhpIQxOjlOk6RpGGxw4PKFnEfP3GDj5ML/vZaQq4S3xVx9EMV6WqR9cW6uVw7xDwCR5G7Mhv9gNsstRBwPO9+qnZDH1Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4161.namprd11.prod.outlook.com (2603:10b6:405:81::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Thu, 25 Jun
 2020 13:01:03 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:01:03 +0000
Subject: Re: [oe] [meta-python][PATCH 03/11] python3-certifi: Upgrade 2019.11.28 -> 2020.6.20
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
 <20200623095136.24854-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <524acbb8-4ecd-c428-4fc4-5f4a36fa0826@windriver.com>
Date: Thu, 25 Jun 2020 09:01:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623095136.24854-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::41)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 13:01:03 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ad0b667-be73-4f8b-e761-08d81907d0ec
X-MS-TrafficTypeDiagnostic: BN6PR11MB4161:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4161BC1CC6E1837FCBEB57F49F920@BN6PR11MB4161.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GSJZumQ4GhgcZNr5MrDU6qdS7d1JE0xpdcxTntQwoUXvgOyckDeYtNV4E4pZ/vEYgBFdNeBgya4L5ReJXdAWM/pbsSHr6D2jSpb9hO0L9RxxQAJvSMnGD4rJFTTuX5WPGwg5bw0t3C8Ru7a3hqlt8jdzKSGSQ7LitJOLlpMG9K2t4yeEKQ1yWoGdLZWWY/8VHUhN7Nw6YTNNbe6cIjVquKd6TkeBgwtKteXF/erfSUdowe2tPkQSIz1lCY4aQEvdL5qmEmc2KS8TyO7Na0F+rLIrqdCynR3pEblx7NTjWblyRLzDijdbJ9gSul87xRMNALdcxXHngiikFwB9wRD49JsQYuJuTWBAJO/1a/IA44Hjvf5dy2ISU3SG1yxGJCxWWV3qo7AsXxMz6hlpUi2IhHtwT+5M7vIRjgW8/8Zj6E7L0V4GScoFF9fEew1o6tre3nrmAqxNa8odNPtHxdYUvP9Lf1iKOt4o7xTP3bOjcM8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(136003)(366004)(376002)(8676002)(53546011)(6486002)(66556008)(16526019)(86362001)(33964004)(316002)(66946007)(66476007)(52116002)(166002)(186003)(2906002)(26005)(8936002)(83380400001)(966005)(2616005)(956004)(31696002)(31686004)(44832011)(478600001)(16576012)(36756003)(5660300002)(43740500002)(148694004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5brGFF2jeESgXwmIZZ9Bm0k9xLVUSSafARe64aNQeyU4EAgz0wqZYtPVndJ/h8dLEK9W1zg8GbFgkVJaFc7wpfGzOUPLmiSjqEG/nnyXQvVm6ZO75mE+nUyHrok6GLy4/YKgBhJjr1DGEgrPdM4xMIGUKz0FRhJgO4NlSf4XvDcoaxksbk36bbpYngeeJVfiPi/24ZFE18l4/xhhiR+Ixx0RfWPv3oyoRuJcSxUTG6FD9rBMiRfJ4t6CGoSQBhip+vzAyNVb5QjP8eBKZmOpFkobp/ee62d6PRQIayypdg2XqAGer7Q9hiAwrZAsdhc2Yic8ObsIMQorM/JjM5MAamydpMesyi9sZnaORzd433piP/1JZ5YIf7ImlYJraM5bNVsGBwpwqHVbBVr6IyB/HVzjX3BuKRNaHq+GZs/RZ7GoIbi5CWzaaHunqtLrTd9NxV435G+JEGmZXk0pNNhKrb0uGB3D11uAy9kA1U50f01iwtbDC6ntuQsMDSbNsHLx
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad0b667-be73-4f8b-e761-08d81907d0ec
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:01:03.7090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtZNEGWIH+aTBZkLbcVue5xHdM6SSKjsbfYu/vLNsOu3BuW5JFY2bgAyDsq/NYItmjPa47RPYNieopgAH78z2yw3/LnOnb6GTZhNNgqufmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4161
Content-Type: multipart/alternative;
 boundary="------------C6FFCA6E154467A30CA096DE"
Content-Language: en-US

--------------C6FFCA6E154467A30CA096DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/20 5:51 AM, Leon Anavi wrote:
> Upgrade to release 2020.6.20:
>
> - Add python3.8 tag on setup.py
> - Add a "contents" function that returns the content of the
>    cert chain.
> - Fix docs URL
> - Use resources loader to handle non-filesystem situations
> - Fix where() so that it works with importlib.resources when
>    available
> - Clarify trust origin is Mozilla
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...on3-certifi_2019.11.28.bb => python3-certifi_2020.6.20.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-certifi_2019.11.28.bb => python3-certifi_2020.6.20.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb b/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb
> rename to meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
> index c9e945f27..817420141 100644
> --- a/meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb
> +++ b/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
> @@ -7,8 +7,8 @@ HOMEPAGE = " http://certifi.io/"
>   LICENSE = "ISC"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
>   
> -SRC_URI[md5sum] = "4d5229c4d9f0a4a79106f9e2c2cfd381"
> -SRC_URI[sha256sum] = "25b64c7da4cd7479594d035c08c2d809eb4aab3a26e5a990ea98cc450c320f1f"
> +SRC_URI[md5sum] = "89525ece725d674d91b0c43007d2a47e"
> +SRC_URI[sha256sum] = "5930595817496dd21bb8dc35dad090f1c2cd0adfaf21204bf6732ca5d8ee34d3"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------C6FFCA6E154467A30CA096DE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/20 5:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200623095136.24854-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2020.6.20:

- Add python3.8 tag on setup.py
- Add a &quot;contents&quot; function that returns the content of the
  cert chain.
- Fix docs URL
- Use resources loader to handle non-filesystem situations
- Fix where() so that it works with importlib.resources when
  available
- Clarify trust origin is Mozilla

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200623095136.24854-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...on3-certifi_2019.11.28.bb =&gt; python3-certifi_2020.6.20.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-certifi_2019.11.28.bb =&gt; python3-certifi_2020.6.20.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb b/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
index c9e945f27..817420141 100644
--- a/meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
@@ -7,8 &#43;7,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://certifi.io/">&quot; http://certifi.io/&quot;</a>
 LICENSE = &quot;ISC&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1">&quot;file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1&quot;</a>
 
-SRC_URI[md5sum] = &quot;4d5229c4d9f0a4a79106f9e2c2cfd381&quot;
-SRC_URI[sha256sum] = &quot;25b64c7da4cd7479594d035c08c2d809eb4aab3a26e5a990ea98cc450c320f1f&quot;
&#43;SRC_URI[md5sum] = &quot;89525ece725d674d91b0c43007d2a47e&quot;
&#43;SRC_URI[sha256sum] = &quot;5930595817496dd21bb8dc35dad090f1c2cd0adfaf21204bf6732ca5d8ee34d3&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C6FFCA6E154467A30CA096DE--
